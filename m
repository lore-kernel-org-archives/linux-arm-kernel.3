Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1419CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/35+lplNa9c1ue8CwS2qpyGIoojlgVm98TES9qQ+QY=; b=1tWiKqP1Fa+o0rUJmWQWyR3ih8
	bUM7w4E9i3arnGzcUu+sQudfySVM3od40BzytaAUzyrB8HarY3NTNMywFEIs8oRGCSJTtFp+gEUAF
	9S9lbifC5PztDFUUjXWMrgwHT8dmC6W9jLnzCc80Yj3nb3JWVEdZx5stJIN6cE7yLJJ0zHw36F/CJ
	qwf8eP1h+3e72ma1cB17Qpz/K9VHemt6Tmd+CJV3zj5EHFur4qQihtCI/DrzFLpD2xoPr9KwV9uH0
	ZLjuerIzt9IRLQG8gH8vH1Wqn76yHcllVqT9Ogp+qFPDdz+pszaCZpCure/IJJRMdvOQHf53VLs/X
	8owlm4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Y2-00000009msr-2duH;
	Fri, 12 Sep 2025 14:14:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Xz-00000009mqJ-3Of6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:14:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45e03730f83so9335205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686482; x=1758291282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/35+lplNa9c1ue8CwS2qpyGIoojlgVm98TES9qQ+QY=;
        b=CDM7ymOx1Bxwc+AsoD7ANJUcfZdV+EyyCydoHOZr41BuC3irjPl7+OnXLhxPrJQQl7
         zl9fr2y9l6nNsat+nKWKRy5xK9nHVzJDtvaTWN+i0JJoiIKPeyAmrBI98QVva4oBF4iY
         CB2WsErVBne722DRPSTAQUhJJqf5Wy7fx7W0bU30h53SaEIRciTqTpzUY/ofEznUrSZr
         KSMGMpJbItO+iKOvEPxS2nk9+2sqqraQt7iPQK7RF2+WWemQdzrAQRqLGkrOkQmPqzby
         MbfVsLEy8k5sv5VH6Y/5286YPQL8GKyyKP+d68+93pnZ9vbDgFbvKsAEYYGc2LWezRru
         G6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686482; x=1758291282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/35+lplNa9c1ue8CwS2qpyGIoojlgVm98TES9qQ+QY=;
        b=xGJ7JIlCXyiyWgBjl9UORAv1BWMjMdjwc4m9Pk0mlqIx+YNRFr0upQNz7vAJWQ7gCd
         wC6nOZqUIXaSD2U/OSLdfMJRRvBRDB/FKhzI4K9/MtCodVfHHsiuRD7KBVddpObW/hVJ
         1WCFzYqBnJe++1dto3wiKxcILs8pt3V0QmII0x77DK0XsdilNNxwS0boI/q6gQ6Kia7e
         0mmoiLwPedr3kSs7JX/YPIJMKfvsHcUmdiH3xa9FDu2lVuCWeWkMwfgdmZwlNDgeG+Ob
         pKUkHrVX7ZA1/zMfO0lXKSBzRsd3Cfy2migTRqOwfWfVJAbuyiQ3JV6wr8gGuHa8Fvlj
         ZK6w==
X-Forwarded-Encrypted: i=1; AJvYcCVOSS6BZ+51FbjWp9VSj9Huj3R05i5R4xp37WRJ7U1ENuYX+Tz1h6jr/EHwaItc1fDGTtxUaXGYcUKeePN9yXa6@lists.infradead.org
X-Gm-Message-State: AOJu0YzkGVsXRIupWspLVCqfDn/belLHmR3GJtumrKHI+iDDjvaRSMWp
	ub2Hdp1LpIWTcOkIdMq9A8XEdLvWjzEFaWadi+ykbBkujDNRKYtSTP3OWCVYZaSlkWg=
X-Gm-Gg: ASbGnct+12WT2Gyk4FsjITqtd7XIp7JBBbhpok5JosjliJ/ekC9e4aySlpSpMZc88ag
	bFv5QYUiidUWdAVmo/xRE2g4i0IpUxzA9+6061S+NDem+YEbDDKAXY3DdLxxlORarXv7Egcb67w
	m8ZNivsg0SBeLpe+MbGxFQC9ljrTX1oEHAVFeKR2aRajRVYrdPThlRhTZzmcEEM84JDCuheeLvS
	3MIzDW3++o2RDw0Wles+bGL4hG1K2fy9T9X6XKxG66QIxM/GoyJAaGMRqTQ1azYYPfroLn6Qtks
	dBXattR/2fMfXiQWtrQ4tbdcUA5ldcLbn0Scehy8xip4UF9cMhXh9mJ9gMjcc2FYmuIKyC40Uel
	xJMgmCi7SPTg8p/lO+XEYs56IHkDw3J4=
X-Google-Smtp-Source: AGHT+IG/qv8/NZ7DiR8l/8DhDwWeY9yHV3BseVNp2K73nhxvNF2iyswkFzMn3ukA0/vaEuJChx4aSQ==
X-Received: by 2002:a05:6000:2210:b0:3c7:308e:4dff with SMTP id ffacd0b85a97d-3e765a3e492mr2942700f8f.57.1757686481952;
        Fri, 12 Sep 2025 07:14:41 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:40ce:250c:1a13:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd415sm6680739f8f.30.2025.09.12.07.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:39 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] pcie: s32g: Add Phy clock definition
Date: Fri, 12 Sep 2025 16:14:34 +0200
Message-ID: <20250912141436.2347852-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912141436.2347852-1-vincent.guittot@linaro.org>
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071443_853429_ED304893 
X-CRM114-Status: GOOD (  11.89  )
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

From: Ciprian Costea <ciprianmarian.costea@nxp.com>

Define the list of Clock mode supported by PCIe

Signed-off-by: Ciprian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/pcie/nxp-s32g-pcie-phy-submode.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/linux/pcie/nxp-s32g-pcie-phy-submode.h

diff --git a/include/linux/pcie/nxp-s32g-pcie-phy-submode.h b/include/linux/pcie/nxp-s32g-pcie-phy-submode.h
new file mode 100644
index 000000000000..2b96b5fd68c0
--- /dev/null
+++ b/include/linux/pcie/nxp-s32g-pcie-phy-submode.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Copyright 2021, 2025 NXP
+ */
+#ifndef NXP_S32G_PCIE_PHY_SUBMODE_H
+#define NXP_S32G_PCIE_PHY_SUBMODE_H
+
+enum pcie_phy_mode {
+	CRNS = 0, /* Common Reference Clock, No Spread Spectrum */
+	CRSS = 1, /* Common Reference Clock, Spread Spectrum */
+	SRNS = 2, /* Separate Reference Clock, No Spread Spectrum */
+	SRIS = 3  /* Separate Reference Clock, Independent Spread Spectrum */
+};
+
+#endif
-- 
2.43.0


