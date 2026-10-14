Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93156CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fxVyJQjkYpcPZ3DCNVSAAYsZSsu0sxPUoy58SbGtpRg=; b=o1Ex5HaSSP5gBw
	GxH7hO1a9Gnj1HTdzEDI7mmT3o45I+pX5ZFy9Kkgk1DDm3HGRQlE+PSH2w6x8AjWZD1+zzjIPmNre
	S7AKuYDjcDF5B9asJt6niGI+EMSTn2y8FBjdb5vmBvBbZ5+UobMTCrsHFFgH0YTkIf510r9MgHsFd
	4xZakrqiEaQwfl5DwYDEX095CDeeNLZsBm+jbjnEVejxo9hqy3Ia6RnVYzOuDrybyss+SRoxmEjgv
	Qu4Gf9MemCMYb777F7cdGXWIDu74Wmr4AO6IznSm9H1E7p7fqrK3PL/l7fdqG+WsnKyOlh47iPSSm
	jOZZUGB0t7T6hFv3nZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyk5-0000000FXVj-3Gdt;
	Wed, 14 Oct 2026 13:10:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyk4-0000000FXUt-30sx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fxVyJQjkYpcPZ3DCNVSAAYsZSsu0sxPUoy58SbGtpRg=; b=QYBxa2b1P1srK/cxqLkusyKEem
	sCqjA2mzm6Pi+WeYmduSS3Tsz47z0bmorjKd4EVSlVJ41WPfCkjVQGcKvKRQA2qLHIWo5qgubR+0k
	XFLe5/IsiRE2IlEO+zKXVINBEt2ZNSE6jcnW3J+HiTwxNb8K8bO4ee532a3KeWACItm7FBeTk97D5
	cZ3HAMSlJs5H/ZZJRDsr+G9LaGJ6Zr67Z3kPX66wp2jfBZ8SD6DrY+3VfvavhiawZFOVUkSuP85Xu
	7J0M6BgAeDwef3M1OTRUVvQC9Nwdo5nnBNSidzyD0/I+f1hcZVTjaiYh+UdkFKdoyzvwCunBCA0oM
	Dw0z0YsA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGyk1-0000000GnWT-1rf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:09:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAvEAu3950860
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxVyJQjkYpcPZ3DCNVSAAY
	sZSsu0sxPUoy58SbGtpRg=; b=ZfNPI99DaVzQX3sTpcqZYOPv/jC4NxkL4HBaXI
	4mBUJeYCXB7XRio2Ac6VNBoz2xHjBCmem5DM1tPz4DPL1Ypc/U77HMa/Fn4iUfJP
	/zsKhQHEnm1dabsLEbAubtUZqlY/syypHAj93izv62iB7BAHxwiatWUsR3dI3myL
	nSgIlB/nhwvrprCkS0nSGQQZB8YO3Xn+330EL0mhgK1PskrGEpHRuSPDGAW++D3s
	vJ5tz6VXAXFOnI/8dv2JBRfZOTzMOxu0hFJoc6eDrHWrKA9l6WpMHutsh4u8CY20
	kY3vdUUDUjop60ZfKp/N9ARjWMl6Qwcam9KJnlPSGX6BtQeQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p1qvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:09:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf853be08eso637566137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983394; x=1792588194; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxVyJQjkYpcPZ3DCNVSAAYsZSsu0sxPUoy58SbGtpRg=;
        b=iaAXzEU8IBwbJUqDfdnt5aLrM82dCz0dhHfMK5Ai2budWr4einrpe19s7Bmuawz9sK
         Zt+TGgbbCBrwI4RYmq1xNiUpjzHziN8z4pFQ5X58FuUV755gvabuaIARi4A2X8w+NCmf
         u655s+N4+oA7vQyYs/zyh9gP+eQWbuFa4d5FNehzs0DsVbK0CPPAmPC36pzhLxlmuU7v
         d2gNdi9clJAVkcLX3fg5oR+D6mUypVDc/PCF+IlvisHnSWDtLcSh4MD6FFMHHvkYaZTk
         h9uB3SMRdmwbBsyzzvQj+gHXLc8Vjxexu3IIAVFeRzULgWq0e3FJrqzc7bawm4WkNCDt
         b/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983394; x=1792588194;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxVyJQjkYpcPZ3DCNVSAAYsZSsu0sxPUoy58SbGtpRg=;
        b=bYQZg6SxMJfe9bk5q6A4HUVt4R/7tKR6UsxNUaNOOcUKVLqL/rxu1cucX4CUv4UFHj
         H9OiG0gtZY6NzyI0YvG/Px3yp/EAHQ8e5RUHKvf73Srm7to77biHzN7CqHKwdlhQm5uO
         mRDQZU8agYRo3pij52jiw4qMzPT0Tsy2aqhFfUQjGKRRQxId7ZWNarewjAAHJmwNqOMG
         ZNflRxiq+re2TKhOR6XVWluSbgbo0cyAhFbciHh7hHV0lkp1KHvUdt2eKD50tHe2MrPc
         hG2oLInSzKHdaCEXHb5X6l8MafQbEcYG88ad1sL1IZx4E0nN8ttgePbP2tkdstWzFz35
         T+GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfAAEwmFF9XftyrqAPHkdtOXdlWK+tIHKB1jbJ2DAZWGBfHXUPyfNnXNduUjDC4iQeLaZw2ctBtVIO4HFtE5ej@lists.infradead.org
X-Gm-Message-State: AFq9FYLbulJ8wpuS7b/e1yFPC42s/5do9We0AEaXHNgCLYhXbnP4IFN5
	UIKpkO7joykgpYqkRmJFzZ9IOcNolFjtFPGNngMim9CrKUgxiY33hT4ulq4xM/wJc8+kilGPsnN
	+jblRaiyHBo3BTL1MUJEMkHO75Wi5QKstpk+/SnH12xlqD7zeW3DcvEXQjK9ew4by7xQoF8RBL9
	RXpw==
X-Gm-Gg: AYBFou0VyDphjacl8lKwVfCPX/e+936B5bhmqJzypefiG0XSMNF1Tkdjq4QUQ7qhC43
	ZW1JGPRux2mG0H5rCxYlqWgV7fM/DO+ynrW8vVSzEnS8ksaq8pHqUiTCUF0sOY4aXkW9G6Q6HKL
	s0Jwxj95CQt+DoKyerO3cp9sFLwppHijtGjAGnMMNka2TTTqpT5QY2JB32XqpgFXVsTnJY20pbD
	XbRdKtYtKtuHVWjV+O82FTmhgR6orHceupam+YfPIee48k0uYQDlPILCZ/aywlfKrgFH3Ps1nCi
	QJrDHa8ywIOSBjZrjQx//l6covScEO88rF8Bpw8YJPIz1b+2mCUNnQO4fuxPxVOT73tNHB9AVZR
	piVO8X8phsNU+/g==
X-Received: by 2002:a05:6102:869a:20b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7cbbc5e9b16mr1454822137.10.1791983394302;
        Wed, 14 Oct 2026 06:09:54 -0700 (PDT)
X-Received: by 2002:a05:6102:869a:20b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7cbbc5e9b16mr1454810137.10.1791983393670;
        Wed, 14 Oct 2026 06:09:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5265sm12641340f8f.41.2026.10.14.06.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:09:52 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v7 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Wed, 14 Oct 2026 15:09:34 +0200
Message-Id: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQz2rDMAwG8FcpPs/Fkv8k2WnvMXZQXXk1LEkXZ
 yGj5N0nchghNBfBx4d+Aj1U4SFzUa+nhxp4yiX3nYTq5aTijbpP1vkqWaHBYBqodRnblqIeZt1
 eNAQXGsIKHJOSlfvAKc8r9646HnXH86g+pLnlMvbD73pngrV/Tk6gQZuL81BdnXGU3vpSzt8/9
 BX7tj3LWL0JNwbCzkAxAtcYGFKyJhwY9t8AY9zOsNpobxJBBZQajgeG2xphZzgxOJGL1FSO7fX
 A8Fuj2RlejGhrUZgIbH1ghI0BuDOCGIjojZeH+whPjGVZ/gAGKGRBDQIAAA==
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXyUspqPgMMXTb
 e1DUDjU+4ahHCItoUFW9IeEEVMJojxBzntWRGielcViiMrfXdD0b9Db15FcZuEQlijwEjgapTjN
 +rFkPx4lgZMZekb3/GbDoWa1FO5puZw=
X-Proofpoint-ORIG-GUID: CANeSTogNpw1DxqyXcfqz6EK6aD5qxNq
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf7f23 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u4BqklbH0r9NqUsF4ZAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXxeDriN7r4KXg
 e5sNzE1V8U2F/8I4m4xf6TZh7XWqisleMcr3C5IdsGNSNBFUo/4GCKuCMyUh290TMdgsokqHFV1
 P4vChHYP3d1QLpr4h+gHIujRZWPx5d2O30RMR51EMBE4dlbTkWwRxCZ7DLE8GamL58GdcQvg0qP
 ZdUp5Wdw6cVX5guaLSPtyHLRHG5dxfIhd8gXkvYIsh2yaaLyhCh77vDv8g7Qn7/m/0hKmvwsxML
 LlwQvGuh0U1WS53r8tkx8OUAOrt0n3Vnq7oU1CNfghBQctv+L6+NnKXg9vaEnnUrALNhGdmPQ6x
 qifq4peWhaSFgIdQszAUjX/G73r/d0j3yg5S8/hyCrEqeS+JlIRDqXVYt170wKox9gGUnaRHrPS
 8i4SvYGVbYvWEma1GQFXpD8m9K80A4zGzfr1SGvtF5oJKXjRS+8xvRVpUtM5PJIF1rtiw6YSh9M
 Qon3ohfyD9oqvKA4JSw==
X-Proofpoint-GUID: CANeSTogNpw1DxqyXcfqz6EK6aD5qxNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140957_765691_1BAF16EF 
X-CRM114-Status: GOOD (  17.88  )
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
Lorenzo Bianconi (4):
      net: stmmac: take ownership of saved RX state at poll entry
      net: stmmac: drop split frames on AF_XDP zero-copy RX
      net: stmmac: drop multi-buffer frames in XDP mode
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/enh_desc.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 407 ++++++++++++++--------
 4 files changed, 259 insertions(+), 155 deletions(-)
---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


