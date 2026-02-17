Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB42CE909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGeXF8euT1K6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=; b=pUUuhbGNPO7YuH
	7MTe1aTqrO811FER/HHQ4JOqmgPL5hQ3AznsSTRQYHqdzm0pWi6tFIr906WYxQ9mq6FIRI05YJbCN
	GYd+qTbDhPwwsmMnSM6CWAMDYKZymmFeIo0DmS+SrpypRUgweR/S/G9yDoVFFiCZ1XWSeqfBugRow
	runXaib993mdcgiIwxMqGGU207e2Jj7PMQuvSTFxSO9WIWHR+pF4LE3A4i4T0bJ8wcY+f5o1hUDB0
	0uwnYPj7H7zHdW2xcvufZcQvTRALv+xEgcPQ/F+M+icaZdd6iAR/L3gUUP3a1sx3+zMCWsyLDwbKB
	rUQnCcz0KIFPrYwtcmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLIE-00000008LBw-37KR;
	Tue, 17 Feb 2026 13:39:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLIB-00000008LAY-2IKn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:39:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6WBxu3394098
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 13:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JGeXF8euT1K
	6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=; b=YmxroiUIkoGb4NbOS24CuIcoyAr
	twSF5KCIlgS4SuqwpbaX1RM37JQ19xsleByINu5aj60mMXaUHZz3dFq4gv2R7KDB
	HTyaSeGrPQ8d3M0RXT0E4v/1vIWcH0awp5Lh0NY4bRUAcQcTCet/N61xm/7tMHYR
	plzNDey2D2uGqSDxeOC9Rv1ACePn0kbApCO2+T0J4ycjtO0yZJ2uUDb+uVNAQWwR
	SzaDW9rrdd+lfo3Qpe9Y9q5mPe6i+JIJSdk7KkLBgp9/h14JPYUJuTuq6B97S87m
	Db/Daq7Q6ljlun9ctcGcsJxZubuBvbiSnNmHr52o4UM7XTKIz9OJW+65/gw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khaq0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 13:39:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8243a06b397so2080196b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 05:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335546; x=1771940346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGeXF8euT1K6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=;
        b=UFqaoZ4tzdYCJ6DjWoNoLaMwMIhi/xbQm6bIbQILshOZiIvF47FngSHdL18Iil51bO
         UstepXeUptx2HDVaGwqpiNRPRLAzZIfWX9PaoAnuPVmcxFqQhyUbArxvRcv6RWaNxbmy
         dP3bRvBUYWC8soU6qojtDDagu/zX5j0PfQh4ReDkrIqapudXH+pcHGlQMTF939PgpwxS
         cY16OBRwGIWyz05y7njLqRn7AUKvEIQyGfjqRca/FreewuCBQL9VOb8hJp/FzNfKSdo+
         1fU//9tTaLa1CabCX2fLlZJqkq2aZTx7vRwo6KQljGadpa5B3sEnqcEajHCbXbPzoGDn
         6owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335546; x=1771940346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGeXF8euT1K6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=;
        b=ZQrj74gW8JH4rMROCb4jSySNVA0s5DWg4mBwNFSRm6itH3kyhuFg8U+CEPEBaJNuyD
         SVDBIWJSq5h5bggOdXMuhE0n/gmpYlz0MekbCGVBIagXvO7rO998nMuzhUxjl2tnIwip
         ilVTGsrpshOxCHFPZeCnSj4QcY/aLf4QCD1lh0TqovRh73+sBX2X+fyPFOyfXzRHB0hC
         z3SKZFCxtWsMeIhdAKJ4zkC05Vc2ywxUDNERmUnnmb2MVcDijydetLdrP3ec9MBN3BvL
         Fe+YoarRPJN9e31auylhFpni+hNie47Y3NLU88WJx4XljKuA1w8puLLvFMvhbon8+xHt
         5XHA==
X-Gm-Message-State: AOJu0Yzach7W3HMM1mJtNAiTkbXUOFmnGgwIhuKHtQ53ptn7qeB9RcYT
	wmrfh7oXbiz1JpCrzeL6sZhgxSIzGACdmdLSj7iWzhGCckmGOVC4UvzaV49uEmXA9cf37pPpZfj
	VRahCDks9Lp7Vx9FTqnosMhIcICWn9yiBFkw3dn/oC+8F3N9zTScbcGzwaXpS0xDcdgSnZv2x5A
	ySWDclMPG7IA==
X-Gm-Gg: AZuq6aJHEv70NjeOGbEyNv82q1J6kllz9whn834me8Xx3dG89063uanyv6j37y/k0EN
	YJPRoZCkGXYXFobVFTm3gEHUCD5ADq1kjUBy4FspA/epMT6ht37odA+TaRiWsLhlzhvqXxe9dmW
	aC7lrVq9U4isC7kqtJk6nDdsEjcTsUB18iNoCWA6YHJytYUGNFUVy3k62Kbq40Ym1mOHLwG3WiT
	FuCgr6xDV6Brxn5cmPEoLl6V9ZQDOrOF04LRvam7ZTSZXNsy+/fv0LKrQWh3QOsnSsthDFL3fvq
	3XeKvO4HNJBidXkoHPA2h+mexf0KDlCaizGN3x8IaUP8To6QntGEXYHKmUXOGEPL3k1y/pqgIku
	CEdKHW61/Iv6JRoyqaMq5RiOYwc6O6ILEcobkP12/NQrKoyJ96TMH
X-Received: by 2002:a05:6a00:1c96:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-824c963f32dmr11294306b3a.38.1771335546054;
        Tue, 17 Feb 2026 05:39:06 -0800 (PST)
X-Received: by 2002:a05:6a00:1c96:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-824c963f32dmr11294291b3a.38.1771335545559;
        Tue, 17 Feb 2026 05:39:05 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b935c6sm14633207b3a.47.2026.02.17.05.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:39:05 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL single-step
Date: Tue, 17 Feb 2026 19:08:54 +0530
Message-Id: <20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69946f7a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=lireVsuIo57cRQcYBF4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Cjjq3gY6qFPdeqoAmXqU-XsUTVK1amKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfX0ycVM5wDna/6
 4Gf7ZgMkypgiGIgniegqLkPz/dNndNnt1JR+2Au6gjc0X/MXBhzt5tZUd4MT75ITZXouE1cmLwl
 xIWVQJIA8Up5wSYlksXi3DlCEist9hggnke/et3r32CAsE+YUzMISH27uZORvnBNAoaZWIZXJWF
 nXm6I6kDOeUtRbKsoYsD6mfo/0BvJGNM1T4z2g8M5cRIcR0LWvqtxIhKjkHBTtIcz4f8wQf9c5L
 r+9YZ0r/lARite1ORZqbBKGZjPDCw/e/4u7jCf9JANDjHWL/mBxhdDPzeX4ZiUJ0z9fhUwhJn9g
 2HEoyaj0b8sSu4smvoXIufH6fJ+GykwmJO0oFjUSW9LUBOtcjCFSXP5UyXvNqqVA+sPlc18DW4U
 2aTE/sdqUnYzJ/B7T5tDC1asDZoWlnwwpNah7B+KVtuclwAK0MMbVxVbP75m9iTv7FHKVURLGmN
 fedeEhatdx+3v1eP+ZA==
X-Proofpoint-ORIG-GUID: Cjjq3gY6qFPdeqoAmXqU-XsUTVK1amKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053907_590958_DBC035D5 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, linux-arm-msm@vger.kernel.org, will@kernel.org, mhiramat@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On arm64, non-emulatable kprobes instructions execute out-of-line (XOL)
after returning from the initial debug exception. The XOL instruction
runs in normal kernel context, while kprobe state is maintained per-CPU.

If the task is preempted or migrates during the XOL window, the subsequent
SS-BRK exception may be handled on a different CPU, corrupting per-CPU
kprobe state and preventing correct recovery.

Disable preemption across the XOL instruction and re-enable it in the
SS-BRK handler to prevent migration until control returns to the kprobe
handler.

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 43a0361a8bf0..d8a70c456543 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -227,6 +227,14 @@ static void __kprobes setup_singlestep(struct kprobe *p,
 
 		kprobes_save_local_irqflag(kcb, regs);
 		instruction_pointer_set(regs, slot);
+
+		/*
+		 * Disable preemption across the out-of-line (XOL) instruction.
+		 * The XOL instruction executes in normal kernel context and
+		 * kprobe state is per-CPU.
+		 */
+		preempt_disable();
+
 	} else {
 		/* insn simulation */
 		arch_simulate_insn(p, regs);
@@ -363,6 +371,11 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
 		kprobes_restore_local_irqflag(kcb, regs);
 		post_kprobe_handler(cur, kcb, regs);
 
+		/*
+		 * Re-enable preemption after completing the XOL instruction.
+		 */
+		preempt_enable_no_resched();
+
 		return DBG_HOOK_HANDLED;
 	}
 
-- 
2.34.1


