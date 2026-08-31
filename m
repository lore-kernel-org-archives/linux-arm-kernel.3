Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FD8C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kkUuBtQh7OlhH3THIaN3BECiqBALGTcSbqHwQf9XXw=; b=T2itbQOXfsbF1RpFXy6A7o+GjM
	wpppoXko41jUvgYRv4otJ5ipEKEyj75EkdXg+dJNiqEOXxvENHXWNJZdSqRdq8NrYR9lM2ogjLLDK
	oAyJo+td0sFxYMEwoE8OGVeWAbGUYHGBkYXHQdKBGqE54UMhcukLW916vHNLo6nNEjDJqY1ubn9vm
	NRdMdHj7gk71uUw4gnrEadpczWL+dIn5C+5noFWGLEfNCEetBfJuyNpeBmF3d3oUIbqS3UP7aatOd
	8pwYwDQIfrWcJqzeThCrn/sg+YV7T6zza1HxlNWUc+PbVUCzV9xbP1SJoTfen3Si+NaxlUldQZvTQ
	6OL4r9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13JJ-00000009gPM-2zi5;
	Mon, 31 Aug 2026 14:48:33 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13JB-00000009gG7-2NdJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:48:26 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEZB5K1398307;
	Mon, 31 Aug 2026 14:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6kkUuBtQh7OlhH3TH
	IaN3BECiqBALGTcSbqHwQf9XXw=; b=IQuRavFzrhIkFIM+v1LRPMMBJYLHrSxD7
	gbRySdBzdhjAcotrFWG0eZY64U6id3fBgso/8aBryA2f2N4waUtmZ3JcRK2PINUq
	OqeJ/Q12wvLV4AfodSQdw/yIShX5XAMFuiKSZCklrIcAXnKOgALmrzdFHPISKnuv
	3uk+WocXMk3RMgijEOfczU4NbpODmPKA24MvTVmGuOdD3y26P6wSEwb+Se/nmFed
	bZhyGcXTqNlCS9nFkWVg2Rvo94XbLjQ7czgtsHZhP7e+BbkEKd48WZfVQZyDmSBq
	NCjfPA0NmoueQ/snpJjTNKlL/QrkbjwN8N6ltboJ3nZIdhCNRH6yA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnudhyrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:48:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67VEfcCM029530;
	Mon, 31 Aug 2026 14:48:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gccexx7nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:48:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67VEm5YJ51970358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 14:48:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66F8420043;
	Mon, 31 Aug 2026 14:48:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0468C2004E;
	Mon, 31 Aug 2026 14:48:05 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 14:48:04 +0000 (GMT)
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
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v7 05/23] arm64: ptrace: Use constants for compat register numbers
Date: Mon, 31 Aug 2026 16:47:42 +0200
Message-ID: <20260831144802.834315-6-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831144802.834315-1-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: N7EzIVXekhao_KlC2qo9hiQmtSOK0s0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfXyz1vqdRWVCVy
 5yXnwtUxMpyJbMgGvjnyWBlEvutMdPaI/LikW7H62ot0qT4l7wA0mZ51kWpvjymNWPV50OBjmAE
 2RJwoB43hKToCKcH/9sXPZOmpt34YUupAXeXNWvSWIqT3JBU9t70mvUdUIx7vR+6wEyG8HIF+zw
 EBJoDEQydFxZKhKXw5xWT52Qt3ZgVqF+UAyday61AzkBC3eitF2ESirIuBaZyftWRemO6m+AlHd
 SnhwLbXYZBpvIgTquX4UVgUCMYH7lJBiFz/DUOGzGuH77M6F7VagvZV2M/y7rfalPnEVAzl2VOY
 5It9r9S2/pQ0lUrSd0Uy3nQWMNn+8fpp7wGsLD7MGE4/ZefDWsWNKnHAxplo/eH78mU6CxgytiQ
 bXGxd045ellGSGWfPEouoxvJPzHGYJ4e7dhsUROCsbVGQW1FyGD9HwS//UV4LmTqrbI5UdGHuf+
 TpzgtgeyXJuwyFvRQYQ==
X-Proofpoint-ORIG-GUID: 4fyJHe-23G76FwA_MKSnAexW_LOErLar
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfX1rEhu5mzYrE+
 ZNXwWILMiKJTMyDmmde5e0dMQoLXv3L4e+EDaGR1YpmEA7Mq8pBdZbD6bUMxRakuAfTdo0/HdFe
 HkWNgZtSkCyn5QfAoTWIyyZ3H8qZT8Y=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a95942a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=8sKaXpLx0aSSeG29UzUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_074825_803790_21A43A44 
X-CRM114-Status: GOOD (  13.84  )
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

Define an enum to determine the register number for the mapping from
AArch32 and AArch64 registers. This allows for a more flexible use of
the register mappings.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/ptrace.h | 60 ++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index f7dc5fb9427d..49a83a0636b9 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -102,26 +102,48 @@
 #define COMPAT_USER_SZ	296
 
 /* Architecturally defined mapping between AArch32 and AArch64 registers */
+enum {
+	__compat_fp		= 11,
+	__compat_sp		= 13,
+	__compat_lr		= 14,
+	__compat_sp_hyp		= 15,
+	__compat_lr_irq		= 16,
+	__compat_sp_irq		= 17,
+	__compat_lr_svc		= 18,
+	__compat_sp_svc		= 19,
+	__compat_lr_abt		= 20,
+	__compat_sp_abt		= 21,
+	__compat_lr_und		= 22,
+	__compat_sp_und		= 23,
+	__compat_r8_fiq		= 24,
+	__compat_r9_fiq		= 25,
+	__compat_r10_fiq	= 26,
+	__compat_r11_fiq	= 27,
+	__compat_r12_fiq	= 28,
+	__compat_sp_fiq		= 29,
+	__compat_lr_fiq		= 30,
+};
+
 #define compat_usr(x)	regs[(x)]
-#define compat_fp	regs[11]
-#define compat_sp	regs[13]
-#define compat_lr	regs[14]
-#define compat_sp_hyp	regs[15]
-#define compat_lr_irq	regs[16]
-#define compat_sp_irq	regs[17]
-#define compat_lr_svc	regs[18]
-#define compat_sp_svc	regs[19]
-#define compat_lr_abt	regs[20]
-#define compat_sp_abt	regs[21]
-#define compat_lr_und	regs[22]
-#define compat_sp_und	regs[23]
-#define compat_r8_fiq	regs[24]
-#define compat_r9_fiq	regs[25]
-#define compat_r10_fiq	regs[26]
-#define compat_r11_fiq	regs[27]
-#define compat_r12_fiq	regs[28]
-#define compat_sp_fiq	regs[29]
-#define compat_lr_fiq	regs[30]
+#define compat_fp	regs[__compat_fp]
+#define compat_sp	regs[__compat_sp]
+#define compat_lr	regs[__compat_lr]
+#define compat_sp_hyp	regs[__compat_sp_hyp]
+#define compat_lr_irq	regs[__compat_lr_irq]
+#define compat_sp_irq	regs[__compat_sp_irq]
+#define compat_lr_svc	regs[__compat_lr_svc]
+#define compat_sp_svc	regs[__compat_sp_svc]
+#define compat_lr_abt	regs[__compat_lr_abt]
+#define compat_sp_abt	regs[__compat_sp_abt]
+#define compat_lr_und	regs[__compat_lr_und]
+#define compat_sp_und	regs[__compat_sp_und]
+#define compat_r8_fiq	regs[__compat_r8_fiq]
+#define compat_r9_fiq	regs[__compat_r9_fiq]
+#define compat_r10_fiq	regs[__compat_r10_fiq]
+#define compat_r11_fiq	regs[__compat_r11_fiq]
+#define compat_r12_fiq	regs[__compat_r12_fiq]
+#define compat_sp_fiq	regs[__compat_sp_fiq]
+#define compat_lr_fiq	regs[__compat_lr_fiq]
 
 static inline unsigned long compat_psr_to_pstate(const unsigned long psr)
 {
-- 
2.53.0


