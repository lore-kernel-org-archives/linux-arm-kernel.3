Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0D4CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=; b=FwkdN3d5FGuXcEZnNomTNItpIF
	PNs74UBXms/OlSa0BG/mJinYllvWV8GYBLbSTVIYUG+j0tjGUvpuk1xLHGN38QbtRrH5K5Q1MDAd7
	iYFNvpRNIqJOubimDmdU8yQ0SKGqrr6jUZIYUtyNXwmMeS8c698vhY96Vvk/303jpFZEA7LVraocJ
	gBCd3Z2OybrpLdPCDbCuVn387LC3JkLpeAtehk6IDtrgplZeM+ClqsEWGc88v3C1Q96TyqHhw/Q67
	C0oid/SYA6CKHrQ9c5sjmRMrOWCotte9x54Xf1vefEUpKHnpzQ8HyvFAiHfmILHyzAKb+oqXk0ChW
	p74HeI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVs-0000000Gnom-1uh4;
	Wed, 17 Jun 2026 07:16:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVq-0000000GnmT-2HHO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c8585ecdd71so1733029a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680597; x=1782285397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=;
        b=gPlDr/s8Kgc4uUCgdjOqEBsOaI2UwTAdG+H4RoVqIKvepPfbyG9fsGGgQuN241N3nD
         Toon/n+O935MPsizDt+LqIBpPHcd7jTX4MnnOvM0QrwPjgQgTAuwhWRfP1vKDh4TSDXT
         ySQs0pi83/Q0s9NTfAhm/gdMjwOA3QCc4KB+uGqxACB4OG46mQoKpwXaULwhgEhfIBqZ
         ODCdxrJ6gKj8e5DAIVNct9LlDCcSWwAFHc0JO+yLg2rCg4gbBs/NwqGJGcSGHzQ3HgDt
         4JoW2m1oPiov6Kp/rGe12ROFBkylxXnqlL1TqrlPpOS0Gfqs27aPF0ajwigf/hEX19bn
         kR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680597; x=1782285397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=;
        b=oAuZ50pUapzoc/7K7vs2WaN/yNlkZCF0hmzNMTVmYZbIL54f5/S4+vlTzLVOwj+FZX
         kYX2zS13IpGDZMpQmOFrXAf2aiUIyVidDv4JB246Cpwcwl0E/MOCFstpapFAQyohaP0W
         t3PcMd5W9U2mJoykR6TtuvvZUgHQVmWNSK5KdiqIz+vZwC+5R0kFyN957ZXDNACAtWTu
         i2gnxT596azYkz7eL/N3lbLS8lFbuL6XJdnHV13fQepgS63tdgh1RX5YFFi6tqeULjOY
         oCUIjQ1hGGXfvqNKM5kpli/TtBRdcf19lbC71kXQOJIQtGm4Ul9618TGdQDpmBwWakij
         W6Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+ipwJMadUENK8blU8SbgOPf/FwZeRoUlYZpLcLH/haxtpOg48afo9LfGjjoWyLCVldR1gOjh12N5vDXP8CV4Qb@lists.infradead.org
X-Gm-Message-State: AOJu0YyalS3bU3YbhtiaZuxBLNA6Pie5bjpAcdERtgUCbx0ppgfR+/OX
	i5mGEc3nSJNPV7E0Qn8UXm09kC7xqe7beYI2Bl2wO9HvNuLUeOd9JwdT
X-Gm-Gg: Acq92OE5uhFacHzfd6lmcMnv7Y38GeVyVBDvnEpYV86qHjhGUjNI08CBLZyMi2UH9lN
	CItkGiB9aj1E70NUePuU4lKrsa8HURTqBDv61tHdffOl3QtqcBiEDh8x2Fbi2X4J3kZiOLsZur4
	3ydIkBhZfjYBXE/7uC2nQpraOg59Ssa4xvWvcM9IkMgvaP/3M4f/umt0J4/qFStdz0mKX2GmDg4
	ny33djs+axJnSKLaY2nAEVVcmkzuyeAew1mQd51GmnBwGLLjGSzWEoIoJsT90CxsMhoXXHVqyDM
	I5+x1ehCwaI1/jf3bphrzzTTaAQX+qqEuplfUoSqRKZRqvD49XkYyUnS/0rsdueDUoyVvC2ZE2I
	FuiPikaAwFK2AfcWs4ofO+RHmoCMMeNyRQHrZ9ZDXcB0XqzCpHjP1P7x1L6yKWwbUw08ttRGFZ5
	038epH8lI/Bw==
X-Received: by 2002:a05:6a21:6315:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3b8bc376001mr2966185637.2.1781680597498;
        Wed, 17 Jun 2026 00:16:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 17 Jun 2026 15:15:58 +0800
Message-ID: <20260617071604.635627-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001638_576369_E01E1FE4 
X-CRM114-Status: GOOD (  10.85  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


