Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD16C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eE6eUxpMqHxeuN+lR4AFDf3e/mtKNvxsFBwzQyNzYP8=; b=LW8LV6dYq63MLt
	8MJE1siaZZ/qm8pCS3YF0U/PDmy4ZQ4dR/EUXZ+d5jD24uvJPqPPsHYY01pVIka1VH/YmvxH8p0EB
	vHXBIhvdvU2dl9MGnECYpFZGdIgIsQ25F8zt8PNhJUdxvs1DVYSl+PsYxueVaPEkzHPE7SVVYPAbT
	GF/CNEGjCrRnJU1dE2YsxHFBO818xshd7wetlF0m07v/KtJunjS9XyGmIAyWG3/wCJMp2FhnSjYsC
	yrW6kXBAiHLSfiOIYgdscynt+GFzDcMCYd1r48gYlJfc+5R/X7KdO/8nmdmqpitOOoHJLw2BfOJK0
	Zv1mWwTKD7+UXmRiDpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNQ-00000009StV-3tyS;
	Sat, 08 Aug 2026 14:50:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiNO-00000009Ssu-1Skc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 14:50:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678DbhGr3806874
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Aug 2026 14:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eE6eUxpMqHxeuN+lR4AFDf
	3e/mtKNvxsFBwzQyNzYP8=; b=JePiLFGZdraW98aVdc0KoXxguK/o/qx1+w0GZU
	xy9zSnMGaqHKhVsJ7/KJEsN8AVGUvZ7HVNQ7mTTckAITDyxMyJ5o4p3ipgZH2FLe
	RjdkMgKqTID2Xe1MctzuVXVGWRpLAm37HLfSMPrpsuCbUsivVyoDVykFQ+EuidkJ
	uzKIdUVI1dZ5CldRw5gQsixPL0E/gDDP0ETslx54r17G/eBrCyU8lrNAgqaaV7j5
	dIQCDxiBD9nZNQy3lBwgyfavIOR6W435pvn0bcMJaYXk2Tf9s/QBx2btQbXVyjPS
	UsHYzm5kSA31hOI9w9oKV+XBDNZaee8epj7n1SC68uy30+5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9gwy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 14:50:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso3826781cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786200616; x=1786805416; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eE6eUxpMqHxeuN+lR4AFDf3e/mtKNvxsFBwzQyNzYP8=;
        b=IiabJsFYTPynEHsHVpk4PXFRQL/NTOEeSlNrRQ5znrgwIFr1b0OmHH4pm2aji3JZy7
         GH2UQ4U0w0CUpVEGwQnRGbNsRtRWGTlttS0QAHis4Yovca9loAAjb8mrqeApllUayt9O
         tMagbAorrXFBzLzejrcqS1IWmSjVsgQQRKcqMLnx32qT4w2Cb/jl4Z7GhmjggLaO4U+e
         ZsDm+9mxOPElpEdXZtdNkTEygFzJerezBU6xIVqgQAGgkqrEM0DJxyM/RlBsNJeKUdI7
         MubTFj8JrHVALiRBZ4BwJbaqxGfZAKkBOHI0N1OyDSTqQ6uSpnhAbA6uO/iFxdNf3UZR
         RV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786200616; x=1786805416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eE6eUxpMqHxeuN+lR4AFDf3e/mtKNvxsFBwzQyNzYP8=;
        b=R+/+oNN3Ebri+rrulsc81vWbqOnxVqiFoGH4lJAfQ89pWRr/JJmsAy5EJwaJYXfpVN
         XnHiSviUri4XyvBVGgD+oimWqH9oUjiI/jLupvLTy3H2n53Oc2L64p+LVJK2CdHwnHRu
         H7/lQTQf/wTpr7MfeYZxGhehI3oCEjAxiBGLI8NRsiWid4n681i4eyqh0+c4/f/SBT2I
         L9/AUyR7d4aXYniocrGEy882FGrt2D32qqTo4BZL9sJq+bgTDY7UOpzr0u8lI3lkdQ3J
         lZwS4mLTyLfR1j2/EmCIeZlckghyFo6z/XnkIvOwdtnS3lWtTqj81nXXVCWs6jZ4kFyw
         DhDw==
X-Forwarded-Encrypted: i=1; AHgh+Rpvp5V92FvDCqRpeuqGxHra0klwFEM8kkO4ifFi9OLBFm3PYJNeBciuQk0umiXeYA0sJh9sYoWLznI5fNw6/Wnw@lists.infradead.org
X-Gm-Message-State: AOJu0YwJFAC2zZoQIZD2OkxeMuGUeXZm3FlrpLSl1MtG5xGY41pHT+yL
	AVOMV/2fFoWVB82CspvvOWd4QMzpDmDVWTuegxrA2Djc5Y6Epwzox+ZPWl8RVXipreiAdz6EHyE
	pObRqMUfu3ICap8xZ1aMDhmCBSIHCjSo6Pt2s6yxGzQyJc/JMtIf5I1oPLgFkaK121ACM52Y7sl
	TVCQ==
X-Gm-Gg: AR+sD13c80oq4H7zSzuhugEajjEyqpP2dTOzYp4mtvMttDXSpF+6tXOmrJYblBnBjuv
	OmFnFvc7K2u25GD052PlPIhw+X4TDyLk/LE+anD07PJwqEUiMepw3Uqb44oYLvtGx1G4/bvjMH9
	/beq3U9EgEI9+Pq/W4WwwtdoCs71qzeCeqk6IGtr1ZxSTG56Qb327kfBHCFoobWVisrydp2bz8f
	oNUMELi7SWee5ZOUZ/IP29MlP+sx/VjpykTKSOmmy/HrbKe3SYYE7OmkVUF0o8h6ojmTdp7POUh
	rDnDHhs4NWzbV479KjuBksQXlMe/MsIYXdo7X0e9mg/CTi9nqwkSjg0tzwI+an6qYzJ0HMAm2jK
	TI1b46SYLTjtiTVA=
X-Received: by 2002:a05:622a:148c:b0:51c:52a:8e70 with SMTP id d75a77b69052e-52ce5f8237bmr315119811cf.2.1786200616251;
        Sat, 08 Aug 2026 07:50:16 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:51c:52a:8e70 with SMTP id d75a77b69052e-52ce5f8237bmr315119231cf.2.1786200615682;
        Sat, 08 Aug 2026 07:50:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021509a5sm14623982f8f.16.2026.08.08.07.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:50:14 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/3] Implement mqprio and ets qdisc offload in
 stmmac driver
Date: Sat, 08 Aug 2026 16:49:56 +0200
Message-Id: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQrDIBAF4KsE152gppjYVe9RujD+NEKMrVpJC
 bl7xVUXoZuBx+N9s6Gog9URXZoNBZ1ttH4poTs1SE5ieWiwqmREMWV4wGeIyTkhQacI3pjZCwV
 S8o5Jzo0aCSrDZ9DGrhW9oUUnWPSa0L00k43Jh0/9lknt/8GZAAHTCcwJ44rS8epjbF9vMUvvX
 FtOVTP9lfpDiQIGLiTrheFUjsOBtO/7FyaHU3MPAQAA
X-Change-ID: 20260804-stmmac-ets-offload-cc936c99fdb1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a774229 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=petc-e2FbpDzYRbdd-oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: aQgSwFeVGMtZxOWq7_wtOY1g4td3LExi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfX19I4TpoxB+WS
 sHMWV2aq+2YCWPTtb/qNR+I33esGHvCBL10c8su2c6XQ8dsvJQHCSwCr0N6Z7ShzPWzebogTsuI
 807nhCeDQL1OCoGzQoDm0+GAFAbEb3nb0AjrIaeDCTI6h3Lhh9i7FHSMn56Nc9FA5VusGqVlzOF
 UON9UvTSJHoiRze7oXtS7AKSDCgYiS6zq8kPVNZlGDe9HorCYz41PXpuOZT6R26XVkojEfobPHO
 xDivJ6xgPmzd3wTz3hjQ/VrKHew/hj4fzhsJpFljxLJBeQ08F9q1NY/ofhcQjtebuU0jkKnCs8E
 9FHcMnLsFxP+TkJCw7WHkgSl99yEFGxmCPaqU3Tx3yc0UDGEpsoiv4+1/WnLFuTOUmEhasqYAka
 RNrByM9tUkBhetbO4ogaqCyoxNdXYPEQspiueF8MZGxcML5EDq6U/KLHHNoCiMLpq/FUJ+ZEalU
 zFNiNmnJrOfA6n8j9kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDEyNyBTYWx0ZWRfXwAS3TIIQlM+T
 TLqOt4kP6YxBRk8y/j8+P1KMeyBl7c5sI6vr66YUeFxXKqMI8GNErgKjLyY1Gy3xAbRaD0bHtDz
 +rsr+ix2czE8D8hxSDdZG41FGJlvfG4=
X-Proofpoint-GUID: aQgSwFeVGMtZxOWq7_wtOY1g4td3LExi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_075018_458861_8261A24D 
X-CRM114-Status: GOOD (  12.38  )
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


---
Changes in v3:
- Limit number of tx queues to ETS bands enabling ETS qdisc offload.
- Do not overwrite previosuly configured qdisc if ETS offloading fails.
- Check dcb DMA capability before programming the sched registers.
- Always power-on the device before applying qdisc offload configuration
- Fix priority applied for SP tx queues.
- Link to v2: https://lore.kernel.org/r/20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com

Changes in v2:
- Implement strict priority policy in mqprio qdisc offload
- Restore to dt configured values destroying the qdisc
- Do not ets offload if there are any queues in avb mode.
- Re-apply ETS configuration closing/opening the net_device.
- Link to v1: https://lore.kernel.org/r/20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com

---
Lorenzo Bianconi (3):
      net: stmmac: add tc-ets qdisc offload
      net: stmmac: add tc-mqprio qdisc offload
      net: stmmac: hold runtime PM reference in setup_tc

 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   4 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  10 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |  20 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  86 +++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 159 +++++++++++++++++++++-
 5 files changed, 251 insertions(+), 28 deletions(-)
---
base-commit: 8ac4255c1e0c83d2e1559a18b8918673116fc8d6
change-id: 20260804-stmmac-ets-offload-cc936c99fdb1

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


