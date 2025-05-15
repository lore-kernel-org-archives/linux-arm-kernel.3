Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE68DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egF95f1ZAlVnAg/IDDnMiAp99kBUtL1Ze5itVnmPs3c=; b=Cl4vB6GLrhNk9R38SK1H6kmuZT
	W/Ydu7SSoyNkAFewl0+JfiJdID560inTtXMGstZAJ9EII3IqB9CCb5vv+OO51AkO8Pf+ofxWO8jsM
	yovbXUJpkLAh9iOdku2LGWsNQafiAS8PieLXw113/X3JUkSiGpmKGNkiUm2k2lB/XgaoxhwsYOy0n
	Zo9xziiFVMgoD7W4Y8SlPNgiySVBG59iJ0QI2LHsYL9VPG+J8/4aCbR/q+rAO9Naepfa/jINoyVRj
	peEg4iS/Buri2dyRxCSE5da7jPQ0l6vzHRC7KCqL/wiXS2QgnILgq40LqQ04eIoomya5IRubo5QON
	ckhYVP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeaf-00000001ihf-1JMl;
	Thu, 15 May 2025 19:50:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeQi-00000001hPl-2j1T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:39:45 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1611583e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337983; x=1747942783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egF95f1ZAlVnAg/IDDnMiAp99kBUtL1Ze5itVnmPs3c=;
        b=lKFl28+6gJ0RmaL+T0wuiQ5pVL2LSZA7IIMBry16/UACETxadqjNI0lTr2PSo4CpEZ
         mfQPp4O3x1FUZN6obNBChSblMkh6UXmq6XlpoiAihyTf0n2CNdv1R0VYVKFWv47F/jW2
         f7KXyj45y/EFRUPB0w1hp5hFQmJFv063o0x95eilcPUDJfcEBYMXXPkOKFE3T2ahkzuM
         aX6mFM8I/DoYxyVuxnVvfyeKRZPzsRt5dLKEQ7LtWJMiBg6WxUgpKEgzjZvnFtXc/JSa
         xp4J+iuGAt9U3VXQEqSAPz0V4aBsl5ntagb+ikxwLql6+xz5p4FQz1SrzkukEwlJQn6a
         JlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337983; x=1747942783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egF95f1ZAlVnAg/IDDnMiAp99kBUtL1Ze5itVnmPs3c=;
        b=Z2IqnJl5sC1NuTftLNJ5Flpd1f5qhWQuYkPyJAnYlKXbjwtpubN7Og6HM74bpQmK/1
         /QZrfhvZFyfjjuiNXdgC0FSZK9xyo8iUY1EXqdvxyUzM1PuwzakbkAWyg6W1vB86PGA2
         +/0tPS/FTSkZcwANXmXVc38HB0CismtFw/TmSCH8oJ0RfVVV9a6Xbmnw9JykP6VtdATL
         ggcNUZGh4wORG2v759lt3ohpNVfspBKW9Equ0o4U71+eCoh+eJXxv6qqEmliRX997kJV
         WznRLgp+kYmvrVBEZ07Dyb7hTTUwCi1Ogtx8QBW5mRYQsn0TzajN/2dPbLO+Fku/E0Xp
         LXHw==
X-Gm-Message-State: AOJu0YzXfgtvQf24kMW+FKM+IQ8ukQGW4IuDR/kLkRaJRvSUQ8/0ZWFo
	17JMEefOpaLOmZUFHw+w10mSUAZo8kCgIgvu1vnL3lmG4PLuzXm54oce
X-Gm-Gg: ASbGncvp2HKXOZrPpwBNgU0qFn0rUYDVSXXkE0LuoFnqLtog0o5HWSpUfqTlnMrns+l
	PtbIxvNiHIDWkobu8EyO7UbwxdxkXRECe9umCpowFK3JYxjk3XDAJv9KQd9Vxc4HpYzMRaoC8mC
	PtGB0lf+VdcsyqPDfDxm8ihzztnCfxP6md2pQM47gtGrN2u+aLT/u6CeCdLfVwRvMX8ulhx4b9s
	pxfR4auPvxm3Ws7NKHq2u3OgKtFKJjJ4S9sTUx87VkC252PfWiasueyIICZVDWE6bt3LoFGpp9T
	hEFZuC8BKbe0rSrv5DAyxxFDxtdZq1jOHAa8N2JAYMPnCZl+/Jdnh8HLJwqTEFmQSHg7zCOI1HA
	=
X-Google-Smtp-Source: AGHT+IGUCsw8qFKpgM9j1qE7EjoAdo/69tOoN83Te1kLjkBgvmte65PM/krZlbao2WzUeXBu0SqdYg==
X-Received: by 2002:ac2:4e07:0:b0:545:5d:a5cd with SMTP id 2adb3069b0e04-550e7197912mr270320e87.6.1747337982796;
        Thu, 15 May 2025 12:39:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:43 +0300
Subject: [PATCH v2 4/5] ARM: dts: vt8500: Fix the unit address of the
 VT8500 LCD controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-4-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=911;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ANAphqhg6ksWKFoUmKbpfjwBF/cQLekOGuxXp4doXfY=;
 b=HMN+PTA7l2fq8fgnNb6B7VWiPSWo8JlWLDM4GC9sBkw3DRQ1v2LAucZvWM9E5Dh1Yr/qW6Cez
 B88UnbrgDWMA873xwbvLjHQ1pxYYaSsg7etMQrKyCFq3BvHrSYrin+4
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_123944_690796_3BF8B83E 
X-CRM114-Status: GOOD (  12.89  )
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

Set correct unit address of d800e400 for the via,vt8500-fb node
in vt8500.dtsi. Note that the reg property contained a correct
address, so it must have been a copy and paste error earlier.

While here, also update its node name to a generic one.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 30ebaaa1e5a4b53094b295570ab6e831acfb1c93..9b87b12897922b20be83d7df686dda713bb4f098 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -122,7 +122,7 @@ usb@d8007b00 {
 			interrupts = <43>;
 		};
 
-		fb: fb@d8050800 {
+		fb: lcd-controller@d800e400 {
 			compatible = "via,vt8500-fb";
 			reg = <0xd800e400 0x400>;
 			interrupts = <12>;

-- 
2.49.0


