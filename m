Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D2CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y3bDkdlPgoyDZs/us+RW5IFOVL2T8UGRn5OXKbHaJfY=; b=t0c1c6VCsduyXX
	E9Pzb5LBw58wVdvwNtlddNu2gUmFucJ0dntkX+D689hWbHJDif9/vSn1blDDYjeSyE77jCJgy47vi
	nIttJIrErmu0p2R4WOdImTyqcXYxVX3io3VAxRfRnHy6gYJreYxJwvSGwkPL6BopZ3+g7SLISeMZm
	HOX5dny6ccE22F4nUJ0+JYB209OSmiRortTiySc3cEjvwL4QScr6/GCZr2OuesOXQDNYVa6tF77cs
	sQOiUKq38N9SuHNHN0ZueusNZ9HR8nWi5w04ZIgHCGmWM5PZ05X6p1ZfS/nxAzTi7Wpaj05h/KHeT
	czgYyVLX3SOgeEHCyJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE20i-00000000Rk9-42SH;
	Tue, 06 Oct 2026 10:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE20d-00000000Rio-3ONs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:02:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e9kv4103515
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y3bDkdlPgoyDZs/us+RW5I
	FOVL2T8UGRn5OXKbHaJfY=; b=V58utDWlwe/PemSqpco7YKyWAVcjvgnskeHyAb
	Qa4PyNqq2/yKt9w15jwMTBfKIorMj6sifsbP2kGSdP20z7bjpHAD1BdGOcMY8p9G
	UKH3CCwTsCjQ9lJ55hzC15booOs1JRJ2GjeaZxevWBEs/V0W7MR4qMrNDRv9cQxP
	p4rZKQcIPdpeqR75rslYuZ0JbARCPw0NHz5lvCvt2FkO1UGfViF217CAKixCCWDu
	/fx1IK4pXuLoyUkfp/StX2oDPujpZ81zXPtBWjKL0lQT7pZSOPHKv/zs07k09gJ0
	+xV6NrmMCDW/VShzqVT33BusBw0ee3w4ioqZCIjwNqHAnAsA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0b25s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:02:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so2562686137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280974; x=1791885774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y3bDkdlPgoyDZs/us+RW5IFOVL2T8UGRn5OXKbHaJfY=;
        b=EvYBR6kkcqoK85h67xOdtnkHMVua4o0ti4cIPmywq30RWIcZgQbSZ8LSEaAVWHIMkl
         A1pAF3PQvK6UvS7PV3/4SxfUwpqtFwVfVWa0X9s4YFFi73rslUtzetpaylil/fboilJe
         ab0w9AzzDMIZ/FZvo+59Dhe58BJQ7VSyJwMZHj8ZCYxVFSGveo7Ry7zfeL1R3CggT7CG
         QRqb+wuvUt3gRqKbXTcXDOJWgApSDix/t6ajwRXp97MS7Nl6rStdEV/hspdZlKkaoZfL
         B4ybSGlbBXjkoF8m4JsH+j3iq6ikC7hlqVTi1eDG6B7Du7b9nWOFmhc15z6tLCOA4tiF
         gxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280974; x=1791885774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3bDkdlPgoyDZs/us+RW5IFOVL2T8UGRn5OXKbHaJfY=;
        b=WA1qh92mu90kJaFEKrcTXxxlRY9jGg1gEbajJjrd21sEwCClQLcAKpuJ4dVrU7dfPf
         BdcCeTZFNQHFC5ZLwy+uUw6dS+KzlPgSSqsVz3s+Z7pLpOD1Y7j4PX+Jo12NDhUuonbh
         C//BLgNdfmc3hxdsLO4q9iEPSO8j97b+h9ThJJBPzePEhkFQxeapUw18c03Wro2KEsA0
         VPynz7fwS59s6PxQoKyAzKlmqXGE8pcPPz8lQtN29A7BRJHNbHqvs7cns7QSIsCzEYl7
         nH56htLCcq7L9EdISKVT+71FeueRTCsmqBzN3KIn0+rks2SnV312k7eXqaONOkw7VJSS
         QNHw==
X-Forwarded-Encrypted: i=1; AKwUvByDzBX7SGhoP3hdbSGbkGRSj7DFrVh6IIrDE/rb+DbZPA+gDKEXrPJyF43J80h0W9eSbL6FVyPZIwhYdt5631tK@lists.infradead.org
X-Gm-Message-State: AFq9FYKyEfDfTie1lDxKUzwGSBHqgbEcfVCv7AryBYNIUkgDL67uwhC4
	CQPORFASguzBcY7dHiUczqaS4zr6A7Xy2Acdoh/4ACkywotOoyqA3xFcyNm2VoGlQgRz2uRqBZl
	csaxqAqOXP1F+e2qykVxMCYqn/YAlyu/jiuHUUJ22uKCLFcjbEUXsE98pm14z/wDrn+GduyMVKb
	KB/g==
X-Gm-Gg: AYBFou0GEHpgtoqiaoRgnke/Ux36/XvyJxBlKqcQTxVN9PSJuAeIb1xat+Frceakozk
	5CVn4VRrxN4/CDPdaqo0kFnCUxya/i5lua5nrmiwAizM5OwIIqeB/q5HqZoszmKcOMB4j58xVac
	MqMxSUG8h+bWWysE/NmOHVBiqHm7zN6LqT/M4IKmOI4kFJRYE0h0/5A0YXiPNOZ4tyDLVrX1IEv
	tpSpZYeRwZsT67wbK94s8T89AohToVEGah90w2w89KLw0o7YGgznJQ0WbB7oflvXu/LcryWVFDw
	50kLsccv0aXpFkjRs4Hc36ZSN9BR5QpXt9M4VncfWEitRvx+nPI4gyTno2uxuxD2ngEQ8hMw/oU
	Q/oMlFf8uerH0QA==
X-Received: by 2002:a05:6102:549e:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7c879eff7b4mr197241137.14.1791280974168;
        Tue, 06 Oct 2026 03:02:54 -0700 (PDT)
X-Received: by 2002:a05:6102:549e:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7c879eff7b4mr197220137.14.1791280973569;
        Tue, 06 Oct 2026 03:02:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm92744655e9.12.2026.10.06.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:02:52 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v4 0/2] net: stmmac: introduce XDP rx multi-buff
 support
Date: Tue, 06 Oct 2026 12:02:19 +0200
Message-Id: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQrCMBAF0KtI1k6ZSWPauvIe4iKtExswrSa1V
 ErvbuhCRHQz8Pn8N7OIHBxHsd/MIvDoouu7FNR2I5rWdBcGd05ZSJQaKyohDt6bBsIEvgbSSld
 GFqTYiDS5BbZuWrmj6HiAjqdBnFLTujj04bn+GWntf5MjAQHWakfFWaEy9tDHmN0f5tr03mfpr
 N4oPwxJX4ZMhuZSaiZrc9R/jPxtEKL6MnJA2KE1VJCxFTc/jGVZXpZ1Ot1BAQAA
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
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX8GbJOsElwNE/
 quKCX0QVJIQTLFR2B5x8DuVDfuSlxToNL4eJELl/ZXsJs5UA83L2i0wdhNAO6m3BEFhPqa6/QKu
 Y+/Mx+njq4q7QykcNhaCUrF0Hmj3ZbzHhPLGi+PloqGg9DjojxVaUS2rMJNPTYa7k5vJz40+9Ly
 CMEYxY9Aazu9jyqkF0yj2gOD8/DR+NHmzRrnjITGxLh3By+m9L9F2/nyB6K8x/2xwZ4yBAO09qt
 kQ2XL9K8hqYu0jITssxJ+fyPIWQvSkFKqF5bCHQ4hf6ERr8ead4an7D3AQ6sJX/LbromspoktQx
 YPnur7GFuR5pqMr+l+8hl6yCKGKfqrKaX9btdaa0PQS3r+zIuaTTa853yClAbDVuWq3jo+czRUd
 1jrGtrczPegQF+J8L7RItWPAwAWMvj4FGtbq7EeOIgFrtGq2tPB+vL8WKwndbNHhBLrPi6450by
 OP2puNXZWt3XzmvGnrw==
X-Proofpoint-GUID: xF6FahaBnMjSdzFveB3jgc2gdNLCPAcG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX13fkjcYozD4f
 1UGpgthcnv/bYl94VqZVW1NfzTsC4yhY1ORAfx76mIyDvqxQHTHZfxjhkACgTHlQ/UfXHWYTgjV
 KodvLRhIf/eYkz7OPnpKvG1ej45qzeg=
X-Proofpoint-ORIG-GUID: xF6FahaBnMjSdzFveB3jgc2gdNLCPAcG
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4c74e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e9kd2x7fyNmJAygvsboA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_030255_969288_A875DF34 
X-CRM114-Status: GOOD (  14.05  )
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

Note that an XDP program still cannot be attached with an MTU larger than
ETH_DATA_LEN and SPH is disabled while XDP is enabled, so an ordinary
frame fits in a single buffer. The multi-buffer path is exercised by
frames that do span several descriptors (for example jumbo frames the MAC
admits through its jumbo-enable bit) and is groundwork for extending XDP
to jumbo/SPH; it does not enable XDP jumbo support by itself.

---
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

Lorenzo Bianconi (1):
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 390 ++++++++++++++--------
 2 files changed, 250 insertions(+), 143 deletions(-)
---
base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


