Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC097C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H3ERdyORHyhsdzYOMftryM/Ef5Li3AJl8m+M0gEaqgk=; b=f+a+0V37e3Dvxc+1pv4RJ7gmJd
	VeYUiJN/VreQbQ87hPmRmm98YQmvdq44eRnUdevBR0gKqHut9vdwgmtqLnNlrKYMLTPBB0HOJR/n7
	sOR0X+6tWAMHRCXwFKpl2A1Ha+GeFW/0Hfszxn/Crq1W6C0Cl34eg1a5H2JsdQ2zU3o8z0ogzg3Az
	UrlngCYJQElk8id6K+0iM6Kv2Lhc7Vn3TfbToE3PIm97Okw2wkWCdZ/EvXBufRUbNlAJCFgyfeMSs
	6PZOh5ifNAes+Tvhz563kot9MlXHAPCF/BoqHR7nb92Dp9jW37fk2g5inY90RmNtW8z9sCpvXM6EE
	6oVaZJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7mU-00000007OAk-1beK;
	Thu, 06 Feb 2025 19:43:22 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7l6-00000007Nst-16Lt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:41:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738870908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H3ERdyORHyhsdzYOMftryM/Ef5Li3AJl8m+M0gEaqgk=;
	b=wT6+1JkQUkGc+yfPr+1grUe8rHdlRqzGZfWVntt+KINN1QflyxK2Sk/VTtvH9aRDE5hdEx
	6DP7q/LhK49EUDCqPRe/EivkxM3mP4HA3O38lYtmpkg5ESXJZQ54EpPI2xj+Gakq9XbLxe
	0nlAoEUC5U8wdTd56AWzk4B3BpWXZu8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	David Airlie <airlied@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Thu,  6 Feb 2025 14:41:16 -0500
Message-Id: <20250206194117.1496245-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_114156_507650_DEF647B0 
X-CRM114-Status: UNSURE (   4.57  )
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


Bart Van Assche (1):
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Sean Anderson (1):
  drm: zynqmp_dp: Use scope-based mutex helpers

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 151 ++++++++++++-------------------
 1 file changed, 58 insertions(+), 93 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


