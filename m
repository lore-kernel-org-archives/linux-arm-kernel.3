Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A3CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 17:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWxyFCsOQTn+NY2y8vUkY0HkkIwtHSXM/KHDuM64Y+o=; b=aFkadpJqLixfNL0u+o7AgR8CgZ
	qKRe0ri/GJTnLGpBquTE1Azv93w+dE53K7373H4i8d9/xrz66aRrNIPKlALgx9FU1r2wW63mU5+Jw
	Fa2eWI0FcgBtemo+0qpCxaf1GjhZ1pojvhcIhI7BT985WyDO5coplfvcHkWz25dhQQQg4WwboTM7c
	gUmA6Rw/3y28B28AvxS7Xn4HjWJo7CIxZtYqhEhKtRo+ZzaO1/NzwX5HTAHrk7DoZGQympkev05Rr
	n8a8GdajeA5sx1jdkGv3lekEQjiPKVuRyOwMtLSotYX9NPxZEBoOTwmn7+xbxe96QOJLNmbVlTz9Z
	tM84Xupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBGD0-00000000G9f-3VmW;
	Tue, 21 Oct 2025 17:31:42 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBGCx-00000000G8f-3jxv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 17:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1761067898;
	bh=hltXOIbWWgBTBlvQco48LT2+SFzQye7FM3u76fXl0Cs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SRu7Npy7HxfLnS2UzT8UOEQICfEq8fFhMonn8ojuq2x6uY1SqNw9T7RYvu279i72V
	 Lwqlx30oO7ATXpynvx7oKdcTPd/rdIT4BF8qzcVPuEN3j3El0u8HNPcUPk4ICNU/hU
	 CR9cE3C3hGT6s2WAE7X1IlaYEJsL7RX1Szu8SoEg=
Received: by gentwo.org (Postfix, from userid 1003)
	id F09DD4028E; Tue, 21 Oct 2025 10:31:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id EDE534015D;
	Tue, 21 Oct 2025 10:31:38 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:31:38 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, arnd@arndb.de, 
    catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
    akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
    ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org, 
    memxor@gmail.com, zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH v7 2/7] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
In-Reply-To: <20251017061606.455701-3-ankur.a.arora@oracle.com>
Message-ID: <c8be3663-42db-4c8e-cb5c-b7f28aaefc04@gentwo.org>
References: <20251017061606.455701-1-ankur.a.arora@oracle.com> <20251017061606.455701-3-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_103139_957296_B0E5DD84 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 16 Oct 2025, Ankur Arora wrote:

> +#define SMP_TIMEOUT_POLL_COUNT	1

A way to disable the spinning in the core code and thus arm64 wont spin
there anymore. Good.

Spinning is bad and a waste of cpu resources. If this is done then I
would like the arch code to implement the spinning and not the core so
that there is a motivation for the arch maintainer to
come up with a way to avoid the spinning at some point.

The patch is ok as is.

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>


