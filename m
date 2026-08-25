Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EEFC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+zmB4FaBxQwRnntc4G0vf4U+IcSlAlvto72WrWto68=; b=c2HofwqlbgiiWD5Y0uWAKzVYIH
	CfUmH59ZVsyIPnhSNPhZGfx1AGQljSqVZeFYu76N333hQZUA53y5Y2Me+XNqn4JMzQtjSBjR/uDCF
	3keFI5BtWsZ2l6t5AhjGuQkUDSpCOW4WkUIbMEpCjhluL955WKnsI7aTkb+jHfwkoL5ztrYBe3CTC
	7rcko92fOBa+ABS3yGVAb+d+VCwG9ZWoId2R9yxB2fvmdBhJkpMtsdqJmTFjVCKjIqQywVFqePwUO
	PiUkJ5flO9RDgxyJ3y9x1eNNyCHnaJ2qkmRqOMmH/MSOO/oeiN8e3EJ3rsHyJIKLXkH+Kle8mwDjK
	NxPRBeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynPI-00000000UJv-0mR0;
	Tue, 25 Aug 2026 09:25:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynPF-00000000UIk-2CzS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:25:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88PNv196240
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M+zmB4FaBxQwRnntc4G0vf
	4U+IcSlAlvto72WrWto68=; b=TsjMiogKQTLeqCIy9ijYWYZxjByT/yky3VbR9s
	iFriS8DCHasxY6yx2+bYvzcUovO/5GfGUEZTYj31dIO7kcSqOJpk1jlyuiEpR2AO
	OZZUNbK1iziFoVzQotZWVtUatDZ7tTGbvRWRKyTNtMm1eZbT5KIOKEIMg+gfaYLM
	14EoM9StPukICt4D6YkElgXehVG8GRD89FrBwxT/FQEPSlgWOOKP9/tmtmZ33lRL
	Jj+M0j1xZB4Ki0T81M0oRKK4jg9NsYMRkB/lbWf4SKB9L/IXGZV1kf30iXJQYPnb
	xT3oXpSXLQLYtcQX6ldBqwYu2eq27FHSRfxn6dgWowvneZGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvh59b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 09:25:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4f6ac06aso83645281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787649920; x=1788254720; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M+zmB4FaBxQwRnntc4G0vf4U+IcSlAlvto72WrWto68=;
        b=Z3PsqEBCwH8TTXWlUlxYD6+P65pv9nTWcsxhNrmLfrAqecem9M4D2G0qtcbrP1sZVV
         4Wo3qpmCxGWc1PaKhbf4iONW/pzva5qTX1NRjomZ7uzxhPWlJbFAtgq2ptl8r7kKNEjj
         dxR9qTs2iJOIEzi506JMIIdv124iNNrVVBfJqXuGCcJX8DPVPYyEQNduUYyUIiCf5TOg
         XohKEPJKjiczCOzIJd5EWo1xeX8dnotl+7tnflCFlekMsyvZrcHTqnRsHC6mOoP2NZ63
         ICcSuz7j7FQOm2uFp5NcjjIJ73bUZzkUmb7S4pXEK3z3fBabYl5xJYsqcRerN2O30D+6
         gWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649920; x=1788254720;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M+zmB4FaBxQwRnntc4G0vf4U+IcSlAlvto72WrWto68=;
        b=ezE1TpSaGBoYkrS8wbgp5LOSY0b3/Xgj6GsmIEKCaCwksSS4a35U0z0WwHsae8ioYj
         QyDnQj16BO7uu6HRYeIOdUMoCHzMYYFYasL3WJrmrBykhGaTlU+hEJOyu752cuD6Ye9t
         JXA+H//kaY6FTlYpRnJhrrFQWXjrRLNljLvn15UKgELSm5bSjdCTpGxoS4dsIxVc+L8q
         gnq10xSNFyuI32tlg37x7BVREj18/oQ8PlfOklOLXu/eUcc7uaf8GSD5j+aiHFJf+8Ws
         Moq0us/wEorRk19cQdEzoD+BFCNpsoWB9xKr3HfPDFddhJAvLjW6YgnBi9VBzBeKv2T9
         3lkg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4dXQ0512dyu1SeuG1WGMyZGTkr/4SnweZ0hr2ojYEBjfSACLIGEW2M2R/fQzOIv7NQeH4/L8y1O/8MwBADBxR@lists.infradead.org
X-Gm-Message-State: AFuF++kYKLVIbvjX+NzFn09wjmj4yu3BL5C2rE2jjGJ0Ha/PZX6giOB7
	+QAS4TXccaQIYgsWODpnJEFh8YL5rCqkagkfWMXg2MB+yd83MeyrW5EO8d0zuJWe+paXnQmK+GX
	FpSm4HfbgYsyAkyz9ggdoxXlHcm1gVroA0I0gxS07ncFM2gPksEHc68SpRR9cTRi/A5aETirTuO
	ol1w==
X-Gm-Gg: AR+sD12ECEuV+JveePgSDWJCe9qIgg2CL1E1/qXcoSfL1w77UqaXZri8PmLjagBplAJ
	BylBhLUYvUZfjjSOfPgekgqujJnvEMQhyTsIYY4wDC8thHwwdPqo4WoM5j0mRUZBNUNXoM7b0HF
	o+ll08wene9lh2XBILivm2UvCK0Z1i+ZhVymny+qMtFAJIBS/oOWAmbpQOQyVcSIa1UKtgnhhG6
	dci8D10J7JJcyT6uHlixPF9x8TEZzD9FW6MHP4Zrn+epPPxI7THg8dGuPHxuz1v2zDXcaY/Yd9L
	UZzp2GIayO8GYAc+xGYRF/YcfXUT7DoJOeN91EHNvQSNb2t7FxZb/3DSr/lPreUC/zKJPTxGkPd
	3lwLAvPe5i+RQoA==
X-Received: by 2002:ac8:5cce:0:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-52e2f05e946mr60063441cf.9.1787649919767;
        Tue, 25 Aug 2026 02:25:19 -0700 (PDT)
X-Received: by 2002:ac8:5cce:0:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-52e2f05e946mr60063151cf.9.1787649919356;
        Tue, 25 Aug 2026 02:25:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1781846466b.39.2026.08.25.02.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:24:57 +0200
Subject: [PATCH net] net: stmmac: re-apply taprio offload in
 __stmmac_open()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBAF0KuUWTuQBK3Fq4iLsf3VAZuGmSBK6
 d0NLt/mbeQwhdOl28jwVtc1N8RDR+NT8gOsUzOlkPowpCN7XRYZGV7ZIKW8vixzhfFakDkOcTo
 HiSfce2pHMcz6+f9Xyqh02/cfrBRr1HQAAAA=
X-Change-ID: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3OSBTYWx0ZWRfXwDCSyJhLrt4q
 WYlY3Y09Ef1sdZGYnSLmARlokkVnLMRPr+f/5bqV6zEDakW7oZmuGkw7Nl8piNj0u8nW0GyKdHV
 pCCa54BRr9sOtljmZj0FgYtNVKON4LU=
X-Proofpoint-GUID: Nw81Xx-L6zhPB0qtjIhVUHVwyiyuo53t
X-Proofpoint-ORIG-GUID: Nw81Xx-L6zhPB0qtjIhVUHVwyiyuo53t
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d5f80 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JpBpa1p7AAAA:8 a=koEEtHZmf8gcZ7dLqiUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=YCh05so4W2E6r1tszMC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3OSBTYWx0ZWRfX5FeFhgoeUf5B
 IlpJbVHAA5hZ1u7V+Oz7QLTgYhSJ7q8w6T7mwOesp7k8U8za6A3U0RWDZ1zKAqAyevGpwF28rl4
 Dcl/+TNXlPEy4DaxowQ2o0SwV85S1OIDkl0BKWVYraHRLCLYjl7bam/aLdSSPKjGtHgWHmmUJpH
 A/Zyqd6ckP7+TiQHda8HG8xYTIlynCRLkG1W7W1+yMwGmhmpCzb7TmP6uPwXbSoOog4It3lKun2
 4d1W4IfFJIHQCwo6eQB5NlZt89rRUtqvCGZ1qj16tOZOiy2M7LYS7x2D+FBPI7UyUcZSwrBgpm2
 nHJZLkRYH6c8blRfBfvGFXgSnDQ7RhsCgJEtr3siH6CDF9z7TCfDl5xYkcMFbwJlsw+fU2TqOsZ
 flZKQlTelKZzRnSPB4NWCqOU3OaraG7lMzUHLxqUt7M1t6JzDaxAfTOLPWLU+7FhMGsOtKfAx0+
 5ZKzf01HwaTxkMllaTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_022521_762903_70AB000D 
X-CRM114-Status: GOOD (  20.28  )
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

The core soft reset issued in stmmac_init_dma_engine() clears the
MTL_EST registers, but nothing re-applies the taprio offload after it:
priv->est->enable stays true while the hardware EST block is left
disabled. The TX/XDP paths then keep dropping frames larger than
priv->est->max_sdu[] and taprio is reported as offloaded, although the
EST block is not programmed.

Re-apply the taprio offload in __stmmac_open() after PTP is up. The
base time is recomputed from the reserved base time and the current PTP
time, since the timestamp counter has been re-initialized and the
previously programmed base time is stale.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 28 +++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 26 ++-------------------
 4 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index afc516059b89..594f61c07dbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -80,6 +80,34 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	return 0;
 }
 
+void stmmac_est_reconfigure(struct stmmac_priv *priv)
+{
+	struct timespec64 current_time, time;
+	ktime_t current_time_ns, basetime;
+	u64 cycle_time;
+
+	mutex_lock(&priv->est_lock);
+
+	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+	current_time_ns = timespec64_to_ktime(current_time);
+
+	time.tv_nsec = priv->est->btr_reserve[0];
+	time.tv_sec = priv->est->btr_reserve[1];
+	basetime = timespec64_to_ktime(time);
+
+	cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC + priv->est->ctr[0];
+
+	time = stmmac_calc_tas_basetime(basetime, current_time_ns, cycle_time);
+	priv->est->btr[0] = (u32)time.tv_nsec;
+	priv->est->btr[1] = (u32)time.tv_sec;
+
+	if (stmmac_est_configure(priv, priv, priv->est,
+				 priv->plat->clk_ptp_rate))
+		netdev_err(priv->dev, "failed to re-configure EST\n");
+
+	mutex_unlock(&priv->est_lock);
+}
+
 static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index f70221c9c84a..fcbee673f2e7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -65,3 +65,5 @@
 #define EST_GCL_DATA			0x00000034
 
 extern const struct stmmac_est_ops dwmac510_est_ops;
+
+void stmmac_est_reconfigure(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efa35cfecc4f..d71d430519d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -48,6 +48,7 @@
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_pcs.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
@@ -4158,6 +4159,12 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_setup_ptp(priv);
 
+	/* The core soft reset in stmmac_hw_setup() clears the MTL_EST
+	 * registers, so re-apply the taprio offload after PTP is up.
+	 */
+	if (priv->est && priv->est->enable)
+		stmmac_est_reconfigure(priv);
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 960249960004..3682c9d3f3ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -8,6 +8,7 @@
   Author: Rayagond Kokatanur <rayagond@vayavyalabs.com>
 *******************************************************************************/
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_ptp.h"
 
 #define PTP_SAFE_TIME_OFFSET_NS	500000
@@ -55,7 +56,6 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	u32 quotient, reminder;
 	int neg_adj = 0;
 	bool xmac, est_rst = false;
-	int ret;
 
 	xmac = dwmac_is_xmac(priv->plat->core_type);
 
@@ -84,30 +84,8 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 
 	/* Calculate new basetime and re-configured EST after PTP time adjust. */
 	if (est_rst) {
-		struct timespec64 current_time, time;
-		ktime_t current_time_ns, basetime;
-		u64 cycle_time;
-
-		mutex_lock(&priv->est_lock);
-		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
-		current_time_ns = timespec64_to_ktime(current_time);
-		time.tv_nsec = priv->est->btr_reserve[0];
-		time.tv_sec = priv->est->btr_reserve[1];
-		basetime = timespec64_to_ktime(time);
-		cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC +
-			     priv->est->ctr[0];
-		time = stmmac_calc_tas_basetime(basetime,
-						current_time_ns,
-						cycle_time);
-
-		priv->est->btr[0] = (u32)time.tv_nsec;
-		priv->est->btr[1] = (u32)time.tv_sec;
 		priv->est->enable = true;
-		ret = stmmac_est_configure(priv, priv, priv->est,
-					   priv->plat->clk_ptp_rate);
-		mutex_unlock(&priv->est_lock);
-		if (ret)
-			netdev_err(priv->dev, "failed to configure EST\n");
+		stmmac_est_reconfigure(priv);
 	}
 
 	return 0;

---
base-commit: 2db9bfa3e27bdea15e05ea70b56bad3d21e570ec
change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


