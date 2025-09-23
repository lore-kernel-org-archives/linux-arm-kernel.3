Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD82CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbudV7zMvsb7+FwxqOXJAvF7A++Xaqp/S1V/c8KvSeU=; b=ddCR3x4NZBEeUq8eBm8SC6Howc
	WMPCZRhQItoY28L2X9l+0N/pUZJ2dm4N0rdnBXvxCcPbSFpPG9k2pVeR0deZlq0XC4vPR76gVhC1d
	T+nrMR8/6ihZR6adKQh2ME9N48XTYPgs2pEcktXbl3wSM9czYZpHBXCFESXCWEEVmH352+udHeEhk
	lH5dKzVflM20X6yHp8RizICCD7dBDF2EIcNC/1UwikD+NyFBqrjJDRaGXSG9gV+QNZUUH+haeqUME
	ct/Q8G6ibHOrzpCU8ISugQG6GbArvAj6iR1mmIyciqVwKCtfhe98vhrxKs1ID9PlKv+2FvYA6V7uT
	knUVQbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Oe-0000000DDSx-08gf;
	Tue, 23 Sep 2025 11:41:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Oa-0000000DDOB-0fC5;
	Tue, 23 Sep 2025 11:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758627666; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h4x9i/tMKd/KpKthl9EQDhvcIF+sEf+qJpyZofv8YccGxStpev1ilk6W7db4/LBWGwCaRzJO/n+q2I/oIMy+yiMgu6kJ3PDzUvHmWLCF296+EoJj67mQGb3NRIwWkXz0Z8Trgb8EDXHKm+ObrK4jF0iViwqgi3z4RZVMfDwLqBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758627666; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mbudV7zMvsb7+FwxqOXJAvF7A++Xaqp/S1V/c8KvSeU=; 
	b=Cbsv2xKRoaAcreQmkml+eLiwrQFwcNBmILh5wfcW7n9aR4QVHAMTvfEZ8knawJltoGPPsnbMszx3e/qHAueIeUz/IcGqnLjfniRtBj6Fsey5F4hgzpUGaldPgM4ySZMnGN4dFrKC0OFkXaw8BVLw6+oqb1M92H4dQSN/lUIEwv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758627666;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mbudV7zMvsb7+FwxqOXJAvF7A++Xaqp/S1V/c8KvSeU=;
	b=TQb5dQjbYsVefqMSK1PNK15OEXRv0p2JmfNeh4a0go1fpXMTsl63jvWkkiQl4Xnv
	w7cMNYTT5NgeopwmSWKLpeevQUayqzl5pC91vl/UONTWa58H3iEsP9N/x064xNiWbSp
	ZlUG3NIJEfPDAFR73KFYV5slzsRGYRDCGwXgf0Wk=
Received: by mx.zohomail.com with SMTPS id 1758627664897363.1328382126669;
	Tue, 23 Sep 2025 04:41:04 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 23 Sep 2025 13:40:00 +0200
Subject: [PATCH v4 7/8] drm/panthor: Use existing OPP table if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-mt8196-gpufreq-v4-7-6cd63ade73d6@collabora.com>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
In-Reply-To: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_044120_532080_AA17DD74 
X-CRM114-Status: GOOD (  12.47  )
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

On SoCs where the GPU's power-domain is in charge of setting performance
levels, the OPP table of the GPU node will have already been populated
during said power-domain's attach_dev operation.

To avoid initialising an OPP table twice, only set the OPP regulator and
the OPPs from DT if there's no OPP table present.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 8903f60c0a3f06313ac2008791c210ff32b6bd52..4ec46a67db7d4331ac31a249e41ee19378cd411e 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -143,6 +143,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct panthor_devfreq *pdevfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
+	struct opp_table *t;
 	unsigned long freq = ULONG_MAX;
 	int ret;
 
@@ -152,17 +153,22 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	ptdev->devfreq = pdevfreq;
 
-	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+	t = dev_pm_opp_get_opp_table(dev);
+	if (IS_ERR_OR_NULL(t)) {
+		ret = devm_pm_opp_set_regulators(dev, reg_names);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
 
-		return ret;
-	}
+			return ret;
+		}
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return ret;
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return ret;
+	} else {
+		dev_pm_opp_put_opp_table(t);
+	}
 
 	spin_lock_init(&pdevfreq->lock);
 

-- 
2.51.0


