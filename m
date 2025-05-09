Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABF7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BIWzfxgWixiWNzTzbbOf2zuEQuUDcbIqjDgQNNpK+VQ=; b=oXLjDfwmvLfUlgGgQ0pNcefJLB
	3teOYKqerFuJTSvlzIxs6sNMUDfAO+B2tsxJZbf046K5zF6VsmYCxkZvzQJj8R9kre5FDbiWMSdxZ
	vkDdSRubUYTVqTXKKwBZhJOTDfCVpn+fwvz8aGE130/YXmUsI1EJESuk4GHYjtoKbMKx+4YiYNn2r
	RndPxuWWnGBlEh6gqE2I3qLa5I8mtbaoyfjxw2REuXnYb5MZI1LtbqVi+W7O6ByKodA97fstGyYO/
	CLFg1S1mTgHq0UFpTwaEVTCOM9886cQAeqfrDeTEN9vZOcitqZ6IbVur251JxnLyucJV+KfeSCw4t
	QH5e4MTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOWp-00000003uyq-1IdE;
	Fri, 09 May 2025 14:16:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMmK-00000003Zx5-0tM6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 12:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BIWzfxgWixiWNzTzbbOf2zuEQuUDcbIqjDgQNNpK+VQ=; b=mF/uvMSICg6+sZ+cW1SHDq9GTY
	vgms54KQmbSP0G3b9UGnWZlAGwp70xeYlcCHKCRu+JsUGnJpi+/VwBGTIF8yYxgmAuZn+818L5Civ
	FELip0U7Vz3Fz+MCDWvzZCxR5+5lF5geLyFvCEHO4VOlvWxqe6Iqucec5x/0LeXhcgrRy9DAWHXPP
	9jFWc6bCL5mvCu5OVtfk05+jt0DdWhzSiLX4/DGIxtVF+9Y2p2vZUWxYnw2M1f1N7jdki6I9cAg7x
	j71jCdI4Dq6CjFgA51qXbahNG/aHGC3NTj8aX2GajUuVBzOT3g38TjF/ZRk+buNJoO9I785OUijjG
	Fte4r9xA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDMmG-0000000GGbU-0QZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:24:35 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5494Bwcx029454;
	Fri, 9 May 2025 12:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=BIWzfxgWixiWNzTzbbOf2zuEQuUDcbIqjDgQNNpK+
	VQ=; b=amXmW6E4eMCuwJxWMOUI7XURM4xDKTx0o4nd6jfRW+UKXHEZh+noqZBB0
	v6uzBXx9sqpaKwhdKlHpoAQVRzN+bqOMCjJVQJnhHQXprwC2IzpUHXaUmEY31MLZ
	Ekts88oAoiwvtajHQKXJSQiigbmn+EuhywZjmohiiq3Hfkc/d8K479cmhKtEWib+
	g9sG0b69LYNLdsr6H85g7hUpWa0o8cc43F2huk3HQNM5IVBXNNQ1iXbKkMrLYCnp
	Z1kHJLjK4BE9iw7juJKE+X9DB30UYemRWZIHYB6H46ILDhZaAlLl/XqRQ8YE0hGw
	XzxvF398V7yEgnD2B+4SsxFL/wIPQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h6k0k745-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 12:24:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549CO2h0027104;
	Fri, 9 May 2025 12:24:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h6k0k743-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 12:24:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 549AFS7L013861;
	Fri, 9 May 2025 12:24:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e062tx06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 12:24:01 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 549CNvgx33555104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 12:23:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E09A2009B;
	Fri,  9 May 2025 12:23:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA26120099;
	Fri,  9 May 2025 12:23:51 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.107.211])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 May 2025 12:23:51 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-next@vger.kernel.org
Cc: ast@kernel.org, hbathini@linux.ibm.com, maddy@linux.ibm.com,
        andrii@kernel.org, daniel@iogearbox.net, mykolal@fb.com,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, shuah@kernel.org
Subject: [PATCH] selftests/bpf: Fix bpf selftest build error
Date: Fri,  9 May 2025 17:53:48 +0530
Message-ID: <20250509122348.649064-1-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i5SEaNzYtik8Y7JXup7kYmp9eCCzylWM
X-Proofpoint-ORIG-GUID: b_ML1_eoJUq3_Toq-K4bzpjQu5N0dnqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExOCBTYWx0ZWRfX0ffVYNaLjUR4 ELARAE7ViwMsTSdlETP+ZMrMWO1v8K/aJT4JUhLJwWe4ja7fSeu2C48q+t2X+vu7ZnademuQrAo UXRh/Ma8UthKWI+ZeWa365a7a73o3D1xVUVRl2yW9775b1oJ/gc64UQkEm6CQgfs3bj492CUgcO
 OWisNVxz+gKsG/v7AJ2phqIAR7UZS6JqRXaPay7vJchxmgBfv3juhbjx/nUazgZBdMJGOpUe4L9 E95zqFGoyYkcKZKD8WVtkgSErf+n6GS4mYyT7AOcviw+k6jqHFDkDTarbVdNs5aH+I4aVhNXl34 9ju68rjmvWOz/cRxYignETqHB+p0Q+5nsFEXDFkBcGbb6ef3G1CjnuCu4mW+QK2pGfT5sYoi1uH
 ZvsZr/4jIj0n16ckWGlu1iJXfGlFiaFT69yuS4VcTDicFXYx68NLf9MrMi3IhEYAQ+6w/z54
X-Authority-Analysis: v=2.4 cv=OcCYDgTY c=1 sm=1 tr=0 ts=681df3e2 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=jh_1Je4BJys6wSEZv6QA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=800 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_132432_777449_C8F078FB 
X-CRM114-Status: GOOD (  15.19  )
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

On linux-next, build for bpf selftest displays an error due to
mismatch in the expected function signature of bpf_testmod_test_read
and bpf_testmod_test_write.

Commit 97d06802d10a ("sysfs: constify bin_attribute argument of bin_attribute::read/write()")
changed the required type for struct bin_attribute to const struct bin_attribute.

To resolve the error, update corresponding signature for the callback.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/e915da49-2b9a-4c4c-a34f-877f378129f6@linux.ibm.com/
Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index 2e54b95ad898..194c442580ee 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
 
 noinline ssize_t
 bpf_testmod_test_read(struct file *file, struct kobject *kobj,
-		      struct bin_attribute *bin_attr,
+		      const struct bin_attribute *bin_attr,
 		      char *buf, loff_t off, size_t len)
 {
 	struct bpf_testmod_test_read_ctx ctx = {
@@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
 
 noinline ssize_t
 bpf_testmod_test_write(struct file *file, struct kobject *kobj,
-		      struct bin_attribute *bin_attr,
+		      const struct bin_attribute *bin_attr,
 		      char *buf, loff_t off, size_t len)
 {
 	struct bpf_testmod_test_write_ctx ctx = {
-- 
2.43.5


