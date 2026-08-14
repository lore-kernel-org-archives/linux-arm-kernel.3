Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C1FC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/o2N6AOO5SDPq+gKcLIfQMliV3bDPAzt5Mxh6KWAXg8=; b=YrlozXPL8yQlLrh6rF43FsnjJe
	JPvci8+7myhSkwTWiQJoB+UphijDWzw1FFYnR1fQsBW88xZt64Smdmm/o7PBp4aThUQXPzEvnAPCl
	wqJ98UNLYbvIe3gSN/KDeS1zamU6tNk8MY/aXJqSjjjamWwgbEZrud1xOh8Fg2fzfopWcW2vsiOyv
	HOk/DpIK0uSF3giC/eeDM/GLVLDzuuLe9ldfFzHFsK0mbpvIlEyHc6PdoG8U+CLkgqdhW7EaAUqat
	rHqIJ5glEoR64jeQSySi0P+cw78ggdlMnKZXA3w4R3Uh30q/Xj6SRHkhsMKbENCK8cSCSNOwCIZkH
	LX6xh/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcS-00000001qxr-0Huv;
	Fri, 14 Aug 2026 02:26:04 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcG-00000001qsa-17EP;
	Fri, 14 Aug 2026 02:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786674326;
	bh=/o2N6AOO5SDPq+gKcLIfQMliV3bDPAzt5Mxh6KWAXg8=;
	h=From:To:Subject:Date:Message-Id;
	b=GE1+24LDg7pw527IWxCXEWnC2L8KWfVuxPyqdIK6gl7EvV2vplNi0QKgg2Ya0iaP1
	 x3sjjbOkyxxEMXF66VboUAjcIG8vTBf31iXun6e3nJ/uC/mfaohiGjLnRA7f1QGrKL
	 +pfa5iOf5rkNTdW+x8D+hAbMu93lemZogLmHdd+k=
X-QQ-mid: esmtpgz13t1786674316t587edcb4
X-QQ-Originating-IP: ShomYSSLc05a5nnPIAHJ0xSIToXotN6/p8YKknY9MSg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Aug 2026 10:25:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9044457741757422384
From: Chaoyi Chen <kernel@airkyi.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 2/4] accel/rocket: Fix the panic in rocket_iommu_domain_put when the domain is NULL
Date: Fri, 14 Aug 2026 10:24:51 +0800
Message-Id: <20260814022453.437-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814022453.437-1-kernel@airkyi.com>
References: <20260814022453.437-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MMnP0fEUKo/h07zcrFdjgHgf/shhYqtpl6SZAKaSVnzuyj8lnkpO3xHu
	6aBCLumhL/h19tcS1WCAsjwRfyZbJDIUzUd+YuTfU7Gu/CnyASgNlr8yxLgg3w72ccTHnD1
	0/SUMWW03i0+epR5p/IqR8pb0h2o1/a/D+VJ231UGKam3/RLmGL7VAX4E8E3Wk0bpT/jmlO
	VERMZFZ7HECKDbjVSxa5Mdt8VjWQXJwFwaRhhyqQ5rrQ4wLmwp1J3c38KOE/VQ35Wu5tkA6
	4+jH02CT7DwPHqrwulb+1dzLAvpOjICttE8KeWUgOI3rErv0LGH4IwfpmZyBZNBq5V0ZRNz
	kS5T7+JuKd/Lk3jYx4ZKR7g64AcekD8+MrK+dfqsVpNlavneCl6IGVOork0sm8Yf2qehl5m
	U0cFMtrBfgOIqsBij1R80CavEaerbs+FQK3vT5Oj3smBKfZh+NDHbNQ0lEp2hxcWWukj75A
	9sGjl9g6ZfY9kf8/5cUw7qhC0a7ew2JI/RdiK8zcRApPJHHZJ+tuRg4yIiPyf4A4DPd8l32
	/mnUkFhKcwtJGO1Y9zySwalT7AMmuHvkjMaC/gPc8J+MD1Y8stLyWHstAG7cKTveG7rjWDv
	c83/JCDgkblmmTwQNrxvaOJ4W2X3yQg2NJFOl6uuZxmlyBHnZqRtNMSn6LeXyEB9DCl+GAK
	Go033SMoiE1gI0yiKuk8DvHUAYt1jOnHHvxGNebXQms5ASwrm/DySTuP6gzQmETcWVJZv0x
	7++0o/vDOwIADS6cpxbfClh/hZsrOEYF5AUHJgCKXCe2kbbfII6P2nZBLxdrQqqK+fFld5j
	h9ssZFAN3ebmkgNfDY5NFbhS2MIIcNT+lj6+B8+E4IUen7xvArban0xySrvkmwZiI26oBVu
	TJhTvsakEapN/twU3tb3D0MI+w+ffz/4BGFC1AoJkb2sgOZz/fGs0JlFS+TCWQa0g4jEg1O
	rMle7786GtmWJfKc2YNYiT3LBiWah34zos+9dtoSyt419sO/QKyglRY3mBCn/wMU794GKru
	pM708hcCAyh4cT0aCo
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_192553_061196_45764FA1 
X-CRM114-Status: GOOD (  10.01  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

In rocket_ioctl_submit_job(), since the domain is assigned last, an
error before that triggers rocket_job_put() -> rocket_job_cleanup()
-> rocket_iommu_domain_put() with the domain still NULL,
causing a panic in that function.

Therefore, the input parameters should be validated.

Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/accel/rocket/rocket_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883..77cd2ecce001 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -65,7 +65,8 @@ rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv)
 void
 rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
 {
-	kref_put(&domain->kref, rocket_iommu_domain_destroy);
+	if (domain)
+		kref_put(&domain->kref, rocket_iommu_domain_destroy);
 }
 
 static int
-- 
2.53.0


