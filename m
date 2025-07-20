Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EEAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNP7aLlH5boXxQzG+t+OENng1ZS04P2rudXCohGPD5s=; b=JXE+ljgff8wwrIz9DJrAj14+lg
	1sHTGTHft0xH7xhHkRjmJiOlrSgmPXrKcWNS0LsYiQnT1UTcJABoNnPrF2pINTXt6ZICzma/B3cDc
	fgnSk/pujrLx/Vbiguh2etklxFFdVyXe3fxSBOAcE7Xn+GVKCyQ9/6XekD8BMDwAMrXjuxEsdeISP
	ZJ1ol75zSyrDTduYnEH486P8vJx0lzcueQaqb/c45GgYerRuDqQ8zVCJQeZA/tyNBNVEwQslKkr7q
	ij7pHUWtfyoEmnRP/SmhynfD68BFNrePirZrsSar3OoUOp0YmCAADYmV0DCktPKedBo+9VQT5XTxJ
	C8CxIDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQ76-0000000F5C4-1M2z;
	Sun, 20 Jul 2025 09:13:44 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPlx-0000000F3dV-3uTW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:51:55 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 075747A0186;
	Sun, 20 Jul 2025 04:51:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 20 Jul 2025 04:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001512; x=
	1753087912; bh=UNP7aLlH5boXxQzG+t+OENng1ZS04P2rudXCohGPD5s=; b=a
	C+IlIDjGS6uS/efVwEXWOliogCBtxwf9T34p+VQ7kS7P+ci3EySItpeQz8YqNCch
	Q7nZe4iR4nkDfUrcFY4mn26wJylULYLhkS03lqR1Tg0c1GtQE3wAPHlGvv79S+fu
	ORw5y2OfCi9Q1hEpJaLTxxDE1dFh7AKoHpjYx6xKLyN6eTij0qrDb+hSwzuuQGXd
	/kCD281Sekow71xwoRbFFOfE75D0BI1mUjO5VlrYS5/XAWjc4t/QrILVxhsxzVOI
	nYzjsEZqs+UY4kHQezoewGMeWcIyQCGONmExgA3frF+JTi0HDaw6xVlLwqTfzLn5
	VWR1gicziIy/c7//2wTxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001512; x=1753087912; bh=U
	NP7aLlH5boXxQzG+t+OENng1ZS04P2rudXCohGPD5s=; b=N7iOZeN+lYhZZ1zHX
	+aazxinbHGhqBA6t6g6/4SXdqLlOXW1/mwSx0/LfdOwgn/sQlQII7ymuOkQNheI6
	Y9rc+0daHoyNlDe6BUfiB4QXDPEAUGSHlAd0tVP4r8bfsZBQ7ku258zfQyDX2Rp8
	G2muBssyQXhpPrbzA1G0pUC+37rJBgI/G8Szs0FtlAa11TY0trsTB5ToaDzrbUmW
	4OF4DYXxdrmnW6wCc4c5omrWS2cnFvE1loPJ+E0+J1nHQ3KDOf26CNlqtQDHrOmP
	o1g1/5hfGnlyDzI1kWtEGecPpVKnHd2OGt+MezEtGXfpxZMTiTWFfQZMCDD5SjoQ
	xKv5A==
X-ME-Sender: <xms:KK58aNcf52W5pAVgcUR6jqw5QQnB6VVHyNk_pfUxdMJPgvdVU9EVlQ>
    <xme:KK58aL0oGzcn7azYl9F76sIB_Zp2M_FUcWF8u03-QCIIwNt1oPxow0wqqOTmcKcfU
    h35SnGcAkw6aFdZow>
X-ME-Received: <xmr:KK58aBr296fq-revSCrof_18sdRzATyjBzLPrsbu47Z9kkwRuYCoSF6INVlZGN1pAlfTuqFNlS_JEhkVPEu8JU-y8vEm9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepheegudffieevieduudefleffueetieeiudelhfetveeggfffheehueduffevjedv
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdp
    nhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehroh
    gshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhr
    rggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrg
    hnugdrohhrghdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrghrrgesrghrmhdrtgho
    mhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtph
    htthhopehkihhkuhgthhgrnhelkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:KK58aLgvUtKeBiuiqBms1R-4rW7JNs8DDhbjYXBy95BfFwfepEfqVw>
    <xmx:KK58aNkAMaUZhPeBeA6W3xFR8Sk4udvNumnvx75OAhUe9yeKAdVzLA>
    <xmx:KK58aEra_WYhc7bLYY73WUXZ6FnbrmDtDfl1kji6m2CXzAHh6KlXxg>
    <xmx:KK58aJKr8jPJRgHFsV-R3id0BqKzJiLsUJnK1ceCEHwdNJlz-cig_Q>
    <xmx:KK58aCWqXbWY4pv3vLygyEY1H6uFKlzJvoeTXBLlqjcUzJqoOmEnYYHH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:48 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 08/12] drm: sun4i: add compatible for h616 display engine
Date: Sun, 20 Jul 2025 20:48:46 +1200
Message-ID: <20250720085047.5340-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015154_019980_4B7AEFCA 
X-CRM114-Status: GOOD (  11.34  )
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

As discussed on list in the previous version of this patch [1], H616 DE
compatible could be added using the H6 as a fallback, however all other
SoCs have individual compatibles, so add the H616 here for consistency.

Add a compatible for the H616 display engine.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

[1] https://lore.kernel.org/linux-sunxi/20250224180025.4eb33c3f@donnerap.manchester.arm.com
--
Changelog v1..v2:
- Add a compatible for the H616 display engine
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index c11dfb2739fa..6986b329236c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -436,6 +436,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
+	{ .compatible = "allwinner,sun50i-h616-display-engine" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
-- 
2.50.1


