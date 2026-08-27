Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4FBC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=; b=nQ5M075DPB83b6CbKOAOV3m8F5
	HnZ4M9p3oEvB/kCoIguJFuinS9ZK4Z0n8xdAz0fzhnlLlUGckiYadXruQudyziESTW1Upzt7qrIYi
	/w59BsJ9B0+MTtRyUGLCtUse6Teso08YtG2l6cTk6ezESY35o+Iqy6MsusqkBHNQZXhntT7r7m7Xp
	rtAUwc7EciIVf6dtVZEVOskJLXnX3l47hD+wiyuKqpIwNZx3dci+DIPvyzuWpghwmLxG9oHDXRnop
	mVYt60yqla74ff1JOu/B/RMV430iZKr40A1xD4ygIFze50wsPWND1P17AGjmlfIyfKvi1bc7urkVG
	QFzwRccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdlm-00000004Rup-210C;
	Thu, 27 Aug 2026 17:20:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdlh-00000004RsQ-0Pzk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:20:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so15621785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851199; x=1788455999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=Xn2XDB/aVtNrhRtrnFggMLDl1fBlbAXPHoc8KI8XH6iOsxGF8ddl4bKfXU6qe/Zex0
         nTbrNVhYQ0YCfcODFoZckWMO3XAzUOR245SBXHGOBks2xLBG4fiRYa4fhY0vlXSirCW0
         sS8172qYukFGU9pIbMa7yrg7ttLjpiKaWBQ8GMcfRjPQqzy0jrZIlNJRtef0gkOx64QQ
         3rw+XtsBYORWBfAEvtH4u7SnfFA5mTKrRcl+XEUbYFvj2mGMeoAFD3u3LFLEHnMrzbd+
         k/MP0b5gn5XhyUUoYHqWs9ddeelWssMcubN2cFjODeJrourLwgefbofv6WVWX3+YAfMB
         r7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851199; x=1788455999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QF2zBpTs1xbQ8vVeDBrFP8mtx1WkUete3RSSn/zfKZ4=;
        b=CvrTlkjnDSOjiPspToPSe6nvMdUzyqm184kyVUbaFIQoyQlVp+/88xncEs0tX66HR2
         P0cC9uqshvFwl8iWtJBbCic/4TBgVTUsjKMzQ6WFr2+RnazfemJJzH9x8jOigNTw9gQG
         Ug2uJH+5Hfw1BjUaX6pJ5/8nIYu4PvGY4evX6cNZbyGi4+wWhXvRYaE9H2uuSqIK1cDN
         DHmwGf/tD0q3LQBCx2WVkq2TsO/7K8YhZuCvYUPeVcusrVWdST2aIrn3gPcNGSe/idRs
         dvzCv4CEjfdG+zRslAIGYkiv3VqUxPZPT9tmrBuIFQPa0rrbcA1+H4YkqF1MxiGT/m2W
         a5gQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAq+J3QVCbL7wepUNdB+NzrFVk/6FDH0IG9oBESETQMFlzVP8cHvzzxwCWU0dkrBVVTr6x9L3dexPvzuJu2yS5@lists.infradead.org
X-Gm-Message-State: AFuF++kiAaNhT/a0sOv0XkCPAbTLCD3msPFi+Zxj5Ydc1JGvNosJ2XBm
	4oFDsKgyO378msRHZr0cen44TdrUVpzUB/JEWb8JEPuAP9q4e+NHobxb
X-Gm-Gg: AR+sD11gy+fawl03+nppG3j3DOsQcrb4p7xWR66Jipj1ytYZ4bmuOFq9ErNwCzxkoay
	llyZnS1CtB0j9i/+YIkYD6uFdNz4wBSYAG1+81o1OMEaWGvmM+OOt38PpsX5eRua9sHX49DdGJt
	1RMBxjSJ4jNHXu3tM7M8KMtQWt17oh9CjSuSqCQwotuP7Ray+dc6A/XrLZbVxbbP0C9CxooaNyD
	NXHforKhzzntfrsX5h9S3RnoR+2nAvJkMJsRe+QRhP6WpX7PIce0jRdFoK6pHb3nDfqJ2l5/I7y
	KMjY6Hl/h6LcZHZ1S/MsybIffJBvF7dd2AaKLiBwJrsngj4m79QEr1AawpBnFxYK7DR+EDc4OS1
	fpVf9c56kl+pO2rPCRJyNs2xHq4dopJxOMGejaterzUsycdnm0hosk+XBtJSDoaaHuPBYodWv9C
	ixpZ7fNJDGtqRU9M/3i2QpWr/2sYBnFTbRdLiGmjvDYDdYenz8cVMUISa+55b58dOfOUdT3oj2F
	MRe7NVQhWomANb2vWLpoE3IqqIzX0I77lR3rnqZPaNYpwh/9eN7UuFSIJQLHeQ9
X-Received: by 2002:a05:600c:c493:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49b91c20914mr7700005e9.3.1787851199182;
        Thu, 27 Aug 2026 10:19:59 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ad16262sm54259995e9.11.2026.08.27.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:19:58 -0700 (PDT)
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
Subject: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:19:37 +0300
Message-ID: <20260827171937.28878-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827171937.28878-1-gvalkov@gmail.com>
References: <20260827171937.28878-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_102001_370931_462B1530 
X-CRM114-Status: GOOD (  14.79  )
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


