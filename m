Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD226F436B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jzjUvS6IN3u0DP4V1d89P/6U3YCpacgetOj1QJz/LIE=; b=ZztWvnQb3Mju0m4pVGJW1N8jY7
	E2FwZP2/liSCXwNFmmyl76fg5ynbaLEkN3d0kqsUtyndzYRG1jtIFWdpFyTwKJvNC/I79a/WXii6L
	8ctJXMpdK3KmVZb7qnc8A5NdW7NoHl/5B48BN8LvFwbnvm2iTLSC5Bca6+aZ1pTOeh4DjPhkjmgS3
	gHP2NcpkXTL5HxfpDk3txbzKLjTlH1wNRmSyOvhmUVRMso+nh0177zC0xqmVSGT+zpjuQyv/awpDZ
	ub8davvViK8J4UNdsLKaaIo54UZbdamd42ht2+akYRvr8Uw5u3Q1Yxhxbjh/8KuZBNfe4+UhbaeJJ
	nmX2eF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoR-00000004Ar3-04iz;
	Fri, 17 Apr 2026 15:08:55 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkoK-00000004Aog-0eAI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:08:49 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H95F221843051;
	Fri, 17 Apr 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=jzjUvS6IN3u0DP4V1d89P/6U3YCpacgetOj1QJz/L
	IE=; b=CtatF/+mtywpOEZuCzah621f4ipVdgiRmdtaDInKJSDNAfUyXv+aaqRSm
	CbQvA+/V32el2rOnVvu1JD52FldxXsz+obJ0oElbMZbcyo8BfN0pXyH7qs5hdSDL
	k4XMDc66IfMRBvBmRMMFnLWiE7uyL3rYjegVBSOPIeFh+LKjn4b8ZAAZzH1VPJS3
	F4iPCa6TrG3QhIdaJA8EcbYfCTlJmrKVld6OXnYLjtQl42qP0KNWVeqMVo8Zj5RM
	wYvu+fm0utJUOkVUWh0EsaHelIa/xz67Ngg927hXZq7O7ShXVZ5jwmhxvHmNOzAL
	a8fzfDGDVBh4ZiHE5bkyFC9/AGgYw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89n36db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63HDTAtI004188;
	Fri, 17 Apr 2026 15:08:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg24kqkqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 15:08:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63HF8Tjw6685084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:08:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90D802004B;
	Fri, 17 Apr 2026 15:08:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CA5720043;
	Fri, 17 Apr 2026 15:08:29 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Apr 2026 15:08:29 +0000 (GMT)
From: Jens Remus <jremus@linux.ibm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dylan Hatch <dylanbhatch@google.com>, Weinan Liu <wnliu@google.com>
Cc: Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v1 0/4] arm64: SFrame user space unwinding
Date: Fri, 17 Apr 2026 17:08:23 +0200
Message-ID: <20260417150827.1183376-1-jremus@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0OSBTYWx0ZWRfX5j8n4UWtW9rT
 egYsuvX8mtid9UjiXThQj02nNjqXzuesBgkUPS1u/IAdgsrHOxiueLUFjsqaF8MOfFGiwjNG4fB
 2q2fDwNpYEP8/z6DjeIV3QyHRzYeK1KSes7FJtdMACGO/F0lSHNnXajgRXr0/FdHPn0PlhpW6zX
 gx9bbtvsz2emO2zsJo44g8rtWoDvhRbemb7pOLFwVUqNoZstrdcw4L0vNARyLw+wNSXQApJMUxK
 /JIoiY2/J9HxZtOjgJBO2JLSrVOHuqNbRA09AGMnPsbGWo+slAyH08dUAYVdmr2oihakzcbzPiW
 r8vFRrg/lCFeMIKF+sep1DapH6bw2aBShpp+ZsKYPQllvjttiLmg186awrxgplQaCvTwJdSQG3W
 IVY0dQzUcL3FGrLMS7THmbF32W1tDsWR0MvsQ1Qs1oFK5v09olDGcRZgz8tY0tFSmUnjV+pFovK
 snchBoo7bQ3beWvEePA==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=69e24cf3 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=tM0xp4qUMKErKY1QLjAA:9
X-Proofpoint-GUID: yDnoB5gdNwqx4AcWjhMdpl_v-tygDvs2
X-Proofpoint-ORIG-GUID: OdDk8qfonbvwppfbmv2YyFPhPbEKHPGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_080848_194199_75A2A100 
X-CRM114-Status: GOOD (  16.93  )
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

This series adds arm64 support for unwinding of user space using SFrame V3.
It is based on Josh's, Steven's, and my work.


Prerequirements:

This series applies on top of the latest unwind user sframe series
"[PATCH v13 00/18] unwind_deferred: Implement sframe handling":
https://lore.kernel.org/all/20260127150554.2760964-1-jremus@linux.ibm.com/

For which Steven Rostedt kindly maintains a branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git  sframe/core

Like above series it depends on binutils 2.46 to be used to build
executables and libraries (e.g. vDSO) with SFrame V3 on aarch64
(using the assembler option --gsframe-3).

The unwind user sframe series depends on a Glibc patch from Josh, that
adds support for the prctls introduced in the Kernel:
https://lore.kernel.org/all/20250122023517.lmztuocecdjqzfhc@jpoimboe/
Note that Josh's Glibc patch needs to be adjusted for the updated prctl
numbers from "[PATCH v13 18/18] unwind_user/sframe: Add prctl() interface
for registering .sframe sections":
https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/diff/include/uapi/linux/prctl.h?h=sframe/core


Overview:

Patch 1 enables deferred FP-based unwinding of user space on arm64.
This is used by unwind user as fallback if SFrame is not available.

Patch 2 adds an unsafe_copy_from_user() implementation for arm64.
This is needed by unwind user sframe to access .sframe sections.

Patch 3 enables .sframe generation in vDSO on arm64.

Patch 4 enables deferred SFrame-based unwinding of user space on arm64.


Usage:

perf tools already support the deferred unwinding infrastructure by
using option "--call-graph fp,defer" (name subject to change):

  $ perf record -F 999 --call-graph fp,defer /path/to/executable
  $ perf script


Limitations:

Support for PAC is not yet implemented.  Note that SFrame V3 already
provides the required information though:

  SFRAME_V3_AARCH64_FDE_PAUTH_KEY(fde_info)
  SFRAME_V3_AARCH64_FRE_MANGLED_RA_P(fre_info)


Thanks and regards,
Jens

Jens Remus (4):
  arm64/unwind_user/fp: Enable HAVE_UNWIND_USER_FP
  arm64/uaccess: Add unsafe_copy_from_user() implementation
  arm64/vdso: Enable SFrame generation in vDSO
  arm64/unwind_user/sframe: Enable sframe unwinding on arm64

 arch/arm64/Kconfig                          |  2 +
 arch/arm64/include/asm/uaccess.h            | 39 +++++++++----
 arch/arm64/include/asm/unwind_user.h        | 65 +++++++++++++++++++++
 arch/arm64/include/asm/unwind_user_sframe.h |  8 +++
 arch/arm64/kernel/vdso/Makefile             | 14 ++++-
 arch/arm64/kernel/vdso/vdso.lds.S           | 21 +++++++
 6 files changed, 137 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_user.h
 create mode 100644 arch/arm64/include/asm/unwind_user_sframe.h

-- 
2.51.0


