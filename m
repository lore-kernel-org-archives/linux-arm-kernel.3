Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40156C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3QOegBrxpOQoOf5XBMAtesiyJaIZB0qfo5JK8U5SZE=; b=lIv7nh7qGTofl7z957NznmQDbs
	o6QuW6O5e8M7mI8a9CzeqEmh3mO6hNVbMCxfgai7WgcEFyI68kxAkmwGiaVZfSwwt6GRejYout1Dl
	uDdncKnWCQjFGAFP3EZPxDdyP9fg7ZttIyrBtce/Bs6OuIRqwamN8gpNvS9krRaGMU5Oh3U+SlyU8
	2QxxGiO6ywpD1hChWbZydQCb5C9oFwmNE//cRTsxoNcUAZZurVHdweeq/fhKqqDyOzJpirAmp/JFx
	PswyHauR1neDLV4H1PYOHI2m/8EqW2rJ0afW4HlAevgIHGd6KqCdfqtB4MSMVvnND1Ik6q42PcD9A
	gHLZ5Qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPI5-00000008biw-3eHT;
	Fri, 07 Aug 2026 18:27:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPI3-00000008bhp-1BeC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:27:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47de008b020so1501870f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127249; x=1786732049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3QOegBrxpOQoOf5XBMAtesiyJaIZB0qfo5JK8U5SZE=;
        b=SC5xPCGOeteQcCH3ZgARZ6lvsrUdcTNGYJICUMct2zPhQHdhJoPcU9sIpALFP5pZyJ
         NisRWLP1SnTFCBmdpu5phxmTI+REvCP2WmXR0LcHH/oWBoOtYTEInoDJ9XEb74tL/C8s
         nM0hFhMOvi9BdFMTH9skz03pApXijcRa9O/Y1uVr2/41SsGGGfUVwmhksamwyXhT5dv9
         NFwyG/3A3X1QLcUXWH3uORAiRFBjYqNxkfYFEJ9lfwqlouXFu4uAUE8MWcY5dmiRbu1J
         w+c0boksAwZ7q4D3jtA4b/3rP8gZI3GtDV76vI/NFMqsrfujh6UHvH1fQx0EQOmU1VpC
         ndQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127249; x=1786732049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3QOegBrxpOQoOf5XBMAtesiyJaIZB0qfo5JK8U5SZE=;
        b=bKv4aPAiD2NhIDHE42Vl1Xe85R/yb+6alOOgIjmQpJh3Cx0SGo1ZUc3WzQK0Temp3r
         33y6uxWACq91Bf7enraU2g+wVGf+id/MYbFv2hVjlTalrYf5Wp2EJMPtmCE4YNN8UqP0
         zuHJ0eoKSOnIgEYfHVrw9U6X2iowu9FS6MJCFrfd3R3fQlv3WU32xW7zjNNc8Virho9k
         e68tQ83v2LSS5nyhd4sJRZWWmtldhBg9ESGadgai7c0S9YiXiOZaAWGX8sS6nc4OtwI8
         LYLQkOuoWdr7xKmSnoNF7tA7MO+mFk7R2rwniG252iZfACP/JQtdy3shuNgzT2lTZ+HR
         D/qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm/pcjfAerlwJ11s3JWly3V42IWn//IlnXigRcmhYzvWxxLOzpJ/OMASemk076lfIv3pXztExeQoD4/Kol27di@lists.infradead.org
X-Gm-Message-State: AOJu0YxCuXF9i227wAu2S+7KASTt4+8FCq9lxIG6JGsMJLB9qEQgOCLo
	SGtJ1cIUSS7w/4IwRwxOeATMMouOooOmd8YyYTJaS+KSzWQpPuvp9ZPZ
X-Gm-Gg: AR+sD13rKDzZW/K5yBlGe43QNea2b/EC7t9opFbobSC1+pE4XcwasG2clCEcrSinlWT
	creE2PeIoP8WGNDJouHoa5UijWO2MlZE+UNsN7oZZvqyFyVisNr50yOr2rJ0xxXf5AGF18rHS1A
	ET3Vymz1E2N0ZsGfjf6u1NbSTovYNtpJSgQ+bRNkSHe0WjsAZr2/ylpOsPzdbMpHXb/O3mad4qA
	mV6Q3t+oDrvwDA4DUNw2mnP9id4ZbpzXszRU09ncGoySl/ZAdrCvQgqagYWdCXfs0tG+w5xxRVB
	8fru28c3oubvXKNSuvaXM+v1SbVQjjt4nrXzjJ9pnK2eup3EUodc/LlGsGhnLz3rI/oRmF8wSLp
	j10yIsXDuciumEzEq7ZZBNmnHza20taTxweRYqOAvQCurwNq068xjt2ZSyBXEnCUuofIbMnYbbz
	+1R/LyiIXy8fu42BLJ09kvA2wc7iTytgfnaAISeUI02+uJmi4/pWpxQP21U6Q3LerkI0siGBfrO
	E86MF3Hwp/17OBKMfwL7iqjTlXyEQQm1QUL7P2O72ilxssIzfvDIQEbsR2EDrHeOvGaKXX+oTs=
X-Received: by 2002:a05:6000:2889:b0:47f:90f1:68c8 with SMTP id ffacd0b85a97d-48131915e4cmr788570f8f.1.1786127249329;
        Fri, 07 Aug 2026 11:27:29 -0700 (PDT)
Received: from localhost.localdomain ([176.222.12.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm8543886f8f.20.2026.08.07.11.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:27:29 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	andrew@lunn.ch,
	chunfan.chen@gmail.com
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	peddolla.reddy@oss.qualcomm.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v3 2/2] ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint
Date: Fri,  7 Aug 2026 21:21:24 +0300
Message-ID: <20260807182124.41572-2-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807182124.41572-1-gvalkov@gmail.com>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_112731_334873_29D82643 
X-CRM114-Status: GOOD (  13.68  )
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
preventing use of 5 GHz and DFS channels. This also affects phy0.

Add a device-tree flag marvell,ignore-regulatory-hint to the WRT3200ACM
device-tree, which signals mwifiex to ignore an incorrect regulatory hint
in the ROM, so userspace can set the correct platform regulatory domain.
The radios in WRT3200ACM/WRT32x are locked to the hard-coded configuration
for which they are certified, so the only impact is that the region
conflict is avoided and the 5 GHz radios can be used.

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..6e283e223ca4 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -14,6 +14,7 @@ / {
 	model = "Linksys WRT3200ACM";
 	compatible = "linksys,rango", "linksys,armada385", "marvell,armada385",
 		     "marvell,armada380";
+	marvell,ignore-regulatory-hint;
 };
 
 &expander0 {
-- 
2.55.0


