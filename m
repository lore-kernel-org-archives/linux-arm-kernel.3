Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D5CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=se7HOTK+pOrG//2ynCzxibOBG+
	1bpjT63CC09YoWXZCDZ3fKaZlENJSkrr0P4b8UCGCY2B8sdMSZ9xqe38jYvNel5bahzeRWQS+ayPQ
	2PxpBp39oqTbC20t4kFYcCd1a2e58ssL8vCmYVwNERYI8bELF7y6F6nbLOcSR1f8/b92jJzqFXsXy
	cwuxWKPpzhHxMzcUJ7d1TDV6xSFlJl3MIjQtQeuGW2n5Qbflae21pBx2C2fjexhOcKaZQaHoYuovW
	BDDqDdRSFHyva01yY/9AwivKTUy2CFZ7CaBp1zEAylDejJyGC4h48OhM0TJGiEtgUExaRLh7lylgp
	QxW5P8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFV-0000000Fp9h-0YsE;
	Wed, 02 Sep 2026 20:07:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFS-0000000Fp8E-3uM2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrFpf2976075
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8q17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so23346635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=ReBEtpx2fKX9BIuYOw0sj1sDh37Cy8Ik+MpiJDmATpoGvIcL4bQ9FwVHYTa5FJs2+X
         +FO1DtzQTJR8xVQ7hK5DGjdg3uR3tGG4v6X+VrH/cI77NcEpecpnZnfghtIqefxmAgKF
         zITCuL62IJ1Z9IAn4JfIA+AO3GZr36G8xU+JglAmeZAd0tziHsRdGkoIRC6BXigBbKof
         j+tm6950e48b1+QAhcd3v0FH1A0Uhsp2une/8PrlO3CwEBLmh4BklLTonDY8t0Vi8ruG
         lLLjgYNOZ3Wm44kyTt+NBOzP2fO1AR7cxDR6yW67quJSLXCN1ZMSyc8h/g90q4ecvDd4
         wtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=XjnFMw7uynhevn4NsDbQGlUdB4XuWLYs6nJvtKMKbzWTtToEcaKOu3ZgoKvSJeXd0V
         Oe6TrE9QMSCLiriFoMMtY8vYq7vPQ32fJApxlW7aE45WffsovCdtmLWqmjNvDRI7wK2p
         Qnx+Wr7wl51B/aATrc02HoI+4uiDok2fkQ/WEGTENjBdxYhYzd2GEHAGT1swvU2tJU4P
         qTyiWf4XvbVdaaWnKXKXfO9Cl1awl6c3bGD+H1U5p3BNHSgALE+0OgVlkIYGZRuD1KYC
         1+R/Q6uAq6Co1B8UBSfRv2R1sBLj5M7BxGJskepWqYjIiwfcbZSf+gFKBh9IhxC3WUkh
         fHiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqEb0nadl/PsAx/wgQho813O0SdtuhqHSjA+oODby8UmJzZ6ZleOzaIH5CYt5i1rm3BscMnAhqt9agpEvn9x/F@lists.infradead.org
X-Gm-Message-State: AFuF++lVecJyTdaT5arvKgKuOfCP9Vydwt3Et8+gUgS3l5F68khpAH4d
	C6vsCRfYC7jxkCewVB/pOzXWOOs3yhR1Roh167AAS28CBQroTDHQwRnahceTOb17QgJVmade7vR
	THM9ZV6IvIYMEO3YmXHPEgqJLO1H2RDO5L6Y/xTScxoMAw+6aGvsrZ9NymlcQoVAf1PZ3ucwgly
	RIsg==
X-Gm-Gg: AYBFou3dNhukzowGQZ31LmxnN/Zoe3Lb27QA3lJWPgoU1TLqv5AosECCOls/fBxJNcQ
	wsxobLxD83Ec8dWS3V5D98p4zb0pa0VyGfzmcfvi8anCghASiYHK8XMcU19RL2XAy4OKeFRsuVz
	DCi/OpH3mpkF3+90/TqHKPjSzANacZO0jwEqSwBmVOJRFCyVjFnd9dH6/IZqxTSDmBykzymaDjy
	tfgwLWqGS1XU3vGiKsNVnZPp1Vqm98pfRCQs9Bon/reQa9IaBGoxo33QWhZ1BASfXa6x3s+szY3
	LlqiB8+9yz15gf9UkzTsqqfwIFnZ+bsqH+JBKS0ZNC/To1VlQKUBRKyUHhrwVMebMRnatyb0hWX
	LGVQAF9YSh/1CZWlWiLm/IUtcxeU=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99505705ad.19.1788379673743;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX6Gs/UeVwmMWA
 HPPNlfRlDfI6Qju2wU/ycXep79YYPWkyNU5Q+zqgk6jJ8GKJD7ufFUSMFc0ZJ+RLCJsoW8IOBwa
 QuGfNpz+opFoPTzxSVjlXdgeyMmojf4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX28vP1Mv8iwsn
 hX7Pwd6CQA6S/UMos0J9BrHqGP/AQddK0hgaNZcHdAi2HyIDZfeKvftIK7828ufx/aLgLP9R5gn
 7OJKIhxbh8IG7xNQMdjX69RijYccmkkNmWarfX9Yq7oRvTNI3Q1esDB14hulTdNXpJwwC41M2jy
 mdzrFo8RDENSFNLunca91+flFIi9M/BbBfT20RUoTa5R9rD26+3wjNIGJfwaE2sHkYqiOMAIs+s
 Df05ORvKTKuC2yW5CrS9sHfesmjPmTGrasMy/z5Brm7yUnACIio5N3SccGL9LFtFSWWuhwVWqEI
 JcsNHlmoUvLW5rP/9tZAiVo51a5dJRfSgpT3tqJ6ejyIEyBm2hf3L+O5RMgPoaOIbD270fHhgCa
 TNXE6QzxzI+d2SvmS5I7Uvk3Rf226oOmnjMm+AjprHeVA9LEHNaD2pH9qycFQtmDW/MQMZkUTis
 qrqeX2gnkx+dvtCvI4g==
X-Proofpoint-GUID: p8tcGlTLF4Gg0hyLSq9k2Obf_JknNQzb
X-Proofpoint-ORIG-GUID: p8tcGlTLF4Gg0hyLSq9k2Obf_JknNQzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130754_978620_941A92C7 
X-CRM114-Status: GOOD (  17.50  )
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
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0


