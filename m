Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0000BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=vcNj31MfPBgFX0uDxv+xyLXvnN
	OOLqBymvJpJm4jIPkOXTYTFrnavgJP7DDSYfkM+lnABgp3FgA+CfxMnVA1Nl2MXReWOK4Q01F64hG
	4WFyrcZoP2zzmtYexfueKsMuerQdhK60QWhPX8gnvCmTjtyTzWU+V12WN3iXOfvofCBD3tB5DCu5M
	cuvhfOiwIVrO0Y9bEVrK6+7MbvCqQeBa72iAwIoQPhIJWBuWE1nddvBvHaBRCafNiAad6Hy1JrfCQ
	iU1AiwApOrGVNYbHNUEqjOjHKbquYrYtv3tyVeJGDeKTRptpl6pl+owtkwlxSlNrKd109RiN73Lv5
	VOCdhE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFM-0000000Fp3k-3ggn;
	Wed, 02 Sep 2026 20:07:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFJ-0000000Fp1f-0L7H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqwU31586170
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J9W8P08UQPf
	Jw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=P64iHGeU+wqitnO2yOTz85CPPMC
	Nh9EN3gs+0SkmrParjRLd3P0cOTDHlUIuwGLTuKjTJxj2CRNpFTYEG6MPoVkvEoN
	KRHTCcUMHiCjR48T3RBTIkIlHfwEfHUJn8w9LZX6cIPl6V72APy3F7KN8w5EZhOh
	JmIfKfn1M9o8qLLLslSCCHkih+JlFWsLs5eIut+RLMcZtwCohJ/vch0JdGhdKGlx
	05ci71hJL1xR4/y/O1dq2OyMXjVfwO3NqnxZVBv4QnG1GPIFy2RU34XcrhpbqbY2
	dqXpMxp8akRJCDdTl+S71BL///ZwoRsnXT5kuM5vJcaDjuDRWHNG9Ls4ndQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01vkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:07:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so1075575a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379664; x=1788984464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=Xfw5k3XmK054kpFid9USan1OUzOJ8A3NilLDSA4usVsU16hnWANRhVMPibtsU8MCAg
         fNXQy43hsPMHGnW7AfA5LX1qYE8h+XUFcrKjzi4WpCInAYw000SqLziGoyus79vrYElT
         fFLxDJi3ElM8xwLCtFxTuuVza72tex97wtS54wSoGf3YPeEwQqXHFvSKqtXKH/Px8UfC
         ik5lhm3mQuJ+0BA16q2mt0zU4T8CtXcpV/pR6rsl0OJM69ALPvp1es2xYNWNVM6asyfK
         MCS8R7GVznxZ+eaNAa0wincjTlxvJD/hlw/3O3iq5VvdkJ3ot+dQeNfakZHAVU9EBtrr
         CdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379664; x=1788984464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=cKe1xpYEgi7td2J7YIBIAKe9RPhCambd7gTfILgbwz/+sSzKxwyErlLdt5+FYgKlu+
         wjbNc9aV8qQWhaHFgTVQSyqGMDwk7tRldLxUG00+d+vhYuxwMnpoiRbcX2TeNbeOR714
         X6snsBVg79uGQfulkETG1u4BtvcICbg2lrwIv33DYs/f3nNJ2UD/U8kB9Vt+eqodY0v2
         53CTdh04PG1usZZrSS669jMl78tPeR3wuIh0JowJiLmK1Q7PCDq5iisT83+FqqdguLSy
         cfgLGSWIg6FymyyvplYJss7NJYpucBifU12m5VgUmtUJixC3dB9oaKB4S6EVmSL4BKRt
         cK7g==
X-Forwarded-Encrypted: i=1; AKwUvBz4mBNt/wmdLZwpdntmQgzVbEkHDQ18zUzo0uYhtxo456tETowxDoBb3DSP3ga/H34sPY+8R5jpW4ufhQsGNS16@lists.infradead.org
X-Gm-Message-State: AFuF++n0uAWQyFyndqrt4aUwPU0xHiybRznOVsvtaNPC53Wh8BZ27Df7
	cBgNI9uR1UasJS8yhWDrvBQXFS0/G6WaC7VDEw6ZRIVBDAwwDxiBgft0yuetW3hSi+PsKVxsQ4U
	zovIOQ9aASMlVy5NEpO4a06t6nCcLgQNzGYD3MK68JWEmQOQeYrqXP0wtfxa3yDSMXzkAaLIEWL
	djLw==
X-Gm-Gg: AYBFou3DKYQR9lCTx6UwHNctZyVG+4lHd535nZXtIWKbZhhBvUsPbF7t+KjLpnJhJg2
	x0obNHaDvQEiednC+NbOV7gw5bGcTVrWSur4nEqEi78LeDEqmvDn69ZnCassMhRwkk98RZ0w/oa
	QC/XvvmzT98/kipAApYfkEte4cXMXxZB6XrDKHJ1qE5yvmEPcWujanTXy2T5XB+Dh7LAXxgDIkI
	+6SgL8Ptld1p2Xr2qxGPrRt+NsYaJraZki88JrKWi83gz2+KLY9Da6hZAGa0a8n14P2QJJSYYkX
	nG0F5w1Wh+zWmYrBvAWXwhoqqr1cNE7v0MStMiNen6k6PREhqHHswDNZEBx7fNcGNKjG/QmjyUL
	O8lU98a66n7yf92ObTmZdpxVFapI=
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639282a91.7.1788379663618;
        Wed, 02 Sep 2026 13:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639151a91.7.1788379662903;
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/6] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:59 +0530
Message-ID: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Orz5HTzQcEHI3zn5XjuefCC30Lo3_zqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXzXj8AXLpFSTY
 J/rC2m1vniQvs5YTO0hPfjCNk0DcloC2id+4IasLX2dG8OnUx/H0PF77zsD+oVzJrV/Orm/6e8D
 0kg/1SPSounZ4NyFXAU5jdovbvq2HdEPlCNq0uiU9DLBmFQ7TFNkbCfdde+dKHfsni/CcZJCzU1
 dkBAx86VkdmC3On9N5Zm3kl0tnIFzd9YHmG2LP7Ufhzv1Ep8bnymay5EKJvqqVpS2jJtlBdx+8f
 HSn58KOI+K74CYYmlDotUpWIVX6of6V1l+unH0Tb/kOPkMoJUd9BJ86c6r8qskmwX6QNUwxRN9M
 EDwPUzwe4oOwnGFxZipoOVQSka33aoxdb7tOZspVgbJ4EfrIoJ5OM5ofpH0L6fErcgcwbKZTL27
 q0xSV/a6n9GHeXpVHknYcPu5W6b/OFQN637mIU1CfbewYkNgjsfXndMGGUdxdhxDwwrwmF0Ezyi
 9lPHx9/J5Y7NrBvNr7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/vVWhoFkbRC9
 zWeGELFw2LnfaADJ2KcWSjF4V0oXfg+wArTq0QA8uHGDwFUDkYzGKBOVPTY/7ZeqqOsidM6t+Xu
 w1HXaIijz/jqsQHy6UWQQ7zTKALkI4g=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a988210 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Orz5HTzQcEHI3zn5XjuefCC30Lo3_zqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130745_121567_22865577 
X-CRM114-Status: GOOD (  18.66  )
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

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..7ba9314fdbd2 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 	if (rc)
 		goto err_unprepare_eclk;
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
 		rc = -ENOMEM;
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 	dev_info(video->dev, "alloc mem size(%d) at %pad for jpeg header\n",
 		 VE_JPEG_HEADER_SIZE, &video->jpeg.dma);
@@ -2288,8 +2288,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	return 0;
 
-err_release_reserved_mem:
-	of_reserved_mem_device_release(dev);
+err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
 	clk_unprepare(video->eclk);
@@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
-		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
@@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 
 	aspeed_video_free_buf(video, &video->jpeg);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static struct platform_driver aspeed_video_driver = {
-- 
2.55.0


