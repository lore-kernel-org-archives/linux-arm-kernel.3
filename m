Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2FEEF36E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cy1rET3CGr4f2fi75cHO85rqRJdUgZ3r9En6ePvjM8M=; b=19ICqRykhZ6Lh7JrD6w0lPUTf8
	y/eLvcpfy5SJc97lIJPLUIT+jDMJP2i3rqFTLv6+AEMXUyVLJorpJvymb1jq9qwZCpvF7v2dyEqua
	nVa/6U294eAnnKMZNWOj/HMsH/eJ9k6hzKR+tda4snVa8W9rHUD5DE+u0c32lhXEIz0/wxiIm6iBM
	1rsw74IFVdgsHR3eT9LP42YBws54AKgFlqx4iw2/CF7LVYO5uiNTzTCDJhDUB4H+FD5hYgXyQFUW+
	Fr+DP3bTPJxSzjI7z5/iuOehvfh6FgTDk7x0zDawFNBOECc2PkCMfoDT5TJ1fXoTg00fDCzebUAON
	qmBrX42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUMO-00000006kku-3sp7;
	Mon, 09 Mar 2026 06:45:00 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUMM-00000006kio-2gvU;
	Mon, 09 Mar 2026 06:44:59 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id A7E0C100679;
	Mon,  9 Mar 2026 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1773038692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cy1rET3CGr4f2fi75cHO85rqRJdUgZ3r9En6ePvjM8M=;
	b=RV6blo0EiLzHWAE+O9vkx+r9A7twIQh4e/3sNaSVRNRxX+ESBGXD70D9sDgn5kbS2NV8pF
	gPARgAOUpVhI09NgnVi2rvJNoyKPbeJ8bh9BDN4lqaVDIBtrpp/4nZlh76/z8ejUGRn5AL
	A5WN4lYYFSOgjICl3Fy1fPuIEAwqfvQ=
Received: from frank-u24.. (fttx-pool-217.61.159.26.bambit.de [217.61.159.26])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 7085B1226F2;
	Mon,  9 Mar 2026 06:44:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Laura Nao <laura.nao@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek/lvts: fix mt7987 thermal crash
Date: Mon,  9 Mar 2026 07:44:38 +0100
Message-ID: <20260309064439.4296-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234458_903785_D9428FFE 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Frank Wunderlich <frank-w@public-files.de>

On mt7987 we see a crash due to missing ops entry.

[    1.518540] Internal error: Oops: 0000000096000005 [#1]  SMP
...
[    1.564481] pc : lvts_get_temp+0x84/0xc4
[    1.564492] lr : lvts_get_temp+0x60/0xc4
...
[    1.620900] Call trace:
[    1.631753]  lvts_get_temp+0x84/0xc4 (P)
[    1.645471]  __thermal_zone_get_temp+0x24/0x11c
[    1.656502]  __thermal_zone_device_update+0x9c/0x52c

Add the new ops member added in 7.0-rc1 for mt7987 too.

Fixes: a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to support alternative conversion logic")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mediatek/lvts_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a9617d5e0077..5671531d4c23 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -2026,6 +2026,7 @@ static const struct lvts_data mt7987_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7987,
 	.gt_calib_bit_offset = 32,
 	.def_calibration = 19380,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt7988_lvts_ap_data = {
-- 
2.43.0


