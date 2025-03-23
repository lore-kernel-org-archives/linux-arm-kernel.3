Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C85C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yg8auF71+9Wy/NHRDxD554OEHtfrS7K8eB3r8Fv9UGw=; b=VRhKFEjqxBCne/z0hTZD+jOLfu
	wtxHVL9/t1VD1YxWSVioEOWdo1LpYrmv2lzK55V9fxSbxFGse1uJEksjP9p+ZACUBjXLhpEltEf/K
	126/LQs3efG8L7r1hstlMkdxjQkeOV9f56E2mI/MmDETJ+ED48eyMHhiu8rq2/OismYTve9R2k+yi
	/i0/GhMOj0LORHuYB3AJnR+HbxMmWpRJy+rmQyf+Oc0jWLBLRPN0r9FYMQmddKfQS4TXZjrKB6aTH
	Epe0lx4xqsKHtBcGgG1Q5gW49Wxb91IwMv9h3M8IarKabVxZmxkLStMVPSFFzIYRbsmFaqxXshxvT
	0zntgczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twQmG-00000001cxg-010l;
	Sun, 23 Mar 2025 19:14:32 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twQkZ-00000001cuQ-3f0T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 19:12:49 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30bae572157so36416751fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742757165; x=1743361965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg8auF71+9Wy/NHRDxD554OEHtfrS7K8eB3r8Fv9UGw=;
        b=FboiuAqW1736eSIcaH/+3UetlHEZ5V7Rpgh1qO15DOmNtyLYNNYxg+bkIPuNO7qoIJ
         4NLMlLymj3EC2cRPfj4PZM0xbS9cUoEpxriGCZvYiI9WNk6G3QRfh/mXx3R5DbYIYuX7
         0OvDUkl2Zp7blB7btF+G5X3ywaAKBeZ7Dmo3oIK9IGqhy9622+P/JVdiJ0uPJ14AWlC7
         TnGNzJzW/EnwPt4OqQxQz5hlN/3Kl/AORM5sqeuMutxo4DLB42M9Wg7N70mowJhvKWWd
         W9Qp9uwhxcZ/Iu2Tyhfl2yGsMHYUVAxF6Dy+dsWj/amkTWhB7nY7TnMWGSumPy02etYd
         Hq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742757165; x=1743361965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yg8auF71+9Wy/NHRDxD554OEHtfrS7K8eB3r8Fv9UGw=;
        b=pbcnwUVRsbK/co7wRuiV4FtmNn9AUu6pkghGRcVPgbR/uH93npwYRfr/ARfsJ6ia1L
         dqXfauGErAf72MfA5Xh5wokSqoIbYWus/jYSEE0aPS8B/Cf6ftT1Q0+ZcJgKbSlQsQBC
         faU3ONvf9j3gJTVNs29wil59x4+NRv0ioy6HAyAS0elB2rmK81kehrwtJAdYCWDctvbJ
         95wVh4BpQx1hGjBspCZge5bpI6wEaZGl3D/1BtBP4dWke1U8ICtrQIDml779s8GgMX9B
         qcDTbOI3/Nh9PiR4S42VMX0WdZvu7ZlHGE7XBvu/idFIp0CPjbCzefXy65IMCtjcpTVt
         7liw==
X-Gm-Message-State: AOJu0Yz/856Mn+OVKyNdTR33IQakdpoJUquAUu+EXgiHx5D/mPckVcbW
	5Ir9e5x0PZ9V8SOD5u4U53potl9XR/sborFLsaUTi/2WlAlpBjSI0j9fJ7ZE+50=
X-Gm-Gg: ASbGnct4+H/JDqX/Pdje3u0dt7B1r7iEcYDDmV4UdKB/Azr2UXSdPCmonxY5MBVZO2n
	DWGgG6McILSy/oP64N6Rmod4jOVlgocVhtVQ/eVcwH4CmUztVccXCCW2avuq/TIgJYF4/BChsoi
	4QL7PocESbeeWIMxvKh4u0Xa9PFamUhHJQ3HYAmf+875yDSNsI1b7XsWbM8luorLy8dopNXhN9Z
	x6K/hFJe75dmso9/PM2mfJBASz/fxGuWa+n7JyXqU1aPYIo9t2e5avyCHFOhsCs9HGLRDLa+HA9
	Y9n9mYe0ZPQj2loE2RudPgmDVUP/x3ICJm87jCfFvs/xMCU/3v60fjv97/ENrwsBb8v+X2zo/Ze
	dhpPky9l/WCd5ksnV8z2e2UTqappHBKLnZaLudZFnBF2YY2EXK31r8hUysoCXtDrf0w==
X-Google-Smtp-Source: AGHT+IGBsuqNpHXM9/IyouXlg2gmqX9aluYapE/1IzOAZkdocKsixutRanHt9NyEZOBxgCU/F+4o+Q==
X-Received: by 2002:a05:6512:3d11:b0:54a:cc76:1676 with SMTP id 2adb3069b0e04-54ad650c8bcmr4019916e87.44.1742757164372;
        Sun, 23 Mar 2025 12:12:44 -0700 (PDT)
Received: from yocto-build-johan.c.remarkable-codex-builds.internal (122.96.88.34.bc.googleusercontent.com. [34.88.96.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6480800sm858226e87.94.2025.03.23.12.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 12:12:43 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Johan Korsnes <johan.korsnes@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] arch: arm: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX
Date: Sun, 23 Mar 2025 20:12:39 +0100
Message-ID: <20250323191239.114181-1-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_121247_914080_CD204267 
X-CRM114-Status: UNSURE (   9.75  )
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

This option was removed from the Kconfig in commit
8c710f75256b ("net/sched: Retire tcindex classifier") but it was not
removed from the defconfigs.

Fixes: 8c710f75256b ("net/sched: Retire tcindex classifier")
Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
---
 arch/arm/configs/ixp4xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 3cb995b9616a..9c7e55384386 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -75,7 +75,6 @@ CONFIG_NET_SCH_TBF=m
 CONFIG_NET_SCH_GRED=m
 CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_INGRESS=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
-- 
2.49.0


