Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BAACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ABZjvjkoFi6ufA3S7uw9frak0BnaWuc77CSpR+ZBNTY=; b=WKT9I+6jl2N2ILuVBzTmpj6khs
	ePHaJ+Y5fjNQX/zqbHJXxK6MoOr4XjGHb995weGVZ1duyd57NI/XdflywQK9UmhpHBIiqTF2b8T2r
	Soige0NQ82UFc5A83ix5QcH3yGuXlejEPtOWFxA37S7/+cbfXvtdmLA+qpysvUwo9HKa3qFOF/8nj
	ZLUNIB9LioQlPTLqsDd+Qzua363GtABFK/JNQPmrQbmryRM931BdeAYIK5fqQf6Q1DN39bJxoCVW8
	rJzb8zdKe+g2XPsHy08w7ejdK3K/P0oqJPIRHes4MF0pLaFgEPJkRC2b5E6g8Syt0ikaFIkKEBEQh
	EZ/hY5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuvu-0000000Eyqh-1TuV;
	Wed, 14 Oct 2026 09:05:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuvp-0000000Eypa-0p99
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:05:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E40xe22222087
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ABZjvjkoFi6ufA3S7uw9fr
	ak0BnaWuc77CSpR+ZBNTY=; b=f6JSO9H8zEnb+8w0gKovbipSxsQtGdkV+GV4I7
	EseGnhQIlPDDxJ223eqlWCNfdCvvaHS7cvIWw9xsBzpXK2qrTcBB897SU0vrB7A4
	1LtXcSfq0giMlo28SyjzsH+Q/bv/3V8Hx0T8i4EBR96tFftb7fyLX17XqiwU07FZ
	mq6aDGBmKT0VV8I/jGFu1foGrjeEvWzLkyUbE7vzykeEn4MnY7nV36plMI7XBrHi
	Pt7l+noS1n0yvWAVxK8SHPBQJlmWAtZXQCIzyTx145YTV57GjBKDWGJiPaHQ7ND4
	0fiaQNRiT/XGuUm4TMLd5q+WMGXZp27m4UTSG9Zsu5MjEttg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsasjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:05:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so787052185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791968752; x=1792573552; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ABZjvjkoFi6ufA3S7uw9frak0BnaWuc77CSpR+ZBNTY=;
        b=Fet7losHKTF6sGvEsYrJB2DWcNlyfDlEoXJwWQoj/XiTeU0P6W0zoPwJIcB8QUr54W
         OhnR0ark6lbWF7ojMGkrjC4KauUmGkfgJUTMh3oGzkfwKZnpLopSnLpVvp07B/0D4BNF
         jQrJUHunVsgTGhC7FYVO20Rm1SfZLSkIXDwN6LofQgPFmLIt5FkGzvXcD9rhp4DydwFV
         Lu9QQs9HJtLKXP5wEvzadgsll4Sjhpy5dXtfotZw8Ej8w3aDixoK0UpCmZo6+v1nt182
         R/oGpfc86livZg615QVs8G+PaHcD0AoWQIiZzUUSxDr1vt3TyuE/39CAd6m01qXqksIY
         Wlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968752; x=1792573552;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ABZjvjkoFi6ufA3S7uw9frak0BnaWuc77CSpR+ZBNTY=;
        b=zY8xQ5+IkaRnMmeXhEaxMY5kFpOEPsIrsMDbUJYkmOENFNAWoI8SW2e2lTTefK9MLk
         PvzvRXcGT6NOIDx1Iec5AMGyJjktvvmVMxTDFFDlYVKVyb7jwVvJyf9IKZ6ulL9GbUEW
         bJvxJeaB8zqrg4M2NU8DGlNa58fGw+vNIc408mMogwkW6wNwrLlUONupgZBuFnq/5BHs
         0+ckBAOiiS4fiUbbgxvbXNZj/dnN7PrthJAr+SehrN6Z1+BfJoHqUv8m9iOZbvJU87Wt
         lP7+DZ4twGDJrm9UNTLloDLGbSt1wJkPkFLG5NUNmRNxv16YeFvk3UeZ4jAPa53UZ9aL
         3c+w==
X-Forwarded-Encrypted: i=1; AKwUvBy2Gf77NuQAUMFiGkd2lqvlj+KeSU4hbBjnZUQ2NRCC766ne48wCDR7ddz1kgx1YzuC7pG6x2LtoHGOw4LZUfae@lists.infradead.org
X-Gm-Message-State: AFq9FYKWW+i6IcNVgfXNPnR9GV1953QI9SmpfKxtM7ckYtAOIF1bhIQr
	H1IPGCsTsO0QzhZUgetCnG3Q5GW6PR3LP3HYH+BPf+e/9z6I1aAqS+FDSix+PpkaSyvetlkGADn
	7r/RkjtogYD2gyDo2gXScKlGkW1XVRB4tEjkliEDq4DRG7McPYExh3JQynSzM5kosKcuZ8/ui/w
	5zKw==
X-Gm-Gg: AYBFou1LTuUQB1sb19nzcKeOjfJUJIslnhHN15LK+Tx3cHPJeoltUFQ00we9JKy0SmK
	i+9IUKhfFs4myAZwuGuW20Utr+VK0qUgz4ufv2s8eKX/twpkWsafoEYCc+1uBj6Kw2yZ5YQL6er
	fyKRnJI7XsWscYDyyYITxfLg2OVcq8iPlr0jIArOWqYaUYPxn6KwqDvlwd+ejJJL80PjUExvuyH
	mqt4rBg/+wMvu3Hfl70XrkrSKFP6IZNO4t+BHY/H7LqJpmozeCXikwMvqzVVB29G6QwytrXyYxg
	K1KC9z9NO5KlXhGqVefUXqQD8G0g+QOB8ZL32xtVClkURsMwEehSFRIK1rDAJWbVX3YoxZKytEO
	b9200RadQ4sPqBw==
X-Received: by 2002:a05:620a:618c:b0:93c:735c:2477 with SMTP id af79cd13be357-93ebd228f5fmr2484049485a.21.1791968751425;
        Wed, 14 Oct 2026 02:05:51 -0700 (PDT)
X-Received: by 2002:a05:620a:618c:b0:93c:735c:2477 with SMTP id af79cd13be357-93ebd228f5fmr2484044285a.21.1791968750756;
        Wed, 14 Oct 2026 02:05:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm489166355e9.7.2026.10.14.02.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:05:49 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:05:25 +0200
Subject: [PATCH net-next v2] net: stmmac: fix mqprio and cbs combination
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-stmmac-mqprio-cbs-combo-v2-1-372249daa81a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQqDMBCFryKz7oiTSP9W3qO40HSsgSbRTCoW8
 e4NXqCbBx8f770NhKNlgXuxQeTFig0+gzoVYMbOvxjtMzOoSp2pIoWSnOsMunmKNqDpBU1wfUB
 d00DqUt8MK8jtKfJg12P5AZ4Tel4TtNmMVlKI3+NyocP/XV8ICa+aWCvNfc1DE0TK+dO9s3dlD
 mj3ff8BdVsd1c8AAAA=
X-Change-ID: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX8co4J8tdoWCl
 jGe3qgT1gaA/H2D4djK8jWyn639VwNg2xpBTlfbYUjnKCal+eR3uA+vgkIK22Gfvj0SCLjAN83M
 Ug8kv1E01XhclDd9rZY5KtNFCwZj/XNqhOjmMRSCdmAwF9g4LUnVEmExWh7zwo20AdmwBpFqC+l
 FNna1a+rMPgDPGYdFZFdcF8NMjLYkdCohe31kCf4fB492qXYdMADI/RQdmixZdJ/pYNFwmuGdwz
 LQa8mJkNdB6bKr0lQAYEgy8S+P1dDwCjyZw9tA5yVd31v+zYP/FCKX2bR6mBjXgZWBXFvtuKbxy
 3q1uoccFnwdWSmGTv6D02Mr//9V27FfCZMtBCKOF050ubcD8Hn2nO6y69JfhcJPsA9LIfQsr7E8
 Gsvpzk9bWk39E/T8XQmIEWZvLzfsI/YS9y8Op8FICGJeoIuOjU1LB+TzG4gx1NfXiBU+bl6epEy
 UUD15lDTBbtC5RpsunA==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf45f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=P-IC7800AAAA:8
 a=6U8f6XgL5L5c0sPS4z0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=VOpmJXOdbJOWo2YY3GeN:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXwol+SkzKoPr8
 nn86NCMzrsVtLqu5JvJ0ZRDCpQ1iQm64aiWmQrECZyWxamqvNsm3bi6i0fIS3d7FqpEDjxjHujt
 8E0OReJNUpIfF2ngNL+ufAtnQzkBjtQ=
X-Proofpoint-ORIG-GUID: 6Y2xzincgTZTYtuGG7mhN68e1bF8Dcdp
X-Proofpoint-GUID: 6Y2xzincgTZTYtuGG7mhN68e1bF8Dcdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020553_253677_D9AEF39A 
X-CRM114-Status: GOOD (  22.42  )
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

The channel-mode mqprio offload and the CBS offload can currently not be
enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
mqprio offload as soon as any TX queue is configured in AVB mode, and
tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
is active. As a result the combination is rejected whichever order the
two are configured in.

The strict-priority scheduler selected by the channel-mode mqprio offload
and the per-queue CBS shaper are stored in independent MTL fields on
dwmac4/EQoS cores (MTL_OPERATION_MODE.SCHALG vs MTL_ETS_CTRL.AVALG), so
the two checks are over-restrictive there. On XGMAC/XLGMAC they are not
independent: the TX scheduling algorithm and the CBS shaper share the
per-TC MTL_TCx_ETS_CONTROL.TSA field, so programming the scheduler
rewrites TSA on every queue and would disable CBS on any queue configured
in AVB mode.

Drop the checks and re-apply the AVB/CBS configuration with
stmmac_configure_cbs() after the TX algorithm is reprogrammed in
tc_mqprio_config_queue_prio() and stmmac_reset_tc_mqprio(), so the
combination is offloaded correctly on all cores. The stmmac_reinit_queues()
check is dropped as well, since a subsequent ndo_open restores the AVB
queues.

The following configuration, which was previously refused, now works:

  $ tc qdisc replace dev eth0 handle 100 parent root mqprio \
        num_tc 4 \
        map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
        queues 1@0 1@1 1@2 1@3 mode channel hw 1
  $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs  \
        idleslope 800000 sendslope -1700000 hicredit 494    \
        locredit -1049 offload 0
  $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs  \
        idleslope 400000 sendslope -2100000 hicredit 247    \
        locredit -1296 offload 1
  $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs  \
        idleslope 200000 sendslope -2300000 hicredit 124    \
        locredit -1419 offload 1

Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority offload")
Tested-by: Daniel Thompson <daniel@riscstar.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Reconfigure AVB queues if necessary.
- Link to v1: https://lore.kernel.org/r/20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +---------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 20 ++++----------------
 3 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 08b68441f9c8..120d01c04d61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -440,6 +440,7 @@ static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 	return !!priv->xdp_prog;
 }
 
+void stmmac_configure_cbs(struct stmmac_priv *priv);
 void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..1fdb4ca56591 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3467,7 +3467,7 @@ static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
  *  @priv: driver private structure
  *  Description: It is used for configuring CBS in AVB TX queues
  */
-static void stmmac_configure_cbs(struct stmmac_priv *priv)
+void stmmac_configure_cbs(struct stmmac_priv *priv)
 {
 	u8 tx_queues_count = priv->plat->tx_queues_to_use;
 	u32 mode_to_use;
@@ -7740,14 +7740,6 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
 		return -EINVAL;
 
-	if (priv->xmit_qdisc.prio_offload) {
-		for (i = priv->plat->tx_queues_to_use; i < tx_cnt; i++) {
-			if (priv->plat->tx_queues_cfg[i].mode_to_use ==
-			    MTL_QUEUE_AVB)
-				return -EINVAL;
-		}
-	}
-
 	if (netif_running(dev))
 		stmmac_release(dev);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index b09e9a89cee8..e137fb9012d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -346,9 +346,6 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	if (!priv->dma_cap.av)
 		return -EOPNOTSUPP;
 
-	if (qopt->enable && priv->xmit_qdisc.prio_offload)
-		return -EOPNOTSUPP;
-
 	port_transmit_rate_kbps = qopt->idleslope - qopt->sendslope;
 
 	if (qopt->enable) {
@@ -1288,6 +1285,8 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 
 		stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
 					      priv->plat->tx_sched_algorithm);
+		/* Re-configure AVB queues if necessary */
+		stmmac_configure_cbs(priv);
 		priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
 		priv->xmit_qdisc.prio_offload = false;
 	}
@@ -1334,6 +1333,8 @@ static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
 	}
 
 	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_SP);
+	/* Re-configure AVB queues if necessary */
+	stmmac_configure_cbs(priv);
 	priv->xmit_qdisc.algo = MTL_TX_ALGORITHM_SP;
 	priv->xmit_qdisc.prio_offload = true;
 }
@@ -1341,7 +1342,6 @@ static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
 static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
 					struct tc_mqprio_qopt_offload *mqprio)
 {
-	struct plat_stmmacenet_data *pdata = priv->plat;
 	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
 	int i;
 
@@ -1351,18 +1351,6 @@ static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
-	/* Forcing strict priority conflicts with the CBS algorithm
-	 * of AVB queues, so reject the offload when any queue is
-	 * configured as AVB.
-	 */
-	for (i = 0; i < pdata->tx_queues_to_use; i++) {
-		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB) {
-			NL_SET_ERR_MSG_MOD(mqprio->extack,
-					   "SP conflicts with AVB queues");
-			return -EOPNOTSUPP;
-		}
-	}
-
 	for (i = 0; i < qopt->num_tc; i++) {
 		/* The offload switches the MTL scheduler to strict
 		 * priority, which only supports a 1:1 TC to TX queue

---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


