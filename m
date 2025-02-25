Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAB6C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 03:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z5VRiD5JLAcpSx9vHUDMWUCgVwOeSG9sc7D4P5DNZL8=; b=2qakh3LllHiSFKAlDY0MjjUe9v
	mvdB8I2tFbyg9G0TWzHx5JoeylzxQSviLsQmcTn8LVdcKSwH4VUw6H1Vk1UAaOqJbjQ6TlTiCzQM9
	golJEkAFpx+hLFFl+fYHC5REZUBGctxS6v5foff4emA1siocDq5NSk2d6WrAJCtYJ1vvQBJkp3Wms
	s4gTc0Er+PojfRG9mTqrgXJLDYhVUiWWCj64IX01ygmEDB6vQxu+DnMfukrfF+ZpggMxrZBvrUx1j
	45WBMTzPYKkJIlQug+eB6NehlpOAbyBvnGCwNPgFZ4WEju/DpWY6NUcrLSX/JiCommZE1FiCofTvl
	WWdtoShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlLD-0000000FqYy-23cx;
	Tue, 25 Feb 2025 03:10:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlJi-0000000FqO7-1n0n;
	Tue, 25 Feb 2025 03:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=z5VRiD5JLAcpSx9vHUDMWUCgVwOeSG9sc7D4P5DNZL8=; b=U4Ra2WvNI7Dtg7AJ2KC8f0UFUj
	biKVVVXBTt0Ckly2oXB8LBPPSEO/I1WVLyXxkzazNL5AL9kk8AQPBL/eoTlpMQ8K1LOT4lMIeo4fL
	qXGa1WxNoPYDPoOfNbCvtkFXF49brNI0qFTPz9um+phzbU3daI7Y+Z0WD4somIt2+nKA33SXTpYRI
	PhKAKj90/ajwHCXpMLk5YnIII7ZcW7GLZMWo7Do2vXmxMctgppmtuGdZRKE4OCVMhQFA166aOSssJ
	zFJBj+l+SpPsqd5tt/97BBTSCYzmZ/1YbBfZAgDg3EIak/406KHPZKXc92Fm5l0h2fzvfyjiA3Ev2
	JsLOXTmw==;
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlJd-00000003Hf4-40H4;
	Tue, 25 Feb 2025 03:09:05 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P2DuUF002099;
	Mon, 24 Feb 2025 19:08:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yar7juc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 24 Feb 2025 19:08:52 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 24 Feb 2025 19:08:51 -0800
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 24 Feb 2025 19:08:48 -0800
From: <jianqi.ren.cn@windriver.com>
To: <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <mchehab@kernel.org>, <fullwaywang@outlook.com>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <yunfei.dong@mediatek.com>, <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 6.1.y] media: mtk-vcodec: potential null pointer deference in SCP
Date: Tue, 25 Feb 2025 11:08:47 +0800
Message-ID: <20250225030847.3829454-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jbfNddqTegbxnga7WbzmBe77Awe98qSA
X-Authority-Analysis: v=2.4 cv=Be0i0qt2 c=1 sm=1 tr=0 ts=67bd3444 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=t7CeM3EgAAAA:8 a=7f2alXSBUxmpNkzq_swA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jbfNddqTegbxnga7WbzmBe77Awe98qSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_12,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_030902_681488_A907F82F 
X-CRM114-Status: GOOD (  10.12  )
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
[ To fix CVE-2024-40973, change the file path from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c and minor conflict resolution ]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test.
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..27f08b1d34d1 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


