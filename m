Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRnrRsIDJEiLy6OrhPfi11tioUfF5lggVjHVpqrBJ10=; b=F6GS1mmWfIythWYLxj89kP5CoO
	E9/AoOplu3cY8Bz236DXnFB+B+kykjCw87sTKwN7u35KTXTPB+GT9Rp8VagkFerEVaVQefrvPW0Pg
	BjK2q2e2tnfgthzwhgIo80VyXnbCia5d6ARYTEBGSW1uSQKfwqxE8BBexz5Tv6eAHwXv4PHpXdJ80
	2K4CQMTTku5PO4/d7t5Yoi7th6j4qKqNujACganH39uwLT+kmCAU3BuZ2DbwIRfQxxXKGQTc6L6N4
	GoGCtvUPFCg7wOpe5iD/myonM8VMP13pfawBSZ1l9Lu+idrLEoVVb+bjNon1RvJeEpJYd3Ww693hT
	yV89N1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8m9-0000000Cn2w-1ZPp;
	Sun, 26 Oct 2025 21:59:45 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8m6-0000000Cn2W-2Ah8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 21:59:43 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 7132D1D0015C;
	Sun, 26 Oct 2025 17:59:41 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sun, 26 Oct 2025 17:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761515981;
	 x=1761602381; bh=XRnrRsIDJEiLy6OrhPfi11tioUfF5lggVjHVpqrBJ10=; b=
	hAo0u0bAB3Y+Banwr+1EwwkJpswakbLs5PIM1B7ByckvYb1W6TGPCa1DcFOIYE/i
	5AywfTAX44+ihJ7iVGMtEGOY5zs7yuefaL4cyCHqnWXqBjzKSUmUxFBuLoh8J0lf
	HiGLUs9uLsbBogViCvDTZ4eX+76L9hI0VBST5PCZPoVzAVqmf1W8tXY8unkA13FR
	em4WS//ABHydC0/q6mOPYpsDLxCgaj6WNnlel53YbwAQ6vtVFRAmokVOnc+YIoqJ
	XjOfrcnfWyyCzsp/3ddlb9Iw/wVnJhbmoJLHuUfyGO+8daBpgNY2+PxXuiGWrFmO
	hYtgKOkpxmp4iVquh5G/mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761515981; x=
	1761602381; bh=XRnrRsIDJEiLy6OrhPfi11tioUfF5lggVjHVpqrBJ10=; b=G
	ApIMUUidX08IJL/o2Jx58pCjGxFfTl37cTqbpzP8Qor/BKWLTcmw1MnrJM6QaB+E
	BwoeBYYj/sTrPeYAPwTOGMWmnW9a0kWNLwV0U3i42Ii0SKeiIT6lP7e2WWovHt8C
	QpPL7NzUzJ6X2I/30V5z0jxTIBs5qzOnNb5QbxosHWWFSoHmRUs/CrwyZ7N54gRI
	Xw20u/4Gf9ZtBtL+Hzr70kUjmoK4zIxxL/sR9M7tSlvXtTAbIkHjyLKiVO4JVnCh
	yxaAyJcfFGD3ThpXdeqbCyc5PYc8gUVRTwAxawD4zg5TbFh4GsuTxAdYIZPE2Uxx
	3kDAJEUFe+hOnQpj1Ei7Q==
X-ME-Sender: <xms:zJn-aMlLSCmnFHEjV0AjwE9GRahdlG3sXk67vSQfHDwzjw_sMmPmIA>
    <xme:zJn-aGquuY7EsddGNzDl5ODHg5tjec2p_vtzMMFYp3yWuHmgntrVEWskvR2FsbEsl
    XXGzPMF4zASKE3K3j9TBpYp62KW0PiD4ZRGORIQ_Qnn19GEDmDP9rE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinh
    drmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehjohgvhidrghhouhhlhies
    rghrmhdrtghomhdprhgtphhtthhopehsuhiiuhhkihdrphhouhhlohhsvgesrghrmhdrtg
    homhdprhgtphhtthhopeihrghnghihtggttggttgesghhmrghilhdrtghomhdprhgtphht
    thhopehprhhimhgvrdiivghngheshhhishhilhhitghonhdrtghomhdprhgtphhtthhope
    ifrghnghiihhhouhdusehhihhsihhlihgtohhnrdgtohhmpdhrtghpthhtohepgihufigv
    ihehsehhuhgrfigvihdrtghomhdprhgtphhtthhopeihuhiivghnghhhuhhisehhuhgrfi
    gvihdrtghomhdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zJn-aKbia00TsXVbN5P9yZkxKyDhMHUFZO8jUv8TE5aY6IdKUjMgbA>
    <xmx:zJn-aKHwQtdJVmSw6l2ISaF57UiCVKym_01Gc2BvuxkpxWNPxWoeIQ>
    <xmx:zJn-aI39CrhbNVsFwrSP1kcJj8REGaTHILIb6MPYKZq0pvW4-Yao7w>
    <xmx:zJn-aGyWPN7k_uNMxkpGl3meMMToznXjEYJhhKAuTUC7oRnekPrVwQ>
    <xmx:zZn-aD76qmSJmoVgmKAEXmVN0fT4RkIRptKSso1e7WCun2raXpUjFim9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 82BF4700054; Sun, 26 Oct 2025 17:59:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5O6iWOKQdXk
Date: Sun, 26 Oct 2025 22:59:20 +0100
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
Message-Id: <5b71830a-3e4c-4fd8-99b2-a3eb62b05ac4@app.fastmail.com>
In-Reply-To: <c29c67ce-8457-2545-ac1c-9ef00b92c7e4@hisilicon.com>
References: <20251024090819.4097819-1-wangzhou1@hisilicon.com>
 <2a880d79-9205-45d1-8f8d-9f028e0bbfb2@app.fastmail.com>
 <c29c67ce-8457-2545-ac1c-9ef00b92c7e4@hisilicon.com>
Subject: Re: [PATCH v6 0/7] Add support for FEAT_{LS64, LS64_V} and related tests
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_145942_627189_CDEF5437 
X-CRM114-Status: GOOD (  10.56  )
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

On Sat, Oct 25, 2025, at 10:42, Zhou Wang wrote:
> On 2025/10/25 0:22, Arnd Bergmann wrote:
>> On Fri, Oct 24, 2025, at 11:08, Zhou Wang wrote:
>>>
>>> [1] 
>>> https://lore.kernel.org/linux-arm-kernel/20240815125959.2097734-1-maz@kernel.org/
>> 
>> The patches all look reasonable to me, but I notice that you forgot
>> to add your signoff below Yicong's, so the Arm maintainers won't be
>> able to merge the series.>
>> If nobody else has any comments on this version, please resend in
>> a couple of days with your signoff added to each patch.
>
> I will add my signoff in next version. In fact, comparing with v5, 
> there is little
> change, so I did not add my signoff.

Ok. Note that the Signoff is also needed when you just forward
patches without any changes, see part c of the DCO at

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

       Arnd

