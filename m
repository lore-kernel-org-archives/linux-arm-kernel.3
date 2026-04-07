Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D8EDB7FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V38AHF05pbRntEo446OrjqYBc2iMpCuuflqVj2qKSEM=; b=i8LP2EkW0Q82JjOZ9aEpdvlBTW
	Q0vwU0G1xhNpNglD/26L6U+oXYl5H5dPvgnORT2QNMfQJmCi1CI/GJEk300QqYrNAlfgAzxady1ZN
	Jl6mabYips83yNSYqatZ/UVEz/vInSGrhDqlyZ8EcM+ZMb8ZFuRiMbTm1qZ+nGHTaD0/0ooXN91pO
	EonTRRK78cVYm2uP70/WQEt5Dxpzshdb/CMtyKX7GFSEQFNQqe2lObh400UKJ1f/ZjiZDl56zW1Ef
	D/TGYrhOHiM9r8TrkjXPxN+U8k1CxQdAXNrwz28Czrt23rI+IPmg7VulkhTFoJ9srSAZNOthTtFFo
	sKokwXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4Jd-00000006M0R-2Qjc;
	Tue, 07 Apr 2026 11:09:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4Jb-00000006M06-0Cnt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:09:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X36k1405862
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 11:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V38AHF05pbRntEo446Orjq
	YBc2iMpCuuflqVj2qKSEM=; b=jsWffUnKe/BsOcS0r/yEOn9tRRkFaITi6ulV3s
	ukYOTYklMTiLGOR7n4sRqUy0csd01Dp5Mf0omqf6LkefksLXNnWiJhb0PMwuS5m9
	w6CjqiSLdEexskuWr9DXm/vN4VdW/Jmk5qa5IJEkceLkzDAtaB/8HBNCtdtKLXZt
	IKqPTaCRe5ONhO6WIRjyj9PKnIM+NyOWU1TftCffpA/dhDHdpO2XoIFmz4aL277r
	LeIn3PHeES/eFTVbODM2NlkHdsA5fFWkrW34D67MXP60Ycesl77sov9+sFUvC84I
	bQD5JE4/h50HNtfvFN4dYpzIFKz8OsiS3v1sEM8k0vQttdPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratdp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 11:09:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c709551ec08so8073463a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560189; x=1776164989; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V38AHF05pbRntEo446OrjqYBc2iMpCuuflqVj2qKSEM=;
        b=IBRwIE5TXXb6z8ZGv0aiIKNmJ7mR9oEEcrVsp+Mz+/JrzpbtWAgcJy45lz8q7gWr8O
         yvU9CS9lHFBcjMt2KVCZWKrOR7b2H/BMwUbGtCaIFFgA/Ldj5f7osVQwOtvkK7PtA2TW
         JU4JSZUCJ7BLYjpneOW1EdRMnqgp4BSV0vmVsgk23wWziZJMYVoDt30e9wNcPRcxEsFv
         zhITiJp9JvKuB2cHpYWmneTAg6x3CfR1Hr1ZMvSagaCK61NprMenY0F8vzCK266tT2qN
         Io/UAQU7/jVVhwUPEQTiu1vfUya8ZnQy+OuAf6Az6Fwm3BAO9ACd8wu53KPhtuNfZJgf
         e1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560189; x=1776164989;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V38AHF05pbRntEo446OrjqYBc2iMpCuuflqVj2qKSEM=;
        b=Hf3e3SyU2PK9a8ToSK29GjJVLOBgt8WAMVImEkKM5MUUOAHbyVS3bet9gB/Y8xMlqv
         x0lvcpUni901pldMZR7lVbJ5oznlv2huxwQAixEvbSmq9VPzxMCrtWjsSvM+q8bIiFey
         xul/pkUk/V6AhVcMPMx9QFirlFoDUVKMdswFbRYNdI3Acc0wVo/9RJPBDg6q5ACISCeU
         qSMlsIrVqO5oMgNpHexx0wONWJqM2ChpoSVoinMKooO8c63scO11sy06QOIk+Akv3XPA
         1WVsKN4ah4rkWrcQk0Y6bHyspVAXaSDJq1nydCANZLsY8nU4bmtbfCERWOKsGCTDQZOA
         H+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWXgaYaAVpSsnsxNwsVspwA/TVaEvANAplwTnGHwJ+vsVzW6WxhEw2Qo8O1FNb0dA9pLkDfvSnw+RjXiKojq8W1@lists.infradead.org
X-Gm-Message-State: AOJu0YxlM9RToh8qoNJ/DyYW0i9RWkaV918vFPQz8xgs4+O4Rn4euqer
	PhfFzZ/AJZCUsAOdGEBVC69CBByJHDfuTQ2bQCu5DM+YG01EI8v+gQQL13AG2iU7loYRjOiJQPv
	98Xy+G4x8P9VQR4LZ1NLZchlNMcVJDSb4UvPMsAZ1gJJL/BGm/D56yZetyWmQXTpdZcVN7tGl7Z
	tsKA==
X-Gm-Gg: AeBDies/3IfbM3mJyxTvrhowuTPZQZ5vcFIa626AGgwT7Kn4iduQo/Rs7ilufkrlUq8
	UGG1BUL3KMJfkbVE2Awxmb5ABkvqWsHg1IZQRJe6PvObq0NvzKLPXG9oFPkxPb5pWRDIj0DtQBl
	TJF6ocjf1h5hi4wNQXY6qVjx1EvqVPDEXHPcdhbxoqidNqBXBNhR9MFygYuywEFlGm6IXDNQNqT
	+e9ObaYLBcyjv+lrmw7CZc5rMoEOoJMp4LHUIvaR/Ko/gl8Z6UtEWf7hRtjCgl1hwCtNlvKOmu7
	ThpefVBOGnEdb+rFMWdcScB7wEy/h8HmdGomSFT+cQ0sl1WDdavIG7bptjq57KLiM8ItaVGJGnG
	WZgAc2uywmzdLhQAhWIVQG787WRK2qZ9Bfevfq0ixugJBTpoiK61ETZmueR5vwpv5TWpQHdlqFW
	R696iC+gvM
X-Received: by 2002:a05:6a20:7f91:b0:398:71f2:59d8 with SMTP id adf61e73a8af0-39f2f1296b9mr16645138637.56.1775560189456;
        Tue, 07 Apr 2026 04:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f91:b0:398:71f2:59d8 with SMTP id adf61e73a8af0-39f2f1296b9mr16645101637.56.1775560188975;
        Tue, 07 Apr 2026 04:09:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76cffd9611sm12610034a12.17.2026.04.07.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:09:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 19:09:05 +0800
Subject: [PATCH v2] coresight: tpdm: fix invalid MMIO access issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-fix-potential-issue-in-tpdm-v2-1-1d0e0d3cb793@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANHl1GkC/42NQQ6CMBBFr2Jm7ZBpU0FdeQ/DokCVSaDFTiEaw
 t2tnMDNT97Pz/sriIvsBK6HFaJbWDj4DPp4gLa3/umQu8ygSZdkqMIHv3EKyfnEdkAWmfPEY5q
 6ERuqGmOMKumkIBum6PJ8t9/rzD1LCvGzny3q1/7nXRQqNJou1OmqJXu+BZHiNduhDeNY5IB62
 7YvhsS1uc0AAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775560185; l=1836;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ryy3e1hHof218D/jXmpm5NKJoiAriIQop6leRdG8slA=;
 b=49AuxkdiSQQBK8zVgQdJmzbQDS2Xe3Qm2hjtbTTsO5cJnjfXheOsomcCNIsVvCoe7BhQT/FGu
 BCUC9dTDszgCuNXEBbJCwyJKzJIqSAKVGFVjGAyN9wg/ClYA/sZUZYL
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: JSTXF9vWJMbaytZh8wn6bmn5Ql4-NlDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNCBTYWx0ZWRfXw9TMkca/7bii
 F5ey9eASXvByZNxk/6LNtiFCKku7xjWO/c6zQIzZKvSL1bhHubkhawhSER7oLM1ieK0RTh91QdN
 uevpzqQUnErfS8RHox7Jwt9sef5bs9DanBPNZ/RptnfjHpJA0964ZEQSTuKEhOoPQYx5kOjsyU1
 a5JtSxqm8bjgs+8a/d0+Qqw2xjytuU0YBcFCB8+d4YudXRclyJH3T1vzQVrvW7DWkbbEUY+UUnC
 jIaExnmzUnDH1Gm6L3n7cgPaRW+qKHRqOvEwsGpS2AsjOsCSucHdccBIGcDSStAaG4tRQhGeaxx
 XmpwYdVznumvr7hsYIvMag5/R3QePx+m2Il1q7wLgnRY3SDbAG/tiPXYoFLV+xMrmilfvOWLy/w
 3K0hDz4CLNZsxz73hVZgGRzn9qUrzcRYW3HJBzlrW3OwQMSyaMNCYrXI2ul4iTujrtQXRrAJy6y
 8mf8IOzBncdMqIL3woA==
X-Proofpoint-GUID: JSTXF9vWJMbaytZh8wn6bmn5Ql4-NlDs
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4e5fe cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=z9rP18_Dhswye3MgaU4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_040951_163152_2F4A2999 
X-CRM114-Status: GOOD (  16.56  )
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
created with a garbage address.

So far there has no register access for static instance, but this
change helps mitigate potential risks in the future.

Fixes: 14ae052f7947 ("coresight: tpdm: add static tpdm support")
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- add more description in the commit message to clarify the change.
- Link to v1: https://lore.kernel.org/r/20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com
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


