Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A1CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Wx74CcjZN2KpLzFAPrGCL0wBHdALz/M9ECkC+f9nFw=; b=4Hf9aOIMD1DwebCeN+iObhxfeC
	/s5baBXAyeUvDQutTuoWA6rWhcZV+9z/GfmQmTaUCehEg6HzJTXVxTTxHJdP9EnfDcPnhbR/9fMv3
	QWMA90l01/pxb00D2Yj5GcoIXe3chC7aJ9rI/1GeVL3Zlh85GHZ2Y2bD8PfUTKuI80ozhACevhdX2
	AtNFwi/EBcs4HwbXWOHab7Ez+EtcM7NhNtcHTWA5ortNvFL25cLi1Jd5dziejuSZbo60uw9GEk3NH
	H/8ank0dPCuwexRrUCUSDyvgcmh7vtA0ZEr8+M4zU7Q9px9F0/6FB9VlqkjA00qSgxpnLyukAeGw9
	JW5KWU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zbI-0000000ClTU-1jA4;
	Fri, 25 Sep 2026 06:40:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zbE-0000000ClSs-1u0I
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Sep 2026 06:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8Wx74CcjZN2KpLzFAPrGCL0wBHdALz/M9ECkC+f9nFw=; b=MAufHtVsoj6duAeiSPmf3LKVd+
	m1FUd6ZcE9ZxHo5DCzzXks2L8mMPtO6cRkIHuXFA+WoDPdLGLYUqxDtT0PjC2mLvkTsPBwR3zDlbL
	btVueUiqqAKdfm0pgbNUKdRBZ2DIarMe4N7h1K6gsPXXTGUROqv/HeOAZNgQ1o0z1X0OmqcsaPGHd
	N5hrfYQh/NPvd+a1bS4AieBHxgGLYY41bT6kQ0ddy8Gg6BDqO8j6JIlUOrK4nCiZGTxnmEO5kukyX
	Byai7QVuH74LuRRdvYFo1CCLHxzCkvM3rNql1wzj+LZndPYlmRZC5isHoRs09DgncAY/2H9oLcwlW
	fmnExmPg==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9zb9-0000000GemS-0QpG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 06:39:59 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OLMsG63847423;
	Fri, 25 Sep 2026 06:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=8Wx74CcjZN2KpLzFAPrGCL0wBHdAL
	z/M9ECkC+f9nFw=; b=nUa5SS5TRMPNKD4rFZtDSqIinJhsGrNrwioh5MGQBw1GL
	sHj78NFoIT9IFp8K8dbe9RogaWgfaXbuHZjSIbhGpnlVllDSwXQgrPioxpK60P6k
	VNmW/Q2LEKhpa5rw5jpKPo3b1Oews1wnJRpERDdvOp/Ow9GbIidm9wgE9rRDGq5y
	IIMtAzeQjK9ex7zhzS3tQwy/dOQv9/Vx5H1eyMBnBsUWBAkcfWWPtYtGvivFJd7/
	qGuV+mzXPFRqHBe3NWjSOS7inp6wm4XkEvZJPUg0002qcbGRDqv//GkvgViMPOBa
	cvpwD77QGAPMe42oKA35d2ipqm4XH6geJhnz89bJw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsjxb8xc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 06:39:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68P6Yq7L023634;
	Fri, 25 Sep 2026 06:39:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gtegpxu13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 06:39:43 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68P6dgLM036692;
	Fri, 25 Sep 2026 06:39:42 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4gtegpxu0a-1;
	Fri, 25 Sep 2026 06:39:42 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        harshit.m.mogalapalli@oracle.com
Subject: [PATCH] net: microchip: vcap: stop scanning after deleting key field
Date: Thu, 24 Sep 2026 23:39:36 -0700
Message-ID: <20260925063937.963430-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609250026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNiBTYWx0ZWRfX75AOeZb2Rkov
 W4XinyGdG2OydliU3JylfdNGIAMNNE00n51FPootjAO5/wyElKh/UbE4yFoMSp0JnYWReA5489I
 AVn2ri1JglkoicToQv1BUAJWV+ooLvrPmlp2zCj5BJjZol2ZfEgV5YSIGaOe7H3hXS+A70MZnEF
 u3pwvwqyimTp7LTUxYcRZ+3jFP3QytyPFMfZG2XIaFG0JYBpGiu07scclTuB9QOA8ZGWQxzoulB
 D8kJYFqVGJuc5kNwY5ZgIUZ4Nw6dYSKxKDGS7/fgkcKM7jNIfKospFwCbwUi4z4B0JXhoWd3yNu
 oFSIn622bCXfgsxgp5bVn8XmEHbMLz1ywdFqhbyHdJ4O31nqlTgACqAREs8IGusmlKM6hAfVlGw
 gfia59Z2TglYrcmbY8mbdFg0h1hjkZhYA1EQEDSaWLSCV7wE7TCbDqmOD9pAB50bZjPGxJVGgd6
 hy4TWi6OTx5NzXsTgWw==
X-Proofpoint-ORIG-GUID: H3bv3TOXvrw2tKZOqmCs9849OdC1-jvv
X-Authority-Analysis: v=2.4 cv=UINIjyfy c=1 sm=1 tr=0 ts=6ab6172f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8
 a=uVw-QqTyBSQbbWnki_UA:9
X-Proofpoint-GUID: H3bv3TOXvrw2tKZOqmCs9849OdC1-jvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNiBTYWx0ZWRfX40ygXbz5QkSY
 3fM645nqsrGRdY5a2IztYiU4rfgTZdGZkvnwSXZSSdtlcDWSGtC8f2DvXnLJ2CQQyOGVN1Grlef
 Wz0vOgR1VfjbgLxcpO4NJK2PLb0LyAT2B9br/72NOD/cw66PolZa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_073956_132138_7EDBFD30 
X-CRM114-Status: GOOD (  15.73  )
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

The only call outside the KUnit tests is in
sparx5_tc_add_rule_copy(), which passes a fixed key list with no
duplicate entries. Therefore, the potential double-free is not
currently reachable in tree.

However, vcap_filter_rule_keys() is exported and does not require its
key list entries to be unique. If a future or external caller supplies
the same key at another position that the inner loop visits, it calls
list_del() and kfree() a second time on the freed field, leading to a
potential double-free.

Break the inner loop after removing a matching field. The outer safe
list traversal continues to process the remaining rule fields.

Fixes: 465a38a269e9 ("net: microchip: sparx5: Support for copying and modifying rules in the API")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/ahs-lCAXXikkaHky@stanley.mountain/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/net/ethernet/microchip/vcap/vcap_api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
index 788c0728d763..0f8d98f2094d 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -3527,8 +3527,8 @@ int vcap_filter_rule_keys(struct vcap_rule *rule,
 				if (key == keylist[idx]) {
 					list_del(&ckf->ctrl.list);
 					kfree(ckf);
-					idx++;
 					err = 0;
+					break;
 				}
 		}
 	}
-- 
2.52.0


