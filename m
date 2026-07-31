Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D12FC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGPgAnjtKT6ftTAM6aOkUfJetBSRY7Y8hfEs8FIUvWE=; b=yEeIKhruD3g7XkO5xKbu7MExc5
	s9SE4HmnX9YFgsAjkQgYlOZLaJLfDOvtRSIjSEA5vl2Yxdgq8nqOKAJoqZuthGavVstmqzO8yI5Gi
	XO7JAfQLKyrcx5lWDnZKR6w+yoUi/gYuxR/eRRJIQNi4/kjYWcvV5LRi8AyJ61Vtw6OCMaWnecNBK
	oQW0Q7d5nVulJYx/kuUaU2sI1uefJfZA/Ld0i89YmhI6s98jjj6WHlcjb2GGCs7p3xBIdjaY7WoAw
	3N3M9gUVLZ8chcd/4q8R1CZjCBsxdZ2OQcvVAWam55U7QU7VGNzUnxIK7lUWXVYGcYnsm06JbK9ei
	I0q509eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmzk-0000000CY88-13v8;
	Fri, 31 Jul 2026 13:09:48 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmzQ-0000000CXpi-0G28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 13:09:31 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmZTt1672199;
	Fri, 31 Jul 2026 13:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eGPgAnjtKT6ftTAM6
	aOkUfJetBSRY7Y8hfEs8FIUvWE=; b=ZeS7T9fNdcrXHdAGoCFzonlihd6wN7PyC
	GNqfp/I3alnQlVQ3Z8ExsFDZ5KRAonSQEPgvn9zU9mNj3/u9+fS0g1BeoD26VcuK
	GQitZtXRSrBuvoWfSO33wYqBjSF3A8h5wZt+JqWB0TiftEtuL16wc1XjaSlJRBmL
	62nDrSJxoF1paBQPHI/hZ6ku+tP0Tawof1m4XD/9+LqOOwj4S55VfKookUuZ2KvX
	gtypmtXpJeZuAvSalCBMNVbDhpAjpl/+xuV/LEPh2OuXINULXUtulAkVOpaSTgcI
	aryPgEhPuswTeqYhfVSSXpRtqfUGdpqen0qsx3tTiqONP4SFTCLGw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyjm3v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 13:09:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66VCuMcr012670;
	Fri, 31 Jul 2026 13:09:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8fkg07u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 13:09:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66VD95xp28705276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jul 2026 13:09:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E7AD2004D;
	Fri, 31 Jul 2026 13:09:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 987132004E;
	Fri, 31 Jul 2026 13:09:04 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jul 2026 13:09:04 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v5 04/31] arm64: Use proper include variant
Date: Fri, 31 Jul 2026 15:08:32 +0200
Message-ID: <20260731130902.654679-5-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731130902.654679-1-seiden@linux.ibm.com>
References: <20260731130902.654679-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NiBTYWx0ZWRfXzcRgvUGaGUIE
 OBMw2u1r4MU8XZRv5I7xWgA8EMjex+IsFxynOSU5uGOLOPDzh5YqLCFrjUocK9dqY7vIaqym78V
 co1P3GchEEHVmPDiaLq84Ef/AmbIqfg=
X-Proofpoint-GUID: QXD5bBxWjvwBFSApnVrk3-n4ykBoB8QY
X-Proofpoint-ORIG-GUID: T0xzpMAGbAR7DhOqDV7OE6ZIOJWkbLYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NiBTYWx0ZWRfX+q3Ksfo+buTb
 awIjyybs65q3ImQnnYe03LkaryQqFSIN80CstLcHANxoxl3I7J+sce5nwLNTBlEyMHQeIkulV7T
 idmWMu11VhQeyhA2u1jXxT+CREGpsG0/OsumVYVwduKW9dN7GoQR19hn8Cc5jkIruKMCdo0t90W
 C7ukQGwKujV7yFhC73Pcwt4qHlTQR77ed/57ZhR9tiuix/vAIM+xDhdC8XYPeMunNLFAdqrCTvH
 OeOrFFGJwt1x9grJdufYu57hTAwwCVxW0uyQjWow3NAxG795VBKDyn7uoM/QTsOBbt0Ec0Oirez
 8fCHN4SMV4iR/lYtJhzYJOp5NAUaI4+MkAUjHO38sqMeNlzCAKQ+gIEXVMZSJFB0C0C/UXEGTbb
 9YgXndPxjP9/EUna/gHUnmDj3JwEBlBmfRqROYmFNSrcyoOaLosp35lRcGiYEIflMUnkJ/npAiF
 Yb1EyKv8WzyRMQmt5yA==
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a6c9e7a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=d3WjOe2bLlXSZPWdUOEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_060928_277843_AD4CD80D 
X-CRM114-Status: GOOD (  15.46  )
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

Use <> for including the sysreg header as it is not discoverable from
the current directory.

Fixes: c07d8017bceb ("arm64/sysreg: Enable automatic generation of system register definitions")
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/sysreg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..4bfdac9401bd 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -173,7 +173,7 @@
  * come from here. The header relies on the definition of sys_reg()
  * earlier in this file.
  */
-#include "asm/sysreg-defs.h"
+#include <asm/sysreg-defs.h>
 
 /*
  * System registers, organised loosely by encoding but grouped together
-- 
2.53.0


