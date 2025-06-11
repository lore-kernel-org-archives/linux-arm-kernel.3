Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7746C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAmqS9TFfQgR6ZuXXgUeH384PenfewbVMCpyFtNRxxk=; b=4UWTamYEEDGqNSsYBCWe8mmaab
	mjHDtDZHEW87cIWufcRAqNXhJ1TZjwQJOcOSEs8MaCdtvBaQC8tR4TedeVgCbpOdkCIHZ+5HbB38B
	festslLO6MDj5VtuT/WlWeJZUtbduM/VD6JzlninCpK0yXxHLeSpCVpLkIlUyKAa4UI4/yy9TgtA/
	xWtCYGtz0JtX6wmA/rc/+PQx3qfl+jbPbUHb/SNiohPCjVsCwMFyAVUtLXz8xYJVi6FJmkmj8Znpv
	MpEHdYie9PjqUr4KST9gWxZbuMLwUVMR0WHz5E/xJ3NAjO/vbryhw8L+8PcJy0KFqjvSyYOVsdHhz
	W2hBs6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHvF-00000009Uy7-3kAB;
	Wed, 11 Jun 2025 09:39:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGSY-00000009DDJ-2XPS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:05:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2363e973db1so5273235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629122; x=1750233922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAmqS9TFfQgR6ZuXXgUeH384PenfewbVMCpyFtNRxxk=;
        b=eSgK8rNGIhirijfHnAQ+ITozUJlSa/6Plec+Tx5Fx8bGNOI8VWkAsXJ5fLpxcbwA86
         5j5hNFVaoXiqK336FELQ5Y/5k0pValkKGK0uWPy9B5StVnZv8KpLgEddE73TqyVSfPF2
         O+2o7SUn4d5lqC/9up+O+cthtsG48FtZsXoRas0FuSzPOY/XtDDfG8K+g5YXd07CMqOZ
         JjNjlmJe9z4kbPGizzG6fWxUK7dVyV5zMpePcAYCsc22hJ9BuqNUPMPk3Dp2E3brlwvH
         jG8yTojWxCd3E74o9vuVGqEFCJefFd9r023xGH1oWuVG4+l2tQxjpmCgMJXDZsAgmH/7
         mOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629122; x=1750233922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAmqS9TFfQgR6ZuXXgUeH384PenfewbVMCpyFtNRxxk=;
        b=JZU7+nh2bz5j4gpTGVlfb6p0+6BGrE+vDycNXiTyRWXl9m4osgABoIegbY+5xrNS3E
         q9jI7qAvY9kjN/wgrXA9jwKFxi8IEMeyh6xc8j5whmeKjhLx5ZJsLrmQNr+lLrhniHve
         3dVV7zyyqQq62lhkdFaF9S3uwJTItJflsnH1/r7wU9YBoIH+MUqYqMP35y6wBREh6fkr
         95ICKUDf4tvGy851HC4ys7DSzpYcxzVJ8PPSp2ub4tPZiRYL2WhnF7HdCmjOr764zWV4
         w/PMli6rP2p/fJZM7JRoKopMJ0xaB4TXmM9N3n+0CVqtMSUIsf2ccmhqw3aCrANsUSIO
         HojQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp/IiDzRhW6E0MrjJUxEbqoLTBdq/w26Q8SCMiyC86AqVms1sBEo0z3FbtRS8cNh5na8AI/Ruz93Y2kdbs/nXW@lists.infradead.org
X-Gm-Message-State: AOJu0YytEV0BMPtWuH0jv709uqqDgeLzKzQNmfjnFItqEl0U/iFDh1/F
	m5rI9t0YY4EyUUGeZQZGH5H3wwNM17i1X9ZCkB+o6VNfjEsWAOuxDiHH
X-Gm-Gg: ASbGncuGWUHX+JnaFvQwynlf84Nf8Swm8fjpf9HvsYCrRnUVKq5gbgPRYv5LrKl6omL
	AeVlqJjafCCClAQcanggLqvhIa9xsppU+/Q8Taih56nFWIP1MIKE5UV2DWHZHuso59CaGuZ9JAB
	jdh/t7wsd57CyrX6NlrZg2qtMFd5NtPwwdrm1Q81lg9x709xVcIrRljOSYf/kTXd31f9Gi+/W1J
	W7FGajpX+LbBQqwF9IplmAzZUi2zXe4y9oAeZWCa8XYFAw8xBse461dIFSJhPJuOGZBBYg1hbBw
	M+mzPWI00CAg9SJ5Thy+MhJi2m6ri/nOwxqNQjGrL//dmk7eFZ9qcB4y8EoNNFYm75nU2iLTvx0
	EPImdVi2c5clWo4vzGWtpopzVqeZTfgY/AxknkOqVBKfg3iy3SaRyDfurCY8aTeAwNh7noF5Y2n
	JZ3KqtlGWrHahYKruE
X-Google-Smtp-Source: AGHT+IGDGJ0np861gl/BsOafO+Lck0L1DptXpwjhh1Oi95aNBuT054cfghigc5NOLUKgNHLq69TOBw==
X-Received: by 2002:a17:902:ce86:b0:232:59b:5923 with SMTP id d9443c01a7336-23641851c95mr37292345ad.23.1749629122052;
        Wed, 11 Jun 2025 01:05:22 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:21 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 1/5] ARM: dts: aspeed: harma: add E1.S power monitor
Date: Wed, 11 Jun 2025 16:05:10 +0800
Message-Id: <20250611080514.3123335-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010522_640655_9202EB10 
X-CRM114-Status: GOOD (  11.70  )
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

Add the E1.S power monitor device node to the Harma device tree
to enable power monitoring functionality for E1.S drives.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 9cb511a846e3..3a215bb1e220 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -354,11 +354,22 @@ imux22: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
+
 		};
 		imux23: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
 		};
 	};
 };
-- 
2.25.1


