Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C7ECD6C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUNNxW9heQX6LH4yww5tuWeQCFLY1NlnnmzXYcuck2c=; b=08NEr/ErnzZ0gNuJ2498McTGb8
	kVdzQkdxakyMbPm/vDIghFktDzjAb1RYND8fm7VOJKukhZQnqdMZAXeCyM0cCwAYq3NcKhJlQddUk
	4JC03VGPl+wBw+Mb67/6SYVx/Zqbq8oxvi9y8NyHMuUYUU3OuTWFkCuZ4sOS5WUyMDJuKVaKAp4LZ
	DEH9FGleplxsfFdetQ9AtJDKYEUojwsUzlV1JozBRnichrXOqbvcvzvz3ft4/5Ok7KB9PT/WgbIHJ
	Aub/vnZH3J3Z5mpQn9NqYRKvs7n39bInh900/ahAAFOpNgeHw9VteCB+ks7GaSsXFVAAugHXrI1rl
	Q7VDx7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCeQ-00000000pAE-3jvD;
	Wed, 11 Feb 2026 16:01:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCeN-00000000p9m-0nQw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 16:01:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1CBF339;
	Wed, 11 Feb 2026 08:01:01 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A8943F632;
	Wed, 11 Feb 2026 08:01:03 -0800 (PST)
Date: Wed, 11 Feb 2026 16:01:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH v9 03/12] arm64/delay: move some constants out to a
 separate header
Message-ID: <aYynvZXsuZlcxyZX@arm.com>
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
 <20260209023153.2661784-4-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209023153.2661784-4-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_080112_857331_8BA83A99 
X-CRM114-Status: UNSURE (   8.93  )
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

On Sun, Feb 08, 2026 at 06:31:44PM -0800, Ankur Arora wrote:
> Moves some constants and functions related to xloops, cycles computation
> out to a new header. Also rename some macros in qcom/rpmh-rsc.c which
> were occupying the same namespace.
> 
> No functional change.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Reviewed-by: Christoph Lameter <cl@linux.com>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

