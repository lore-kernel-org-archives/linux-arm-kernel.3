Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10967C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxRo8SI92NrIJkPLXL6SLhpmiCKCo8TNk+32dpKenYo=; b=k9qjzWN89WB3a8f/OYmSRkWmiX
	2pW6Ed4nVfCnorIp43IPyayHCo8XP9F2i6Oh5/6A0uUtoiDqDYwoSSSh5zYhIweL1T/hevAbcBqBT
	syFCD8610Mn37c4LU0X77cnDeABm7geySVpo9MOfpQv5LVTtqrzJaVRA9e3i5Ij6VFD+GB8gLPaxU
	VGdPi+Tiub6Uuve/9xSKv744B2OuElYIJAu4kDuZ84JsJksP0i6o82CP6ecLehSNyOEs9/lWkP6hf
	HTlYoSnsY8njQcVuFO/oe3Sj/dTEFrsarYpJps6G1agVQ+Y7kqVunkORALnznSunj3r/BKJ3G2j+D
	dcDOc3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyeM-0000000DUNv-1pOk;
	Sun, 28 Jun 2026 23:10:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyeK-0000000DUNV-16Cl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:10:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c6bb8a5980so21080505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782688251; x=1783293051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxRo8SI92NrIJkPLXL6SLhpmiCKCo8TNk+32dpKenYo=;
        b=HLCYB0nyUrNSTEJZHlmQmZFqh5x9syuMlbhJGrLJCfvGm7lemezbi4mqjjm4iB50xF
         Bxzf1kKhdjpo7n0vDgVRpLOM/+00OoBTpi5luLwW4YF/f1IaighLrf6k6PGL8fiaLenX
         Z1TMpsY9oo8U2QoYLfXCsYp1HSyo46WbpRrA4y0e75zalq2h6tJUKSP5di4fUwFHfUpR
         e9vOzy09iOnVpAYMeEXkY/LWXQ4zgkG5ji54wLLQlN6aDr06l+uioVP7MqAtZjhVj/X+
         k4XuXrXrKlTK4yLHCMg3Xsw6llZBRG3ueiGcPHuyVScpGIRhlJZVHbsbrLiW7Vv7LLhh
         IG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782688251; x=1783293051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxRo8SI92NrIJkPLXL6SLhpmiCKCo8TNk+32dpKenYo=;
        b=EvyaQRsETzvwcGoDMp8op3mbZ1WNOvK+dIhf01Ysnyn5Ql3sjomsGRkBKLsS0L/e4f
         jMQ/FcmGcfuWTm1fX8BXmwu61NJYMmJ/jZFW54b59vRBfHoCJrfVgk/7LkXuwnT4MizB
         aeal5omZflxDjKBmW36ithPwRh+YqBLRl3Z0wE8FoJw2pNc3B4Ek/u3ERqV/uwNB0iQW
         EsJKqXP6bCrBgzVwuVjvOrlKxVYApCsS9WzcrhK0U2CsHE+MJh3AYeCOezGo0YJ1toVg
         7Iw4tOa7HLgBIi3ozbC+HU7+eut/TWByHY5Dci0AsYdy+nTv/NVRocvvR38UsKy++Qf2
         seFw==
X-Forwarded-Encrypted: i=1; AHgh+Ro25AgY4bfErKI+Js3K0OwAMkvWHYRKnrJngaHdC0mwjImj46GLnoYFjo8RbTzla2pglXJLA2rq2jbdWgF9SR0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcf3xZany2oi8a9huH/Hm5MGUivv/iO5J1elfo4Pzv6pI6Mlyb
	ltcVPJxs29zV4KDoXD6Qf5xfAkJ3X40353M0ekGVv1HHzDMJdVfYdBmR
X-Gm-Gg: AfdE7clYf7fM7Siy2v3pOGmYIPSLihltymr1KKLKYy6ZmGhPFgJhUCZRSQGrwLAFDHm
	MOFUAlMADm/kCwzxxvQZXU11Bbvx7TaiRcCxKpd5BasNIFyr5nOcBquqT7s6Xgiel7deIwBOwfs
	+18kcd0bO1en37EN+8NPCcYd0ddKgZpD9npD2NWIxWXj7wEy3jOloof5HbbQiIes1cv/CyNBKXk
	M1UtZbl5+LPOUK85TWlhKHdQ1vNhz8nxdneiysVhovs4+WgTZg7uddcEcJnAIl3iHCkxFnhVkmt
	/Iyfhdwm19AwX5IvspFA3SXY81C1G8DvVfeMTqvfU5UcZP0XWIbd2rlE2P7eHQA4KvMkD1QVSdY
	psTQEkSr2LIuP+kMp7/JkPY0y+Ikj6cwEhFeARmryc2BdBDwT23DzBclxOIqfa4obAWA2syxwmT
	+EvuYuye34x6bI80IX/YCd3V1sUkLb9u8fRptwZY+OFyDH5VazMP5MuDLD0IHua1UZvPxSVrpnD
	ltDeEuo1KGwvOvEC24f
X-Received: by 2002:a17:903:22c4:b0:2c9:c6f3:457a with SMTP id d9443c01a7336-2c9c6f3463dmr42101555ad.31.1782688251186;
        Sun, 28 Jun 2026 16:10:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9dbe5c5b6sm19461565ad.65.2026.06.28.16.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:10:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
Date: Sun, 28 Jun 2026 16:10:49 -0700
Message-ID: <20260628231049.1248899-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_161052_324613_86CFF4A5 
X-CRM114-Status: GOOD (  11.24  )
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

Fixes:

[ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_nvram_probe+0x400/0x480
[ 0.182159] Unexpected (big) NVRAM size: 1056112 B

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index af411679a14a..37593e7582ba 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -26,7 +26,7 @@ memory@0 {
 
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
-		reg = <0x1c080000 0x180000>;
+		reg = <0x1c080000 0x100000>;
 
 		et2macaddr: et2macaddr {
 			#nvmem-cell-cells = <1>;
-- 
2.54.0


