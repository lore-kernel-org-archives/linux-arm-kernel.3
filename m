Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005B8CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=; b=Nkl2Faxj86qBauZd0bTDtHzGIs
	dHtRF3Y9f1I7CWgM3rB136HiF5850ygfTj3GptYEMldiQyAFsJ8QAU93pC0WFCAwgdKwgb1dZ5ToN
	tAba1JEOcMxTvGA364z0ZubT6hddPSDhTveo+oMom2qLmOpUd73xR3FtuVh/o4NzTuzxPMGkB2cIg
	IKZQmJ0X7VLD8jzEM4uPTBnskTx9TTQ7ssWfpEAh1ksPFyJhayBuBXzOrdh71GZ9lEm04Byy2biDr
	eNjDU/dYD5gnvptyYT7lbTKzl9OjxDWhX4yuC8Bau93q480PVh0epguk8Z7/z3tJyO6nfNNltQV9k
	Iy2j2CZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC9-0000000HMQZ-2zts;
	Thu, 15 Oct 2026 09:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC3-0000000HMMr-3N6w
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 09:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=; b=bJFIpIhVhHa2nmmta0rL/Hw5Lq
	sICbGb7nbQzxPqc7jzHhhI0sTdlbO3qfbx0sDxQnol03BvnJz+JdvvOv3YfD2G03j9n165JQbFeDB
	0F32OaVSuxKvqRWPzxExpFZhgtdPhtMryhSzlW6E/G4PLuMPx8c0QvpIhXOqzsWZALkXt4DoA7xpg
	zguvBimgYrtknTwBuU9VsUltuSCXjcw9n6A4KQeVnz5U0zPabO0ybTZdZWQbAmNqadgbIrNcGazK5
	a4FscyWY9+0CB5JA6vOA5GOk38kgluIJiz3O2pGmM1CgR4uTFuVFdhLFJbSHRgTM9ootamjzLUzAS
	UdTeCuFw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHIBz-00000000Csx-3jvR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:56:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jjZ84011195
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=; b=blua1wJyskUE9aDu
	6Wkw6hJHlOpQDAZjLHqFHFUHNnXRIW68/uomFBF4Z2SKiZmoSsFD28QgywRb1i0+
	UqpIeHeZl2j9G0CT5BceWNC7u/FJhF0sr23bOp/5KRnuy74y2f6sCADtPVbxJsgG
	KgPhJqb1fimZd22j+NRgWln2w5Iow14WsPK2Urwz2YnHTAQY8hugHS1EZr1Mq6g3
	C9atO64wmr5GZIdW7vBWQ+CHuvaUqGyhL67aEK/6oKaPk7awCEU0y+3WSlmz7ENl
	TVhwYnLsNekQKWeeOgFdlgwJWPGXf0N3c7JJtjMwlZYv1tUrOLKxV2tCzjIR+NNi
	AWshKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbtqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2846034eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058161; x=1792662961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=;
        b=Oo0HTguvL4Yy6fBXfFdrW2QU7lteD06JvmC3GIfnPrVcEP95mbBT9xwJjT9CK7Jfx8
         46VOmKpmOq4L79oKP/6VThLLoW4fJDsg0FjTOI1qo0J8+4uYAGONSLjdVk7d/TGvoVI8
         +2x17Voz02soKfdBebaUg96jEZcjshtvYZCIaea2yAwgWx0H+qgrooN3VmiE3OH2iOsP
         jp8KllVyVHZTcDAHudEKaFwTVDaGDBrDW8qFStzcEfZXxdApMvmEqckvMFFdm4IuwhPf
         KP6IWygTNZschdG0n41jbn3KnUnjvR37J9UlRmk7s394cyx+SivDHhkZyrHAwMYMvXKq
         ivOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058161; x=1792662961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUmQTR6lwBIwnjIcjM1zEG8u2gKmX8BLsKfyQzN3LJc=;
        b=pVbVk8tJJ5/M79a3jfTq2a0NfrSQvgI5yCx86HjhU7xzAtbq6K9JT3pvz/q/LSccKX
         mOl8cL0jPIjNOgBvfPvSmkx9rKgDB1dZAvGsqn4twbPjXQliYcsvvUweSWihW2a5vUWC
         QLgN0RojFM5Ida4jHeVjBDgyqxlHYQJKgBRZLzqmFU1pa50q1U9A1KEJTb8tPRr6NfI2
         qL1YTu9/MnOs3C1itiNu6T19Iitpw7FXX8QJO7kJUtWo/OCnWCCYayxCwespFuP9+6LY
         mbhUOYTZ5rYNw4A4iR+JVr0B1L3oKAbav/zM90fgE/fKeAGYO414sq/YekvhRgzz/EGT
         BYtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzopyxoRI3yIJeQ3prZw/2KKnxf13a4fOS32n4BKUxq7Vc0N3yrtciOCOBQBy+c3GDr0kmWFquj1vCDQ3mepgi@lists.infradead.org
X-Gm-Message-State: AFq9FYLA3eEpjtM3/fZqlihmKIztcKRRkuB5o0QIv7S2ExtwDw4QPmSn
	5Gicgb8df5PVa/r48GkdN/T4yJx9YVuIDjsJItofGNNydBAmoXa50MUeuo/bBqw+s3BS5YxD7CU
	fR96Mvub9sdO0k6M5J0QYS7T8paUE6d0EkTIrosxchfeiwxXyWfVs3yVLFd6laTOmUvtEpTqmFc
	fyDg==
X-Gm-Gg: AYBFou3URiRBN4aM7j2B9RCsBUilM7djVGscAqVjEVDottDEtU3OmLzJkTXF2pAXcBq
	bu1hrDiZVYJAzsvT/jeYnUNaRNrwzja3bkb+6bk85WZ0c5LgjmmfIiTXD/ZWFfwxNP9nIj3w3jK
	AWW2bAT5pN/1QUOuRFPkxEum8YfMuG80/xcBEpx11ahGsNtKdRv9rd2gEQrMHd9DQQ8R9pLUClI
	pXvEMgBLp7+eZLWuLcSPFdLqlSTS1vZfoRDiBwGPnORvtL64zGQyYwevvX4ZDQp+oEqyxWuzB+/
	rIsHabPmEETc9OyPUPk90FqZ9w4l/KgOsbXF00+VADnh0kSN2AiIgEsMcq7YqVQlzKVSbCv8RrN
	U3P+oVRH+1c+3JxPTGaF5cX0Y7Vyi
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr26058171c88.24.1792058160467;
        Thu, 15 Oct 2026 02:56:00 -0700 (PDT)
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr26058129c88.24.1792058159798;
        Thu, 15 Oct 2026 02:55:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:59 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:21 +0530
Subject: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=3139;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ddTk5W/Dgf9uQMox4V4cADmLiLzDP3X5xdF/lqgMBBo=;
 b=4XxGEjopfau9sU91leKRlgFafePgslxZ12LQUuUfx5w3HExM0EKN9aLTJ4cSnIvbEx5SdjcPj
 ccxsce6xJLTCJCvmy0a8sOWvZOolY/xp0q23mRU7gpZCkm9qsZpEGOd
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: 0BPb0QONXjiQp8092f4RhbjmFVc1gVWg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+G/K5o1v1R3M
 PkKQ4hppwJJ9Wtk7TnuYoCjmFjtQLi31ieysl2T9NpUROGcd8ALfXJ28U8yzJJGDcLw6j9C0Mwc
 wDUX21sY4L+I7+gr5/9aZ4BiESFGRcw=
X-Proofpoint-GUID: 0BPb0QONXjiQp8092f4RhbjmFVc1gVWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXw3Jwr9qIUehd
 uAla2sc0D8Vbzj/7rL15CpbUK9EoC2ykdk3lbxAMJhZFLzrzInCG8zTuGZqO8dKdmv8jhpV9RfB
 ibG0CgiDJUsaneflVMG4JuZjmEPSWiKAY/kT4/DajoGlQifgKmn2Aaa3eTC4hWC2K+kbTwjHL3H
 0AFPrqp2BoE/C0TmL9F6lraRiDEisBPZUHULMRgNxbaAk9uIA587Kv5WDR4dP7Qt5LBD5S8xEXE
 hkh0TyHWva9I4rgGugc92vNi0tSRs0ToyJO6B5KGtoWvwibCprfG8BV9LBBVPfnfTjNJm/cAg7W
 1ZGwqDb96prQqR52o7VEDohyMYh8tavLfvHxp3wPahFLWroTaH5SdI96WaJvEiRfQ6dKQgPMVHK
 5G/oQCuRnky+vIWVmayQcvmdbOhBY3QjS2JFb1u1dE3LUiHnZZBzeVgm2V21FiIhqowh9pIP+ZA
 H70oVGV7Xs9ZGTaB5SQ==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad0a333 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=x0-aiICezeCXQbOhsWAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_105608_541100_8F152D5A 
X-CRM114-Status: GOOD (  24.69  )
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

The next wakeup timer value needs to be set in MPM timer as the arch timer
interrupt can not wakeup the SoC if after the deepest CPUidle states the
SoC also enters deepest low power state.

To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
timer and the Resource Power Manager (RPM processor) takes care of setting
the timer in HW.

Add MPM timer programming when CPU cluster enters power collapse.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 0de6ce818a506efc07913b16c479b5d5efb15108..676c45acd2716f474d474b1eb2feb61451404968 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/ktime.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -23,6 +24,8 @@
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 
+#include <clocksource/arm_arch_timer.h>
+
 /*
  * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
  * which is commonly found on Qualcomm SoCs built on the RPM architecture.
@@ -82,6 +85,7 @@ struct mpm_gic_map {
 };
 
 struct qcom_mpm_priv {
+	struct device *dev;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	struct mbox_client mbox_client;
@@ -312,6 +316,36 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
+{
+	ktime_t now, wakeup = KTIME_MAX;
+	u64 wakeup_us, wakeup_cycles = ~0;
+	u32 lo, hi;
+
+	/* Set highest time when system (timekeeping) is suspended */
+	if (system_state == SYSTEM_SUSPEND)
+		goto exit;
+
+	/* Find the relative wakeup in kernel time scale */
+	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
+
+	/* Find the relative wakeup in kernel time scale */
+	now = ktime_get();
+	wakeup = ktime_sub(wakeup, now);
+	wakeup_us = ktime_to_us(wakeup);
+
+	/* Convert the wakeup to arch timer scale */
+	wakeup_cycles = USECS_TO_CYCLES(wakeup_us);
+	wakeup_cycles += arch_timer_read_counter();
+
+exit:
+	lo = wakeup_cycles;
+	hi = wakeup_cycles >> 32;
+
+	qcom_mpm_write(priv, MPM_REG_TIMER, 0, lo);
+	qcom_mpm_write(priv, MPM_REG_TIMER, 1, hi);
+}
+
 static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
 	int i, ret;
@@ -324,6 +358,7 @@ static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	mpm_write_next_wakeup(priv);
 	mbox_client_txdone(priv->mbox_chan, 0);
 	return 0;
 }
@@ -399,6 +434,8 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = &pdev->dev;
+
 	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
 	if (ret) {
 		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);

-- 
2.34.1


