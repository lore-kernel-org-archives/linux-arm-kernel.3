Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29953C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwjwUckSCSBSaxgPLzqJL3F5+m9BbFCdaP0FISKu/pE=; b=BXlPZ556nx74Zo1tpjZ69H3JQy
	IR1UFToW3sEeZMtAVKj1FfFUhO+CABt/aErRaus9P5nBcptYt1ikGZqHwnzh3ysWoRGfUEWR2ni03
	4VLnvVycSv8MUNOMhs8iDREIkgJhhBDOTBAgy6d8AppBilcbg1oEUqk8AMM6jQN+K+IDvJI8qEGBY
	uNqq11EHvbnrZogP/gEHjihBzvrP8LLRAcmi7zEg3FK7mqc/hSBoCzd4ACsSztAXqxqsHYv4kryYm
	iZjc1fqPW0HfUeNuk7QULjppBwsNuvDwWIH+/MT0OqXPSNwgVx0Z4gGOEBuur9pDL8f3JH7qOqkkJ
	ZSffdcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hsu-00000006CmU-2VIF;
	Tue, 15 Apr 2025 15:07:36 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hr3-00000006Cd9-1CM6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:05:43 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C669A1380212;
	Tue, 15 Apr 2025 11:05:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 15 Apr 2025 11:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1744729537; x=1744815937; bh=kwjwUckSCSBSaxgPLzqJL3F5+m9BbFCd
	aP0FISKu/pE=; b=e1i+aKoQTp/qG3a/AvuoqXJEKqEjGZ7Xu5i5UZWuFQEaqqxP
	IRZJcFF0hh68y7U1qYJ716fePeYevZYuAddaNn8TDHPYcnL7KfmzFVaM38FRg3uR
	t/2Yk0xwotoEZHmnBAMzXQRphDXhu/K7HDs0pHzOiASQ4q/smIoaioGGsGsIfB2G
	kxEQXBF/0QIvL6SxZaGbSgaUUAQDQLBHgV2Vo38UpckMGYoL+IfXTBX2s9LA+Fwf
	Mk+9c7sjpNFoVlpZ20yUCvadcKZel/uYI/lffgkUNBzN1guxQxfXxzv6eYu1xZvI
	Fwd3f+SL2DMm70L01Np53vDYkyftqTVob/udOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744729537; x=
	1744815937; bh=kwjwUckSCSBSaxgPLzqJL3F5+m9BbFCdaP0FISKu/pE=; b=I
	y9PUxIMZKyx/wWiunAgFAXidgGRyW3HZxHbDbJhY2IV6uLhTAEMXOQOSujgoSmJ2
	eyKMz73oEbPHArYwm/c1VpaRYA4LDK+UXG3wfCxMm017XFmxQHFmWUtB04+lcIt2
	/BCafFPHApSWp9o94je/xTB9FHtt8oQr8Gj8AQ7JxRv1BNyVGOtgdJspuhlnNJbc
	Z/pOp8dZkUB344j5pcTJldOcJmOTH/vdAexu5qGzPERkAQcm4TXnxxPKIsx8YTzE
	8FsF5TuaUlKUyX1+A2OYMUk7rLxxB4gcOFEgwRU7UtqI0FkjmFfzq3XnjzciJ0WL
	IqE3RM0Vsn/THhQIQlhcg==
X-ME-Sender: <xms:wHX-Zz92DOTRw4C0ot-ejLCYTcM4v6Sb-YhKYL4dZmf9WIwun9Vspw>
    <xme:wHX-Z_sOlTfWPuLGWyKcGZqj4KcLd44iTJaJVym86VT0dm7TVrqm3A_toN18NL98q
    AG6-o5dOa9vgQhD-98>
X-ME-Received: <xmr:wHX-ZxA7sQbMtGcVQ7ieDdVNxsB3nf5G-vtGiXEEnF3eDjfkChhEaj0d4cdxD-0edVPo6I_7Dy_IaNvaEm4rrUjXVSa0OJP3iBjMEJGBF-AudOvyWZAryRsgMX4Yh0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleetudehlefgteduffeijeehfeduudekhffg
    fedvueekvedvveeuhefgieetgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrlhih
    shhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehssghohigusehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdp
    rhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:wHX-Z_fxKazDrAyXj0GgdL1YHnnm5RWu9mzovfCRmhBuubKnKX5TyQ>
    <xmx:wHX-Z4O0N3vNAHS2aI2UAEW1fbVOUJQ9GYJ-dp76zhfhncrUCI5nAw>
    <xmx:wHX-ZxkqkAZM7BJJFZ7kaWbZDXfOTX3OaCV_14q50IMz_tFztaeaIw>
    <xmx:wHX-Zyv03UDgmVQsjCgdhMqA9Xf42gf0x1q02Ac3WVcmaf5sMfOdhA>
    <xmx:wXX-Z5cVCwJgp4WWzKe8YRLgEhp5rxtkwsx1Gf4smRcrQY1y9AutgjxR>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 11:05:34 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jean-Francois Bortolotti <jeff@borto.fr>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Driver for the Apple SPMI controller
Date: Tue, 15 Apr 2025 17:05:22 +0200
Message-Id: <174472945748.1150.17125023476658706352.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_080541_732576_CFE010FF 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, 09 Apr 2025 23:52:11 +0200, Sasha Finkelstein wrote:
> This patch series adds support for the SPMI controller persent in most
> Apple SoCs. The drivers for the attached PMU and subdevices will be in
> further patch series.
> 
> 

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/dt), thanks!

[3/3] arm64: dts: apple: Add SPMI controller nodes
      https://github.com/AsahiLinux/linux/commit/2e0e70c95077

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>


