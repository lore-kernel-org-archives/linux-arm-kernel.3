Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D281CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96KHcK7LleltChpzhPpywBhRsLQkTbjtjGXxMC2iELA=; b=IcZjUImprfv8/8Ut97hbiJ1nj3
	Y7bOktAC9KzUQRd86d0/Q8Yl1kwXb6JuvhWCmLFeZ5WP0VTwCsIhcDcSlsp7q6l6Ap/GqnLxfbufq
	No/SZAVEHh7Vzw2dc0iELRxu5phrvvoKRAD7ItRq0/Ri893qOxyuO5aUI8Y3AB+xe3Kn55+r8qwV0
	8Ja5dOOdYT/wHaggBjNYHeZ8fKAbuyk80ZTWu3JgulXCXzPzcaTQ2BWE6plR3SnW6kPvErODxlbU0
	3G2dG7mC7Bjvmkkok/LbOjWjH9Fe8NsGhZHjydlysbrITPeuZFbik7GEboaks4I2TEUfogKP1US3g
	mpNtkgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywWJ-0000000Dnq8-1X2j;
	Wed, 17 Sep 2025 18:04:43 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywWF-0000000DnlL-2ptu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 18:04:41 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 36A80EC02AE;
	Wed, 17 Sep 2025 14:04:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 17 Sep 2025 14:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1758132277; x=
	1758218677; bh=96KHcK7LleltChpzhPpywBhRsLQkTbjtjGXxMC2iELA=; b=a
	roz2qbLh39Uro22WFxx12+H1FjHb/XWmkihYk5sG0MKDuGyc8HsHXVaDQRi9X+z5
	GiJSyTWV/UIWmw+LU/MNMWaeT1Jkoad3QyudTSRmw8vulEyjMSDFtNW0+vxOioVP
	dz+OLwp8NMmatF5lIZYuvh/3oFIZ9CQvM53WE31hGupYhPfnvDG1feitmL5z+xOO
	lceZZBWEG3bCefAmggqFfeppT1IFZ8h1W/ytxFBGrPMblTJBfXs5syWIZEhgwpkO
	9gxp6cvZ3mDTM+NkdzB7PZIBsz4Do26OabZuCkVMblvnI6FViqMa8M1IexgNuwp9
	2GPfZptAWa/RuOmm4fnVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1758132277; x=1758218677; bh=9
	6KHcK7LleltChpzhPpywBhRsLQkTbjtjGXxMC2iELA=; b=QbjkGlUMrqFKvLdZa
	u+CtFuI4OHpuwg5j56jSE6wwSye0Fxe4/fyNzmtkXj71nOB1qC8BNseHGuXKN/qy
	O4ocppJWVYJCqzdMDEMQKVXlH1FmG/8K4Rq47Yq9YmdOTbuRvCVggHdRJyqxQMFW
	QJDasKmWMjtQjqGWRUcYTE2WNHNjZ+e2mjGpB+urGCxfEVqOFv3Y7ZztJdZlW4mA
	XoyS4DOHrF/QfOYAC20bxfqmS0LiSGSoW9uOaoHQLJ/42fLuR2gEocPJ/mHUiQuy
	c2wG5OYj8cjjufF1T0igoPg5urKs2usyzSxNy+A2cpx2Lrl29/2BBGX5IKyOeJ47
	EwvVA==
X-ME-Sender: <xms:NPjKaNmR8g1Yo8teh1NYvfw0se9-ozpCYVLg3qPsjDUfUH5zyL3u-g>
    <xme:NPjKaIAqKFEL9ghA-mBSHePqCnFRp76SkcSdjLdY2fjCI-MJSeKV9XL4gmWGdrIed
    ag9CvSpCc6ZCtvY6Nc>
X-ME-Received: <xmr:NPjKaGWDeo_WnyFZpl0THchVoNB9wbPQcj_yL33-cpnfkAh2Alo6TWZEFTD1mnuCwM43cu_MO0wZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeggeduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggr
    ucevrhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrh
    hnpeegffeuueelvdeggfdvvdfgtedvudfhfeekudekieektddukeefteetieefvdelfeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvg
    gttggrsegsshguihhordgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgt
    phhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilh
    grsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NPjKaG_po6iOZSwVj7Unv_8UdhucGnhD85QxYx2uO4TvKZ5CZK2F9A>
    <xmx:NPjKaIRbhrihadeXI61DN9EIlLEoUx5MG7A5yzfogf32oyj1htEz4Q>
    <xmx:NPjKaLQlqGOHZcshpRN5BQHfIn9gAFU6UM3gICiqs1oFVX0zYK8gEw>
    <xmx:NPjKaE6XZoUQoQjb_cjDkbFYoLwYuHUFo-ywJQWEyeNh6C0QUIk_sw>
    <xmx:NfjKaGX1ZqKLoEO6WEIINu7iwQXkNoZ7oujs4AO83-JyF2QDoTh4cRby>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Sep 2025 14:04:35 -0400 (EDT)
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
Cc: Rebecca Cran <rebecca@bsdio.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
Date: Wed, 17 Sep 2025 12:04:25 -0600
Message-ID: <20250917180428.810751-2-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250917180428.810751-1-rebecca@bsdio.com>
References: <20250917180428.810751-1-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_110439_780610_03CB768F 
X-CRM114-Status: UNSURE (   7.28  )
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
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..7d5c6bfaeb97 100644
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


