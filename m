Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035A5CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjmpe9xlvxdseuBEzCjZ4NLCBV7oog0bNoU5q4XDA78=; b=sqVFXNFLB2xkcaJ6Oq8WwsMNxH
	UqBovSdijQdygKaA4l2DbhxZ5EUlZexsVIXrMRDB2Pj6jGggO/t8gNRKH+oNWfL0ljO8GWrHU8GaE
	6uCEIJcGiBKkh/tjy7xTekkauZkneXg9Dxq/ykYBbPYgtSgN3+IQX049GkINVkuaHY9OJfDALj0WT
	nKnn7EtIOiNdtsvboi9N1ahdBfJ5hMrc8GYvaB5n9D32oK/xIjBRZol+ZwpBF9t4WNvRINs0P/BtU
	0RsUigdvbJIyBBY2LSZ21s/d3Uul7XLnqki0MpXs9EZQIhZcDtgkl667Sq7WYgrCdCMa1KYOM0U3O
	52Y3zHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvw-00000006UzY-0mgk;
	Fri, 31 Oct 2025 17:29:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvO-00000006UIS-0gWC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:37 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C2EBB5;
	Fri, 31 Oct 2025 18:26:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931597;
	bh=0VUnvhN+JpMns0ilAaC0RXBzsIqOeBD+ERttPQmNyI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rqmu002Jn4ajVplh3U5ft9HREwtt9GyJP0vx91+GU42zBiP2ZH+aEuooz7l84Y3ob
	 xE/pwVnRMVvdc38HECwGF7reFL7nqDCcn9od6keV2yQA7HU/cWYrUp2atfMzyqQEpL
	 qomPkgGB2WBT1mFufeKHRx6Eiju6X25cwC2Q5s9k=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:24 +0530
Subject: [PATCH 04/13] platform/raspberrypi: vchiq-mmal: Fix
 client_component for 64 bit kernel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-4-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1613;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2VK8OHXcpTdqTpiX4wSB7ZKhEke5bjaA9vgjkEN/2M0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGX+g4pLvMHyqwNp/aj0Link2ixR+06q0DXQ
 wacJ4x7sAiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxlwAKCRBD3pH5JJpx
 RRPpD/9C5Vm9gJ3qGANqziq1xjWZiDH0CsCzRTusupu78C7pddH8gCdhc4Up/wfLuYCyM7T0b0R
 Mw6UuBd1wvq9XUQYSMiKVClTEzRQqTcaa7Fe9vk+YvjUB4xRGJBdiRN1IfEzB+kv5DD88mte1Dp
 btx9k6U40KsmDestcjB1aN2fmgogWZg6Ti6PjxQx3H1TAbCo5nC1BHQ85G3zr/WFIZIXnC+3MpB
 pUmo/ZcogM4mCZcRUX4vJY1GqYZe8+XuUYYhfkjHlsTP39tanlWOI/T9yPBvCmjGTbJ9j8XPkMf
 PYgZttqE+2MFLDVNPsxzmKnN8XrlvI2YaLIjsQBXiTLGyc1kKyE/qdZuySR0c1imHYsIMB3jY6P
 qqFhSjMZV6k0TYBb37c9KqAnzVxAcheZEiWnuDdHmAZvJ9FLMioLGnsu7lazF36ggCQ9eF9ujqa
 ESJzwNNxRIGyNclqY62LxAe2KQyBwvVda5/U5vaPn7LK8DOx9bzIs7zDX9JT5nABuHaEV29KjPm
 MtzzcrIfOuJegTU552YtvxhTN9VMIY7++nwXEu40owLtWjz74SEsLHTbW/O9uyxx+QuoDf0hQp3
 NriZL+3waT+FQ/KlYNXGS6MrKSfZvafsoI6PVB8VDzOfxol3zGte3CdqpkSSxsWeZKU9KjiWgXG
 nTJY94EDZys8upg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102831_940566_2483A867 
X-CRM114-Status: GOOD (  12.68  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The MMAL client_component field is used with the event
mechanism to allow the client to identify the component for
which the event is generated.
The field is only 32bits in size, therefore we can't use a
pointer to the component in a 64 bit kernel.

Component handles are already held in an array per VCHI
instance, so use the array index as the client_component handle
to avoid having to create a new IDR for this purpose.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 1ad00bb0a02b482719a75749ed6ca50f43df24b2..6381495fc3867013f74bd3754ed64e0a1ce01574 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -459,9 +459,9 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 			     struct mmal_msg *msg, u32 msg_len)
 {
-	/* FIXME: Not going to work on 64 bit */
+	int comp_idx = msg->u.event_to_host.client_component;
 	struct vchiq_mmal_component *component =
-		(struct vchiq_mmal_component *)msg->u.event_to_host.client_component;
+					&instance->component[comp_idx];
 	struct vchiq_mmal_port *port = NULL;
 	struct mmal_msg_context *msg_context;
 	u32 port_num = msg->u.event_to_host.port_num;

-- 
2.51.0


