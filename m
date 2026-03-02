Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191FFE9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/JhN9/z48dDFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=; b=NLF+FC0eE7NrT8
	8rP8O6c6TxgNQ/YUv3kLgp8kB2SnrzgZPlIIWobwKARYI9rzTqti4ARqYTDQ0O+y/ZYC75+xwMQup
	UC4kwQV8J6F5Tn0FZ9T6WC7vP2hu6AxSJbU6Cg5RMhmZPlC5Xm0tKt3Q/Yd9cg46pSyTK/WVvjFjp
	YE3ojAi50DjCQT7I0DypNe0GT2U2qcM34E1H2Z6qfptNac7Rva8lSY3G8qnyiVZ7Rrn2Q9Yz0M0mj
	1yHOInIOMb6+0V4efHF3KQg90rgrI5oNmUgmCro8WUqasXTUUTb9ORbrlBm8csAgpkzqNaIIp8DmF
	T1iGhVlP0z5j99HoUThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0uY-0000000Ckv4-0IWm;
	Mon, 02 Mar 2026 10:54:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0uV-0000000Cku4-3jS4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:54:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EwmO3630910
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 10:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p/JhN9/z48d
	DFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=; b=YfIASNqYoGkQomrtKy/8g3fHjez
	ZaAj2H97xT6UjfB9cD3Fnp0GzMXuJ5Iv80IkNwePX+xWYaMUSQVhP/BLSxNVY1AR
	gtUVxS78x6jYsF8GLaa05Nkv6ED/9nVME8qA1C8lSICmfDKRaii8dQ6ObXd0JN6y
	gn9/hq+bd6Hbs1YUKhXHB7k137xtlfNmppim4u7wS4Inw8RcjQ+hrqx9N4fWE//G
	XScS2rVnBaiKWDHhDMhsM8uDUqezutrID84NUnJQvtXbN6TMhlcEAPq9j71m02Fz
	XU4Qjj8GhrCsepVPNdXC/J8aUmZiswYN8cDcSj9OUtEpDXaIpC/wWebedtA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrbg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:53:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3598ab49242so572423a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448838; x=1773053638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/JhN9/z48dDFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=;
        b=Qeeo2+ySALiXSEB3t7qOWLO9XbJyFpz4WPQUCzvtuSwrUOWpRziEtmSjRqeLR3qoTn
         anhOlhBsbl+PN29SjHvZO1LMEhoMbQHINqvtNQfNntzp5ksUKHhL2mR1IQR1Xn61AxXs
         S8bAGuftWoV14iKEmzCbc83RThtSlngl7/xp3WBHMhyoNiRTWJGn6J7Vm/TiETDfdr0N
         4KTyLJTcwPkbahhqoExYvSOl1qgPk4+k8TtHWeH1VDG1+pXbaCYb+Q5Mv1VbEYqZDT4V
         r2r+Qo9xO2KttQdl0b8nucxKj9jvF0SibOeyg1D04QmZNBxWGYGrxo0QRHxAR/HDCSPQ
         eoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448838; x=1773053638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/JhN9/z48dDFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=;
        b=cJGu4mySHJvDZg0pniG4yWwoe8OmEeMT1yBQyBfzkn32DB6Bu/Ix+fc/nU5b/ZTyl9
         OgDUsUJ5lKLIDxHl3cKQoYXld3jqnXap6AIxPXjWS75pZFDANd7RDn6gBUDO5AEnjRqm
         X3wN+VUR+qSQ+VRzzR/P+KXuMFwNa8rMDvaThZYG/PmAOR5YblX9snSVJljTozj/rVib
         Limi4+1XxN1wkPHtY9L/SZ74RnkkdIqEHFsX3Khb8TyoOFxz/L3DBzNmpNCNbDWnY/E+
         q1/cwGiMDQGulV+Ki3nqU/XprHPKWuRXeIsZKj6Hic0cIbCWl0vtmlyYtycBBVTFZhus
         FBpw==
X-Forwarded-Encrypted: i=1; AJvYcCU7WObbbAjEEDsSsUNwCxEDWiuJKxRgi9qG0zQvh1QRRZFSADvHjKIt7C5YEOaBEwCzxisX02ZO3TmTwAHlvqnD@lists.infradead.org
X-Gm-Message-State: AOJu0YxKcf51V+kQ2oXn71yRa6zSKbJXBbVcMefaf00jp1a/W/Q1LSx/
	+khOOGRqO7wZAP88rXoitkhGARovmO5b4NsxGj16gMnF4Z8PbO8iR2whE7BR+Er5ZRolXBbtyOB
	INEeNYsBaihE6PRKFk6b+niWi+MXnLlbQVr/L7/s8qfM4kV1x61qkyjmZWvbe+adpXdacPfZ62q
	eiSg==
X-Gm-Gg: ATEYQzy+Cs/Oe6819JBoKClbolRTRoQDhcvxSo79V9mcMkOc30Y1FiMDnqLUovBGT6c
	5casQIcw5pS3YRKWjlKglbcuGvKDJobWc7WxzFodnRHq0zWuVekp3s0xidF4+FAvVYy3ACRYJIt
	5M5I1MlyPEGqfMDU7qStDfGvrlo5ZnYxmCQcL2oHcASOQCJm6NKgj/yjF2t9Q64Bo2LZBOu9f5W
	roy+3CgaJXyELZV5+c5KNJkUNWCMBZosXOVq5SDDQ7dbe4s21MziwxZKdfEkkRnQuu8KoinrxKx
	M/6Y+bj8jGX76dWjWiK084B/+goG2WbO5pQ3GtkooaHfllyxBnI9dRmX/eR2xJ3boWv61rW5mJ7
	3n9Go/iQJZclB0hRXUHN6jR+jXKGk7bMgPyS+zve+R5+5R4gk0USl
X-Received: by 2002:a05:6a20:3ca8:b0:364:33f7:7338 with SMTP id adf61e73a8af0-395c39de575mr9990035637.8.1772448837823;
        Mon, 02 Mar 2026 02:53:57 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca8:b0:364:33f7:7338 with SMTP id adf61e73a8af0-395c39de575mr9990008637.8.1772448837260;
        Mon, 02 Mar 2026 02:53:57 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa632ddesm11847479a12.13.2026.03.02.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:56 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Subject: [PATCH v3 1/1] kernel: kprobes: fix cur_kprobe corruption during re-entrant kprobe_busy_begin() calls
Date: Mon,  2 Mar 2026 16:23:47 +0530
Message-Id: <20260302105347.3602192-2-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EUoLRYZD8951YAUydD94jRB-aKd9TJaN
X-Proofpoint-GUID: EUoLRYZD8951YAUydD94jRB-aKd9TJaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX7WFUB/s/DQVs
 QSbv77qYTImPjt9BpWMRhdKaBzJ7y0ZFJNuij7AHHxXP4/pW9pq91JUhfEEXtD9a3pfrPs4mKMQ
 bdZu+2R+V4vcE2HsHTDUyr03E2FMid+f5clvmkFCEUktX2X7EYjhBnb7B2sh1aQhJYOmJ/84Ldx
 xcWIJGsfjiSPwuRGOg4zXE7wlabsdMGbK3AgS8sGVHRpdXHkwZQPiIi2tqCfJP3g0pWivXRU9oJ
 k+GU3a28JF3ccy2cQaqS62cAMJ+zj/DEwS/JZYNao5C5hS1nXo45p2lnqR4vaL60SqoYpi7r1G2
 z45KSF+XrLS97WVFj/NobshZ+fEPXtWF4sHDFHzGYAKE4HdEpf7VEZhZdW59T4HP9hhRspii66T
 E36mTJRDYBzoXD0+d5ZckpuCE7NpR3p3SQxp79tkIHCGNALfY5vNAmZDMIaQh7/UVMAnG922nAB
 25YbgFKq5fJm0OC5xqw==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a56c46 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7l7XfnHKCA38VmfCrlUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025400_052080_75A297FF 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: linux-arm-msm@vger.kernel.org, dev.jain@arm.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Fix cur_kprobe corruption that occurs when kprobe_busy_begin() is called
re-entrantly during an active kprobe handler.

Previously, kprobe_busy_begin() unconditionally overwrites current_kprobe
with &kprobe_busy, and kprobe_busy_end() writes NULL. This approach works
correctly when no kprobe is active but fails during re-entrant calls.

On arm64, arm64_enter_el1_dbg() re-enables IRQs before invoking kprobe
handlers. This allows an IRQ during kretprobe entry_handler to trigger
kprobe_flush_task() via softirq, which calls kprobe_busy_begin/end and
corrupts cur_kprobe.

Problem flow: kretprobe entry_handler -> IRQ -> softirq ->
kprobe_flush_task -> kprobe_busy_begin/end -> cur_kprobe corruption.

This corruption causes two issues:
1. NULL cur_kprobe in setup_singlestep leading to panic in single-step
handler
2. kprobe_status overwritten with HIT_ACTIVE during execute-out-of-line
window

Implement a per-CPU re-entrancy tracking mechanism with:
- A depth counter to track nested calls
- Saved state for current_kprobe and kprobe_status
- Save state on first entry, restore on final exit
- Increment depth counter for nested calls only

This approach maintains compatibility with existing callers as
save/restore of NULL is a no-op.

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 kernel/kprobes.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index e2cd01cf5968..47a4ae50ee6c 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -70,6 +70,15 @@ static bool kprobes_all_disarmed;
 static DEFINE_MUTEX(kprobe_mutex);
 static DEFINE_PER_CPU(struct kprobe *, kprobe_instance);
 
+/* Per-CPU re-entrancy state for kprobe_busy_begin/end.
+ * kprobe_busy_begin() may be called while a kprobe handler
+ * is active - e.g. kprobe_flush_task() via softirq during
+ * kretprobe entry_handler on arm64 where IRQs are re-enabled.
+ */
+static DEFINE_PER_CPU(int, kprobe_busy_depth);
+static DEFINE_PER_CPU(struct kprobe *, kprobe_busy_saved_current);
+static DEFINE_PER_CPU(unsigned long, kprobe_busy_saved_status);
+
 kprobe_opcode_t * __weak kprobe_lookup_name(const char *name,
 					unsigned int __unused)
 {
@@ -1307,14 +1316,31 @@ void kprobe_busy_begin(void)
 	struct kprobe_ctlblk *kcb;
 
 	preempt_disable();
-	__this_cpu_write(current_kprobe, &kprobe_busy);
-	kcb = get_kprobe_ctlblk();
-	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
+	if (__this_cpu_read(kprobe_busy_depth) == 0) {
+		kcb = get_kprobe_ctlblk();
+		__this_cpu_write(kprobe_busy_saved_current,
+				 __this_cpu_read(current_kprobe));
+		__this_cpu_write(kprobe_busy_saved_status,
+				 kcb->kprobe_status);
+		__this_cpu_write(current_kprobe, &kprobe_busy);
+		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
+	}
+	__this_cpu_inc(kprobe_busy_depth);
 }
 
 void kprobe_busy_end(void)
 {
-	__this_cpu_write(current_kprobe, NULL);
+	struct kprobe_ctlblk *kcb;
+
+	__this_cpu_dec(kprobe_busy_depth);
+
+	if (__this_cpu_read(kprobe_busy_depth) == 0) {
+		kcb = get_kprobe_ctlblk();
+		__this_cpu_write(current_kprobe,
+				 __this_cpu_read(kprobe_busy_saved_current));
+		kcb->kprobe_status =
+				__this_cpu_read(kprobe_busy_saved_status);
+	}
 	preempt_enable();
 }
 
-- 
2.34.1


