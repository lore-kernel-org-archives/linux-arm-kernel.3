Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15719C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 03:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=; b=gFnV3gE0EDx/YVBZxx+rRY3kkt
	sIfSqHClRN2KWTKlTXx1S5CPwQPowO1UrUGwfmzSBdQjBZHtPF1MHYpHesEIv2VWpkvXH+r0+AQPh
	Qd1oY80gPX0musEdooMqG7uZDQiMdDViYahIf0lfaB46PrOr8P9wC8CIHuWhsRguOBoycz1/FwVzt
	ySB9nHMbb32BEiPGEqOcgkKFKov2Kja/8qkn157cp7o/G5zBPIw7dUMbDRFXHvP4zcatrKQpMaoQm
	8WOV/gs6f9knUHDRsP5gl3/Vebwc6oHi4QkxM/JzUIvEDXgn+G5vm3MmaVre5TW3C3cWPgmxTD8mE
	CQtU28UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UqR-00000000m4y-1cZs;
	Mon, 21 Sep 2026 03:37:31 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UqO-00000000m42-3msV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 03:37:30 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df4c9d14b8so752085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961848; x=1790566648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=;
        b=AdoUm51rigAjMIWk2WD5T6uHXh3loNwOm1GFu8O0NZ1gvsyULmjKZKMkquwT1s8o6L
         +uJxOpSNAd45IPESnGc4y5tq/TN+m4Yx26BebV33PZhFqusy/i5o/ascIgTT5Nh36GZ9
         pWJfU952VRVQUxQTcMRlJRh5JJt6dMDFgrseL7cmsdsRAIEpHbQRi9Dg18RA2kGlcW6d
         4GlTWe8p6u0eOyH3fNhwlapk0r/9S/I92MBQtg2cPydVkfSWrtjSaVaS2O9595PPHE/M
         IaARcI7udGYFbNj3mZPkD/VdCdyLaLa9uJVBmQgjOr5RVFnrG9Bpna9wdCt3hgUxTM0N
         z2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961848; x=1790566648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=;
        b=xvc1T9L5WMlgusjYS0p30bmuK9Ni9/0FK5aIqDaMWNgApOQu/rXM8rCCLZ5R+93P8+
         md5lkarq4QroLDHCekrZNrLVpVN4tto097NIyWWB/y1z2qow4AIN4uh0lQq+Y5kkMrH6
         xpDhE7Xbj+RjNv39DrUPZVdQ/c0I1z4U431jH8gf0wD6cWHCaCKLHpBtpQxSJau6Mhw9
         NC/67JShTH+qK5+Ll2TSd3jAMWjNik6GJ2rLgqiV1F2IR8wWYubTKLfuPvb3cwZBqv+v
         TIDqLfN4dCysItg/n4u4MJevx5XI1mby7dZbO/+oDvabnz7c1wDFDwHJTO/iaX7rtI/1
         S++g==
X-Forwarded-Encrypted: i=1; AKwUvBzAjFNtoDcOt6tO/vLyu4W8kemGCqi1pSkFPiht77QwewXXvsHzlbZR1eVxMIAIBDEO7gxlstfD/f0ZyvYdgRsR@lists.infradead.org
X-Gm-Message-State: AFuF++m4AarZcTHiY8r1L0NllukNwblRmDLzZYvoTAghZDgcr2xZshLO
	JlOzWFmHdwpi+VoFqx7FH9hw1cWfxYxwRGtOLLj6DR3kcKmdrTjANTLU
X-Gm-Gg: AYBFou1ebTtaJ0zk6yNWUKMrWS8onYSER9Rurg9eOxVhE9t6AL1M4+4gj/XLdKoTFCi
	QJOZypmX6sPlBYfJF5CXKZ/Z5xOpSDlk7k8uK4KhlJzkVPJ7qCt/n1QUcuV76Rngc45edgES9Y8
	PfwGwaBqVpxVowoYP6xpcT1JSIZM8gsGT2cVTVd9Nln3Ksm0GN8MixN20hsq3xBhA6k/dspI4Rm
	nZr1H9k9x5tkq9n2yoXE6u6oRfQ0CL36ncvZ+/rU23wqpX+8HbF5scASfrGGjDY6pbDR68bsa5e
	rEzZUaKlAWyTzXPHKunsJi/UZorzI6ToxR8phyrh2hELOPH46V98NTqrGqDHcRLbgC+WDFXgvCz
	HOr7gOeYJEHPr4AcFhx+lZcnsEYqI7suilGRkNT0tpc2I3MoIJTy1JY1ivAVTA2annF7pVXTp37
	OGSa/d8GixIpqXA3eePvFYtyI9wMjgvZmZIKvC4FjfLNS4d7C3O4FdJZCa6cpKpYdUqE+S4fgSD
	DevkvvQBRawcsZoC6yEDHEH5CNuiBaEtcPcnWxmoy9Dvz2+NgQO90jUrQgYBkRal/F31n8YV11I
	fJv14PAxhDgEVg==
X-Received: by 2002:a17:903:2447:b0:2dd:7370:e19e with SMTP id d9443c01a7336-2ddb2233bc1mr94006865ad.16.1789961847686;
        Sun, 20 Sep 2026 20:37:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] pmdomain: imx: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:05 +0700
Message-ID: <20260921033708.14433-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_203728_948131_59DF5676 
X-CRM114-Status: UNSURE (   8.25  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series replaces open-coded pm_runtime_get_sync() and
pm_runtime_put_noidle() error handling with
pm_runtime_resume_and_get() in the i.MX power domain drivers.

No functional change.

Found by manual code inspection.

Best regards,
Phuc

bui duc phuc (3):
  pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
  pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
  pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()

 drivers/pmdomain/imx/gpcv2.c          | 16 +++-------------
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
 drivers/pmdomain/imx/imx93-blk-ctrl.c |  3 +--
 3 files changed, 9 insertions(+), 25 deletions(-)

-- 
2.43.0


