Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PQrmK4OLtZ+IgNtZ8671Owl8Y5KLotbw1U+tAsx0fP8=; b=XKsOUeaBupE9QMwdx+SOOJX1CG
	E/piOYwG6ae7DDj8Euxnj85A8WYD4Xd++xDVl+hPpd2FAms9lpSuJWzG4uInYpYK6RFIMbmorXSiC
	FiTUtHqsuiLPtrOMEk63oLyMm4ni/i6CgEHWlRoPjaDoAgVSej4Mj9Oo3L4OCzMTthLuxwlAegeH3
	42L+t0pQy/QIdrTxh4T4OiKqh2/M5H2Qoi+SXc+P5X4mLzIUIRj3Fo7t6K+HOgjl9J05Apc74TN+m
	kkgY2YExk8p8fQqVA/FbkwNQTNF8HwgswXp4YgF83OVtePDIah28pwYlXFiQHFRIMRDNqmpGmaAfg
	TZc7UZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y3s-000000078lY-1ZwM;
	Thu, 09 Oct 2025 21:20:32 +0000
Received: from mail-ua1-x961.google.com ([2607:f8b0:4864:20::961])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y3p-000000078l9-0VpS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:20:30 +0000
Received: by mail-ua1-x961.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso509624241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044827; x=1760649627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQrmK4OLtZ+IgNtZ8671Owl8Y5KLotbw1U+tAsx0fP8=;
        b=L0MYv3DsbrcUfE5pv0VXiP9MSvyvHWJlPVgSjnLbLr4ut+ckHeMGK2OVk3eSrXoPNV
         2cjowSyg8Ty7R6Tswwfb/epk2E3p8xXyKkY3bUsWLl+j/BLbmQ1oLtw5Ivc1gPnp4exi
         /BzzW4jVJDA8rjqT/paCcvIgx9a+eGXNdoLZOgwcy4v7ADkVceind4iVr1Lxvp4TxsbH
         7SvQhR/Z7fSqd6ZWtJvwRnJ5WD8P0eOv+HKF11byyQLnaTRSlWfGBBjugFgVphtpBNQM
         wv5Mb9dS8VN3g5fgKGkMK+O7Z4FY0NZAs1Ie3A9GmgRX31AQiUtqK/myU+w+PbswAny5
         3O0A==
X-Forwarded-Encrypted: i=1; AJvYcCU/yUIQiQpXfmqzSxPlJeUIFzefgXBXsXQe8v4/BpCCxLQh0GyRvGCcSyF97UUrABxqZk1tc99IQbcXludFjW2h@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCeK7+LenEs8eyJH8szkvyt/guK+lSnD6iFNFCiDjml5z7n3D
	Kl6jh+6BmodKforFEEXU/YLrbjzmYHEYXcZocfHSufAWA8BELk5BLyWNmgfysIvGSpekES7mSFJ
	oBs2lXXFFG+BLp4VdtySpFJP6PxOBqBMB28O/9EVM9lWsZhcwjGAkAmVt3R8ZowofgY0L4sb3FH
	DuEJc+J3WYw1ljyISe/sqT+ofh0CdDI92b97VqWKdS5Bur6zO36S3Am32wxGxbJ++Zvbty3Xrm5
	x2+WqSUqM9KcAPn5gmn+XUdrXY=
X-Gm-Gg: ASbGncv0dG/3hbXbV+DyiayBGtLU5yzhDuMTVVwxwF7nhCGeJevMoYYVqNKiNmcXKwJ
	oE/sTU34QRXd14PqEHIPvypDuTVao0keqYNCm6nCiUbhCcgL5eeQDC+FbNnUVGNTiIHYGYqVCmz
	xjDV/Tx94Lc6zUcQcYFzMupPM+TgUPeOa0tT82B6gU5sB+O/41adG9+SWXIDwS8h87cgGXMRIXI
	nmg/0kzPQcfnkz94fbUJuHSJBsxdsPejMrjd+tBCMb0BitkY+qdAQ0ozaA0x506C3P3p+iPxPLr
	mdk6WX1w429buzzCtSziTpQ2VnBJkWB6M6YYJ7Ea/YesFYqJTfDBUP/09OwT0gnVp4+59xt2TLH
	oDzyppWT/o/KL1QFZRG8EfzF+g0vDyCe/4Yx1lhQd0E2dflZeN6k5/nXzVM9lz8V9ruO5EqnJd5
	XKLw==
X-Google-Smtp-Source: AGHT+IGXQHeIlkuwaQvDoRtAjg+NA38GrHAFf1q+6DgsW+4+pnt19PYJaEd59FXAp4otp3p6yW1cDnt63eyC
X-Received: by 2002:a05:6102:579a:b0:555:ef1e:49bb with SMTP id ada2fe7eead31-5d5e2364222mr3894689137.21.1760044827494;
        Thu, 09 Oct 2025 14:20:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5d5fc8a7539sm84312137.3.2025.10.09.14.20.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-86835654255so755663685a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044827; x=1760649627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQrmK4OLtZ+IgNtZ8671Owl8Y5KLotbw1U+tAsx0fP8=;
        b=fcdz7oc65bAIPwcK5tAPXeLFtlUXD3gNNFy6SoowO8Uceory+BXKNgai3zzxDF8sVE
         YZXh8PIodXfNlKMWcXfY0TPrS1Avfrmzi7S3nyBupL9zfCZo45PY0MTMbw1xMMcPU+PK
         0mO9jHu3eCVCtPQD3QBcF2Tw2mkFiz8olZ2WM=
X-Forwarded-Encrypted: i=1; AJvYcCXNU8HbmV+I3nDf1Tt1iDfmQElH+ShhspJBqOomLI2M8qQjgfS9WPVckQz6GuecgrPefdvtms11kaBvQk6lGFGO@lists.infradead.org
X-Received: by 2002:a05:620a:4492:b0:865:cacf:e133 with SMTP id af79cd13be357-8835104c86bmr1139486385a.36.1760044826814;
        Thu, 09 Oct 2025 14:20:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:865:cacf:e133 with SMTP id af79cd13be357-8835104c86bmr1139483785a.36.1760044826325;
        Thu, 09 Oct 2025 14:20:26 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:25 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v3 0/3] Adding brcmstb-hwspinlock support
Date: Thu,  9 Oct 2025 17:20:00 -0400
Message-Id: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_142029_327631_C034DE19 
X-CRM114-Status: GOOD (  13.11  )
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

This is a standalone patch for the hardware semaphore feature for
all brcmstb SoCs that have the same hardware semaphore registers
hence platform driver compatible uses:
	  '.compatible = "brcm,brcmstb-hwspinlock"'

The patch has been tested to work as builtin as well as a module.

v3 changes:
Added detailed explantion in the all commit messages as per review
comments
 - Added  description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using '.compatible = "brcm,brcmstb-hwspinlock"

v2 changes:
Adressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile 
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platfrom_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch :
url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
patch subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


