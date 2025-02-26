Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E220BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pet/LFXJukOjpKw3N/qfkQZuhd+dmy6ut6K9bQDsKNE=; b=T4KIMdX9vdZDBfaFM9UfpJXigX
	Keq3HR+NbSLidon5H+3/A81NXUDf95a/fFWUbErFNP5SFPCPCtS5eG6Dji7rwFtyUEu7HovW+F8hi
	iGnZjEkazcWuuwV7LHe4TINAdlSzg57HkviziqNcWJPamnPL1fEZ+o6jAZmvXXvEMJm8aEc0a4F5d
	Rnhuyo2Py6mt7I0orxhbYNSOi10lLz8BEUa6lc/jclYAa1T2vQ3V80ZW91WPY+GpqSHa0yJxm8PHq
	SkSKVFrBgC0Z/GfoFo5o/Vdz7lTbT6esKTujVbwlSPrm6YAZgKLTp7zoUflZrVe5TheXSAC478Gw7
	S/+I8mUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnC92-00000002jdq-13wB;
	Wed, 26 Feb 2025 07:47:52 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnC7T-00000002jOi-1rCb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:46:16 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7F2B12540213;
	Wed, 26 Feb 2025 02:46:13 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Wed, 26 Feb 2025 02:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740555973;
	 x=1740642373; bh=Pet/LFXJukOjpKw3N/qfkQZuhd+dmy6ut6K9bQDsKNE=; b=
	XmCAsjMLj0jyRI5c7icQpfnx5Q3lhSuEt95dhaiQeMN97I3PWatrgOGQ3hsAnOPj
	gtLGaAsyilMAW9/ikh+7dYdnQU1T6lVNDIc5HStuCSxMrvsK26vps2on7mOvp5Rs
	45cyKGzz9FFX3aHtmglBP/6H5P1CQ72fj8JzHgx6X0NR5kkUJ79c4g8VzOJ3PITO
	8TrEvQKbv9q/dNoY3eGCLscoPs8opSK157UWbypgb96zuTRzZ05Afs8mFHrbmEVC
	dwsrEVMAqHCSep0HQogGEaw6jQ4HY+AGs4y8gRkFHZPbrZt3cz/vuUb/Crrjlzn2
	0lUHlvYKdDhxOMW24yU8Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740555973; x=
	1740642373; bh=Pet/LFXJukOjpKw3N/qfkQZuhd+dmy6ut6K9bQDsKNE=; b=v
	ILheoZmgVcumoGluM0sqmzHhGkUdRyCCdgjI+bUU93DKkFfwYLwKuE745qKar4rY
	8PoJmWGYLDUWqsMWqBAKe0ps9pRqCUWJhedewFiExVlBVK1ToWKyMLP537uQ0+I4
	HM4BpRMedxXea2Nlcokd+VI6AnfgRdqE0vtvTHFeWdW7oPbfoVtwUnbDuvhvhqW7
	tW28QmtoLfHSHXaetuuF8xl5/JqPMvD42CYtk4fVcOuAMCW5jL6T5m0xqDnfTfCI
	lvKx+a3IEOjR/H8oP0ElUArBle3RTPRebw0+xFDPcqdnqeDsi8wT7SfFlS6mMgxa
	uxqpCEL/nS6EHMbLGbSuQ==
X-ME-Sender: <xms:xca-Z1h-av5BN7_pu2ZO5kwn7JqvTruAOL96TFa1bj2XpjATGLFcOQ>
    <xme:xca-Z6D38BG_bgVSaWuria_qOP6USGDa7kwTki-wmmMw5uPdPStYXDZI3G0nf64M2
    IbZ2W2-y4Rou_-v1iE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehquhhitggpsghjohhrrghnuggvsehquhhitg
    hinhgtrdgtohhmpdhrtghpthhtohepuggrnhhishhhrghnfigrrhesthhirdgtohhmpdhr
    tghpthhtohepmhdqmhgrlhhlrgguihesthhirdgtohhmpdhrtghpthhtohepshhrkhesth
    hirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:xca-Z1GH8yA_lYNQdHJboVueStmIiJ96ofVfN8o-qxod_GIkAag2Pg>
    <xmx:xca-Z6TP0hTt3FxBCDIAKQd7EDJQZ5qvJpC-ivoAXxMVkmun-l4qLw>
    <xmx:xca-ZyyFwyP7b4219fTGmYx1dQRNXP29maDiGLg1EOZGAdgQKNeKKA>
    <xmx:xca-Zw7YW1HxdaT1IddqhRn4dIYxZNxhWo-PYUZ-77xU3y0NpnkleQ>
    <xmx:xca-ZxnmRi2dtQvxN3cG5XNYUL9c4KTot-CgX9Ty3c_z1wXa2rPG7ZSJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F28662220072; Wed, 26 Feb 2025 02:46:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 08:45:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Malladi, Meghana" <m-malladi@ti.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Bjorn Andersson" <quic_bjorande@quicinc.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srk@ti.com, "MD Danish Anwar" <danishanwar@ti.com>
Message-Id: <839c2c04-0022-4a7a-8e28-f526814b0aa3@app.fastmail.com>
In-Reply-To: <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable HSR driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_234615_543300_D98819A4 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Feb 26, 2025, at 07:18, Malladi, Meghana wrote:
> Hi all,
>
> Apologies in case you are receiving this email for the second time.
> Any reason why this patch hasn't been merged yet. Other than re-basing 
> this to the tip, anything else which needs to be addressed to get this 
> merged?
>

Someone needs to send it to soc@linux.dev so it makes it into patchwork,
ideally it should come from a platform maintainer that needs it to
be enabled.

    Arnd

