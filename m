Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035E3CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 04:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QTFp0bZDGTPide3dBX8di61N7r64en4XU6M+Ji4UmZE=; b=aAKPsutzDc91EWHp2Vkn5ePJhZ
	J0KNuLJ/v0uVBlbLhU6rqYf5oSfBah0b736tvk8FPXjr+BB+yieZaUVTyBleTrgF4xrsCYvch2VL6
	j2YrTwoxY3vvimfYme8ZzDDUIifq1zjNaiD90tEx6FEvsCCk1MY88jR8eRyozzbTHF6frkB2jsO7k
	764pbHtksnS97Va0lbAANWVLTkhGklNyiPsvPU4oHrA4vhrcobWoGMvBnoWmbGzudaG7SZHbOTJeZ
	SOZt6YU3A0Fyd9P6ZN9g45ZXsb4mWvgzm1qC3tq8kiSpzYkotgThjB4TcPEaXnEZYgzGjbE8/kChn
	xtx0HSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMI7I-0000000CFPE-0MEH;
	Mon, 11 May 2026 04:19:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMI7F-0000000CFOX-16ie
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 04:19:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B3Tk4Y1659094
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QTFp0bZDGTPide3dBX8di6
	1N7r64en4XU6M+Ji4UmZE=; b=D94GvMLM36ZUBcoiauVKk9xBLDaiBJfYumdkiE
	hbl/Is5tKkAqf3qa4uyGExLy0btgflwQL94tHNqU1YYivbmvqw2hUzvEgERSAMDa
	XMQRpapB+zpkPbsNMot21EUj7rsRieJM21wrd1dlENml1zc9g2NfjFQhUp9RdwuT
	Dzal3EN2m4SMbsASsQK1chmF7HNRJboAu2uUYOURXXu5SO9Y2JIkdxUj6VMpr9re
	YMaUqUNw68rVc4bKf8LKqqr+1IiRwQm3UQUVo/Cm3oMoZm4Gn0W29zi4RqrdJ0nG
	AlPx2C1afNMCL+hOnbY3ACfhayhoJvaEq6zf0sbqIMaAhdhQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q4mrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:19:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8279604464so1289290a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 21:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778473174; x=1779077974; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTFp0bZDGTPide3dBX8di61N7r64en4XU6M+Ji4UmZE=;
        b=dnKS3qdAZVDwH0ikx5W6HMhIgoueuTK0XgkYjKE1i3wmYBmqFC2W7hYWo7HnUFK+mI
         8ADLuJv62nKcaEJN7fP3Gd22yG9zXTR5Fqjcia+MokOCLGbm0cDcjiid+TbYZhzDLN9q
         z4Wr6ElBg4EG7/IM2pf7KtBbHPpzmvRpHHnCuRjM1hFUAMDz27XLCBXxITspg8yLwaEZ
         ZXsBZKXKIadkMUIoCN2nqKz3DYDPqQqT4JxQpORukW/4JbLLnze8sKlwq4ONczZpV5iv
         U8xMv0hpMprGhr1n1chCohi37d4bP4vrfL9cxANOQJxlE6VJ81j35XeUjl1QIhQo/M7A
         L8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778473174; x=1779077974;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTFp0bZDGTPide3dBX8di61N7r64en4XU6M+Ji4UmZE=;
        b=LDwN3ONfLrGajkj/OYbC+Tr3E68S7I4o8oQ4PUAIIUVOXLTLSQdVu8qKAv9B2ccIq3
         rbQnynDcJbjxixaoZX0rhp4BOzdDtckWs42Hx8Qg5I1NKInpfKxnUtDbpsDwTY6Y0HTu
         fHbnkZ6/uu3BWYx4xh1GCc1O/iMqOOmks4wF0CksGelrg6lKRj2Eiyed2fRopgstjzCo
         4gK/3G0hAWUkFyoHbncYERBJkggvI+G+F4B/i3eUfVovPm9DZF8vWOFV1hrkTCVnO7Yc
         rPVwevQeuJ8GCfVwyCLYCOiNF/kKvPuaL4vbB7SznETuQnhU4YdmEhgqpyj98CD+4e6q
         zv5g==
X-Forwarded-Encrypted: i=1; AFNElJ8uohqt1jSu3z6joXmEJuZrcj2/Id++0bb9zTdDUjy/XXMw49R1YXAWwSYYlRatEQs+0IqvooXOTrD6JdHZeCN8@lists.infradead.org
X-Gm-Message-State: AOJu0YyZAumsZw7VcyJmAnmnS9t1JKcLd++kf55r0vPjtaY72Q5mS8v7
	07/qojKPaYvu1i9wIKUId9MWUcqm30PaiSG4tUBTn1Yuoq2ZXOkvtuhSiqe0rYCMHsP2ffI6FXF
	yrqIHVj74hrDa2f27EKwBt67g8KMIAOqXxkhJVxEm9rxuNZo3iv6QgMckX0Eief0GjpExIjsLvB
	z1sg==
X-Gm-Gg: Acq92OGL+7j42oVZ5RXGX40SIp9jjCQyFesqex2fn+ji1vGRTYs9VK/i2c2gHOzT2kr
	Px3MDz8D3/Odl1xqNd5RE9kozX+SfWr48iuboCaPX6Sh45J57zS0yVNfzdCrv3TAqJIugXrjqmA
	WB8qUFzjb1UlFGPfnpA796QN2NjI2vhmJ2NtrpHLSPnx2h7hB1LQZnLqUENE+g6s3Pkb4yC77Tq
	ZxA/qCBg1y3Uzpt8uygUs90YKeRbk48mJbKj9yfNfQKKj137MpTkFHDnUG59/oBuLRzh59/kvEa
	Z50RRtTSg0jb+AS975wGYoOQId1WZPCMJ9KGXMaUi9/FxIs6g4D/5gbWLHZlGkmZeynQwwxrE5Q
	YtKcJE3qt7HgJ9KAj8gZzzLfl/FuPjpDvY9SC9H1P7CqEYfaQcJVTBhVATXrPxRV2AcpbpkPwJp
	nphF/o2TAN
X-Received: by 2002:a05:6a00:14c3:b0:83e:b443:9651 with SMTP id d2e1a72fcca58-83eb4439a28mr4972128b3a.4.1778473173972;
        Sun, 10 May 2026 21:19:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c3:b0:83e:b443:9651 with SMTP id d2e1a72fcca58-83eb4439a28mr4972089b3a.4.1778473173447;
        Sun, 10 May 2026 21:19:33 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f049sm21441399b3a.7.2026.05.10.21.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:19:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:19:18 +0800
Subject: [PATCH] coresight: platform: defer connection counter increment
 until alloc succeeds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-fix-ref-count-issue-v1-1-99d647810d3c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMZYAWoC/x2MywqAIBAAfyX23IL2kvqV6BC21l403ApB+vek4
 8DMZBCKTAJTlSHSw8LBF9B1BfZY/U7IW2FoVDOoXmt0nDCSQxtufyGL3ITGdp2ldjRKOSjlWQR
 O/3Ve3vcDTva7NWUAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778473170; l=2818;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=UKL3/6ObZbN73UvV3SxxvUoj1Xc5oqXCLkUcUgzWubc=;
 b=limRhpFZvkKg6PHRA5Ay5YOt4fAhWKPitzgNAc7/aCJu5IWBfOdqmXHxHbpNw3IZO2+/cW6Sw
 wUd+S+WAqUjAfiMMwwK3OWltbuG9N+hpS9zEC287BYg/KatNERNXm6H
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: jblxqkDvZzdPwbbd3-0GJoUAacSsthtC
X-Proofpoint-ORIG-GUID: jblxqkDvZzdPwbbd3-0GJoUAacSsthtC
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=6a0158d7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aWudVU2R90OKWqy0w6IA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA0NCBTYWx0ZWRfX8pWkQxFlxCv8
 FJym5unTCZoF4n5H/+ZZAlGz84zgPQj5+10GKqB1mFIIqrY/2/KwlgSYO0N7Knl906150TrP8GG
 9bEkwAdC6xyIE81GzGK73M7bc4zWrzFkqvxzFYQfpGvcEfldHln6aL/hC7JCG0bF3xMAHz7rgKv
 GUQOOObUvhcaq9F7HjndOdx+Eubw8XsEFMTsJK/XQmsZCv0IPWuvcRJ1cUjs6vWiOwh4FkMES/v
 LVtATKqJ9AAVsskI8wxwOtm3uTwsUOomC+ZcldDZ20KpjENstX8umi2PgVa9nDUBX27chWtJJ9P
 N41gYzH9j4pBXGXp99ZXZSBzxktxN8ixXlzds3z+ZBkaN8nH2VuUFYNtFm0Uu/iAnFBXRB9uP5S
 Rw1HYMGp0Vzl3x78df6j1zHStuXIOBK9H9OxnrlwuPbDWNK06iBYCww4xblpahWR7yFdPGIn2uL
 UXmnqRMvklZ1R0bx0mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_211937_449169_C4FC82A5 
X-CRM114-Status: GOOD (  13.35  )
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

coresight_add_out_conn() increments nr_outconns before calling
devm_krealloc_array() and again before devm_kmalloc(). If either
allocation fails, the counter is already bumped while the corresponding
array entry is NULL or uninitialized garbage.

coresight_add_in_conn() has the same problem with nr_inconns and
devm_krealloc_array().

In both cases the probe returns -ENOMEM, which causes
coresight_get_platform_data() to call coresight_release_platform_data()
for cleanup. That function iterates up to nr_outconns (or nr_inconns)
entries and dereferences each pointer unconditionally, hitting the NULL
or garbage entry and panicking instead of failing gracefully.

Fix by moving the counter increments to after all allocations succeed,
so the struct is always consistent on any error path.

Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
Fixes: e3f4e68797a9 ("coresight: Store in-connections as well as out-connections")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index e337b6e2bf32..93c2d075cad6 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -45,9 +45,8 @@ coresight_add_out_conn(struct device *dev,
 		}
 	}
 
-	pdata->nr_outconns++;
 	pdata->out_conns =
-		devm_krealloc_array(dev, pdata->out_conns, pdata->nr_outconns,
+		devm_krealloc_array(dev, pdata->out_conns, pdata->nr_outconns + 1,
 				    sizeof(*pdata->out_conns), GFP_KERNEL);
 	if (!pdata->out_conns)
 		return ERR_PTR(-ENOMEM);
@@ -63,7 +62,8 @@ coresight_add_out_conn(struct device *dev,
 	 * used right away.
 	 */
 	*conn = *new_conn;
-	pdata->out_conns[pdata->nr_outconns - 1] = conn;
+	pdata->out_conns[pdata->nr_outconns] = conn;
+	pdata->nr_outconns++;
 	return conn;
 }
 EXPORT_SYMBOL_GPL(coresight_add_out_conn);
@@ -86,13 +86,13 @@ int coresight_add_in_conn(struct coresight_connection *out_conn)
 			return 0;
 		}
 
-	pdata->nr_inconns++;
 	pdata->in_conns =
-		devm_krealloc_array(dev, pdata->in_conns, pdata->nr_inconns,
+		devm_krealloc_array(dev, pdata->in_conns, pdata->nr_inconns + 1,
 				    sizeof(*pdata->in_conns), GFP_KERNEL);
 	if (!pdata->in_conns)
 		return -ENOMEM;
-	pdata->in_conns[pdata->nr_inconns - 1] = out_conn;
+	pdata->in_conns[pdata->nr_inconns] = out_conn;
+	pdata->nr_inconns++;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(coresight_add_in_conn);

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-fix-ref-count-issue-7c44ce39700f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


