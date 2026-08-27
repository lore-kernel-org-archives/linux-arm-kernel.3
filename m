Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D726DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mi+Svbuqx9D6XBJSnUg0zvQizCn5oa9oDvU2DwzH9oQ=; b=ZsuDZaNTrfsZ1ZJkX0oBxhrRJz
	3ogeOREsQkxwo8t+ASlqMpFwbWjCxC4GjYFo63Ph//UvGaLyBxJNu0bXzybjLmUxbH6mLqVvm31jz
	TOjy5MFm+KNpfPzOHKb2ZqiHed457UShrx8f/PHTow3vrmsLx4wHiaKfDl/MjqwJaknbSCNCu5jx8
	Y/5sjp/KASrbOS85+3jZoaBr4eEgqQWQYDWJdnx7o77o4qjJhOya24EP5A1lxeu4+NmSRRo5/NDxk
	psd2y5+sTvIM96vAdYtcc/Ap2qAhH7mEkcRm3ohvxqyLqGWg2gT7XDvr5biVP6Tx6IU7vVNuVuc5F
	yRY1CT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUHu-00000003WuW-1s02;
	Thu, 27 Aug 2026 07:12:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUHr-00000003Wtu-3Qka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:12:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R6IK2619606
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mi+Svbuqx9D6XBJSnUg0zv
	QizCn5oa9oDvU2DwzH9oQ=; b=VL4l6mIay+UDayw2kICVhTZ0DNh8q7Zj/iM4ef
	FUSFgSFVo9EB2m645Vvm4Vhp8zG0TtsuQ+U+aWel/pixaChj6W+R1/GI8TNpo+48
	rsKYzFeBaitRcUN5+rvpsz4glD3FZRQc7jADGyMCUtOrXKLlYjJILMDUHxBv3Trh
	NyVHD0sPowDKhsnHe2ZU1kmHs9wdEm2enTOiUq5BWgU2r99Bj2iZx6daCCmwosYF
	aJ8Cw3ec63hBqcqVjDuLI3CAhgjfvXny00lv1BWEUre7Kdi3QnqLQAOulioIAfJe
	rSloa3cDWVnqG2wp2+6T4Vn6Li37d81MqrvJCLGM2OmaMIhA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u3r6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:12:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so20549251cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787814754; x=1788419554; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mi+Svbuqx9D6XBJSnUg0zvQizCn5oa9oDvU2DwzH9oQ=;
        b=IEjXNezIjpUa+VzcL4SCrKsxNotKfE1BeatL7nPvLJ0NLd2KXzUIcc65Qtf/KR/ccf
         zenS1UinCYt+weDY9vb31z+dR6RHRsV2sj/WG4SJAngGWfebE1SeStZwSY0aRIbz5MVv
         OsAe45yAOlKRuypjuBAV8jFrecaXkb26JFo+im8syGviNRTn6b47mWjeozLhBkHsMyST
         us+FQ2mOydNrB5eXW6ebqSh4vOUcCQZSlDAnUjOFMk3JGU6+yIFy1jjblnwGSonJ5UfB
         3rJXlkjUth1RosAWo6eyLEOEGWoABbOjFHTfgofFG0FKGZdL/KV4g07JogzOSS9+0qzs
         jKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814754; x=1788419554;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mi+Svbuqx9D6XBJSnUg0zvQizCn5oa9oDvU2DwzH9oQ=;
        b=TJ9ZUcBx5tJN72GHjwyntQDtdUzUSqj5vyx2pvbnaFJMjLul8yPbZX7T2inqnWiOrh
         0EWeLqEwP93n7eqwhBM4yA5No2zzt3K12gE23GkMi9vYAVjT6HMCJ2bL2q+iUEd5LfH2
         2Bi/lux2PpLW7Ut6D5cymCRo7aPUmzq3tkr18C1/bnCt77Wm0HOZgCz+XZ5LsB6siz8x
         0wMjKgZkL2p0SC9a1KQemWvtSMUqN+nRdTztdnZgpHlrh8hF1gpaT+X0IDUf8U2O7QOe
         ssc0pxVRFnVPXdQdrUxYxS+F7zyTnlQS6rd6xYb/Q28wOsrLOBFWt9pNNOBNcJ71hYQV
         1MQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5bspysu1uWgO9rOO/o+Hd9Y3/f/Kpv7nqZBvOBeYgDELv4DjUp3ms260kRKMB7tv96rklE4TIbEq5fgd5li/m@lists.infradead.org
X-Gm-Message-State: AFuF++nzNt7yFWySbCyMKg3h4MD9j1PEWRBOST/0gzqMolKjWAquiFbB
	3kmgYlD2FEjidVUhB2//QJzxMIDrRvMldJrgiGZY+vEulxbbxKYjlsovc+pOl85m+gwn0E07EJJ
	sQhpXBY3va2iyofodMaJAPf+JVt5WdJuOem5hTNJML4JxwdUWTycF6ujyIKt+5aP+vimirxwn7J
	cvp8vx3FNtdA==
X-Gm-Gg: AR+sD108Udij/3laDbh81Ey9OCvatp9lvCzRir77wc75z+o2N1QRxDriklGEjQBJHbi
	RVFD3G/AQS4POpPytpTCnmdjDarcoUXGJztkq6Kydts0s9OpYcCpZLJAjkjrNzDSJmNLLposBDW
	pQiEXibkEMER8f83g5k2ZnYeSfKO5MHrM9AFA+nln2p/lYx4dCbXpJBx70Cb3//01M/4cnCCb+t
	K/mP1iZ20ANusSYWQHrjSExBfxGQeHf/cPpJLN1GLceyAmWI5lwWFptaxtMSzdYHpKNtpEnS6bx
	GBaAy/8NkVX2okSW2CJcmB4o6mAw41Xs48WCGMVGB4jnDQpY5QknCf5yfvUD+MW8sZAtAJ173AW
	+GAEMna557eNUvQ==
X-Received: by 2002:a05:622a:13c6:b0:52d:d12c:3eee with SMTP id d75a77b69052e-52e423462ffmr129777171cf.23.1787814753999;
        Thu, 27 Aug 2026 00:12:33 -0700 (PDT)
X-Received: by 2002:a05:622a:13c6:b0:52d:d12c:3eee with SMTP id d75a77b69052e-52e423462ffmr129776791cf.23.1787814753562;
        Thu, 27 Aug 2026 00:12:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab6d0sm6637501f8f.13.2026.08.27.00.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:12:32 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:12:15 +0200
Subject: [PATCH net v2] net: stmmac: hold runtime PM reference in setup_tc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBREr2L+2k9oLSCuvIdhUcpXmtAW+wvRE
 O5uwwncTPJmMjMbMEVLDLfTBpFWyzb4DPJ8AjNq/yK0Q2aQpazLq1TIyTltkCktMyaD5HU/Ec4
 OhWq1rurL0LQN5P4c6Wk/x/YDPCXosjlaTiF+j79VHNEf06tAgaoSjRykElr198BcvBc9meBck
 QW6fd9/CdUNkM4AAAA=
X-Change-ID: 20260824-stmmac-setup-tc-enable-pm-149aa563d797
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1OCBTYWx0ZWRfX6kFuxMPD8vqw
 1yNDWWjbeKqTQ8IrF/YJR41a6LTmuVdvMcj3JDYYTROI3DcdFfEE9SzYkNSkll5IJPWiY0ovoer
 RfDzAzRrtpad4TS663fUKZiVJS7+FmyEvLz8Mm9YfFAMGCKRAcmaIZw0YLhSkVrF8uQxgYFJeHf
 6JPO3JzRBXcr3ZAueXngOzyV3K7oB1lIdqRAQ1WP3ujs4vymXSiEfWFEr9PVD5XemJvW/74IjEU
 eMcL0Yy2B0Iku92Zy6PSnJprRkQLInWZhxYebSPidA9sd5gsoyktqOYZ22u+OXibydhJcGd8xru
 UV6CH9+UA+zvWfFxv1/OtjEtaKArYK2zWXcCric+u16m4J1hIghahZ6A5NifDmUPaLR1r35AX4m
 5Pti7srxKxczLNz6pHaOuiugyJfQ0F/SI4qEQ9lzdMIkkYWYe31YXYDEt5dajBDalHfBzN6lNGu
 ++kjdIQGNCuT/EcMxng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1OCBTYWx0ZWRfX2IoFTE0FBN4Z
 jYlIJJLptSTS1PWGT3TMVUHNA/opaw9YOxCWs0IzYSVuwo5ripin0mIH8Ww32gnCIhM1j4HKeVq
 ehrBwKz0huW4HrDomcZqBMAEVGcWt1s=
X-Proofpoint-ORIG-GUID: BgZLQUJjmR3PKKktwsHFVWr9MReXopxI
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8fe363 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O7mAVgsXz2YliqE_5DUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BgZLQUJjmR3PKKktwsHFVWr9MReXopxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_001235_872901_20469A20 
X-CRM114-Status: GOOD (  19.52  )
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

The qdisc offload callbacks invoked by stmmac_setup_tc() program
MTL/MAC registers, but they can be reached while the interface is down,
when stmmac_release() has dropped the runtime PM usage counter and the
device may be suspended with its clocks gated. Accessing the registers
in that state can trigger a bus error.

Hold a runtime PM reference while configuring the register-touching
qdisc offloads (mqprio, cbs and taprio) so the device is active, and its
clocks enabled, whenever the MTL/MAC registers are programmed.

The TC block callback stmmac_setup_tc_block_cb() programs the MTL/MAC
registers as well, but it runs asynchronously from stmmac_setup_tc(),
outside the runtime PM reference held there. Hold a runtime PM reference
for the whole stmmac_setup_tc_block_cb() call as well, covering the
cls_u32/cls_flower setup and the queue enable/disable accesses.

No reference is held for the TC_SETUP_BLOCK bookkeeping itself, the
TC_QUERY_CAPS query or the tc-etf path, since none of them touch the
registers synchronously. In particular the block bind/unbind must reach
flow_block_cb_setup_simple() even when the device is suspended, so the
driver never leaves a stale flow_block_cb on its block list.

Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
Fixes: 4dbbe8dde848 ("net: stmmac: Add support for U32 TC filter using Flexible RX Parser")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Return -EOPNOTSUPP in stmmac_setup_tc_block_cb() for unsupported TC
  blocks.
- Link to v1: https://lore.kernel.org/r/20260824-stmmac-setup-tc-enable-pm-v1-1-45172d241a4b@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efa35cfecc4f..90753d5af6d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6393,9 +6393,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 				    void *cb_priv)
 {
 	struct stmmac_priv *priv = cb_priv;
-	int ret = -EOPNOTSUPP;
+	int ret;
 
 	if (!tc_cls_can_offload_and_chain0(priv->dev, type_data))
+		return -EOPNOTSUPP;
+
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
 
 	__stmmac_disable_all_queues(priv);
@@ -6408,10 +6412,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 		ret = stmmac_tc_setup_cls(priv, priv, type_data);
 		break;
 	default:
+		ret = -EOPNOTSUPP;
 		break;
 	}
 
 	stmmac_enable_all_queues(priv);
+	pm_runtime_put(priv->device);
+
 	return ret;
 }
 
@@ -6421,26 +6428,46 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 			   void *type_data)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	int ret;
 
 	switch (type) {
 	case TC_QUERY_CAPS:
 		return stmmac_tc_query_caps(priv, priv, type_data);
 	case TC_SETUP_QDISC_MQPRIO:
-		return stmmac_tc_setup_mqprio(priv, priv, type_data);
+		ret = pm_runtime_resume_and_get(priv->device);
+		if (ret < 0)
+			return ret;
+
+		ret = stmmac_tc_setup_mqprio(priv, priv, type_data);
+		break;
 	case TC_SETUP_BLOCK:
 		return flow_block_cb_setup_simple(type_data,
 						  &stmmac_block_cb_list,
 						  stmmac_setup_tc_block_cb,
 						  priv, priv, true);
 	case TC_SETUP_QDISC_CBS:
-		return stmmac_tc_setup_cbs(priv, priv, type_data);
+		ret = pm_runtime_resume_and_get(priv->device);
+		if (ret < 0)
+			return ret;
+
+		ret = stmmac_tc_setup_cbs(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_TAPRIO:
-		return stmmac_tc_setup_taprio(priv, priv, type_data);
+		ret = pm_runtime_resume_and_get(priv->device);
+		if (ret < 0)
+			return ret;
+
+		ret = stmmac_tc_setup_taprio(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_ETF:
 		return stmmac_tc_setup_etf(priv, priv, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	pm_runtime_put(priv->device);
+
+	return ret;
 }
 
 static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,

---
base-commit: f967455fb2a5a2079b9eb5823e9ccf359174bf9f
change-id: 20260824-stmmac-setup-tc-enable-pm-149aa563d797

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


