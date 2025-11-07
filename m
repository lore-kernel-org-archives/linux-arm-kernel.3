Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26742CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PmIP5A7OZZcTYCc0rIwjJlGlLMyg1W4I5vENm4WWsO0=; b=ZGpakFp5+jftLjsSEAUoCxQvfs
	q4odM0guv++NGEGH29c7pYzGCvwijniCVxTCxa50fNUSHGUk+N+Fzb6QNiunuTOBXsv6yuxBDKdUS
	KYPrwDTuGBVTxtsTgz5yE2zoAA+5DcyKIYmcMKmqxMLzEc1kTJnARzu+hfcvJnMWHBmr31YGVGHm1
	bNWszPVu1TlNuK09Mdi+xvxIjgBMwB2a60bgjCl1p4Z1+l1Y1BsfkDhc9I9F/77/4JjKZmCNslxA4
	m24e9xXELbmP3bF9I4p1aIVkEnmLv6qXa/RriLcbsbiNhgy/IhNKZfZQEDJ6DUc7uNYu9IjtFvcPj
	4Q7zQX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHFmZ-0000000Gj1L-1025;
	Fri, 07 Nov 2025 06:17:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHFmW-0000000Gj0x-20Vk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 06:17:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6JfD7o629531
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 06:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PmIP5A7OZZcTYCc0rIwjJl
	GlLMyg1W4I5vENm4WWsO0=; b=XYpgYmgNEf+FHHbIQHX+K597xuSgUDrfjFuCu6
	b2xYckVsGxBj9XIeCE6q4hRzc3HVyCQ7HJ1Ou380eWNUvJkNnOLHBsWIiUaxXCQc
	IvwoxAlwef9XrtfOdokD3kOt27M8Hk6Sv/BFV9WVwMRJusCUKOjowRHtLuslPKA2
	gMfX+FFdF1S0v1RkcvxYgHbDmpIFZNL2C4hD9MpSE/QrqOmzIaLZdQT4DbUxkmbQ
	G6Qx+TissIrsZD0vRiGsp4Z/2bGfZbu0JptWpPlL75sqymo8oeha32RT8n56HkAT
	P/xVgn+lbyzyHglC/87QKq2mErK2WSjoB3rut9UA/b+d5eVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92231gjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 06:17:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a998ab7f87so938972b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 22:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762496226; x=1763101026; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmIP5A7OZZcTYCc0rIwjJlGlLMyg1W4I5vENm4WWsO0=;
        b=g0btqWMBctdhjZ1Sr4uIW1KIJfrkpTw4oWxSAoOkkE9yjTLFz7QbzKGnNBL8pIBHuX
         eu3z3QhoL3c5h4eubEe5Ke4QplGcYAPNNY2Bv7haWixv3xH/+zyeBKz69llnxvUN4slV
         jBq6fqwT3tScutZQo+ILBxFibcrfHPftX8urfGX68pJDLnf0X6qKrHNryyKwVsvgcO96
         EVdibL5V9Yze+4MnP1NKpGFO9arWGgOvU0AVYhDZR4029RGtOnd7dPI0M+5zUY635TXb
         qYJHisxTilEoIelPjkf8CRW6GNWDvVGSSalCgUVMo/oC/s60ZKbLULo+41M+dhBdNQke
         kMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762496226; x=1763101026;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmIP5A7OZZcTYCc0rIwjJlGlLMyg1W4I5vENm4WWsO0=;
        b=lowIB+7cJ3Ylw0LGG5GP9rmr8JpUp0zaVz10qxJ4E3mf/elLRnFLK6wSCM0v1Wi+YL
         p7oOHhmdtMTMFDvt/EyEORXgaavdBw6SBSvUCm9HjzBZPvkcPm2dTLLfkbTCXcmOAksl
         uqfiQ2iMz3JJJ9CQyD110hUJT/vFzrmrSC/AfUsuAyBD2ekfu5LSUyxBIb2A7CUvKwL0
         3et8ag0PBzCaVeAkoe0L4zavOs0Dukifejey1GNqui72Ivr2lC886+9dVTJ9sqzJFct+
         5lECeUclZsbjgDhlCxpGMxdMZvj9kXOkC6R/8tLj6QgRWjsVZlgteUuWFqTgVRYhebaJ
         VOnw==
X-Forwarded-Encrypted: i=1; AJvYcCXtKEo4jQ4nGHuYZ1RAhFKf5RQN5/2vd9dcRKJu/FzMlWp/3N86BFTfyN9vRmlqUi8yXuWlfKgQdUmCk8X7xrJ+@lists.infradead.org
X-Gm-Message-State: AOJu0YzKN5jxEmIOoHONgvuA/gR8Z8woLIhl/HnNRnBmQHkEohFEjd9c
	NW1s24MyGRXmR5bFby5ateRyAOm/gqAz6WzNoUYwItIb0c2n8alz0eahpBLfjZrEWTnw9Nphsu1
	bVc6woijCVM/WBNX3nKZfoYwna1zw11M29gXrFA9+cHMNUWAq+H58hI/kfp31at9zDyoHZItqh9
	kHyw==
X-Gm-Gg: ASbGncuTqT4unqn3jYDxsfrGFP2hjGYAtoK/vCv5cn0XCZCPMUcFk6nUn9t3Cszmro5
	nAMrG3HE10YKjvigFg/wSsdQAJxJCTRZyRJfqRs3P6TGlfebxSUBlNRPeQdYwLlqBnHUhi/OxM2
	KPl0jOpM06O49lN1hjvolC+DeV4knzIvM0IcYu0o7Qtv1veAO3hW2lPY1M4UIBIsLkZTYnjH5p2
	1Rj1PTV6I+dizMj14BwmcC+0KWcpkr1qXCkVvmOf6mTovkFYUmjr2RylRaC6+xPqGVNOc1T4EJv
	XJJG9BH5dGbuTSaell6bxiFS9O+1iRybd4lFvKRlxQDBfKz9dCbGwFvnHUDYOe8leLk/Tyx9Luh
	hNzshUVpaBETHGLT5hG5ALE8i1fnkEw1HEcrpAUwQiBoWvI0lb/p5Ih1P4MpgwQ==
X-Received: by 2002:a05:6a00:2e25:b0:7ab:4fce:fa1c with SMTP id d2e1a72fcca58-7b0bb537e77mr2836073b3a.1.1762496225613;
        Thu, 06 Nov 2025 22:17:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELyEQVccztdB2stF8xyIaaG0Tq4Fwuh0GqLmntX+pCk+5UO6Hh/eju816NjTCfJ1x+21E8Ng==
X-Received: by 2002:a05:6a00:2e25:b0:7ab:4fce:fa1c with SMTP id d2e1a72fcca58-7b0bb537e77mr2836041b3a.1.1762496225081;
        Thu, 06 Nov 2025 22:17:05 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccd5c75bsm1614833b3a.70.2025.11.06.22.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 22:17:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 14:16:39 +0800
Subject: [PATCH] coresight: tpdm: remove redundant check for drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-fix_tpdm_redundant_check-v1-1-b63468a2dd73@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMmODWkC/0WN3YrDIBCFXyV4XUEl7ti8SglhdMatlPxUTSmUv
 nvd5mIvv8M553uJwjlxEUP3EpkfqaR1aaBPnQhXXH5ZJmosjDJWawUypudUN5qnzLQvhEudwpX
 DTaJF8Ei9h+BEm2+ZW/d7fRkPznzfm6Ee4b9g6L73yjiJRFOpWFM4LGXftjVXqeOP6QGcBTbDo
 /8TeCwswzrPqQ4dRUtwBqO8toYhRmVd1JoJ2Dmy3gZHBlUQ4/v9AfCMZtr1AAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762496220; l=1652;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=70JJQiQ4uehLBIJN0Q7wS4J6JTtu741G1HFu1yDqauU=;
 b=Hxb34bvSmjTUWt4yZ8DQLxyP/cG2dPdjYqlm3KGUPEFavcV0jlkMkZy2DxkMpoYnaVt8ExLfV
 nF+kMt8+N2AAqiTMx7T+vgE5h9hXBUNIb9Sz9+WxXyaOMFd8ttf1aKH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA0OCBTYWx0ZWRfX63gcFnaS6lV5
 1DCZilGhiik2xzXS7jxQbgcpceuYOZNPLhzGre7pdIMUh71G8DH1aCSoUoHzBJ49iIyrrfiiKFy
 WN9XS7QZ0XZMYgXSmMY+nUuoMvZUjoDvG5eLlelsIDquTWDZMdnKuOAfauTHMBbEGJsBRYl01dY
 TESH7ty9a7Tf8pf6pL/BOah9EKq7eB85tuw/wFrtRhet/CNczLxvOYMiDaFrtFsAYPu87yaoDvb
 rtIzpGVNxJ8UwhsZgevPGHe1KT827n8LjHuOUIbqDwnjebF314w/0PyG+YcoHAdAPvbgetW7x73
 Q5VivdBg9Wpk62aY+XMeHWoYQ9g0OcJmmP9s2slPkl/HDWnVICmPLUjMGTSZMaeRzF9FYRuv80k
 ZFOU5onodoaB4TKZ8yp075idZMkfpg==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690d8ee2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zFN5lriQbSSrU5DE2BcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Ti1TgropT7-3ZNS1MbS7Xr1vmaxTfDae
X-Proofpoint-ORIG-GUID: Ti1TgropT7-3ZNS1MbS7Xr1vmaxTfDae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_221708_640389_13574F31 
X-CRM114-Status: GOOD (  14.97  )
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

Remove the redundant check for drvdata data because the drvdata here already
has been guarranted to be non-NULL.

Fixes: 350ba15ae187 ("coresight-tpdm: Add nodes for dsb msr support")
Fixes: 8e8804145a46 ("coresight-tpdm: Add msr register support for CMB")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 0e3896c12f07..06e0a905a67d 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1402,11 +1402,11 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 		if (ret)
 			return ret;
 
-		if (drvdata && tpdm_has_dsb_dataset(drvdata))
+		if (tpdm_has_dsb_dataset(drvdata))
 			of_property_read_u32(drvdata->dev->of_node,
 					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
 
-		if (drvdata && tpdm_has_cmb_dataset(drvdata))
+		if (tpdm_has_cmb_dataset(drvdata))
 			of_property_read_u32(drvdata->dev->of_node,
 					     "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
 	} else {

---
base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
change-id: 20251107-fix_tpdm_redundant_check-a5a7bad4b7c8
prerequisite-change-id: 20251028-add_static_tpdm_support-1f62477857e2:v4
prerequisite-patch-id: eda8dd6884b831cb10affc22477aece39c78b408
prerequisite-patch-id: 7beb8b17d54ff21bc57eab10b56e6ffcfa4d1963
prerequisite-patch-id: f6f1e78dba3f1d3b1191ab827adab5a3b7b2326a

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


