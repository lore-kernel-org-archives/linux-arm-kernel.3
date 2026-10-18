Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3655CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zkGr1FR6SIlZd2q171x8NevWe9GCqV1ciOs7Lm4JaCQ=; b=kiHLiXkqDGnHFl
	lm7K463Roxwza6ndWO7YS8ZaqylESzsIEiz6uIIWP3eW9iWaTgmxcru2iSTZRpGuneLHqX68GOg9k
	bg9T9TqCLkfDcx+1RQTO9nnepfOOTFv3by4WPNgq7oQDgBlw+cavtwqcP4GPrVit5FO1AwIMoSb8q
	rtA0iwchaloRieXLDH5Qt9fzpIvo4n1emcd5GE4Udd+FUGJOgeBSATHcG+U9dwGrEiOwyoLTS/ZLR
	VKiutCv91ixErE8+zGO475oawlBEIucZNzofpPRaPvYL9Qk8uHpNVCaDdYK3ri6f70/QF1egx+Y0Z
	KGwf2+9zWkLfGKlKtYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIULw-000000064Qv-1hUb;
	Sun, 18 Oct 2026 17:07:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIULu-000000064Pz-0CJs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:07:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IF72Gi1157728
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zkGr1FR6SIlZd2q171x8Ne
	vWe9GCqV1ciOs7Lm4JaCQ=; b=GwKJhMBCX/v16CfleU1lk/UqsiGdhI+5NWofk5
	I4b51PLmwiH63IKzDQgS++sGWNCXjArziE+BUMEGnQFqH3VPOa3lrwZmRLxLEftt
	jh0KxrQW0LawMd3dSaJk/xEAUG3PXyt3RVXmq/10PSjhIfqZ/NsHPx69zy4ba4Kf
	K/JAGy5I5akjd52OMzL+SpuxjjZi+bg2c858KnvWSZWfM1qXxSFU8LX5GDmlqRiK
	kKtKMO/Lb15eOYCznMxywoIute3NymGBcricRxELgjF6B/Ke4Bnqp4WLR4wEUoTb
	g3ZO+LshcrV43u9Fgsi2DNjTdiE8sSXR+vPKX2Hpj//0JH0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfutfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so252341185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792343235; x=1792948035; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zkGr1FR6SIlZd2q171x8NevWe9GCqV1ciOs7Lm4JaCQ=;
        b=WTNchD/jr0FM26cCSvM4HCb7t5vJByQhw+bsj7Ufb9iobWQM/rX2xGJL6mZ4r/qipq
         Mxk2hJMtebrQW1SeAduXzR2sIsXo2nL2Hxn8OPsmE156pvdLFRq4dOKe/TK6d/vEKW18
         cMu95ZxuZNHnUw1gIdowfUKBzsRBXE03JN8mo1UGn3J3SS/vA4R2BKYj0lfd37PiiQXq
         pzU0+2z/Z6tzvdD4ZNtIujG8ZZBMNmGJM2WJcJXoSCAWJRLXb6oms+8HfloafnEuytRe
         I0ZbAjK7/FvkwGDgD/dApAm7bqZLq2rCZkgpaSzBjJcNziZ/EcTibMNPPd6SSUs45qCt
         ciig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343235; x=1792948035;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zkGr1FR6SIlZd2q171x8NevWe9GCqV1ciOs7Lm4JaCQ=;
        b=ovDDnzu3hwOqLn3g22QwDg8eC9KmMKXsxq2MV3V2pZgywjFLuF92T+dEtJu6Qyn8kB
         HAvZ1i7pgEyUPvoiCwVXkgRgrPtJqZ8GnTAH28Yyd1rFUFflv6fwqYB42gThpt9pbZfZ
         +ybzAMJQwIThmKKbpfmG4p3GwucKQFm17YYSFtzI1VcKTZqYwcRPEH1yM/eMnn/ccEFi
         lFhw2MAxx+BoqVB8+6K+J4D1dlk770ENHOEt0R2Qm6VpQhzvRSQEQUPLuHHLx7kTzw5W
         uGcTS4vdS/9RVa5rsfB9ox60xVDz0Gn7ShMp1kzHrQuG3GjgGuVFe/xuIy/MNeq+b5g+
         5kqw==
X-Forwarded-Encrypted: i=1; AKwUvBy1lDVEjZHc0P4uh3/lOQAb0mLbFXFng1wvZFzH/h76iqW/+XGqjyZxKSfTPMrUQ0ZU1WVFwHPhTLRlZ1eTT66U@lists.infradead.org
X-Gm-Message-State: AFq9FYJe34siMDoOFjS/HT6wtJwdohgcYgYSiFeITMF2y/dql+5jPPTd
	IWWSoveM0D+JO0/RoGhvw1ZsFzdArbwxhqp/oWhqPEVMpDitXxNnzXgzdEMKFRgQmKX6aemXGEM
	Y/ioZXZglAC+wybo6mz4JROKSbSTxIFPrMDOGJRK3yjocAqgQmns/vLvGC14AGKZGoAx7OnP35l
	4eow==
X-Gm-Gg: AYBFou26eWIwBWF12h+OtTXRw+RZE5D7iBnGHEK3SS+SHFHIVDbVxkbTuU15XSCBDos
	40enQngY/zkS/3GPUEaGohwr/ln9Tt+iegKmYagYOzKFMmzm5j2zYMj64t4qeRBfv1WSbIViPF6
	epewhTwHXf0Fa6V6ocB3rd/Pp4yzlYeJlpcrjmfeMHGRwhOXhupr298HofAG7hEYAFe1HGWUwHM
	tS+UQcyaGggwwuDoH9KkUvDLaU5abnHj/yRx2zehbCfOscv0OF935JWyjbPXW/+50P14Sbbtbnd
	iTsA4naQyt547pLRZN4Q6BluAN46L6w6vNi6ApKxunyaa9xAdtjQYyHJ/ke0dnEUfXlX37ujXUf
	U4P9bXa22BwHblw==
X-Received: by 2002:a05:620a:6007:b0:93f:cbd:8e20 with SMTP id af79cd13be357-93f29db47d7mr961762585a.73.1792343234634;
        Sun, 18 Oct 2026 10:07:14 -0700 (PDT)
X-Received: by 2002:a05:620a:6007:b0:93f:cbd:8e20 with SMTP id af79cd13be357-93f29db47d7mr961757785a.73.1792343234094;
        Sun, 18 Oct 2026 10:07:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm15028522f8f.1.2026.10.18.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:07:13 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v8 0/5] net: stmmac: introduce XDP rx multi-buff
 support
Date: Sun, 18 Oct 2026 19:06:58 +0200
Message-Id: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQzWrDMAwH8FcpPs/Fkr+SnfYeYwfVkVfDkmxxF
 jJK331eDiOY5iIQQj+h/01knhJn8Xy6iYmXlNM4lKZ5OolwpeGdZepKL1ChUy00Ms99T0FOq+w
 vEpxxLaEHwyTKyufEMa0b9yoGnuXA6yzeyuSa8jxOP9udBbb5Y3IBCVJdjAXfGWUovow5n7++6
 SOMfX8uZfMW3BkIlYHFcNygY4hRK3dg6H8DlDKVoaWSVkUCDxRbDgeG2RuuMkwxOJIJ1HrDujs
 w7N5oK8MWI+imKEwEujkw3M4ArAxXDES0ypbAbYADw++NOg//l0eHnVdRWQyPfrnf77/4mIx7U
 QIAAA==
X-Change-ID: 20260918-stmmac-rx-mb-16469a2714ea
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX+W6r5nCkXbnt
 NL7kZkjFdYUV1QCtke5XBjIU0RGqHKLNLbH/f9jJ8hrM0BDB8MBICGYeueoX2GjhnWfjG/ZGdzb
 DZGf6pYODEPeTmmoial3tY5zTs+dFy0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX5M7g3vZ6XCoF
 w+crQ/9HZB+infy+zzGGUKdG5W3xSLzNTiR2zePUcbjE3X6mRE/WpnNYrq8d+xuEwA3fdHWq3vc
 qjUw4ygD7SEbu3MACuZ3lyKJVrY+Bao7VoUMd40U0vkdkUQcp2u5RPJ7lTJPyIjrKW3c7zL4MrF
 RmMtUmsb66/gT2uddirfgOpFGDpug8xw4RZjp3IC3PBjdpPUQiPWl10XEPsedqMP90GQOLy8WqY
 ZdYopNSyqw01GOJYTQ7vhSB0B8Llg8UoMgnZd/qIOg1/H2Udd3QG160S+MMiu1AfALwxEHDRsTd
 wjol81HVWhKv63q2ZSMIkAUWeDMBzxGs/3CcW3Zkezi2Qbv75SMiVtvQwPvFzvckYJy6PUs7nzb
 fcjDU7tN5UgIoHBGij9koiZ8QYBoOkZ4wjd4gmshGwnuAhxbMcC/Yzb7FRCIsDmyg95e7PH/iMV
 x4/qYcCOXGh9ZtlgEyA==
X-Proofpoint-ORIG-GUID: MuKH4_RZnpTsq7-GAxTdbZHmBvFvAjr0
X-Proofpoint-GUID: MuKH4_RZnpTsq7-GAxTdbZHmBvFvAjr0
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad4fcc3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u4BqklbH0r9NqUsF4ZAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_100718_142944_B3B80F54 
X-CRM114-Status: GOOD (  16.86  )
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

Rework stmmac_rx() to build the xdp_buff from all the descriptors that make
up a frame, so the XDP program runs on the whole (possibly fragmented)
packet instead of the first buffer only. Fix possible rx_q state leaks
when closing/opening the interface.

---
Changes in v8:
- Add patch 'net: stmmac: fix VLAN tag stripping on non-linear RX
  frames' to fix sw rx vlan parsing.
- Rebase on top of net-next main branch.
- Link to v7: https://lore.kernel.org/r/20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com

Changes in v7:
- Take into account the case where buf2_len is not 0 for the single
  descriptor case if the interface is running in xdp mode.
- Report rx_not_ls bit if the packet is splitted over multiple
  descriptors for dwmac100 and dwmac1000 cores.
- Link to v6: https://lore.kernel.org/r/20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com

Changes in v6:
- Drop patch 'net: stmmac: allow non-linear xdp_buff in XDP mode' since
  it requires some XDP fixes.
- Introduce patch 'net: stmmac: drop split frames on AF_XDP zero-copy
  RX' to always drop XDP multi-buff frames for AF_XDP mode since it not
  yet supported there.
- Introduce patch 'net: stmmac: drop multi-buffer frames in XDP mode' to
  fix pending bugs due to missing XDP multi-buffer support before patch
  'net: stmmac: rework stmmac_rx to support XDP rx multi-buff'
- Link to v5: https://lore.kernel.org/r/20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com

Changes in v5:
- Fix possible read after bound issue in patch 1/3.
- Do not allow parsing non-linear XDP buffers if the program loaded does
  not support frags.
- Add patch 3/3 to remove MTU constraint for XDP prog.
- Link to v4: https://lore.kernel.org/r/20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com

Changes in v4:
- Reset in_progress flag when the packet is fully consumed.
- Advetise NETDEV_XDP_ACT_RX_SG capability.
- Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com

Changes in v3:
- Return secondary page in case of error.
- Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
- Add patch 'net: stmmac: take ownership of saved RX state at poll
  entry' from James.
- Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com

Changes in v2:
- Rely on xdp_buff_add_frag() to create xdp fragments
- Fix bugs in rx_q state recording
- Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
- Cosmetics
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com

---
Lorenzo Bianconi (5):
      net: stmmac: take ownership of saved RX state at poll entry
      net: stmmac: drop split frames on AF_XDP zero-copy RX
      net: stmmac: drop multi-buffer frames in XDP mode
      net: stmmac: fix VLAN tag stripping on non-linear RX frames
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/enh_desc.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 453 ++++++++++++++--------
 4 files changed, 289 insertions(+), 171 deletions(-)
---
base-commit: 98c2ad4f5d805dbc1ea436a334ee59311806a48c
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


