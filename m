Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A391DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy+qb/ZkQcIV3HZAbLA2s/xGRr97lh54TOzRicHKOHk=; b=ckBd5hIuN21oT+TxoT7ggt7NLV
	TLOayAwE1H1ns8uay9kT28ylJhIm5BWueNAzEywdX/HV0H2+2vm5+IP/haHgisKpXUibSqWUESS8e
	s2j+197YIK6H8op56b1IqZzD47IxvZLfyokVlTs9hHwVbbX4t/8vn6mIAVzFG4plf8Ea82EtQmsMi
	wphEnlwifO4MIsnLD3a1Ys3zNc8BhDdxhlROmOA49rc+Nb1++wWfFnLZdIK00kMovsqVvEWmD+TJa
	mYc7VT0vE94kTQr4YxOPSCiChugSq+YeihtQVXevgg0Y1LktYd1AnfphUBsjIOSjfhWpb1BkIn2pb
	/kTGfKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUk-0000000DTWn-3iHD;
	Sun, 28 Jun 2026 23:00:58 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUa-0000000DTTb-3HNE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:00:49 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-139eea1aeb0so4174909c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687648; x=1783292448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy+qb/ZkQcIV3HZAbLA2s/xGRr97lh54TOzRicHKOHk=;
        b=FNmdLW8F27YrImODt1+/VOm2LaKwGs2xfAHQTldrQo62sAr6kZsnNWUnI9J/ivT115
         xfI1H2IV/5L0GiEj2hjUTtj4zzuYS0lDZt/NcShwUjLYdwbIvm9xOxBZuAMqxhFK9Jso
         NKgno15Igb52TGiPgNtxyDru6MbcqXQfC8s+k8fiYoMDhXj/WSKPajYqN+pRYT2kkonw
         OJ3O+6CzeXS1EV6VqusLiuihTp2KmjF2lPuhgBIDjWU5GiqggkYvxhNkwzICrCkpGqyh
         Ax/U61rmnBF/HwDTn2f9ESCivGJBU/G9LbLcClzfIgdKYHuFXpToudr89opxUjcexIjW
         Lgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687648; x=1783292448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fy+qb/ZkQcIV3HZAbLA2s/xGRr97lh54TOzRicHKOHk=;
        b=bL1CNvF+hHKqVAhhfMq/Fre9pqkxhBYjAi8uQf7U/JudTSVJtCkNWmhn/zrXJYd9oj
         jbamQhQBLE06SsZH9x8IP6b03R/zo7Uqk1Edr6TGZ+T4pTwZKOOBpgsL2GGV8rWETk5D
         2q2xow3ReEZNZghW3SJwp1KXcfmWuGMxh3gGQzOEz1q9i3W6/yDwg8eYvH3ex4meA0sL
         eRSy04BC953XRBb3PZl6/xnIkFJrROvltiwbvXbKdQOws77K4u1timNymuEaOC28e4D0
         teHVLuOx1IU5aMH00chk1D6aB0KYtKGG2h7BOTWeb5hFEXwBLvomtIbkivPBOgZlU2HF
         jFCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vV6qcOF5a8S7dOh4OTuvt4OrSyq/010a8Lx5b8mWufM62JNRaP4rkLaZxjE4VLx2dARoYk7I5ekInICbPVqij@lists.infradead.org
X-Gm-Message-State: AOJu0Yz85QJXRCr6IJeUBHB7L9VS/4P6ERRbSffJ4tVf5qtYXp7Vr17N
	CWGLuHAXx9OsR9DJQLSs8Ve/G9bDCVzfkuodhMqxD8QeBgGUc3ldf1ck
X-Gm-Gg: AfdE7cnDz3ee99AdCwOaIOkryz/RkDh7SnbkyNfdYNgIulHyolIq1KO2+vlJI02ue/x
	9zZ/eoqibWRZBNcP9eHSc4/Y25vw33SmQTb/W7qQNnSdA4yer5umsTzaI7DnKsxJZtGZfZTFz4b
	Ll3KORGFImz3BANV79jKymO8TcIStFR04I/ERnmMjLUBWsMPcan92x1+QyMj5poOOMtLUUuHljp
	7f5lRV/MZGFSPq4sr5467dptQ2nDiNO0+DmOgLfR6NMneupwwNXHz4M4CoCBdCcUPEUVr7mOdtY
	JOj5CEWvNFcTJuFye0vxVWFGdvTWlCfGEtkJhLUARK6O7Ix6mTDMUjBl4dEhLG+10JgdgjK939y
	mh8fx5txBS2NufAKzhVKIq8kLmjJoNfRqtoKgKKWu1TZtN2tXVi6B4MnFGj6UbE0k85UnY56jqH
	C/lrXwVHdeJO2gx88Emu/fwxSLTbejSYuCj5hoaXj7x8aplomu7Cipk6SUWLBtKnP6UcPUx8Z8z
	889/tss7A==
X-Received: by 2002:a05:7022:790:b0:139:ed59:4b7d with SMTP id a92af1059eb24-139ed594cafmr6888379c88.45.1782687648121;
        Sun, 28 Jun 2026 16:00:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:46 -0700 (PDT)
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
Subject: [PATCH 2/4] ARM: dts: helios4: add vcc-supply to GPIO expander
Date: Sun, 28 Jun 2026 16:00:40 -0700
Message-ID: <20260628230042.1204293-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628230042.1204293-1-rosenp@gmail.com>
References: <20260628230042.1204293-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160048_822417_4FA2F919 
X-CRM114-Status: GOOD (  10.34  )
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

The pca953x driver requests a 'vcc' supply, producing:
  pca953x 0-0020: supply vcc not found, using dummy regulator

The PCA9655 (PCA9555-compatible) expander is powered by the same
always-on 3.3V rail as the other I2C devices on the bus.  Add
vcc-supply = <&reg_3p3v> to silence the warning.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 05540b8012c2..cf0432a0e71a 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -169,6 +169,7 @@ expander0: gpio-expander@20 {
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
+					vcc-supply = <&reg_3p3v>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pca0_pins>;
 					interrupt-parent = <&gpio0>;
-- 
2.54.0


