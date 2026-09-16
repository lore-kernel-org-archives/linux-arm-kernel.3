Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70620C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKaubhJSQ5I1jDBPAWZj9pjI9Fq7B4Bhv6/No0UKhfc=; b=m/dClMGWSij/pqJ8I+5DIPZGKt
	udDMcF/viGfqDU1wnftTa6IjN/SW5q0FZh1stMhbNL8SzuVw98KW3H2ZffSFlYFaWnMJJkYUJL/jp
	htGvpfkMXd50TiK/Fnt1AZZOeH25JUbhYzeNmLxckufH4JF+mcjWGqwZR6I5Fdk48gARke7f/ysPu
	K4tBacgYKqpWKdkkesoPY1IgO6eBmpOU4VgN2sQkIaASPF/A+iiFioUXN1KQZ3r538Eh/1d+nFbLh
	TxeurwnAzle0lKhRKprmmcAKZFhxBs9/kAz8QtuX2ZvyUB7f6HSsI+lYUsac5PnulrZEi5l7QQSqR
	bmD73EeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qai-00000009Ors-2Iyr;
	Wed, 16 Sep 2026 14:26:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qad-00000009OoV-2pyd;
	Wed, 16 Sep 2026 14:26:25 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14A3FC42;
	Wed, 16 Sep 2026 16:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568680;
	bh=+QuhmE5SESp4++tQAdCkZbcccYK/jFHpbXh6SULYlm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pqCKom6Ght4XZ9RsYSpcHIlnZdYoNfW5Udt2mHLfi68JJBjgcbUg6S0eUm36rMcEp
	 NT2EL7lwIngTwnlTPSzR2Pu0tIIgULKZnIv3DiiwoJZNR1poyeQA0snBkH7L5zAGSX
	 7r7QWp/t9MMdV8sS/9B1B4cLWaim5FntOsm+8G0w=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:31 +0530
Subject: [PATCH v4 1/6] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-1-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=sMOtM66Tr0BbnLrbjtE+KFfUqM59OoL9ixffhnJPpV8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqb83r4MQItuT++av1u5omKM21cuJ+sEfs6ia
 Vhu9xW7UuuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqm/AAKCRBD3pH5JJpx
 RXQmEACQEZqcQZ0AlRapMqomghGlo0BFKkpvwK4zs/v/LgtZTngMScX6dEazzXOLEEOouLmJG4K
 6alf4HJfXs4KAnErobBJqhlzD/WqK7vtWNIgGFr2eWkstuvWHDG8Y4dRZrgwgMK+USlKUuE8ONa
 A/6WjrMEvi8f9s4vyGJoFK2GgTT76K3b7sq0dFHzv4ZBpZT4nNo3WvPHGMmCMe6+CNwhW2AQet7
 bXXIh+KUEtmXWj+iEXkvNKB0P15P1knXSWWr/q0WJnNmM1oYz5fqfSkrIU1k/no3pjEAcDweoxq
 CGmEBOS1A3MxjP8L4sdlnCvUgISGpK34dGj9WfLuB4AHh1N6mS+/TeS6Y+sbKKr9+gBnWX7UdrW
 i3IsnvAuKFSHjerWgiFKRdabRXMTbu9b25pqMEwOBSwUBGIId6dKgBfdbAqB3pUYvsP8pZeumq9
 4K1JF2MfM0TWCX7BvCHMnOSNF5OgNqz9f2Ix0lQIJPfa79tiQpoAq7DfmGsOpRtKZr+jiSdpm0g
 rLOPwB8wt7AEgjspbANZX6iNeXX6UUUjYM5+iwlnoPvTPB3lxIPzFakN/R7kcfsHJ6RUf1FDj4D
 Ym/HPjOLbEHlzHuO3qXMKBmLC84HdjpNY9lMVeiM8FGKkPUXhYB3DMBiu2gfJsPxSygwFaQh/ID
 vTSQ92w9fxQRNzw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_072624_133565_C49F19E7 
X-CRM114-Status: GOOD (  10.37  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Should we go through the timeout failure case with port_disable
not returning all buffers for whatever reason, the
buffers_with_vpu counter gets left at a non-zero value, which
will cause reference counting issues should the instance be
reused.

Reset the count when the port is enabled again, but before
any buffers have been sent to the VPU.

Fixes: 70ec64ccdaac ("staging: bcm2835-camera: Ensure all buffers are returned on disable")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index c89c16fb8b33..918c30d84ba0 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1364,6 +1364,8 @@ static int port_enable(struct vchiq_mmal_instance *instance,
 
 	port->enabled = true;
 
+	atomic_set(&port->buffers_with_vpu, 0);
+
 	if (port->buffer_cb) {
 		/* send buffer headers to videocore */
 		hdr_count = 1;

-- 
2.55.0


