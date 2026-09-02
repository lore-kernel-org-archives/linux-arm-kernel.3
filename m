Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9050EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efI1FvVtE+b3ucJ7UkFRdJEgMJPTTh0ZxSFaMrEjJSM=; b=w/llOW6aTmiFuBDehBrp84AOWD
	fVEU7r4dHuqiLwd9uEgQRyNmk2d7UA5c8SbmKhwZdLGZBvFsUkBE/GW0HH+XdbaPT+gM3Zm+P/de/
	LgnlMR1V6ZbzGlcQSQeTvGIPlbPpf20o8Q0AsHMS8X8kt7sXWEKNWECl4LNY1Bu5Dx3YXiBvWZd0+
	RIPL9BF7mBwgajgLvoPPF4s5tXoYmjTJnqYMguLQ8YPEXjPOaHlic6uWQOIsIchUislIKQJ1lXOGH
	ITTfL6+cfpyRJ/dJ0VXlQMM0mf4oRGURfmHqZXh28HJYBx7yo2cdzZYGoQGDBwc8RhRpMTf4RDZNA
	GAxoGY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPM-0000000Fr1w-1BQT;
	Wed, 02 Sep 2026 20:18:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPD-0000000FquB-1rEK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:18:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHEnf1962830
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efI1FvVtE+b3ucJ7UkFRdJEgMJPTTh0ZxSFaMrEjJSM=; b=H7aZ0vC3hKr6fW4u
	a2QKtX1ydF6rUcEtnvzQ3p0SE+VcdllxtYSFcwb5+WvVdxF4aDyRVU8CA+JHOKuV
	+zaQc8oZZY58hN+R4TH2Zf7Yv7jK7nDHTkmftHwYiAGV3Z7uLX44WK5WXYEXxYTz
	5kEprpFr8VLmufVcG3TO1LI8aASfNOXGCgAPRxUSM4LEWp29r14EcsMJIRdbkBGN
	K23AjPRm59+WAMaw7pF+LluWVEsgday52WXPrkCO56E8YNirT18l5CF/GpmQGQHE
	HprT4AmO4YKVwxTsn1BibBg5PGM5NWPAXdPPNMcpPaQES2l1s7mgITbVlpunu+qE
	QEdieA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4srt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390ca1a9abso259844785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380278; x=1788985078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efI1FvVtE+b3ucJ7UkFRdJEgMJPTTh0ZxSFaMrEjJSM=;
        b=YXYR1V9OqJH7f64h7EKrPQS6uOpguVDBEXM58yokZ6FPDkVlMdYYoAaClV840oi7nH
         48b/mYmJxkzAXUPCLXXnXAilhwbhv86NUo25WE2Y5PePJjd6mYk8SpoXyMmyE09otl7Y
         DNg7DKw5lOZJlhqfDLALUHoY6/Fu9oHOVXJfjY59vkgWQg690QrtPWOcOxFuDLjKcDZk
         WVrG7Uw27eid8O/8nfUqObkFqiaq/WOOfoYNanV183yxEiT6G4wOJjZ+SUDVt0w4IxYj
         1fzk4+QnIcyW1Ulkde2/j6dGz3awRq+UYPZJoSO11hy9//jUsMa9+3WiaY/xlTTb55gM
         VLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380278; x=1788985078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efI1FvVtE+b3ucJ7UkFRdJEgMJPTTh0ZxSFaMrEjJSM=;
        b=VxTxd4YuWmFY7cwTntElsEd4Ql4AuIjdmLy5+7Yf8o9QbZLkYv6H2gKxzNiNhXLqp6
         RH7A4RzD3rflJFImr/E1DVEqXy6Uj0wK8NBXcqd0JgQFOqSHazWEcBTDFdyDIRR0gZ3L
         byvClQd8gJEXzD95D4pQRKYwJuyRO080CeA+gnXW5Lue9Y7CvjCvlsdJZ/5nf5jG4Zv7
         0zQyzMsZV66hhmEnAAT9N5qCp/MPNAv50nJ6OWP7dM/nWBoAivLCPLHnd+cP0qhMz535
         BJb+DKepD6Kk9GQkisTDJyL68YwTo07+bTTIpoGiw8Xkg6wowKLZ/OUFZubm1bNnzLq8
         8cOA==
X-Forwarded-Encrypted: i=1; AKwUvByFrmy84rnWM8TeuYrxmz4Ot7Pb/ruXaPxDxbZbvTWGLsnha5HBroaQbJn1/6N4MtzIXSphCbbHULhV+mFyQsnw@lists.infradead.org
X-Gm-Message-State: AFuF++kxhT+3HjfBulA0m6dC8cCMghgrvVQrxBfyVuIKaGT4PUouzLn+
	+tooM5AzOXC0rMI4PyRMmbe/L0Rb64pc8MLbY/9fUnRxJPnUg9yW5/Kdmr5wJZJUNkYvyeYUBlL
	PBIst4vRGtwFMLYOp+7UGszKx9X5s/s/Sr7h1SwZrB7AfIIgvKyLuK7ymiiXY1AluyQmTNUvdEA
	4TEA==
X-Gm-Gg: AYBFou19z7RJnh5dyold2qum0UxSfZNBJSF7u6R2wPHe5O5UOg3JYiQ/4VynNaXNXUO
	2rR5uwaWhgFq3Xw3xrqGFGspA5PTpWqUC2gxonblPOE3sPbMVgr71y1sqfAgXIldTz8ziySs0J0
	9JMY97NogkZ7hMKyREhSu4ds5J9ZqgkB7K9G6c+vI+ENbcJWXTm4lE9skTWUDmjZDcCcZ+F4uqJ
	hGKcRs2emuGPt2TxWOhPeAQO05D8QWcF2koahcFYx8o/6jyoChFXjAZBrT0i4YXLGDzQRVFazP/
	xfFqma/xapCe2OkxXLcMhhDOSiRXIHgjtPn8fwJK/YOQtygPW1Hd1DiB5/VWmMoJ897UwLw5agX
	Hy1SIYe1CSaSkiQ==
X-Received: by 2002:a05:620a:ec4:b0:939:6df9:6547 with SMTP id af79cd13be357-9396df968e6mr148813985a.51.1788380277343;
        Wed, 02 Sep 2026 13:17:57 -0700 (PDT)
X-Received: by 2002:a05:620a:ec4:b0:939:6df9:6547 with SMTP id af79cd13be357-9396df968e6mr148808485a.51.1788380276690;
        Wed, 02 Sep 2026 13:17:56 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d9db2sm16618865e9.8.2026.09.02.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:55 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 22:15:44 +0200
Subject: [PATCH net v3 4/4] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-stmmac-est-reapply-after-open-v3-4-e72a6df5a7ef@oss.qualcomm.com>
References: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
In-Reply-To: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4BZFrSUjGtH5
 czThou33ZQBtRwZ7qgHNJvlKqVMYXoTS16tjcupHUw9+QwdFVLMdRB/CZFaADZwZqlnUkLZ+tWx
 ycTm6GyrkYDDv2YgW8ER/Y9Mu/mLLAd/dhAthL6u9DH8B80xD1+xi3zmaxx/9bOOoUmqhou/JRf
 51L44ZuT+JisxuRS5JtChT1rhaZN6voOOgXqGrHY9kVRveqQZ67dcVtvzSR/GCUO+E12IfgRWSO
 g5Mww5uccEp+LoduUNcyey2adA2p3gJV3ombeTf8nDfrmz0LGyhoZgkMzBQ6xZXsN9nNtf9IZIo
 0pkt4Ob84+AixSluHYJOmo4NvJDByXcOYn634mjB6FAswMgmoR04z1NtQrIHVrEotyh6bkDykOk
 TTL01wnV5hbnYHDJKfbmvimrlYjx7mzdWx0mvcSELIO6wUvlOl7R0hIBeBAbaakKW6d8gvU1wHc
 lUcTSTE4fOEx2ivypAg==
X-Proofpoint-ORIG-GUID: NqPHaFYUBVkV3jorp57sVDai9VvepPKH
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988476 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=JpBpa1p7AAAA:8 a=DNwXZpNFxi9TDD9oO0cA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=YCh05so4W2E6r1tszMC6:22
X-Proofpoint-GUID: NqPHaFYUBVkV3jorp57sVDai9VvepPKH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX8ItBveYQQIe+
 xNlYKSzOXOb82O6PJDXAeKbNDUGgc/AbA5o7F5cmjAP/1Fyo+R03vqu4JZzHwv2WN01LBoa/W8m
 riDbxB7Ihy83CIgQ3rC7pXRY4XWWo58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131759_695207_148D8E4F 
X-CRM114-Status: GOOD (  26.87  )
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
priv->est.enable stays true while the hardware EST block is left
disabled. The TX/XDP paths then keep dropping frames larger than
priv->est.max_sdu[] and taprio is reported as offloaded, although the
EST block is not programmed.

Re-apply the taprio offload in __stmmac_open() and stmmac_resume()
after PTP is up. The base time is recomputed from the reserved base
time and the current PTP time, since the timestamp counter has been
re-initialized and the previously programmed base time is stale.
Introduce the stmmac_setup_est utility routine.

While at it, make the EST enable state transition atomic with the
hardware programming: pass the desired enable state explicitly to
est_configure() and hold est_lock across the whole configure sequence
in tc_taprio_configure(), so that the software enable flag and the
hardware state transition atomically. Moreover, priv->est.enable is
only set once the hardware has been programmed successfully, and any
failure path disables EST before returning. This also fixes the stale
HW schedule left behind when a REPLACE fails validation, since priv->est
is no longer wiped before the new schedule is known to be valid.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  30 +++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  35 ++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 101 ++++++++++++----------
 5 files changed, 116 insertions(+), 76 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index f15d4d046aa7..49edfebbc39e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -80,6 +80,36 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	return 0;
 }
 
+int __stmmac_setup_est(struct stmmac_priv *priv)
+{
+	struct timespec64 current_time, time;
+	ktime_t current_time_ns, basetime;
+	u64 cycle_time;
+	int err;
+
+	lockdep_assert_held(&priv->est_lock);
+
+	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+	current_time_ns = timespec64_to_ktime(current_time);
+
+	time.tv_nsec = priv->est.btr_reserve[0];
+	time.tv_sec = priv->est.btr_reserve[1];
+	basetime = timespec64_to_ktime(time);
+
+	cycle_time = (u64)priv->est.ctr[1] * NSEC_PER_SEC + priv->est.ctr[0];
+
+	time = stmmac_calc_tas_basetime(basetime, current_time_ns, cycle_time);
+	priv->est.btr[0] = (u32)time.tv_nsec;
+	priv->est.btr[1] = (u32)time.tv_sec;
+
+	err = stmmac_est_configure(priv, priv, &priv->est,
+				   priv->plat->clk_ptp_rate, true);
+	if (err)
+		netdev_err(priv->dev, "failed to re-configure EST\n");
+
+	return err;
+}
+
 static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index f70221c9c84a..b4d1a1f04f10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -65,3 +65,16 @@
 #define EST_GCL_DATA			0x00000034
 
 extern const struct stmmac_est_ops dwmac510_est_ops;
+
+int __stmmac_setup_est(struct stmmac_priv *priv);
+static inline int stmmac_setup_est(struct stmmac_priv *priv)
+{
+	int ret = 0;
+
+	mutex_lock(&priv->est_lock);
+	if (priv->est.enable)
+		ret = __stmmac_setup_est(priv);
+	mutex_unlock(&priv->est_lock);
+
+	return ret;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a9fb15bdda43..c4d353948347 100644
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
@@ -4168,6 +4169,13 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret)
 		goto ptp_error;
 
+	/* The core soft reset in stmmac_hw_setup() clears the MTL_EST
+	 * registers, so re-apply the taprio offload after PTP is up.
+	 */
+	ret = stmmac_setup_est(priv);
+	if (ret < 0)
+		goto est_error;
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
@@ -4189,6 +4197,7 @@ static int __stmmac_open(struct net_device *dev,
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
+est_error:
 	stmmac_release_ptp(priv);
 ptp_error:
 	stmmac_stop_all_dma(priv);
@@ -8336,6 +8345,10 @@ int stmmac_resume(struct device *dev)
 	if (ret)
 		goto error_stop_dma;
 
+	ret = stmmac_setup_est(priv);
+	if (ret < 0)
+		goto error_stop_dma;
+
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 4869827670c8..8f3a90df3178 100644
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
 
@@ -69,46 +69,21 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	nsec = reminder;
 
 	/* If EST is enabled, disabled it before adjust ptp time. */
+	mutex_lock(&priv->est_lock);
 	if (priv->est.enable) {
 		est_rst = true;
-		mutex_lock(&priv->est_lock);
-		priv->est.enable = false;
 		stmmac_est_configure(priv, priv, &priv->est,
 				     priv->plat->clk_ptp_rate, false);
-		mutex_unlock(&priv->est_lock);
 	}
+	mutex_unlock(&priv->est_lock);
 
 	write_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
 	write_unlock_irqrestore(&priv->ptp_lock, flags);
 
 	/* Calculate new basetime and re-configured EST after PTP time adjust. */
-	if (est_rst) {
-		struct timespec64 current_time, time;
-		ktime_t current_time_ns, basetime;
-		u64 cycle_time;
-
-		mutex_lock(&priv->est_lock);
-		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
-		current_time_ns = timespec64_to_ktime(current_time);
-		time.tv_nsec = priv->est.btr_reserve[0];
-		time.tv_sec = priv->est.btr_reserve[1];
-		basetime = timespec64_to_ktime(time);
-		cycle_time = (u64)priv->est.ctr[1] * NSEC_PER_SEC +
-			     priv->est.ctr[0];
-		time = stmmac_calc_tas_basetime(basetime,
-						current_time_ns,
-						cycle_time);
-
-		priv->est.btr[0] = (u32)time.tv_nsec;
-		priv->est.btr[1] = (u32)time.tv_sec;
-		priv->est.enable = true;
-		ret = stmmac_est_configure(priv, priv, &priv->est,
-					   priv->plat->clk_ptp_rate, true);
-		mutex_unlock(&priv->est_lock);
-		if (ret)
-			netdev_err(priv->dev, "failed to configure EST\n");
-	}
+	if (est_rst)
+		stmmac_setup_est(priv);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index be48bcabdadc..9745c9bae33c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -10,6 +10,7 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 
 static void tc_fill_all_pass_entry(struct stmmac_tc_entry *entry)
 {
@@ -968,10 +969,10 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct netlink_ext_ack *extack = qopt->mqprio.extack;
-	struct timespec64 time, current_time, qopt_time;
-	ktime_t current_time_ns;
+	u64 ctr = qopt->cycle_time;
+	struct timespec64 time;
+	u32 *gcl = NULL;
 	int i, ret = 0;
-	u64 ctr;
 
 	if (qopt->base_time < 0)
 		return -ERANGE;
@@ -979,6 +980,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (!priv->dma_cap.estsel)
 		return -EOPNOTSUPP;
 
+	if (ctr > (u64)U32_MAX * NSEC_PER_SEC)
+		return -ERANGE;
+
 	switch (wid) {
 	case 0x1:
 		wid = 16;
@@ -1013,35 +1017,45 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
+	mutex_lock(&priv->est_lock);
+
 	if (qopt->cmd == TAPRIO_CMD_DESTROY)
 		goto disable;
 
-	if (qopt->num_entries > dep)
-		return -EINVAL;
-	if (!qopt->cycle_time)
-		return -ERANGE;
-	if (qopt->cycle_time_extension >= BIT(wid + 7))
-		return -ERANGE;
+	if (qopt->num_entries > dep) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
-	mutex_lock(&priv->est_lock);
-	memset(&priv->est, 0, sizeof(priv->est));
-	mutex_unlock(&priv->est_lock);
+	if (!qopt->cycle_time) {
+		ret = -ERANGE;
+		goto unlock;
+	}
 
-	size = qopt->num_entries;
+	if (qopt->cycle_time_extension >= BIT(wid + 7)) {
+		ret = -ERANGE;
+		goto unlock;
+	}
 
-	mutex_lock(&priv->est_lock);
-	priv->est.gcl_size = size;
-	priv->est.enable = qopt->cmd == TAPRIO_CMD_REPLACE;
-	mutex_unlock(&priv->est_lock);
+	gcl = kzalloc(sizeof(*gcl) * EST_GCL, GFP_KERNEL);
+	if (!gcl) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
 
+	size = qopt->num_entries;
 	for (i = 0; i < size; i++) {
 		s64 delta_ns = qopt->entries[i].interval;
 		u32 gates = qopt->entries[i].gate_mask;
 
-		if (delta_ns > GENMASK(wid - 1, 0))
-			return -ERANGE;
-		if (gates > GENMASK(31 - wid, 0))
-			return -ERANGE;
+		if (delta_ns > GENMASK(wid - 1, 0)) {
+			ret = -ERANGE;
+			goto free_gcl;
+		}
+		if (gates > GENMASK(31 - wid, 0)) {
+			ret = -ERANGE;
+			goto free_gcl;
+		}
 
 		switch (qopt->entries[i].command) {
 		case TC_TAPRIO_CMD_SET_GATES:
@@ -1053,51 +1067,44 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			gates &= ~BIT(0);
 			break;
 		default:
-			return -EOPNOTSUPP;
+			ret = -EOPNOTSUPP;
+			goto free_gcl;
 		}
 
-		priv->est.gcl[i] = delta_ns | (gates << wid);
+		gcl[i] = delta_ns | (gates << wid);
 	}
 
-	mutex_lock(&priv->est_lock);
-	/* Adjust for real system time */
-	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
-	current_time_ns = timespec64_to_ktime(current_time);
-	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
-					qopt->cycle_time);
-
-	priv->est.btr[0] = (u32)time.tv_nsec;
-	priv->est.btr[1] = (u32)time.tv_sec;
+	memset(&priv->est, 0, sizeof(priv->est));
+	memcpy(priv->est.gcl, gcl, sizeof(priv->est.gcl));
+	priv->est.gcl_size = size;
 
-	qopt_time = ktime_to_timespec64(qopt->base_time);
-	priv->est.btr_reserve[0] = (u32)qopt_time.tv_nsec;
-	priv->est.btr_reserve[1] = (u32)qopt_time.tv_sec;
+	time = ktime_to_timespec64(qopt->base_time);
+	priv->est.btr_reserve[0] = (u32)time.tv_nsec;
+	priv->est.btr_reserve[1] = (u32)time.tv_sec;
 
-	ctr = qopt->cycle_time;
 	priv->est.ctr[0] = do_div(ctr, NSEC_PER_SEC);
 	priv->est.ctr[1] = (u32)ctr;
 
 	priv->est.ter = qopt->cycle_time_extension;
-
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	ret = stmmac_est_configure(priv, priv, &priv->est,
-				   priv->plat->clk_ptp_rate, true);
-	mutex_unlock(&priv->est_lock);
-	if (ret) {
-		netdev_err(priv->dev, "failed to configure EST\n");
+	ret = __stmmac_setup_est(priv);
+	if (ret)
 		goto disable;
-	}
 
 	ret = stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
 					      qopt->mqprio.preemptible_tcs);
 	if (ret)
 		goto disable;
 
+	priv->est.enable = true;
+	kfree(gcl);
+
+	mutex_unlock(&priv->est_lock);
+
 	return 0;
 
 disable:
-	mutex_lock(&priv->est_lock);
 	priv->est.enable = false;
 	stmmac_est_configure(priv, priv, &priv->est,
 			     priv->plat->clk_ptp_rate, false);
@@ -1107,9 +1114,11 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		priv->xstats.mtl_est_txq_hlbf[i] = 0;
 		priv->xstats.mtl_est_txq_hlbs[i] = 0;
 	}
-	mutex_unlock(&priv->est_lock);
-
 	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+free_gcl:
+	kfree(gcl);
+unlock:
+	mutex_unlock(&priv->est_lock);
 
 	return ret;
 }

-- 
2.55.0


