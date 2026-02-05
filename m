Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67348EC1E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5kJ5So4odapUmQSEHzO1ZGFPEGEuFpp4sOyhyKgs1Q=; b=trm0E7yNFyjrDXIJ87/Ltk2GyB
	19ad4vYj2fGXI8xnBhd1SltbEHt7tPzvaCmZGStS2EaKnQ4xAgvRzwnQeUxG94eEojIhbhvJfQO5z
	2iAJ+sUEfoMhSKb+ujlm/YD+io+LOOUquNPGfCLsdk8KNYJWLAJEggyAfb386rOx5rmozTPLARzDE
	dnjApQGt8nMVObhHTDpRT/qrakZxkfUj3szv3r4PxKYp4UW6ldz0QJFsFVY18Aicvm3N+HDcNbOQm
	gHLEtkXwNvd+KR2RqkwIkuXSlaE8JSsp0kyiPzqjpA50b9CU3cHVBDnLKLzLGUKW64yi9+gdXdeF8
	r3/4Gfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwez-00000009mh0-2J2K;
	Thu, 05 Feb 2026 10:32:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwes-00000009mbD-0Hhk;
	Thu, 05 Feb 2026 10:32:23 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72CE446F;
	Thu,  5 Feb 2026 11:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770287498;
	bh=Gno9wHg1RzsBII1gmFbgZKmo/jhDPIpmzk80mPXXxVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSdAwE5oVxcWzhqRFFI0CpPrqowo5gRw7O+euCFegeg+tjbMzJloksq4dRk0ye7ck
	 qwDIBNNwhx9KZlsFCrq1Q4vf1iazd/6Mg8EnlnXrD52qGQOrXI6LG5uOTOrIscyOlQ
	 Nsmrqa8IPiQasgtb/eRdkzjRRjRkyIZpD8RbR+rE=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 2/2] media: rkisp1: Treat 8 bus width and 16 bus width formats the same
Date: Thu,  5 Feb 2026 10:32:07 +0000
Message-ID: <20260205103207.4020959-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_023222_243351_130E0E19 
X-CRM114-Status: GOOD (  10.63  )
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

As MIPI CSI is a serial interface, we should be able to use a bit depth
of 16 in the same way as 8 bit depth. Add a fallthrough case to ensure
we don't reject 16 bit depth formats.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 21bfa0edbaf1..0fc1ca7f97a0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -261,6 +261,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 
 		switch (sink_fmt->bus_width) {
 		case 8:
+		case 16:
 			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
 			break;
 		case 10:
-- 
2.43.0


