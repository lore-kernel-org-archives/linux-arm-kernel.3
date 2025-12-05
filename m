Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE5DD2F7FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GHOQvJwMsNaeLIrVHviQuzFqHp03oytYXhLUw8BBDac=; b=J5qf0amL5Aw2HD
	kwzJqEXfnQXBcpTyzQstGRfQOsGqHVfDUSbhuVkrPUfnjOy06bFzE1xCL/tFoB/StBRhuM/9W5Kg9
	ggsDjFpLyGNSU2Cydb2MIjlK5rOOP38eCyB7dpyCvL5qzTkF1LeMsLiBQzGY8Q7QWicldcu/sVxzK
	rxUDmaGxWpfj5m8MGWb0ujdBv0sD0rySIQmUHQhDUObE0HIDadna9m7ovxphM1hV8Ft0ROOCZ+Ru4
	9OyK8ASXWweWOTKewV/zC/Q6hAS0v14Wq7xlp6mmA2gXpZy5cwqHhScQfEIWmYTl9JlTQzDfFizXD
	nH7SNlBCOMKy6xa3H2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWhz-00000009ZsT-31Wu;
	Fri, 05 Dec 2025 14:22:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWhx-00000009ZrY-3bzo;
	Fri, 05 Dec 2025 14:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764944570;
	bh=aJqd/x98lZolKad85hSNqu1YISc+2ZTyVQEuBz55wEk=;
	h=From:Subject:Date:To:Cc:From;
	b=bS6Mz7JGtLh1U7c66w0WBSTDMOpL0QvMLx7Jdyb1DcSL5KP8Ka08sr9CnlHcNW/DZ
	 kbk2I4CTauXhCCv3rPyOf+5eTK+PFfZReSKlHNnX/rTKHMxJaZvIO/3lWm9Vt1x6L8
	 LdJrF4nN8UD8peJtKV3nOQOw5PBaOZOzVOlDvPWNrE8Z2NNh6pE18AcZXkCpE64kXh
	 rNk6AgHZh710GsxnTQPCvfDnxjJjGiedBPeRgGPWzhTtXyWb/e4NsB0bHCrM+atVL+
	 USwprcwGsBDKwv7V5oPp/F6G+bLmUdcSqstg/HpJRZKa6EXcMPHYQFiDKaFZtCQDrR
	 q6RAgPwmWGGnA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14E6217E003B;
	Fri,  5 Dec 2025 15:22:50 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/2] drm/mediatek: HDMI DDC v2 driver fixes
Date: Fri, 05 Dec 2025 15:22:25 +0100
Message-Id: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQqDMBBEfyXsuQsmbYT6K8VDzK51KYltEkUQ/
 72h9vhmeDM7ZE7CGTq1Q+JVssyxgr4o8JOLT0ahymAaY7VpbhjKCycKgkQeV4OjbJxxsNTqkdi
 11ztU9534V1T10Z+c+LPU+XKGMLjM6OcQpHQq8lbwf2GhP44vtpegVpgAAAA=
X-Change-ID: 20251204-mtk-hdmi-ddc-v2-fixes-b5d61fdea639
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764944570; l=1302;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=aJqd/x98lZolKad85hSNqu1YISc+2ZTyVQEuBz55wEk=;
 b=j/SD0vU10cLK16S2S7xNM95fl54aNHJWMppvXbNpPyaXZjvkmkZud5524vKyXyxJRO+eCKtVn
 5sLQFVHEBwVAQPxpldufrAAspzi0eUDsTOOnLekIUrSwTiWS/pwyHzZ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_062254_178688_097895EE 
X-CRM114-Status: UNSURE (   8.00  )
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

This patch series fixes two issues in the Mediatek HDMI DDC v2
driver (mtk_hdmi_ddc_v2).

Patch 1 fixes a potential issue on transfer timeout cases to properly
abort read/write transfers.
Patch 2 fixes DDC communication errors that occur when getting
or modifying display features with ddcutil with subcommands such as
detect, getvcp or setvcp:
```
$ ddcutil getvcp 10 -b 4 # read brightness
DDC communication failed for monitor on bus /dev/i2c-4

$ ddcutil setvcp 10 75 -b 4 # change brightness
DDC communication failed for monitor on bus /dev/i2c-4
```

These patches were tested on Mediatek Genio 510-EVK and 1200-EVK boards
with a kernel based on next-20251205 tag plus devicetree patches to
enable HDMI output.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (2):
      drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on timeout cases
      drm/mediatek: mtk_hdmi_ddc_v2: Fix multi-byte writes

 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 58 +++++++++++++++++-------------
 1 file changed, 33 insertions(+), 25 deletions(-)
---
base-commit: 4e5a9b630580faea139e9837b4fba666db6bd728
change-id: 20251204-mtk-hdmi-ddc-v2-fixes-b5d61fdea639

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


