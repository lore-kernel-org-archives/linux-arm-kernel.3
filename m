Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B4CE7A9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soPqXnxmlCvPRKXbyW72z7/eSR3RnvsIJJJeiu3WxNI=; b=DKG7SHTFue1ZXUVV25VGIwV3Id
	KTi+Wm9Vojs85sHLD5AHwoddw3ge2CKcZ6cAP9OYeCgbwufwyCKzmbMtifVl+5LcT4QsJtiW4Dziz
	NsmSiMFzpA0O2cL3ecAQ7cs9KEnaU6f4frqCRFoVL19ix7HPo3p1NpvX3Am+WH7QVh5yS57Y/6Yow
	5MHudIj9WC07excLIsgqh3GkDmxdsdi09sP/YhCrVfQsLZj2+Rja5kKLExXNdj5W3IFxBXs8aBerV
	iIT19u7t2NcdniLaMfj0nxkYHeXIlc0byoZ0nyUqo+fXYRNc5jFKJvKbQ1rlbugxMbGeqkt/Z6xsA
	/hlaecqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqFS-0000000BvnS-1VoO;
	Fri, 14 Nov 2025 09:37:42 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqFM-0000000BvlH-0PUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:37:37 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 33A0F1D00119;
	Fri, 14 Nov 2025 04:37:32 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 14 Nov 2025 04:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763113052;
	 x=1763199452; bh=soPqXnxmlCvPRKXbyW72z7/eSR3RnvsIJJJeiu3WxNI=; b=
	XZaYKkvnzXbl+K616mu3KywYGRPFf4lemWsF4R6HAj8GIJXRAMWsxEUjtvIy7o6X
	Qqw1H0Zyk1lMMOLouRKxzPgIodZveBiRz+eYgbLk+YQhxza/T7LWVi0XeIm1fL6y
	SEdwGvgN6oqNPdYo1mMPFjbzkywXx+AG9mKUPzV5o83TRpTLhFGKaVZGvEX/9a54
	upWXaz2zgI1z1oJau42wsiArYBpjSN+mLjmXsDkZQLOxRnJWEOc8kTyMxX9yuZIb
	cYKEwjaXGncAQdVsHB5KaKJLPEJI6zmG2mzHs6QysckO+OXssvWe80uGeXc040Ez
	fv1ivh0tuCDj8ngv62NJ5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763113052; x=
	1763199452; bh=soPqXnxmlCvPRKXbyW72z7/eSR3RnvsIJJJeiu3WxNI=; b=R
	hKSvZ/zjEOh3Gt5F3mIGsQK9FjZkibMCIJv13HZA0pGL9XRW6tve0qc3WWieqz9/
	98S5RCruS/b9/Gt8DYV15lhRhR+nwmmd9Fg+tqapS92KGfvN8ziP6PRkL06IqSMZ
	QGOku4MgtYAZVM4c4D8ve9OARJ/6Ya5cQBJcwQLSaiHw7ClE7DUhzbVrmS6Xz/Ar
	qCib+zlR2BOBht2AY5GvrVwdS5lK2AoSCB4j8RlgspLu2OklSV9TkSezkhWDNzns
	wSIhKizUmx7kCzGIBLMGyaJkFyGZ66gD2QfXPW5TbToXolnNLczWqRML6rJkSUGu
	Gkh7SNVph063qMcbvVH6Q==
X-ME-Sender: <xms:W_gWaXI0OiQ5UHBmOuB_fmLcBbLec-667X8vC3MJeXu2irRUyL5pUQ>
    <xme:W_gWaV-Ujci0l8P_upBBWVrrMs_tlM8eFo4FMvMjGaN629lBC0D8WwAzdCgzRR49c
    3cmwhR6rYbSSMKg2dGvqAtCoLXp3tyv2PGqsPXCSo0diT0MyU0qNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdelgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihu
    khhirdhpohhulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhl
    ihgtohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonh
    drtghomhdprhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthht
    ohephihuiigvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:W_gWaR-uy4htPZa4nGV_xz5fseSLAzF46ULPH1m4ZfAjg0Yzd_5KiQ>
    <xmx:W_gWaSZJZ7Emsz9uKR8Ys1YNxZm9rPGkK7o8Sst9beXjN6l-VO1I3w>
    <xmx:W_gWaS4sqDFW7YG3PICuSWFwNuMZItT-ZNYVMJBlE-kp1j6sS1yzFg>
    <xmx:W_gWafkWengLWJvoL__alMwekK3AdQ1wIzo8FFq5ARJ0MflOuEZl_Q>
    <xmx:XPgWaUWsuGJX-agTr_QIxB4AEOh8WSVjdKSSTC5vcPOviAKIIcUChm_4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0EE85700054; Fri, 14 Nov 2025 04:37:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALjut8WcExBk
Date: Fri, 14 Nov 2025 10:37:09 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>, "Marc Zyngier" <maz@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, "Yicong Yang" <yangyccccc@gmail.com>,
 prime.zeng@hisilicon.com, xuwei5@huawei.com
Message-Id: <113db0fb-d879-49d7-a5f2-7755558f29dd@app.fastmail.com>
In-Reply-To: <1ed610f5-3f0b-614d-5e7f-2c643238bec3@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
 <861pm4vn02.wl-maz@kernel.org>
 <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
 <c72411f9-a77e-4a72-a401-5110b919a2df@app.fastmail.com>
 <1ed610f5-3f0b-614d-5e7f-2c643238bec3@hisilicon.com>
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_013736_199234_E132B8CB 
X-CRM114-Status: GOOD (  15.44  )
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

On Fri, Nov 14, 2025, at 10:25, Zhou Wang wrote:
> On 2025/11/14 0:26, Arnd Bergmann wrote:
>> 
>> Are you using a particular device, or are you trying to enable
>> the support in general? If you have a specific device you are
>> working on, does it use the PASID data or not?
>
> Many thanks for your careful explanation! I got the pointer here.
>
> We have a real device in our SoC, which supports LS64B/ST64B/ST64BV.
> For ST64BV, Our device just receives 64B data atomically, not interpret
> it with PASID data.

Ok, I see. So I assume this is either a kind of dedicated work queue
where the IOMMU PASID is set up in advance for the user MMIO area,
or it is a device that does not do any DMA at all, correct?

In this case, would the device also work correctly with ST64BV0 if
the ACCDATA register is fixed to a value of zero and you can only
use the upper 480 bits? Would it also work if there is an
unpredictable value in ACCDATA that may match the PASID of another
device used by the same process?

         Arnd

