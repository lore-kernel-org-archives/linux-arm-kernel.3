Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E94C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=; b=Kvf/81Wg7JTN4z5cUAwU5WDFQP
	B5yMs7V0ADIvyrN9VIK4OO2YHSPazMpJMANhTzOhMkfAv5gZ9Sa7bEJPk51anqGOukxg/MSfddhrK
	LjDP6/cv026+vdSs4cTq6Ss7Sx+BdFwE0TIwmZ1jGfA/qLn0F3EDuQKud42t/QiC8cwwCmHo2kcwV
	0JIhd+NS11exubv3TQF8/TBH6pFKWOAMV2B6giJ5ud37AF9QAE4q6YQ285Kg5WZoJuapPe6A9gXI3
	4b2ZUDCGBYvbrWDYobBB+WcnWn12uocIdav2rK1dh3B6eEmCmR4f06EA9TK7tC7/Fenrcp/gnfq0G
	gY+jRn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eQY-0000000GNO8-3gaO;
	Mon, 07 Apr 2025 04:49:42 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eN6-0000000GMf3-2xln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:09 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5004141a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001168; x=1744605968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=ZvzMb7VSbKgfGwpZ/Uj18SNXGxVApHu0C8hzfmMM0yqtgEaKD2I5/MdtTz4pncbBGj
         zXxCmw0GXBeViMJWUjPlE0Pu0S0EWFm/HfuUIh8+O4YBbRsWVMGL7gwtsmfPFUFvWRqq
         GqXsfwZ6EeYcBEdGmmUtBbymAt6+7oWsi579r10IEGJ1yVcVK1I4G5WHdizeP4IEZRo+
         JhkJHzIlJsnJiwSI+vQNwKiMiod2EUsb4gBDT8lA3mG8z2BYdKcNVZdtWdjhHTwoYUUc
         wQsQhpFuDd929q6KSvvw7TO2ep+bo9v1KAaYvmxm9DSNnZaVFaR98iwP0fZ3mAqRjvDO
         CfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001168; x=1744605968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=muydB02eBivJfjA3BSbdOxMOt5Zp1+x+DzuGCKVUYOpJmb7/ZjzLoy0AopQzOiXNeJ
         TOjDBMREGZXIXIGCcFAKZkYAT5abmRV+zcIH55MQJrIm+L3RmHo0xSfM6o1j3tAMOF1R
         UEBzDtvnrHLCnt3jbWKwi4M4VBdUI9ukhNdTW/EHTVPUzYhMMcLrZ/MG6uI6uTtipZBf
         vFnHf8EHB4JnVxDVzYuPhPGGlBtAKw2g4Ue8p8EaqcKhLDmX9YL+LoMx+mVUFHmCWulc
         7mvulGwvlNa0ICYv0Nz46qGJAN+sGrlEUCn2Zo45BZLs6X1adoKH9poTJeiXpMjhrFMa
         iaBw==
X-Forwarded-Encrypted: i=1; AJvYcCXLpwwg2BHdWu3xbdl/iqL822Ce30IKmtJLl8XnDMfUdRooWhpWnbJb5/ySNX68qg3D8xJUspd2L8W8lLXxjaUP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3eSU30xtYDRuc1tp0nN/yH5dpmQ+vGpLtdi0ru6xyJdaaniCw
	VyV1X+8MPjjuLQqX7xIk6IvsR5/NYMNXxNxGsoYJHgLR7adqWocj
X-Gm-Gg: ASbGncvmaz1RsqXy06tOZH3ZdLxvZHyCeNOCDtfxutgtf+M2405IQMB6rOmzjGknQqQ
	cznEBLFpK9kiyUOq2m/5rIKa1kxiHCaLfht2X2k8L3uKD4cOIf/spK0Yn2lFq5VkIiIkrBEWW2C
	tPlBMwEs9HPqsaVPLhKOnSidI+bbQwEsB/PAG2JY3pjqL912dMvADKKqduo+fAjRfMmfVD7FFiw
	Dmtt3Nvfcu/5EmTevmUaaD7w8Fxxx//Hg7Es7+xFxDrWrBIUmiv9BAYbYbtp3fVoi7el6BsPuNZ
	iSRgrvOvtNxtKti8Kz7hcvDZHvLDK69waynEfv1+32rJqpI=
X-Google-Smtp-Source: AGHT+IF1fu350WMzUZDgPUrlnEXOfKAvpN7C/Nc23rVrH915BK/JSrjVQxpreRgv9N+/+mDCPJ/kfQ==
X-Received: by 2002:a17:90b:498b:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-306a4ec9210mr14199578a91.17.1744001167738;
        Sun, 06 Apr 2025 21:46:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:07 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:10 +0800
Subject: [PATCH v6 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-1-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iF5N0lEK0tQxrovFdNs6/Non4nh/+bWpI/2
 VKz9Lmslc2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhQAKCRABygi3psUI
 JMWXD/433zs8eXtVNbS+hSlKXj716ZiiEDJp1ttmVLgn1jlsjKilu6WTd5KwYcf8fTdw40qBb1r
 6me48cGkpO1Mma+WITNcvK4rF6CgPariDwIUFIp44h2BtVNWcD6++OvABYd5C208fV1vVceHNiJ
 LkOjfa8LFRfbgT7hmNwUJe4ckNgLdIoKS3fTRvOf5UYRrJFbgy43MVq7TMHDMK/y5tf38xd19kB
 uFQjsDoLf1JqIUczkQHRXwM4ICSSckRjlRHM0hWTKydW4mTkmnDiiqv8dOMYGtBADVqN3dOiKSa
 /y7NQeYudBCPFkHqVN8wbE7r49ZqdOhWSFA437faxXIRhNbSvKOLUW6xg4Io6M5WUxtXHwNGuz/
 PhQ0VSSWzfYsZaSc/ZSftBBIN3rR4lQCjcA0G0Gs5VcboSIdVn6mlPXwefQnb/LGqGOAGjCSGcF
 It/pYXIg2pxTRdAF6/djgHKjhszQY2eRwNL/TZyOLtLcRRCViqO7pgO5BUr2kzDmO90AQoCgTCd
 FbfJh9uY80jJ7cX+IYomb/uvd+3yRs7Ipozi3Wubbnp4o3R92epjynsmhZxUnOYhHotd+rq276K
 q23TiP33IPovipu7ho0nA0oSdagoxIhlnsVdtBPDkS+XzQkp52H6L0tOqezmzW6LVxvAU8GubYP
 x0wOe9TS7dlMmvw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214608_750425_C1527594 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.49.0


