Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60855C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=0ZfBkseKpOwFgO/qT8bTO2Y5ov
	vw59fzodGzZPjoyqXNMaPVfcxQxrskv0f7IojVg9SxTGCaW75NzkApDijEjKOMWEalxm3Rt88kfPn
	JfWJoPCHqyUXF2RTDF5MqTNHRmty6OE7OIGT14PVCSCA5bQUrOGl/psOKC8X9QMH78QxcLvK1Kdjp
	pwPM3muUCgYmQn5kAMPx2I+G/WbAtcES4Wy0AMqaI476IInAt0bPBcQRTC8fEODhIkZNeebgV3WNy
	7XLCVEPVnyryabYQ11gElUrvALAj8oYRAtL0D9p+9cyrbRf0JCDb+UP/iI3zXqzKBLrn54NfdrVfA
	+sOj7PKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFh-0000000FpFx-1Tbh;
	Wed, 02 Sep 2026 20:08:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFd-0000000FpDt-3jWT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:08:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtwI1650594
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sqrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:08:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so23349475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=kZxCaLzQ9Zfkx4Hj8SoHhI6V8N/6btb71FHuOAFSQTbjWjFK1qD76JbUtS4adjilfe
         +t72cWb/NAhy6QPMjpgvecgfl7V3HdQM9M+/sG756LyfX1eZD3AklSNDw4SH3SO8dQoZ
         qBvmKe9+54REC0thgYW9hLt7MDzQiw/jsn5Rjxg9/Dr5/dees7pG5JRyMFoqKS/QNY9N
         8v9hwZJ40cPngmRXdobNaxQpJWqn4P7Dm+Ox8gwKzlvrLX4etcF/706H4XXvh+dqP54q
         atUBUjshL5Dv4K+SYE8MnlMERwULgBGQ+Rwl2RGRCJMZXWkzb/CE5dM2RHGcbtUeY7et
         zAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=X+YR27aAM1fPbf8AT2zBc66UXkMFqK58j6aQ9KS843eO8YVCM5QhDTZqY+mXYilN/r
         0e2SBHjIeuRy93blmyFVvJKl5wJ+ehXErsfn7sNx1IKkppF66KJ7C0RamUUxG0g64LrW
         z2xko3vyvmlz9w0Mr2a3KXntpvbZSdTcZ39XEHu3edOz+ggSpbsUIfGkuzKhOIi4PK2q
         rMokisBgut6aKicza218DFIuYpx9FRVhO/gApYBuvQ7m0lk8eNnG2xX6PvwN2Km6oGF6
         XhMOirlNEbDO9Dl2y5XGvvCY84lUAOG1B8ajgAEB9SOV4kGUPD8PfP0SZ0PyxGxZViCH
         Df7A==
X-Forwarded-Encrypted: i=1; AKwUvBwUQVJyDdvMn0mXL9LsEUqP9FfSsoIyPBcooZyBRI8JGRHlb3uusc59qXh2hoEHK6yNdZ/SSv/rq9EZkPvVkA5v@lists.infradead.org
X-Gm-Message-State: AFuF++mLWeNzLYeeH2jtRtzkGE7DPoxQuZ+Ss+C5FqbEOufNVv17AK6j
	t4fpbx/sasaM6p4B/Y3WX4MIQgY/w4Kcgq7aCicH76llSh6hYh7Ys9Z6yquaPCqWpnyN74LC5aU
	ZjayRTayCiEu9IQJBCZrUjDFJl5JCB+5uPD9Ud9P471e2WhKzWBuiqOEPib3wfpIEFfTdolUG8G
	XPZw==
X-Gm-Gg: AYBFou0nwezIQMJKIt/iwxRBp6lXNMDL1RCRgxrr5LtRJQaBC2uhIJy9Qbc6wwDa/s6
	pXLEv+iSjDVzbIaNu/+/Nl30z+YNOOma4gVa+yHuBISrWzcWJmHBm0xLEFfxUlMBcNV2XO9eQyG
	4UgfpkpeQymNJkN4HcXOIaEQrVmbqzQHPbMMK29uBmfiyrUcp8aJ4g0lByGUzOhtfPS87pNaCmY
	htyO137oquuaDcJI6gRQ2UsYEPZxWFfq1bIV5YlKo5lhUy8r6IdZf/n2CxI3qJh+3hnZb8LcRDH
	Wce+P+7aOZrwpaGoY6LwDQao6Bkp4yyVsscOFZsBy+8Dlwr9MB/Y6w93XATpTm9bNLL3qC+PpzV
	sOskYzeO+l/Md/zf/oa8FhKcH0Vw=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445855ad.4.1788379683910;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX19CrCQ0qWduI
 loGXvFsamhvJkE/P/2bmQrViIwe5oNk3MSVn7YxhLCQv2572lDAslAcoAArsVC4xLi6yI7FGu4a
 Z4M5Tv+SthA/eywT0zCoSO/+Y74KrxACG4YgtQl+HhSJFEoisvh834mOKU31wZy9xuSFvXI+Ycx
 JwUqj23pi0UxmATxU5HDx2g43zPA6WmOYs+t8UIG+6uOg826irrodLMR2FVYVzoMhftW/MEDm/T
 V5qne4eTyQttKwFVD5Z/7O3arjbEM0jlilj5A2x2WKDDBxMmTmL8fWPEVSqRXrRz9UsGX7m+X1c
 VriWt8Znnswk9+bx3f3egdiGi6K7I7qJYbu+16lu8GB0nIu4OhkwQAvAkdtsmTjnFURAHdCA0Nm
 QZw0mOo+IQP7xI24zxQ1OnNl2R+M4wHPlDPMRHNj+9eEc6v/4V09rihr1cgFCCKYEA0EjG/t2sH
 UMnVLSBH0J+ZAS+1/QQ==
X-Proofpoint-ORIG-GUID: tS6kajORpAOsrAV7KBtLGNh3LpedKOyJ
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988224 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tS6kajORpAOsrAV7KBtLGNh3LpedKOyJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX7Uy1w5k0dp/8
 bB2o33Ph8wE6MjIpNveSUVMZjGcMr6TpbxLb2yusoXpeZUqsNQk4z5Ful8ivYxlddtxb8wS2KEr
 Wbrzh+KxrYgYawi8Wo7mF7qhmPSWE+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130806_044013_50F4C6DC 
X-CRM114-Status: GOOD (  18.38  )
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
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0


