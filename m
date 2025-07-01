Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D52C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=; b=EQwQcU9DD+cJKVlxvA/rm79P7O
	KT5ihJc6np1gmbBLBOXUtDdEXeYVCBq7R5zORxyAGW/90Z2lioenQEKFHD0aDgFxRCJ2oQeTDNLR8
	WX1ZIqeHRdC0VrkYdx4wcuq7bZ1yPyqqGdwdjlK3XsMwIZzKE2mfbJvJO8N057jokKX8ShbSPxbRI
	xx78YsIuL+xl80weSgpuuMQqv/OL2YmBJQHLEog1lJjn4vAFsfYJ86GJBZtRMLv2G1heVDk5LNjOL
	bMc+zSaeMMtnjsd7eHJBzUt2QY2CH1cYVx2EC6ajgs5PmhGsxjvcEKdFSLwFEIIl0aVHCyWJzY07G
	pfuYu+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzR-00000006Mo7-0flu;
	Tue, 01 Jul 2025 18:45:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQx-00000005xpo-0e5b
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 16:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=; b=ULi5lYYzBBn47ADHwyOnqfN0wD
	YVdcy3J2Y/WhcJbCIN5kKlmXFllCEp+8I4i2kALZh5WZhmpRXnbSmqdNWF7x3l+xVOPLYbgGpr+/I
	fRQqfsWWwQSNt88y34tze7aVj5QOfz6kVxcgxy1NmSjLUNjCppShLMf9gGutDPzouniXEMgVgKlhy
	MHBdycKwNNspEqpLrv2viGEAsjlxVcE3cHrD42v3rxazXjv73wnZO3WqqPQjsUx8aZkp7hsyJ2jbT
	izTq3p4y++mB0uejeA/TYg/Hk4cUJ8eHftc9f+pq+woSD0RLHn3WibkcDUNwPfCyoRXlDjelxGXY+
	EH3p1aWA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQu-000000077Ez-0SM2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-453634d8609so41894205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385726; x=1751990526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=;
        b=c9QlyYFKEZrcO1SkWXdguSx3nCB6l2q/R6G4QlEvfuNdhXyNnrn/yPd51tgDf95yY0
         KH1iUCuWig7hwkNMz5MNOjxh0A7qQBA8AXgyUnyMXdKwEYd76/2bDIkaTNmeiOoLQlyv
         M17JzK7/5NlJ9jNFPLNONHVuArzrS+MT1RUCHvosNIvhH4X+N0pUcgC5yQuKdTVUimv/
         Cp2zGO031WTpszdQkED14HGmc96td+Q8tDWsGH0tkpW0rnT+u89dSaKBUyXHD0tyJ0cU
         a74lD0a7EOZWCtZrm7Z3V8a/uSkO/1ZMhK+WfrwKz+t4hXhOKrtzDzlpb8440E5HGys+
         AcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385726; x=1751990526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=;
        b=fVYy5vC+TzfOqSsTcJY9goHi96eEGBn/RUuTB11tfJJlCZp33MHmvNS1iCHirpyD5q
         qO1vfUkpiZlqJ9OEXZul4MxUUewSd8RWNppiNM1TkHhaKnjTqsXSEOWd62aeZbU69vAH
         1IMXRSMGCGPn7cB6a7YkCP1BOG15jkj2PNfW3cuO0kWeUKLU+uOsf0BV00RARdnqHKbv
         YRPAaVmbGxy/f2PnOmEmeWRPUqZMT68b0aBRsBjPQRSLJnAwjkQZAruyQYzI0bJ+ywIv
         UUibXXN24gGwfdQF4bw9XGOG25IWTFZti488dKDzks9xqG4umP9DxHGqaW6nuTkADeLP
         xJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwjX/Fy+6yA0ZoLeliKH8EGaV1t+BOePEiQsi3ExnGr9Qj6hwytQyS4Rsg15r2cbscDPzSAfQtD2fEXjJ1FwPl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/7VHE1MzxozJE60vFjAH6le8Lx3j5gV2MGxcg6/HmPEzJ8Yhx
	aq8BvQo2AnnnlVtfpz01Mrdu6QXHSaDxxWkt6M58vXyiN22l0HipzCk69kOIVyPflUo=
X-Gm-Gg: ASbGncvqu6sj0xc70yUz1m1rtj9OBDp2Kx79/rMVwKE8PPiGOVi9q0nuUl6INlCOXb6
	sX0IXfhRo0HhuMSnhBFBCnGjTkKW9UWdBvZZFCRnF1zKGIQcZkSa8LPk7HE72IH3HicqdkPV025
	v8cA2SF1f8iPBhQKoeRpqV5ZSJs4xVvCbYJsjMWw1l1EWIdF3wW++sz50qYpeVyU0keuBW9g79n
	yBbtf/SO1+PwNDTE/e3qefjlRj6EeDZ8XgHSD4kSMNkI77DOLkVHc05H5/sLX3Zj+QSLrqUoDzC
	8hNcFDxqb7jAQ+AxH+lsoTXjbkjMcRvq0Hnrs/+a9LaWCqe+Rggttg==
X-Google-Smtp-Source: AGHT+IHNr5gKLLJ5dI/LXYzeaaajt8CK6iLWqWjb6+EEC5MHBgr73n33/C9RKxWuy86u708WLprggA==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr159248665e9.6.1751385726126;
        Tue, 01 Jul 2025 09:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:05 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:40 +0100
Subject: [PATCH v4 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-5-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_170208_354061_B3AD59F7 
X-CRM114-Status: GOOD (  10.83  )
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

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index c78ed064d166..7984caa861e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -68,6 +68,10 @@ &hdmi1 {
 	wifi-2.4ghz-coexistence;
 };
 
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index c06d9f5e53c8..35b673e9ab28 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -617,6 +617,15 @@ xhci: usb@7e9c0000 {
 			status = "disabled";
 		};
 
+		hevc_dec: codec@7eb00000 {
+			compatible = "brcm,bcm2711-hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>,
+			      <0x0 0x7eb10000  0x1000>;
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible = "brcm,2711-v3d";
 			reg = <0x0 0x7ec00000 0x4000>,

-- 
2.34.1


