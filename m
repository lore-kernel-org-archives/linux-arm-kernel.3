Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F264EC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=; b=0a1Xmh0fIEun0u
	osocOkUzhfrdXrxZcZFnA2ssbnS2Wa/6eE5WlylHhchVEAwVP5Lpnwt06/BFoaKqzf0bNC2xHhens
	xDaCCeYZdx3CBODWEK6Nj9du6N8Kit+ZsPOlVuQ4fjvBoX35knBtiNTuJnvnUEk6v0TI3Sj+Lhcjc
	X/5zjRNRM/Jf2Blvm/pXTe9jv91XEbF6tKrkFKN5OAziKNzv5xTBmf5LteBjc2fY84ZNoxaqZvx36
	kJCPlgr7rpbVUv2It3HC3JXl9I1yS4kqBNgLGvjqMMHs9TawG2Rz8ZTZtg92ElF0ecD8JoOKMWvwm
	v8SokBObXeDRTrnbPeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfC-00000008M2G-3VO9;
	Fri, 07 Aug 2026 15:39:14 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMf9-00000008Lyt-0S0V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:13 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4b190cdc9feso882682b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117149; x=1786721949; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=;
        b=Xvw+tWcGogWedD5xmOCWXhbP26Ermbs5+AgQX/DPkpvnPIrGqmBICHbL9K3LdnsR/1
         il9g6gOtqEo6hTN0vqXxikKWll7IKejZrOJDeankejqeG53p/zHFsKpdLcxckqOo82OK
         JVeEnQOkYJ6a4QgnPz+RDaZ5HvfXCrI4SubXZjyN6p2U3StTfWPdv6I+Z7eP2s3bjtnz
         4Psu/Q5F/O8/L6Svc6y3xF4WurW2EbuOv3XoZXpc9v2TbTel7WiNUDxuzTEpJ/+QqfJY
         Ci4p6wkyfP2E0nMjpZfpYeMbnVFea0zbItO7guLVAkswqu2mp4yYGAo+C8Kjum7ydEQg
         zdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117149; x=1786721949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=;
        b=IjAUqd9uQURlD9flU85v2kmA4fMoDUAgsJ7OI5MXWztYJHmldi5Yp/z3MKP8xYY1L8
         pte/rD0E6uTPKYJmkLrGWGAU7rkYFQerWTpebicCF/agEEICjebtJxBIJamVEutrCVuc
         jCOX2/wxhMPEhDleLpKO3c+MlyVLsz6Ur19p9/sqi+ZaMvJl35/kHRyW4a3AoK4yy3Vp
         X3kX9AAf2bx26cKtZDsoQZHhl8/KftLL+pkWyRlYVOVqYSNNVYp/NjXZ2qfktGoAbi5R
         6AgpwBn8j+h4DkB/xLscRG3ESr/tiXL48iKeKUr6aa+a9qYYtbYHNpRX4VId7IDjXdCE
         qQlA==
X-Forwarded-Encrypted: i=1; AHgh+RrbUs+WeoTy3y/gLOVmO/StbtX7wbIthyMWmWYwrBZagzm/oIeVZY9OQ3t16CN/D7A+M+fSyVJ61GH4HQAauyQS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0QCDgutIl64qGQmZFW2Ak0eTs2g1krPXUuJ/SrL8NgZ2vm8Vk
	hIbvJHedLH27reSJBPKYs8M9u9HTvJ/BKgZ9yeoyjNOIA0W7rl58NLqa
X-Gm-Gg: AR+sD13tc8iuhIhlYXfiscse1YlQHcIZgFWRXmzoE6PoK2c6BEMp2GY90YT3s03pYuY
	SgJPVOv5xhvZn1qhJuQxtQsTHjpq0eBv+iEcP34q1sUnPi91MjK2CMQ2OFxkxxGAvYcsYqiAj2y
	NNrSYTg8PSgnF+9VAVRW3j/F6fZl8p+/VxgfrbEmsm8Ej7D4bt4M5xEXgtfwPj+w/U6wMiikkma
	wwOt6LVMPHLbZNKLMw5TC0HvNpe0JhkxE8qfKemgx7zyyRKbNcAVIMzW54Y6u/Mt/m7MI7MTNv/
	1chABAKH9UQZEUulkrCoTRyu9NcYiI5JLMhe2t9pl4y0YSO2C8PbU4ll25K/7DeqH6lD2kUroCq
	WWUSu3NN0M1cGisu0XXdydmnP+zmAM+drQOi/bWHeJSDN8/+YGTJ4NWP/J6boVkGUIHFOwqGX53
	TBeBDBPsv1N+6/YPkdAoleRxjvaICJTfyus/8XRBOHSmda/uB4NR7ZXXkjwvH2BovarkyfS9ObH
	ZC/MIkndrTnJFt5rJid09myAYbFrsaOhULYdByp7qz/j9ZUvZWG/B/rlzgHtGuntj1oe6ZBxE22
	E1gx0fqPmQ84l/nNgtEciYn2/IEAuG8JstLAaQgobS1W6AiYf7YMeP8D2K8iHqjafMEhnDiQMrD
	uUko6Mpb+X6Ah1NZT
X-Received: by 2002:a05:6808:1910:b0:495:f519:70f0 with SMTP id 5614622812f47-4afae01bf6emr13779508b6e.19.1786117149136;
        Fri, 07 Aug 2026 08:39:09 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Fri, 07 Aug 2026 09:38:58 -0600
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQqDMBBFryKz7pRkqgl21XsUF6mmOqWJJUnFI
 t690Z6gMPB58Hl/Fog2sI1wLhYIduLIo89wOhTQDsb3FrnLDCRICS01xvfNccrhZ0ZvfIeDyic
 VJnbs+4i6Lg3VdUlKd5A9r2DvPO8b1+bHWfKwbdrEW2PgmMbw2Z+YaOv9szcRCiSqKllJoVUpL
 r0z/Dy2o4NmXdcvhh8QOuQAAAA=
X-Change-ID: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083911_159073_92C0A51C 
X-CRM114-Status: GOOD (  11.99  )
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

The sunxi NAND timing solver currently applies the original A10 NDFC
timing characteristics to every supported controller. The H6/H616 NDFC
uses two internal cycles for several setup and hold intervals and has
different delay-field encodings, so the resulting clock and timing
register values do not match the hardware.

Prepare for per-controller timing data in two behaviorally focused
patches, then add and select the H616 characteristics in the final fix.
Legacy controllers retain their existing setup-cycle behavior and delay
encodings.

Tested on an H616 board with Toshiba TC58NVG1S3H NAND.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Split legacy timing setup from the H616 fix  (suggested by Miquel)
  - Move tADL/tWHR encodings to a separate patch  (suggested by Miquel)
  - Keep the timing lookup helper unchanged  (suggested by Miquel)
  - Drop the minimum-period helper  (suggested by Miquel)
  - Align H616 timing-data and capability names  (suggested by Miquel)
  - Add Cc: stable to all three patches  (suggested by Miquel)

Changes v2 -> v3:
  - Rebase onto current nand/next
  - Fix strict checkpatch diagnostics  (suggested by Miquel)
  - Add Fixes tags to the two stable preparatory patches
- Link to v2: https://patch.msgid.link/20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (3):
      mtd: rawnand: sunxi: group controller delay tables
      mtd: rawnand: sunxi: describe tADL and tWHR delays
      mtd: rawnand: sunxi: fix H6/H616 controller timings

 drivers/mtd/nand/raw/sunxi_nand.c | 119 +++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 33 deletions(-)
---
base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
change-id: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


