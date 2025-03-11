Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E66C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R7l+S7unw8HaDq3ycvl5vpv+2cv+Okn+aN2afRCN2Hs=; b=1wDV7dC1epOKacXffC82AcNobD
	O1fInhkjxLnDygMZBuKIVKOSY2C1Gcf2sL5X4euV3mN1rf7QEwt3+ACFQW6b7snlpi4ARl76jp0c2
	3UVlGPrvZUdNSj55XUCJ2CB4BNsTC3dAmXeaATCca462omEI2DCoaTECSgBLrRfkYI5jGXEAcwATA
	wQzQJYX3Fp8JRovnTmrsDsUBRDbnau277rmWQP8AqnHVbxC9LM2QXtTjUMSe6kXR3P1F78YsWKzQd
	sMNpoxWyK3i0pL/Kjy23RF8zD9CQ++Fbex40rG74mq39YT1oSJy0FycvrIhsjj1LFcVoYmAkyNWk0
	/wFxQMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvDF-000000051QP-1I4R;
	Tue, 11 Mar 2025 08:43:45 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvBa-000000051Gp-40RO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 08:42:04 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AKFblq016033;
	Tue, 11 Mar 2025 08:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=R7l+S7unw8HaDq3ycvl5vpv+2cv+
	Okn+aN2afRCN2Hs=; b=MRSacfzGOrk8njYP7aTBskXEB51mu73CoEhJVkDYsQ/A
	KtFVUoKch8E394WpLPC/T9eRnQxX7joEfxf6ebHwy2SxCAS8jCYvOSNh/0xJUO1R
	vPwDmdWLLjYPVFj98jaqoTvbpHVcM6BSgkSVsV2PLuzQuyXhZ2xuAkliJ/fH0GXp
	Ay9uBz4KSRBEgd7i2DR7RNsbYvVv0z4F1dAPOEl/6Pc8u6/OJ10YsNaWNRf88gxW
	3aUmBbDBTA2uNl6CDaB/zgrPgucDpxrgWfoqBzG5EvmCELMjyiFpelDBouXf54q0
	W4W8m0ZR/hGzi+J7MwnEeihxvYDO9ky+Y9l323dzsA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45a1gp4uj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:41:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52B8CLRd007304;
	Tue, 11 Mar 2025 08:41:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45a1gp4uj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:41:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52B6ei2x027566;
	Tue, 11 Mar 2025 08:41:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4591qkk508-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:41:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52B8fZqN36307332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 08:41:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF4F720049;
	Tue, 11 Mar 2025 08:41:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1395020040;
	Tue, 11 Mar 2025 08:41:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 08:41:32 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: catalin.marinas@arm.com, shuah@kernel.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, yury.khrustalev@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] selftest/powerpc/mm/pkey: fix build-break introduced by commit 00894c3fc917
Date: Tue, 11 Mar 2025 14:11:29 +0530
Message-ID: <20250311084129.39308-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XjiArt6L0DCuKkUNmeos7SdNVMkgrYU4
X-Proofpoint-ORIG-GUID: SRAKZlZkEm18QLdCEcWQrintl1Z8lLK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 mlxlogscore=631 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_014203_007703_BB812F3B 
X-CRM114-Status: GOOD (  15.85  )
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

Build break was reported in the powerpc mailing list for next-20250218 with below errors

make[1]: Nothing to be done for 'all'.
BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
  CC       pkey_exec_prot
In file included from pkey_exec_prot.c:18:
/root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
/root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
   96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
      |                                  ^~~~~~~~~~~~~~~~~

https://lore.kernel.org/all/20250113170619.484698-2-yury.khrustalev@arm.com/ patchset
has been queued to arm64/for-next/pkey_unrestricted which is causing a build break
in the selftest/powerpc builds.

Commit 6d61527d931ba ("mm/pkey: Add PKEY_UNRESTRICTED macro") added a macro
PKEY_UNRESTRICTED to handle implicit literal value of 0x0 (which is "unrestricted").
Add the same to selftest/powerpc/pkeys.h to fix the reported build break.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/lkml/3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com/T/
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Catalin, can you take this fix via arm64/for-next/pkey_unrestricted?
Patch applies clean on top of arm64/for-next/pkey_unrestricted

 tools/testing/selftests/powerpc/include/pkeys.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index c6d4063dd4f6..d6deb6ffa1b9 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -24,6 +24,9 @@
 #undef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE	0x4
 
+#undef PKEY_UNRESTRICTED
+#define PKEY_UNRESTRICTED	0x0
+
 /* Older versions of libc do not define this */
 #ifndef SEGV_PKUERR
 #define SEGV_PKUERR	4
-- 
2.48.1


