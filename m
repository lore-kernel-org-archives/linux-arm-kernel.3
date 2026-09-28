Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9599DC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6APy/FJPv3eP8lr9ePw0W/ywIKRGll5HV1Kv9F7Oq8U=; b=RIK/PPUAx6LiWyp7kWiyD0Nxzq
	jbl2ArsT6p4mlB7BozFeBsXfdPj+Kk+4PS2EElwBQbLfkT5RkkHzGho5tbf7mMr3eeFvMctLndq2P
	Koj1M3KYWTP1CqqwRuKJrZLzF8GfYBNJSXQdWAZXej0DmNqbc5M3hno2Mf5EbjWIckeFItmkm5HLz
	cQ6+rzXxK3oduNbiHO5Qkor12zf7N5elIl9Rhyicd+cSF9J/x81E0tcl6Iz0hqUrR31LQyTa6ClM0
	v2jn52nM6/2LleyqnuP/0l3Ia9RUz8ltzarkwLa8mrLwuN6OI0shPA1cbHqBDR9D36GpLHsoVFpa1
	VMKQ9mrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7XC-00000000CkZ-2pNS;
	Mon, 28 Sep 2026 09:20:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7XA-00000000CkA-3cf2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:20:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9KS8u543504
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6APy/FJPv3eP8lr9ePw0W/ywIKRGll5HV1Kv9F7Oq8U=; b=mFxrWkleKWSscBQa
	NxAP7ie9s61riB4pD3SG265YM4HgyiP5NsPM/+SDClSqxRkg/bP9avwMVPqpxqC9
	60/zLsUOFmX3Gq+4WG5yt3gAZd7T+C048G+B3nhrUIjxf94lFRn6yypexJe5ylkX
	xg8FZJMNy67HBarUF0it6IlEcxi8tOHGJa0f5RMuIaTdxBfCiVb2vNeyz8L4TspF
	WvfPkmkfawlsnhaX8wYfvRYSHTe9nLIHm6EngMx3hfsDAZkpq30V3QBhb7e/7i6X
	WsU+aXWb1OHtGShNJd3Kd3RLhTgOt0hJ2F7H0cjM+1WU+vX7pW/mDWJupbxbgP/3
	QZJdKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49s0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:20:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so30502695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790587219; x=1791192019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6APy/FJPv3eP8lr9ePw0W/ywIKRGll5HV1Kv9F7Oq8U=;
        b=MlFtUQ3uH2b6fk1NdmjcSP+VT4Hv0Spr+ZH9toMNkG6u9OTgGuPtwrcOE14IBp0CIr
         sXD3qk7QCXbC5n3DUeSZy1oxcjgxSjZg0b6HCbobnP+5GcLWWE2oPFLZT9HzvtDqf4Qp
         US8Q4gQg9QLZe+XqgIHROE6eU2jhpvhxALOTKESULgAKyoUYY5Gdg96M7631HUNhd+1Y
         FCU5tGEWHFdqd40z585HWFBJWXJZdxL99fDXnKlDxcFy42jFE/atdlgOBE4n6KvV43KA
         7ZecOK5ZQNEeAinsp+nSxgNRbEGY71Jd0aaVKMkN8Po24e4Lw/tMI0loDAE1ZsJRmhU6
         NDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587219; x=1791192019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6APy/FJPv3eP8lr9ePw0W/ywIKRGll5HV1Kv9F7Oq8U=;
        b=DcI/3sY6B4CRXIsP5obXIWNnNztLqyufGdtmlSejEbIKSdAuImSfta+rS6/o44ZksF
         nPgfnOJSCBzU/p4NudLWh+g+Ch3WtrEBhAefPw3gfAzTVDGQFMJTZ3kMx71SOyVTUOpP
         N+AL9bohnw47rfs9mOLPDhHYzxAhUegxECmFpFvboDBCpmd3NJ/l1qrqFfgnCtcCukXV
         rMxV4aA8xLOSqvaXlpmbi5svO7SOSwUSLPCHxt1DUWatuGLdHO97pjV9jAAxq0/DP6Dw
         RC8CRswlVvLgW26gMvqKrbnYJhbhMX9+eL83Nw5akS6ut3dnK5p7zI6gnZrI5jaBejjv
         zIJg==
X-Forwarded-Encrypted: i=1; AKwUvBwApVRfilHDhGDF6Oax+LFPr+TEC5zL8TWb8vqvaHcHncHHj4hRVIdoeSPeIi2hiaaw+qh0WKfT7waO/wcNHolx@lists.infradead.org
X-Gm-Message-State: AFq9FYIhIVIa/E7zdP68dVnRtCt1pkAUZedobu1tRbw1BMOGTJAbXJCG
	WbnEOyHh9pgx0shLbFIw4SyloHka/zGxolCD9v26BrZm3XIvNLWbuj5ei34tnzs5MgICKx65282
	ChyWrkG06QnhE45oYZUXoSr0cSnUF7jNNJYuM86VzeTg2LULYdy0cb2JwDhGq/kB019FOCbYUN0
	+yBQ==
X-Gm-Gg: AYBFou2SuQfkZ5C6u40Sooxud+a0vl4EYjQtzUjw1++UpM42eIi6It7UoHp09Bd69ul
	dauMUGAmDEOgXSseVbo2mjRJq/Ms5L1KI7J3GAzWh+5inWce2DPHENXzPgk8mz9XzIrPEfBSz7u
	A8TejHF+Cxbog9yYkjhz2DfTGmBNt+6SfpyPZQx3DgaN12W3CcoWNXtbfRHpwWpX/7wuZwsjK/e
	omqvIpejqICjN4/6EZnfXu3Fnhl+pLpzn46KhvqK4xT1V2oX2oP6gd3PgVL2gDzZSDRTiPobAz5
	tGsSj+MFVInuRNqXFWKGke9SjIsDnSGyzMN4lyE3e9Y1a71WqJmYr9XxFqwvo64pPTrb85KCxk9
	DxzwCrq8Hg42+iwFj8ktgv1jJSn3F74e7wz7cYvXYzRMP5QG3972TBnlq3/yyRz1lpBaZtrPknQ
	JXlcsnaGus99SjpIqWXUw=
X-Received: by 2002:a17:902:c40e:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2df7e0069ecmr90039155ad.64.1790587219063;
        Mon, 28 Sep 2026 02:20:19 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2df7e0069ecmr90038865ad.64.1790587218449;
        Mon, 28 Sep 2026 02:20:18 -0700 (PDT)
Received: from [10.79.116.56] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91461d43sm37574575ad.75.2026.09.28.02.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:20:18 -0700 (PDT)
Message-ID: <4095827e-dbbb-4ab9-8610-1bc317aa096f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:50:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] KVM: arm64: selftests: Check a feature hidden in
 an ID register is UNDEF
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Quentin Perret <qperret@google.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Wei-Lin Chang <weilin.chang@arm.com>, Fuad Tabba <tabba@google.com>,
        linux-kernel@vger.kernel.org
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
 <20260928064643.3265087-5-fuad.tabba@linux.dev>
Content-Language: en-US
From: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
In-Reply-To: <20260928064643.3265087-5-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j4HTKyJWMMPLgCTUij3sN0kTvcBx-TAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX8PNRLVYD2yWQ
 RVJ8Ghk5Z+OSRUxnV7egI0hMahE00ZuixYQY+DCrTTG856H9PVT50g0nGxdud1MT79xjJyP51Vq
 3KBh4z//XGySxnjbTvGlg9WCJwqs8Pd8qTM0FanC3fdsUFuG1vNZeJjqbcnrBc/Ne21S3DWfqEY
 Lx5XIwJQkLxflO+oMltGFTYiMX3M97Ky3df+yQMG+tnRcLzh8bgEHxwn2finnhj6OxSCy90zUsF
 YeEQipxr2NQ5DhJJjbgYvKmlD1H7SYAfiYbbD7ONpsZvcAkZzV5s5pVHSkvvQsSHxQ5KP7Y9DV/
 kNJa6DDmjViaDRlHhkaOMpliEjCyc9Fmm/gahL0iYmAbxuAgnVvf5qVbX/0tlr7rRjy9SklaeGb
 KA37lIREROz0LTa8/5o+9A0lRVriBmAw5gG20d5+15ctiLLrZFn0sxcmHso9A5dRcw3jgwFhN9+
 HusMPxprs31IwE6RkfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX8VhA6Y2GnOP3
 dNupflRxq8YMHmUVyne+Nn1GRc3Jza34c4g94si+jzE+7NpQ7eJCn3C4pbIiyxDSIZrDJlxonC5
 ENZPHB78tA0gRT1mrD3v5t1gpl1F9Us=
X-Proofpoint-ORIG-GUID: j4HTKyJWMMPLgCTUij3sN0kTvcBx-TAt
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba315b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=396Fl0Eq_38yRDxh:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=AnUhwBZesh3cMlnU-2sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_022028_914222_01541F4B 
X-CRM114-Status: GOOD (  29.95  )
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


On 28-09-2026 12:16 pm, Fuad Tabba wrote:
> Userspace can hide a feature from a guest by clearing its field in a
> writable ID register, and KVM then makes the feature's instructions
> UNDEFINED in the guest by trapping or disabling them. No selftest checks
> that.
>
> Add a test that runs the instruction of each of TLBI OS, MOPS, TCR2_EL1
> and FPMR once with its field as advertised and once with it cleared, and
> expects an UNDEF only when cleared. A feature the vCPU doesn't advertise
> is skipped, as is hidden TLBI OS on a CPU with neither FGT nor
> FEAT_EVT2, where KVM can't trap it.
>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>   .../selftests/kvm/arm64/hidden_features.c     | 184 ++++++++++++++++++
>   2 files changed, 185 insertions(+)
>   create mode 100644 tools/testing/selftests/kvm/arm64/hidden_features.c
>
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 96bab7002d39e..864fdca7f362e 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -194,6 +194,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_v5
>   TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
>   TEST_GEN_PROGS_arm64 += arm64/no-vgic
>   TEST_GEN_PROGS_arm64 += arm64/idreg-idst
> +TEST_GEN_PROGS_arm64 += arm64/hidden_features
>   TEST_GEN_PROGS_arm64 += arm64/kvm-uuid
>   TEST_GEN_PROGS_arm64 += access_tracking_perf_test
>   TEST_GEN_PROGS_arm64 += arch_timer
> diff --git a/tools/testing/selftests/kvm/arm64/hidden_features.c b/tools/testing/selftests/kvm/arm64/hidden_features.c
> new file mode 100644
> index 0000000000000..194d746e7605e
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/arm64/hidden_features.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * hidden_features - Check that a feature's instruction runs in the guest when
> + * its ID register field is advertised, and is UNDEFINED when userspace clears
> + * the field.
> + *
> + * Copyright (c) 2026 Google LLC
> + * Author: Fuad Tabba <fuad.tabba@linux.dev>
> + */
> +#include "kvm_util.h"
> +#include "processor.h"
> +#include "test_util.h"
> +
> +static volatile bool undef;
> +
> +static void guest_tlbi_os(void)
> +{
> +	/* tlbi vmalle1os */
> +	asm volatile("sys #0, c8, c1, #0\n\tdsb ish\n\tisb" ::: "memory");
> +}
> +
> +static void guest_mops(void)
> +{
> +	register u64 *d asm("x0");
> +	register u64 n asm("x1");
> +	register u64 s asm("x2");
> +	u64 buf[8];
> +
> +	d = buf;
> +	n = sizeof(buf);
> +	s = 0;
> +	/* setp [x0]!, x1!, x2; setm; sete */
> +	asm volatile(".inst 0x19c20420\n\t.inst 0x19c24420\n\t.inst 0x19c28420"
> +		     : "+r"(d), "+r"(n) : "r"(s) : "cc", "memory");
> +}
> +
> +static void guest_tcr2(void)
> +{
> +	read_sysreg_s(SYS_TCR2_EL1);
> +}
> +
> +static void guest_fpmr(void)
> +{
> +	read_sysreg_s(SYS_FPMR);
> +}
> +
> +struct feature {
> +	const char *name;
> +	u64 id_reg;
> +	u64 mask;
> +	u8 shift;
> +	u64 min;
> +	void (*insn)(void);
> +	bool (*trappable)(struct kvm_vcpu *vcpu);
> +};
> +
> +/* Without FGT, KVM traps a hidden TLBI OS only through HCR_EL2.TTLBOS (FEAT_EVT2). */
> +static bool tlbi_os_trappable(struct kvm_vcpu *vcpu)
> +{
> +	u64 mmfr0 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR0_EL1));
> +	u64 mmfr2 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1));
> +
> +	return SYS_FIELD_GET(ID_AA64MMFR0_EL1, FGT, mmfr0) >= ID_AA64MMFR0_EL1_FGT_IMP ||
> +	       SYS_FIELD_GET(ID_AA64MMFR2_EL1, EVT, mmfr2) >= ID_AA64MMFR2_EL1_EVT_TTLBxS;
> +}
> +
> +#define FEATURE(n, reg, field, min_val, fn, trap)		\
> +{								\
> +	.name		= n,					\
> +	.id_reg		= SYS_##reg,				\
> +	.mask		= reg##_##field##_MASK,			\
> +	.shift		= reg##_##field##_SHIFT,		\
> +	.min		= reg##_##field##_##min_val,		\
> +	.insn		= fn,					\
> +	.trappable	= trap,					\
> +}
> +
> +static const struct feature features[] = {
> +	FEATURE("TLBI OS", ID_AA64ISAR0_EL1, TLB, OS, guest_tlbi_os, tlbi_os_trappable),
> +	FEATURE("MOPS", ID_AA64ISAR2_EL1, MOPS, IMP, guest_mops, NULL),
> +	FEATURE("TCR2_EL1", ID_AA64MMFR3_EL1, TCRX, IMP, guest_tcr2, NULL),
> +	FEATURE("FPMR", ID_AA64PFR2_EL1, FPMR, IMP, guest_fpmr, NULL),
> +};
> +
> +static void guest_code(const struct feature *feat)
> +{
> +	undef = false;
> +	feat->insn();
> +	GUEST_SYNC(undef);
> +	GUEST_DONE();
> +}
> +
> +static void guest_undef_handler(struct ex_regs *regs)
> +{
> +	undef = true;
> +	regs->pc += 4;
> +}
> +
> +static bool run(const struct feature *feat, bool hide)
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	struct ucall uc;
> +	bool got = false;
> +	u64 val;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, (void *)guest_code);
> +	vm_init_descriptor_tables(vm);
> +	vcpu_init_descriptor_tables(vcpu);
> +	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT, ESR_ELx_EC_UNKNOWN, guest_undef_handler);
> +	vcpu_args_set(vcpu, 1, feat);
> +
> +	if (hide) {
> +		val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(feat->id_reg));
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(feat->id_reg), val & ~feat->mask);
> +	}
> +
> +	for (;;) {
> +		vcpu_run(vcpu);
> +		switch (get_ucall(vcpu, &uc)) {
> +		case UCALL_SYNC:
> +			got = uc.args[1];
> +			break;
> +		case UCALL_ABORT:
> +			REPORT_GUEST_ASSERT(uc);
> +			break;
> +		case UCALL_DONE:
> +			kvm_vm_free(vm);
> +			return got;
> +		default:
> +			TEST_FAIL("Unknown ucall %lu", uc.cmd);
> +		}
> +	}
     Return missing?
> +}
> +
> +static void probe_feature(const struct feature *feat, bool *present, bool *trappable)
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	u64 val;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, NULL);
> +	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(feat->id_reg));
> +	*present = ((val & feat->mask) >> feat->shift) >= feat->min;
> +	*trappable = !feat->trappable || feat->trappable(vcpu);
> +	kvm_vm_free(vm);
> +}
> +
> +int main(void)
> +{
> +	const struct feature *feat;
> +	bool present, trappable;
> +	int i;
> +
> +	test_disable_default_vgic();
> +
> +	ksft_print_header();
> +	ksft_set_plan(ARRAY_SIZE(features) * 2);
> +
> +	for (i = 0; i < ARRAY_SIZE(features); i++) {
> +		feat = &features[i];
> +
> +		probe_feature(feat, &present, &trappable);
> +		if (!present) {
> +			ksft_test_result_skip("%s advertised, not supported\n", feat->name);
> +			ksft_test_result_skip("%s hidden, not supported\n", feat->name);
> +			continue;
> +		}
> +
> +		if (run(feat, false))
> +			ksft_test_result_fail("%s advertised, UNDEF\n", feat->name);
> +		else
> +			ksft_test_result_pass("%s advertised\n", feat->name);
> +
> +		if (!trappable)
> +			ksft_test_result_skip("%s hidden, not trappable\n", feat->name);
> +		else if (run(feat, true))
> +			ksft_test_result_pass("%s hidden\n", feat->name);
> +		else
> +			ksft_test_result_fail("%s hidden, no UNDEF\n", feat->name);
> +	}
> +
> +	ksft_finished();
> +}

