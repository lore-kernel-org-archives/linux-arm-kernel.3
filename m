Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A4FE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VPbve42Bf8LimdQzeq1ZWPI3gdwo0etuxFyjQzOpS5E=; b=CBIWZZK9se9d7F
	iDQuFB8pJEfHc4/l+7cmmoIU88OTIR3j8e4eZweW1OIkvkUHN8byJ87uKZx3EQKBA/0ZE0Tiuf8OS
	cakpj826cejBrU/twwRy6YuW1SHu3Ti6RLqIxVl7GfhPuDiepEYbk6m00AxX0oNqdPoPW2R8GQWXo
	XM6pvAZtlBGZSS/XoxJoi8k3to1ihofKNiebTr7AWiA4QE4maqvqdo4ZW8CRgL93Frj0zxP8E/s+J
	gNAv6x0F4fGVAvb76eTmlvZ/0qZ5OY9N5wqBj+3xW1lZ4K0GmJWICIoHrMk0xeHxdbU4cw3IAVEYD
	SW3LYgX9PVxuJB3zjKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLK-0000000ErWx-0mSP;
	Tue, 23 Dec 2025 10:10:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLI-0000000ErWb-1DCB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:10:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA7j1X1528928
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VPbve42Bf8LimdQzeq1ZWP
	I3gdwo0etuxFyjQzOpS5E=; b=oB22DxAap7oCYo1MXZlhNkwZpW9L3xHafwY1p7
	i+VuFjSv2Oo0u6UhLheZqmMMlrqyXLcZSVzry2ihMhUbSKtUNt0LO9n09UYrno+2
	61QicxBuMdkzdFJF0jAwue7CWo4NdTZ/Fwex+RxFzgnoRMZedjGbsCDnMaX6aXeq
	K0FozVp1ESBd43qrjR8nniRgyEiRNVX2Qgc5pfC3XFzO6XpQhonXaIi2hrMuItLS
	SDAL/N+hYMNcEqvN0NZJK0D4LIU8b8z1A0BUcmysZMXTAsjOKgxx0U6TwgNOsurO
	DZjSLcaah2mBbOYmb9zG98+yA+hzyMOeR+ZWeA6fojv1jQeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3h4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a089575ab3so64226575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484611; x=1767089411; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPbve42Bf8LimdQzeq1ZWPI3gdwo0etuxFyjQzOpS5E=;
        b=eYJfm2jT/dxoWSl4GYNrknI8ej3AZ0GRFA3C1vo5V0C7z9VG5iqG4YoLXxlYlPRWRh
         N8GquFYGeQKZkxCDgZzUmIMWj/MgYG11GeB6W9JSghl8O3vkV9nTtKN3tJMhFdy6wdby
         gBDVEYZeXvRodLRWbGdW6dKw/oCtenWgMgmHzsrhYwt38V7O0eM/OoLKmPhS77+j8ldk
         5JMcRNGLKWyaHWviAKBcDPy0i6wGPSEJmTJRBT5FX918OPQKCLX+XAFmq6yaN/2dt2Dx
         5VTnUIEVo47/lcoIJRyozatubcmbrFKL6eiKN2jKWi9cYQ3lehZ1Zy2gu/ixMZpjqeV5
         MDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484611; x=1767089411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPbve42Bf8LimdQzeq1ZWPI3gdwo0etuxFyjQzOpS5E=;
        b=XOV+9jNIoMCvdUQIUndaWCYu6i4ONqaGKAzcyW+EyczMSqtCoKn8Wjo4UcPl258BVT
         tBASzCCY54+7qULetbKwuvMCDEIAOK4PVApxPuIR91SVwTFMnf0uEcHySSTMTrJCROWm
         y8aZ3fvkBAvs7jN+/lqhG3Tq5m/0KCB27UHnHOkx2Cmy3sQyRc80HMbibDW94gFpcDkD
         AzweXU9EfkYQohqmZYvcoKTMHwNiYR4kDbjLiLSY+LBRPxKLGENwJSOOKF2r4qd495Q4
         lbwDK0mqfAzdY+5OpdqCV9kc4kr+8xfqfiA1dGGVI4eFNNsX53KFBb5WtmS45v26EjkB
         gPcg==
X-Forwarded-Encrypted: i=1; AJvYcCWCTCbxbzYiDRbMgTNs1Z5Z5A5zJxJvBQygZx/DxFVA2hhCOJ2Bmm8kes4d1UIGBrzwcQwVEAahVIWOJgfvGk+V@lists.infradead.org
X-Gm-Message-State: AOJu0YxFY036Spg3QFNFWwZfhrY5cQ1qqT6vTiUNlEkTRiO4p1zYGRbE
	nYtTgoKTN9p2x0nkZv8WJ6ZQhlvvoGT/H5K4pR6/PcuW5asUEWiZlscunvy9d8/jFuP+iDh32Lq
	yIbE5uz2O683So816ymx+5BdqmyuSJwMoKJrBTbwxg5MOPJz/nV80NzatPcgE64xAS11utGA+bx
	jjlg==
X-Gm-Gg: AY/fxX7Q1QJ+Zz3EXx6wQT1J38Aq+A8roN64vhBjitgW/HGuEtwlPoVF4BI4A/w3uAI
	Ml/5D35gYUkC/ChpL5EYHhwOC8ytYnL+6wdbnFGeXfEhVb6Q0aNfAfK84XQ3PydVTizT5LHeJdj
	I/wRoI4H2CUgKu6ZjqFujAcBeG64zeJ6x0nznhul1278eam++9oZ8tPbjjFwlU6K5hywH9qMvoj
	DT3YYBXUtfoEWuJtlNy62+7ECVUs957JL65acrzehwxfSkITGMmJ8cMxAzWsWVEcLdmlV7/55a0
	blyUHwlP8tTc7Z6loePkpN1hRZMriA3nk7Pn2PG6vWYnfWMI0orF1FxPpDrVzfFwpTmBGLuK8hi
	Llk3xbAHPH3KsOdI6L+Mb9goqg9gNoHkNH0QwOfzWceeU1b3Eb/c1BM3SGk+UGHeiNDlrzSrD
X-Received: by 2002:a17:903:22c3:b0:2a0:d05c:7dde with SMTP id d9443c01a7336-2a2f283b5e4mr118563735ad.44.1766484610776;
        Tue, 23 Dec 2025 02:10:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmnjxNQ3arve3oVbPpPb6Mpz9P89OZWKxzkiS57utkL1Qt3ErmdtlpV/WNquJuVvbbrd7rXw==
X-Received: by 2002:a17:903:22c3:b0:2a0:d05c:7dde with SMTP id d9443c01a7336-2a2f283b5e4mr118563435ad.44.1766484610243;
        Tue, 23 Dec 2025 02:10:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm120824625ad.2.2025.12.23.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:10:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v8 0/4] add sysfs nodes to configure TPDA's registers
Date: Tue, 23 Dec 2025 18:09:49 +0800
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5qSmkC/5XNTWrDMBAF4KsEraugf9ld9R6lCEUzSgSNlWoc0
 xB89ypZZdFCuhl4w+N7V0bYChJ73VxZw6VQqVMPw8uGpUOc9sgL9MyUUFYqOfIIEOhCmcJUASn
 MNaQ65bI/NwzzCSLP1jjtenuQnnXn1DCX7/vG+0fPh0JzbZf75GJv3//oi+WCpzhqgIwjaPFWi
 bZf5/iZ6vG47YfdRhb3ACv1DOw6vFNeGg3GpsH9AftHWD8D+w7DzqAbpBDGp1/gdV1/ACuGEI+
 LAQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766484606; l=2918;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=23cirYS6Wj4CSKtud71AAdAxaZZ2NaIaqA0UhdrDX1Y=;
 b=4MNbGqt55eN89Z5/vGZ5s/svseAT1Z4aUIu6ReuqjhSF7AXeU7i2hGnzmGtnR2aCQxI0iDtLY
 ewPqqPMFZE1D95cpefrjc/bp94Gy2hXfGpBCjb1UqKHSawkvjkNfapd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a6a83 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XEkFclYNQXgSceTWgxkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: q18TX5wgaEVEsxp9b6zQRbQJEAMZcPzS
X-Proofpoint-GUID: q18TX5wgaEVEsxp9b6zQRbQJEAMZcPzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX28JUaccWxiBM
 lkwtS697UZwAWgPA0KJI+VqEwlMHNqLEzT5jZoC9JLlEvhTtcPXPyt0I4Bs4/hqtbLcGL0nS//N
 Bu1Lg+uucG4GTFgUxVXmNnlJ4NuDOgPoDEHZ5a1U//QzqVv75bAigGaXRZiytReBR4T4b/6UB7x
 9fx6oUMVkTeA1nXhfznnurxiQhq4rsCkCVTPKqXJOsqyuXtrkvkepRbPsqK2skCn5euEClYb4Kv
 o/y5r+D0KdDm2l+uPeGZxU+/thB7eKBHTemu59FL6/gcJulJLJqX+Dqo4gpFB3g1L96ZhnIRI55
 5aGUoIUDbFIrNas+jkMfLrk788mkKCcJWLnsS7PszB6gQsC8bUAAGqI+QZFVHFvuMJfSrHI7sZu
 W/VFOEiDeE/HdCd1+0Q4poovb8KANuNuj6VBzTUhBVGa7/Q5sy73I8WKjLzgyeN7yMVDvSNMTpI
 L0HVJPXnfHxVjileWJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021012_362815_E104A541 
X-CRM114-Status: GOOD (  13.45  )
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

Patchset 1 introduces configuration of the global control register with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a sysfs node for triggering global flush for all
ports.

Patchset 3 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 4 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Changes in v8:
1. remove redundant check in pachset 3.
Link to v7: https://lore.kernel.org/r/20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com

Changes in v7:
1. add syncr_count sysfs node.
2. add more detail to describe port_flush_req node.
Link to v6: https://lore.kernel.org/r/20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com

Changes in v6:
1. Create a new patch for introducing gloabl_flush_req sysfs node.
2. Add a syncr_mode sysfs node for TPDA_SYNCR.
3. Remove the redundant attr_grp and consolidate all attributes under tpda_attr_grp.
Link to v5: https://lore.kernel.org/r/20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com

Chnages in V5:
1. Optimizing the solution to creat sysfs nodes.
2. Optimizing the logic for configuring bits of the global control
   register.
Link to V4 - https://lore.kernel.org/all/20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com/

Changes in V4:
1. Document sysfs nodes with correct kernel version and date.
Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. Optimizing codes according to James's comment.
Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (1):
      coresight: tpda: add global_flush_req sysfs node

Tao Zhang (3):
      coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
      coresight: tpda: add logic to configure TPDA_SYNCR register
      coresight: tpda: add sysfs node to flush specific port

 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  69 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 284 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  76 +++++-
 3 files changed, 422 insertions(+), 7 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251219-add_sysfs_nodes_to_configure_tpda-f54636512817

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


