Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A0DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=; b=LbCvRqn3Bf3xkMhHyRRDBDIkrr
	OYHjZtdLQgrjSrGAiab8NdZpmdBk9IUhW5bt8q25bViHAeI9fINhMShWogC+qC+YyeVEmP6oFRpVi
	9dCZgB2NRf8YgFm0HiVkeK1b5sTr9Gre+gEpdJjFTDryL36icBowfxNwvCuLC1YzFAMK3sK4CThUT
	pMnda4kP0aJIUWe/evKGEcY1fIXnjcSoaxAtuzlALlk0XJoOTIxaQZEZT47/EaS/lASYX22u4DAiz
	kaRfNaZubWvE/a+lEh4Av4utgKKWFbd4+ZXeChcU6Y12Ek3vwmtokXLfYjFoOFVonzOSxywln73r2
	4qOknReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLFk-0000000BiwP-2cDh;
	Thu, 03 Jul 2025 14:49:32 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJgO-0000000BRc7-44rm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:08:58 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4a44b0ed780so66930641cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751548135; x=1752152935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=;
        b=hAs9eGZpe80G7DY5zHG8VX7bIWUfKajIEX870+YZM65xmFWCUMCzFrzL4Z7c/8pzIb
         eyrhoS0g3WQ14LYIsCJSuCX1TkBe7YtTGizRuf97U4YRbgd9R5xaD7B4EOZmgLhBvUEd
         7pAG1w99ZPvuoUD1bB2ac1Lpz5bJlgOB21aGYjh35wmlTZgoVkUPl4p28T10zgKFuUhr
         4zKDctd8OU+gy+zzf8XWWT+6n2B/6wQgn+qyt46prNQw43yk1yadOm/GLFlDyPpEaU0k
         w27cyKzvtQmrndZq6GuwkgvD0qIYMFYA3TlSiNOuKQIXHx6pv/H+UVe0Rdll8UJv+V6S
         sbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548135; x=1752152935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=;
        b=QFZltcKRwWG9DZSojd6bMeTZ97au14IwTzoy1oHK2/fk0zFZ1EIJ9Fa6uG+vEtogWb
         JukyZeCINzG8xf3pBvJPj59abhLljVzs1Fv1R8YH3a+Q4gJcyj0Ukm0Xsw7J0u96YobC
         IZ/hrF5vuf5LsQPKrV7f4xMtKezcNgZeckMq/X3qKes1RWHIodTgxwEm+oIC2k9m2XqP
         0JY8WWTk2L8EHeFccB4+2lx/ujgnhwYBRQJsmJHEzgJQx/sxSTjXD2vxCj1DUeK2j49n
         qhAYo+C4xX9B4Gb5f4qWqFAdDzavAMrPD7l95Y1O41nRGKd3l/f4FgpeVI1rPGCc1LnM
         14sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBNCwjay01R9parwPV/ASAYtlPJFK3k2VEzctQSZDAws7xkea0QAVH31uyY5hYQVERoiqg0zJoNegFGcF0pRRl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7mmLsc5AqWWIALbuS9AG6dn4nST60XzkqRxnAz7tt14oA0ArD
	XlfvVc20ZrChNrt34f+tjcwMUSRxRNuBJTFe5oAMzeclQRrUUwj12t1g
X-Gm-Gg: ASbGncsHiGL7JOcze+AYapm+YLC67LmIOst2dHq1YUB6yJP4pNMy8LeaYQOHt+6zAwT
	LbbBi/5mICCPlyXCDDCIb4+n5BZ9pJQaeFfK+epZZEMXDIYjBLEFmtyqKzczNRoYOMnaSFkP9Eb
	BSNwOyYAuyO4IYtoBVfxOGcsusk0elSKpAJkiaFSINv515uH/7mEmS+WAh/XWdfMoOBAU58u1wD
	fRnzPY3EawhkphaDdHajF/LBg0StVycX+2GMjKTe16bMBF5k6JsIKXVXcStMH9isCzXrxchXRwn
	eUjnl1qpXe9eVE66hZcrRhaRRXmqB5EAQrv9F5CJtcwz7YArtsLlDVAgRK4g7Ui04l6tZ8oHR2f
	nQaU=
X-Google-Smtp-Source: AGHT+IGroe8sSDGARASmREqDinTKJNPHDZfD5QFZoPsxPWLxadIu9TXjl+Rxu7ZcO3g4suDjXSuCiA==
X-Received: by 2002:a05:622a:153:b0:4a7:ff6d:e94c with SMTP id d75a77b69052e-4a9879c6e11mr49451301cf.22.1751548135066;
        Thu, 03 Jul 2025 06:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c0:b293:bc62:f957:108d:1060])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm107314561cf.60.2025.07.03.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:08:54 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Date: Thu,  3 Jul 2025 10:08:31 -0300
Message-Id: <20250703130831.18830-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_060857_013855_057E59E0 
X-CRM114-Status: GOOD (  12.67  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

Merge the contiguous ITCM and DTCM regions into a single region to
prevent failures when loading ELF files with large sections:

remoteproc remoteproc0: powering up imx-rproc
remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
remoteproc remoteproc0: Failed to load program segments: -22
remoteproc remoteproc0: Boot failed: -22

This approach is the same as commit 8749919defb8 ("remoteproc:
imx_rproc: Merge TCML/U").

Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
Hi,

The ELF I tested had the following data section:

Memory region         Used Size  Region Size  %age Used
    m_interrupts:         680 B         1 KB     66.41%
          m_text:        6984 B       127 KB      5.37%
          m_data:      130224 B       128 KB     99.35%
         m_data2:          0 GB        16 MB      0.00%
[100%] Built target hello_world_cm7.elf

Which triggered the error. After this patch, remoteproc was able to boot
and work fine. Thanks!
---
 drivers/remoteproc/imx_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..bbf089ef48ee 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
 
 static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* dev addr , sys addr  , size	    , flags */
-	/* ITCM   */
-	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* D/ITCM */
+	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00009000, 0 },
 	/* OCRAM */
@@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
-	/* DTCM */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S - alias */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
-- 
2.39.5


