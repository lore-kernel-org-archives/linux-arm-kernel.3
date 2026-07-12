Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B162C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=; b=021REUwE9Frk+csVAit6Q8obXf
	k7SPF/D/Wzhq1eXygWVQQEuw8ygt2l6wbqruZ/MRy82ScRpfVqruDkSL/PuOJTwmyOtpA3LhwayIQ
	3ThaVrKb4O/1JSzTdJG04/9QP1GWMoZ4TT2zLwxkWI9PtObmF94y87KPiZdl0rdFHKbyzE7kOJvgE
	IAgUpN9wno1lsb75m3XcwEkCUHAmGSBLUmYXSfm6OdiFTloFYYCIXbQ4C/0t5Yx+GyUqO/0CV3GkJ
	rwcksZIg445tIWl2w8WkZW3ZBpWQ4MXXFhPGrmqXJrLvkL26/zrx3rMnNOlcCL1uRHhv1RQHcKEv9
	5i9oVqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqju-00000007JR7-0BO9;
	Sun, 12 Jul 2026 09:44:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjp-00000007JO0-485e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2013856a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849481; x=1784454281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=i/fwE7y565gUPN1tHw9xVEtDVf46LWmF7flP6IXrlg4Pr9K/WthAnwTnwFNuOgd14B
         5/mFjmNDQVeyWEkA0Em+P07lFAkpuovhjJZN1wZlXl/+BHJ3KfRwmy8F8j75PsBnWx/m
         bLDeKXC/+JTeNDhOVwZu8+sr70+pi5Qhr63P3KEiJbVvetDcSsKIGJGgQK9h5UjP4CIa
         KLl4vQ3QAX22daAhqo5s2kkNuA3c3aoD0BCYy7O7RLFHJMr7TZzcjF/DFKP9KSOU9U/s
         qnMfC2jhNCn6QKmLD7Nm/dUrDwItPpGdBELPnteZnbP2+onULuUShwQQIDUWcUQ4C0Nw
         8NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849481; x=1784454281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=Zh+3U3EevELa+tLQeXIZqi3Rb7oMsAcJ25ApeJQU6/ekVt/FheWnTYoFql9Kt+82Kn
         NUf2cGXZ7kHlD3o8lVL/Yxqp124QKkaWWlnMojdNt5V6jfNzLle7cTNZSd/EvupYVawy
         qsJVeD+1Ly0wFoAwrWECWyPi9a8cYQlt50XIIedt34mSB6UNA1CP1Y+xR1mKaCU3NWhL
         wekDK/GBfUZbsOmnjWk2eSN/8CjVYKHns9CHnhoywkO2kAJR3rbKYcMBTl6psRD60+bj
         4JGQD6HcGaPSWTe9Vu88hCY0dRSUNGZWQ4ocm7md3R37RAzk1lp8mpdc0WPmC2PKj1aD
         kcSw==
X-Forwarded-Encrypted: i=1; AHgh+Rrq+oSVsNFM94UtudmhZb9L8VQzIgK3h2e27hZ0zdpCeKGguKsfAop+SiXqEC4B1V4Ml30FCfoG6Mv4FQl6JFrz@lists.infradead.org
X-Gm-Message-State: AOJu0YwE6ZH4+b5sdqnHJRY/wohbf0abdmK1zo0ViJHwhz3KopQlZrua
	S29XZ0MwmiftQDg9h+jjMH3rpbTq5iJ6NTPlMx4p3MJRG/VHLBRscF/t
X-Gm-Gg: AfdE7cmkv58wnQ+kK5PXiqS+wJcJJzCruL3MSyq5ItCzP7eyC4mnDDMxEqZAC20xMbU
	+tCLrgZVBu23GZuUEz18EOqIrwd4MZGQTc4aF24IIKEQcAjQPnl+NkUZ+M6e8JB6ADJ+BcwZw5f
	x3EC0ZhyJsgbkQ4zA5LxLT5T+8b/z57Jid1+gtMLaLPaQ8WOynFXYiIm9/gURJc0mDCjk9cYh7h
	+MxRnjtUp3fQJGTBCHRP3tFK0aOSc/7TAU9OvmSJqbpseN8K+G2LpZ68e7tpHxJ8cuuwKgmbMfT
	O3jC7QpzwE2Y4zZf7O1iDVV8n5zQsqnCxS79/ZYxYpG3c67ut7U3US/0GdQXbE7OEw6XUb1eTvE
	Q8zaCbb88Hnc4jIe45jV4I95y/fR+8TZZkp3rJtfhp1tz9edfMnGosEGQiXQT+cDqV0kaOCDMZR
	tQKo1fY2Ny2TPoxRjLHTZJpt7QX0eaXhU+38qSvd2kl9tF+6DIiq7DGrllUOksFF0dT1LMd7Ci6
	8R+jLyEWp2WlYtFHVLYYVMBOm2j/5PXfqlmW70685ErJHziJ9Ybb6clV7vLhVnZyD+3Dz2rBtg=
X-Received: by 2002:a17:90b:4c49:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-38dc7746cc8mr4828993a91.16.1783849481403;
        Sun, 12 Jul 2026 02:44:41 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:26 +1000
Subject: [PATCH 07/12] arm64: dts: apple: t8112: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-7-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU83XUyxXtrjffrOH4blFz3+dJ5itpSIbfHf774jK
 N62Ib++YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUN2YwM16bLi4su1ty1Ni9+9pLDthrMhvNd9qctL29X2lXz6ofZNYb/odfNpv9
 gnC2TskDzzcKgr5c1p+3ddSrM4g8r84KUne9vcwAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024442_049899_0F5CCEA5 
X-CRM114-Status: UNSURE (   9.37  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index a3241c816c26..ec248ca052cb 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1289,3 +1289,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0


