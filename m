Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4FACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eYIclMc1S8tQ3EHXNewhAUNCGGawrS1pWeLI+oTbF4o=; b=FvtW09oVXa/4mYtutf7HBtaeTS
	IJdTIBwyZLoTy5MKm2e4tMT9W/30LKfEtGGxVK4/ryluw/j5l4JhD5ijvc0lIzlBzuX+BrYo4TMw7
	vjj85Qfc2ezldFX5kqeItvt8EDcAe3q6rZFcMQ9yT4UssVEb7VjTdGiebf8dgyc/6pjYY/o1RKLFr
	+qziA1uZsE8nRVYr4qj5nddxoRtabKBYL+0pxRVQ2vt5N/0lgYSyfYRrY6NCylMMYePEK72NayrWj
	cqg85x5FjTqXm8uIQN+72whoP5tGRaXDziF4wP84Tt+PVF+cw8AAzYDfE0ZZP9vJPLvAVqULDxnYr
	ozYp+oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxZ7-0000000FLip-36Jh;
	Thu, 06 Nov 2025 10:50:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxZ4-0000000FLiR-3Aii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:50:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68Nf4t2165169
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 10:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eYIclMc1S8tQ3EHXNewhAU
	NCGGawrS1pWeLI+oTbF4o=; b=POjsuEUr1+AkwxREVeNEvoC4wHtovyLcLXbUgw
	Rk/HY3m7X3DI7MSvVQ+O+GsMGTdMcMaZ5YEQLTqtpQs2RtYB0mgNrJoBtpxbJKNS
	HJ9iaO0OF6xuoa++lB7fY/F6ZknI/3LQUAaPYk2IZ3zp5SfZlR4+gflE/YoAlOuE
	ECvKJNJF9N56xwcpfZ2VKDiApt4ZbgPZE6+Asauo3w/pgGLYH48f1V9ARC4NblEb
	qm+DEOgak9YpLLoHhaQUYRKtGuTgSScl5kZin8oyyHUWWj7+GwK64uxUpNfqEG+4
	AZo818aQPfPV7LAfOQhdiTNJ1gX7dg+sCP8FIOovrXWCm1rA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6esqms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 10:50:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29085106b99so3656495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762426200; x=1763031000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYIclMc1S8tQ3EHXNewhAUNCGGawrS1pWeLI+oTbF4o=;
        b=dF4b6p1WrFLgS5A9sXunusymGPEZ/wqVgFEgTQwzOPz/gmcwACM5c/GjOCbmz+ZF1m
         SQg1YlRRpIwclkuYJ6hQiotNyf2trO86BWsokhlTJQprF6yINdII3pLIAK0XsPWCSU/D
         URtLl/jFg+OyuvUyI6S0JWz+77vb5I+HuP3buHTTlvOsjCK/MrIFweZWm7yLo05eGvdb
         y8mrMQMk0pMsK6x/+aGdTD7RE6APVsyfGPsDKWIPUzq0TOJFGMfoJjKdRhZpgrjW+8XM
         +iOHTELdKTd0PRarSbB+cFNTyWTRll/uAnAlfAYAkCunfkH7rMjZDn9JQ4sNCv0H/xyp
         F4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762426200; x=1763031000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYIclMc1S8tQ3EHXNewhAUNCGGawrS1pWeLI+oTbF4o=;
        b=os+DMlduo8ss/oBsFATYrRCex/9id15oLLhkJajkk3uRLb3+juRItwewo0Fb216k0m
         6m3KqAUcRfJXBvtLgHQtxoOiu1IxHHMQWxZql/H1byXaJ2YoSZ+7EKYRfE44b2pp82n+
         Pe+dYTyrLgerSl919sKTxVBo6Oz5Gjj47NRQ//jAvasIj0eUiCz6dTdgI1vp4taEv3of
         q0cgbOEDd7r/aiNmTPSbC5jmEMa+0ebIwMTcaOCNXI8mS5eG5YT5T0YFtRFyWtMtExl2
         SZjQg7r8OVhYjTmBrd56Tx7W3ni+A6ui8XscJRsHAGImY/xOoWhnsv6zhdIBlJpN03Ne
         Fayw==
X-Gm-Message-State: AOJu0YwrahVBR/7h9cnUvHwtNXbLg8Mwf21QWZXim2P1WEabePJhe/YB
	OrnkKQzQs6I4h7LWDa4CHM3tZZGEabNCazFptiVD95grlUihNz6K2N/ZBuvAEa9zAsn48ulr5Xw
	k4yDreM/mtu5lXGR1GFEPAAuqQcz912S26Yc14E9M/eK/BpZ4FGAyrmlxS5ZOz0suV5gellZGUe
	3mh2mc62woCA==
X-Gm-Gg: ASbGnctx/lhkobY6+A6mOpcSLaPp/vedezxjRFhqRgZRMB10WwFtc7zd/aRP2mOSGsz
	zyKPewhQHSg4Bzr9CyZ2NoWUjLQlo6MGIL41ZgjqbS49pnEuxJM85VX8FGruc4TR+lV1jquKr0e
	FLzslaihkqK2wfyiAV7U/h55OiYBIGbmBU5RTt6NSsrVAoEHkZaNemC/nGt8fjqN1BG/ErHfOuR
	dop5ybt2mqiwKAG/pglifJzlg4zkA1hzODJyS+KhyFJ8Qf4ELtzFsPCffUX0/+ni7gjWRPTdQ6D
	0V6T8k6xLnkkO1ynC+nPrDjoApCfZY51bCx9SWNUdWq5ykH7aIEgO1mLsSY4SCzsNIeRg5tzzkk
	hpAM49gq+0zYiImf6msbEbDOK1lVuYA==
X-Received: by 2002:a17:903:2986:b0:295:3d5d:fe3b with SMTP id d9443c01a7336-2962ad95d44mr92650725ad.28.1762426199941;
        Thu, 06 Nov 2025 02:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKbtc7O+Ae/vhgwno4UxymyqOjep2QdMp+I6x5qOroY50xVCKvQHkpgkjOhA37e0xwIzT3bQ==
X-Received: by 2002:a17:903:2986:b0:295:3d5d:fe3b with SMTP id d9443c01a7336-2962ad95d44mr92650365ad.28.1762426199366;
        Thu, 06 Nov 2025 02:49:59 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccf0e7sm24274215ad.101.2025.11.06.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:49:58 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: kprobes@vger.kernel.org, linux-kernel@vger.kernel.org, will@kernel.org,
        catalin.marinas@arm.com, masami.hiramatsu@linaro.org,
        khaja.khaji@oss.qualcomm.com
Subject: [PATCH] arm64: insn: Route BTI to simulate_nop to avoid XOL/SS at function entry
Date: Thu,  6 Nov 2025 16:19:55 +0530
Message-Id: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4NCBTYWx0ZWRfX7ru/94W2dOhl
 Yyli6P0Inb3vvEDn4/eekd4MdudcUwCoO9R7t+QSQeblI/6oAmRsPSElncOxAcwqrTHIMmm8cFe
 IHJAIWxdXq5H+m5QqGlUy/5VzV6RZWQ8tFHilL94C+mp1w0xjMqNdZhBUF00WuzDXUua1HdQeYv
 nKABtbzMTqLQ0BwXMOD/qXsRZMr3B4eMAYqskqAl1AMh5rfdJeyDk/h4MVzbx2f3dUcebdlk2vE
 caHPuSKLJTaI+ni5g3NGvry/wU/Kh+F8Mqeo3opckT7s6tanj9jmadCxgG+SwsnfcYffFEoGxdm
 kLRirApMXmCz81Q8Cy88kCSZoN6y6VSkm0qAcRUQaSqdn8snUS1P0dfCPkvXoFjNUqIcAND3v17
 yZQ+LtHLGTofcdZT1QlbVXZEDl3dGA==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690c7d59 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XwLyKEN_6mDbY-G0MD0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _0lxGWmtdscH7oAk88uWqciakdcu0g6i
X-Proofpoint-ORIG-GUID: _0lxGWmtdscH7oAk88uWqciakdcu0g6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_025002_918351_A7A16164 
X-CRM114-Status: GOOD (  16.95  )
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

On arm64 with branch protection, functions typically begin with a BTI
(Branch Target Identification) landing pad. Today the decoder treats BTI
as requiring out-of-line single-step (XOL), allocating a slot and placing
an SS-BRK. Under SMP this leaves a small window before DAIF is masked
where an asynchronous exception or nested probe can interleave and clear
current_kprobe, resulting in an SS-BRK panic.

Handle BTI like NOP in the decoder and simulate it (advance PC by one
instruction). This avoids XOL/SS-BRK at these sites and removes the
single-step window, while preserving correctness for kprobes since BTI’s
branch-target enforcement has no program-visible effect in this EL1
exception context.

In practice BTI is most commonly observed at function entry, so the main
effect of this change is to eliminate entry-site single-stepping. Other
instructions and non-entry sites are unaffected.

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 arch/arm64/include/asm/insn.h            | 5 -----
 arch/arm64/kernel/probes/decode-insn.c   | 9 ++++++---
 arch/arm64/kernel/probes/simulate-insn.c | 1 +
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 18c7811774d3..7e80cc1f0c3d 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -452,11 +452,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
 	case AARCH64_INSN_HINT_PACIASP:
 	case AARCH64_INSN_HINT_PACIBZ:
 	case AARCH64_INSN_HINT_PACIBSP:
-	case AARCH64_INSN_HINT_BTI:
-	case AARCH64_INSN_HINT_BTIC:
-	case AARCH64_INSN_HINT_BTIJ:
-	case AARCH64_INSN_HINT_BTIJC:
-	case AARCH64_INSN_HINT_NOP:
 		return true;
 	default:
 		return false;
diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
index 6438bf62e753..7ce2cf5e21d3 100644
--- a/arch/arm64/kernel/probes/decode-insn.c
+++ b/arch/arm64/kernel/probes/decode-insn.c
@@ -79,10 +79,13 @@ enum probe_insn __kprobes
 arm_probe_decode_insn(u32 insn, struct arch_probe_insn *api)
 {
 	/*
-	 * While 'nop' instruction can execute in the out-of-line slot,
-	 * simulating them in breakpoint handling offers better performance.
+	 * NOP and BTI (Branch Target Identification) have no program‑visible side
+	 * effects for kprobes purposes. Simulate them to avoid XOL/SS‑BRK and the
+	 * small single‑step window. BTI’s branch‑target enforcement semantics are
+	 * irrelevant in this EL1 kprobe context, so advancing PC by one insn is
+	 * sufficient here.
 	 */
-	if (aarch64_insn_is_nop(insn)) {
+	if (aarch64_insn_is_nop(insn) || aarch64_insn_is_bti(insn)) {
 		api->handler = simulate_nop;
 		return INSN_GOOD_NO_SLOT;
 	}
diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
index 4c6d2d712fbd..b83312cb70ba 100644
--- a/arch/arm64/kernel/probes/simulate-insn.c
+++ b/arch/arm64/kernel/probes/simulate-insn.c
@@ -200,5 +200,6 @@ simulate_ldrsw_literal(u32 opcode, long addr, struct pt_regs *regs)
 void __kprobes
 simulate_nop(u32 opcode, long addr, struct pt_regs *regs)
 {
+	/* Also used as BTI simulator: both just advance PC by one insn. */
 	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
 }
-- 
2.34.1


