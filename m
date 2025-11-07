Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BAACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXLYZjdNIAc53cyvhoLCqBoT3xBsNGuA3UcfR+WehSA=; b=V8wmQRHTyxVjQKIKaaxPH6yjIp
	rhzfenu2t22CZOZKf08Iz+HKR+O9ZXvWucjAJ7GZ3eehK3DEngCsssi7eqIYQ3oswqu0xEh277wR2
	wJZKM7S5+Trn9xM0dlHaFy723D6OQZU5K7nuiY5GIV9lsuY+YpIPU5O/byoon78rxcNmE8aFi3veO
	aLu8G5VCq70KxC9uLDG8TETzW9iSS4h//DkB2xM6S6Dt8l2R6Ho5h/VtaT689h0v4A+b2aniwdY9m
	PNCqbuOKfshLpp4QOfg2LXQ9BNWvqLxHKWsFHkmu0Dki6xx/CDIoDKPGtkpBo95O4gGzEaG2TZPVH
	DGVz0CuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIhh-0000000GxJA-3z6R;
	Fri, 07 Nov 2025 09:24:21 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIhf-0000000GxIq-16aW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:24:20 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AD5B47A013D;
	Fri,  7 Nov 2025 04:24:17 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 07 Nov 2025 04:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762507457;
	 x=1762593857; bh=WXLYZjdNIAc53cyvhoLCqBoT3xBsNGuA3UcfR+WehSA=; b=
	o7GqnUda6vT7iuHPMYl8EPY6mkA+YFnte+d0RWsIcvgDBpucHJR7b+PZB0tmDP4q
	RNN0MWn6+IR+SZfO4T5XWwkSM77zue6T0pvfYJtxJskPLOK2d15afuGuHsf7rous
	FFAq9PSzFwMZnurhboZei4M0Zcv/bfUCqXtkubVPDXxR+yGNvhdlLNqvFnOkNZ0g
	3+GKR50TfkEGwVRrVZkiOeu4TJMySxnnrLCl8+g0vnI3Yp3xfv9FF6HixbCtJxl7
	ANAN1Y0sUWwz8ibd6yIFAjgEh3FxhtMgCdkdOWb5/Tj4b3D/eqRzJhQjGvx3nWBG
	AbAQeYfSB4bGVetK2mKxqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762507457; x=
	1762593857; bh=WXLYZjdNIAc53cyvhoLCqBoT3xBsNGuA3UcfR+WehSA=; b=P
	6aW9IrOqvsFoFFL6lRZdeN4+DIUNr2lRpDW1gck+LH8W6hCkREykM1narI5ZFvB3
	hKXhb6ETNvw9DvQ88btJOcm2R+z3ULk5k95GgjAu/8+v0e4stYYVNs9maRRMWn5k
	OL7FzHdsJUObCvDwGno4cz0cobb7rw9z7GgtjKTwge0bW+thWWMmt3Xm7SkTbSLr
	t+McB4wRs4a8pHwkxiDYJukxP/BWkMvDOZE1ZiJ2tZ21Fx2T2rWhny80Eyy7xL6m
	e27UkkahD6FGI1Q946ZfRmgg22cEtd1PdZwtcq0PNghTA9fBf3NlVzVAQIeDnShU
	Wet75uUjlwIi1Ljfy1kFQ==
X-ME-Sender: <xms:wboNaTzlwxBdy25KrbgmilwYo9DpIGlP6Nhy7MZ499CoTRQPSeiQ5Q>
    <xme:wboNaWFWO1oS95K5fLtecKum3gxOA2HhC715ncZopGvIwvCFHjnJKlJiVIrueb4FN
    -dtIx0RbxXF2fruZLWnx4vt1YIWfsyz8tRsyGOta-tGTh3_fqF5SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeelvdelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:wboNaQkK9BRr8iZsczj8x9KX8NboyLz8JDP29VSIW5fNZOxWm29FoQ>
    <xmx:wboNacin4kg4K_Hn1Rtcg3X3cHbcHzjS2rFQvGtxytYg2_0SeItpLw>
    <xmx:wboNaSgDjUEYGUsg6Jl7BEZ_VbAPo0IC5qnsZR-WH1NYJwia2Hm0ZQ>
    <xmx:wboNaWs7htAePw6k09arZlR3KG5kPP8-DAtQ4yLNj90U8c4dX0DHWw>
    <xmx:wboNaXnMXSdQRWJnW6gFNjexcT7L5e1CuEHktQQUv2fdDd_iDs2IqLoB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 22D0F700054; Fri,  7 Nov 2025 04:24:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5KJubIeX4vZ
Date: Fri, 07 Nov 2025 10:23:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 "Yicong Yang" <yangyccccc@gmail.com>, prime.zeng@hisilicon.com,
 xuwei5@huawei.com
Message-Id: <084ff83c-8bb7-45ea-9ae3-1d17be913c09@app.fastmail.com>
In-Reply-To: <20251107072127.448953-1-wangzhou1@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
Subject: Re: [PATCH v7 0/7] Add support for FEAT_{LS64, LS64_V} and related tests
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_012419_361197_289D7215 
X-CRM114-Status: GOOD (  12.72  )
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

On Fri, Nov 7, 2025, at 08:21, Zhou Wang wrote:
> Armv8.7 introduces single-copy atomic 64-byte loads and stores
> instructions and its variants named under FEAT_{LS64, LS64_V}.
> Add support for Armv8.7 FEAT_{LS64, LS64_V}:
> - Add identifying and enabling in the cpufeature list
> - Expose the support of these features to userspace through HWCAP3 and cpuinfo
> - Add related hwcap test
> - Handle the trap of unsupported memory (normal/uncacheable) access in a VM
>
> A real scenario for this feature is that the userspace driver can make use of
> this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
> directly into the hardware.
>
> Picked Marc's 2 patches form [1] for handling the LS64 trap in a VM on emulated
> MMIO and the introduce of KVM_EXIT_ARM_LDST64B.

This all looks good to me now, no further comments from my side,
and I hope we can get this into the next kernel.

Thanks a lot for taking care of this!

Acked-by: Arnd Bergmann <arnd@arndb.de>

