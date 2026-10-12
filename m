Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AF0CA9EDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=64A0NSLF+RhR7KJefaxknO3D/6HTCylIyUlf60T2HYE=; b=0eVbrgTcB0Fj0R
	RfL1FANDkbseFXUR+7FttQX2K013myiDiW9g8EQO3lmyq+z8RfTzoAaGkRpt827ktsRy+6XpIrPOn
	9Qu8GZhuzJsd59SU5Jc1KMPKs6qFIKe1Z9X5/PQ9Y//YAl22bd69Omab5UTTcBUCfEuNUVnsE15Xb
	1Jc+krr85+MFlogvstZSg+B71s/aaMinY3rhsUetjd6j7vSTMbYe16rFHXYh6go2dKhZdrvArULFr
	QANdPe221rdorNmq3aeVbn+KzT08lKN7kbFz292VtZPN1AbLBFz296voP2MphYb3lBTvP/6DnP1xS
	zGrwLyamLDp1/pxNqBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8m-0000000B0Oq-3UtD;
	Mon, 12 Oct 2026 16:44:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8j-0000000B0N2-1zn8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:44:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfSNd2768440
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=64A0NSLF+RhR7KJefaxknO
	3D/6HTCylIyUlf60T2HYE=; b=C74kC4stmosWAflzTj8xlB+5cXLSEfqQFmx+W2
	NzmmGeiknym4AXBILTt/5h576z5z/RLQkxOKlipJPIqPo+HnuRh7h+PuqcLF036b
	jICrv43i+d15WVXEv2kTwqXCrRPIKZXKsho/UPDjVRjSHaXN96BQaStR/a+I7aV2
	13Cco/23nuhbiYICbxCY1uhPDyUxjBhuvXkh9+2tZu+KYuxeOmjjqosemcVrZFE2
	s9uBNBrw1dUq/w4SVv2sbZdD6wfAw8qnGZDQ7CCmm8nVcrPIexzPEs6mEXrYd+GY
	fQK06Y/7qhfw9jUy6o5sH1PbyqIaTomHyEZmaLVPqlnD6uRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq2e7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so633460985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791823480; x=1792428280; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=64A0NSLF+RhR7KJefaxknO3D/6HTCylIyUlf60T2HYE=;
        b=KVI/qcf7vERF8ptmzAne2TEqDPOsMMjo04YVCJxeos7iNwsHznsVZobzgk79OUt1bH
         clwa/wNqwnp4S/DJuD+V5vEit3SCaHAP3CwEA+zq2H//3gNAwe3cRzp5nnw2W09cTh9i
         2zRj5tZaWWbgBXZcwJJTaMiL7ZbrCJkS6ZwMWmVAfavQveOSU/j6XtKqnj6vynu5TA3q
         E2G59rGsltjc6e3J2hwmm4jnMrrxciQ4w/YoZOAJSca+aFNuxAo4vROC7+dUUP0iKrXQ
         Hc4Vmm087mJKa5suSViBNgIP7CIiPO+Ntz+BHNKJIQCTF6wlSZtGbAsuSRedKWKk9o7U
         u6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823480; x=1792428280;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=64A0NSLF+RhR7KJefaxknO3D/6HTCylIyUlf60T2HYE=;
        b=U/tGgH2N8FeN6seQ9UShC3b4HA81mpvwhKn5lYKAF65Coc0XiMAQSIoGJdT47Y/Uex
         fyldkBY0FoI0TG0ujHJb+QBq4SJPRMdKoiGwFdyUOpgW1a6L2ex7rXWcDBwuSzgJu0H4
         yU8Ie68phOVq52UVHkMKJDSjS6UuIbFYfESKyqqSfMd9+WCbSoZAFfMsmdP0kg1hW030
         vRyoLskKOgQfs6O59HcpZVJGEIXKnhrr4BNEVag+/tiQv6jDj1h+qa8qFYvfP4vpUUaP
         vcW5LKEFQ21g+2c41a0JDRXT8iSVdXrTqKnT8/TKowhdO53ZmIAMUtvO+b29pDa9Ie/i
         LqjA==
X-Forwarded-Encrypted: i=1; AKwUvBwD0va9ZYkpn0wW6lExL0ZCBX395qoFWSVEsKGROkr7GvRqTZkMbijIjB3T77yaoexPaBUX3kOHB2DDBI1rofJE@lists.infradead.org
X-Gm-Message-State: AFq9FYJf3FbpWHeZpDQ5mRp45+MGp2i9XtuK+KR8m849OMJgpIbHQRCu
	mv66ZxmR8XRxYGlE/Qlt7Jk6SrinJp389Gr47ihyGd16EQ/pZYs/2fnt0ZGnsHIFTfH3gUUROgp
	0xvNzUH0dCB5JCxXmXMxPp6dP4DYmLEUwzZwsZNBiwjAzJYBfY+THrf4lP9gQVO+cIOEJRtgWB2
	E9jw==
X-Gm-Gg: AYBFou2aeQayy104EdL1NzMXYvq41US1L10V+uh/EIiUF3jI6U7ZpEXmwFf1DhHCoiO
	9ZjdM6xxJChvZXmYxp/PCSH2cbwmwmZ5tzh9Pm2qIaICUjSmA3z7xPWNQtZwRJSLAoJH3Fc1rlj
	TVnJj9TpHcJSTYOZPEDgLSuGQZaRlv4RY7T/P7hoAWJI8+uQsroDo+P7H78X/2fcvDn0VIUsUJ5
	qh3xI06NHtve1E6bELbld2EU9a9oT+d1xJl/RfyABkyRFTBmkEesoa8OuVXYTr4j4C3lsJzcuqE
	k7IQV7kWMeWD0uTCFAInUKGfg/EGtPcMOHJ8j8nJLHTjX5EAY+dUDCHqkVsRk62ZE7O0K2bNik4
	heTyNFp5eZxDFlw==
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id af79cd13be357-93ebd2923c0mr1685102685a.57.1791823479292;
        Mon, 12 Oct 2026 09:44:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id af79cd13be357-93ebd2923c0mr1685096985a.57.1791823478730;
        Mon, 12 Oct 2026 09:44:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm419749845e9.6.2026.10.12.09.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:44:37 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v6 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Mon, 12 Oct 2026 18:44:22 +0200
Message-Id: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQWrDMBAF0KsEraugkcay3VXvUbKYyKNGUNmp5
 BiX4LtXeFGMiTcDn89/8xSZU+As3k9PkXgKOQx9CfbtJNyN+i+WoStZaKWtaqGReYyRnEyzjFc
 JFm1LugZkEmVyT+zDvHKfoudR9jyP4lKaW8jjkH7XPxOs/WtyAglSXbGCukOF5D+GnM8/D/p2Q
 4znclZv0htDw87QxbDcaMvgvVH2wDD/BiiFO8NIJSvlCWog37I7MHBr2J2BxWBP6KitkU13YFR
 bo90ZVTGcaYrCRGCaF8ayLH/2Dm6ByQEAAA==
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd0e79 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e9kd2x7fyNmJAygvsboA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX0nTPqQfxmmHE
 DsiAxuhjkc1PCN3sY84Gwyg06Q+TLXpVhaa6HsI5FcDWkupPC/e3z4a5EE1XIzc/5cGO7B22ISD
 CdMtqIa0oLX1+f0zCLLKi0egYg9oEz0=
X-Proofpoint-GUID: EBlU8CpGXOQbMJL8K1oSlZYXx99vVOKN
X-Proofpoint-ORIG-GUID: EBlU8CpGXOQbMJL8K1oSlZYXx99vVOKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX4XgBaJARqQD9
 6ekXPiJaVsdufAiSDnQ4cNd1PpfaBsfndRwA4J9Pza+1yJS4El0n2bDAWDdlV2CtF08cW9TCwYF
 /rLLi0OlmovSZKPWjfZSKfnmEVZCLF/2ONmNccL6z+sH1H4iAsjYjmRNyN8ckEMxZwNCOUpDqHF
 W63/662FLFx9GMN/JRFWFUA2BYd2RgHTR4pim0Gfg07C8S+2gt5eGfMZwVwRxJ/D/c248wir0B9
 cHTUTeywyHZsWpIyqu6DZu7IAot7kp7W9vyNDky7Jgn7pz8V45Gy/DqMxwy/OdvOaeNMe3UD50v
 abFEGDT3S4DF+hIiIJP/gr1hd0EP6VQzNUJPRFWoN8LPJ8hfjIctIlRItRJ2GKLVxgRcdkZBeL7
 vA6Zg1M+8nt59FIVAlvemxrN3pDwpcDtFaloYnkqVZei1R/01YK3gXPeshXubNZSPBUxsarqyqQ
 ep6qxw2j78IMWE1JniA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094441_609207_0AE546AF 
X-CRM114-Status: GOOD (  14.92  )
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
James Hilliard (1):
      net: stmmac: take ownership of saved RX state at poll entry

Lorenzo Bianconi (3):
      net: stmmac: drop split frames on AF_XDP zero-copy RX
      net: stmmac: drop multi-buffer frames in XDP mode
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 407 ++++++++++++++--------
 2 files changed, 257 insertions(+), 153 deletions(-)
---
base-commit: 29f144016f03608abfddcd6ebaeabafd7aeaadd2
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


