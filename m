Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EC7C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=GGUKTpz7RB2Jj2zV70j9uNO3AT
	m+uRu+ARPGj9i9hykQiNyxzdFmmirJGQB3uUCsXI1i7CPZosS4ulr/YHKdwNFECrGrCBaPsZ7OFJy
	LOmGmrQ2PZTC+K96fU45encXxOq1kNWuN4aZC8yt0D/yJzU8ML/nC3mDx7kPodG6JmnQBx75d+mbw
	yNLfaqtTup3sjqtk0YoCGwSr5MWyy08+2PijA/rsqd4O/nertJG69v0e9XreyoUdPa0fZcH9pkyQA
	PMBfkI8zjDM16yspKWGrlbyu2uDZaR/HPTNOOx2xyJ3Nk/QsUXLqyvq0KvPzympgYjRv5iNUpciWU
	vYRPI9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFz-0000000FpTQ-4071;
	Wed, 02 Sep 2026 20:08:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFx-0000000FpQv-4Ayu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:08:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqrEs1586077
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6ghP9glQZI
	jLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=oz/tv1sRl/3WsGWjrvJ22sIWBYb
	EK44Eaj/gx7eSgTeGrFcBt5xotgqCYwj204u2D0Ndd3sEk1CT566XOJaRzl5VqpC
	EbEiiC/Sm70Il6ZcpQ1Ov/NdzUMXu1/Qh5WISHG1p9iAn+cPO5nWSkGhU+MTBev2
	tRFRmXaaICjuberKDCp9omSoB4vhP9evTmwK66S0w45DyWz7Iw8r8xrQISBK1dmi
	fkEIEA2g/dFwWupDcNawXcQpj0E0Wo9XOuag+STbTcUpHqLyXrUTMbOIJszCF5rK
	DtB+rd2+Is6sHEHgkmy94RiOKEOgofNKpIiX38htK6gO7L7l+GjQ7AdMY9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01vnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:08:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2377505a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379705; x=1788984505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=gmbs0YcBiWcbUOadaz63elWpodH8O54SaBOOWiPr90fR3mlGf/5dVtwL+6BFYBF648
         IsBYcGhwnKyWqBqZIMsjPKEJZ+lgjnoS2b/xa+5AW97CB6gDyh0zcoL7WhHyuPz8a6zH
         DakB7xvjqfZPcZ7CwjL7b7i8gPj4voCXcFLc2Fh1mKM3GNMdu/hg0udXtGxWyoQLRolD
         i39RfJ2yxTS2XzH7FAHggcJJw79eRbIcPsmg1LQud4QIFb8+viPyr760hFiwu8hj+X59
         G1NZHjM67fRhzdNzka/BbYciusy6MhJRqJQ7fwfkSIqzfMBuf8BbmhHm1lCoPM8dZx6h
         KjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379705; x=1788984505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=rR40OHj2YhijFYTzIiFrPrLazb8lfGQ9u8FXCfeR+mwLBhVtKaOoP7fuxlzjj7WYKg
         2AwAS6qDcdIG7HU/DC/zsvtpfUDqUuqTGJkH0U8feM3pM3sCDTjFTL3P+TkqK74aKLmd
         28DRpQjul0AfGTuRqjOB0UkTLdA6ebvQjhRZROrcgZ6BiUur3efApIz+N4sS0XKyDD7u
         /hXwDBlWyOw3Msz5PHWCo9ESMlLA3QMhxO+EiHKSRvxF3AkPYRw/S9+i4XkUvoV4leu3
         mlVgjDHuAEOO1MMxLIQsO2Fvmln+vmBOPdXmOs1X4Cdkg1ZuAZfJU6SCpKFJY7p1d+yV
         09ug==
X-Forwarded-Encrypted: i=1; AKwUvByjjx+G7zK0OlSxvWpm48yvUCqrjFyDSiXxgfGnzL4F+NANGjxJct7x27854ZlAuadwU92yi5ZbN3iuhzE3HP0M@lists.infradead.org
X-Gm-Message-State: AFuF++nsgrfFYfyY5rgMJSohnQKGcbNmJPyncTmOGDSLVwXzeMok3mKY
	5gcXgRFpVdM2OvFzj++UVt2jcHGESSOaQaWqH2nFUH3GWHOj7+HNnnPWJu5Bo5CObvZkeE+TXpI
	xJZP8RyqFE00yJMdSaPpGAUV5ErqHNw+v/z+cEK19jfjxRJuicw1kHbaK8hkqdGvoDyvWXnq41B
	1jGw==
X-Gm-Gg: AYBFou1bu6bad2CqwFkXuy79/DjNRb/RkPJGWuNS9wgg0SKae+XFrtzPFdxoAxyyRhW
	xKsoN2WwUjZH2kOW8WdXVk/Io08HAMA4S9p8nBXaERWQdtNJHs+khW0cSArSixYvbl6t627eOvT
	/b6Hw4/G38c41uz4RWqgKJyNEvFDSWvoVndg8/fzEfHqYZ6bqHwBgoIqgP0b6PIM9euGlE3DtNz
	O2Z8OViKc1I5gisPrzMX7qE2RxiDbRKZT3OroEHmk4wl1tqePNuVBJDO2fheYuZOf3MKVSIiNcd
	CtWAz6HMgzFbHcWixyu2GTCUJJx3QrS2qG1mJXeKmsy3fIvwa+nNn9aM5cYP1uPC/flyq7frgYZ
	B8t5NojTZgkWyNfL78SCCJDmyO+Y=
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293381a91.7.1788379704635;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293267a91.7.1788379704103;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:23 -0700 (PDT)
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
Subject: [PATCH v2 6/6] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:03 +0530
Message-ID: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zY0dcx9Hbtsl0xSPC7gkckYHh18hxmuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5m8SCDeiVyOG
 8w9fWKfXImFNem2tUU9rasdODlAM0NcgQ+sVb59UnhKotrfHa6GPcAx4pUsdjLU3EVpPVk929Gr
 I+vcihOttS4Ewkttpyh9SvikHYjcDTXDeENQnMkySf5Beg2q/wrpXnIvjGUIMt3e9bG7g5wdowc
 sYZ9TVGOt1ACrrQCE7+vnMTi2uwh2djzb+aQ6lx43TtUO12Y9UruhMnrqWaKbNDvGIwKtwB1zrI
 E6Zgxfh23EaYpRlDbgJcVTpzdVn2NUDBd2x04rkin3KFZW5lN6c+GYAW3YVXQ4YBKMDJEbAsxWX
 yWMPRAEbnFpzQzqWZXCMNGWEJQbPdVkOGdaGutSJV2lyGR85sdFjNwBwRwM6wNtev/gBAd08geC
 2uQlNwvMIPgBNLHs8J5QpbgdUXDS314U0VSz+k/pXuMkaa0+Yhjl1IVExbGKg99S6/4/yffo2Bt
 w3SBPfeYjDGldsIAWMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5BGv6s63KI6G
 AHoVcKT3tDEI2+qpLdNQE03r1vaQndPNLA842DqCFQoXZ95XX1d6B5GU3sOcYi8UiAOP/vugjNw
 lQc1aGCqvPmLHe4qlQnUSpxItqFjJmA=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a988239 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mTAD4mZO0xO8FHYJIeoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: zY0dcx9Hbtsl0xSPC7gkckYHh18hxmuv
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
X-CRM114-CacheID: sfid-20260902_130826_043358_8937FFB0 
X-CRM114-Status: GOOD (  15.50  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..4a15f45ad077 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -277,7 +277,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	if (ret) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
-		goto err_mem;
+		return ret;
 	}
 
 	dev->ahb_clk = devm_clk_get(dev->dev, "ahb");
@@ -340,9 +340,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
-err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +350,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.55.0


