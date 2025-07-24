Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E14C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72qF7fxqGgOyqFtaJeY7jj9Ztoeu5thqUqJ3yho58sE=; b=fQIYRFWX7Gbqe8Cs9csQc6j6U6
	6kPsQEc+647G/e+rRV7tjkpTj7GYjOOwGUdZxoWkS5OpSmnk0epwdEKM46dUENWL5SgK06Q9ZagU8
	yEsz3gdufLe6c91iuzsxbXTFeccpr48O9zXjB8gQEwpBPBaK5/5cbiiiMKKBezaoNCqgvLMhzQvOy
	cxRHkFdmF85gzc4BRf5q6wZ8nOEvJsbIlyn8/Hp1I0k0ROek09VCREZQlGmylGz92L4pFjyzytVMs
	n17HhuRIr2123kySFWdGzEItVaFRYFkeMeWCjbSLpqrl7j31t0jYc66JfS378CgaqCx+l5/6WVDUj
	T2iIZAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uey3j-00000007uCE-1uao;
	Thu, 24 Jul 2025 15:40:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewen-00000007hnD-1qsu;
	Thu, 24 Jul 2025 14:10:51 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3280A1ACF;
	Thu, 24 Jul 2025 16:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366209;
	bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZW7lFNdA65XXY3ybK3Q73IoMYzD/RWIj+d+DrncsIh+Dqeyw7iP+SuaKMH2EbE78N
	 9Z5KWcqk3Jm3yGkHfMiv8wGCc9pzzOhf+IvT4qWCrQdDvQcL8No6/mmTCC6ZHX/UlA
	 1+TEp4oAHeC4mGn52A4ocO9NCaZWkZbTrLNhXhgk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:24 +0200
Subject: [PATCH v2 17/27] media: v4l2-subdev: Get state from context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-17-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QE00gkL8XXmeox2W9uHAwgb+JjO4ss6i47
 BwPdlK4VyqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PG3YEAC+9w342JKOCDxd2dM51MvvRVUhx/BFvFwL4CgpDaC7ZVi/oNGBmTGPo0X8SKnmhry1qvy
 u5C6hhd4a/ZMEmm+m6YmEMVMegZPpuZ0RloG1SLMBbq3ad33vSRnxn4FgUJS+VeuuAzA1Uy8aSc
 T19MV2LhqB5ruFUQbVX5U27vR5Bv1YJhmJPRaa+RXjR8+fUuCZzVKhc4CVk8O1m5yUhebZcKua+
 e/67zxAvx93NTRKexaP3zIqKDE6N2h2lD4zwh2NGMu54zNcA6cL7oHmONzC/4qXqflG2u0eUrMT
 PR/jJbHUxudATsUcsmFOLQknJuaRz4od1CZQQzaoWRR95Zlso/gv+mv0TOlcT0VYrP/ANeUZGnH
 gs+isw5mjA6D/d8J6zW3xjpJddjZKlPNVL19+J6ujlkcLzSH9Nc46vVwlYchjZD0KANFdIXfHTu
 eR10UwhiRG03ouAYmL+Q52iDwVEhuqbpWc8FQE8/N1QhRRQTeUsXpn5RKUTQ2q587I3zoMN3Kiy
 Sa6O5+eANcaExxIqOmmmXHpgMGKEqEAMf5598moofsRxYfoNFofIcWlFtwpGl4tliS2BxhUsgPW
 J7h64tP9GYKN3vTVDq0mxmCNWft/+7Fn4a4+14zzGjC1r3XxcczqAn2K1xpSnJR98xYd/Xj1Zko
 mz5/wj+gouL6BVA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071049_653678_2769F8A3 
X-CRM114-Status: GOOD (  12.20  )
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

The V4L2 subdev ioctl handler retrieves the correct subdev
state inspecting the 'which' field of the ioctl argument.

So far the subdev state either come from the file handle in case of
V4L2_SUBDEV_FORMAT_TRY or from the active state stored in the subdev
directly in case of V4L2_SUBDEV_FORMAT_ACTIVE.

With the introduction of multi-contexts support, there will be a subdev
state associated to each bound context. If we have a valid context,
use the state from there in case of V4L2_SUBDEV_FORMAT_ACTIVE, and
default to the subdev active state in case the context is not valid.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7372f61127c871cec44a3d1900e2b8bef34632b9..66c539d880127844893620d325a2b05ac4aa9e96 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -703,9 +703,20 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 		break;
 	}
 
-	return which == V4L2_SUBDEV_FORMAT_TRY ?
-			     subdev_fh->state :
-			     v4l2_subdev_get_unlocked_active_state(sd);
+	/*
+	 * If which is FORMAT_TRY return the state stored in the file handle.
+	 * If a context has been allocated because the subdev has been bound
+	 * then return the state stored in the context. Otherwise default to the
+	 * subdevice active state.
+	 */
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return subdev_fh->state;
+
+	if (subdev_fh->context)
+		return v4l2_subdev_get_unlocked_active_state(subdev_fh->context);
+
+	return v4l2_subdev_get_unlocked_active_state(sd);
 }
 
 static int subdev_do_bind_context(struct v4l2_subdev *sd,

-- 
2.49.0


