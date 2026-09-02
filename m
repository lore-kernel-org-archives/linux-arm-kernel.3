Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333FC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/P6vYyxP2DSmIU7845M8Rwzs9xRPXT9282fqThmHwM=; b=eFSdp+R9Hiohr3IXLWFbDRQK8h
	115M8JKNS5KcuKMzWdey0gkudQqCkN1CB5TJYQwsJcp5shHHno59/BAwnn5vQ0t5UwriBbzSRYzln
	+O4NelAJwRZmvllYe10V0t3Z2ru+1QcOKopRRGrdemSYubLqFN9CG/xn5Qawlm9LO9prdprM3cGmU
	xoyMCLvKW0S6scPYdkiD125fhIwXNxjcQ3FaIz6U+jQymSpeyQR8b1OQlHeYYKUPqEylGFAmsdEFZ
	zZ2t8hDcHDfkCNA9xCfCbhcljIm7PeMQyHQjnffk/zaqdEt+S8iPRtQ7vPTAgQLZQMCsGk0kyVqSU
	wIdSGZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPE-0000000FqwT-1Xv2;
	Wed, 02 Sep 2026 20:18:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPB-0000000Fqs5-18Pq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH4eQ2685637
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/P6vYyxP2DSmIU7845M8Rwzs9xRPXT9282fqThmHwM=; b=Vtn6kbXClgC3SK5m
	552dRBfHRdS9nsnb8Rw/wSLPbfUHZsRWkuRfeVP1EG+ss51YgqC32wkzLycNAMy1
	Xj/z/+SndUjuf8UuLtVx7GcCcqMx+cqLRWpVEJspoiaG/zMS0OfrCQiCYVW/HxGn
	RBd8e3HuZrUHJjVNielbf/3oMrIaENURfNuReP8mG2YQkkSouUSEMBDTcrSeMSAC
	MR3hWYyip8sgEqIEIeVKFuUhjSv/y+jFeZnKWW8N3Zuppf2zotywfekyIeVkhROR
	c42G0K1ojhXu0p3HQpCObNj3IG77qfguK24XwqS7QP8mYR0feHWxYizccHWd3CXJ
	Tnyd1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a86c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9396e0515dcso24195585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380276; x=1788985076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/P6vYyxP2DSmIU7845M8Rwzs9xRPXT9282fqThmHwM=;
        b=Lit7WFzsZOA/gclIvIzL0z0gs2Z4H+7gowGpx6zJwPfoUKydCMzEfEIN0e8rtrlPWb
         YsdnnUuq1KtGdYZWshP6mOuB98A7rHBZBXh3jVneqAgUbwIVmyDemCcG2cyRrVhlxmRW
         cwDwX6PPyyJoRou3SWtll4lu1dPQuvYYxSSYy180FiiokuJwILEnrtQs3j0nzSvsfp4u
         JZpk42dNyLJKmHxCPKKWetTq0WZiNsNyC9fntozO56koTkrWs/gAefHchqwo9V1MOY1s
         Ouyqv/jHzA7ZIGh0AvcALFc0tXkGz2tfYZG5/znYVRDsRjRyTjl8p5J6j/+ICjJBPY+p
         /HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380276; x=1788985076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/P6vYyxP2DSmIU7845M8Rwzs9xRPXT9282fqThmHwM=;
        b=Ay6xarjr5AVjFW3LtaA6RrRW0HcaCPh8Jd3Ot5g72vq1kaFleXkMm93tvn2IctE+q8
         12fefTmUVu/J8OWtDjj6Innqq9GZu0AtXKcvMeeDSs+Bb0afQe1SoSKswNK3tIiWJcV1
         A0M3E6XuhDLpEe2hh904gZ0eiSlKf2yU5s/Mg8ep7RNUSkPFJFBT8xA+pbClYKPVfL+p
         3sjntF7ZFkfMmQJk5CzKjid+/rC1M4LjL4t2FUiT8jBaHNC16NV0G9JKzjk6tvO+31Hz
         yuUu0QLNiVWwUt7qe0oXxqpY9iOqSJIMjGHxRxVr+iK48Acxae//heWmzloG8bYYMBS1
         azrw==
X-Forwarded-Encrypted: i=1; AKwUvBxNAAOIzlgVWBylKovSUUSDlD8PcP6W+CuW2Ef3uG7FHUOF+o0jmEFofRGSTDiRJvSDMuWPldV9wXM26IJAr5Uo@lists.infradead.org
X-Gm-Message-State: AFuF++mmu5mQ7YmHRfShUyE8l3tyKb8/a8pIpkIGcrXmn3Y8NMZZLtlt
	2Yo30Hq4h98YwS3pw5gTRNqxSdHkV3zvIXU4wePT60pnf4bUqK5ylBq0qraZUYCQXwLCTIXb5Xt
	qelMleFpJO8B845gChnQjOX7Sn+EbfEQtfeKv3YTQxoKnq9kRXe/Ou9J9iFkDkeSVghOB6p0kqS
	DCkA==
X-Gm-Gg: AYBFou2GihjXCkkVkOUDOyw8vjJtxrgX/tmd7FNmiG8fTs5uuZ630l+ZuBH/MBNe09S
	K5reQaN9MmAy94apOsu3uPi6gyNR5n1c90wfWB8jljnOJOCnr1fyLUE7HuFsmjqTfj1PotrDGrm
	JK1WelwprhG7PwvhxqtioDYteiMSTsleeC18Dlq5wADIyeteCVPN3FR6Oy86eXLwvinqkfOg07A
	94qN96Wc4lukli/2X1Rh6SBbbijDQtmR3y4hdk6wjJXeOh6QL/EaRB8wtcok0kNrTYNG/ea54FX
	mqy+knWijzCrKSyeb0Tn58kKFsBbuNizzoDJWcyms7TehKTye8FQTqf+XyTAJRdek0fi4u3/ujs
	vTpft7UQPhWRJ1w==
X-Received: by 2002:a05:620a:45a4:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93960e009bdmr864276085a.18.1788380275582;
        Wed, 02 Sep 2026 13:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:45a4:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93960e009bdmr864268585a.18.1788380275013;
        Wed, 02 Sep 2026 13:17:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f9114sm15349995e9.5.2026.09.02.13.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 22:15:43 +0200
Subject: [PATCH net v3 3/4] net: stmmac: pass the desired EST enable state
 to est_configure()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-stmmac-est-reapply-after-open-v3-3-e72a6df5a7ef@oss.qualcomm.com>
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
X-Proofpoint-GUID: wzFp4JwR8QDlf5iunScFanSqk5Q647D9
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988474 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ESEPPiCkTmsfOTcFg5oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX2wZCq5n7gNxV
 VHL+wDkXOUEQ5McPJDDK3G4r5wcIPSuCf9VQ6zCMeUNSSNgQ1JzEh43ydIRKl2/y6xnKRIhwwXH
 q+ZMetM4TR1txi2itQVt7vcbPsQlSpd3JBclBeL1QmotxpKx/Ikxy0gJY3kHEafUKzNokNWWmtj
 mMqGkrR3Jnojmul0BjCgiVQl9SsMMN5wTY4nqK5g5mBX2TBsdnrZ/xAgYTgrvSfhuzc5kn4Uzmc
 0733eZcOdlHWGNSfZUiLqTG6UYrTvi0NNN8hNbvO7bJyBgCOtZyLmZ9Ot7Jr8hUe6OWLJas40WC
 nWLGILlyk5Zmrp3kAs65olILvKWIIs8sPrsBQAixsjK8ot2ZbbJssaHD5nLTeY/muhr6NaONpWC
 a7QPt1H6QTr+zQrFR7aFN8TssLwSMOJ53QkwVAb3iS5mlWzoq6xPOcSzP9rKjvDyfDU0noG+ONN
 cjVHVc/8GrEwGYeLWwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXwF2wqesp5RAI
 bOLpmJ21995Rm62T3WZgkfJ3XsHmKC70OkDooby3wKM3WmlFZZCTZlA3PYnyb+QB9Pk5EZ3FrAQ
 7nadNhw4D3sB0LI0t193OpB1PYa4/rc=
X-Proofpoint-ORIG-GUID: wzFp4JwR8QDlf5iunScFanSqk5Q647D9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131757_450854_069CFAAE 
X-CRM114-Status: GOOD (  22.06  )
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

Pass the desired EST enable state explicitly to est_configure() instead
of having it derive the EEST/EST_INT_EN bits from cfg->enable. This
decouples the hardware programming state from the priv->est.enable
flag, which records whether the taprio offload is attached.

No functional change intended: the callers keep toggling
priv->est.enable around the EST programming, as before.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..e5579166df1a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -620,7 +620,7 @@ struct stmmac_mmc_ops {
 
 struct stmmac_est_ops {
 	int (*configure)(struct stmmac_priv *priv, struct stmmac_est *cfg,
-			 unsigned int ptp_rate);
+			 unsigned int ptp_rate, bool enable);
 	void (*irq_status)(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt);
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index afc516059b89..f15d4d046aa7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -26,7 +26,7 @@ static int est_write(void __iomem *est_addr, u32 reg, u32 val, bool gcl)
 }
 
 static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
-			 unsigned int ptp_rate)
+			 unsigned int ptp_rate, bool enable)
 {
 	void __iomem *est_addr = priv->estaddr;
 	int i, ret = 0;
@@ -62,7 +62,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 		ctrl |= ((NSEC_PER_SEC / ptp_rate) * EST_GMAC5_PTOV_MUL) <<
 			 EST_GMAC5_PTOV_SHIFT;
 	}
-	if (cfg->enable)
+	if (enable)
 		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;
 	else
 		ctrl &= ~EST_EEST;
@@ -70,7 +70,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	writel(ctrl, est_addr + EST_CONTROL);
 
 	/* Configure EST interrupt */
-	if (cfg->enable)
+	if (enable)
 		ctrl = EST_IECGCE | EST_IEHS | EST_IEHF | EST_IEBE | EST_IECC;
 	else
 		ctrl = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index be5b26edd04c..4869827670c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -74,7 +74,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		mutex_lock(&priv->est_lock);
 		priv->est.enable = false;
 		stmmac_est_configure(priv, priv, &priv->est,
-				     priv->plat->clk_ptp_rate);
+				     priv->plat->clk_ptp_rate, false);
 		mutex_unlock(&priv->est_lock);
 	}
 
@@ -104,7 +104,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		priv->est.btr[1] = (u32)time.tv_sec;
 		priv->est.enable = true;
 		ret = stmmac_est_configure(priv, priv, &priv->est,
-					   priv->plat->clk_ptp_rate);
+					   priv->plat->clk_ptp_rate, true);
 		mutex_unlock(&priv->est_lock);
 		if (ret)
 			netdev_err(priv->dev, "failed to configure EST\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index e25a08e4be5f..be48bcabdadc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1082,7 +1082,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
 	ret = stmmac_est_configure(priv, priv, &priv->est,
-				   priv->plat->clk_ptp_rate);
+				   priv->plat->clk_ptp_rate, true);
 	mutex_unlock(&priv->est_lock);
 	if (ret) {
 		netdev_err(priv->dev, "failed to configure EST\n");
@@ -1100,7 +1100,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	mutex_lock(&priv->est_lock);
 	priv->est.enable = false;
 	stmmac_est_configure(priv, priv, &priv->est,
-			     priv->plat->clk_ptp_rate);
+			     priv->plat->clk_ptp_rate, false);
 	/* Reset taprio status */
 	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
 		priv->xstats.max_sdu_txq_drop[i] = 0;

-- 
2.55.0


