Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3ABC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=HXpPc5eSBRyossF7I/dgnN67x6
	Ot8e0wMhK7eSP0f9uAWhgfRGoH3OJwDDozwpZvgCLCBvxbADIrCPM6X//3Orw7ShFwC3wfmlq5SuM
	rKteRTHuGEOW1CcL3mqlUV4M/OAcCIHxUNopMpRiKMx4Pe+qdc2iDCDFK960h8LgM56Gxb6RXAR0T
	kZ06vn4YS0IzOAg36DCiD/EfTuqWIreIPvKjlyMQXeao2GqQbcfpctC5AS04+gxs9AckXOKnORtnz
	IC4ngNwPC8wVbTqWSFurl+1Fk1fMaBp3XOHJNvYaMMCP9q0Qcv/eAYPPDgZI/FzyIGnq90y64wd5h
	FVVaQ9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFs-0000000FpN6-2cK7;
	Wed, 02 Sep 2026 20:08:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFo-0000000FpKP-1DtF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:08:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsA6I2485679
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iYuD0uDqzSw
	HU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=M+qVvV11pixl6KhVG9hStD56ULl
	HhKND36J+s25d8SnWLfEnCsAY3W2C+ZhwEZvtp7qAul1VrhtgDfrrq4DaqJ3ZzU1
	z1zZQu9vbVN44CrHCtmJU+rAK+B1f0vMgFdTAr7FwMGklBBSqneXiL8iZGWwEqXh
	UKPvlcpUK9dyrnYdJkNRcw7esBUv8iKEk/AQRSCskMJq0bPHgq21fdTbJ32poy2+
	nMQeKmQOL7itoHtqWbqTWimQkXWx/kGoao7+tLDMxjUAW76/aGKeVdqzanROnKgS
	lo+j+Cfv5Cx+MfNlIJRB/dUJu9xj5DWvLtvOl+rDuVSDntH2ZqBUk0bbQfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9paq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:08:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so2182309a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379694; x=1788984494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=QPt1cDRnq88u2bLOG7C9GYiYbG0TcrvdhboGhBjFptQAU00ljILgqmaid6A9BJ37dU
         oNBGrJe/zvXO1yQDzHrJt5WO+PjYJ17QZ4F7U0dKOwfdrAb4S8Q6IOTZ0ULeW+aBdPJV
         cU421jdc+PrpSArmhsiBjM3f8ky68yU0xlBdPegaq3acOKpGcrDwLB53ivBUg6nQn2Fh
         wMwdFabNJOwVMIetcEag0n0VKjwvWh9nicTD6Wuq7bjGVx/Gjfk175TzfcOSo29/mfcs
         ep/uWXtBGfd58gRUYXK1y/57dSNhrpqhF58JgzpqH53610CbbztwxioTxJDru/NJSfOt
         F32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379694; x=1788984494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=A/qxhcwLiL7is2Xn1yN4UfC1f+vHo7REwUygveAIsxJzsTVIZhpTLi46RyUSZ9qTHl
         0hsbn6jTDHpZJNUAdYv+5isx2S6dTPvzKD3X4eQNUrIBRoGdMV7doKo9iW+WOGpjmddd
         ffAiYsfZifgO9SFG05crVbuj/1hD4acBE3PBCO5IrRRrhg2V5kOg4Gdu3pvFPv0HWWnl
         mB3Ck+luZmA5kbSUx/Tzj2uIultgoTTF4/InP6lWXzz++hTwHDybfv4GxNZBb76pYjXM
         tv3Hu7YXPbEhOOfpJAeVEUECq99bMyyZSUG4nRQDl+3QX36t1QiF+ypXaLqbGreepYUK
         suYw==
X-Forwarded-Encrypted: i=1; AKwUvBz8ycpQen3hW9QK/vCrT9L1xPNMBlr6wd5AxWRiHQOgtlYGvj3oKPuVTJkQpxCJCw+vr0ilFVaYAVE3K6tXJvEm@lists.infradead.org
X-Gm-Message-State: AFuF++nXyYgs6n0r/UuLJ0O9NIwL/TAG/EY+zdatJVnLOQhfXwwxbkME
	WM3AjPK4G6KISIvIBw2Lqw708TE4u8CPwoNxoTRikxM1oD3JAj4hrTv2aZ4WONTPFYprzWadOj0
	UhqO30UHEBAXLFxYFtscVMLV2xhz4+aO0KKKsUOUxgpXQ/m6agBZzl35XTyzh1nOCOwZUjVx6Z4
	Uawg==
X-Gm-Gg: AYBFou3HAPeITLtLxYt7Yf+gp21vQeo3T6tYb+Cy+4Ziin727EztmkqIVzsHh+iY5hO
	C3pzvKL5qylJPzEZeFSvLgrRSFbxAvYEurKeVxsQiwyGDSpMenILEguUtfTMylGpT6fpXI5BikP
	i5CoxR7rAnTpFoiYLzaoRr8XTJpZnxhZp3IOvFSfUYgDkC8O3Cg4EovDIHFOL+eyz9SI12VG4T4
	LpWrFP27uFz7TIKFZz0mc02TGTWqJJSEmH1q6cr8vh4fCg1pumAMGO+4aF61CbIeqwRCMdWfdNJ
	agDt8vc97E64qqW2KVZ7N3oKIokaTcVjPiUVmt4Vh9psZXXFDL1UnoOmBDqSL87fnmMU6sSiFka
	IJ+XazF8gnONy7uOoXc4Z2mkmt/M=
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811232a91.3.1788379694172;
        Wed, 02 Sep 2026 13:08:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811125a91.3.1788379693552;
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
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
Subject: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:02 +0530
Message-ID: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ttsGNOd7mWP4JCQRGFdySeE5YM_4sbjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9hJ2gFAyowTS
 ffn8VvKTOrB2igGqItertT9J3O+ptYTNXfNdE26IwcM7aYNe6tMPM0S5vwjtryi/Ql+lFSa29q3
 7Uh1yp5d0k3x82zN+5uWoaC/Dk+eVFmiBNNY3P16XpE8hEeRZQooLyoL24pYaCxNX7D/apOBeQk
 vaym9/dalRM5/ZR8ahxH8RqgpBGfw+vpJ0RG/AF9YfODgUbCWdLMgMSyGM1zK8Q9dvJM7/2yb19
 fMmf6L3ahjUgFGq5qtjKqtDGFQyCgDylBdWCClfR3k/hrhF4+4putGHmFMASJtxZPhrXTiIWT2f
 VIgM7GfpIBEVjuxozf7RA6vSZyOidg6G+9C7eNJRk6qLFFBE1KFwLtKV5PfNJ7l1W9OIZMlUtyd
 Jn6KfbVpvXo/XbdLs6CHfWsQ0tb3ShaKNe2txpb4PSkIbC1scsbLZJQep1ixM6gqBlcbBGKUHt0
 vIB6Qq+66x7AktiqBbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX1ydIatZUZjjd
 6KCnIjlfhXfeL9NmlYjZvPjj9gADstDIv1RTpqZD/Oa4VQhlwxGVZ7/dxMQQg8wWyA2VH0jsf8h
 z0Ogc7ZZHemxK5YWU/Lm2C5F5E49qqo=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98822f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ttsGNOd7mWP4JCQRGFdySeE5YM_4sbjz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130816_455802_F2118FC7 
X-CRM114-Status: GOOD (  16.18  )
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
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.55.0


