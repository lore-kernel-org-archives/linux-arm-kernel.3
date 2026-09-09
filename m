Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12DBC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JR+7V3ELA9sqnRkBsDPxRpm0VgnUHbPahmeijDV/V78=; b=kVh7ibsGTNxCVg
	sS4DVUDiHMI+3/nz9d9PRvPuKxBNT7wmzE4ib1Pf44ZfLPQKs52/UHZEGqpxpr2gw0FsZb91MlVYt
	qCceV0yZbJ6aVfe7p+wLcVXKtnCFC2+TPEeE1qKD6IXa1Kifs702R/LRbwrc4nAPGS/n8Y7L1QSZk
	5oKcht2jNPMEUMVf38VPrh8/XrvT54/hR+vlb/eIiuis2EolWYO1rYT4N8vUFkBqWPg0YMMT9Sjxe
	3uluc+LbepCYPaDq8V5ZOSrYIMpIs+Rq0YdNZwiZmtkrvh/WFJyKBxOHsKgzy87NTpunsyGTVn1qr
	dx8HYzL8zXOOBaiEZ9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JG3-0000000Bxr8-2o6S;
	Wed, 09 Sep 2026 14:26:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JG0-0000000Bxpb-2z8C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:26:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIbAD2081194
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JR+7V3ELA9sqnRkBsDPxRp
	m0VgnUHbPahmeijDV/V78=; b=fiNENcS1XYTPBkeRrnQ339/NgAivJA+xwqNr+0
	lceaQEXeHdqt/V7NnbtP9w4fZogyIEh1nhDT0g1TVpMHM9AXNpVoAnfUtUhtEImB
	WTU73LmDd+orTPbos2pgKKMJKXuAjuLS+76YEACtw/0rzohommFYUbPSO5IwGw+R
	qOX7N4GFMvlySBrs3QY5yzbCFeAGU/WdRQLa0DQhhJBgiW4DobE+J4kmzhTii8v5
	+epKA+Y0liACRb3YSe7RMi+aozrvinK8fAnTLhl/jk8frZtozeZteRwb8DNFQZMM
	UsXp7Thj1+1bBNqBlwEhHputtY3JRVa8DuweOEOGS4ZCZqTw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r0bd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:26:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82b120e93so226272e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963995; x=1789568795; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JR+7V3ELA9sqnRkBsDPxRpm0VgnUHbPahmeijDV/V78=;
        b=GAfCI8r0DSrJajwCf/hORYFq5Hlz5QINCvUHDAck/X7lu64+3M78T2WC2XdZ9u4AjZ
         sfoBL4x91T/1DMmSowbg7gIIq5WO4xwjfWEv5XXpoxaDtYWNcxNEJnGPzhCjl9Jmo7U2
         v/h0gk6YeE84iUmUPOkP8xajQEMFJMWSULvU9wrXmEY/bxV5MRgPrgabaYzQNQ5MqqAw
         MYkLuVOqCJYZQINCEZ/fE5Jr8SQ5jkMPhOIFmSb8254wWjnhW5Y0Fr757/p0VgZu7qco
         FDfpM+77ZJsL1tZMQWuSzlAgDLFWp7gYAei9UcWRtJ37V2g/1YKNLXQf9vc5F/yHUAHr
         nyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963995; x=1789568795;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JR+7V3ELA9sqnRkBsDPxRpm0VgnUHbPahmeijDV/V78=;
        b=FlyB8KpVYgCYW3B5+RA6aUMwsyDbo5tZtqYZoZ4I9K3neICzkqKIZLCRltLAK7e4ST
         E6pN/e+U3/waBuaaW82mr2ac0tXpuEqRW6CTPiDgL0jIIpT46DpZ159+lkvM85azPVUb
         h3xzjwG3WdTejEFQ+ah0SKyNOrpv6yWZ7mZdFaHCnPnAh1FIv0DwEiEfTNIPdLYdLHYq
         NUFOVl0tCdB/PZwcgDQMQ5egBJaZfoqDqhIcwWOfc35xc/LLFpf1T2TvsunSSx0pDmuh
         Jlx4AOFGVYl2wNR0U/qkYvuUhrNgLzcrbMZM3ezelvdBlxJX4r++uxHtsiF/jbTtcLQb
         XVMw==
X-Forwarded-Encrypted: i=1; AKwUvBwgL0zuirRGGdoIWX5zViQb+vzz8+TAm5thXjFYuh8aOnl7CI6MLmiqSWDAswAZIJiu9rCNHZA6YHb61tOfEUiJ@lists.infradead.org
X-Gm-Message-State: AFuF++nnHeHhWQSV2TBIOWIsqO5NozlEWVUMEw//GVNkR3k3KXQsMa47
	h/tR3s4pojNl5DTzbcRJEmcT1h9nKJ63Pr9lUgf5dz3Jw01mOFoW3VD01sTVBSYhbrOwCZbQz8o
	mSU5KpmknBZLZfGV4giQM9ZRxxBX5ne6eXPf3BXPzNB53cp4sOyds50DK68AU4qeRR28BDRkegx
	8fkg==
X-Gm-Gg: AYBFou1fFvCbvp/VcFyvReqKYqiNfWXwUhLPh/z2KUHoIGHByhj3tNbpY/F0WIZbkEL
	7eXTkOO12kgp+e90YDPLcyRbLk5f6ixOm42WCkrrEgbprqbvHJJoyLKQxQd3JdG+em9BbbHGKhM
	afyFFxKzOBIUo+42TJA9jbuDi5DA6Qe+sK7zLqRS35ZjwYZEoUtJy4gY85sM4t7u5BrYXJA++Py
	BDjdVkexwEHvz4LFH0IB/0p5fuge479p5BPap8vxQVFz21ttqjfdSIfIeRxrrBTPFB54dlC5vpu
	dY8Pg7jER1+7euuqdHTxckKqUvOL/qOg+2hq/kv6S21qTld/qOWokMi9iZFSA/wUP4vKurHOGQi
	6H3y7rONgKr0JkQ==
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr17726981e0c.3.1788963993595;
        Wed, 09 Sep 2026 07:26:33 -0700 (PDT)
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr17726204e0c.3.1788963986664;
        Wed, 09 Sep 2026 07:26:26 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm39428246f8f.5.2026.09.09.07.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:26:25 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2 0/2] net: stmmac: restore previous state if
 tc_setup_dwmac510_mqprio() fails
Date: Wed, 09 Sep 2026 16:26:08 +0200
Message-Id: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OXQ6CMBCEr2L22SX9QVGfvIchpNBFmlha2oIaw
 t1tOIIvk3wzycysECkYinA7rBBoMdG4MYM4HqAb1PgkNDozCCbO7MokxmSt6jB1TaQ0+0a/M54
 4a+zkg3FIIbiAXqUBL7qshCqllr2AXOgD9eazjz1gpAR1NgcTkwvf/cDC9+ifrYUjR2p5xVutZ
 cnU3cVYTLN6dc7aIgvU27b9AEp1IkjwAAAA
X-Change-ID: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa16c9b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UB8DtK870HQNYGIhTBYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX1nCZEnbOwjYM
 N7JyR7qxjBHNg8KPGgM+LqUTroco+X9+BSk+N3+gRaR2aLT5EBSkVAwNlnZI6nwPN+iHqGzNyL8
 8+WTXyubDG+S7kfhEllyErmo9YMZ7Zd3f/GzPktoDZqiNCosmwTIViJLskROBS/YJXiIoL9g2c2
 pBRPViKLD5OZsPyvCxv8GoN+znjEJ9Rm3T8rJ9r6z06Uo25Nu7PNb1bJN+ArNIu9SUhSfw0REvR
 2nr8MYimnjCRafhYJn5SRZgKk951SKAB8BOEoakE1RrZwM9lw4Z/cwgjNfmTEmwkFOK6d9a/rCE
 kl+ADa3yvhY3hRnkkiPtd4xIOvx2EozD9PULJtbsPSgpVXtuMqU1FasSxEGczDmrAD07yoIqYLd
 vx6VX8Xn1pcLIijzLX77PP2Oeo6ELnjFg8+kgUsrqePsoujHMey6EfjTbKq39Vv3iAsSAXtIU4O
 vhqExvCjWmlMbMPC5GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX5dagz5ZOwt8S
 NMLYpa0G6h2tuNQiHqzGVjS25dwEAeG8uSAc+IXVGo3hWDW0eqnrABC5glL0jaUHvwbUOguHMo8
 8p/Wefd0qBm9E9sDlg4Bgo9NBlWrAd8=
X-Proofpoint-ORIG-GUID: uwf1YcVnJ5_AkT6nWLrEsjnxh7tfFd4z
X-Proofpoint-GUID: uwf1YcVnJ5_AkT6nWLrEsjnxh7tfFd4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_072637_120714_DEEFC449 
X-CRM114-Status: GOOD (  10.98  )
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

Restore previous mqprio qdisc configuration if
tc_setup_dwmac510_mqprio() fails running the following configuration:

  $tc qdisc add dev eth0 root handle 1: mqprio queues 4@0 4@4
  $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P

Propagate FPE preemption-class mapping errors in
tc_setup_dwmac510_mqprio() and tc_taprio_configure().

---
Changes in v2:
- Move stmmac_fpe_map_preemption_class macro definition in a dedicated
  patch.
- Improve commit message providing a configuration example.
- Link to v1: https://lore.kernel.org/r/20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-v1-1-eb171bdd340a@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: propagate FPE preemption-class mapping errors
      net: stmmac: preserve real_num_tx_queues on mqprio setup failure

 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 97 +++++++++++++++++--------
 2 files changed, 69 insertions(+), 30 deletions(-)
---
base-commit: 382a373d9ea7a6ac4de9c022385b6217f65ae3cc
change-id: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


