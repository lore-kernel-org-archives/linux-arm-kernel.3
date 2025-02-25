Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54AFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/fhfATb4AiUXDJCmjcXCXRXVNJS4e8/TecLMtuchqQ=; b=I+jYBCWg8a/GgIs+6Vtpucjr1d
	3LxnbvVMH/quZzDqQPwt3eIDZrPHg+H2AJaEKDb+8QbP8Lpon+8IZtfQo/QGh9qPXyigoX+Ytul+c
	PtCmdYVdEbaP7AcM8q7MopVbCswYFKHxXh1ednJOydy4GegvkOdzY1UP+19rkJank2Y/rMDH9bwC/
	IsrLsgdrGegyJS+K213ZNJPB4K3VhOJvyjBPvo0Ppiy+sKr437xoXcirTTS8sZ+Ak3h2D4fxo9iZ0
	pYKLkw4wWlwnu+58fYdYooY3s0O8DBmoW5M4a5M2MFvMKDtUuy/FfdjudwLuVYBLoJf8UeRv2ZAU6
	7OWSTYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Nj-00000001WcL-0oFY;
	Tue, 25 Feb 2025 21:22:23 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1mK-00000001Q54-1Yao
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:43:46 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DFBD52540158;
	Tue, 25 Feb 2025 15:43:40 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Tue, 25 Feb 2025 15:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740516220; x=1740602620; bh=O/fhfATb4AiUXDJCmjcXCXRXVNJS4e8/
	TecLMtuchqQ=; b=sqzs/H1VLTKz+ic/Ses3INJph9n2k4WuTOxFo+MvtoLX169Y
	nSkD4oDB9axeueV5vNigULRe7V9Mu71G0wgnXLmN3vS16206nonzNfN9cLp7zOwB
	b46FBm0BJcFBpq68axremRPUQlqIdkYY0zz6q8e4FGsjUM4fLRxHYpLQ68BzmZgx
	xiFtLpYME1Oocxe6/yZ6fSV+mYVtdAaRREo/8nHe6UWV38WbyrzeK0FX1kDo7Uxk
	jLBd4wFmGuEeXmNGcAf5w8GMA9lmfVAlz+V6+s2/hrhaxewpyRSxxENXymJanLIc
	DM1hEzl7Vhz2z9XTidYlovfeqfLoIFMWitLV7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740516220; x=
	1740602620; bh=O/fhfATb4AiUXDJCmjcXCXRXVNJS4e8/TecLMtuchqQ=; b=B
	hAJADjsSmaVl9LVtpfE6cRAsxXwwuTg1N7861zIRXibXgg2MxKhe+aikLrrD5MYY
	BiUooc93Mf8BsbhWcMow1u3RQFNKr+lXhLXazMqVa9Bg/by/lAeF7zTcm9g9k32U
	LOQAu/sFMy7FXiBL5+vU++XTFY4U7+IcqiQ820mF9pY+1RoTOXWaEitR2V+ptCfZ
	WJqdLfdhwUcM/QpXuDkpvn2Uf2Mzj6i+/MmXL9x4tTgwytoe5zUXbM4n59+2gJKX
	kBk7Yu/gI/JeJe36RNZxUYPdSN+zx3GuLfPJgv0uP7DdvOIWe+qh0vGhZct/9XFj
	6rxueUVS3Wx/36OK80jIw==
X-ME-Sender: <xms:eyu-Z4C34Fh3XE97I_u7gERDrdNerw9w3TP03wXikKnfqf5RKF8_GQ>
    <xme:eyu-Z6g9gS4J2rwHWVuwYOTTTiErGSRRsvFXQqt44vO_0E7TSNN76phlHbZJ6MRuE
    Gpbv8-vsjNXnuSRF1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeegheduteffteeguefgteeugeffvdejgefg
    gfegkedthffgudfhudduieelkeekkeenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghn
    sehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheprhihuggsvghrghessghithhmrghthhdrohhrghdprhgt
    phhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtph
    htthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihk
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:fCu-Z7mIrGgSvFW5O80C-vreKzrTwA4iGXV1Ro_0fyX3q1pRBxe8Tg>
    <xmx:fCu-Z-zYu1EGdl3h3FKh3drCYacxHtXezkfwDqZdxjihmMbGRQYAFQ>
    <xmx:fCu-Z9Qos28BREiaYB0D-yS_S_9S-SrA8KYEkGIq5EUF3NSdWLJrGg>
    <xmx:fCu-Z5Z2TYLoOG5jGqeS938z0CwNI11CKJlvFB0XatiQbrawZxKJCA>
    <xmx:fCu-Z5pbHil56P7IpzzlVm65q57AwXFOM7H0nmnKK9xQPlbnpUhxW4xr>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D655BBA006F; Tue, 25 Feb 2025 15:43:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 21:43:08 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>
Message-Id: <4394a92e-8024-431e-a667-1644171472d2@app.fastmail.com>
In-Reply-To: <20250224-z2-v7-3-2746f2bd07d0@gmail.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
 <20250224-z2-v7-3-2746f2bd07d0@gmail.com>
Subject: Re: [PATCH v7 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_124344_724324_CA83DC36 
X-CRM114-Status: UNSURE (   6.61  )
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

On Mon, Feb 24, 2025, at 12:01, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Adds device tree entries for the touchbar digitizer
>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Hi,

this doesn't apply anymore on top of asahi-soc/dt [1]. Can you rebase and resend?

[1] https://github.com/AsahiLinux/linux/tree/asahi-soc/dt

Thanks,


Sven

