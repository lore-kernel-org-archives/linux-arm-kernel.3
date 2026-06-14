Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9467ACD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ254FuDlpkoeWBYpCvIm9kU06oNX/xzWLul6wUu4VU=; b=psBL0o2GBk4kDFVzjcBPmbYzuw
	tI12Yll1X1hos9W3/6cdWNOYBS9fsyf3fW0qaRDQunNnfieQIVZqa+JHbMApo6Pfo7YT2Q7U/H6E5
	OmUONJsm3y36/Jna62BfRwBFYA35rXtEDft/vCtnrWyb7ME3ARduP1eaBQ+wMWohPgnnPqciQytLI
	17kjAFU2BxKj0cUk8+IE24/hNPOj1fm87QYvb5KQ0ygeaVDPC09lFb3p20VPAMGKyHn9oCfZXDBWz
	vPsUqD5LC8T2CVXptjerauUoBDRtEjS6ZBNNqGFSW1QdDnkufNwe4aWvX/fbpQJ0jkJRFhaKpprz3
	WGGgcYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYo9d-0000000DCJR-3hUq;
	Sun, 14 Jun 2026 16:57:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYo9b-0000000DCID-1ROr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:57:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0c379e8ffso16389485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456266; x=1782061066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZ254FuDlpkoeWBYpCvIm9kU06oNX/xzWLul6wUu4VU=;
        b=bxNKuaptBVlE9oY6SzvIrVfK/zXGJRaoa4bEYeHK63pPOKLevVHEvLOPdhzt0cZkj9
         5gLTWUgObmVyBgm+c7Kg2lYbXIRH3KDW+a9sp/Rl7GoTLxdJMUrn6wKNrzE+xVklgjad
         ZQnQMxIAhuyABndbCZ1nxjuDOoSAsqMkPapFYVi6AMSuJYiw5cwtSDo/aZay3cAdRP87
         Nm5Oa62+VIPVL1ZNj72L41Xk/Ad6YkXZT/KeU2VRDbPqLO/2foDjdO9ocE+BRg4HgBSP
         AOsM85kscQlonwEPL4JToczQz8UAxyJVPn6X+otUiuuFmVqzaC2OrQ4Ey3CZFUNMxRYC
         Gp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456266; x=1782061066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZ254FuDlpkoeWBYpCvIm9kU06oNX/xzWLul6wUu4VU=;
        b=QSBcX9OUSnTrVTLj5rZoKCQaPtMUIddxZodyK1F7O/0JRaeIpqMZO9i3wKz/Ww2Lm/
         x/CmJwHLHOxm1xPySre3UhR/Go3cdBqE3XHAY5U4ATMGRevWgWQp1oeQyO3WkBqWaHfh
         sceaT2AcPnNuIMHG+wCHHIvoX8W7BMAWWvFV+9xtwQ8dwt/IBH5wH94ORDVswn0d6hbF
         6/12OPtW5EFbd5w4YTON8IsFR3hbVjZCV2bVJY/Ewb8234zL73KoxpQAdtYCKdkmNfs0
         Pa3CjxbbjqKCTsUSApMmrfJRh6t9k9Ca1w3AfVqsiV/fXn1qxEkgFdJHNP7yleAQVxRe
         rYBw==
X-Forwarded-Encrypted: i=1; AFNElJ9CHN1Jh0MnHzFU0GjyZa2njyLvTAo4+ewGF7zUgPiwePZTmg7PXa8ABPyBqrJVvL7rdpgqoSitMBZZS1VLQBb2@lists.infradead.org
X-Gm-Message-State: AOJu0YwQrZy/56zj6jYX467RWRFxllv6ZbadBETdnoWfFIQE0EfN5RKT
	KYfqp8O2zDyQmk8vbBoYVZGSVYHNeBU7N0ZKfaOAoIdRFtFbQdEEMcWi
X-Gm-Gg: Acq92OHp2ngt2SH3tvFS+V7HF6zoR+eHNntJfjEwXIHXG6EJI06yTFDmwtoUKLM7uOj
	xegefJBODhn2tNIfo3uy+L9KlTZlPqTQ65D/DKh9Q45Lxs8nyUssg4qOconi79mWq0f+J+XaHGm
	909jZgX/KyHM7teFDipiLCV5x5fkjqDv29ijqwPyHE3189Bjh5O+k3bv3orp0Zc4ydaDkBpSYt0
	ayh6nzZpFqWM58virIQbptjYutVfCYCYJF8/Z6udxWzfipLzX8egu96DhqFKkI+dw0Y7PBu75z3
	PDlPQcZzALdnBHGx8QJbWBs42LuTLReDgh6TnxV2isOg0T0Q4xjwVVmI7vpe2epKlIbkHyWDzOQ
	7ZgGHQoHiCykCeuQeaz1EilrnSBj6xMB3wPMZvWBxHR70Gic4YLiZSAP13I9IFXP7dx7+ANI798
	ZBAJJO+OiBWWpQk75UD32ldUb2ffDcUTOdKJCNfdRBZ4rEvHKDCpqG
X-Received: by 2002:a17:903:1b04:b0:2c2:5446:30f1 with SMTP id d9443c01a7336-2c6641641c4mr85637025ad.14.1781456266427;
        Sun, 14 Jun 2026 09:57:46 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:46 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/22] media: platform: cfe: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:51 +0530
Message-ID: <20260614165630.3896-15-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_095747_373096_1CA8001C 
X-CRM114-Status: GOOD (  11.55  )
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

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..17c523d32db7 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2039,6 +2039,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
 	if (ret) {
 		cfe_err(cfe, "Unable to register video device %s\n",
 			vdev->name);
+		media_entity_cleanup(&vdev->entity);
 		return ret;
 	}
 
@@ -2064,6 +2065,7 @@ static void cfe_unregister_nodes(struct cfe_device *cfe)
 		if (check_state(cfe, NODE_REGISTERED, i)) {
 			clear_state(cfe, NODE_REGISTERED, i);
 			video_unregister_device(&node->video_dev);
+			media_entity_cleanup(&node->video_dev.entity);
 		}
 	}
 }
-- 
2.50.1 (Apple Git-155)


