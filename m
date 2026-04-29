Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4F0FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L3ysSGByzXfJqF7r5cfOYLrvPBu+c4z/i1q4JuXDig4=; b=A1K5ylxXJ6JA+F
	Eupgo1xLgCKqZCoqQkBewdoK1Ab/LZJn4F7B/jyxDaFSRkK4B5ne/rHB+MZ03pTuZkqFmQftbUylL
	WZsDovSl+CLucJIV7zzGSafYGHNT9t4jlkIoPAKtFUq8wSp3MTsNtDDgfH2gozB/7OCC+dre1alxu
	Og20UD6k6KqXAr37AwqvU5cfZXjr/JAzPCMDya/Q/9rA70pu7IzopvfXqUvkIbFI5MjMeCnxnScDp
	5+dR3TdnukzJU2ru8hIeb2xM69yqt+WK78Dhk479S0dQsE0L17jxlRqw6YHia5896dCI8IqyQMBk4
	SHgMunWpy4L9q39Qa6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hR-00000003Pff-3kO9;
	Wed, 29 Apr 2026 09:59:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hO-00000003Pec-3ZJf;
	Wed, 29 Apr 2026 09:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777456756;
	bh=TF5ce7a1hK8I+tQv5MlsWOrZ1SFQR0W0h74iMjRsckg=;
	h=From:Subject:Date:To:Cc:From;
	b=MZlO9R2BIZUsr5JLlzrvbxrG+OIEu7C3PV9K7g/F2uC3d4pmMr6DVAd0hjuc8rN7C
	 g6bZ1djAxhyNniADCcHeIv1sZi7VXs/nmaYwv7yArlEWIXWZYSlgUWyVTy8ucPcKoT
	 W2tQbon3d5vd9CetHO+o1jB1JNsKm5YFn4O/9BRvVtDwtCJShvT0AVkz4gEfsj3HCe
	 dM3DHP/rgdPTr+zaXcJOnb7fZbPDTeCzCPjfVpdYB2lmQ08V3wf9SDwTN7E+RNqPyw
	 OtIG8YYWRSIE/ada6qiN8CN9gX2V79K99X60jKT4X1v3uGm51mYIKn1VevfN2cVo1w
	 /nIoI/NH/O9ow==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C6D617E131F;
	Wed, 29 Apr 2026 11:59:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/4] drm/mediatek: fix sparse warnings
Date: Wed, 29 Apr 2026 11:58:58 +0200
Message-Id: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQrCMBBEf6Xs2YU0BC39FekhJmtdJGndpFoo/
 XcX6/ENM/M2KCRMBfpmA6E3F56yQntqIDx8Hgk5KoM19mycdZgosq/0xCgJ77ximb0Uwo+XzHk
 seHHGRWo7a1wAvZmFtPZTXIeDhV6LmuoRws3rPkwpce2bTGvFv62DYd+/oMRrvaMAAAA=
X-Change-ID: 20260424-mediatek-drm-fix-sparse-warnings-7404de18204c
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777456755; l=1136;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=TF5ce7a1hK8I+tQv5MlsWOrZ1SFQR0W0h74iMjRsckg=;
 b=LxfQX0tyMzx/jWdvideYpWdeIBEBaeVsm7QmrVnk+VO54njMPWiGYzvbVKzTiX/NgWQ0MrP0N
 pgKBYWIGs2vBGuC/xlPL6sc6eAHLQbG+mekspcZ1lSe3uw5RmNRaPTL
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_025919_049058_81206057 
X-CRM114-Status: UNSURE (   7.71  )
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

This series fixes in the mediatek-drm driver the sparse warnings
reported by [1] and two others introduced during v6.16 development
cycle.
    
The series has compile-tested and is based on linux-next (tag:
next-2040428).
    
[1]: https://lore.kernel.org/all/202604132044.fcYjEcU8-lkp@intel.com/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (4):
      drm/mediatek: mtk_hdmi_ddc_v2: Fix non-static global variable
      drm/mediatek: mtk_hdmi_v2: Fix non-static global variable
      drm/mediatek: mtk_cec: Fix non-static global variable
      drm/mediatek: mtk_hdmi_ddc: Fix non-static global variable

 drivers/gpu/drm/mediatek/mtk_cec.c         | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c    | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 0f3ef35b0747832b58b97171bad99011d084c6b1
change-id: 20260424-mediatek-drm-fix-sparse-warnings-7404de18204c

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


