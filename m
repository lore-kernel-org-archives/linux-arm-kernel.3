Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F2CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PDOBe/G+MKxXSsZ/jUA4bC+5jxJ528lzQ/f0YmyLmk=; b=bVcY8CJiuUadxC6h8a+C18cB4j
	/XHZSOqFztYkxTR5+48S/AXml+aiIPKwwl1JAjDjITzVAbdo2g6sDqNSYd0/QonJCd+sCKWkCHy2o
	cx9VbeiuPJ+ftKbYI6bKbkwOcOngTFNGlf50mVpeTagPO3GsDi//Gb0Wre+HU/6CiV/wBP+5V19MV
	xcgD0EuHc4OQdA1E6QTrIXrbrEA2QRbb+eO3TATwFZS8OE7+p7aLURwzioedfwRy+zEpAxI5so/ds
	vA5BEWciih1WsWRYi52W1C8coRWAGPc4xytmWUOl2pmN9glQDPHbMyEWIEraP11EaRBQ/0GUMRKS5
	EzscTO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvI-00000006UDO-2Z1f;
	Fri, 31 Oct 2025 17:28:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsv7-00000006U44-1S1q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:19 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1EEE3A2;
	Fri, 31 Oct 2025 18:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931581;
	bh=l68kN9KWDjW9nSkNO372Wnz3xFDAD1FzVJFblm6+7pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D4wBnh8rAxcgn6ryZtItSuDdg0e5rsCnnj/+oPNrGcrn//aEZDkkAIy68TONrfQEe
	 rZT3vAh+HADcrdY2EjHUfZbKTvWnCneR9yE0yz9ZHZdIn7etKg8doWy+Ub8Dja+tf2
	 dASRZNY3iIaJmmbdJskuYPdZwKc/VC4cRb9psxb4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:21 +0530
Subject: [PATCH 01/13] platform/raspberrypi: vchiq-mmal: Avoid use of bool
 in structures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-1-0dd5c0ec3f5c@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=dAC4ccqqIuDds5cBVf3x31HLujLoig4utiWVx2tzBPM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGUV8VJlXk1bMRIIzM6TX/TQUmI37R6cD456
 M1HZLx4+t+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxlAAKCRBD3pH5JJpx
 RazcD/93LmOyrHw43/Q7OPUE0Eecq95o/vz5Tnmsdd7jFhUYmzxOzJcEhDnhpIYCnL1HiXPfW7a
 eAe8FFZ4SwSdgV1uBHEUf2fEc2H7V++r0bgUOwFhWDHVjUrfE0d6Xj45PP85YuzR/dDSaFfnpCv
 X1Rdq0yKdtekoXHbUd10HL6vhKKFysPD+B7INA/L+85sn5U7qvL10WnLHc1r2aE9Lsancwv8nCS
 G0LwKQPoX+nbfh2vzgaCEbll6Pjce5JWaDNzk32niWGsXb4mDIhRRRqtnDjjfQRmdG+cZFJP87L
 6e/MM2KkWpPwLLIzdg/fzvR+P+BPF+fEzMJrjEDzuCkrGh49Cx3C0bR/9NJH0WtqG/0Av1w8MdW
 LlAhMGzKbXSi+vMfIoGy8mEWhTR6uWuoc6Pk8cyj60FldXR76NDWkKbVfyni0saF2KrOGNUdt4k
 YuGeHH9QcQLG6Yp0ts/b+EBXxr3d982eMcExwpDTY1exYW/Ek89iUR3MHa6FLDw8YXEeg/Xo95Q
 sBbcOsOdu4lp3+XTERyEaMMJkhVY/Q/T49Fp9nqXIrS7htS7cKGfOYW6Gq6SHOx7F0PcoKHzrpJ
 1xK3How1d4qETh4Xd12bo5/4ixuY+n9IT3hDtMNBcbcpfNeUgaGLxAmrn1bPLWXY5Ei04Gfw2pK
 NlI5jhi/1TaoAgQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102813_542191_76CB0CBC 
X-CRM114-Status: GOOD (  10.03  )
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

Fixes up a checkpatch error "Avoid using bool structure members
because of possible alignment issues".

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index cd073ed3ea2dd9c45b137f1a32e236e520b7b320..82c2c261fd9cf0669cbd2ca7c814e0703317885a 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1776,7 +1776,7 @@ int vchiq_mmal_component_enable(struct vchiq_mmal_instance *instance,
 
 	ret = enable_component(instance, component);
 	if (ret == 0)
-		component->enabled = true;
+		component->enabled = 1;
 
 	mutex_unlock(&instance->vchiq_mutex);
 

-- 
2.51.0


