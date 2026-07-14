Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F6BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=; b=SOICsnMzETZrFN5uZT0cSfqDBx
	RDdOJjfhJng5bkPKW+SImYIDelsJtTWivXYFwGAtQxzdN7U/gwf6i1y6xqwChiKQxYuXBqW1/3ELk
	jNSJYXeUJ2WEnDT4GWBW3vDIi8A5V+cQmqQ3wkigSg2HanMv0nYHE58kjZBzoRMDj34DYp7+5kY3Y
	cJ5LQnbIZq5KeMmjgBOHxEI+hMUtKYHyMR1BgLITt1+HZY89X2BYc+7S87+8nBTQG56yCDqqVxpVv
	9lVV05SIrQ+Ye/+JenxNkHY/cx94eGvlCa8MZk/MLEMa+qZznbXE/utX0tWS94p0a3UrDIx+iic2K
	EvySKHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWd5-0000000B2CF-0tRC;
	Tue, 14 Jul 2026 06:28:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWd1-0000000B2B8-1Wm1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cea3004256so35801675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010506; x=1784615306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=M2TOxi56UBrtmwhbzClcaPx4eaZWX1PuO7J2DK7qhD9yBeJaAe8h+iZjGKttMccq/+
         dd/6oKNTl7I6n/RIW1NJaVgvKBrNZa8ywyVeIhOLdPkta6sLnQ+9hVCYojR9TNr/DMUb
         IKVwmHwtqaXggPoCNkH0w79qCJmmutpTTFspsj+Su3qvXl3CchkLk4bKYgBfAP51sKXf
         7OtnG1LUUF6yzztm2CzRrrMYQmToTksy7MnqFFgOisdvzyoFCjT5+1wcfXfvfuc8BaJN
         Q7q4BEEv8apAfe3nXGwXNCEO/C6EHeUmVAWeujoKeXY8A1/RWpYuPeNvY+5y8TgW+7dX
         QlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010506; x=1784615306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=bIx//1wn3fFAXEwBT54ow60+/ft57VvMjZd6UMQDZs0moVEJQCkcHTTMJeEEKaIela
         A/wUQsH27aijU8P9ALnqRGkETSbGIhFqa1aBA4GUUlmi24eFKAjMHVZdJSqxVvz7cKfW
         WDidTDHHJAVoJ67Be8ZaX3yYa5j6KfhJd/k2hbHnR8ykfcOIHvM/sDFQozjUiNZ4siUq
         6XHITl0e95MCFa6B0lv8UjkiQqQZkdQhuvVQ6KPmnq5udVj0KJVciW5PQvJL0MOufIbB
         HdIZV5xamff9/c+vaTMYuQq75VIRGbgrqegF5WiUjro7FvHg4TzATb4fPG0S0iWllFWK
         4S4A==
X-Forwarded-Encrypted: i=1; AHgh+RoVRLtaQSeWJQrk9dLND44ccjyY+DyP+lzdA8N++Z0j4R+HCId44VoeIlOOuJrnChxZlnXQlkHUSQqPWubO9eml@lists.infradead.org
X-Gm-Message-State: AOJu0YwEzYRb3dfsuc3quA1tMTWhAwwc2Wa/0mFfzrmvzpHXj8ILgZ/9
	uBLOtgdUX4FU+EztiJzKoE+uiUuAkoeOAlbl+fyNztWlWktTHAAEVADZ
X-Gm-Gg: AfdE7ckDEWG9FGVMfUcwZl/mQOMAoFp7vPjH1w55/qE9SP1PX78z1eWD9qMWl1s81lF
	UglDBn1KnLAoWhtY++lQQbHF+y41rWOcpfDEBv7RSEbtMFTuZurZ8a97/d48HB1BW4T+qc9K2m2
	lT8kJ6Uid0pEQOi4Qk59FfAVAfOic+1s6uzaytDkfcU7r7aTgvrKoznjVlCIfUrkOmAJ0xsf35E
	sRknwfuvp83v8cJPFdNY7oaZgzczsCMkiaZd3yKhVFZmmALncefhNfWHJ9ijQU1ilN6jnI2vjfB
	Beh9YRYOMBGsq1J9+5meGrRqZi+sUbzguvKrkzAn0JSE6qKttqit+o4FlXO1HROO1ju0pQNPly2
	8XNUB+rNrkTFyZKpydFyG7KIDxw8zm7x+6eg5nE5yRdNWgBDp2wst7XOKJir6lu7+ykJZDnS328
	szYHqNG2ObjuRscYgFlt6suhOGRD7WcXLp+K18u30nkSjcwarjUHYUKzjNDR7vrS9rou9egRKKe
	EFAOHh56TFI7tHVzXX41ZifN6BZk/Ei/NwAS++E3CUSUCWW9LfxYLJc0z5YIktK
X-Received: by 2002:a17:903:19c8:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cef143a620mr16315085ad.25.1784010506454;
        Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:08 +1000
Subject: [PATCH v2 01/12] arm64: dts: apple: t8112: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-1-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xkutbk/FTnXe+Tgng1itbe3P5t1Y8/BwC8b2qqtD
 vAvaw7a2jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqXglGhuMhX8uW+zLN2dF8VGnDs9yCx9/LjRXXaFydLneQe9KqS+qMDJeXTRT
 9o5fgYH68pe24scHiyhvcxYdzd249UzrfjaNcnxUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232827_404373_2C14A1ED 
X-CRM114-Status: GOOD (  10.01  )
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
 arch/arm64/boot/dts/apple/t8112.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 85c47422d4e8..a3241c816c26 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -921,6 +921,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0


