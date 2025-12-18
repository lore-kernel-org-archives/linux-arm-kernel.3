Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6799CD6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90EkJ5+JSasty2Ox2DkIb86KfhrQvUo5LvvNkx1CT+I=; b=CbEFXQGHfR05iG3toYQmapgbX8
	rPRg5iVNhvLbspD8BB5AQeajIOEVB8oP5ggtyud/lpgS71iDE7drtsvel1g8vOveWpXZfu8mfKpk4
	WSCjAe/ub76nTH5zw86iEnG3Vd3E7lamCGRONLQB7f6CQidLzMshNXlJIHY0FpWSGaAX0qWHrlNrW
	hzbpokhYz2EmU5H2Kkm0JhPK8xjMNG9K2X0pYCwEfUDyMGWo4X7WRUWSX/YBsBBjit8C+hiPT7Mzj
	cfYsV2cYg2KQEDDN1ESImRzQMozxa/N4QClReg/vyoAn6MBkbLFXqsdHrikfqqR1v9ckV9Zp2vyXb
	M0rkTm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGiJ-00000008nSy-2qsi;
	Thu, 18 Dec 2025 16:18:51 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGiD-00000008nPj-0UrA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:18:46 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9FDE71D00035;
	Thu, 18 Dec 2025 11:18:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 18 Dec 2025 11:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1766074722; x=
	1766161122; bh=90EkJ5+JSasty2Ox2DkIb86KfhrQvUo5LvvNkx1CT+I=; b=z
	IL9ya0velw5A/ikR+s61JvXePsua1pwKt11zKzpIn6uwQuI9HqURyaumROPou7qL
	tcQn6kdwaZ1RLWoywYCFx3WBPjaU/YcJQDCpJnWUBTDY6/wimlFjAj7ZUrdA/Di1
	Bpod5AWUAIlxMLb13v8/RJuv45ZZM1S7NX87qI5bF/WInFMQGVbku+Qsp+/l3yee
	852xNCPON+3MtMBs4qHKd1HGjBotiLxwAL04lERk0nzsALw2KkYgp/3B0lRvv6Nq
	sdKSxYANK9C1CBDJW4kpXlYztzYHXNDRcpoybWK4O14u9zc4/0IMvKAfs3ZJ223S
	m5Z6RAH/sOaDfb+vfxFxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1766074722; x=1766161122; bh=9
	0EkJ5+JSasty2Ox2DkIb86KfhrQvUo5LvvNkx1CT+I=; b=CAk9VeZSSffk5LQgI
	OYRg8aOI1kc88sLTQQk0ZvowUTasfYYmd4/aHGtWz5PQHwOCgaK1nVKMdnooWFdz
	5hglLAql7tdJFFABvWZc1LiLYl2ALv1Bq9Jaqch5gzpRORsDvBZcIO5y97W5+JLH
	GLQY1QxMJFQQXBtbFoO9iVy8Gm/BFKHilcPHk0jCInGYLwFtq54nbFUvwgeLeHiB
	nduF/kJh4zfcuXGpUrXWq4j0pITf1OepqvPWUsLfTtJ+CPa9GkK52cz/mQRgRfba
	YM9QEQ6lcZ139voLqDEJD4zWZBEFjZFj79WnWEc3AphPwoN17KQYmWjMaouH7g1V
	ygdZQ==
X-ME-Sender: <xms:YSlEaUJekzXyBXC3xqYudsrNKasp_cL5XMQ0ZJXmNSIXz6ZnUamZoQ>
    <xme:YSlEaTutZPVQdvrw6TlvlXL51JX6gWfRhGXPGOCjafUlwDnT4VH_s0Iv7X845upOy
    i6vxaTnBUVUj3hOWHTvdVMDnJEIQZLy5raadVUCdAvQH4SEMS3MYyI>
X-ME-Received: <xmr:YSlEaZBXYK6iCBTOUjZkG-bKmkL4J__ehO_kc-qdNHoUZ7ZUlIb6ivKOwHfs1xvroNnWzLwJvvO7pHfm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggr
    ucevrhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrh
    hnpeegffeuueelvdeggfdvvdfgtedvudfhfeekudekieektddukeefteetieefvdelfeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvg
    gttggrsegsshguihhordgtohhmpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgt
    phhtthhopehtrghnrdhsihgvfigvrhhtsehhvghtiihnvghrrdgtohhmpdhrtghpthhtoh
    epuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdr
    ohhrgh
X-ME-Proxy: <xmx:YSlEaT4oUaf6OrCTDrcxuvosMyUI3QNMpXlQzIJC43j8jCRL4Jw_eA>
    <xmx:YilEaZBnmUet7Uwb8wZEe-SwWE7XhjA-TGIG75O8YdwPFS0Io20Kxg>
    <xmx:YilEaR6NUS-_ODqFalfBDnyWmRAzI2zhdocy58dhf_rvo0dmzoiRfw>
    <xmx:YilEaaup8DKk4f_gkYI6d3SuUWmi0AUqUMXtC833UHZ3blHlGNz4IA>
    <xmx:YilEaTTopnG1qjTLmhh0lP6bWJl2Q0ik2gVA9K4BNXqXnJVPS5z7Hjql>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 11:18:40 -0500 (EST)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tan Siewert <tan.siewert@hetzner.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
Date: Thu, 18 Dec 2025 09:18:13 -0700
Message-ID: <20251218161816.38155-2-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218161816.38155-1-rebecca@bsdio.com>
References: <20251218161816.38155-1-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_081845_202907_7EBC8C64 
X-CRM114-Status: UNSURE (   7.29  )
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
Tested-by: Tan Siewert <tan.siewert@hetzner.com>
Reviewed-by: Tan Siewert <tan.siewert@hetzner.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..aefad2d02993 100644
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


