Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A8C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=roPEVsoQUhFBjB1PneBAofXRNLn5gkvGNPkS1bJbndI=; b=wRkm+DnSDGr1qEEZ9zD1Eiy5ao
	2P65zxt+HDr5sl7bY8kcRCttM5m+QCkvtJ4kPXGokzd5FAN5L1SPBO5gCqNqvRMT/iPhW4ZDrtr/z
	/0Xkabt1SXeJYbO3pWvU06boyW9Q6O+Tj1SoQMetKbBnURn+J4MpjA2uVREgMIWPNigPTPKIe5+zK
	m6KLPAhgSHbRQSdz8VXQjLvCS8PJMikYl99FdS3DAZevJvNUCHWf3a2+uFVJCZ+EFkdo0Ja/KUdhe
	+V0AJUvLahMURydXI11ANaMJPmZ7qK2g382+AtDB5Z8wLooJockfNptbdM4io7Xq0CgBeA3aKIcnG
	5EyhGCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Fo4-00000006uXA-1pfN;
	Sat, 29 Aug 2026 09:57:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Fo2-00000006uWY-0Met
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 09:56:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T807ba1687435
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 09:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=roPEVsoQUhFBjB1PneBAof
	XRNLn5gkvGNPkS1bJbndI=; b=UxwG/I2pScGjdD0Y/5Zg093L9A8xhOsplkZSfo
	yNQFBMcZcHx0Ca7zhYBRWs8eIqsqyBObC89oUZ6OqFT4QPu8uxER8HOZOTBUMrg4
	P8UlkH+e6mxqLUApyb/THHyq2VJiuLHw3vMEAbWjTS21rrRQLMUfYVoMAqnXas1E
	b0/qhuc9H1AEvFylW9jTpiFfbw1xAcHLLOJNaHe4lXC6kmXRUBRud2TxVEyPzJ8e
	UL9sOEk/3ds0jCZoWhVnPexw+zW9lM9GwPqh/wMAS4QFMcctLHISihBoCg01crlg
	yh4UkOCXPmGKf5k3CicoSacZmFUKCYq8TAZLz1RBrMxIop6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvgp8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 09:56:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso16101971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787997416; x=1788602216; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=roPEVsoQUhFBjB1PneBAofXRNLn5gkvGNPkS1bJbndI=;
        b=CPH6chj2YKr2ZRggbsJvChIDTdrAFW66SipKU0WY/9nA+BtgzDAuaUlkZtvypY1RK5
         tsgqs28ivAGsJjV3bNleziSe7fEX2WdlguCOVZVJTZaJBZHt5Oqa72Xng2N2+/YRcVxh
         ldq6Pa+MKXGeT2Xvvd9ZCgqM1On0ild77MGlyhj6+ZRBcMUvmRVPiI/5TTX3UKIkhyGj
         PkoFSZckctdvIvmymHwR0liaXk+EbA/hBslokdlMMrdrt4KU3xtoRVZwLQNjXvP89Ju1
         6GGL+E5UXeS0M6rIocj/mbafWXJRIsSbiKvgMdT2QEP1GJMTGQJ2yITZFVS/niyrgQWX
         E5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997416; x=1788602216;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=roPEVsoQUhFBjB1PneBAofXRNLn5gkvGNPkS1bJbndI=;
        b=pCiI0JB2SLeBbJC9GqdAyliZvS95oZxwfctJaUVX1GhVdUC08k2g4+In7GpyKedDta
         OuX7/Z5wf/2mRctHQEwcSpuaPx4Q4nisdtqD9KXd2uzyqPc5J8b7dAMEmyoNBfgmRopa
         7Gd55vgcxDIFyJT4i9mxaj9ST78FGK0epq+HMwnifm5vwYR9BTveoi7rM+2jPt+7Vf3v
         By72nk2zqOa8IdUBvGe1mWojC2oTCnnakwLQkCThhk17jlUi80HVbKjjxWvhIXcIXjQc
         hlpwPcJEx8n03BCmtaZVwg286G+Cpvo1L9pQzjofJKiwbXhp/sST4h7bWWIluRTvSXZE
         Nfzg==
X-Forwarded-Encrypted: i=1; AHgh+RoLVAZHmkrMya85FRrbXHZYk3yXEtuLSzMKkaFrUtBHr3WW+YXzxgBJz3+K2HcETdG2/dJg8p5JhwxIhDTYvjEo@lists.infradead.org
X-Gm-Message-State: AFuF++m/4L6KTqrQocWsggWfIGXPlGm5/vQccldWoIhvw5LOQ5s2pppY
	Tb0IH6bDWXImb8/vOp3PBnGoZ8uGVfzflSc571eXTjmTN/B8MetkUGF/cfTc6ppyC3ey0FIlR4N
	I8iupkm9SahTm/knL/9oSSmzLwQdXRMRXV0RoAow3/rAsZjiJvipYzbt9zluD2SFiVX1ihRhOT9
	TkSA==
X-Gm-Gg: AR+sD10Cl6K4tRIKIhMlTwguju+oOAKeCRQV5grQseEKoKFDaTaHBI1i76rqodxHm+1
	q1E8anurVvBnW0XMzEFsdb2vxV6P574poXPrSvnnm+5oLhvXa2kUYlN9hLNrm9DSpmRCnj5v7ZK
	AM4DeEoP140skPekTj5j0CLKeh1j5dvCgbLzm0BnJSpKn0BWhEB7PfKvTY4RfxeUobxA/JaYpyo
	y7ShwLLi8jj5zFj42JcHi9ckRHqxQG+LMwGpIEq9Tl68fpdWQXOfF9s4So82XJUXTCA+CMyLUY1
	yewtXsAnFJaDnNgyTTijYSv2NEMUHAZ5T3qAQLvtFVJMMzeQoqo+i9Qc8ssUDYpp7+tsUzbbtub
	2JMFz27ztUIB2Bg==
X-Received: by 2002:a05:622a:1e19:b0:52f:a196:79a6 with SMTP id d75a77b69052e-52fb9694badmr168692021cf.33.1787997415417;
        Sat, 29 Aug 2026 02:56:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1e19:b0:52f:a196:79a6 with SMTP id d75a77b69052e-52fb9694badmr168691661cf.33.1787997414807;
        Sat, 29 Aug 2026 02:56:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942298fsm201048045e9.1.2026.08.29.02.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:56:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 11:56:33 +0200
Subject: [PATCH net v2] net: stmmac: re-apply taprio offload in
 __stmmac_open()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNywqDMBBFf0Vm3ZEkrQ+66n8UF6mONWAezaRSE
 f+9Qbrv5sK5F87dgCkaYrgWG0RaDBvvMqhTAf2k3ZPQDJlBCVWLVl2Qk7W6R+KEkXQI84p6TBT
 RB3IoWzk0QsuKHjVkR4g0ms/hv4OjBF0uJ8PJx/X4XOQx/fTVH/0iUeIw6lY054ryz80zl6+3n
 ntvbZkDun3fv5JVc8DWAAAA
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
X-Proofpoint-GUID: B38EDTOq5w2TtyaQAyHFDx6czbFT0tLU
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a92ace8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JpBpa1p7AAAA:8 a=mSazJyEt4tbewPo3ZqYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=YCh05so4W2E6r1tszMC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA4NSBTYWx0ZWRfX8YDkggIlHBKX
 gIqm+/gsXTivTuELPaX4UvXRKexsEVVkQ1I/mr4BApsYxkJ9V/Gx2jaBUlU0Ura7rzUb41z6cVg
 oNRLpFYEOWRamgTCS0lXTiNvCfVd3ox778xj3xaIJPiEsqAHmBVARc3g4MhCfqJ2MpNKwaZilIj
 /F+aHEJDo/eO6ddy49z7ISMSjH/7Hv72hfrqcMs7yPAuMf/fxRqDzQEtgHKHKOXy9WmfWN35xBB
 fpcN9S0Wy04e27XPSIXCjw19l7sYMIxQxeWzr0D8p/VpBUmOm0VuLmnhwExwJlWVX6ofBe1h7Jh
 bxKcI0n5q7RovtpxMs/Eu7NU7eoQDQpDaGxtZfOYns08y4Us3T1s0CMuwgU2t4zjTR2GI+CeUA2
 Duz/5LVBpuLhYMFwGS3flt4175ieAYV86Ea8BlkqqbvHuwDMdDm/b2AD1eINPORUBbmVwDddU7U
 R5mqwca2ijL4+pzFQQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA4NSBTYWx0ZWRfX2YYHSbi2nEpY
 9mQl23rF5PuJmYwQmP8Lwtgjho8/5hxbEWMIUWP/SkINvKO/YVeuD0Xn/4L8h8Vz4gIHA/HFX7p
 HDw1A8s+3kLmTHIU+oWP+nczZVVWwtc=
X-Proofpoint-ORIG-GUID: B38EDTOq5w2TtyaQAyHFDx6czbFT0tLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_025658_281118_FC72A80F 
X-CRM114-Status: GOOD (  22.67  )
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
Introduce the stmmac_setup_est utility routine.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Rename stmmac_est_reconfigure() in stmmac_setup_est().
- Rely on stmmac_setup_est() in tc_taprio_configure().
- Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 33 +++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 16 +++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 26 ++----------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 27 ++++++-------------
 5 files changed, 59 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index afc516059b89..bbebd33c8a88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -80,6 +80,39 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	return 0;
 }
 
+int stmmac_setup_est(struct stmmac_priv *priv)
+{
+	struct timespec64 current_time, time;
+	ktime_t current_time_ns, basetime;
+	u64 cycle_time;
+	int err;
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
+	err = stmmac_est_configure(priv, priv, priv->est,
+				   priv->plat->clk_ptp_rate);
+
+	mutex_unlock(&priv->est_lock);
+
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
index f70221c9c84a..f620d3331c2c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -65,3 +65,5 @@
 #define EST_GCL_DATA			0x00000034
 
 extern const struct stmmac_est_ops dwmac510_est_ops;
+
+int stmmac_setup_est(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d576059c04df..b30036428188 100644
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
@@ -4153,11 +4154,22 @@ static int __stmmac_open(struct net_device *dev,
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		goto init_error;
+		return ret;
 	}
 
 	stmmac_setup_ptp(priv);
 
+	/* The core soft reset in stmmac_hw_setup() clears the MTL_EST
+	 * registers, so re-apply the taprio offload after PTP is up.
+	 */
+	if (priv->est && priv->est->enable) {
+		ret = stmmac_setup_est(priv);
+		if (ret < 0) {
+			priv->est->enable = false;
+			return ret;
+		}
+	}
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
@@ -4181,7 +4193,7 @@ static int __stmmac_open(struct net_device *dev,
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_release_ptp(priv);
-init_error:
+
 	return ret;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 960249960004..917ef7ddcae6 100644
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
+		stmmac_setup_est(priv);
 	}
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..b41df317d73c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -10,6 +10,7 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 
 static void tc_fill_all_pass_entry(struct stmmac_tc_entry *entry)
 {
@@ -968,8 +969,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct netlink_ext_ack *extack = qopt->mqprio.extack;
-	struct timespec64 time, current_time, qopt_time;
-	ktime_t current_time_ns;
+	struct timespec64 time;
 	int i, ret = 0;
 	u64 ctr;
 
@@ -1069,34 +1069,23 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	}
 
 	mutex_lock(&priv->est_lock);
-	/* Adjust for real system time */
-	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
-	current_time_ns = timespec64_to_ktime(current_time);
-	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
-					qopt->cycle_time);
-
-	priv->est->btr[0] = (u32)time.tv_nsec;
-	priv->est->btr[1] = (u32)time.tv_sec;
 
-	qopt_time = ktime_to_timespec64(qopt->base_time);
-	priv->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
-	priv->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
+	time = ktime_to_timespec64(qopt->base_time);
+	priv->est->btr_reserve[0] = (u32)time.tv_nsec;
+	priv->est->btr_reserve[1] = (u32)time.tv_sec;
 
 	ctr = qopt->cycle_time;
 	priv->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
 	priv->est->ctr[1] = (u32)ctr;
 
 	priv->est->ter = qopt->cycle_time_extension;
-
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	ret = stmmac_est_configure(priv, priv, priv->est,
-				   priv->plat->clk_ptp_rate);
 	mutex_unlock(&priv->est_lock);
-	if (ret) {
-		netdev_err(priv->dev, "failed to configure EST\n");
+
+	ret = stmmac_setup_est(priv);
+	if (ret)
 		goto disable;
-	}
 
 	ret = stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
 					      qopt->mqprio.preemptible_tcs);

---
base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


