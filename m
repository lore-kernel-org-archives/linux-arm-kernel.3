Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512C0C71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swocyyVkC1m0yK3KFc05VY0vapacmuONNBylQbQbwQM=; b=46ojwrCMKUsJZgWbci3R6d9QiU
	2vWXmsaq3K0xmyf0WncdbZsUY3/xPBmSvhmiIjvBOr+xcRBzJmRMavIjk/8tpYYvJ7nUDFKc4Xgpl
	/6NWB07402bN7VmMpqjnau5qYmS16+ITomXhOb25W4uKQZSgdt/m2uQk+JRw3TZX3NbYZuwZj0Vch
	bryRiQjCH4SSt+ojvWVxg0uNNjmMcFQL+IgSjEwrC9pLo51Fs8FP0i1xJNIjkgR4YT032gu+I86dS
	vKJWEE6z5N0pc5VR4CRc0skcWnP28Cqug2AMQgNVzzpbBDNd8QOAxwdaoO7idSfNNN2ekokEE1ibz
	DYn8MCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdTd-0000000Ceua-0phC;
	Thu, 12 Jun 2025 08:40:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcih-0000000CVxi-0pYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:51:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso615388a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714690; x=1750319490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swocyyVkC1m0yK3KFc05VY0vapacmuONNBylQbQbwQM=;
        b=RlFpkQLBu1wJfHMNQXKKmYsazdZTPCV4znHKFnSoN1jL9iI7LWyypGR4xydKhPuh9X
         yPd2qmHeL2ZJ6XMLiWWiqNQBaj4zYHgYymbHkIhd2Bw68vuejndiZa8Gv5oVPKwSjEqc
         E4qtJTAD+GFswuQa6yTzvd3F0obLHImCklXvdGScajlyaS7YmNCQFYiM01vS5vQTTHyN
         iHrGCY7383CbMxDhYpoCjkQjKjwdw1fL5BtoMIZGdAQv4sqvSoq63dyCGdTOZAs4jYCA
         KdvbFc7y0YqWdu/v7ZcmH+xBChmb/8barinM+vJR41dpVfgxi4MiIzWMfFr9gBVIMELR
         BQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714690; x=1750319490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swocyyVkC1m0yK3KFc05VY0vapacmuONNBylQbQbwQM=;
        b=hVbinQv1WtYL8PUisTLhFrMh7r099lmm3ixk8m42U91EB0mlaCOxUxlaLl0BjSvxjf
         a6VeISS1l3YGca/pql0zhqpzebMtNcM3+nUHGlJfQlDb72VPL/w1KIvrxn73s9ARf+An
         1dwqMVgZ6hIs0/bwLRE3h2M8Exib/915RD+N9UryKTvLllXSYSAoM6AdauksgM4cW7lc
         optfNNQ2Ha71c8hP25Exme61F0CyhKYWajX7rV1IfHqwGFc5PU9E9Q5QPJzvX34WeBFp
         1L1XZiEnm86w359SW3zZFVxMtZJzzvvlS5uu3QcHYW8UxsJX65c8+rEqrOmJ2x5h5ghf
         K8ug==
X-Forwarded-Encrypted: i=1; AJvYcCU+pDmX94O10Vq5J9d5VMohjEHRbtnheIFH5mU33TWb/rnhzqMl8bjgo1ZVOlLm/5MOwvvJMgsr4kTONfJNuzHw@lists.infradead.org
X-Gm-Message-State: AOJu0YzfQXoFL9ExOXqLKTo3twgPPMZtYqcPVuJFt9kF2OKO2PDn+u4T
	MLtsYb1WyJUB7/xKVP9GX7ynCKstbgKYCrgKS3IHlc9D2SVN4Mx+GK4D
X-Gm-Gg: ASbGncuTXFo+e3zaYYZYCsvkvXZ78UU9VSO5PABYb3ljEK4FAtjP5JAEtRK3tnSA8oC
	m+BMuAejK2/pVhiNRVE/QlBaKWvX7pjsCxqHRhcrQL4YS8t4Yfk0pyfYPmXEwKWeyvmHDiAIi6S
	Jk/GWV98ZUVpl+m1uvsNLOaj+JcmSb1Q9OFcxbOdoAWugoJfR9cjMGl45Hbn5fvTEL95u9PcOTM
	1OmfgeeaxJ0dP6BhH7RM2LRUTpij9j1aba6J6c+bwnZtSiapfuAx/X9INhn+DwVdnVK6PRNJBaq
	dlz4jLm8UscKIk1RfDOLu3D5yrVSCmcdi3IrlgOTFo5Cu2/bnZqqd7GNqQF4iFbACAnAfLBW+Ct
	j5Wp2pZe1xc5pAs8DTvNCtaQ=
X-Google-Smtp-Source: AGHT+IGjalZHIM8I5uIyPD4PFNJrTr3b+7NZ2QJSRfZ+xrOON4O5ngplWUEXGHHBCAbhjmak68v2CA==
X-Received: by 2002:a17:90b:4986:b0:312:e618:bd53 with SMTP id 98e67ed59e1d1-313af1e44a0mr7908723a91.26.1749714690389;
        Thu, 12 Jun 2025 00:51:30 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6.. ([2405:201:4042:d128:1895:113a:65dd:3ae0])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e3b9sm915761a91.29.2025.06.12.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:51:30 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH v2] ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes
Date: Thu, 12 Jun 2025 13:20:57 +0530
Message-Id: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_005131_250230_E9742D3B 
X-CRM114-Status: GOOD (  12.50  )
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

Fix an obvious spelling error in the DTS file for the Lanyang BMC
("lable" → "label"). This was reported by bugzilla a few years ago
but never got fixed.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=205891
Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
V1 -> V2: Changed the subject prefix and addressed review comments from Andrew Jeffery
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
index 370738572a55..8b9d382241ff 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,12 @@ hdd_fault {
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
 		};
 		bmc_err {
-			lable = "BMC_fault";
+			label = "BMC_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 		};
 
 		sys_err {
-			lable = "Sys_fault";
+			label = "Sys_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.34.1


