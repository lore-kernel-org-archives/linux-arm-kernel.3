Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E72C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 02:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4MPYBklt/xZLRwo665EAmIcEZjt6kKUUFD1xrGZB/rQ=; b=XhhS+s0O7Sb1IDGGXBGBtD237b
	m4qKWXKGci+Y3oaLHH0k2gLRHd9psVELPGXNXD0sBs/Nlcf7ruy4f9hNLd5/TzkCavWdfu+aRIcuL
	zCL9lMhgQus4/miJQlc7RPusPpX+AzoUd1lCw1w1ZZkqJOrUXr1N6Ae3PxJAkNUog7yFADbmw2Cpc
	0IbO0R9tgH/+SroBA4ohwB8XS5gT24nf3mbmfYrNinHXPVHlFsZVgO45nG2pAgwjzJ5Q04hCKED49
	3u/gMZu1W+gkRwJ3JquIsPgbOVcpvZ/spvv7c757sxeasH4kqiKYBTOUBC/NnCmfPrHzkaeAy5MvH
	mFx+0dLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08XH-00000006bDW-0Y4s;
	Sat, 29 Aug 2026 02:11:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08XD-00000006bDB-2BBq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 02:11:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381b831d535so2869169a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 19:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787969466; x=1788574266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MPYBklt/xZLRwo665EAmIcEZjt6kKUUFD1xrGZB/rQ=;
        b=fvizNpfDbS6yzaSugN2HKONApNWBEbkLIpgF5j5XPB3VEHWUoGC4qpqe3AV6cCV0AF
         EYvLHgLLVQN52ArcUrw/4WhDF/Zb080QFAj212s03hpdxcoLgKC9VfWQhjUFR5KEbGuC
         rKZS1Uu/M5uMRlk3kHUVRzaVta4ONsWFKMg/Amieir5cW/J/ct+wiFWEYrwvqNVa+2lF
         a4vGk7LsViIAxqjV4rG1cW6xuS0ybf1fQh2+pKIFs0jrE/SUjTYSHGRyuie1y3GtbIBi
         dHyGoC9aZNGPg3ZF0/P6Mbot6hV1/Q2jKShG4eBs2ztdG9UUxcL4hZ2BSV2ZeUL6nW9Z
         k6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787969466; x=1788574266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MPYBklt/xZLRwo665EAmIcEZjt6kKUUFD1xrGZB/rQ=;
        b=T0TVeI7iZ4w0jUHZY3Nem45szqaY2rO5K6aW7p0PQv59ddsDyZD19w0H5ZNraWbskQ
         D3QZROhxVuAgXcStufsP8KHLo7FqUDV98bWUEsxRrNQRoM5HgVERpbErDdVd6p/BJmQ0
         sUXE3HMD1sZGlbYRFI9digsdKl8E717i2eUGZqvC9NEPvVj1KDj5WhWZtXKlIircdGv6
         HZcon9bFVH/yei1IHIC2sMvKzY5BjUHl1MSOQbxtg+aKnNoekHfCPuYVbRCtpcClrNMN
         +xnvFDhMpyzmufu2E2CpJB21EK1BDZEvwfcck/bIymQcdv+ekhaZDCIfWRFgfpveDSTV
         RE3w==
X-Forwarded-Encrypted: i=1; AKwUvBzu20hdseMVBjjHDMNeKli9A6cvS6/Diwwefk3TibnK91TzUGNXNTG73AVAsWOOncb6DKoxx8ZhgFgkrqPbICRd@lists.infradead.org
X-Gm-Message-State: AFuF++l2hbGqEQmamjOPLUI37SV3lqDtOQZVCXZA2BJcCyXL0nP1euK7
	Gp9pXA3/pJbN7514nT/vGfNJd+GU5/zgozUhNfnHt6i4UGWjKah+chL2
X-Gm-Gg: AYBFou2i4dJA9sKB8CkrOsczwEX0/DaBFfLSEJCrll6sxmPHeqB6jC0J3A9hJgRPwIW
	FJFiZz4AIrBaw6sdtxk+QZ0M+dSDMuH4EOpE0/ul/xd9FEx5vKyemofFB1J9dGmpgqLU2kcEwUF
	6IWlCwveSCACa4tnD6Rwqqf6e1QMu6TmLhoBmvgTRBHYv9Y6cIvqmHhwkw1BjZFH6JjmFhq61kd
	xmd1d7FAIQzW5fmNAxF9siD1XuYMvHGoPLsSp8AKaPk1y/JVJfJK9ThZwJ7yvUESCRv5UTeOKDz
	8k3VyY7sPBS9RYX9B/QuQd2lcpy3MRF0h7FHWXybBrOoGpq/gijeUMOnZ2upSG8nFchWGqfVOdK
	ADMdtcliJ4CPUnuqtsZtyopTTGYn5idWSgjRYAPum9KFv3cbUERGTiFoDMhyCASfyO3RUkHNZC5
	hZt9yTeTxEub3RD0KX8XcChk9sm3eLnS0O2xcmejU0Z22gOZeuf+NB0opL1W6AUhHw5p+NDNVyL
	fV8i49ZXeoiYgV8riIOoJEno4k2nN4yvm8RnzQcx1Idmq39HOnVj2RcAYDQQI576AiB/HbLwiCt
	BeSq2NE+MlRxu913/c3E1DTxFfGOC19VvBKppAKA8i8f7k2M8Q==
X-Received: by 2002:a17:90b:384d:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-396d0ec6bc1mr15703233a91.7.1787969466062;
        Fri, 28 Aug 2026 19:11:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm4848984a91.6.2026.08.28.19.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:11:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix vbus-supply for USB2 PHY
Date: Fri, 28 Aug 2026 19:11:03 -0700
Message-ID: <20260829021103.332384-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_191107_563193_7864E91F 
X-CRM114-Status: GOOD (  12.22  )
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

The usb-nop-xceiv binding and driver use "vbus-supply"; the driver
acquires the VBUS regulator via devm_regulator_get_exclusive("vbus")
(phy-generic.c). The stale "vbus-regulator" name is never read by
the driver and dtbs_check rejects it as an unknown property. Rename
the property so reg_5p0v_usb is honored.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b8576ca0de1c..9de9a8a4267c 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -140,7 +140,7 @@ fan2: j17-pwm {
 
 	usb2_phy: usb2-phy {
 		compatible = "usb-nop-xceiv";
-		vbus-regulator = <&reg_5p0v_usb>;
+		vbus-supply = <&reg_5p0v_usb>;
 	};
 
 	usb3_phy: usb3-phy {
-- 
2.55.0


