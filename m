Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E35DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6qGfwpsvxJit/RNNolnFaQQmizbLOaIKN2Vp/sB4gas=; b=2c5DFyXthea7U2qPxXhL8XDoeZ
	cWG2z52lvhGC8zLx3lkgR2sp15JnQnShrMUsmkqokCNBs8UdYv6wkpo1tA6lbJW2vfmvLOI1ZZvYo
	HrGQa0yDttiRTxmsbSNPsad78shYTdZ2k45wB3MFM9d0OoXNinkD3gq5B0P0CagDY/uXZfPJExw6e
	L84eMhFh2wds1uNCxwKnpPwx7cVQ5vSVwWN+iu1l/ahZbyWrAUMbj+nXNi7gTXDVHlvXQRo0EJvps
	cIj5kbwc3YFYf3LLLdGWTaIZpWuJgoqlobwMi0Y0jKdxSZeGw8XParZayprG7EYXUaaF57N5hnNm7
	sZlTGrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZHV-00000000ZB4-1XWO;
	Fri, 06 Jun 2025 15:46:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZFM-00000000YTW-3SXc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 15:44:46 +0000
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA457446;
	Fri,  6 Jun 2025 17:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749224677;
	bh=7SbusbtCH84+e5OYmyU2EqnTJRP7YU9cbC518hgfyjQ=;
	h=From:To:Cc:Subject:Date:From;
	b=L/tWR5mM89JaJkR3vHQ19HSAPwApL8uCIo6+RyKggBWbLW2BChyqxx8XMyLX9uT7H
	 cYhPxuPaGERpzS/h9tMjr1OSduyHh/Y10gq0FirKNveRogp5PL6VnSYVKC7CUm2u2O
	 rSfiQ2gQHWiXYEftUuM7SQxw7JrBzfa1ebQoODAU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 0/2] media: Add line end IRQ to imx-mipi-csis driver 
Date: Fri,  6 Jun 2025 16:44:12 +0100
Message-ID: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_084445_183520_E741BE0A 
X-CRM114-Status: GOOD (  11.28  )
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

Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
registers. This series refactors interrupt status register debug handling to make
it more intuitive to add other registers such as LINE_END, which has an
entire register containing only one interrupt. Previously, the
mipi_csi_events[] list contained a debug enable field, and this replaces
that with a status_index, which indicates which status register contains
the mask for the interrupt.

The second patch adds the user line interrupt, which is useful for
debugging, as it allows a user to trigger an interrupt after the MIPI
CSI receiver has counted a configurable number of lines. This can make
it possible to discern the true resolution of the image stream reaching
the CSI receiver. It adds an entry to debugfs which lets users choose
how many lines are needed to trigger the interrupt, and can be disabled
both within and outside streaming by setting the value to 0.

---

Changes since v1:
- Moved from magic number to enum in status_index
- Clear INT_MSK_1 in enable_interrupts() when on == false
- use local variable in set_params() as in the interrupt handler
- move interrupt handling code outside of spinlock

Isaac Scott (2):
  media: platform: Refactor interrupt status registers
  media: platform: Add user line interrupt to imx-mipi-csis driver

 drivers/media/platform/nxp/imx-mipi-csis.c | 107 ++++++++++++++-------
 1 file changed, 74 insertions(+), 33 deletions(-)

-- 
2.43.0


