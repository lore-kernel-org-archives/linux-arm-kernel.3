Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F7EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=; b=KNAa0k5RhtQy7lVRD4rjd5djcw
	Pc5GZkl2L7S0sgMdgm+W5PKQJ1kRWVftp/Q+ImjjHvkZaqwfpQJR5rZjIiat++Jryxxs/WkJMxj1z
	jwg74sBCHFjpXgGIXaLYrZMlsBFeua3GpzEDjU2fzekoGopnENjEHUVLVgTN6SlpmwY0/rFbYTsF3
	35OVBqiWt3I1j2Dw2Wf7EzmI8ZyaDSOcvrgXw0YjWI02g1pEyeCbeBD5LLJWJe+Em31YaORYx1iLd
	4Eg8eeKoLNKCg3zmcJZopD+wqFrWHQ1AxRi4pBW3pc1hpbVALa91SwbwCqzbwlyhQYy+byHsvXi+0
	Xqcxk5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rGt-00000007lPg-22j7;
	Wed, 16 Apr 2025 01:08:59 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rA1-00000007jni-1qQW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:01:55 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4766cb762b6so2102201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765312; x=1745370112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=;
        b=YqGcbubdk1ah4flQK/ZQC9SckyzhZm7+oS7U7GpoQi8fv3r8SkKsEFN7ZKYUTTQZuN
         pNppGIqIdA/+2/MNWtrSVqw1VEJ92qh2SXQ5X0It8lE4a196UtpdFCO8gEhnoHOQM+5h
         koVphCDWQOFdHFGFyDxC6Yvuyg+V9uKx7MkDYlTfO6mvIeVE5e5+XdiC90JK77Yov+eR
         W0cCAQ4mqxZejdN856++jP+XXvnjLrpnfgFFDDYmkZz9nf6DkB/ni1OflUVlY/qq/jj7
         nk6zPtZa7OUMGxTlb0ITuUNseyHtu/aYVD7jgoDCCrvbsOGNslDD6wF32QIS6bkwc49A
         dGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765312; x=1745370112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=;
        b=gyTP8bt4ds6T49bJnTLyKYpbgJHfZ7LOujh/SWpSdwvN7ZrYXJQp6JMXO5y4IhxcOA
         W/4W027rRFX/xd20pakq3QA8pa2R6sl5KR1+V7+v3IBWZ9NDwwbZEMPZgeVJVTAPujwU
         k3Gxc+ea7uveHpOzE4pYuPLzfVJp6MpbkPJcrtO23R9u4hrUDj44Ghjc5bNVF+2mUP0T
         MEy2U3KLTa9fth2+yhiOEc2ltPPQCBV72XNz4I8AzcN+EoBSmiEMU289hH1uHnWyzcO5
         aCN6ruXjTNQCXBhAa0zHWeTXeHyiIhXydVvNy2ViwDBGS7uL1RsYbdlDj2Dj1haMhify
         h7nQ==
X-Gm-Message-State: AOJu0Yx/dmBmBDMp70FcptLBRcM4tLyJZRSS/MA1yUSKvA1m8sEqZ1Xg
	0qypQ6Y+TD2HaCLWVsTzWxduJ/XLPRqMKEhTT7VUxKDy8ijZ8d4zF2iikw==
X-Gm-Gg: ASbGncv1U6qRYnIkPvFwF5z5SSxSNme907m/OBPFKAbbfGFJ4Yhk9WnsmHWW9Y1ak0l
	08Mq6tDmywgP0Sssezo/WmJZIbtiiYO/YuM6HMtbyd+Ao08OHVHGIiP/hPSahaRUdrM90lHonfN
	kcMRrLaIAlhvlYGoz73gDvu4Ihl6WPGJ0EKxeAeSxnu0xlKFckd4AE05WTxqp+GzjI1LLUAHMmo
	Z07rhr4hGRV0ECLpac/JKPXnclND/wfo1jgf9W0+unXFqUkHhFfNqXIsmTAwG+5kzuaJ6lELty0
	zgK6F78cuKMHMP5umkKu0x3hjfyc+A6Ku8Me/QudX5oVy/5EgLeDOaWp0L3jnE7tBj/A5l+u8sm
	OkLp5isRIXlYWZMQ=
X-Google-Smtp-Source: AGHT+IFVbV/PtUyWDy5dJ4ZAzRjnbBQX/ZzVFdzXITZAv6qMqnv4IbtGbczYUR/sIYzqBUBHsjPsVA==
X-Received: by 2002:a05:622a:355:b0:476:5fd5:4dea with SMTP id d75a77b69052e-479ff080e97mr80895381cf.5.1744765311578;
        Tue, 15 Apr 2025 18:01:51 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:50 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/10] arm64: dts: imx8mp-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:29 -0500
Message-ID: <20250416010141.1785841-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180153_476571_473E8ABA 
X-CRM114-Status: GOOD (  10.87  )
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

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 15f7ab58db36..88561df70d03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,6 +257,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


