Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20628C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pCOJ/lNcueIJm40WFpsVzud66W464mBQEieQPMFnbQ=; b=Pjva3bR/LxNsn2NEXsDVSCuQIt
	C5fTe+aU5mNZevAQa/RmY31vTXCd+Sgzb/o/5fyxwWp4hKIuiPkRv6uOTOqkuhbwbEeeQpoZVMwDI
	EIJJi1iO9wQYBw59+H8JlskQc/DPIjJJAYe3WgXnP83/Bcgygb3pBGWaXHvlr3yOb09RfJDHZ9nDc
	b+uFhCRFPOMHUZPzcC8FF8k6ffl+LxkDLVLMaNiEhVh0IaN51TxMY3qHA7IKp6nb29Z3fjf81pIHT
	7Ue/KsDPDFx4IllBB0wtlU8tOmLcHYIYakUAwGT8sj8C/3pXeEvhy5Llk8Tkg7pPwqHwTFIlYuSla
	j7Tp7VLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgPq-0000000B1Cn-3Cj2;
	Mon, 05 Jan 2026 08:58:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgPo-0000000B1C2-0OZG;
	Mon, 05 Jan 2026 08:58:17 +0000
Received: from mail.ideasonboard.com (unknown [223.190.87.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E8E1103D;
	Mon,  5 Jan 2026 09:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767603474;
	bh=Y37QqX1z5ND57dXhUkEl4k4NLtL9Lq7cfe1c4EYWGJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nLobJJOPZkHbrnv46JSAQRLKUWJYORpaJ7L5DDXtC8VrVkHNNuBb0mmN0Wv6jhwaU
	 HNYB0XMmNqd1NF1wbfm7N0DNFvUr+umfOBSF9WQ+TRXJcFjZB4Gp+Ww5DeoHKGTiOE
	 s33gnr9y5DKOKg+oSJWaWrXjw7F1t964YCX4EIRo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 05 Jan 2026 14:26:47 +0530
Subject: [PATCH v2 1/6] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-b4-vc-sm-cma-v2-1-4daea749ced9@ideasonboard.com>
References: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
In-Reply-To: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=JSgZMYealuIOds6HnKWiS/7lNVz/h69ewVfRbYUXbFE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpW3z5GpoW5BzlikLwvbXckRSzs6+GF/mA06/Xa
 Wsnj2/3hNeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaVt8+QAKCRBD3pH5JJpx
 RSOmEACCIQy+1kWfGHlfjnX6xuXtGaquCw0u35BY55qUwUq+ptoWF4h/jMIk86igSlucEXlA9Qh
 mAEuhKTIaI49agEDsJKmmTtBMe0UP9ckmig44prPwRmknT7WqfLwFx5IEhFcqf6oMcD3qSwYtvC
 oTExTLI+a15jWq9xdZwh7DOQ1Ppz1M+eKMNnE9u/8jdAvk7WRbG/E/qWvKmOPJthjfNHQy4c3sW
 WYL/9nq5iciVf1Z8xgHDWRZUdDVwyNzzLNBILP+9Xwxmjrj4voBiibxlH61qkzI6YS0AiodxPrJ
 5l/p0LfJkW0oess+AiUiETktSChi1Q56i1saVbmbaRXX4X2/sbo9CkSc2lkMUJbFpJuV/ACyHp6
 CrP0jLHIVmJyW/Dfk8Y2/hypt2qMkrr9N2V2HeaKHcdabb27qRT5i1XBSs6VEb6RNwHi7dOEgup
 mweLinLJlAMPSjzsNzLoaioNp8MuPsuMwntbB3z8sBefoJZvrLn1usZZzciv6DxCO0o0AAeWDOq
 ehMtm16b0Uu/GNt/fT/VULzedgRkjEuaF/hIvNeamcxEyv6PgtE+92D+2yPwNAMyd6NXCoiWbhy
 fVwYw/LScJuOp6WCo1hzL8bsnjLUJqwOMBL4WQZLDwJhqsCnNev1duswio6RLSwjUHyr+Db7MyY
 XiemDOqq2HzT3wA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_005816_280719_77DCD29F 
X-CRM114-Status: GOOD (  10.49  )
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
index cd073ed3ea2dd9c45b137f1a32e236e520b7b320..e76551948bd9c4f60bef1138280fe8dd9d32477b 100644
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
2.52.0


