Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E98FD8FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tnnm+dYZ95GHWrygSFjI8gwx36ZKSldeg1Xff84VKQE=; b=lx+fGMANp8U2HR7MTVQu+43ZQD
	Yw1R5bPHRKWPUPramhszC05pKCrsaNx1cqVSEySq2f3Cc0zyzHJpmXfrYlurGXaYfl/ug/16jJQSO
	4UHeVZ4xw1LDJjQXFhyoLVcGF0LNMvqKiGHv4x5g2+FiiNSDuwY7a03hMpYwzFdKCh3mi/pv19bTm
	hDROwqHiP9TWk2TvOOXVXwbhekVPoAzLmgvuEOtACE3g4CpG3sY9g8vHdk4QcDlhikXub2u0omqo+
	EPMWm0XO+6yHAXuavTIkg43LkoF/zoZ+PZcaIdIFm8dyXEhNNO9YcwJYWCQf6+XnXEMkd5H1urYw1
	lGuLECCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcq3-00000006ORm-1ygo;
	Thu, 26 Feb 2026 14:59:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcq0-00000006OQa-0zDo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:59:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48379a42f76so7961505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117974; x=1772722774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tnnm+dYZ95GHWrygSFjI8gwx36ZKSldeg1Xff84VKQE=;
        b=A/q2lchzmDrt2G+gXkSL4sdcd1ggGQgtKktwrFpfep9ixHTLgdi8OM+gGK0B+B0TML
         sh8tOMCyTphK0jpjJlYB7vCT8BID9w0mvQ2eaDCBTtnd3al5vUUF5uRWgL0C5z0VHuky
         cfIB2wCs3xIyO5ls0dlpTUVths+FYle1t/TloNmiYbtRyCnQmBajVFeG4NZRTvIdxX+y
         csGfR7DqQXxn6zyAym13V22du1iDrpkeQdpbcCUpzgJKxrSdCIBi4g97F88CyOIROgLr
         lu4/cbguzp9Ol4nNcWiNbFbBOhHdzsZ7mQcCNcJYHMH9BYERsnIeviNwxkuA+bqWl83t
         LDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117974; x=1772722774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tnnm+dYZ95GHWrygSFjI8gwx36ZKSldeg1Xff84VKQE=;
        b=svCaClZlU/Zi0xzk1SYaq1wQsROpRe1NpegJJXbpvwwwB4vC0/+n5bj8W36LFciGxl
         8zuLFNV6navMmOptGNcjS7JwTidxWv5wvX5IMNO/X9wqgUuVus2mnEhp7kkHNB8RiUnv
         7ze4i0mUf3uz3X0dqCREwCuJkNEqLOWBQM5Ldo0TGb44Px+GSoJooEyMvNTwp+NTmJrb
         Wb9aa+gKugXr/3IFqSqZJcF+nCV7MrXMcQ0Pzrz8SFOoAXLSthOZt+vbuwYNP2vWDwza
         vp1h9nOaBgH4AyJfKlJYA9hNd+fV9oAIEl2v27EjmkQuG8lppW6jRUYOsZ2CNn/uVCKj
         6WOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR2w7sOIuXVFRTK9r8Qdu3U73Z5iEjXPzQQFBQEw4m03yjR6PlQynYfJEsHUfOkhSFEt1XD8Qa3dWv81EYYQM2@lists.infradead.org
X-Gm-Message-State: AOJu0YwmiGrhtb4hMxcmIy81IFwT9Hohr12qKGwrihb4AhjcSx1A+W+k
	lTk4wg5mgT4iR3DZZaHSYpoLxxUFYWoW1E3xKg2KJ+SvEYgjbge8RU2d
X-Gm-Gg: ATEYQzzZfdzCg35SreZw7igbAVVMJ88JnDN32iFtqNPrY7rIe7fBDawbsKAEHKr3Yvj
	Px8zxDULq9v12YpfYOrHMKhOmyttQyhr+dKXg4/rR5M4lK2BfH/5a0/H2YNan21mAVErnduurQF
	2ibS+ALStq+GO2mFD1DutIZf0LwBqG45h5Ll490/Pwd11nlmNpB3bFyQUnoEjOrWUghvyzjRj7F
	OFLFMdIWexPK/IBvoW6wGpDaxHjzimYUXq1XLe/h/dDJWqaBiZZQDDdimmTlwKdK7FOjrxHh9Jd
	MTYk4iI5OvrdupaSM+kblLwidX2JCX0nXqdaefUQZdpJgdTvyQwNn/m157CB3rv9BCj6F0MkyoE
	QvgTWz9CV/qqZ+rrVblsVQ/GKjHC7jAn19qwQx0egExOWxVZw+/qEQTula0FuKixeaJhtyeAzyv
	/QJd+wG22HMa1lTmXGkJO9YEn+ZO2ns+wmf1Zo18lgcwzzshI9EDjcFS6VF9YEKHUDKAkS
X-Received: by 2002:a05:600c:a44:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-483c217e8a9mr93249395e9.15.1772117974116;
        Thu, 26 Feb 2026 06:59:34 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4766:6506:d16b:e2d5:7fdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm92018865e9.3.2026.02.26.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:59:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: rk3188-bqedison2qc: Use mount-matrix
Date: Thu, 26 Feb 2026 11:59:16 -0300
Message-Id: <20260226145916.2729492-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_065936_279142_0FABE54F 
X-CRM114-Status: GOOD (  11.98  )
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

'rotation-matrix' is not a valid property.

Use the documented 'mount-matrix' property instead.

This fixes the following dt-schema warning:

accelerometer@29 (st,lis3de): 'rotation-matrix' does not match any of the
regexes: '^pinctrl-[0-9]+$'

accelerometer@29 (st,lis3de): rotation-matrix:
b'1\x000\x000\x000\x00-1\x000\x000\x000\x001\x00' is not of type 'object',
'integer', 'array', 'boolean', 'null'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts b/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts
index edc2b7f9112d..b56095fc2441 100644
--- a/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts
+++ b/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts
@@ -262,7 +262,7 @@ lis3de: accelerometer@29 {
 		interrupts = <RK_PB7 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gsensor_int>;
-		rotation-matrix = "1", "0", "0",
+		mount-matrix = "1", "0", "0",
 				  "0", "-1", "0",
 				  "0", "0", "1";
 		vdd-supply = <&vcc_io>;
-- 
2.34.1


