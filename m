Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5EBFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 23:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3XD1sP9+uZiTvDXOfZQhx3LAdp1oFhMLG9Cx0Iw9ps=; b=nSLhzGOxQuNR7+rynhifbBIvR3
	aV39yDIGgfvcsquwYXr822gt+eIYjMTqiKjeE8hbDMkNpmq9AGy6C43v5KGhQ7iC3+x28Z0razDOT
	RT0aN2pscWPxmLMn184WhT+BMLWNVU1Rt13SUSBuSvomxvm7FfanzSMlYZgT35ivSxD5hf29OeiiO
	udcdwnDHcKA4hzvtfQwGw9KB+1Z5JNXv6yKW/2TLxGzvENKc7Zrqsk5DhK2YLyd1VFyV9EfK5mthp
	03S/l7CCM6XIUzBTy8ZDGdyLIf9mNVmfzfZsKJfY2y91xcg2+d6OYvCfttGztyvmvXYqY3aw1LiTN
	HNKfnIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVAW-00000000HmM-195h;
	Mon, 27 Apr 2026 23:15:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVAU-00000000Hlx-0QtA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 23:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADCD2436FE;
	Mon, 27 Apr 2026 23:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685A5C19425;
	Mon, 27 Apr 2026 23:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777331708;
	bh=UZm8itTuqte324ypWLZllEeciHe5OEJKjyiMosMVzQo=;
	h=Date:From:To:Cc:Subject:From;
	b=GT2KNs3aaq3OuFlS873NyVfL3dR00Jw4QHuvWS5ycYswwK3sUybz09CjXH1zARbvl
	 dl25TAv8b7r7a4G6uPmjGr3PavoT2lTb59hK2KX+JLmMCNNtdwYADv0a8zUKB6QfOL
	 oXDvrw8qFTIULszXmGuSKe3H689nOHNaspWs3BcllyMQGcm5thlaBZm63GwpJPzFS8
	 S6oaC44YVpO09EEW/sO856MVvv12HK5oUTXZCpP+RQSNbNZa70GzVH1ukuqCbaD2db
	 oeF59+888nOYxafF1YrJmbqwvmukVY8UsRS2xnARcOEU7gMd4gjPc1xZI91Xd62y0V
	 KZA0CMXBGQcNA==
Date: Mon, 27 Apr 2026 17:15:05 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm: xlnx: zynqmp_disp: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <ae_t-fkryL-qw4eN@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_161510_165544_99291D97 
X-CRM114-Status: GOOD (  11.16  )
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the TRAILING_OVERLAP() helper to fix the following warning:

drivers/gpu/drm/xlnx/zynqmp_disp.c:102:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

This helper creates a union between a flexible-array member (FAM)
and a set of members that would otherwise follow it. This overlays
the trailing members onto the FAM while preserving the original
memory layout.

Lastly, the static_assert() ensures the alignment between the FAM and
struct data_chunk sgl; is not inadvertently changed, and it's
intentionally placed inmediately after the related structure (that is,
no blank line in between),

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9a8f38230cb4..05807c7a93d7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -99,9 +99,14 @@ struct zynqmp_disp_format {
  */
 struct zynqmp_disp_layer_dma {
 	struct dma_chan *chan;
-	struct dma_interleaved_template xt;
-	struct data_chunk sgl;
+
+	/* Must be last as it ends in a flexible-array member. */
+	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
+		struct data_chunk sgl;
+	);
 };
+static_assert(offsetof(struct zynqmp_disp_layer_dma, xt.sgl) ==
+	      offsetof(struct zynqmp_disp_layer_dma, sgl));
 
 /**
  * struct zynqmp_disp_layer_info - Static layer information
-- 
2.51.0


