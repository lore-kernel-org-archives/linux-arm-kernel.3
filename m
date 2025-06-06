Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B749C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAl796PaIpq1et792ayTktc6N9kECzhlBzTyWUc2rTc=; b=bxBrjsS/0isQu6Veh48aKDS7YN
	RFNYA967DB6zVnJiJaDvUEEJY+rC1fwHyqm8dFCNB6upF3WU4DiMzXRytNsnYkoeVT7Jf/UuZuG4y
	srLQEKO4ilksfGQzRuzZLP3Y2Kx2B0+MYp+brPTMcj2cosh99knfjSDMavurRMoap/TG1qC494yqQ
	8LVywsyUHgeVji5/krR04qt2Kg+DFvL2MyowJlGKYYfuKPnTXrkQIC3vfgwlFkGBsQhlKx9bRmygw
	xY6VxMPlOkFwbw+3P5kpZPFM89IUhK0l4FySiVHHQwJK7+Pw9nO8DU7Kc0RzBsgfNiw+l1+w55VE4
	8RYfNnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNURM-000000003fS-3N0D;
	Fri, 06 Jun 2025 10:36:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUKP-000000002tS-2Dgj;
	Fri, 06 Jun 2025 10:29:38 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C77A1340;
	Fri,  6 Jun 2025 12:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205767;
	bh=He0s+tyNVfHnUMKL1lDOSU+7xlicumSDIBITTA0IwMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fulbXStvWLTGnWN2A5klkVTQroHmlPbqPwV3QlyEmb7anyPGjeyGELJhCLqRZgoBH
	 01HHbyMRund+RQtQWAOfK20l7a1qDMzq4Bl3dBKNFmAdOH7VgerdLczOv3AgQpLInT
	 jJpyq4EJ6UDdxV/t3sUbX5TdvS35WWU0ASTbpcm8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:21 +0200
Subject: [PATCH v7 1/4] media: pisp_be: Drop reference to non-existing
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-1-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=He0s+tyNVfHnUMKL1lDOSU+7xlicumSDIBITTA0IwMQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMIGt1fda006Td2LBAA5RnOpAz2jRvhSDLeH
 d/T88NxQzGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCAAKCRByNAaPFqFW
 PDOvD/9DtemdGJeu46ceFrfKReelpDD0ARPiehQx9Q3Fesv2XCKxRDYPras92HBq2nV3tTuGMAR
 vFUIgqziS7COcYUU+cjBC7kPMzWxnY7bjtQW4D9WPdCnKgumq7fOPrIDGiJmxvQv8XWY0dZpPNV
 gGCoS2l/wXlZxX3W7CXtLJ5sRbiKhD6vLnzQx071Ao05sK9N2WsmJA/2vqgZKZmoWaBgxl+LL1J
 y/DHtKdaL27MerUcQ8dU1ZlZ+MwDRrj/l3d8hcI1tq3/xsCOGefkQBhmEYRyfrcAVkVTsfLUqj5
 dANQbKmUNeIINPlQ5d3Gg4suvCGycGR8P3f8scTd1byHPwHpxbT6DVwlMy/JL6LieG6ircf43FH
 n4rUmFPzrzhDTeN24PK2kZl19rUYFNh9zBvj0JQmqL4oz3lvNi8bn3TDEeFpTlk7yYmTgEAqPOL
 hTSV3633VzS90DU9zAngZ8bT37Yx5pWpfm+m93+UYgm9EJuZcg9HM0wL8BEK0RLa3CLpjc50y7D
 j+pIJ6x6q5zKwFY3HSApDdpqrt8P7B8xW7oW+H+QLyNM809ZWr/ZHXCPMdLa6xGaRegfHHm4L25
 1NniFBdNIW6XeS4SstPjaGC6I9isRb6Qklk8oFzhTdb095Ef52N6O58ZVLgA0vOayAbYsnMX7lp
 jICGNfv5DkSJjAg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032937_710723_D24D53A1 
X-CRM114-Status: GOOD (  10.02  )
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

A comment in the pisp_be driver references the
pispbe_schedule_internal() function which doesn't exist.

Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6..b1449245f394 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;

-- 
2.49.0


