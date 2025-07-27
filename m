Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E594C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JITwHwwC4cc+VUUtN+UwSJstV1cb4SvU5OlXX2YyGAQ=; b=S4hoh2wUQTswHl6mGmNy1Qvx5r
	jubb0VRH/92HgVGcJkVKEt4VBpp/aETqGE+rFxD7XcLlHbujYKLwq/vNmnVHxtjpfeHOtNh8vTad6
	PxK3+rWmMRFvDI2eEerH56t3OiiA8XiLfA2USiT/Wr7OsCffn92sVvcMRfXKPfqa2aI81kGTxgQVW
	v8ezbhgaUyh7/iPsCgOgDXZgt8m0M9QOk+aMZuulBbSX5RRXgRf6iDqWhJnbZn5vB53Qf1lBjAL9Y
	2OIeGSYtWogdfb8PhjNqMsSJiChwETiwGOzJPKFETX5aJLcIcyNSrrIGRb6ToYiDdA+Cy230elbB+
	W+ta7WOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug21z-0000000Clc0-2i7L;
	Sun, 27 Jul 2025 14:07:15 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug1zQ-0000000ClSS-3TvT;
	Sun, 27 Jul 2025 14:04:39 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RBiNvZ015426;
	Sun, 27 Jul 2025 14:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=JITwHwwC4cc+VUUtN+UwSJstV1cb4
	SvU5OlXX2YyGAQ=; b=YtM7sJBF2LGyPgk8WB5zKkRS44nkf+0TuOHEmaH0pOpiP
	X+EKn6+aVOxJCeKibfV/r+m1cX6GCprlzyFLEbnJlwrQEdE92A3cMTNGtDzxk+gv
	ZoTGync9MhZ6q9zSwrCBfPIoqWNhHnSVfhc6AIwTLskCnfJo3N73jZ8asBC0bsF3
	Q/PvHd/YbXc6nCabQBl0a3FNmctutuUTcd1Opsq03Luf804Yw3fRm/3rN9id+GRJ
	A7TyACuHRz3E2Y3jS9MpA78XQqNNfZDCUD/eTxF2pQCMaW2lhGokFma8j05VHUP3
	Mmusw5D7Cy4UJqXtk/zjNWM65YFuK0Tnu50a/W/cg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2dss7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Jul 2025 14:04:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56RCIZlH038511;
	Sun, 27 Jul 2025 14:04:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nf7cycm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Jul 2025 14:04:20 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56RE4KTQ035509;
	Sun, 27 Jul 2025 14:04:20 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 484nf7cyc4-1;
	Sun, 27 Jul 2025 14:04:20 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
        Allan Wang <allan.wang@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>,
        Charles Han <hanchunchao@inspur.com>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] wifi: mt76: mt7925: fix locking in mt7925_change_vif_links()
Date: Sun, 27 Jul 2025 07:04:13 -0700
Message-ID: <20250727140416.1153406-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507270126
X-Proofpoint-GUID: AorprVRinTR-c26oWrX1RvFYmdxKkJx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEyNCBTYWx0ZWRfX8uP/g+uxgkqx
 BewC63GcNLD+7uhitQraW6hBfIEuw+JiN+1tWOWBdJnYqytoHhqws91j+JHdSMjZPYMh9DI5urs
 +BESRN+OIstW3t9Fy6aSMA0wK/ThrtPg0u+6fzwkb1Z5UdUFj8RNe+c7Yb5qtZYFuOPFmXX25Qn
 BuL6kah1YXV90q0Uxjsovoo4KQw+eBp5ZKEMv1Ts2KIe64ep4lHB839Z82cNrEVNtFQFMhJgGao
 zIHroE9KVLJF0ZnYGAJHjcoxVHzz6JmcjtsydBgX9E3yw/TdwN1EgTBkUdcwyjYo6W44ftQ5F3v
 Xu7yo2bKz8y0zlY5r8oLm73DY9m7eueV8zmp8ieLwvQ1CqNiYT2sbJ5d8l9//OlRoify3GMjsJy
 rnyQxfqIKMWEIg2lxQJM8vedQdBkzhu4u/1fKYDn/aVs+OaAeWCh6dr/Yk/HB4Toucrq7TSX
X-Proofpoint-ORIG-GUID: AorprVRinTR-c26oWrX1RvFYmdxKkJx4
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=688631e5 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=yPCof4ZbAAAA:8 a=oq3m51LP4hL1v8Vnt5UA:9 a=cvBusfyB2V15izCimMoJ:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_070437_269429_E44EABE5 
X-CRM114-Status: GOOD (  13.06  )
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

&dev->mt76.mutex lock is taken using mt792x_mutex_acquire(dev) but not
released in one of the error paths, add the unlock to fix it.

Fixes: 5cd0bd815c8a ("wifi: mt76: mt7925: fix NULL deref check in mt7925_change_vif_links")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202503031055.3ZRqxhAl-lkp@intel.com/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis, only compile tested.
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a8d25b7d47d0..103909307518 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2069,8 +2069,10 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 					     GFP_KERNEL);
 			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
 					     GFP_KERNEL);
-			if (!mconf || !mlink)
+			if (!mconf || !mlink) {
+				mt792x_mutex_release(dev);
 				return -ENOMEM;
+			}
 		}
 
 		mconfs[link_id] = mconf;
-- 
2.39.3


