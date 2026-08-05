Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33BFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6fqphzLCLb0mLA33O2rb2yaxUz+K1JaPk2AB/U3hnI=; b=2EO4u7NVbm8IG/+RjKImxGO7by
	i2MRE5jtyMskkCHAn/aeko0yp1XkpiZjq1zsDEo1NBZaICGHnAblH+EYWH7Ixajuz4mujuimerfmN
	3bzANeNxaFB3rLOJizJ7njsacQ6N2G8w1EeywmJwU4+nya+cl7hMtUWQAbMBAo8EHGm58MIE0M0pJ
	w5k36d3E2a5dg6ART6Q7b5M3reQlWEd0qBBFOcE2iQd6RZ1nEndE0bd36w+ZjPbWk24VH/rYRs8nO
	jEOL/3ylVU18wOqt6lMocSpPOtCYLrFXMMr2HLtzpFto3UP/eensNUypAwWSXL2WfDZWE92J2lNiN
	ignFNyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgwv-00000004R0m-1ZNX;
	Wed, 05 Aug 2026 19:06:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgwt-00000004R0Q-17Ny
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:06:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so145089a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956802; x=1786561602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6fqphzLCLb0mLA33O2rb2yaxUz+K1JaPk2AB/U3hnI=;
        b=cCTV19V9Wzycw4VvfnirH/9xpiHwuvtrTUayZ5w+kKHzJEWFTV5jDkC0bQvoH23UQb
         Ydd2z/Lku6XmGQb4uHWaGElZ4Xci+/byhx7OywKP+IJNZht3bfwVguUthUFf2iGrEEQT
         uG/kTOjDVLnrT32W3GAezUR1sEaK4JIc3+UFNz3IKNC9hVIUZVrGzLK8ooVbgIBlnw5A
         Q80of4vqIqo+P6Hu3fEQ7fgliDC1IU50rPiYSn00SxO1Dx+8fSlM0BDEXFW4I3ovvz4i
         E0E+UpYqfVL5g2yTwekkxelLTjc1tlZGWQAE1be/pKGxIO1VwJ2Dw42s6NvxPcyMVEvx
         Z/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956802; x=1786561602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6fqphzLCLb0mLA33O2rb2yaxUz+K1JaPk2AB/U3hnI=;
        b=okVS1fqoUTQfq64UuRwJ6gdY6aEmw56U9dGxEFwiiA0959na00L+dirUTnSxlmS9Th
         uaQ+OF6gAMiWIbwYUk9tVRaNhALyVFJ1ql5i0PfPvDqCiixiIEhNpazw3VsEwNcPwLux
         FzHSzXHEqClI5JywoXMH6Y6aBkaKcdlRhLdIflE0N7ddUBI1uSOhmtSzo4nG856rMfQb
         AfmNzPmqCjqnb6vrpfJkPiixWoUnlJH938RQWCy1xHw0NeMmBKBMOVkhZXL+gAyHP4u9
         /QWqPFNoMa5oTLgJjfDiaRbHm7yYZ7Bgq9fH4To6LfMh1gsy1KM2vCpceBz+RlkoQe9y
         tfGA==
X-Forwarded-Encrypted: i=1; AHgh+RqlYOAOSoDO0SDLEkpGiY2BIz19hbLs+kF7CwC+YNvcTyM9lzvt7TJJXlPBQrWDAE+RlIikYGjvI6Ryub+H8Ac5@lists.infradead.org
X-Gm-Message-State: AOJu0YwsoFMyZLyuWpoEMRTimXxQON3SRkqqZ5ScSFfmSNuSBeTMPWCl
	RJKhjz6L3WNbfFJTTjniiOirgddABpGM0CCq3CTCvdmYTb66pt7HaKbO
X-Gm-Gg: AR+sD10J9RsLHntWZA2LTIWbCyDgDhNFbIeg0w89RnB0PKmvKsMhs60K7EG428igsLH
	PVWyq8Et/PvXsKQ3YHUEG5JJFzARhtyk+p9MKp4/NMu/pnBGt+8Xxz0SnZRDRGYOkX8fHCiPQg8
	TspT5EyYsgDcytGmeaw+H659q4gHNz7QYA24g7+LTwsAZRIYe1MPCugw2W2Ai8dfyO2ZiGE5ZIc
	lt6uJOn6Z0KMvRu8eDXTQyMv+UNAzkF/D+FNDBkbrGhU/uoNxOQKOAMWz4fRxORlcKgSSsf9I+x
	vlEa+LqOffHn9qCr4oIDyT7UQCuZi2iSkiGV9+7Ylf1FL5G4nA0w+p36uA/MkoVio+NPf2Dx2kl
	JYcwn658cKou8wRXSMF1xDbhsbH4UVI/edT6VJ8+fwumFCG9QdZEHCBkoduwThzI5DDjcIzb2wI
	cuYbpK8xFtSiiyGSgyFs5TIiFTNXYvpOcN7yMJnIWeV9tuGWZR6o89Qx0NoNVzoV+V/RB5dyEOF
	ZppKE4wDaaAo1HWrXsr9QbtSD4afwQbYtBNSnTZ8AkzWPxzxxM8WTH+vcEGPsb41jP8VG5rFwzm
	+0H/TbRz4fAB68DkOvaRKKy5u9MCo1fjAv+aBw==
X-Received: by 2002:a05:6a20:cfa6:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cb9c1ae26bmr2055316637.9.1785956802198;
        Wed, 05 Aug 2026 12:06:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe706e1c03sm2152786a12.0.2026.08.05.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:06:41 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: EA9200: add LAN WMAC
Date: Wed,  5 Aug 2026 12:06:40 -0700
Message-ID: <20260805190640.7957-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120643_303424_52DADDE9 
X-CRM114-Status: GOOD (  10.63  )
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

Make it clear what the MAC is relative to the others, which already have
nvmem definitions.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 9041dc6bfa8d..37593e7582ba 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -162,6 +162,11 @@ &usb3 {
 	vcc-gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
 };
 
+&gmac2 {
+	nvmem-cells = <&et2macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &srab {
 	status = "okay";
 
-- 
2.55.0


