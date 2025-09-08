Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F3ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gvfc1Iz0nE71iFyrDfLCzdho+9INvh3b39JFa+yZSCg=; b=jYRXdnS5nCw8tAQyMZ438JBHJ/
	zPk93Eo9t0kSydIKy6gSc/c6v979+BYPvfVtxFhrumTOBs6FcneIgryAAOdLRMqboZ2IJumag9Y1t
	3tdk/VvOW1CgWoR1f/fQI8bHy48OThaJ6xi4S2WnNDSsy+aWLbAoxjhmf59GRje+tpbsp/tKme03m
	n7YBz3mRBTLX3gLhsxUwTO+zR4LV1CAbkLI+d3S4P3KTgBNlLtOJRtcNiPlcas2QinkirS0Pz+2hH
	vEK2h7PKJgF4U115d7nV8kU4Y1dMcSrxhTNAVmJ6I5yz2CaUZT2dJn/zP2+WZAGt5/US4DjGmPhVf
	5EHv/ZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvles-000000033Qx-1RKB;
	Mon, 08 Sep 2025 23:52:26 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgEF-00000001Ocl-3qKT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:04:38 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Hg5FR018214;
	Mon, 8 Sep 2025 18:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Gvfc1Iz0nE71iFyrDfLCzdho+9INv
	h3b39JFa+yZSCg=; b=HmlB72x3mAG2OTF+mpFYTPWxWJAedUblKs0adiSA/9+FV
	Eq032MZm7ZQHamSMLi2+11tSrTARtNIZ73cZBGGreh9CjWQajTVommebx+Ts4zyB
	4Z2x2KtFPAkYBp6jMGux8zfFFncWMBSAvWXS90r+vovBjYPDSHg9sl5B9YSlAkIK
	8NgY5Hmi1Eai9C/0tdHj0IXLkevpLlyoqjK8/+oR8W1w/nwqturpMeyD93ti5R3X
	jhx3iHpmZ55ZRX3LoKuYBAckanzmNQUS//DTRLIScxcEiD2uBRpmL9gsI6jb2UUj
	kKzM9mf5gFSrZ1u3xoAh5mfxT4vUgo++MN5Ps4J6Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4921pe8bd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Sep 2025 18:04:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 588GfmaV030651;
	Mon, 8 Sep 2025 18:04:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 490bd8hetg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Sep 2025 18:04:17 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 588I4GZh026431;
	Mon, 8 Sep 2025 18:04:16 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 490bd8hesq-1;
	Mon, 08 Sep 2025 18:04:16 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: julien.thierry@arm.com, marc.zyngier@arm.com, jintack@cs.columbia.edu,
        christoffer.dall@arm.com, maz@kernel.org, oliver.upton@linux.dev,
        joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: vgic: fix incorrect spinlock API usage
Date: Mon,  8 Sep 2025 11:04:11 -0700
Message-ID: <20250908180413.3655546-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509080179
X-Proofpoint-GUID: FW9NxWmtgJYneDA1syrnrDHum9ilFNl9
X-Proofpoint-ORIG-GUID: FW9NxWmtgJYneDA1syrnrDHum9ilFNl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1MiBTYWx0ZWRfX1vkUAsbAZHAR
 8uD8FsEVyUc+aywSroPjXmMDYlWgwX+nmT1PWjNI9flpbQwmsYceTrUOKMbFjHBXPPe7eymXY/M
 0ucDTo42rK3jwhpXEXy7fPq/mg/13FWT0/GM1oZiFGGuIqGG0GvL7N84moIL7MwqgrCkYnUPy6Y
 /HY2TrMFnsFhSf6kZXD5RvkS0qEO/iB1HVo2w4O4XxqBMdqz/OTmn0TSjtYykT4ZoIRyfZY8NXc
 AQSlTIlTOaM+WPRLdph7xPQbEy772cXsWat9O+yHea1mkC4DVJDKxvBZz3Bw/Gq5YmO/6M7Cf+W
 rrY0s5eAtxbzjX9Msn4+JvW6NLRPSN5SH+CxVuIucGa9E7imICW3pwUvvoIDZH6kM1U0oCtti9m
 0OtVFDre
X-Authority-Analysis: v=2.4 cv=b9Oy4sGx c=1 sm=1 tr=0 ts=68bf1aa1 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=gWKObWcHZHFoBn1Bvp0A:9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_110436_200170_49C9BAA0 
X-CRM114-Status: GOOD (  14.31  )
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

The function vgic_flush_lr_state() is calling _raw_spin_unlock()
instead of the proper raw_spin_unlock().

_raw_spin_unlock() is an internal low-level API and should not
be used directly; using raw_spin_unlock() ensures proper locking
semantics in the vgic code.

Fixes: 8fa3adb8c6be ("KVM: arm/arm64: vgic: Make vgic_irq->irq_lock a raw_spinlock")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Acked-by: Marc Zyngier <maz@kernel.org>
---
v1 -> v2
Dropped extra paragraph and added Acked-by Marc
---
 arch/arm64/kvm/vgic/vgic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index f5148b38120a..c74d6120a12c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -818,7 +818,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 		 * the AP list has been sorted already.
 		 */
 		if (multi_sgi && irq->priority > prio) {
-			_raw_spin_unlock(&irq->irq_lock);
+			raw_spin_unlock(&irq->irq_lock);
 			break;
 		}
 
-- 
2.50.1


