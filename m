Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0zBcOBt6imrrjsin7GEVhYBCWSxjDlq4dXbd8CaQZs=; b=Wl9I13B02hSlh5EoW6KIS5CgYe
	MQaen7/IoP/EQXGc7Q7OhbjdDPvBhxugQGYo8CPJ0NRG/25kzoRhUAVkMyGKFZYOD3GBYXOqXKPJL
	Lu2wrC4kJhVolPyCvvDgKJa5TSRHUQ4purUzqrROeuEV+FExmOaP5Khowhc06sTeX+rl20T0JZAMj
	H1NPbkRHSvn8hBf3iGcsRnZkVDPWxwOtEhNqKn2tNI3sMGSfee4X6AZQeGrrqN2gkwvzX82JH/H7S
	PmnL0j8XVikXwcmIBOV5w0yQ+KWx4WOzTUjR+CrSvYGE4WKqsBnuulvc0lpfMn4PAB0cVCf7hdl+x
	f7uuzr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3Z-00000006Y5e-3Kkg;
	Fri, 31 Oct 2025 17:36:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3V-00000006Y3J-3OLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:36:56 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD8BA16A8;
	Fri, 31 Oct 2025 18:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931634;
	bh=5LsFZf/cIZrJvTxKTyeuhDVpVX8Vu2fnD0rlBUYfDdE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=brKhu+F3/ZRM/yOou/442+jj52hYUp94MxAi9MLiP3xMKIax2qmXoteg4rlTE8k52
	 HngMmcNsp7WkN+B/Gt98ljKXPvDlg2a3cOFPEjJL3jR8klcjPLVc9UBfBEkNUJFblY
	 TN9ZolPxlnq9YyF9BvOTz3ETco/+y6AH9zr21T4A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:31 +0530
Subject: [PATCH 11/13] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-11-0dd5c0ec3f5c@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=xRyZ+PABcf09n5xFUP7XusKRU9z53iVixMht1alL/A0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGe+YXRZScfcvd11TYSAIT6cz7VulpYyCdGN
 b+AW3CIOimJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxngAKCRBD3pH5JJpx
 RQ7+D/9aCr4U1C13o6L/8MAlZAO+/GW5nOOwjVt/uijThW+GJnyexb/ttjdJ+/R4vdO4NxSxP+6
 rDGYpQhMbFiaAKKd9wfMW+Vo4+dRAW8S2oy3PLKoGJVNU0A+sx6dHLbByDiMsg73ALYdJT5DwBu
 J1VwCfMoPuqVeKiVbRtZZoSYkUBlptGmsbqDqhQY1S/PB1VAQ5uU8bysjEm0YKqGhiWwXZPSik3
 q8wgxim2pr3aRd1cfGM5PfyM3FUbzQRVK4k+B2Jxwxx2WtH0FsmjjN6/8DcY2z5KJrf0kMOTphz
 WEJwOU+kHIrRtfaHLVB5ei+1npC2y07IzCkhjn/mgdTbEHq0moUWH1nQbRPmmxbBwCUh3ovLn9t
 sYfI8A4ncKfoFh0ziwT29DF4X7EGZQ9EHyN5uAZ7bkTni2bjz8cKFZ0LN5p+K30uSv9b/Yv2wKB
 RGaBGTy2H+6sXNtxoszQt5irEMwNaaXpUNfv0XQVWDhfCxEWKmO28W8eN74k2YY++0gZrzxGSN7
 86VpsndO1CZXzhJYdJQ/SgvC7fwPE9vebHA96+tvvZCHYOnJwSMsnyUljc3VI5XFr5C+MxP7lIY
 bjIjfVSz1d9DiUnSxpFNaWDnGDu60U5rP9HfHjpKmgyXZvNtJpDKq09GNTmWwvJ1Ecxub27UMVq
 2jZ8mp83cYQFc2w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103654_004265_078CD605 
X-CRM114-Status: GOOD (  10.44  )
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

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 02fbf061c171cba287657266aa1731333609b3b0..f9e1a773fa55f885f240f4945b980f77676d83a6 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1490,6 +1490,8 @@ static int port_enable(struct vchiq_mmal_instance *instance,
 
 	port->enabled = true;
 
+	atomic_set(&port->buffers_with_vpu, 0);
+
 	if (port->buffer_cb) {
 		/* send buffer headers to videocore */
 		hdr_count = 1;

-- 
2.51.0


