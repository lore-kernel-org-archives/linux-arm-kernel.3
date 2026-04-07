Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA2AFB5192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 04:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+aaEBZPA3YHdfTo6KRYe5g3z2LS1IYocldEBGvZCBpc=; b=ak/+3Aj7i76bR3p1+MbwDfVCeU
	aIZTxdm8gwaaVeOnjgLEk5wyUzGsv7sjV7HPZqtP3ukjx9Ik6taErrTCvuPiYcMZCY8ecEChVC8ze
	27QkD0o154rFyZZLVpYn8WVYSYQFnaO0FwMGudeejJdMLsLfyNpQmt+r5Gw6ZDEHttj2zHfzwWcMm
	z4gF7t+qCo3vxtBFxhqKNsXV5LxMlM5U+d8w3f29a2mOVgJu17z8Q8THpKyETBIkqOm6KvqMyAreg
	HUBm5r5Q4BM/SB5pPReKgAkvhx9PlkdtoMAdg8bl1EwkyzzybDcyXQCWt/lXnwNnbkXJih2kce6yt
	vp8Kb6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yLd-00000005t3o-2xqL;
	Tue, 07 Apr 2026 04:47:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yLa-00000005t3S-3z7m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 04:47:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ6xS3536836
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 04:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+aaEBZPA3YHdfTo6KRYe5g
	3z2LS1IYocldEBGvZCBpc=; b=JWrxfBDsZaLNxP8+vgwVEGUw8vEPx/u3IAp9VN
	7yHTNjMy/WgFI8J6cYUiqXs8nzxy66tlHCjT4ZpiIv0ozDRpgqq9LBVjvmN4Fecp
	ak2bW1ScJ2/CvySeABqy1nauIRBpKWk9JDRS5P2JFMmfRqPFqi2mSScAYU1Pkg9z
	e/StIFfB1GSSBEcWQ8Je8Y3hc9Y9PJb6m7HFRrNxmv4rG5E6691FTeKDu0swRtOU
	Yp1w/HT5K3/4HyNExgCh+UlWdWBdfmoYFhgBvjcPvKq5fA3XFJi8A1Y6C17b09Hm
	dj2FFLYs4bmFPvXdiqhycDPbwWbXNWJapTaCAclED5PBORtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra1256-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 04:47:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741b950511so2469140a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 21:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537249; x=1776142049; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aaEBZPA3YHdfTo6KRYe5g3z2LS1IYocldEBGvZCBpc=;
        b=hRHDtbiSCFNvAmzoYz4q5PDZyDKbKW7ZyLbPXR0HKqDFUmZ0KhEH7kkTDgp2kzrc4/
         3bHuIkjuwxG81pAfUwlwxQb/MjDiNWaXD0G8/K8fea/S3YZK6yfLPjfUDh0V5vGsIfO7
         Hkp9IO36Vqk8WCF6yfapnFTxapMmaEfXbT0wq/m/imHgWAHzd7Zqt1C9ZALyG20NGHHa
         OlAjwsSGJo6Um7CvjsKSZ/OhVhaS1iilMLwnA1mVBqrCSjNBArT5pDXbD0b0QxgxhH+n
         MnjX2fgD7Y1CxdLwvaAQ1LMkR6P1RWWmXDrFphcGjBdGytaqA+D//4Pzjg6nN01ARw90
         iYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537249; x=1776142049;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aaEBZPA3YHdfTo6KRYe5g3z2LS1IYocldEBGvZCBpc=;
        b=JQHYc93dycOBmeQuvaLj8joM3myf1Dh/wuHltBZDF3eSiYYlPdi1+r7axCcQisgQdB
         m3cw8cqFTGKV9hXcAcGZ6ydkJwCMCfHSf6yyYOVRg8FI1u44+5hbPMdS/oqEi3vTViLX
         5lAeQiDh5jXiJDjjAz1gBbspl6lXRd+B2nYyYCrZD3ozVprm67GnwE5ODOOY39xG5Bl+
         7zYt1v93tmvU4TdiXDh91YWDjucsD+vdgOxILpGhjnqIf6d24WGHbN37BFsx045CedMD
         7UjjtcfggxQ4iq3DZqm6OLM2cSG27qRxb4TsKhrxrosfKA6wftRfonjuOUaDAbpwaLIn
         sjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjH/uH/jYxUv5R7w99rHGNQHJSstYc4g4e1FVkIaoS4tFynEFAbyCoszNLc2piZRGM6eLCcoJ7qYPqG5y+3z71@lists.infradead.org
X-Gm-Message-State: AOJu0Ywek6/aG7XUFtHBN9b+giVT2FZQ9HWSK38EybvvY3TA61x11xPm
	gM6XxZwWdhe9a+dkbnsKouAgg7bp0JqQew8CJjp+wnoqxB9kYykVDbcdlp+EfQphenn7ELONo1t
	RtV03eLRUbafNVvAoXGJ1XYxp447cpAVawVcCWZ0QAggtRYkJ2JqvGwN8JOgfziLV6apZTnlCDS
	0Hcw==
X-Gm-Gg: AeBDievVxk8HcxhBU9W3nO3daz8oVZcTYGRPeiQkD9fZ/olSoxOWyWHPjhAkk/XKKX/
	Jo1VGG2oiLfA3VsZP4hX0YmvWm09GaMPHWRiIKvVTDE3dJCiyjGXh9e6Ie3DX+nBUB3iM44KpFk
	+BgwVR9P8spHM7sGGZsmBe5OaknS0bu2RT0Lsfy9NhwlBnAltAVkac8KXN0slMPvvJZedoryFSW
	LEVc/L4AGJcv4fATIqqSHX67KCgEcm9t4gEIeGkgJfEl8vEKKzGJpD9KwLAbnxoJqIVVyIogiZq
	Ts9cqx8HvYfL24UOVfw9p/gjsaxoh2/NKEJ+hH3z+QDFKNkYUR0SaBmwvrniZilbm/on4NWWilZ
	BeBASI0Ki1mfgY1i3r3Te85j171MO+g5okZFOCVkPNJfoJ+Hk/Ne+ydcBrIX2Ub6Uh1WPd6rQ6n
	1ShkZObUJ2
X-Received: by 2002:a05:6a00:3d56:b0:82c:d7c4:4c6b with SMTP id d2e1a72fcca58-82d0da2e1ffmr13231218b3a.11.1775537248919;
        Mon, 06 Apr 2026 21:47:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d56:b0:82c:d7c4:4c6b with SMTP id d2e1a72fcca58-82d0da2e1ffmr13231199b3a.11.1775537248412;
        Mon, 06 Apr 2026 21:47:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9cf065asm14998963b3a.8.2026.04.06.21.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:47:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 12:47:11 +0800
Subject: [PATCH] coresight: tpdm: fix invalid MMIO access issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE6M1GkC/x3MTQqEMAxA4atI1gZS6Sh4FXHhT0YDWktTRRDvP
 mGWDz7eA8pJWKEtHkh8icoRLFxZwLQOYWGU2Roqqmry1OBXboxH5pBl2FBUTyMBc5x3HKkZvfe
 upo8DO8TExv/3rn/fH+/w5/VtAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775537244; l=1516;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=q6N0WfkFV9v4xEgCEWlWJ743nK/v6b/vWjyL8Sc1oz4=;
 b=BsyoxXij77HoegeG9nCNSoetgIv0hrvCEaK9jySxdSq+mjgInZ5uPGK6camjMJ5sUTUNvANQ0
 oKhJQknL49fDXgFnEa0ruWYLxzlUT/0YRgGoDRpPMgRseAVT2xAydti
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: nO9zqnnDGo0gyHE3EM6_JU6wfSA1ojG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MiBTYWx0ZWRfX12M5S3oP0gW4
 2o7yk9lgrkTmHpQAMlnJ2uGb2UNhJqPn824W6QoUTsiHiO3pciSqF9xK/ABWFX1/v9I0QRvqS3L
 ZNn/m1zmnvYJ9eBL834dlq+WjsD/RFP+XSH50kcGPJQzuNV+DdlTTQzs6wD2rGBfT6+ayBR2SjP
 LgX6/8BiQmZMDEqUB0p0jCRKaaf5Vv3Z2lR/6rT16hLXMwwE59/QjcT/0skOfdvjVXC3/tknLAI
 Ohh1an8M5Vks+8huwu2qjGCX3sAT6Z8Bj1VoyVMFrrVCZmYt5fMy2YPS67u0Nlnbdp2eU0USh2c
 C0Y9PXamsocnmJ6fqCpqlEUsHseGg1eXAqDLKklG5JSFwBsMshV8JDfmvzyBQGhnk2A9lyZc30y
 /0SOY9Issj7Ed4Z2JIDIKLAODGBwXbzQXHTyvycawqzY/lLuMhXY4QIqDcCY+olZKmK1NxaI5z4
 BYdu7VhmTQ91QfLRT9Q==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d48c61 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z9rP18_Dhswye3MgaU4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: nO9zqnnDGo0gyHE3EM6_JU6wfSA1ojG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_214731_066182_5DE8317B 
X-CRM114-Status: GOOD (  15.03  )
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

Create the csdev_access struct only when a valid MMIO resource is
available. In tpdm_probe(), base is uninitialized for static TPDM
instances that lack an MMIO resource, causing csdev_access to be
created with a garbage address and potentially leading to
unexpected issues.

Fixes: 14ae052f7947 ("coresight: tpdm: add static tpdm support")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 9b16f368a58b..eaf7210af648 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1430,6 +1430,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 		if (ret)
 			return ret;
 
+		desc.access = CSDEV_ACCESS_IOMEM(base);
 		if (tpdm_has_dsb_dataset(drvdata))
 			of_property_read_u32(drvdata->dev->of_node,
 					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
@@ -1452,7 +1453,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.ops = &tpdm_cs_ops;
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
-	desc.access = CSDEV_ACCESS_IOMEM(base);
 	if (res)
 		desc.groups = tpdm_attr_grps;
 	else

---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260407-fix-potential-issue-in-tpdm-b07b44416051

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


