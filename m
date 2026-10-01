Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7767CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0O6Qs45TDus0yIJUBi/JItW2VAUBzgWzJ2m1CkHKx8=; b=N5k+FZeu/N48E/
	7FNnWkt9/DsRtG/EcishNKawtvjyxCO02ng77605knVL53wmwxPgtVrtUnCsPsB+NeNga0lGG8jUP
	rf8GvljWbUYtA3f4Fdiz4ZA0KBkf2DlCUOGuI3zZ9G3f81KosP3HrXLtHlvI+3YIxNmsUnP6AsSjN
	JyiVdQK3531evgOdMBPYUMXKFs6Bi46/bhVU/HsLcvjEh23wO2sj34L/28pNcjFz4xpXJXCSTDGdI
	QPGQFQ0uZwcTson4tgxCJmipkddlYT+46+jpYEyySwsB8a/Ka15cXdogeN2AslPSJiw/MSeq/pMPO
	DZXDogN95ubJJ5qgKPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBU-00000009H9s-1TYN;
	Thu, 01 Oct 2026 13:50:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBR-00000009H9C-1Rto
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:50:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dj4X52188546
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 13:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K0O6Qs45TDus0yIJUBi/JI
	tW2VAUBzgWzJ2m1CkHKx8=; b=cgdrg/rWYZK5huQ+s29oen/YVZPZv+ok6ITNj9
	JIiAP+eMGqQfHm+kjiBSWWGGKYQnf/0LkZAIo/ztO5Lr9Sk1ZWXGdHmyxuwv7DOF
	cC78E60rKIuuUpRwFb8d81u3YbCyAiHeDdSn1O+RCJlrCM2M7uJQGYUHS/YUZkZF
	fgz8aQmwYtiUux2I9W89NAkVQJS4HlaCbpntWOS3nzR9ueL2nqFLf7kWxbX2oWcg
	diQ7MilYPqi2VowbyJ6vtVKpwB5x3KMvGOZJet8kcekK33KUf1lBPL3HsO8cctnX
	tx0o3GVVQPgR/JQ6zRDxRgSTwBT/6TY+3p0qFlp2rrfeMQ9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjc9gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:50:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179d9cde17so16177216d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862648; x=1791467448; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K0O6Qs45TDus0yIJUBi/JItW2VAUBzgWzJ2m1CkHKx8=;
        b=ftinr7a87+6tHWnxm3OI/CLM574HdVuGtp2wVtK8pOPvdIm2rcUmfz30yg3LckKJQB
         2Wn6JkIfz8wUxuTc7EnvGFhOEhz1pb7L7EsraJFc5MmK4PftqWGe6AvJKBQU8RrHxCer
         FCi+VVQqqPqTvD0aYSCRTbBAIhxz2ip5UiTTmpSXjsccA6UDEP0JqsqrZmjadqXV8mT/
         newHS7Lx30SKSAwpSptbCGJsgj5kzILI05SDVtC98uUABP7dkBmgvCYY6BNHeMjj5Uvf
         XGDC11jttVpZt2JLAlz8zu07bLgcbrYNoKl4HBZDzbZsnC9vlnCQNp7SrYgl72sdXHTl
         W20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862648; x=1791467448;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0O6Qs45TDus0yIJUBi/JItW2VAUBzgWzJ2m1CkHKx8=;
        b=whXPCybkB7SaOeuzlcYJAM+x5E51/xPd15zCga3nISdM+jHRDWR6YMIajoEshcYX+k
         nwmwIzYLlbCkyzQAEOeq/pHDTVnfi//CvW+Q7PVwCDzdQuT71yOxy4U0HTzNthqoPkWY
         UKKju7tUuO+XgSo9CzuvK50B6G7HuX+gRJEfDT0uXQ+NExrjyRpKSkCvRJ0XazhNT3E5
         1ybTKUSaE31LmXAcHhkKXQjirRDbvZfNW21SPf1MuajISYK+CPI5sjpFG0sRMejKu1nM
         NAWQBn6TqjnfXDXyc3OGsh3jlc0E3eDcrdz82N48qSoPBpugee2sylKpm5MefOotp2eN
         ATww==
X-Forwarded-Encrypted: i=1; AKwUvBzZTbjVJMkkquG9E5GrKwyDtoLOGQpxC0GVfoPsaQ3//W8ggZ3Rj9dsdoh0hzhbNBjKCHWDjH8J2pkBWOoTsMca@lists.infradead.org
X-Gm-Message-State: AFuF++loPW59hFaBKjbprNlH7b2b0sZjURB1qf/ST8vnPa4nyuSn8KUn
	mQTMQl2a44EXhZI1c9x5Nm4UKduaYMlRERAMbNlhKqdbUxYhPjRZcsI4sDfQulJz3DmRaBPTIq+
	IZqxlPW9WoI7ELnTt1J8BTnYINI5hDlA9pFV0HLtHt/dOXldkGboHsW7PLd/TwMtTnfhwUPMbZT
	rEHg==
X-Gm-Gg: AYBFou1d25y1tZSFnl2x9pGMSGCTIIv9XZE70Xz8mBfVV/I0HVFoN8ks2sCQfEeybon
	yfKYupccQoCu6EYznXFEsCo2YEb+fAxqfC3r+3YPhROoulv2Fd+Bgj3I8C8i5WWvUiStty3i5YJ
	YqJYhYKEkhs7bisxLZPhgN6KOQx3HkipHA9ckZ8FyfULFCnCKhb2H83xQvtssAeH6MCjCzmretv
	ncJcoELyUAFqy4lnb0V4hsnruGamj0nRg6B/5s/BCE63pKTaFJT0fYCjh0TTwEj2pyAhRqIdYUp
	HYei341bvBIzowK/O7BKQihykOiqM6lbupZprehnt1i00RKF723OcV+NLtj3Aj5ifXLU1ds/z8k
	hRLJoNRUiOfu9DA==
X-Received: by 2002:a05:620a:2709:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93ca97e6dafmr964484685a.66.1790862647576;
        Thu, 01 Oct 2026 06:50:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2709:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93ca97e6dafmr964470485a.66.1790862646085;
        Thu, 01 Oct 2026 06:50:46 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm7352068f8f.22.2026.10.01.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:50:44 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v4 0/3] net: stmmac: Introduce hw queue priority
 offload
Date: Thu, 01 Oct 2026 15:50:17 +0200
Message-Id: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTQrCMBAF4KuUrB1p0tZGV95DXORnRgOm0aQWR
 Xp3Q1YutLh58Bj43rxYwugwsV31YhEnl1wYcmlXFTNnNZwQnM2diVps6i2XkEbvlQF/u0YXoEQ
 gugRlobFSWNlTr41kGbhGJPco+IENOMKAj5Ed8+Xs0hjis6xOvNz/GZg4cOgaIXnXk9Gd3IeU1
 re7upjg/TpH0SfxIYp2URRQA1kr9WaLZAz9EJtPcfnHJotKa+SSU1eL9os4z/Mbyz4iGXkBAAA
 =
X-Change-ID: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Davide Caratti <dcaratti@redhat.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe6538 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kCoPmbC7odpt6DihikQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _TlRzVcU6RDZKqja166k2DpzPRKBabDm
X-Proofpoint-ORIG-GUID: _TlRzVcU6RDZKqja166k2DpzPRKBabDm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXwdg6DL9pPM5a
 LUMvyA5T5Sr3bxBsIi2PJ/iqgJZeI0DUt+Iyu2Saq24qgs+WxjKdC6Hvdoa/tJizGpiUfjFBjFE
 igj8rcXs9EoYVrKavISGlMX6KwW6UV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXy4wpKCqbbUW7
 fZj41jmtHVF6zMNIe2oI4Sf0YPvsey9u1bRav6/SXMGDPByCKfsLxHY+OksYYPUm7x+uerTyTXp
 snuPeMjT7qvUvFw+C1xwOhXENvngkgfTw9t37W+LMoWiPoHLSmL+2Zk5NyZvNqFwievBHmCAuqS
 EI1D7K5+5kbGa3YHFG+qn9NhuhxlSvxWMeKjAurtPZ02iUTdWi9o8EVMvsWtg89+BAiVqcK0dx7
 YjOgxyzObth7/2LHEIasbBPSjVDVZ2mfVZ+tzngRU0mTpdsUA++uuRDY9PBAGyRxj63vZ8juBPO
 rNEFhV3qQEkPSq+6oAKhWeWl6xUVqcEKwZZuablskumqHZA4fChPfLxxUyTzNPCbAlhOo3FwpxR
 G5IItVMn2vhwQHQA+kIgLKqMTvgz0UgScsSpS7H5H9cpwLGZUK9UjqzlZaF8v0QJTesCz2LMDZ5
 Bzv6zfR4n4BOzY5UqiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065049_394653_36E88428 
X-CRM114-Status: GOOD (  15.06  )
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

Implement the offload of the tc mqprio hw queue priority in the stmmac
driver. This feature requires the mqprio to be configured in channel
mode.
Do not overwrite real_num_tx_queues configured by the qdisc in
stmmac_hw_setup().

The misbehaviour has been reported by Shashank and the patch has been
tested on a Qualcomm RB3-Gen2 board.

---
Changes in v4:
- Move real_num_tx_queues fix before mqprio offload patch in order to
  allow easy backporting.
- Add patch 'net: stmmac: set real_num_tx_queues from max(offset +
  count)' to fix the real_num_tx_queues configuration.
- Link to v3: https://lore.kernel.org/r/20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com

Changes in v3:
- Fix cbs overwriting removing mqprio qdisc configured in dcb mode.
- Return an error in stmmac_reinit_queues() if configured number of tx
  queues is lower than xmit_qdisc.num_tx_queues and mqprio offloading is
  enabled.
- Link to v2: https://lore.kernel.org/r/20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com

Changes in v2:
- Forbid cbs queue offload if mqprio is already enabled.
- SP requires 1:1 TC to TXQ map.
- Fix the real_num_tx_queue overwrite during device open.
- Require the qdisc to be configured in channel mode to enable hw queue
  priority offload in order to not introduce any regression in the
  previous driver behaviour.
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-mqprio-prio-offload-v1-1-5328157fcb58@oss.qualcomm.com

---
Lorenzo Bianconi (3):
      net: stmmac: set real_num_tx_queues to max(offset + count)
      net: stmmac: align real_num_tx_queues to mqprio configuration
      net: stmmac: add tc mqprio hw queue priority offload

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   9 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  37 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 147 ++++++++++++++++++++--
 4 files changed, 172 insertions(+), 23 deletions(-)
---
base-commit: eb0c18404c8943356f4aa164e5db9067b79ea93c
change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


