Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E4E9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzJN+64IcS+RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=; b=XxnqvqUUq/+p3S
	fwt5yBYO0+UaSPQCxixhkuydCE77XxKLK2egleTyUg2nYi3NuxVkRM6XNCjPu8vLn8akGyl4/apJa
	pa8iJXnV0D4RewE6j+b+DzgVVeR/UMEDg+66sJZcloIX6yoIL2uSI9BBG5f/iCaP6NDFtgi6OaPz9
	L4Sz/0DsgTq9I6MrujR+lX2YHp8+oawsOMYosPYVQByIOIZVSUaJKyLoyGPNv1nBc46zHhTo3w5v9
	wpSeO8394WSvn/oFoOZSku7N9T2DJCPOGD34pp5ZVcjXQGphBKcYILHiLfZtMwBrsbIY90NdvCTvs
	IbuCZAIJ/Vx0l9KbUhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0uT-0000000Cktb-2yqY;
	Mon, 02 Mar 2026 10:53:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0uR-0000000CktC-0hoC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:53:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227thth057664
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zzJN+64IcS+
	RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=; b=BjIwmnOF5xH6xDd6eec+v1itiva
	8gnAHGqfa7HB9TOX23fumeeEu7x9LkhVITQSlqnTzVPwZhgi865T2adIbcCQ8gg2
	bvk32JfgLwmqX91mz2TDszeV38RhsWqdEHu/AOQhXN4AmRBt2ETskS1bzH42BbA1
	aAFCksAcoSFF1j+cqLERlkHmKDgYDlnXfabpW3vdg7X+sXeD+H7Ov21JBjOdlulX
	zvh65MAyoFtH3xuMmv9A1ZQu+A1RIedG+mivrSd1Me1g7w7pRDmqRz4FKwpnbvMG
	VpwrEs/ZkhQ6OrTjKbC3obKp738lJL9YzF6NclqAHaioIGHQP8FHq8EZx6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64a23p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:53:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70ea2f7d1bso2830775a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448834; x=1773053634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzJN+64IcS+RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=;
        b=jD71UE5GTFTXJQ83ubl3H6di72n24GiJ3h/ULd7q07L8IJ8ic+6tSyRGDWgDD8VHMB
         mKxGa/dXLywj93VdJZqE6LjlehzCylcN+oKGG6iU7zDztWglXcFP9IstZ9Q+EvtApZio
         2PZHPfglKKaSi+sEzmqmlKaqFy0hbBoJJMVbqaeuVU5qy5k+kfsTKL/TIytXW9G/6L8o
         1txRurl5Pshju31N9zUR0W29+MLzgBX/B3DIY4Q7k2flh68i0WP+yIBfdoTWCRFWHBQe
         s4Z1zYKmwbthCuAPVD3QMZ7zjlZ2hHqdLBSE44W65Zgc3UE5ynnH9O8F00pg3H80Ad8q
         cxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448834; x=1773053634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zzJN+64IcS+RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=;
        b=R/3iCNm1l5Pue8z5wTQCA24GBdfyrewbnbD/C24CT8lV+xhFBPpVLr/D6lyp6UtXoc
         jbcbmG8Ixo66nzKxLg0nslL7PMs6SbMhnzIW5aZ0YRZy7RvdtZlHvozWXO1flWCEDdfR
         oAD1gG4XNkTUEmOHRwhvRr2Kt8Ee3aSziej+VfY8lX+3oVFz/7TQo3UtaVHTtdHzK+CI
         jy2NP0/25MJhURGzhzaJQHB47naOdgTamh+z2sW0VM+1nDZGEMR9C+oMtbVyGSXK8uK4
         W0hOmddnB1JyOyWG/eVPtlEuX2MOifXK3uLsetPAFyq1hBs7Al46ID0H2v13u/mAVpvs
         6EWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVamV1Qi8zw3PCnY0a8HFmNCahlp+57HXzxJLvoJeDbiP6c7VnWwrdsqUkZmdaojWOfUWRruIBKeThe37Tz2kLO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz848YpEPricpfyLO5WiqYkbEO2ADDl9EXx15CLUnscucYn9Cub
	yU7lr/MnIlpnlCrkGgFq2RCQVGlwZifEb+aN+8QT3H2SHrnGRN4tdtW3vJgIxmBRSpdmYf/fL/+
	fWjtHjif8XeCTOaxqYuKXq73zkBMeaaJr2LPMr5uBMSdAOgB2ncbC1Pv10vRjOOWqUcsG3PCz81
	Ap8A==
X-Gm-Gg: ATEYQzwxnyDXLkSOujsFeb4+F27PehiS5+hRIjfxbl/IPs4Hh3QvHYXuozkCL66UsGS
	aHGMnY5gZRToVGOUEC6sQ8a4QMCw9E3Hd1VdLfZdcXTyWLBvfuu0/aB4fSVcu8MELn6VHrNXJ9J
	4eFUbxmLRy34aw+c+YTdXseO9ogyFk6gIpNbUJzojRi87KkONjx1jyMWpCS3obmCMVRZTOb60uH
	FF7vR/KOZaxA67l0+eoBUg9XCvjViI0+UD/0R7zafqD+YJCSGVjv/jps0QzweQaytBcyk41Zx9B
	dRH4WALCMk/3uf56vH7pV7vLVF4NIzVsaF+ZMLwkkb/0GX2VrEaoVb6l8rLWgjfG31KZI6uQv1k
	ymnThynMZUM1Hz61tVewNzsS+fQCePGpS4S4vFcj2gAgWDbWponzQ
X-Received: by 2002:a05:6a20:d74a:b0:366:1880:7e06 with SMTP id adf61e73a8af0-395c372d14bmr10504458637.0.1772448833897;
        Mon, 02 Mar 2026 02:53:53 -0800 (PST)
X-Received: by 2002:a05:6a20:d74a:b0:366:1880:7e06 with SMTP id adf61e73a8af0-395c372d14bmr10504442637.0.1772448833428;
        Mon, 02 Mar 2026 02:53:53 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa632ddesm11847479a12.13.2026.03.02.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:52 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Subject: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during
Date: Mon,  2 Mar 2026 16:23:46 +0530
Message-Id: <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C5RtxqyQSiAbqLa6N5UCG9XSo7ItqVAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX4OwFl+bubJK5
 ETU0rE6bkWlXsz7rV2r2wesQpCRWnWWQBCwuYGrlajWinm4HGE0VNu55Yly261AO2eWBoxUu2EK
 Z1XZA6/Ic96AoKB3Z/tgO+a3huUQ/ZFYjpzKU3/R7T1ESGYC+Moj6FZHLwy/b0H+LKglFUuUN7r
 FyGzz9u8TOXO95zoqs/8Rc+NGDqVjcikr700iciDRT5VTZAPxg23TT3CPBqHt+uQqiMQ+OQrYXI
 f7k0yLeSN69oYK1hRuMHrRIg1aB/K0erUeDxy2uawElNz26XDK44O+USOEFp0ROL3iRhMnSXGjK
 MDkLbmvcNpf2z6vqpquY5y4K0ZxK4ie8MShDrKEvY/s/q95f+tVz3s2bdQ4IX/UaBD+T3GCOJ3K
 lBF2cOOjmu8vIvfUnI7QYruFKAZ5GhHVR7dS96sDS363OeMjRjMTtctc0CyR4qKuzI8ntPGTAc6
 VWiYI6qahqPG0szqTMQ==
X-Proofpoint-ORIG-GUID: C5RtxqyQSiAbqLa6N5UCG9XSo7ItqVAV
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a56c42 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BfyKfM7flnzB51c3jB0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025355_211951_7F87BF16 
X-CRM114-Status: GOOD (  12.46  )
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

This patch fixes a kprobes failure observed due to lost current_kprobe
on arm64 during kretprobe entry handling under interrupt load.

v1 attempted to address this by simulating BTI instructions as NOPs and 
v2 attempted to address this by disabling preemption across the
out-of-line (XOL) execution window. Further analysis showed that this
hypothesis was incorrect: the failure is not caused by scheduling or
preemption during XOL.

The actual root cause is re-entrant invocation of kprobe_busy_begin()
from an active kprobe context. On arm64, IRQs are re-enabled before
invoking kprobe handlers, allowing an interrupt during kretprobe
entry_handler to trigger kprobe_flush_task(), which calls
kprobe_busy_begin/end and corrupts current_kprobe and kprobe_status.

[ 2280.630526] Call trace:
[ 2280.633044]  dump_backtrace+0x104/0x14c
[ 2280.636985]  show_stack+0x20/0x30
[ 2280.640390]  dump_stack_lvl+0x58/0x74
[ 2280.644154]  dump_stack+0x20/0x30
[ 2280.647562]  kprobe_busy_begin+0xec/0xf0
[ 2280.651593]  kprobe_flush_task+0x2c/0x60
[ 2280.655624]  delayed_put_task_struct+0x2c/0x124
[ 2280.660282]  rcu_core+0x56c/0x984
[ 2280.663695]  rcu_core_si+0x18/0x28
[ 2280.667189]  handle_softirqs+0x160/0x30c
[ 2280.671220]  __do_softirq+0x1c/0x2c
[ 2280.674807]  ____do_softirq+0x18/0x28
[ 2280.678569]  call_on_irq_stack+0x48/0x88
[ 2280.682599]  do_softirq_own_stack+0x24/0x34
[ 2280.686900]  irq_exit_rcu+0x5c/0xbc
[ 2280.690489]  el1_interrupt+0x40/0x60
[ 2280.694167]  el1h_64_irq_handler+0x20/0x30
[ 2280.698372]  el1h_64_irq+0x64/0x68
[ 2280.701872]  _raw_spin_unlock_irq+0x14/0x54
[ 2280.706173]  dwc3_msm_notify_event+0x6e8/0xbe8
[ 2280.710743]  entry_dwc3_gadget_pullup+0x3c/0x6c
[ 2280.715393]  pre_handler_kretprobe+0x1cc/0x304
[ 2280.719956]  kprobe_breakpoint_handler+0x1b0/0x388
[ 2280.724878]  brk_handler+0x8c/0x128
[ 2280.728464]  do_debug_exception+0x94/0x120
[ 2280.732670]  el1_dbg+0x60/0x7c
[ 2280.735815]  el1h_64_sync_handler+0x48/0xb8
[ 2280.740114]  el1h_64_sync+0x64/0x68
[ 2280.743701]  dwc3_gadget_pullup+0x0/0x124
[ 2280.747827]  soft_connect_store+0xb4/0x15c
[ 2280.752031]  dev_attr_store+0x20/0x38
[ 2280.755798]  sysfs_kf_write+0x44/0x5c
[ 2280.759564]  kernfs_fop_write_iter+0xf4/0x198
[ 2280.764033]  vfs_write+0x1d0/0x2b0
[ 2280.767529]  ksys_write+0x80/0xf0
[ 2280.770940]  __arm64_sys_write+0x24/0x34
[ 2280.774974]  invoke_syscall+0x54/0x118
[ 2280.778822]  el0_svc_common+0xb4/0xe8
[ 2280.782587]  do_el0_svc+0x24/0x34
[ 2280.785999]  el0_svc+0x40/0xa4
[ 2280.789140]  el0t_64_sync_handler+0x8c/0x108
[ 2280.793526]  el0t_64_sync+0x198/0x19c

This v3 patch makes kprobe_busy_begin/end re-entrant safe by preserving
the active kprobe state using a per-CPU depth counter and saved state.
The detailed failure analysis and justification are included in the
commit message.

Changes since v2:
  - Dropped the scheduling/preemption-based approach.
  - Identified the re-entrant kprobe_busy_begin() root cause.
  - Fixed kprobe_busy_begin/end to preserve active kprobe state.
  - Link to v2: https://lore.kernel.org/all/20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com/

Khaja Hussain Shaik Khaji (1):
  kernel: kprobes: fix cur_kprobe corruption during re-entrant
    kprobe_busy_begin() calls

 kernel/kprobes.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.34.1


