Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16165C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1GxsOSHaEZ3WauZ1cTkJRldsvonqkn4VH/52jeaGUm4=; b=wA1XKd63Jas0BaaBXYCptkekGE
	Tiex6Bu0SBqgllwA9cQnvmXdyVq+RZ/aKUft9V79NVmsyrc7/W3ui5OnDQUd/Q2cvpYZjS3KM07eN
	xGx8wSGbYrnfBRyYbyKoYcR6Izdwvp9sk7tJVZnGTF5xLt0eVfym16yBbmPJb/0/DjDkx7uV5aCJl
	gnnARSp0DeDV55c6yaKIYoVnU7bKQxY8pT1AV7USY+iPPknAmqBtUuw77o0IKu7nOpQS8DH3NhyKV
	hatDWHh6dp3VN+5vU7ca3IkibBBlFIxCCkoN73zYXQUjU4GpN4dxFVMovUmpzwlqSRHzMuTZjNXSm
	jDxf2n5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNtA-00000003n5p-0MsC;
	Fri, 09 May 2025 13:35:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN02-00000003c4Z-0rde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:38:47 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5494BvKT017144;
	Fri, 9 May 2025 12:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=1GxsOSHaEZ3WauZ1cTkJRldsvonqkn4VH/52jeaGU
	m4=; b=Z7WWvaY4g6eCXiYUiUlKyClENxdQjuQkp9700lVVUOkAkssBbj096LEru
	GjOG+tquLK40lDeyNh3vMAWmYfddtqfUhqj6yhS6rF/stF6URVRpIBeferkYor0y
	JiYuQwAvyf3xk5tSwvxjxkP9i2BAzvfjMV7lOP3VcCPlkXHnmnl7Nl5tvtnR8SCI
	QLzVOcLBlNtJeZu7jfyZEu4yZkWVeQGgiX+XaFyeRZEeh+qoJMQSTGuh0QxvJUMs
	2lCUqUNr4KgMoWza0dhiUloHAqh4/zj3api+8zV31DzvNqPbpXmVGuy3LUy/Pw8X
	NEYSnzligZH6q8pgIt/r8Nvbh6isw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h46kusy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 12:38:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549CLItO014654;
	Fri, 9 May 2025 12:38:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h46kusy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 12:38:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6iZa004650;
	Fri, 9 May 2025 12:38:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46fjb2fy1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 12:38:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 549CcAws39322032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 12:38:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88F75200E6;
	Fri,  9 May 2025 12:38:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EFA7200E4;
	Fri,  9 May 2025 12:38:05 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.107.211])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 May 2025 12:38:05 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-next@vger.kernel.org
Cc: hbathini@linux.ibm.com, maddy@linux.ibm.com, venkat88@linux.ibm.com,
        daniel@iogearbox.net, mykolal@fb.com, yoong.siang.song@intel.com,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, shuah@kernel.org
Subject: [PATCH] selftests/bpf: Fix bpf selftest build warning
Date: Fri,  9 May 2025 18:08:02 +0530
Message-ID: <20250509123802.695574-1-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=LaM86ifi c=1 sm=1 tr=0 ts=681df738 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=rV7urDwo7b39epbSBP8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX98i5fCsNXz65 vEK61wvfV2yQXLF/PG5XhanzoMmpVJUPXj4/McsweqYJxpVwcEBk6gzFfPWdzMji1adaZ/yNs/i k9ah1V554nsBjL1dh429MK5eBC6qdvSWeN2zp6pe9JGdR4kFtkm/I13sjxjummNxKl4hzv4Hqcu
 9hmpNGk3wR5PZsE5K6Dp0TM8dkIxA/VTewFnzH9bdLG9qYP6JKYW6ZLbZ16BNZSWwahr4SEWP8j 71r+R6Kqm9j21WYIIKqmbV/UrP1HLhdiN/NWXb3OscsCeKEK5hYW2IQx5KOLTaICu5XvveBYRX1 XQfoFWIngz5yQD5diwQAlnBvwjcBwpRvS/4Nri9klJ+ix93TOM+cz+IJyngNyISISD6QAEiGf26
 RjPl6+OFBjjkz2303QBaxkyTH6iM6syy8GqREPTmUnxHYcJq+dw1ncLeNlawKqJ4AypLV0/C
X-Proofpoint-ORIG-GUID: cOPeE_N3CccJrHFznoIfflPq4YPJqSuH
X-Proofpoint-GUID: K-YC-2hFpvEpO7YRJnr9fxDNdKaIviEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 mlxlogscore=703 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_053846_253720_0998AFB0 
X-CRM114-Status: GOOD (  13.42  )
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

On linux-next, build for bpf selftest displays a warning:

Warning: Kernel ABI header at 'tools/include/uapi/linux/if_xdp.h'
differs from latest version at 'include/uapi/linux/if_xdp.h'.

Commit 8066e388be48 ("net: add UAPI to the header guard in various network headers")
changed the header guard from _LINUX_IF_XDP_H to _UAPI_LINUX_IF_XDP_H
in include/uapi/linux/if_xdp.h.

To resolve the warning, update tools/include/uapi/linux/if_xdp.h
to align with the changes in include/uapi/linux/if_xdp.h

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/c2bc466d-dff2-4d0d-a797-9af7f676c065@linux.ibm.com/
Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 tools/include/uapi/linux/if_xdp.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/uapi/linux/if_xdp.h b/tools/include/uapi/linux/if_xdp.h
index 42869770776e..44f2bb93e7e6 100644
--- a/tools/include/uapi/linux/if_xdp.h
+++ b/tools/include/uapi/linux/if_xdp.h
@@ -7,8 +7,8 @@
  *	      Magnus Karlsson <magnus.karlsson@intel.com>
  */
 
-#ifndef _LINUX_IF_XDP_H
-#define _LINUX_IF_XDP_H
+#ifndef _UAPI_LINUX_IF_XDP_H
+#define _UAPI_LINUX_IF_XDP_H
 
 #include <linux/types.h>
 
@@ -180,4 +180,4 @@ struct xdp_desc {
 /* TX packet carries valid metadata. */
 #define XDP_TX_METADATA (1 << 1)
 
-#endif /* _LINUX_IF_XDP_H */
+#endif /* _UAPI_LINUX_IF_XDP_H */
-- 
2.43.5


