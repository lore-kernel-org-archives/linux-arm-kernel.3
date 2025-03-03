Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C7FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD70oFS3M4Bnr8rEfLIbi5W0ZWGc/ux+HB8INioexGU=; b=p+Cxpkkb+32WSbaeVt4dELTtaD
	+sWHsyMIzjGSDepQabiFrP+m//xctz1u92LCOuuH167cs5mSxBC23FqNXqKu8GlKoSkZhEknajBjQ
	FQ9PZ4rHWgQ1eZnaPEIFdMzWUlF/IpEM3hUWNS/iTCrdl2pnKXqjrKbACnMx6wf6FEoe2PKd/6xoy
	OuJYVftUmz+U+RmNr13ilaZGsXCbMALi3OlbzFmQZDbPeKZ/aUZlPDD8W/jVyULZpjpqXImcmAamD
	70/mtAah2o79LKhit7TVFSOnekNtNk5nfqqpJlkVcn2VPHCEAQZkIrY8BX1W2jynkLkXgQqZ6bmh4
	f6WHC3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpC2v-000000029AH-20jz;
	Mon, 03 Mar 2025 20:05:49 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpC1K-000000028uR-49MY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:04:12 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id D2E521D411E3;
	Mon,  3 Mar 2025 15:04:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 03 Mar 2025 15:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741032248; x=1741039448; bh=pD70oFS3M4Bnr8rEfLIbi5W0ZWGc/ux+
	HB8INioexGU=; b=WXjVaEnBX6IOGqXQHJ2m4dPzu0BGbHs8jAYcklH1EsVXpUXA
	pqUGVJJnJcqmW2tTkd4SDwFl+vvxlTF/9Ex485SAzkL1LsuEbavHI51bhrSvn8Eb
	RDcHwgX5RV+Kt9bkX3l/3hjBzOluvkVazeqmK+JI7ZSJD3DRSUDjlA+r0ksurTS0
	3656EgNb/UC60rxKFY+ixNTfUc2J/5WFwFsJqRRJrNmzj3u1iAE74pZt9hRbNjh0
	7nxYSB9jXXbu6lOrkqSr8ybvaNgCXvvEbIiLrE3IIgieadqaHJ0EHPHQlkvYtDg/
	5HEfzNx4Ez0bZFuB4GbprEUpWLPiLgDs2tWYLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741032248; x=
	1741039448; bh=pD70oFS3M4Bnr8rEfLIbi5W0ZWGc/ux+HB8INioexGU=; b=P
	mI0BGApw4lGroXEvS3GMBBbu5wz/SwprNLdFIrFs0JrYT28a9rwrj93ED2MJ6rXZ
	tlnb+yZ1spjol6GrqGnYmBBlUXo0O7kmxnnnNFAxX3aU31zCHckx9w+H2IGdOWPr
	HA6r/VQjvIB0qFk8RtYr+tFgl4hUKkoppEd9lcGyE5PWGWZTLscqW1ZfP/4GdMAV
	52QnrFhcfj6GpanBBMdXN3ZSGS+3CwifkzIJrDWo8DMji//3+0Zy0yCqvn6q+dgx
	n2fGiHGWxbYkjOJYa0CwC9m5r5bQXgmINdLrl9Pqc093V9e53oeClFjOZyhvTLv1
	a/7JSQ5SMgSbAui/6En/g==
X-ME-Sender: <xms:NQvGZ_VMM3RtP1DKODTRwtlwJzNkwcbcmPn1s-O22DbPhk3WmR7GpA>
    <xme:NQvGZ3n-zUADSrIYQbPCxcyd8SqQa4YWv9dAYP3FcuTmo2XJtGXQw5z1hJwUfI4V8
    rigKHwTmTvjJQIJSuo>
X-ME-Received: <xmr:NQvGZ7ZnQiedxDTR5CEajnguSPyYFsheJa4MtuRHvJ-RqCiqbUarzWHEAtzZxiH6XIqs3UmrI3X1k47UsDdmQcLdSbAzyKliGlVA24Hk3WCOkEfRux8vCJvExEkI8SU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddttdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepgeeihefftefhhffffefhheekveelveeiteef
    geekhefhieffgfehheeijeehiefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrdhkvg
    hrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgv
    rhdruggvvhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtth
    hopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehmrggrrhht
    vghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoh
    epmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhm
    rghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:NQvGZ6UYHxVWkZf7UtPX9TwDArprBk0BWSBdpveHMJd4CkkzrHt6kw>
    <xmx:NQvGZ5mAwfjIDz1C18jwijwve-ADRksOJRo2PDpzeZQ6xiOeQaWbDA>
    <xmx:NQvGZ3fT339mfLcSW5qQfav0c8o47LLgQ5fG1WVOxCQQ8dkF_dD1EA>
    <xmx:NQvGZzGFmyC2hu3N7Vq5zjNkUx1dHg92NTiwpEThN4TPfcGOgk03-Q>
    <xmx:OAvGZ7UFo6yl2jRQYv7xu9S__Twf17INMbiJr6VmJP1Hhx5oxAy2M1kN>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Mar 2025 15:04:02 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	asahi@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alyssa Ross <hi@alyssa.is>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Date: Mon,  3 Mar 2025 21:03:58 +0100
Message-Id: <174103187680.75921.8965235926191911132.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_120411_257485_EACCA0E0 
X-CRM114-Status: GOOD (  10.04  )
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


On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Since the dt-bindings are now part of drm-misc-next I've also applied
the dts change, thanks!

[4/5] arm64: dts: apple: Add touchbar screen nodes
      commit: 7275e795e520c7064af52ba67c74d7bac27eea4f

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

