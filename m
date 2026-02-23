Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B765EA4FB5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLTBtbUx77gzumExkwQ+UsZaY5sqhpu/Y8wOE2jbbEc=; b=NxyOlPlyMpo6Ube0YqSkIQZJvS
	Kzl9sD8kU28Wc8TLcayHawx2ySIUCj9d4Gyo0nwRAOiDQ47SBpdo0z+tJNsJB8IjW/8F2PdUeXmhY
	dIEo7/y8aLy7RtJ7rdyyqbmBFWwx8ojd1ENTuMQJAa1sNtk1SqcwD+mHkdfTsJn5Kj1Xt2G+aMMOI
	5KW6DhgO11vjPeGHORSu4t7Ku0b38dlSbu22oeW9EcHuOp4pXGeku2b1cDqkXjXGOerAUIekQiGP7
	7Gzt4jgACI2gmaWlp7iBepODl6WIk1pWb468C64Dt8/n1rbSmq/mnVvJvgCAfF4+XZI6ZiEt5RvmQ
	pSVdb7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUVM-00000000EBb-1m4X;
	Mon, 23 Feb 2026 11:53:36 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUVH-00000000E68-0PcQ;
	Mon, 23 Feb 2026 11:53:32 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N1bvMK3315819;
	Mon, 23 Feb 2026 11:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VLTBtbUx77gzumExk
	wQ+UsZaY5sqhpu/Y8wOE2jbbEc=; b=Jp8eTwpbqSGWtu5FS4DBCf0AAR2JEELvk
	FiKbWklVCNRdNXTrRt6xsfisN6dDQw66AWZOeeDexXNxv67Li6A4CcWVak7/MYyq
	zQugjyp6d3n2D+viaNXLB5mXiFvjIHNQ3AmnpHrbTvoBWWHRR0ms58M09NYvJpjn
	n2AFZT+RVhmT+NMV7Jwn9qUy1bpx7QvACMExanE7dy9piR+Vn8fvyC6XfGP2NGLC
	c9OgdmHRsJNFwze9TyDLD+gEm7JTb0g3++HPJGoMNuc3+My6HYdVaU5sQtsqvSYp
	+n4EV7geNlSVf1t4g0CHlN7jctMte+rP7jT8orE6pHDKIaO8WfFXA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471pymx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 11:53:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61NBiUlY004541;
	Mon, 23 Feb 2026 11:53:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8jmd7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 11:53:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61NBrGEm31785692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Feb 2026 11:53:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E8402004F;
	Mon, 23 Feb 2026 11:53:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 673422004B;
	Mon, 23 Feb 2026 11:53:16 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 23 Feb 2026 11:53:16 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 47EB0E0BAA; Mon, 23 Feb 2026 12:53:16 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: [PATCH 4/4] s390: Enable page table check for debug_defconfig
Date: Mon, 23 Feb 2026 12:53:16 +0100
Message-ID: <fa08bb93c20a48884b7836834c79f44b5fb9b8b3.1771845678.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1771845678.git.agordeev@linux.ibm.com>
References: <cover.1771845678.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UTiM2q-6iZvpMeP5gTtkFRmbUSSW2s_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5OSBTYWx0ZWRfX6BvNd3T/IZJu
 OZ4C0j8MAlKXKMBI+WRSs6rU5KkA3WD/TuG2rz0Ir4iYHpRSCBCKncBr2l3uAIHqp+oBIOQrD4C
 y0qNPjma/5b50SbwtJAa+UiDJabVp4cBqO/fFTSF9tEqg9huF4ZzcsXKTPiPIQYY2pJcmyuZ2oQ
 LkWJxyMjMu8EWXKHi6Cy6vvxMasenEg7sPehdRr2PJwMuiRR/OGXQLsqfXV+hpEH8wOXInt0qK1
 p/2BRAQTDVyI3+0YsGeXVYsFYLydHq6eoOWCu9KUaeZEpeDhvoF7iIoMfly4Raw9pW5ky3U9nuq
 07PurA31R0C9x66txtYfbxvTHU/YG1CJ/it4ZoAzeBwPenLAsvp5HbqXhTMj5Z6uRXx7YGuBNKd
 lvDUSEyXSyHQdg9AJ14Eq8dwlVyeLEDk1Xq+C0CXgpA0+NmAuFFDiph+7UzGTn9xcXeeRviAwnv
 1Gxv9Qovir/8lnXyzVg==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699c3faf cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=ll0qgXPPjJRHf6HrCsAA:9
X-Proofpoint-GUID: UTiM2q-6iZvpMeP5gTtkFRmbUSSW2s_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602230099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_035331_176039_B6184EC3 
X-CRM114-Status: GOOD (  11.36  )
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

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/configs/debug_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_=
defconfig
index 98fd0a2f51c6..12cdaaefb6db 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -929,3 +929,5 @@ CONFIG_PERCPU_TEST=3Dm
 CONFIG_ATOMIC64_SELFTEST=3Dy
 CONFIG_TEST_BITOPS=3Dm
 CONFIG_TEST_BPF=3Dm
+CONFIG_PAGE_TABLE_CHECK=3Dy
+CONFIG_PAGE_TABLE_CHECK_ENFORCED=3Dy
--=20
2.51.0


