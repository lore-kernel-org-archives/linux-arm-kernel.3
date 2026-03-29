Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12543F3D600
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=; b=2NkuXcm35dv6vrFfvl6+DB0CCe
	l8l8HPIUEcGdi6i9mgBWZbmq/hos5YrsOULGqv+Y9CnE9Sqh9tiyQwrWtfXfJpf4ev8X1zpi4WInH
	m9UkGXeDQTdKjLsVE63JvSDrRiqTNXYcGcOOA9uVhi4/+zyLo6Y0Ux0e+5SLxz62OcoliuFUTMKpO
	1QQSH6/2pmOLykzvPCpnmzdKlQ9iUSkrPRQs+DaFrtm8w6X+NrUhSkDpBpy8qf2S+41gn2JHZRn0o
	aML+qqdnJPzOeDHro/KMR+XHJYtcjV/1x8/eMfWqcRAhs7+cyD+5AAv8PeC7IfQaTYfEEgKwSpmzw
	MvNQgI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMQ-00000009v11-0P8K;
	Sun, 29 Mar 2026 12:35:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMO-00000009uzr-2Byi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:35:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a871daa98fso27889145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787720; x=1775392520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=;
        b=V2F1fD4D4SnUmQyHWNWIDssuzRnFf1NvRPNgjEs68KWuhi5lpWph9e4GWbRLN4URj1
         LjTTZaPTtYfciBPqgOtFfjAJeuYDN1mQfYOJHOKRZu7IFz4taIcqccr/zW+mHk9Bprr0
         eudsHErQDUxfHqUjpRmuuuOyyF4o9IlZTNIEI3DIN9XVioadWy1EILMBVz+4NLITazAt
         YvPso1M6thZjF/ST0TEciNmeRz5jJdQiBUpMqlvG5mfJxPIVZuMicCHCetngNB/Dz/bI
         gEm9TwVGfyfA0z7Z+onIBeYHXLEJqetTG6z58jqJ+3uriHu3rWbhr4RE6mzpBchTYxJB
         3IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787720; x=1775392520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=;
        b=krtl9AEpxdap1sNy9eSGDt/Kd0uL0XiTGlhDPekVwwBQPvLg6Q5/w0yv0wvNRciZMm
         tZ2F3y/bnzsfpDrNHcBtXphzoAu6KEJVpBVHNanOkttoZ1rS75V03BBfRKowGHz0cO7w
         u+oBPwGmPhGKBBMbtVhZXcHdyDw26kLrOPmomU4Z+a7s5VJ11xYof+ypbxq4tmq1n2tv
         AI2nDgL54NcYqR/y7v5fY18Mpc+Wui7nv2xDhEa+QKBAeAjn0wXCk5U5mxiHcn2KCh8+
         3PHC/cRSj2ue4LPcZgLzq7xELxbKlgdbQD+9kHtJyDB1HGNyYQ6PRfZxJjIDPwD7oWP5
         PMsw==
X-Forwarded-Encrypted: i=1; AJvYcCXw3ThGXYTyNCVPJeSD4xQja1Y7hBiLHz8bJzhcmOtJzBlhnfp7Rrxvo1yQSZlObRLpj/M0uOn7v0dxPm9k39x/@lists.infradead.org
X-Gm-Message-State: AOJu0YxEPITzbI+8/CgsBux3xeOStP+9TGOwAjCYI1xZLHlmFpg+AAKj
	GhxDbg3cfOwSEIotVMN8IgXgBKPRHYbF5L2y+xkzcD75Og+m6sob6f7Z
X-Gm-Gg: ATEYQzxRn9HAfyRibriQHMAzR3c7N98tX/QscWYrxwynkMv7uiHPybAoI7AgVtFCroT
	O7b8YR1RInc3Dj1qWFDj03seE5M6uKxQuSF7e0ZQ3ucI4BN6F7Hly/24dlUnwk6KZCu3pWO+XAp
	7+pKmXf9lsqio18oPtm+3xqXHq8VCLCQ79Tk6yLTAGVHD01KpUagprB9NiC09shy/Z9hsO/Skpn
	b8PxvqcPmVQAWz/FXYATA6XflayfPcOB4PFpl0w86zSOgBoAcaWpid+xz95+GGTc7ZRZ/dYp+TS
	BsUu/eEB6fkrWLK2DbcrihK/3+wtWksb7mS+fcqZjUqWrp5GMXVhYdlp5Unb33aAYkOyhmmY2C0
	RBYOSzBNKb4bftCXPHOX4z8htCqA5V5YUVhIkE8JYhDfn4ZhgKNZ7BZcZ6vsQBA1sGUJs5kslZn
	VBEHHotqpbbUPNvqTQW+vFdpETu09C3CfHk2S4+oaadHPbiMIOUWbTDIUidFMQ8eb/LlrjcyQkS
	L8=
X-Received: by 2002:a17:903:1a67:b0:2b2:51e8:2c20 with SMTP id d9443c01a7336-2b251e831bemr6342265ad.21.1774787719650;
        Sun, 29 Mar 2026 05:35:19 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:19 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v3 2/2] ARM: dts: st: spear: remove undocumented thermal_flags property
Date: Sun, 29 Mar 2026 18:04:44 +0530
Message-ID: <20260329123449.309814-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_053520_565936_7150729E 
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

spear13xx.dtsi defines a thermal_flags property in spear thermal sensor
node which is both unused in kernel and undocumented in spear thermal
sensor's binding.

There were no dtbs_check warnings associated with this property as the
underlying spear thermal binding was not converted to DTSchema.

Most likely st,thermal-flags is a misspelling of thermal_flags in
spear13xx.dtsi. Since both st/spear1310.dtsi and st/spear1340.dtsi
define st,thermal-flags property in spear thermal sensor node, we can
safely remove this property from spear13xx.dtsi.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v2:
- Reword the commit message and subject to correct explanation in patch 2
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..0bb88f2d4ef5 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,6 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0


