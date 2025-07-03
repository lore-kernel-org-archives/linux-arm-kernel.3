Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B12DC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yu4RZiro9Bw5AAl6vcrDQRHkTa7Z3Wce+i+f0KjYjtw=; b=XSuivLef9VVgw4IcxFtGk+dnkU
	Ge6KeYZlCCk6U6zzhcQXWRgfAq4qd8xnKQrBlwlEdpwvR5KhRmrxaQXnQ6VdUmuR+BylsuWTk8PxA
	YIHDg9tUoP46d/FI1CqO5EN/eX2cqxqxli2O/9QPhSgN+/tQNJ/roszu4P7DhN5kgB/dbH4axanjh
	WUZjmvDsa/Ul3PI2739BfJhTW0phQ6lYXkwfw0Fo8FZpD9h4ZJCVmfYlil/PuYow5OqDeGvJ0YG94
	or3KQCeRKg5oSWM5sIluAMNsZ+MbEKFJUdSbLTWupSKah/+KOXEo+PdauTdlRiAibhRZatVVZ8rML
	v0Iz7iQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzd-0000000CTKG-01rw;
	Thu, 03 Jul 2025 20:57:17 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLdl-0000000Bma0-2Gvd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:14:22 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553d52cb80dso10149e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555660; x=1752160460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu4RZiro9Bw5AAl6vcrDQRHkTa7Z3Wce+i+f0KjYjtw=;
        b=MKbh/b69xsQ1DuMmYGZrx3V2FP81MI55bUWYOZnRrwup3HXWn6rBHpCjdzWaMWOTbr
         ytghofVHeaogF4W+X1ooDXyRkLRiWTB8X4MmV67HhAditwzAxG6g13wsuVjmIBtHnTjj
         0EjVvfxx5FyxkeErA+osh+08TDnC9+t7E6+rLfDCCv7Ilk5VJV+WAvDZQE22yDNc4hqz
         XxkYUw8WPMsvbYTD4aJVJiy6H5wirBruvuDH+BfpyZy68kaX5lzLwy2V924+Cp+nEGj5
         7R7YmBIzJH1kN2ssmphKnijFVV9Cft1ClLIi8VCWBsHmP9Ey1q6AcBhGzazpB4axQ+IU
         GFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555660; x=1752160460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu4RZiro9Bw5AAl6vcrDQRHkTa7Z3Wce+i+f0KjYjtw=;
        b=h8bRsRa4ihbl97WEy/P6qn0yo+35wglVIpNcRNMRXoiabQUBqUrDTu4hEzkgJ33wlQ
         WI2oH6o6pjQ8GmgqgFtVryCKhcRE4AOr5FbmNTromZEa3Ul3Ucum279S1GL3MkxB7AhS
         g+XqaB46l3/agwjeICwq9HCwxpc5itZO/1R1nd9Iz0Rtvh7Fsahg1S4mgwPODAMzAX61
         DnDZT7YVyJ0Wb9OZUEwzFrzOKzstCMqHrbMNU3ZPJHH3Sx0phYQNVUfFyNIHkS1/XW9z
         5Uke0uBKqaegp7NSxuD7i9UDKwZJxz3CjSwAXMY8Wcb6fPdmJlyID3tT3aExntvZrr90
         vHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlNOvagOgMNMafaW87tM4xPM4NdXV4hBV9FTyCnCumT9B0Tj/OIc8MgRwcaJnEZCXDLcBOI1Jkxg/xhZQ+ozl2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhnk216VlHEKuuL7/ZF8ecw2BnlzlVRpH160jC+QtlgsxD5OxH
	+/U8FIM8Yh0e5PKxrnO6xZ2DV1DJ1oxprpvSzRV8F2HS3y3oiumog9gmNs8oEh3km0cLhw==
X-Gm-Gg: ASbGncu4+QYxk3FyJrTRC2lctOg4GLOOM2CSz7GOSC3TLI7lPxr73nTCRoAhhXRr0sX
	KvT1FwbGB1BiDnFuLdKMq3Iy/96yue42tiG8konwL0rON+GBW7qaFyrlo+oEclLBpYtcmV2b2Mf
	GQ11HZdJm8kUiOd/DxX5rKK56BW/OMRBgWEH/XLQ8MMAZ+O9Lfk8b8Sm1gmXUbwI7Z+fL/hk90g
	k8Lb1ZLnAmy+Co7XWZwaiOLH74TwzAM9XaBb7ViGxKfNjYJ/jxXrS0bUOEqZOr2knMzGa8JH8uI
	lFKLSkI84Z20rlwOFyNyU5PXo7KHvCMprjDcN/twGFzgyUndeNLvfHHrp1HL63t0hB4KLIUWKxf
	OeYEuHA==
X-Google-Smtp-Source: AGHT+IHN05FoLHrAAAw9abh/cl/blTZb9HkyB7tIwYOujTKMU0qiobVnp7H6qLANj1z3QSOpo0rtXg==
X-Received: by 2002:ac2:4e08:0:b0:549:8c0c:ea15 with SMTP id 2adb3069b0e04-5563013d4cbmr1247150e87.0.1751555659497;
        Thu, 03 Jul 2025 08:14:19 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:14:19 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 7/8] arm64: dts: allwinner: A523: Add SID controller node
Date: Thu,  3 Jul 2025 23:11:31 +0800
Message-ID: <20250703151132.2642378-8-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081421_582039_63CF49E1 
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The SID controller should be compatible with A64 and others SoC with 0x200
offset.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8b7cbc2e7..295292d67 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -181,6 +181,14 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		sid: efuse@3006000 {
+			compatible = "allwinner,sun55i-a523-sid",
+				     "allwinner,sun50i-a64-sid";
+			reg = <0x03006000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		mmc0: mmc@4020000 {
 			compatible = "allwinner,sun55i-a523-mmc",
 				     "allwinner,sun20i-d1-mmc";
-- 
2.49.0


