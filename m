Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD377C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSWkjItMEsVNotyoDAMPLMvhhraXQe3wDj+bg0giOKA=; b=SPhgk52i7IQPK0ckwvqgRRkquf
	hwAoAXafQpSn6EvFi7y3NnCph3kyKoa1KLjqXcJ/C8gIuxYGh1UG+9I6mohSW8N1ixRfqBfy8fX8J
	efBZCz4FBB5/JWs1NOiCXVlLC5kt8Yxkpm82ZYNAErvwD1EHZRrQ78cWwdHguU51aAGGh8ortDT4c
	EWPXUKS5OqL15l1eJsfAEmCBLL+l8XchFFutAn7HN5FsJ30xLRwK26qSRxJfTsD6HmX15hurU3ROW
	h4AYfuXy/v6vkv9TsJ2S1NoI50Qe+kak6vRq+Ih803C1BIIEzZUKV0o/0fAYkVVzU2d3b0jOpKpl2
	WWnrXBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgWz-00000002YUr-3W47;
	Thu, 28 Aug 2025 17:35:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcz8-00000001mz7-0hjl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:48:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afe9358fe77so70057566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756388893; x=1756993693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSWkjItMEsVNotyoDAMPLMvhhraXQe3wDj+bg0giOKA=;
        b=KrRnbB7sT9jqYqOnhJz/ku+Vj9NambPMRrLWOeJ3SkMmw8zx7rYDWQ5PEVhSfcXu0D
         2ndRqDnnbi9K8DKChaStBduBWbEeGaN4Pl1Ck+Jo3S3+AExws/xwC7IPJavAkw0idFVR
         6Yps7XXKX8vIgv+vu13AIVsZOzieoediw6I+83AMCB88y3qBVJOY0MGA6sq3wSc5+Xit
         ZS1keCGEELKtIHACqtRpqHtrAcekdoJ7pvW/2IqEkb47zO143mCxiBqyst/FnS/wJGR4
         p8OCj+8UyynhCL+vM0stALPossn+1UDoAmVOUw6DsFV37F5FFguSS9SCuPF6g7Wsu2Ij
         6OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388893; x=1756993693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSWkjItMEsVNotyoDAMPLMvhhraXQe3wDj+bg0giOKA=;
        b=rDnNqhVdByoX7z3Q0Nvl2Q3luELv3C6v1nOhPzJQMVQTC+M9YMKoFk+bOBLyJMjVV+
         8mBMz1aaijTAWr5vynj4anAJBCPW5DdDCOgfydAl22LT7vaJYKcNcdLCtn86Vz1cH02p
         K7I3JTvnN8akIyDO6Xf+VAwoBYTTHA4GUTO9xq9c/DIgZtkMMElthtP6/jTP0Hnu0U6F
         MkjuBMlziqOAO/5EFrmWzTyOT8ELn/Mu2/16FvZW6eJ5tV3E+fAVlIUbKRtiDgzqyNhL
         bryIZswpqPoexhMQXejqb3Z0eCEvyjFE/6NaSaPqumxXm2Tm5D011k0BxRJT/yaUG3BJ
         m1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWOB90iH3v0JvfM88ekeoIygqcRnKUr/tgButqixMsOURKG53xVO9VCqN4s78uybGKN2Zs0aTyWTS8xEqbXhxFV@lists.infradead.org
X-Gm-Message-State: AOJu0YykNm5Xm8+xyKnBasJwijVq4gpVfJsOIMMivtHaNQBeYdnUtWw3
	G18MrpxxyAYvebGk4Az9IVBJ+Du3xGtP19g3qJ2X2UWbl2EGKQ4FUM0R+Rd6Ty433ew=
X-Gm-Gg: ASbGncsTNuYiSvo8ASeMrNFkL1qeR+wM9f63mvQU/heyl8hTbN3eRh+n+qzddSqtIG5
	l8zowuWFLBeAWblyB7x3/fhHyCk5WWG7uZ3AovfT0QEQcriOwh272Bi0gdgk7lYCUF5jlPFw79M
	oWu36SJOG9k/e5rzfCo6/B5mg11b3H9UlUl3wCoJ8H5ROfVH5s//dWRI9Vx+BQ61l+5+4BwXN5j
	ezuK9lxRcaq1s785vdQW+uWb0cI954mUmpbE/6jOSNXOo+7ImyYZymRWptpwXaVjICCxwibeUGr
	upYGNgJWQFRrIsBOJlDhJP6/MHgnlzzcBqEnc9ei7ZcT1ERtDbdGKxxwk2jOLNexqtpxP53ekIm
	12LQJy7oUlTODT5H74LYcQ/E7P92m6fgWWi5IqDGW6G2Uxe4hvaxfBbocVnEd9/MQiAzi6yfzHr
	2gavpnT+h/MuBcpxK7qSWOPoe6FlI=
X-Google-Smtp-Source: AGHT+IE0mnnz/V1bhpFxlBdsAbBHx4QqqEGn96nhy+Mvodra/CXXwAofr1j9KUPTZWvQ5QP+0+sP0A==
X-Received: by 2002:a17:907:86aa:b0:af9:8438:de48 with SMTP id a640c23a62f3a-afe29605c0dmr2169147366b.48.1756388892528;
        Thu, 28 Aug 2025 06:48:12 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7c93b86dsm515729266b.21.2025.08.28.06.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:48:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 2/2] arm64: dts: broadcom: Enable USB devicetree entries for Rpi5
Date: Thu, 28 Aug 2025 15:50:04 +0200
Message-ID: <9926b25f2932668abdf99d30182ddca4f7d18d9a.1756387905.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
References: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_064814_218245_90D7152B 
X-CRM114-Status: GOOD (  10.57  )
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

RaspberryPi 5 presents two USB 2.0 and two USB 3.0 ports.

Configure and enable the USB nodes in the devicetree.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 865f092608a6..95ab67c7aa47 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -21,3 +21,20 @@
 &pcie2 {
 	#include "rp1-nexus.dtsi"
 };
+
+&rp1_gpio {
+	usb_vbus_default_state: usb-vbus-default-state {
+		function = "vbus1";
+		groups = "vbus1";
+	};
+};
+
+&rp1_usb0 {
+	pinctrl-0 = <&usb_vbus_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&rp1_usb1 {
+	status = "okay";
+};
-- 
2.35.3


