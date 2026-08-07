Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08A3C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixpqFwpYyvhO6JYNSRkqWZf82rMGmiosNWxtjl84Sb8=; b=ZxVJSLHKNRmuZ8l3Ft5R72DT6b
	Bv0n7otP0FQP1UmkV6nyR8JCpgX5MH9y+0lZTgXrQuzQwoYoiKitoW6gn7xMIEUDRt0fWM97WfSi+
	dhPTq9IC8uM51136bjosB99RX5OEQ0KK9lzOYnF3Tz1d2DSJTXnGCF1+d4Cnshbmdjh6VtgTTi60J
	X3pMtDxopBS5+ZvZnYmE98Cjs1KFUsVhPaQJvPndEIUttaUoa96qubABDRBNIikuAYodOUXU4qz4F
	ONkh7e8p8WqgFSd9jIV9HvMUW8TKxzdLWAy3alw9m/iuD5GVc5jN56J3ZMJzUVjkzOyRz8E9mtgxO
	v/smjK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzv-00000007QHC-1Xr8;
	Fri, 07 Aug 2026 08:32:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzr-00000007QEZ-0fxE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:32:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2990950b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091526; x=1786696326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ixpqFwpYyvhO6JYNSRkqWZf82rMGmiosNWxtjl84Sb8=;
        b=N8+aG9Nem/ylcbSktREBvysmjN+5m3bGscRc5WMFqxSBQgMt/kcz+IJ7VwbbWtc/Di
         EYtpUL8KLSTGcW10vxTn67zMQLXbLTPOd1dKCEpe5cYxS+tLJ+yGsYcBDJDQYwXGVex7
         sRsEiMqAF9tZsS0XBHO7jC01L7M0V0UvBF4vC/fJYAEad8j4/EzwA6NcW6vUlWkvThLG
         f6a9z8yFiVx9C1TRryW4Q8WFvvT6SlTk/nSS/hlP3AAxZ8+YSjg4LFobHzGxqOd5wV4I
         PwjBr+I2xUfOnatf1FJvjPqvvDt0wQhwZEVtQlkh7GO4s0Z22HLVfIyQC2RcJBcdLpMp
         Wssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091526; x=1786696326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ixpqFwpYyvhO6JYNSRkqWZf82rMGmiosNWxtjl84Sb8=;
        b=G7DaYQx7twFvz6uWepDIVJes2wDqIZlp34fop45HhnEswk9/OYZ2ybBgPn5KXfdikd
         lFeHoaFAbhgnlqqfqmHqOAujlJhgbr34EG8tRDMWsRlr6UcN9GWAwQGjEF27pHXJH6VU
         s17l3OPZYWw/GZaDnvzYYiqJBRKEIdl1XjOH2tOsj0zbdm3ap8MWVIjwuG4MDjX8ozZN
         ZDA4uQYNG/aUk6+GpyjRtPT5Rsub3bHHQ0X9NqraY+F31UxeLtXNutMyBjgB0orNrf2f
         a8RGvRwY2gUS1xe3m7/AeMcATCia7SPCUCnAqXS3kcpc5XzLshVY4LjuUlU8dWMiHkxS
         0dHw==
X-Forwarded-Encrypted: i=1; AHgh+RpAa9OnPpBtvAL1Mv5ema31RHbVnk8B7c9/exUxm0IgXfPQ+OH31P2tar8i10YDNk4H63AbtgqvuQ6PtDJEZkBh@lists.infradead.org
X-Gm-Message-State: AOJu0YzlE20pfPe1BetassaNJxLnmBP2aTqxMFM6RoQB8ZnJwTP99LNi
	AYvELn70/8y5l++uNPgoqVcmzzOnvGwRHOmXsqwgWHWfY38DmmXorqgX
X-Gm-Gg: AR+sD10tHFfuKQ8CfyMjCvbsHEeTeAyrJL2mJizRbnp5fzZoJ85/V5FMbde5cLAfPVt
	JjMv+uwgeWC5q6thv84ge6b9GFOXD4K4vqq5EaU+VvJ90VQAoVJg4FmWYhryLiXk6GracX0VWa9
	Rsh6A7d4a7fZA2gSHRxnZ9UdLuskqxMLkvkF2QoP05rUOhhc+oZLg+JIHgzwDkoftowwgQ7OBgi
	Dttbi7vvBW3V4g3aD3iga+LFRtQuiSFNWwdGjswxaNXPNnz/gmhu5eleX6p/18lrj6Fq78eaLxm
	qwkYTBmOsDWKCom4IqWLotpf9ClCro24JiI1E/HAJr/ezHlGtUOPVxr7k5yEB7GfvX3Hw+FQxmv
	GcfwepNN40OTYdJVoswOYUXP06rIU1pGag1/pwWTIRmKhaPjPkYMDTmNRlMMphivAKF7bfyzYp3
	wMLG3vV0rISns7xlzCD6Kw8Ox/RPDomw8Pwi0AtjU4aC1KQ+4/zdRXFW/XT1QSMSUkg08XGndsJ
	Z0ShE/lNDGkz1Nod8DfW9g4SjnV9Icp/PI8sqdPgOJyoDpqcw==
X-Received: by 2002:a05:6a00:c93:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84f2de6ab12mr22053575b3a.0.1786091525621;
        Fri, 07 Aug 2026 01:32:05 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:32:05 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] ARM: dts: aspeed: santabarbara: Add SGPIO line names
Date: Fri,  7 Aug 2026 16:34:07 +0800
Message-ID: <20260807083415.672008-5-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_013207_205684_FFA27E01 
X-CRM114-Status: GOOD (  10.26  )
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

Label two groups of SGPIO lines.

- FM_MCIO_[1-4]_THERMTRIP_N: thermal trip signals carried over the
  MCIO cables, indicating overheat on each of the four asic modules.
- UFM_READ_CMPLT: asserted by the BMC after it finishes reading UFM
  data, to notify the CPLD that the data can be cleared.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 9d334a01d407..3d35a5a74104 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1907,7 +1907,7 @@ &sgpiom0 {
 	"MB_SKU_ID_3","",
 	"SYS_PWR_FAULT_ALERT","BIOS_DEBUG_MODE",
 	/*H0-H3 line 112-119*/
-	"FM_IOEXP_U538_INT_N","",
+	"FM_IOEXP_U538_INT_N","UFM_READ_CMPLT",
 	"FM_IOEXP_U539_INT_N","FM_MODULE_PWR_EN_N_1B",
 	"FM_IOEXP_U540_INT_N","FM_MODULE_PWR_EN_N_2B",
 	"FM_IOEXP_U541_INT_N","FM_MODULE_PWR_EN_N_3B",
@@ -1941,7 +1941,10 @@ &sgpiom0 {
 	"I3C_MCIO_4B_ALERT_ISO_R_N","",
 	"","",
 	/*K4-K7 line 168-175*/
-	"","","","","","","","",
+	"FM_MCIO_1_THERMTRIP_N","",
+	"FM_MCIO_2_THERMTRIP_N","",
+	"FM_MCIO_3_THERMTRIP_N","",
+	"FM_MCIO_4_THERMTRIP_N","",
 	/*L0-L3 line 176-183*/
 	"FM_CPU0_THERMTRIP_N","",
 	"FM_CPU0_PROCHOT_N","",
-- 
2.52.0


