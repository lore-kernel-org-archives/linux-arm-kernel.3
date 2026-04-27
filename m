Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D70FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=; b=MGQrsjQyWxxJiUoQAPyEDacyyF
	ZUHnk/enkcQ4MNhJmIDrXs+0CdkmccSAAfHheyBQT6TPs/qbboV6BPGCvQazU+l6EhU4KYl5vEOHJ
	jRNiPptmnYxTBAKV74UAzhzAm5fCz/4XiMJwXmxVNYxMBzeQYZspAFV69BVULNTqSHW5q/UbPwalu
	HrsaKSLp11TSahf6bVcQ2cvfcujBW9sPba7XjVS7Junb5+yrHh4qSmxEKfREkRG9L8NvkaFEXVP6F
	8bHVfw8oIRrb2GOBTVv23SJebZkkYAZ5usIFpfcFj89AvP6kqEEsQIqDNAIXkkdeyfnwOaQ7yIAcM
	8bfEYbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSK0-000000005ve-2dHL;
	Mon, 27 Apr 2026 20:12:48 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSJx-000000005up-28Pv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:12:47 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2ab46931cf1so79376605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320764; x=1777925564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=;
        b=L47mFxCHeJNw1ai/05VKKwreNOI+fbHwHi6HHpZQfD00kTF2hnwrsgqwkcE6h2dNtM
         4aM11MMc/EIAwTj82qox7O/bwijm3/hcT+dCjN3hjq+0swdCTCzv47qkRn5Qsz2C0qIF
         Tob/mce2trC5wju39sT+cDCjEiUFWASNSOsAtSc4T3R0NANyTVUFrec9SW1ytBBqkmlc
         t3RERTfZlnfnTHxTVDMRNj3c/B0e/zOIf75FOM1mPw5zuCauoO74v+Nhip7x9a3M8luc
         deeXbU+JTK/hBnFk5pwRaeiqAykb4WHA6gWchEjM0yJgFV04ow9BGFjb+9dN9BWmxiU7
         /P9w==
X-Forwarded-Encrypted: i=1; AFNElJ+8ZoOq7/Xl+MyIF1JPzsyHLZvWnYZmatDH1CPAsCl6zuysMekaRNEbdCV+955mIG2CtZ+z9XvswVnihwr3Pztx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcz0cmr4B6INcvqYhSBqy1ELVvniVcbSkOuTiBdYC1bFOv1NCy
	c6W7IR21aPZK55YVdM9s/hiGXT7g491tcQfF7q7uyYEv9jmsgNzRFba0eA1REhmvduRIU2AHmLp
	4rqLf3wCHE4Nm+vB7D7rEvV1LKkHFLYrT/Q7y+be0PgCo9ilkcMuDPbqC6DohvCYhivVqVMjzNZ
	shH5K8WJaUciJxJRcsb1BB90wq/O5QRVw35RdVoh7NHVxyM9LgftCMqseeoMNTnn/MO3YOlNaAi
	NuaTf3jD9X5AM43V0ZRv0sZmwM=
X-Gm-Gg: AeBDietKBYf9cyh1XfZ6d8swThVnfKAru08bnlW+KrjATPWQflYdBfweBCjz2BrCjHD
	7Oau6x1oWKBswyh4GRtpMK7efXghEawAtZ4tEZqe6+yxq5dPM2gNoNWeqShgKgY6tTUnEb49Ge7
	WMDOUm8v3VtvLv1fFpzZnaHbvCDrmCw4Gqsw5+/tDbmI3ZhY/OQMdYQImWnZ6kqbYI5LnteP/QS
	fNXxgBLUwMBRIM6YLq0Hlso0ieRn/qoD7IHwSeGOmtfv+arHxTb17EGWKtshbjcjCPW4iR+ycrJ
	BlHskeTrL2Mm7XWN0u7nDoktUIN9G69zjujaEHwW0Yps8L+2DXQdueDRU1lITTZzWF6LdPScDnq
	621XSJMSkSvUUWsRZv/rzec/paFYEKQc10MlGc4MK5JvIyiYxNFLIZq+K8uCBlPxJkVKtKlcWAV
	3pWJ38g9ncD+mO4zxjlRlYU/cLOLkB0P67VdkQJ5o7mSzFln4vB00Iqyl6XvGYnZTR
X-Received: by 2002:a17:903:245:b0:2b4:6122:10f8 with SMTP id d9443c01a7336-2b97be39711mr1600855ad.21.1777320763819;
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b97aa8c8c9sm335335ad.11.2026.04.27.13.12.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdd327d970so6690813eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320762; x=1777925562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=;
        b=EkfWuH+khWxgWuQiMilDu06CUV8mXvI6GCbQV7nmnUcuWSWlD5B4JfLdM1rV2PER+p
         0VIdC0bRiMx58QvDzQF01m6sYtZ+ZSAUENzsYt70ovmTz2Yk/jpk/mfzyUdLxfm+Bq9H
         4v0sNfDfH1V1b8TV6tVK0KKmNESxF08Sze6N4=
X-Forwarded-Encrypted: i=1; AFNElJ/VT328ai1z0nya6jX2wM4J6mFbWJKKw/DCDmNmquFKRVEbLxM1YsKzGbL/KNTdCCMCxzKOGIR6M92W8RdNCyBQ@lists.infradead.org
X-Received: by 2002:a05:7300:7fa2:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed0a5a2ddfmr107175eec.0.1777320761896;
        Mon, 27 Apr 2026 13:12:41 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa2:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed0a5a2ddfmr107159eec.0.1777320761283;
        Mon, 27 Apr 2026 13:12:41 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:40 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 27 Apr 2026 16:12:30 -0400
Message-Id: <20260427201233.380314-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_131245_597860_347B6AE0 
X-CRM114-Status: GOOD (  14.93  )
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

This series adds hardware semaphore support for Broadcom set-top SoCs
via the generic hwspinlock framework.

The semaphore registers live in the sundry block; the DT binding
describes only the semaphore register range. The compatible is
brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
appeared on set-top chips).

The driver has been tested built-in and as a module.

v7 changes :
 - Rebase: Whole series rebased onto Linux 7.1-rc1 (254f49634ee1) so it
   applies cleanly on current upstream.
 - Reviewed-by tag (PATCH 1/3, dt-bindings): Krzysztof Kozlowski's

v6 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Renamed DT binding YAML file from "brcm,brcmstb-hwspinlock.yaml"
   to "brcm,bcm7038-sun-top-ctrl-semaphore.yaml" to match the
   compatible string
 - Updated $id in the YAML to match the new filename
 - Updated MAINTAINERS F: entry to match the new filename

v5 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
   using the SoC where the semaphore hardware was first introduced,
   following the brcm,bcm7038-l1-intc convention

v4 changes:
Addressed review comments from Krzysztof Kozlowski and Rob Herring:
 - Renamed compatible from "brcm,brcmstb-hwspinlock" to
   "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
 - Added description block to the DT binding YAML explaining what
   the semaphore registers are and their relationship to the sundry
   block
 - Fixed typo in Kconfig "Setttop" -> "Settop"
 - Fixed email typo in MODULE_AUTHOR

v3 changes:
Added detailed explanation in the all commit messages as per review
comments
 - Added description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using common compatible string

v2 changes:
Addressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platform_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch:
Link: https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
Link: https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
  [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock: Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 44 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 10 ++
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


