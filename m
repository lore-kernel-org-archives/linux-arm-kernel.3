Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C64CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=; b=jbmILn3XM2XyRXFcv6yflqa2Ib
	TjMPvPyUAInN5//D4C5s1Zd1GnvtWxfpP3xNxLfJtyHi5ON63WlIjhIY/nY7AMuneWv+RQJPaSg0M
	eg9+fIlIj8Cw5Vm/Nni6ShnGskvJWNWYNYZ6LAm37RJrcVtSbqrSOGvuy3l2lrDQx2Kwv08dz2stv
	P8cZxgkXfb6i7lb7SzWMfRny5FCNYjywgBJKOLoCmZeqhhJ5eorNfR6pjDZOM2LUYV4SmXthCXlMl
	1G2VcA0aTrWrsxdzUlVx/MJVeJTqBwCZk+6YXHEFM3Hd3lm4KHPUh2EOzvprlI9AqXypowWfGYJCB
	7Vrus+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATY-00000005BIq-0TLa;
	Sat, 17 Oct 2026 19:53:52 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATQ-00000005B8b-2HqO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:46 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-824e6e6ed71so600842a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266823; x=1792871623; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=JQQyt18hzOtJWx5oJZCcalG8V/NQzb5jn2Kt2wojzaGoJIbXyzKoznp1TeTgvEaUhJ
         oaRcId/qDMj9Faqn0xmVP4LLAksEHjGYlm5PIUj6M45jWrYCbDLYd7N8OLbj7cmpUsvv
         n1sEbjc0QWhh2GKCcU6GvRXycsID/xRoYscFacxqMZPgsqHoQbY0HvQMKd2R7DrfdiFd
         ga/maH1zo7vTe06vBa/5zErLCZlkhTrilueEQhUX5hJM/J0FTaIDxA0X1LHoymeLfI0y
         I/+gQuIiObeRJDzJe2q1mCmjY6S7Z86SE9kyFBjW/JpaLwGOsOiGOAC1lVjJlFIGE2xO
         dLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266823; x=1792871623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=wBoPm65FJ65sw24c9rq8F2M/pyUIEbMQ952BDzV1H7bjEzblqiRzswhi0BfRHQkDfh
         sQIJ6Grp4DYrUf9jB3Mqe5kpmDYzecEbwv7h+RoiKf8VdqgfVQsvYPhoKnplOPkM1YCi
         SwINa1Nq/yu3mlJM+UfpvuPcyi25jfHOqh9V2bbGBs1YuU4GBBf0B1zfUi2BiBHALc4Z
         D+tcPmCKjqIkk9bNsPDX625FOn5cCYUWe/kga2EUwPpQ1KQrYIgNm8sBCCEBuL80aXaZ
         85ghTWQJYlMJx5ihVdwF5Vqb6B0JgZhl0Y+J0WPr7U5x1CLfnqlO08QBdCva2Znn1yBV
         MffA==
X-Forwarded-Encrypted: i=1; AKwUvBwCkyM2GuTOwbQZQ3CRnVwqfVh4U/gFL+iQwYCeQ+yn28QgfsLmaMiMw109XGvtLW0rAV0XsV2/b4WbVAT5rH3d@lists.infradead.org
X-Gm-Message-State: AFq9FYKiZkC4Ap3YYmUtbc9X7ZbWtMCXfo7oqyBfIkw8wYFWqO7Q5rkA
	hWImbUlB5H6fB8pOmDYMuioWl9xTJSf0boUqdwrmtHdpjP9ET0ZthLK7
X-Gm-Gg: AYBFou1FIO/4tH6C0FIZaQ3aEhkWek0VpWCcpECO81qyMyWXx/uhEPhJlEVbOhsIdAI
	v2NcIguALCEAx9MW7ROciHig3/yvM2XSR0g7lbpxgJNWqzWwCVEqSgsLDLKqutwr81JXF2xshee
	wsXFmTzXvwWydGj2xK8eFRxo7EWEWr0eHGvzCRANBGQ43n1cQKvfo8EZ0dLboB+s7DKDHb296YP
	4jH2bHANqysjlkgqK70WWjeTNHSmTq/48qFeYqvwWNhDrO5Mob71SO2SgkDWJC4OhNd7G1MeCWw
	pN0+DusnZp6WntQ32of0bFEcic09lLD30jh08GJUstYCIGJW46OWuoh/VekcCq+mDlH67TKL+v/
	er9wblIWDGNklAIEuzVKCNyxnXfSVDHTl/4s4fEaSlSouSg+JL1j9LwLNPKZmgJNPu2rKumVaSB
	lIyldUiOkGrCwXVRgVr7GXeKY3Li99hAs8TWMq9drkYQLT9Vzzea8l7+byAFXrku4WRlTMcUvrG
	x4ZY/Pcozvt0gumFNEVOtrnD2r35hwqe/IgwjGwPHsRpucFwHaObOTz+BiOZDezLgTyBzpuj9PJ
	7FbiCj5bMLg/w1epeV1UyNnYyG8lpdbcFheqYW49qtcz7zWmapIQf4KfoF1Ws9SYUdq6xPuIbZX
	u/b9QGxQsxZbKagV7jaYLah7blTgNyvJtRS6P1CLCVhY=
X-Received: by 2002:a05:6830:4389:b0:806:3072:240c with SMTP id 46e09a7af769-84501cf7377mr3819310a34.29.1792266823279;
        Sat, 17 Oct 2026 12:53:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 17/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Date: Sat, 17 Oct 2026 13:53:06 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-17-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125344_601852_F2223182 
X-CRM114-Status: GOOD (  13.24  )
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

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


