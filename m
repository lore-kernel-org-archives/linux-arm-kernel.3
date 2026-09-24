Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA0C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1BYBocMOfeShm/OCiT4IsitabOYUNDg/Bfw1ZPW2rVI=; b=ZaQ4LithBx0FBH
	GrzGKTytIh4PBrNoY0g6HyQvG3A5zJNCNbDmsdt7gVUCoPSjFSxcdAp6mUkjxWG/0NgGT3wFfEThJ
	418yNlCXcjvexs1bHm56KGWqhrYDnD1CBCj4D8mpvZGvu+yH82Y/4KqeNZVJ2hoCz+36etePZPz8Q
	U5srnhNkaPR5l1E9E6wveDC3/LIt2W9kXTyeXeVRbcoFwH9CemTgt3Tsu6Ja//4dQ1RWFmmNdpC2n
	U1HM9Cw7hHUkpU6id2J1BiGvnOsm8gG7xf8o/UWfd7RS8ORnI7p4EIUIiYfEO7GuxU1LaIGYN+/GB
	o7VnCMNgCh4Uff3ZCKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gz9-0000000AmJm-2qdI;
	Thu, 24 Sep 2026 10:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gz6-0000000AmIo-0FvP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:47:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1QTv2858000
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1BYBocMOfeShm/OCiT4Isi
	tabOYUNDg/Bfw1ZPW2rVI=; b=J9lobaG5pKZPRamj8ztjsx8UlOLqsV0sZngUrf
	VT+NJ1dLmSzvR4mAbyirSQecWAf9ia7L+MTYRfuUQi2iZWBkE4o/a6434Z0ULPMV
	vYAom/xqNdNrEOX/osrym0goCWkeRrcKUH+SuaYI53sxhSBIIdy9BrOFIjvlp9EI
	xOp/ZAnUMJ3nyJiSnDdWlofz+e/nmsVORS/uZa9cNEh11UWVQBBSpjTcUF3oHVDa
	D8pElrNw+KgkYQdHj4vXY/DMF5pMdKRzuyW6MDHoSzMfe9Hz1i/nC0H8dnwAWSFv
	tdGFI7qA/E12UFkvbvLtE57F4p98psH5W2/izExYkKCladew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag602-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:47:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso180547685a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246842; x=1790851642; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1BYBocMOfeShm/OCiT4IsitabOYUNDg/Bfw1ZPW2rVI=;
        b=EnAghMuwuOooI+WUlfT5Ez0o/su6jkY4CQQS2AWmkh/D+At4x5xXftIqWVN1Jf4VBx
         Dxh+42v6XfdQvHiGIUvHQaSaPpj1SPeh9zd8pKBjTm5uasfqwjvEsICgW/4PO9VIJcdc
         oF7lr8F3zAmVp/3XczLNNFLgKN8EuX5deMz2+TX6eeCtNdpZBwu+Lo743+tJOAXhXr0h
         l5uQIXArS1xsPqnKp62jxGO2WD3Mnn64a/xHUgX5AIL8IrDDwoam3vzGTHjjviryP+SP
         5yxXOaaA5+/jxm0z/uFe21p+Y2VCVrc8cnlgKMz8TVit/0Z4KDOksbQpgysyCerdCW/J
         L55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246842; x=1790851642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1BYBocMOfeShm/OCiT4IsitabOYUNDg/Bfw1ZPW2rVI=;
        b=rfV5Qd41QoANNdR0saGnOmVYIPeSHYoaqEbsrwoZXLo7tkCtvV73Y13DTzggs2AZrm
         4NFnMQ6Ng83HmPmiMEGC4uorxVprOF1HfnnFwh6RRI8jqrTNMD3Bn4X8NcBjA23jgu65
         G7Zjm964mZZNQDD2/OBA4upGACXanBy1BFqd/zv5SGq8lmsPlHN8sZbZMrKec6Foqr1q
         aqPznljJxlUPJwidj92wgEwuMHA/JeylJ0E1/1qbj08wNqZbDNy7jftr2XacD39WvKhX
         8HWF6/nS2bUSoFC2F99NqnbI+LUebyH7B/QjBhfqdW5WBTd257UWOcCBMbOmtjW8sPfk
         jOsg==
X-Forwarded-Encrypted: i=1; AKwUvBxJIXoylPG4v5SSQ7IWwzowEROyKCfWWtWqcwdwZz3gjmDYnuxxX0Y5NuyBipclIynHTkqKvr9jggL0cHw/V9VJ@lists.infradead.org
X-Gm-Message-State: AFuF++liAO3elSe68cl0o0pqvhVr3dxHnOG9yOikXC9BHbZ5MjH96N7p
	OUDdB47fP8YHilBGZ6hu5edZ6IdhWHqdFOkqtY6+X4fHGef/gj9AmBDWGM8KYIKEqOtxirFwO6Z
	4f32Sf0IeG+hJkxcCbPKBpX8d746rUNDLTu5bBdkU1NaqU0ttQdbnmdM3GBhKhIZL8WetWRYxmc
	fY2Q==
X-Gm-Gg: AYBFou3Srr5sCGAOqVPjeJGW/XWubQRqNGqlBng8E8dBVqOKpvEJ3Fb7ZqXNuhKxbO8
	fFGw/kxxZhzFypzXPWEvo7oNmjUrzg79WFJS3Dcudi8lzdGVGM+vXidnWMw124wVhe6mcSzD7XV
	VTxB7IQTQ0kKk9wm6MnNk9OnrMVCI/7mdIDDWFJ2tSzShBU/Z07deLBMMLuJQyM9wljWtrqOqHM
	ly1Za8AOk3EFXrkGv6lq/4zrz/WcFKUc7bo8QRjW9c01I9RWZBAFkcxGahaIlTZa3P3wRCEtOnJ
	xM41hDI5OVSZUDGRYMDAQ3d6V46ek2xi5aSnxQdG0cDvsdqDQvWojdkHfLlzYo77jw1RAwfUyie
	z6MvNM/k5ZcwcEg==
X-Received: by 2002:a05:620a:4483:b0:93b:deb5:637c with SMTP id af79cd13be357-93c362a6f6dmr222310585a.21.1790246841436;
        Thu, 24 Sep 2026 03:47:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:93b:deb5:637c with SMTP id af79cd13be357-93c362a6f6dmr222307385a.21.1790246840803;
        Thu, 24 Sep 2026 03:47:20 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm12472980f8f.9.2026.09.24.03.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:47:19 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Introduce hw queue priority
 offload
Date: Thu, 24 Sep 2026 12:47:00 +0200
Message-Id: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSwqDMBRFtyJv3CcmYk07ch/FQcynBkyiSSoWc
 e8NWUEnFw4Hzj0hqmBUhGd1QlC7ica7DPRWgZi5eys0MjPQht6bB2EYk7VcoN3WYDyW8Vovnkt
 sJaOS9bqfBIMcWIPS5ijxFziV0KkjwZjNbGLy4Vted1L8Pwc7QYJdSxnpei2mjg0+xnr78EV4a
 +s8MF7X9QMRsxj+1QAAAA==
X-Change-ID: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX06pJEz02Q3oj
 ryWnm1+uk2FIt4m+eWjsloI3vLCeCQ1Xg7Lkde2Fmp5C5jX65t54TPbFQJdkiLAjfp9xLQjj1HH
 QjM6IU2gT8oAdPzLgBbLDJIhegrJOOZuZHWadE/T1z9CKm8iEiWzAsQJlto0YBhoivUoQb9F366
 jvKq+zJ8zgr3fimkoeDM04KRWAMbSv15mGLd1zVXB3WO+kisbGWCak298GFB4MzQHgrlLoKUrKF
 w2xfTm98FUgTwgCgeu5e2VeHkMgx86EiPJuEwdCbL3/W32rt3Oiu9uv+wnZmNMhKvKLQT6cUf6P
 n+3oZx9Kuo6OIWMuQggm6KgpS3yd4/sSm/auSp4Mp4dZ/suC99+IHJlvu3eR2979cKBpumNZQ0u
 tnXH3BAVgjr34zx+JVX20JeFCaMQPNkitwZ0x4LAgcOtaNvx9xZLoeSP8ELM1dbdynNP+NxZ8U4
 xxpER4UBMFuvHFpi4pg==
X-Proofpoint-ORIG-GUID: etZsj2k_enjNH1n3gCj3i3FZY2uGkNPz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX4+EOnsksorDG
 t7hnPpIwK3p6OiqMH4jLtfN2l8OHG5jtiPC9hWw780FyFKOokp37mvsgDJfZJ/ZG59gf1P4WuUC
 Ryew7qlyC1FJmpwzafUTeJLOgJTKVtg=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4ffba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qGTJnaR_OStqIhYHjaMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: etZsj2k_enjNH1n3gCj3i3FZY2uGkNPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_034724_135231_3B1E8E92 
X-CRM114-Status: GOOD (  13.31  )
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

---
Changes in v2:
- Forbid cbs queue offload if mqprio is already enabled.
- SP requires 1:1 TC to TXQ map.
- Fix the real_num_tx_queue overwrite during device open.
- Require the qdisc to be configured in channel mode to enable hw queue
  priority offload in order to not introduce any regression in the
  previous driver behaviour.
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-mqprio-prio-offload-v1-1-5328157fcb58@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: add tc mqprio hw queue priority offload
      net: stmmac: align real_num_tx_queues to mqprio configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   7 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  28 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 132 ++++++++++++++++++++--
 4 files changed, 146 insertions(+), 23 deletions(-)
---
base-commit: 6516ac5e6b164bf78fb34d36b4d84d495a07c844
change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


