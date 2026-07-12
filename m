Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=; b=1DQeJdsiMsq8A2k9AuNSkzxNNe
	kx1wdR65VTzALxvDgsDXzlec++Z0+Z6bI+Jtd87Qmv1M73UN/f0FX2OcEml0AjODJNlrd2tKxlDKt
	82zp92p6PLb3gRJP1+kBUwv8dTmYgboj3agkcquVXo5ImPyYgY4DYibWV/sRO101pg+1ztf/yMuLd
	/LhA20AKlIxctIGsEL4FiyD+F2tHb+tR/5NdMWamnnrbjLvE8Of4fCaI2+b2YOZaI73TW3yafEDrJ
	VGZDnxAjUyUsXEP/w/TGD3a3y1RgBtCzVEjAzCStqsbC460lxGKqIpVYQ21rI/kn3e0/43rysdxMN
	PSD3H6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqje-00000007JFa-2f7P;
	Sun, 12 Jul 2026 09:44:30 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjc-00000007JEW-3cRv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:29 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso1957376a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849468; x=1784454268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=Mr7tJYop8Va3sbBXmy+7qSojp5V6acfUejSfEPDn4zwJf35qvfDjCSIvtp3sDDK+pb
         WTRpBhz8hD8QjJosEJwrE/4EJo4MiA+rmUw0Cr5s9JBXo5yE7rsuT7lHbdbN2KH/7qaF
         Gr6yIZUA1bJ6MPk0KD9y27+RnSM5vZWapZWEiu9PSIoTE3iRV+ZA+U9KbFiqjiH6rKtk
         NVEcXbNQfvpGypSgcowBRWHox8weHI/Xf+uqisTCo0o2nrG3J5FuwKi4Lxf7mvSxhPqb
         j19QTalkFNz7hsPPZi9DQskuWZfuxF9Vu41mKihyxNmxTFgH2nv1ZmKOSGjB6enBmgeq
         U8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849468; x=1784454268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=dZ3wawiPmlxANRdvm3gAeJAtHIRqUYmJOzx0cWOhSUddG61+VMfbLK8yztJae7rHZl
         uA+T43yD/RBKify+09SV4IvQ4iL8vnM0tMHNU+CUl8rtWnaOnOczlEqrH/ibrWxIhjM+
         59rJfNk3TRt/PuiWRzrE/Ea553zcxwsP+CBEr5BVOtVT1MA1cU2ZNsqvg+kPBm2D/BVZ
         IqZz8mxDPqMSBNpDnnz55xMZa8N8mM5WDkHKuVZVXwBXazLdwcgRj5PkjcbJb8JMEYFu
         /HPyNBbsiZQeVtdpk9wgv8kvG/6LYV+SQqboF1SZr/aaG65DlR6MnRNiiGgd6zpoVAyv
         ZgTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP/6G9W+u/1tY4c6zNnKurWNr1CnLDan0rHOX30kyDBWIgiKXuXRiSBP9vzmYqB/HxU/XBuanTR7PEGCoWhgwV@lists.infradead.org
X-Gm-Message-State: AOJu0YwG711f2m6De+4BbKIQq+KUfPlZZZt/pcdJvX1QaVeoxsfudFSs
	Pb+JUVxwxA+1x8ywHtDXweNupXHlXx4KJk68QJ/I3VqBpoPUbb6VUQ3z
X-Gm-Gg: AfdE7ck7TNfF1rBivZa/5/GvEtn1cddd3FLhPgVupiNIOIV9dbeBFmS3TaQYel7M9tF
	QSEDovRd72o1GcFnzTZ2J73J8sZ8k8eloNLsLLcZmrxAZ/zrMJnDT8x7ind+ve19l7ieBXUqvbx
	ZCaablu7Cu2mWXR7p95TxaTux3RKAhe2UB9DQ2fiq2JcVsNPvZPrSnD+jKRLa43wy2yyUuJj6gl
	eIuZYBii63yXUUzKV7YH3/x12BiUw4I96DGw5U+nDUKtuHNP1UmSqiB3FSZ/eDVDq81aPpA9iLx
	xcK1F/k+z2StNnCmZftO/RQ7sYMGrDBkxRoRl5LYesAaYzXZ+Lgki+m2vW3Xd79qDfhbTVW/o0n
	VaZNr/t1hdW3wUsaOwHscQPVHoy0/QzWCESzDrM9Evt0aR42jsRO7k+NE7UgP/HZdY6MkuOxkMD
	tPYAP3ma9W0vu/rr/iNjzmBgrNk7DSVyR/TnFKa2dYlHlq+1vxZzKl+hkIJtHitfcZ/oUtVE0KV
	C1fYnDW4QRrZjqfH69AlGvtzl58vXYk+LHnX/yHEnZ95BOlKYbrTErwwmXqhWgZ7PGvQ66IPxY=
X-Received: by 2002:a17:90b:3502:b0:387:e0db:bc32 with SMTP id 98e67ed59e1d1-38dc7bbdb04mr4779557a91.40.1783849468005;
        Sun, 12 Jul 2026 02:44:28 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:23 +1000
Subject: [PATCH 04/12] arm64: dts: apple: t602x: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-4-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU+mfV5bauIwu7yV8fCN4JyDc1hirrLe0jI8frDq9
 DkHv3nzOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtOY3hf8ghVrl2+a3Oe645SzQH3DNbclJpwbJ9Dx1ru5L63v3+zsTwP7jj3no
 JqSq+xUnuM+MFdL78tpmW6bok4coUgbK7nb5/mAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024428_914975_47AE4F58 
X-CRM114-Status: GOOD (  10.17  )
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..301df2f006a0 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -122,6 +122,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0


