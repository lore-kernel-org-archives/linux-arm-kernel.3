Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB373C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=; b=M9s4PUxEDmR+yIdCebjjFfbfyT
	YHDCP6qCkejSckuI7QfTosn2gaUVqijvekPQkNaXiW4KGQVW02LVNdQlz6qRzmsyrQtvtlC8PmiaT
	F6M4vu+BFq1bIc53eDvXM0qkg9ZFQrhx+4bEauDK5l9S9x9AJSSU/Obv35GFy+fVILzsSvWEv/Fgo
	LqwUSo80tj7Uixu1mhcjN2KODGbcXSTUo19MAtrHn/CG8iYe2njLkLzQhimnSZS73tU/DC6IYgy0l
	KUE4YQ488hh0XSGaMaOzNXeWuFZpXrx9ONx5xHh4fpBlzpM/EbDWYz4E5A73WGxygquOEmbeII4h/
	1OiHyuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZm3-00000004184-2K7S;
	Thu, 27 Aug 2026 13:04:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZlx-00000004169-1naL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:04:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495590dde14so19450315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835839; x=1788440639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=FGLa3kJRcy/04sj7vetLJD+0WKuAg9VX81f9pi4GkBnDKMCXlNRO1TeqqH9L5MOru1
         hi5szOTr/XSiXUGyktYamivrZ+M4soOD3bpvNb/Jd+3rk7wIt6E7KRN7vputBl3eSqEi
         +Vlpgoky3GFjQBR/xzuJGLui0O0T3IJi1P+ThK6I5CaMsIfHx9Sd6tZFGW5THAdSHuSQ
         6z/T76eiNQDZj4Wo6guk2UqgspSQn/CBcTlPHOcVvPBtOfJDtpTTV3bP/mL55fZ26SUP
         P8g+j3CE1onHtJ8hPhC+ZmqCHx4OvFUtNGsoJY+ExlomJqjZ/K8gzksWvvy7bKqb5UBr
         QRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835839; x=1788440639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=QeWNN8/XdMf8QjcFu2jQy+Ri1VYi5gKbkyvup9MM9lssrroYvB/LaFkbMIjcsdBDg0
         48FkXCDASFX8s5jtIPrdRNyNc+8ZISVteUJsOR497BgW5aWaAARW0MAKg+l4i1tjccJ2
         jHdAzuSIDdjvik2Jpi1jtw/niLv4mMkIc75FzcK2jDJDLy5gccgf1WZQmytBuQ8C/sHH
         b3ksBNAyk9p7LVxnj3CG0TDPzDOtl5bR2Pxn9RhZ0K+obNVc7oxogvt8mz0svi2+bgx3
         ZDQmm6PsVdDGPbKMrObRSEkS1Ic9Zx1nfcdipaKXhU4r3IFmZ7OFyZ8EvIgSFt29qqb3
         Dzig==
X-Forwarded-Encrypted: i=1; AHgh+Rp6lodPEWX36DeovmcnyRMCj3Stwh/t5Z71VWkvTRAhR2+Q46fjNLeAAEl9S591VPmQax+mKo3YRawlD0/OtftR@lists.infradead.org
X-Gm-Message-State: AFuF++lOmoHxUWCYvzmB2KjYbTiBkkCa95JbR0JdR8LjDvHf67f0qq8Y
	Y2U0b+7LC4vPUdBJtlQr9Kqpq3vhV9IIm1jvh2Ku048PQBIGpwi/ZD6S
X-Gm-Gg: AR+sD12E+w1FVeC8Gla6ous857rGSJwtj+Sf0pj1j7HT0xldcgDjrBCIQ7EVUx1u9p/
	4dGUzHeX8UrAcZLjtggQVr/A+0Z0v+nwT0QvuHZ+p00HpqQnDDj3QYP28ITpi657lUeYGi56Dp1
	UBwBj3vdY/jx1k61oNEIhDw1WHLF45w50PBRWpVx3f54FcX7h7eAWdmZ223YuMKLuTMpUtVp1SS
	z4CrwbWWuShf9/ET8fSDYMPt4Ransd8OVg5Z8YCsUDrSgxf+b+4CLP56H4IN+u8N3ibnl6qPBkc
	6hHPnxSE4LQA8nZ+0at67TThwrsisztymGa3OobsTBMqey8IPJwTa21k9E+gxGBxtYIT+QL1bWW
	XoXmwAwh0W5e35b7MLL9X+wyjcDl5m1sgyRwU9JCfwS88FehcDTjeyiFHbnjYem10XHlVlw0+c1
	oGZSKp2bBHY9tnWHrC6hqSShf78CtocB+k976ziFeGl2ot49e14bp9N+0/QG2eMqZKxCGxmW1ku
	aJYuVFORhfkkFOs+xKcWo6d62e9jCjY+XRmY3vUxI7LpQdQJDibN9EeMKOH6FFnlsixOPzTMq4=
X-Received: by 2002:a05:600c:4505:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499dc6e9935mr159659955e9.1.1787835839294;
        Thu, 27 Aug 2026 06:03:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:5a8:737:d4a7:e53b:30a6:3c0f:1dad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49610170sm116081285e9.6.2026.08.27.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:03:58 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v7 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 16:03:35 +0300
Message-ID: <20260827130335.6606-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827130335.6606-1-gvalkov@gmail.com>
References: <20260827130335.6606-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_060401_488374_A692C34B 
X-CRM114-Status: GOOD (  14.61  )
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

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
WRT3200ACM device-tree, which signals mwifiex that its regulatory
hint from ROM conflicts with the platform and should be ignored, so the
platform regulatory domain can be used. This does not allow the user to
change the regulatory config of any radio. It only allows phy0 to start
and operate according to its certified configuration. All radios in
WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
they are certified.

On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..2bf29981a031 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,invalid-reg-hint-in-rom;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0


