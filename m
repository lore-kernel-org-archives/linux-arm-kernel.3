Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7851FD35175
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKvoF/gYtOliH1/+tx0ZYx8nQn6dN09E18p9dXyi5Vw=; b=UG8jurhaA9HoM1WF4DMaMaqgWi
	D5Vr/EqSNM8qI41oGcuyJ7RwkTdUFqcSEPbd+QGGhKAgu+ahtS/oQXklSRSBq8c/LnzR+UJjNheAz
	0wBfXrKMyrHNTTlGnE8xp+g+FWNjzvn8aBYVuVqptDcjqBBombgCsMkHlrAfYiBlRy4Qykqdl1TC/
	WMJ5w2Y/dPooC4qWZ/n28/HtLj8S1Lmzy7LZn9F7qWbVNqhfKTy9XboaXxGMW4exBtaztICzlrY9F
	C4y4QW7d2ohyZ7V9+QPoquCLfBbauHaDoty/GYtW+4qiWD9KuUB4zaFzAmPVewjdGSe+GetuLCG2u
	B9rw4jCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7t3x-0000000EXuv-0apH;
	Wed, 01 Apr 2026 10:44:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7t3u-0000000EXub-3njF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:44:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7597E168F;
	Wed,  1 Apr 2026 03:44:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DCC73F915;
	Wed,  1 Apr 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775040277; bh=vpIPJp6qKXZs2RoYHC30XBTLU8o8yKndpTBkfQ9uCE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoRRizeYLglzeTWg3NXrJlo14WJTIqN/m55Cvxkvhiz92W/IyUVqSTBtiJWR4Deiu
	 LW6Wupi0xY2S7259D4eQOAbY76ZfplaFH/S99iESGJZ9FUEOAHwQKM1rGDvlWT8ES7
	 t7zSd3BH41VQIvZz0gd5AMdunBMrD1He+F4Dm3uI=
Date: Wed, 1 Apr 2026 11:44:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, rdunlap@infradead.org,
	david.laight.linux@gmail.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v10 04/12] arm64: support WFET in
 smp_cond_load_relaxed_timeout()
Message-ID: <acz3D1SkqDqyH0Dy@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
 <20260316013651.3225328-5-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316013651.3225328-5-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_034438_987178_0E59AE47 
X-CRM114-Status: UNSURE (   7.63  )
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

On Sun, Mar 15, 2026 at 06:36:43PM -0700, Ankur Arora wrote:
> To handle WFET use __cmpwait_timeout() similarly to __cmpwait(). These
> call out to the respective __cmpwait_case_timeout_##sz(),
> __cmpwait_case_##sz() functions.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

