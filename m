Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5F8CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B9j9u5CYOzjuk3WgYBkiy0d65YUT+VZg4FbCq3cE+U=; b=Vk3+hzc7GVSKqTFR5tYNmUVQ9p
	2TQk5izPwCSqDLW/Z8ohAamZrY8zYBDQkQpnIQzgXCqgh1NPm6z8pLRZ8OHtyPBXtIq7IWBn4Iovh
	udFv/nk93nLA3qYSrGwpAa9BaZQJu02M3jAC5P5AJl3XYeiwiSnGXcppXGfrdhSW6iG2fDe8qyRVT
	uh6B94XXN/H/bnrxDwyOKiBjmfu7x6TJufXcYX40xgyzfLoZM81smO1VpoMcoPJfsC8KDfqEcT/8H
	hmSVoNmh6nI4uUjcaoWBt5bDhhhrL6iu6EWvRDlgjIJTQeHj614SOq91wKo8HkyFXT3NbvrQu71hy
	JbqyH9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKVW-00000009wik-0BfR;
	Fri, 24 Oct 2025 16:19:14 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKVT-00000009whv-1zbX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:19:12 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4DF217A01BC;
	Fri, 24 Oct 2025 12:19:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 24 Oct 2025 12:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761322749;
	 x=1761409149; bh=/B9j9u5CYOzjuk3WgYBkiy0d65YUT+VZg4FbCq3cE+U=; b=
	Daw8D9gAqV1dR2nEcCsSSatqEzcQKAbQ56KUfgCxojvcHFRRgpCLtAptogEsdNLc
	G5f95sSs1CWJs7FGwt9a8Luox4N51C2QeqkGuWX43FBNx5MVgKvZiIBoDFsArJNn
	Wm8aUU1hXzcqVOx/XOdWdnoB37BOrgVoBniV00ICtCci9Nwr7tY5VfrzQyTsAbHu
	Kx6hPLE7w6BUybg4LW+GVWXjd3i5jd8E60FDatbN6kj2kHV9M3tCFM1DQCUBSJKB
	Bz98OP8zQrolLzdfBaOrca5UzPQr1BTsZ2HRljAcY79SsAHgQB757p3UmeqTvT1U
	6iZ+7yQSbRDNNzNMLkuaPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761322749; x=
	1761409149; bh=/B9j9u5CYOzjuk3WgYBkiy0d65YUT+VZg4FbCq3cE+U=; b=e
	kTc0xt+yhX628LsWHGPyqqLITkkSDoZ4pbpWgy+1+h3ni6P+uCy8GNGrioZjAk3N
	Q9G5f5/4hArGUtB3wg5CYcfafsXQOA/bSsAz3nFBNLh/JFiLZk4avX9UJX8fIXxp
	XWYEXpkin8T4Jv5TrkukvVeanY0uFKAqP1HieuhKY45WBE5QswVk3zmPpFlwvcCv
	KEjxzPMcymcle2NF6TdzmRDm4prkF7BhxZmvsb8M2ff8YTg57ef30VgxN044ekO3
	ZLPAWaGsXUekr9SGrR5PCNetPK0Gs4JT0w5oYbueJ7EMA0PJpAiEXhTkr8vDuFNp
	Ul7dajft6HmjtIydrwMiQ==
X-ME-Sender: <xms:_Kb7aFuPJD4a19HluDNkTB-z1MSw7oOcSQeS3nMU5z6OGDnWQ8reFg>
    <xme:_Kb7aJSfzzvpFvW9IKG8ndYKhLWYzjAXG8z_5d4MLS8_yRcReqC6nrNK6FC8Xb76Y
    t7YLB4xovJvIRcMPDyBqEGa1TBevtf1_szfueT7L9yPqLPPffT-7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeelkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihu
    khhirdhpohhulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhl
    ihgtohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonh
    drtghomhdprhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthht
    ohephihuiigvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_Kb7aNgfg33TYPPQEyJ0-ZH69Y3tbEngvsHIH6ujODsiDk14uhQa_w>
    <xmx:_Kb7aOvqOvi05xG9lCJDIFmxiAtBtuYHnH8lAuyLDesJJQsRByKg6Q>
    <xmx:_Kb7aA8Lt3Rwu4079IcGrTslskFUByRavFV9pGmSKVRGMlXSFkyuvA>
    <xmx:_Kb7aMYiefd54-VoqF8RXDQq178ER7g49XrzMdG39UhdZraHxl6MEg>
    <xmx:_ab7aO9P9blqNtpe3J54rkmS_gS89AmVEZp5HFM5eHqCLo5Azqqi6jro>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5C20B700054; Fri, 24 Oct 2025 12:19:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmBleg0913uk
Date: Fri, 24 Oct 2025 18:18:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 yangyccccc@gmail.com, prime.zeng@hisilicon.com, xuwei5@huawei.com
Message-Id: <e40ce220-e857-4ecf-985b-40407f99fcb3@app.fastmail.com>
In-Reply-To: <20251024090819.4097819-8-wangzhou1@hisilicon.com>
References: <20251024090819.4097819-1-wangzhou1@hisilicon.com>
 <20251024090819.4097819-8-wangzhou1@hisilicon.com>
Subject: Re: [PATCH v6 7/7] kselftest/arm64: Add HWCAP test for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_091911_570642_F6141E86 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, Oct 24, 2025, at 11:08, Zhou Wang wrote:

> +static void ls64_sigill(void)
> +{
> +	struct sigaction ign, old;
> +	char src[64] __aligned(64) = { 1 };
> +
> +	/*
> +	 * LS64, LS64_V require target memory to be Device/Non-cacheable (if
> +	 * FEAT_LS64WB not supported) and the completer supports these
> +	 * instructions, otherwise we'll receive a SIGBUS. Since we are only
> +	 * testing the ABI here, so just ignore the SIGBUS and see if we can
> +	 * execute the instructions without receiving a SIGILL. Restore the
> +	 * handler of SIGBUS after this test.
> +	 */
> +	ign.sa_sigaction = ignore_signal;
> +	ign.sa_flags = SA_SIGINFO | SA_RESTART;
> +	sigemptyset(&ign.sa_mask);
> +	sigaction(SIGBUS, &ign, &old);
> +
> +	register void *xn asm ("x8") = src;
> +	register u64 xt_1 asm ("x0");
> +	register u64 __maybe_unused xt_2 asm ("x1");
> +	register u64 __maybe_unused xt_3 asm ("x2");
> +	register u64 __maybe_unused xt_4 asm ("x3");
> +	register u64 __maybe_unused xt_5 asm ("x4");
> +	register u64 __maybe_unused xt_6 asm ("x5");
> +	register u64 __maybe_unused xt_7 asm ("x6");
> +	register u64 __maybe_unused xt_8 asm ("x7");
> +
> +	/* LD64B x0, [x8] */
> +	asm volatile(".inst 0xf83fd100" : "=r" (xt_1) : "r" (xn));

Relying on the __maybe_unused register declaration seems a little
fragile, can you change this so that the inline asm specifies
all of the registers correctly as input/output arguments?

> +static void ls64_v_sigill(void)
> +{
> +	struct sigaction ign, old;
> +	char dst[64] __aligned(64);
> +
> +	/* See comment in ls64_sigill() */
> +	ign.sa_sigaction = ignore_signal;
> +	ign.sa_flags = SA_SIGINFO | SA_RESTART;
> +	sigemptyset(&ign.sa_mask);
> +	sigaction(SIGBUS, &ign, &old);
> +
> +	register void *xn asm ("x8") = dst;
> +	register u64 xt_1 asm ("x0") = 1;
> +	register u64 __maybe_unused xt_2 asm ("x1") = 2;
> +	register u64 __maybe_unused xt_3 asm ("x2") = 3;
> +	register u64 __maybe_unused xt_4 asm ("x3") = 4;
> +	register u64 __maybe_unused xt_5 asm ("x4") = 5;
> +	register u64 __maybe_unused xt_6 asm ("x5") = 6;
> +	register u64 __maybe_unused xt_7 asm ("x6") = 7;
> +	register u64 __maybe_unused xt_8 asm ("x7") = 8;
> +	register u64 st   asm ("x9");
> +
> +	/* ST64BV x9, x0, [x8] */
> +	asm volatile(".inst 0xf829b100" : "=r" (st) : "r" (xt_1), "r" (xn));
> +
> +	sigaction(SIGBUS, &old, NULL);

Is ST64BV expected to cause SIGBUS here, or should it return the
0xffffffffffffffff output to indicate an unsupported memory area?

     Arnd

