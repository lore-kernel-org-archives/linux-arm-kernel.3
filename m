Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2E6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVdb8TcZcGiLA11zLQgwOEi2kMI+zynrBhvgvBD5Jyg=; b=Wbn8VAPehrDatzTPGSX2t3HLbM
	kD8oqwD/7mzp2sEgR6ajg95XZkEbFIFh8REd4WND+yR2QNSTaXDr8/jy5iOk2b/OMKhSwSJbopxAA
	8s9wCKqJcO5Ll1A7OMHaPpqkCPrz3IVMBA4lPJP1E8mrMw04CDfqHwHiRkz5TnxuH3QBghdEYO1Hd
	i1Nd/WBsVvPA0FFu5PZm24PH5MT8tkXBr0esHUwzrKo/Y7RGUTS1kAqiiukSH+m8G67IsqJFjvL1h
	bH+94I4CCLUpxE3hVQY5++/jR48ixWXlhL0EziuGhZdAqBN0EJSvLLW3WPvGUULTWEzuQ7FQ9OOga
	D23WHTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKe4-00000008K7Z-2nCR;
	Wed, 12 Mar 2025 11:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK38-00000008E5a-0Akb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:14:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F971595;
	Wed, 12 Mar 2025 04:15:08 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340B03F694;
	Wed, 12 Mar 2025 04:14:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 12 Mar 2025 11:14:32 +0000
Subject: [PATCH 1/3] firmware: arm_scmi: Ensure scmi_devices are always
 matched by name as well
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-1-51a514282794@arm.com>
References: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0Wyv9wb0h9iXqhIZTv5tNhA93oc9d4C+Qyual
 VrPBlMHEcGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FsrwAKCRAAQbq8MX7i
 mJhGEADJ5Ql6CA2xG6ytPemPtMmfbYU7br1oH2T8bNMWSViSN0phE24IC8THl5GRuEINKhqV8TR
 pHWqn63ir8oEC0+abPZpmHprTeobvAQXc+EcSBSgbzdAv3Xr74kyM+mxo1icEjBGLO5ou4N6Qhe
 kki2mXbNI5fz4xpMNIGg59MbHST+8a4usqMaOUs7OD7MiGcVx/lq7v/PpfT8TCkm26D8rXM/XX2
 Uo5zwx6Cf1cMN/Athniadl1/lnjUE4GSg8lCTF2meFCIzQh6Dbev2YH6F4DuiOfVYwN9OllPsX9
 UW9M+ShhqbtDsjCkxSNRjvhk9jgiAAkx/ZFk+3xpjqEooH6vea58Txu8538MLOno242lnYtWVQD
 ZEc5gH3s0mOoaSOieRoMZ2XlaDjRnm33UFwRHu/kC+EDjQLjL+HnFr6AHKTlQb89G7Y86nZkzLQ
 meGBiZ1DodtyEcd0V1iPxzM9WEJdON1i8iy5xW9waai/q6PAB3XktvW2mwbCyN2hMnhh7++ggJU
 2KPbeKQNLKCNCWTQdUyo75GQEx5IK44GTKvqeK3UpnS5znRFDOdy1URc6jlPS3UH87ugfrU45mL
 LGE4IW4WUKwfrUiBwrsdZnVFmuZmxPCNjjdrhLUQkvQSv3i6AZF8531t6XwvgOldH0q78oDKakC
 CUjcr1w3mlZ3Frg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041458_123931_B04EAE72 
X-CRM114-Status: UNSURE (   8.74  )
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

Currently, devices without a name in the id_table cannot register drivers,
and no scmi_device is created without a name via scmi_device_create().
However, the function __scmi_device_create() allows devices with no name,
which are then labeled as "unknown."

Removes support for matching scmi_device instances without a name,
ensuring consistency across the driver registration and probing process.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de508d312e2c4fa2e27ba62ba3776a0..050a5ff5dc96a7df58edff5faeb8c1ec6228b97d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -214,13 +214,10 @@ scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_d
 	if (!id)
 		return NULL;
 
-	for (; id->protocol_id; id++)
-		if (id->protocol_id == scmi_dev->protocol_id) {
-			if (!id->name)
-				return id;
-			else if (!strcmp(id->name, scmi_dev->name))
-				return id;
-		}
+	for (; id->protocol_id && id->name; id++)
+		if (id->protocol_id == scmi_dev->protocol_id &&
+		    !strcmp(id->name, scmi_dev->name))
+			return id;
 
 	return NULL;
 }

-- 
2.34.1


