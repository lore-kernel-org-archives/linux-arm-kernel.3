Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20777C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng3FijRp7I12WAwMSQi0FE70hZNC0tRMMCgODOQaLkM=; b=x/5bEJI9c0juknZQbAQfMzs3eo
	GMsI+zgzg6XFojCl0NMGyjMhZyJNZnrdzwMEMnk9cGAnCK8einIlbEsFlOOBqPb0FZzTL0HwS2FjL
	rdtnGYE7EEBXvPt8qWggvjSyH38noO6IUqUFHy5HMfWvDvA3u4QlwfannBwRzvh/X5K8yqb9wNAG+
	2PXgqxySt13Xi9O+hfm/TUwo2w2ebrSkkVcXC1Nz3O1d8W4tpB7YRbBDq49LHXxffasmnohOvNCD5
	rCy/5JK1b+ghv9dy5/lTSbMdLKolYcC5jZuY9L6Sk88wPD88joRiB7IdLrFZWwK/2rJvqVW9NuBpp
	WcpBHyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzng-00000006TOk-260d;
	Mon, 17 Aug 2026 16:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznd-00000006TMa-3sYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:02:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYpoV2666299
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 16:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ng3FijRp7I1
	2WAwMSQi0FE70hZNC0tRMMCgODOQaLkM=; b=nPT/5c0uXgYWQ9t8JF3j0jpaaTf
	Eb7og9Oga/oxdL6IfdKfPu5yciI7otrPoHl1xd6otFTPyGSp+aACdQtnvSDv+GCt
	TeD4ha2YxLM2WB7DwpRG6Vl1nwNONGRPgruSbnx3iChie3TKnKLeLp12a8DVhXLf
	9X3XL0cbTuHwqNDVRdh6THPvSr7b1uelRWd4hqGnC40fbB3+8sRPQpbCbMpRIuGY
	jW0pfH5us1PnmGsVpr9GsGWvNjhk7ISAlHe5e+09WCavuC8jmsixEjDdH6yJzcan
	wDyUq1F1dMpDoVatDSp1h6W9oVJ4u2aYCRpHvTX0ViU5QJftYBfgCq3guTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghtgnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 16:02:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso40808b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982576; x=1787587376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ng3FijRp7I12WAwMSQi0FE70hZNC0tRMMCgODOQaLkM=;
        b=GlKlH/AKWtcJLSubax1XKyvMR79A8u9gwEVSyIpg23zecy+6Mq60D82/bkuBc+G6Ii
         1C8AAbExNer3QsrmIMrV9nhwG2NWBzEo/wrQuW5xIVlgjZBZ1niPTZw3E4SMsB/6/JlJ
         to15/oXvWypK9U6YKyTL81ji6dzmDQd5k6kh6jLQPejLxPhA6wGWnNJX7hHupiTDrL0/
         GkVmNG97UfbwinJ1s+bVz/j2lpj/zDS4TQjYSmA8f8RI38JAbIAbH+B5AUpaxMzuqySE
         R/TeXs5xxG5bd5OVbEM8saYJ7ZcLCcfI7KtsecqfAuSZTQHi64kfSf2ipj55EYu2WMdb
         mqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982576; x=1787587376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ng3FijRp7I12WAwMSQi0FE70hZNC0tRMMCgODOQaLkM=;
        b=INlMz3yGi2BWXI291B+6nUfJqRdrKdrroZoApQJliEtoLl5MRukSeCR3WbkCV/NtLv
         CHovIgyMUd0uhEQH4OfBwjsrbMdkt6zCBFqr81vdzMJt1ppjWX+eCXIlx9VrRfHpRvOU
         DIZMapRN3loyGQ++HnjSEMxvXAcu2VYmjaxFuHeyilL+WbIltatr4VKzLQPCQjXj+vR8
         1iISOWpEc16CKAnZ/wRF9MEoVff70P0CQpwhj/CPU3XWTYqbIec9FNxGgQqFGG9BRDWW
         bZ/oyrQg9m8Ug102QOovcfkzXMl+M8IVnviWZbKomheenUHeE/N4TlR38G4SyCdCjNqf
         FCng==
X-Forwarded-Encrypted: i=1; AHgh+Rqu3fDZaX6JFYoSa+PybyPEkwjmal1zjOZ05LXuGc9hbpCwLAbJsOa+HWmKI6o+obTTN+psCzeYaZYKuxIQDySV@lists.infradead.org
X-Gm-Message-State: AOJu0YxeU+E55nCh4TDdN6g+G6qBFruzzwOCvgXX1o6uo+6EGP6NbXWR
	YRG7hNnfcQelryiURZY6nnArYBzH5rgoUSkVW/G1YcVxRJ8TOJMnlES2cKhq8VSjn6vKxqsZrWF
	oZGG0CAQVt6Q0yABT+LZbHUWU86NB/CFFh2iwNLU+40UEsKxDzbdFRCiD2v8x0YJ2TK2+Z62gQz
	n1nw==
X-Gm-Gg: AR+sD10+ObFoLuz0rmySQlx/cpr4+LitF6Rf1NhLnt0a898cnNrBXRMcsYbCN992SPy
	5YErMA0bBVLM7OYKwImFBISLe89FOINiaPfXNDuxdLqSOadUci/3EiE216aeuiczZEAiVTgfj+X
	w8INafb2LebFHoRIe363V4R60VUJ34qQzICe51mR9E5zTkwUBPacWXpDldg3REaeTPcUzpZxCzw
	cbJTxNjdAE9e5opMNahsiGyi5TwtIT3f0pKCAYpOUq+rOfbqg+UP34rktzBilUEC23w2uSz+1Mw
	ph8xrbiyxx21k6C5OCYAW6sJeujz84UmleE8m1LQoQG5k4wkVW4T7DBZQM2o+l6qQUo+GHIL9as
	gN+kJTq6ltUHrevxoWwk1MQMjm8msS7N+yAoGGpY6rsm26VC33ijEND2YzYfTlD0pKk/rWoT5sc
	4Krr7vK31v1Ihnqgc9ifQ8AQX3zA==
X-Received: by 2002:a05:6a00:330f:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-851bc233c3amr156036b3a.3.1786982575537;
        Mon, 17 Aug 2026 09:02:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:330f:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-851bc233c3amr155973b3a.3.1786982574962;
        Mon, 17 Aug 2026 09:02:54 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:53 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] perf/riscv: Use Sspesa for precise sample attribution
Date: Mon, 17 Aug 2026 21:32:19 +0530
Message-ID: <20260817160222.3313295-4-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a8330b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7H5guYdma6xEYB3B6BcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXy+3jK5pmOyVT
 0ihx7FVOsaNqh9EHpZuGihVaxcXkafwVX3YvnQsG3IQ0CBU+r2lCW5UbHZBikLCwbEgMNx2fVxy
 Gf1188q3gAmVTWcrZnHbMUFcfXpl0Pg=
X-Proofpoint-ORIG-GUID: 69DNd7BT-VDvIapoX2yJgVeh-QjTYiZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX9gzd9fu0a3qo
 DXiwtDM8sUNimQPc27lgsdduBmTxXZlRtU7/eH5RcxdJYD20rRdZjD3iEf5vSOsHqpMb17en3X5
 5ze8RTBzBSEpd/TfdJ3G+cUL6jIVPXhFQMMoQx47imPp9In6AGJk5yDGpMLqg51tPhW+HWvwlP8
 s9aUpcj8UANAEQ12VZj7uVOljeOPtD05cpXiZMYW6+TAer+cZzIIBKR9wEagxHawQq4K3lMF956
 4Tt1M+7qoQVoYwTR2DzkQGZ+jNdz98Tt7Bvy9cuFoi63cNGNcQEFMksNQMShoN1KPKrWs/ryF+z
 hKlXrlkmVgD3qhg10oRyaam8EiDhJ/L7RZeuoqgqOm/cX5SzzaVQm84tIMaMP7EtFdQBfJGXWXz
 8GpcC/0olUWeN/o/ZvQ/nhWTQ08b2lNBsTSPJjEVwwlIAQul3JfFTwRipGkP3TbAXQ6Yvgsnv3B
 BOXjtPemvlx6GtdZ60g==
X-Proofpoint-GUID: 69DNd7BT-VDvIapoX2yJgVeh-QjTYiZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090258_087294_AE940D90 
X-CRM114-Status: GOOD (  19.63  )
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

When the Sspesa (Precise Event Sample Attribution) extension is
available and a counter overflows, the hardware records a sample PC in
shpmspc register and the counter ID and additional implementation-defined
data in shpmsdata register.

In the SBI PMU overflow handler, use shpmspc to report sample PC via
PERF_SAMPLE_IP for the counter that caused the overflow. Shpmsdata is
exported as raw data to userspace when events request PERF_SAMPLE_RAW
sample type and it assists in deriving the sample PC from shpmspc if
precise attribution is not supported for the event.

If sspesa is not available or for counters that don't match
shpmsdata.CNTRID, fallback to epc for PERF_SAMPLE_IP.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/perf/riscv_pmu_sbi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dfc886dee5ad..1b0b1cc612de 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,8 @@ PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
 static bool sbi_v3_available;
+static bool sspesa_available;
+
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1051,6 +1053,11 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
+	unsigned long sample_pc = 0;
+	unsigned long sample_data = 0;
+	int sample_cntrid = -1;
+	u64 raw_sample;
+	struct perf_raw_record raw = { 0 };
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
@@ -1088,6 +1095,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		return IRQ_NONE;
 
 	regs = get_irq_regs();
+	/*
+	 * Sspesa records the PC and metadata of the overflowing counter in
+	 * hardware. The PC is precise only for events that support precise
+	 * attribution; otherwise it is best-effort.
+	 */
+	if (sspesa_available) {
+		sample_pc = csr_read(CSR_SHPMSPC);
+		sample_data = csr_read(CSR_SHPMSDATA);
+		sample_cntrid = sample_data & SHPMSDATA_CNTRID;
+	}
 
 	for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
 		struct perf_event *event = cpu_hw_evt->events[lidx];
@@ -1123,6 +1140,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		riscv_pmu_event_update(event);
 		hw_evt->state |= PERF_HES_UPTODATE;
 		perf_sample_data_init(&data, 0, hw_evt->last_period);
+		if (sspesa_available && hidx == sample_cntrid) {
+			data.ip = sample_pc;
+			data.sample_flags |= PERF_SAMPLE_IP;
+
+			raw_sample = sample_data;
+			raw.frag.size = sizeof(raw_sample);
+			raw.frag.data = &raw_sample;
+			perf_sample_save_raw_data(&data, event, &raw);
+		}
 		if (riscv_pmu_event_set_period(event)) {
 			/*
 			 * Unlike other ISAs, RISC-V don't have to disable interrupts
@@ -1194,6 +1220,9 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
 	struct irq_domain *domain = NULL;
 
+	if (riscv_isa_extension_available(NULL, SSPESA))
+		sspesa_available = true;
+
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		riscv_pmu_irq_num = RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-- 
2.43.0


