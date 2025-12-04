Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA8CD2A53D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 21:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHTHfsItrpNksp7sM3LM7hcMpvoJLCi8sr+Lllv2wBU=; b=m1UJgkkNb+eiI+eeb5Rsu+jEEm
	+Py7/3ZP9nU+k1W1s8Wo+0Drhhf95gxV4L8+ndO7kEDVS+qBDWDaUZRacX7XHDDja7hSgPRcNsBDv
	4aLEaEeA6w+vGpWtDWp1KzQh1yQrwglJUQdA8N0KrCYeMqqqkBtcE4rSgWK/AxB5XEKmO9yjAemhF
	PvOo64Er0bFi2D+C+z76ut48RcEy+yJVh+BnYG8fyxUZGppqLbqiWLfzE2jxsx9JCmDEfSgCTlvoH
	yiSgpaCGmUsejqVyDSKxJ8pmd82rPreF10QF/ITD8RKAe8dlcK6Jgw0MeCr+HkU+eQjznLizuntCA
	mSBVSFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGTo-00000008e24-164U;
	Thu, 04 Dec 2025 21:03:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGTn-00000008e0u-02Lb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Dec 2025 21:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HHTHfsItrpNksp7sM3LM7hcMpvoJLCi8sr+Lllv2wBU=; b=Xh81P1UPHDtqj+cJ5dYWXaCkBx
	RIrclLld8NTa4NTFahJqYykvyzvtem29XV+ascN9Kt30RtgPHbRpS5Ss7ttixh10vrIZJa+wtmpYx
	Tah/dAOuK6+eUrTx3qpaDVtUrEDYcBOw7C9rnKIFy6vUTIv1h+r/ardyLWYtF+HjuDkIiFlF1CJz4
	j18emNoF48VPOrj7P61lO4Tuh/PEN+rbSdlw0Y27WRnJG4fvJf3LW6ahow8vbi8c1mh7AOV7OdXT2
	rF/Fy9xMBfacNIcZdQkcNIpW+hhIPV/r3LMbocsbSZZ0SjDX9gbygMyMNW0qLQUpIKxdebBHM5Cn1
	yi3dDUdw==;
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFcC-00000004u8H-0NuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 20:07:50 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 243407A001F;
	Thu,  4 Dec 2025 16:03:02 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 04 Dec 2025 16:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1764882182; x=
	1764968582; bh=HHTHfsItrpNksp7sM3LM7hcMpvoJLCi8sr+Lllv2wBU=; b=s
	St7vwb9LF+3aNcEGVg0EOHJZ73MaDi+clYBmAuc6rJ2wZ8D7TRFIBJk0CYzhW0nI
	1/yZkIYbFPHOTZXxG3aGaTlFq1tQ97tPiLlJZ+yNJblMSKNPoL3R7Rn/FLW+De27
	AZT1w7Uztgio99hO3990Mnlca9TSsGKMKde1f5gHrlTbB+2d3t/xT/+kJdGFkVv8
	LETWPekGYW4Esmk0NVu2P0y0CTWipqWqD3ETXrBZnwGTt/KfgG85/lPK62knnKEP
	Ix57LoUxcP4B5+5Z3Ql56jr1jCHWwJflgRa88jeXzokYszVv/EHBY1LPRXjT4bmv
	UrUCFjBujhGvXlw+Wn0yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1764882182; x=1764968582; bh=H
	HTHfsItrpNksp7sM3LM7hcMpvoJLCi8sr+Lllv2wBU=; b=PJuTbZbNazvEmeYEf
	UGPlKTK5WsFdNysMJeGOO7QlTGrEb+FDy1aQKYbsY/rZK6rIml2TO1oGqCmlJV22
	omhkJlNWlwt+GY8oO4YTpvEQM426VSpzaiwQ4ofAeVvA7xtiJfReDH/PQZRLOvoK
	NTm7Bvt34j6LFLB/UsJ5hWNsF8PhKA34WY3BMsbHtwG5ZROLcHd86mW6xzLSROzc
	KGCrGeari36JM+N8BSsPeOzzUjxtaW/s5G2uhlOCZ1oWGLMo8A8mXCmaGe4Ud6lL
	pM/WWfmugncvvPlL+Z5FThjh/k/l3qZDcNHcwGSS6nqti5BywwOdQTHvKpV7z3NO
	KRXIg==
X-ME-Sender: <xms:BfcxaQ7gsO7gde4l4MIaHB7QuKNVSkHFLYf5cjR1HMbWreUEeKPqGw>
    <xme:BfcxaelFLkliPo8d5pXhT8TSM4irncgOUo5LPVC8JObGqpn28dG8Us3AGrxa06eHc
    XJFt9_jbPm9i1yV5gU4zA-dZgL8rD_5d7GmRkh1uEPrcMh8IcLSXwbH>
X-ME-Received: <xmr:BfcxaTX9PLaOOsRZKmtvCptngj8NJnDw03uFKrty1nBxPbL3Kf8_HvfKMIKiddvty84evRVle_jaPxwj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfgvsggvtggtrgcu
    vehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvghrnh
    epgeffueeuledvgefgvddvgfetvdduhfefkedukeeikedtudekfeetteeifedvleefnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsggvtg
    gtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
    hriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtph
    htthhopegrnhgurhgvfiestghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrg
    gsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:BfcxafRgF2TZHU41D4KdWNt030T7DIFfZX66Cn66WlUyDbTKFPhCBQ>
    <xmx:BfcxaYDNdl-GOtwHUoY5PtXxlCqrFb-2HoN98HzWDog5jw3ZE2wnGg>
    <xmx:BfcxafvGtgQw1o0J5K013V8cAaQvZyz0Ma2HuBL6mXZSLnhjraZnnA>
    <xmx:Bfcxae_CZnFtAfafIM6lZIiQGvvyN5iGck0UzPFveHyqtWbDHeymMA>
    <xmx:BfcxaW_j0aazlwQIEDezxxLxo6C2razwGEW1vvrwxbnK56og5pUCGCIk>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 16:03:00 -0500 (EST)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
Date: Thu,  4 Dec 2025 14:02:34 -0700
Message-ID: <20251204210238.40742-2-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204210238.40742-1-rebecca@bsdio.com>
References: <20251204210238.40742-1-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_200748_784065_33BAEC5F 
X-CRM114-Status: UNSURE (   7.27  )
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

Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
compatibles.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..049e86107c50 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -34,6 +34,7 @@ properties:
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
+              - asrock,altrad8-bmc
               - asrock,e3c246d4i-bmc
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc
-- 
2.47.3


