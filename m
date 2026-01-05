Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A33C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dhffu8LIdTLgPtenvQvcQEsgC/HuPrPEI6YBhEfoHLc=; b=kZX32gTKNpx0RwJKCaik8OzGl9
	RaXfhJMafkwO5LodeQNzbUbx7tGqyAiZTnW1l7TmMkGsFJ2WxnUJmz16Ivyp6pZ8xN6DLqXJstBVu
	e3YV3urlFzGpftAI92YDa3xcvrBvKUg9kuuIRoRkI+Y7Ie/zF1r65y92c0aGYvlh759WXPOHmUg9L
	zSLUbM204njjNkzmJxB/C2MMevQsRuKUU+SwRpA+17v4OWKVoN827u4/jTrYEedXlpqigUyhOYruh
	WuemAUQl6WPOcYU3uGKrvqpD9MxY9vwbMK+ca0bxq+9/JAuYkrM9Oj6iZNZngWqCcSIBCv+uWgYNE
	zoHx6Wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco7i-0000000BnBx-1keZ;
	Mon, 05 Jan 2026 17:12:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco7g-0000000BnAC-1Bdg;
	Mon, 05 Jan 2026 17:12:05 +0000
Received: from rui-Precision-7560.local (unknown [209.216.103.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EADD25D5;
	Mon,  5 Jan 2026 18:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767633100;
	bh=KnRyxlWiYmitQ1tAEkHqz9bq2NDqcaHpHmYcf0N+xgI=;
	h=From:To:Cc:Subject:Date:From;
	b=RVqUJ0OikiXvWEi/akktgaIZmwD/sLH0ALepesoFR6IXCH34V5aIN6pbd7dN+dvk1
	 5F3VkFncLQfec+GBHYnH0STGHyiSyUMNLx67kRciRCVKh2AFp+JXoRnJYxrPhz2TPa
	 g/EYjDMlwDrjXn5BSFZvdva1WBw3s7r7qhJQ9jRg=
From: Rui Wang <rui.wang@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: libcamera-devel@lists.libcamera.org,
	Rui Wang <rui.wang@ideasonboard.com>
Subject: [PATCH v4 0/1] Fix filter mode register issue
Date: Mon,  5 Jan 2026 12:11:41 -0500
Message-ID: <20260105171142.147792-1-rui.wang@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_091204_457157_94EBEFB6 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

Hi,

This series contains a single patch that fixes an issue in the rkisp1
filter mode configuration logic.

The rkisp1_flt_config() function performs a direct write to the
FILT_MODE register before the read/modify/write update. This write
does not include the RKISP1_CIF_ISP_FLT_ENA bit, which clears the
enable bit in hardware. After that, the read/modify/write sequence
cannot restore the original enable state, causing the filter to be
disabled unintentionally.

The patch removes the redundant direct write. The remaining
read/modify/write sequence correctly updates the mode fields while
preserving the existing enable bit.

Please review.

Thanks,
Rui Wang

Rui Wang (1):
  media: rkisp1: Fix filter mode register configuration

 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
 1 file changed, 6 deletions(-)

-- 
2.43.0


