Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59055C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fR6bV/VWNkt0/i7Ae/A56SWMRQM5Q06PfZHqyQgKWJk=; b=3K1Q7AaHKiZ48W8X+KN2VCTh/o
	M7kzy4y0IDtJkAYdsvN7QMli83JUtsKeYIRTI48kAX1UZIoJNdYZS2DjyDcPhzUQLxNrewLF2S4jk
	BZGVE2dSDYH+hwhu2WO7UwyYHi+sEhQuXMHs7oG3W/ntQ12sv37zFFzys2SyeMzZGYAaaO7W9OiCF
	heHx9wpbcX3lYcxHvhlKwM7+uhQfNf+lDEcVogPj7czHe+4omXn58gpfNv6XQG8UVHZ7dWlqsFcl0
	6i6EHRVH6k+MT7sKl8KUsdXsJ08RHL+QYf0RNeuIDks0sLxCj/rDez4I0rWhwAicSYYtVtkoByfW6
	t/q/oWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKwM-00000003GbR-33dS;
	Fri, 09 May 2025 10:26:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJzs-000000036ZR-2Ha8;
	Fri, 09 May 2025 09:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fR6bV/VWNkt0/i7Ae/A56SWMRQM5Q06PfZHqyQgKWJk=; b=CUz9QRq7rZHtMAuDu79WCPeQRz
	HuKpQHEYp5cy/VAQpl+jQ3rOV8ufyzpV8jo2iLGOvIWmKwFmAGqYQMSt4sOUh6AQPbRbFSbdeLwCv
	fOA5l3WgCkqUVX69ZDlqrsajRSveZL9StyDVxWFNLadF0xwtzA/GXeEN54kq5A//tK9LRmaIhLJxT
	VykDsBnzSIRE472V8JI3vA4sc4Av1fi9waeItcUjBp86UjlfaMssy/MYuQD65ZP7X1o5FMY4SgPx6
	0gu7RNKEw8CABfHqcjTSkRoFBNhKtsHfchSmwVWtxsHBPKaTnlZCwI6GEOSKnvcclhu/s0ADLca8k
	77QaHLWQ==;
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDJzo-0000000GFQ8-1qoP;
	Fri, 09 May 2025 09:26:23 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497o2Ag016013;
	Fri, 9 May 2025 02:26:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 09 May 2025 02:26:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 02:26:07 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 02:26:04 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <jianqi.ren.cn@windriver.com>, <fullwaywang@outlook.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.10.y] media: mtk-vcodec: potential null pointer deference in SCP
Date: Fri, 9 May 2025 17:26:03 +0800
Message-ID: <20250509092603.3242559-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SVL48-DeQqXfjwk7dSMV-d8Ty7ppsiPb
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681dca32 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=t7CeM3EgAAAA:8 a=7f2alXSBUxmpNkzq_swA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SVL48-DeQqXfjwk7dSMV-d8Ty7ppsiPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5MCBTYWx0ZWRfX3BlONRt2NrMi rmvT9B9ItQ+WklX4O2Ah1qepzPf6Wn5w1eZPcPeGF9gu+SKZwjvHbRw9miLvmT6DMIzr6EtCQIQ Te+Q+dgJxCtAwxi8oQ8HdoOj8KT/l5OrCDEbbPVtPLc+7Gk0R7WyRaSc3JMBErxJ7dnZCtPdK4D
 wzDQQS3EYcNLZbLJ00GPVkcWf/NkBRLVXyX7WrERAK8yc3CAVfT7gpKh3IoprC0zkRVC4fRAEwk ESQDc6gO2B3X3bYZ4tyHgp2cVPVK3JYPeiyMOxq1umkWrSx+lyEwhBtbGH+zHivAYcQ03njaeSZ xc5m5nFIyiyX7oyEq2UgE4feopTUJevIjlT+oQR4clnMULo7ktQWMFJ25eFsF+Wq6G6pay98AiQ
 vBSGMw7MVX8dL7T5ajlODhPDEfYzM0sZtRgziUBQb+HZce0Y9W7zGbvsT4bg+EFZ/dWfLI5X
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_102621_005882_86B4DD3B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 53dbe08504442dc7ba4865c09b3bbf5fe849681b ]

The return value of devm_kzalloc() needs to be checked to avoid
NULL pointer deference. This is similar to CVE-2022-3113.

Link: https://lore.kernel.org/linux-media/PH7PR20MB5925094DAE3FD750C7E39E01BF712@PH7PR20MB5925.namprd20.prod.outlook.com
Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
[Minor conflict resolved due to code context change.]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..27f08b1d34d1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.34.1


