Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FF2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tLZO5TvQipH7o3nT35LlHz7fY3vZ+oh2KE+7W4p1NmY=; b=EiEv9LsjQbqMLHbbIf5N9RbF6D
	cwDVU8cWLFeS798Vguiom4dmVb8TV++yQIZjW8y288XG4gGdKmZkInH+imbGmUIKMrQxjPv/7npn8
	IALxeKtVZrkTcg3nqO8Og5pilGcylgyLExBLE6Lo/E+yGn2k4m2DvVcbDGeg3rfHEAqQqcwW5gAMr
	xtS0zzF1Z2DjWou9GE30Q6753r5B+qwChbwAdvsFf29PZ9+i6/L9NK9/3rHJohN69ZXR8D0+nsD1Q
	+V6mD/5the8HgH27gypA9FHfYaRFcoMy1zIW9bItFMC3o1UAQpEowVppwkn/wkgtnZNMJNL2l6nyX
	U2jPQknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRCP-0000000AHWX-1MF8;
	Fri, 07 Feb 2025 16:27:25 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRB0-0000000AH6Y-348n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:26:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738945555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tLZO5TvQipH7o3nT35LlHz7fY3vZ+oh2KE+7W4p1NmY=;
	b=MPlDx1D4hKyZxpnkM7gWL7ClY+G8TgNEpPFVZ9dHBoRPNNqY0lsJTo0L2t2KRFSFJhjrpI
	AutxiuNzupGNlBYhWN2vOeA7/XDFPsiDlWAbgeTLqrurZv4sDFVTjYdCn74G7IUrPPKK00
	U0h9RTa4AxqiMP3YJsh11wRVligoW+Y=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Fri,  7 Feb 2025 11:25:26 -0500
Message-Id: <20250207162528.1651426-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082559_052876_81ABAD8C 
X-CRM114-Status: UNSURE (   5.05  )
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

Fix a mutex bug and convert most of the explicit mutex_(un)locks to
guards.

Changes in v2:
- Convert some conditional return statements to returns of ternary
  expressions.
- Remove unnecessary whitespace change

Bart Van Assche (1):
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Sean Anderson (1):
  drm: zynqmp_dp: Use scope-based mutex helpers

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
 1 file changed, 50 insertions(+), 97 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


