Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22631CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=; b=yWExab2ZfeGfdZATW4n16TWZ0G
	M4+wNIpq85eHIKiumtD/xUAKWOOXIHRXmmXjNQTgheJRMr7g3nYo+B3Qi4mv2a3CFvByAuAZ14iSo
	pYDlAvm5AaQUONF7rp53uu/v7U0aQm9CYEUw2WxF1Ukgem2zw11aiEoDRGuvSz5myH/wVf6L5rKfn
	G5afvgkhB5XsgDoyBDqfAbvTXm3SdzqiNMk/UtCu5H2vkFivviHkibChMPjVQJgclxlczMJwxuhWT
	4IS435fsc22KPQB9ZOsZMwTAv2y+sp052GtfOZm0FD01c8V7WxguARpai1OO1pQVJeM3J1mdnWLja
	pYIemwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVOi-0000000EVy6-0W4I;
	Mon, 11 May 2026 18:30:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVOf-0000000EVwt-3I6y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 18:30:31 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8367df48711so2135430b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778524229; x=1779129029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=;
        b=NWguQQomQwIs7Z97ehnPA7gp12tVQCyaY+0hhwrd0Lb84UNpITzvuwk/b8vKy+7Ldd
         NistUwdgGcq56mGMeO75kpBJ2Ks4reRdmxcThszNMzQ1M/a+P5IaRzA223eZwZQyQ4d/
         ZCn01cOxjUNCh/K2QCVlew0rIaBalY00+I6ZbmIIzz+BvnUQBj56t4P7mE3Hiz/POWBH
         LEOpiJWGI6eBuBTwjywTmYAS57+4E6rXpfSPpTkMfiDguzyh1nW4GE51VdlDERMkKPiX
         /DSwpzkylMznSv6PiQ93N67oK+jzsRSEJqxA88jbPobUA1p/3VeFjWlwIEzFUXQbV8ei
         RkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524229; x=1779129029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=;
        b=BAUFzLEgwpbccOo31UIF+TD4AuTcWWsjCtRggjmoESKsM30K3LbDN6Tzbn+EMxf3+Y
         QetIjJSufq1rgHS9ChdUvGkIMcHdrJoqO+3C26CxqzkshLDPz6Oam2n0XbxAsA4kaf/X
         OuuA9o7UFtt3tblhSNgPS+L9bwPVNSs9pekcUXFHcTGasxSlQ3aMteZStuOqgaXERtdw
         YsF9kVOMaSgN4CfIX4b5+ptuMQgyDM3FC3IEaspJsQwoFyyBLRNSIZjAPtjiGub0R8Rk
         wPSwaxDVZTJvla6AtSHM0clvIQyR0XXgpemnQIpqz8cfdxqtN3ismTT97hNZcM0bdo+k
         fkeg==
X-Forwarded-Encrypted: i=1; AFNElJ+zGnDmaVGWxw+aImF52tpc42VEk6OR0TaysWz+C9BAJfgQuT+6M7jaA29/uxHl3WfJap5BU+agAwjIg6oo8Lgd@lists.infradead.org
X-Gm-Message-State: AOJu0YwPwJtTTG7lu81ZTZKnSQbgxQoZSX+w3oopH1CfIsFZflS8madl
	/mWdNFOCcVxT2YnKpkTBnzE9TFsb0zR+tw9ukGx9eE9icysuxFCvwM4MBH7sJI0GFwpE3g==
X-Gm-Gg: Acq92OEnhGIp1bIG+3xifZCRnQA6y6nBJzKyWtL2cfxXl7na/jim2m9Kw+ZRagwpYwC
	dQoejWw4DdMCJ8ULsnhMs3MZUFTiA81+nCGxl7I2sIlutZ0PEMNKb0A6OzjIaD9W7XSqbuhq2Ow
	0qWT10CWCCHIvKKvotBDLPrdtGbZevM4HWq9EJgw/qVi+n2buf5qpwtP5bhP2JL9pxivXqzmL0/
	hbjesIdq9pqKsDz61LAlPQcfBdmlB3njmz1zSac28e+nLeJ5aYe19c4pZnXud05olEtnY2Sew8R
	zWyneI0+TJ2VzwE3iSGGg2FvwnP2bN2KAbneHgevOseDH5Adw6KEN9Syp52oQOmozSS5a63V77K
	iO0Ga9qdh6UMJhfomeLw+gJlTsI8It0U0oLqvFOFj/7K1NrVCUU6fc0JB/t7DCkAQl2GgAFYOoE
	s1wuj3x2It5Z2vcaLZWJ7/UchhikPJXJ9bNEXs
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr10520686b3a.25.1778524228880;
        Mon, 11 May 2026 11:30:28 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm19515723b3a.24.2026.05.11.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:30:28 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: sean.wang@kernel.org,
	linusw@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH 3/3] pinctrl: mediatek: fix SPDX comment style in header
Date: Tue, 12 May 2026 00:00:17 +0530
Message-Id: <20260511183017.228595-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_113029_824689_1F794362 
X-CRM114-Status: GOOD (  11.58  )
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

Header files should use the C-style '/*' block comment for SPDX
license identifiers. Correct the style in pinctrl-mtk-mt8365.h
to satisfy checkpatch requirements.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
index 39e17532c46..fc22f412bd7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.34.1


