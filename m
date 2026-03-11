Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5288D106286B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=16OhHuTtVM2d47b3Tm6P2P+rIcsTkTQqqx1Y4lwcMk0=; b=VBwa9F6MfJ+cSS
	y1Z0eBZAXNnaOnupHPdcvNMlQb5YoOlP4UAc0ckNa+HHcOrrrx4OjRWEiFD3ABS8GXWCo3tWesdRS
	gTEv1Dk1TM+svhGi+r2j6jIT3FHbwXemfkkAU/WkcFBpY3lUlGTOxvmiEk1Ot5xaXo2HFdjah553t
	W2Wz9bSfs/lU0oic1M/SXW3RbkvgH2QB0a1rR4DsvjFmGlhpyG2V0l/4OrvId6JsCgo/N2+8TOe4y
	XEeOIzznVd1LsmjA7exlWrx1ZnMLFaEdKChnpueKrAP5rn++gz9OOUm3jFTz2n+Vsg/7zbxROYcVn
	m2tWDBMF7/II+91Y9sEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I2l-0000000BVhV-3wCQ;
	Wed, 11 Mar 2026 11:48:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I2j-0000000BVgM-2sr9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:48:02 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAF5D4B3;
	Wed, 11 Mar 2026 12:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773229610;
	bh=AGwHhWByJI2Ulk/BJdMl7Vr3SrlvDzIRbrmITlOYusc=;
	h=From:Subject:Date:To:Cc:From;
	b=TBshuUdRr0YCSDav09H5qwbLbXW/UQV6GvGsCH4zsEM6AYn4QP+iUxXuk5iysXKxu
	 U3DKi8OPFuXhs9YaOHcPghxjk25gAvN0XEVbOWgGHEPtxkPk/sBiaminzKK9F0rqCM
	 AN48OvTaJbcTRZSe9lHLToWSV9Tk14X3FAYq0frw=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/2] Minor changes for i2c-imx driver
Date: Wed, 11 Mar 2026 11:47:42 +0000
Message-Id: <20260311-i2c-imx-fixes-v1-0-e625034d8202@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5WsWkC/x3LTQqAIBBA4avIrBvwJ0S6SrQQG2sWWSiEIN49a
 fnxeA0KZaYCi2iQ6eXCdxpQk4Bw+nQQ8j4MWmorjVLIOiBfFSNXKmhIG2Vn77yLMJ4n0x/Gsm6
 9fxPap6hfAAAA
X-Change-ID: 20260311-i2c-imx-fixes-3e23164a8a8f
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=AGwHhWByJI2Ulk/BJdMl7Vr3SrlvDzIRbrmITlOYusc=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpsVZmrWuzyiYgnxjrK3GT9VAsgeXRMfTsY5ISt
 drx/c6eUgSJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCabFWZgAKCRDISVd6bEV1
 Mjg6D/9Xq1HeCY1wqZ8n+UDcYSJoSgQ72XO+2Qq7HH8szHnqmLWKxz7KqtSH1W92pe6k7axV43o
 4c+OdXN354yMheWs2CLAnURbeAWmkChT1TdFA3SqR/O8vBeC0XMq/mrMzKch+P3J62aJqoGSVWy
 QcGy8n7llUSyc6bdZUj5AOmlR4IwXuyiUHQroxPZsPlekCKVGLu0+In8VSmWv9L882MusO91ApO
 Tl96O/Ljsjly1mJhpJ1klTAm41aFWorBwJ8Ey3dHRMGLbpxFcPmUkLl627F6HWq2uZ6/bdz4Ork
 dRv4n84f5cPOx5PAS+i/Kxn0GcWoWFzHpQquWyPPJTgY25E1u6wDSNm0Z3hm1Kl78BKxBR/pHUe
 bDpvQQ7PF0ZsJCltEtuKvW97sOeuL7ogQojpcpuGV4MDnwuM0vzPiCQ2NudPus2lsQNkCSBC2Yi
 bVo/qRxnVAEV14KpNp+tHPjZtp3uzZJZgE2c/1MJ5VAW3fHib1Q05dRA8LzTidsVe+9NjrNtJDX
 APuAVX4Y9VumrVehdnGqPfLXxws/TSxVEvj5wf7KCdobzmZhjsj20khovv2Rfut7xnKbtclW8+0
 oXUe/aDEDgL45+fdLqzMrt3ifJ9Uce7nv9VHihYGXVGMVteobb1Urc8noUSPOZ7ESPGVclBd3Zt
 q0gZ3aB2lmy3p3w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_044801_869524_FCE45610 
X-CRM114-Status: GOOD (  11.89  )
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

Hello all

These small changes helped resolve issues we experienced using the
i2c-imx driver on a multi-master bus. The device was losing
arbitration which triggered the driver to attempt to recover the bus
rather than retry the transfer. The set stops the bus recovery
attempts on lost arbitration and instructs the driver to retry
transfers 3 times, which seems sufficient for our setup.

I had intended to make a larger change that added a new devicetree
property for i2c-controller.yaml that held the number of retries an
adapter should use, and then parse that to set adap->retries. I found
a relatively old discussion on the list though in which a similar
idea was discussed and rejected so I dropped that, but I thought I'd
mention it in case things had changed.

Thanks
Dan

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Daniel Scally (2):
      i2c: imx: Don't recover bus when arbitration lost
      i2c: imx: Retry failed transfers 3 times

 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: b82316862bea929265725c077dffcec42e3dc20b
change-id: 20260311-i2c-imx-fixes-3e23164a8a8f

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


