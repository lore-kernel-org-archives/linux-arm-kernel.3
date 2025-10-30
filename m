Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A45CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X2UTRuI3d+ah0NP1XnZBknA6KIGKxvLTX6zevUgVI7o=; b=nExauk6V1QH6zKhTw3NCpfLHUE
	1iYqn82z+9wFzNQLHrNiwNc3YBU3d8WB6L3wlNBLZlYBGnRXc0eTAqnsuRGQLCsZ5YwPgWkFKYaFC
	KazbgoRTxVzoZHEriEXsqgn7yNGUnGadoZxGPE79oRxJfmjov8PC0y6IbIu9uFiHSNSMdEqZhCUsh
	DELR5B6atVTjWJ2rlivEaHWk1ok4nqsD4ZR1djTfeohjrvWH5U6Uo2NsGL+HFzwqsNJE9R8jSVdb+
	7CC136/Gekxvwv1DksAzqhH+a+wJpp5GCElZKYzrx7kmV8F7XF53fIJaANRCUHdoyEYPzJ0PhqCPq
	55ZpfNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZOQ-00000004qWp-01Qw;
	Thu, 30 Oct 2025 20:37:10 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZON-00000004qVy-2avc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:37:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761856622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X2UTRuI3d+ah0NP1XnZBknA6KIGKxvLTX6zevUgVI7o=;
	b=lYoe02GxRGNGJ19ONWrtYqOOLcS7beZe5agFjJVoqFaKa8kZHHGpUuoiOFpbfeCs4gaBiy
	9Q3mYgFZo4OjjIZQnLeyvMN8cGB9ZaWukPIfqF6H2LWYVr0cviIDsMx8hFv2/wOw/89aE7
	qwGu2aMbySGTZxCIiLnWnDzyNbsSXAE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/3] drm: zynqmp_dp: Retrain link after HPD if necessary
Date: Thu, 30 Oct 2025 16:36:39 -0400
Message-Id: <20251030203642.3076656-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_133707_870666_EB26EBA9 
X-CRM114-Status: UNSURE (   6.43  )
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

I noticed that after reconnecting a mini-displayport cable, the sink
would not display an image. But if I forced the link to re-train, the
image would come back.

Some digging revealed that the DP spec requires retraining after a HPD
event if the sink syas the link has gone down. So implement that since
it fixes my problem and it's required by spec.

Changes in v2:
- needs_retain -> needs_retrain
- Actually retrain the loop (accidentally removed while rebasing)

Sean Anderson (3):
  drm: zynqmp_dp: Update connector state before AUX transfers
  drm: zynqmp_dp: Use smp_load/store for status
  drm: zynqmp_dp: Retrain link after HPD if necessary

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 44 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 17 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


