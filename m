Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5CACA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzDPwdTWpO5ZbTCsgd4c1T4UGDt9Zw6rdnE0VuNn8PQ=; b=bNi7nh0HR3+PqN+xgZxGF3Li+r
	fx7bAudfnDmnOpMRfN6C7dMpZo2oMKy+J/lso+dtQSuw+ihQR7e22LlWZWE+r/2+d/2tERBydQXj2
	Q91KaP59oyWbPd8QoeJMz7BeoluCoQ4i8ibSluF1D+tACb742kT+nti2X49bSDBD6oZ0ZmLWLPztx
	5H8q6MwQi7UDyUc/EVFcW+tr77dMUNE+Z6gWGtq4ctgQETckIKsAUtNcKl+YIJz+HyfvEFVwsz7BL
	rZ4574CzxWC1dC9TinNRxSKYb2n2ETHSjNaMI2/Te+BpfYlypBZDL/ozSTolb4pRjzWa0OPNQu4nB
	SqU7toHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqci-0000000F1Vw-0mLp;
	Wed, 20 Aug 2025 21:45:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomS7-0000000EVzD-1J5u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:18:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so650485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710302; x=1756315102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzDPwdTWpO5ZbTCsgd4c1T4UGDt9Zw6rdnE0VuNn8PQ=;
        b=I+6RnKi3UwJjb0Rk2HhDqscis4lb/rUnfRoFdZIb2X5j48yqF79p9QZ4jOgY3PTP+X
         nECfFnRlsWRBF+Xh12RZz/yQOL0JZoO9Ic/mhaO3Eh/Ijm7y+/XGgmBD48QG7wTwK/pn
         T/Tof0NzzoJ7Z4RmFSpux0ReNGBGQBHxAGBBaCPq2NJS2MEXxLyhAZl3mNwCydCfeenr
         tM1xGDHthkOSTbngztoFn6cj2atD82BFaTgXgnOEh0GRDhvQ7py6fqJybPeqc3QZNG/W
         y9gnYaK5Rsjb95+FIoDGBiLw4KRaAWVsEClCSbkdjhv95ZC21eHs3/PzyZt6JrSiBMCE
         k46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710302; x=1756315102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzDPwdTWpO5ZbTCsgd4c1T4UGDt9Zw6rdnE0VuNn8PQ=;
        b=HOP4ZbwmpRMqJV/tE1LZJaEKUWFL7kTvYD14OIC2f1K9mlKpZjXGmPWWA+QbOEwMFs
         DVKaLBN0Clgm1YueVz3w7tNB9gFp3TM5ingNiOsJwpSEoIvE5x2exUHT73XC0zP8m2gD
         XNk9G10VV19TDVweKDNkY0yNF5lO6taKE3RefPpfWuNSUjYqtldBzCxyAquVFDZNxZQE
         UjcgfZgyi5bPROSHqC/oiD6X9gOk09mtiZM4d0rZkdVBPmHkrqPx0EHSa29gbWY3y37S
         zgEDkLrcrCp/JLFvZ65zKp79mZ0Z1VqQPW7Qv8c7i+zsmcTa+lZztrb5dCnOSNmymJOG
         cTcg==
X-Forwarded-Encrypted: i=1; AJvYcCU1tI3B2SmkVQmgZTOo8/D68EsARojFUejKVd79ZINxwe9mNvOySzAwE5girhUbuZ1TdiSHYwJVMmr19/bZTVGc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcfhx2pBCmNDDrgmzJBVTfFJgais+OkbcayerlBk3ljxMkpmXg
	0to1P61mUAJzQO2fBzPIBGVi52y0rUhd3ytkWCh5sSeUD+9pqFuv7eLL
X-Gm-Gg: ASbGncsJfGmLQ/JZ3Xt4PX2sI+D80LkVBtxmvkxKswmD/g8W53ESljipP/+70GySG9v
	RYzTNFxUzocdVut/YeT444nz/qAsZIHXiQP2dW44jVuoMyaYSV3Dy8E3qyr7utvvnuqAoQWopBj
	ILTQYXxgrlAGasd7aOMRcaKfa9/egpQDsjABQnbhE06fBrg4T4werXBR/sHrCjMCjwApHQL+j5+
	XZDFGDtsLsZhgKfz+yWhG8l25gSaMjPXIoc0vUb0H0w7Yyup5B3ACX3WovOMUR2Hh+0Ro0EGRUM
	XX3EoFVE8VrA+AjdMkaMY3fXHwQs6O9T8b/0BeaDYJUVOXytCjs5euKKBHGeoIFrWbGknaLvlOj
	moNGaUXWOkPOZMczoS8BLRcrw0ejrpEPx7Q0VqJsLieouPKTvrrU2F1zTw953IxfyyjKNS8yvkQ
	==
X-Google-Smtp-Source: AGHT+IHYnbTTvJ9VaG8T3IJeOXv3Sk/I0X02h6sdPumKCz2EeqrzQR9k5qKRYE+FZM6PFYFvfAYa6Q==
X-Received: by 2002:a05:600c:358a:b0:45b:47e1:ef78 with SMTP id 5b1f17b1804b1-45b4c73481bmr2241815e9.35.1755710301634;
        Wed, 20 Aug 2025 10:18:21 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/11] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
Date: Wed, 20 Aug 2025 18:17:58 +0100
Message-ID: <20250820171812.402519-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101823_351634_1DC4FD5E 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7cf21ca6a860..110142ab2f82 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1643,6 +1643,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
+CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
2.43.0


