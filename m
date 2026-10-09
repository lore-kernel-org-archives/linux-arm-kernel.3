Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A836CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ITMqI/Icq3NL235r6C2iwfF98d1/ZYkDkbAz5O1+M6E=; b=qTH+eSVhxFMsz9
	kAerVEnB1sjyyo0Jg8Ysdyevh3nk6Frdd696V+MMIIMZ3VwfUOk9ESvGj7fhyuUlWLaz/Su3eiWhJ
	/nzzn17Px/NSA0HtBT2vWxe/elQRLnXOogyQsXPD2u0Xh0DzZoe7O0Pv6WEfrWhA07VWfo4OiaaQp
	k3In5nvF8s6zwWSbgiKb1Jlxor6yJ6t6muAuVoVJ1K4e+z825Xp6n7Sljry96n2Dd6/7ENvoKFeJx
	5WgNoIH8t0zgSjxlkWMfhWu8is4Fg/E03qN+wHjryYqFvhdktvfB8Zc+DAU2fdozMP2oFqOXWN4IJ
	PP5TemieMLtMdAEmIBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7oS-000000063M8-0Y6Z;
	Fri, 09 Oct 2026 10:26:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7oP-000000063LW-2DEu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:26:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIWg404357
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ITMqI/Icq3NL235r6C2iwf
	F98d1/ZYkDkbAz5O1+M6E=; b=CoxNYTEv0X5h52BdwG1KUM+YOGdQe7QB5H1163
	AovaUeEZsAsU1gDC806gTK2aVuQzYfaPQOwdDBa0246C6aY/+obvnzJPGvJLrsKx
	YE1KN2YPm/A4/Ky64gqNFmlC+JIiW6CBTj9naSEn0/1vwRfd894KQN4UE4IJg+w2
	H7XqFUHhFtHXI1KIsO2ZXNfBG1phtGJr9ivwN2rrZ2kR+e1CXmoVN6A4TpW6tI4S
	H/Ui0ELYFCpb8+TKzSJZlYql5dhT7YfnBvOqECND+4vfkkxAhVzbNHbxMkulw+N1
	t94Aul8zA6myTNI5AeQCbXWNyJwyvRWaKNx8hnpSR+OiXGAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk34r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:26:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so1706503185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541608; x=1792146408; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ITMqI/Icq3NL235r6C2iwfF98d1/ZYkDkbAz5O1+M6E=;
        b=QV3TdGCaX2vsmwVqbxnz3FL2C76I0MYOrCpmy0php1aolizLsuJ4V4tUnGHitbE66/
         J7pGR6WDmkk2IQyD6pk6dJlJDSioihPuePuz4qJmu8+xR/e3z/y7siPKgTHs9H9cHe5p
         U1BOGZbKHvFcCtKawEE4xOwFL4WalNwGK2by4W0dBfpXC55YSckanQpRYn3EqFvtvCfz
         7zj7IEZao2JS1kQl22F8vCpbsuzqvzQ7i7ks+qCtKoac49JzBp/D8hnLfHfjURGXoemq
         dTKPyEyJYGw65kMBFADm3p0KdlcX2b8ENeJtJwfvAYL0Vift04/8EmUgODrTgxL4ofNb
         dh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541608; x=1792146408;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ITMqI/Icq3NL235r6C2iwfF98d1/ZYkDkbAz5O1+M6E=;
        b=ON0ttzZ+KhAfdi3hKgm6PSPN6foFQathpXblsRFmQxox5bVRkCkg1TYZBtHWZCzTY0
         oKXoGNnk06aE2z/oHisTbfcqgTs0m12DZKw2gCiDXjY7Sy2+qYndee6ep4pYYI8qnJMh
         uB+5z39jqCmnkSpYDYV+8Hqmt62foZxZ27ISbK/R14UW2FLJzZRBuBGOc4gD4+2eWcVC
         g6sx4Fkfkwm71HugwN/DNlJ1MDIi+GP59nqKOA6o9UHY52/8dnnOuPqEDY7bsFARUv7Z
         NwO0+Cjs5uH1L9kuR2BLPG4A+iLeagUfr88J2rdiZh4zLqGFCARh2z/2O1wV+muo7yjq
         xyqA==
X-Forwarded-Encrypted: i=1; AKwUvByurXKNRp/5QV1G6JfPsRLGfWco/2mUKFC/84ev7zECUrf3y/YL+X2sMqyMl+p8aUU2CgO6kc/yT0+jRG41PCxR@lists.infradead.org
X-Gm-Message-State: AFuF++nPOiPt/RB/zFeNcANRwQaIDZ23U7PVSHus+/JDj5lcBGg1So5f
	KbGTVFP+sxFibmyxQpc2XZQjbK6Yz/+Xg4ZLnNCbTh7Kte69Q153pHfvIj4zFWzCDOaGfmHMq4g
	izP+Pjc9ovMSyLNqeeWRDThgZl+gAoGwWqrM5dEzDAIkPwkYuE2I05C7FYGgg0abe7e3sLw4EKp
	qDPg==
X-Gm-Gg: AYBFou1jgBoVXKswb6ybJC7YtjWD25TIZXnkqzlLwYkHVXYUJ/9upoA937J2CF/TZGy
	jdeAW2Ig6DRRHGMxj9vPECMY18NXzgr+lAfLal1QP2ECJdx67A2KFf5LM7XyrznS7b/qLYb6+3C
	TDeEDrdxfJSY+3iWtzbu5fYx/VA6SxOkwIefG5xMDnXFoUAXxskxWF7l125CLVY3HvvB3RklaRh
	jqDTLPC6DH2+S06Fd4RNMgza6ih7vWVVlG6P0EtKJ5AI8JXf+j7plsQ/eMfvMHbcert8X1Z1IYE
	MHAaZWHwbeNPwtjKLhfxtvRibz2Hvxr9E3W+cFtYp1+45TF+LXuW4ifFozQR76RHAGdl1Qkeusg
	r3M5UHC+lor3g9w==
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id af79cd13be357-93ebd2923c0mr184144285a.57.1791541607700;
        Fri, 09 Oct 2026 03:26:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:93e:8542:4f4d with SMTP id af79cd13be357-93ebd2923c0mr184141185a.57.1791541607135;
        Fri, 09 Oct 2026 03:26:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm66345435e9.0.2026.10.09.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:26:46 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v5 0/3] net: stmmac: introduce XDP rx multi-buff
 support
Date: Fri, 09 Oct 2026 12:26:30 +0200
Message-Id: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQWrDMBAF0KsErTNBI4/luKveo3QxkUeJILJTy
 TUuwXev8CIEk2wGPp//5q6ypCBZfezuKskUchj6Eur9TrkL92eB0JWsjDZWt3iEPMbIDtIM8QR
 oybZsGiRhVSa3JD7MK/elehmhl3lU36W5hDwO6W/9M+HavyYnBAR9ohqbjjSx/xxyPvz88tUNM
 R7KWb3JPBkGN4YphpWjsYLeV9q+MaqHgVrTxqhAQ609Y4PsW3FvDHo27MagYohnctw2JFX3wli
 W5R+Va9/XhQEAAA==
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
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8c168 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e9kd2x7fyNmJAygvsboA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: O0f18Yhjck-W5zRT07xp3JAZG6jc_zxn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX4Wnh8GSdmuC2
 t0oWMcohWV4PMYqRS8s3/GZBorCv5H1SBcDj265SXThx2xL9meZkwaRvybpzqqLI6l/Lp26E/f1
 fqg48KZpCTmb1ZRRKZ8Fpzny2TV/sEU=
X-Proofpoint-ORIG-GUID: O0f18Yhjck-W5zRT07xp3JAZG6jc_zxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX87h0pUH0qrto
 zuCdB2qvkQLDF/obZHymBY8IzZ4gMjhI3QgHejbZ3JyAVESwRuM+/YP0ojoad+yo7XR1ZP2vH0h
 5tt8UfqqLXAFToJwvq6LwJUZhPbYqkL5IYV9bRDoMl1s6Vw4HrK/mdiw1oAt9SZ+GppNrHa87bl
 QbF8yTJjhkU3tM3WTOsb8xc1Q38RwENQVlSU3c1rR1a6mp2sTLwizc6A3jpkaEw3MfR2kFjWb8C
 F4wz53pwDCqtX3hj1KnbPF0+X1TfAUPN6EJUDuwZU9SmGk7LWQ/4hE8uYbpJcL1ijSM5L79KcVJ
 OSdtB2dOzRiwXd0xktAC6wam9y9K/wBbgaoXpZSOn97iXUNQKY5SjDw2vIYtCc2CUQWVT/8H9FB
 PYSYqx2cj9ZuwZBCr5CMl7BoCdHwZ0fVNDiN1KXz27mpIgnovWQcx7Hp0e9QeSIkf/0VZuQsga8
 ktCNKey+OR8cdLYw/7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_032649_595226_5E58C9FF 
X-CRM114-Status: GOOD (  14.56  )
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
Enable XDP support with MTU bigger than ETH_DATA_LEN.

---
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

Lorenzo Bianconi (2):
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff
      net: stmmac: allow non-linear xdp_buff in XDP mode

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 401 ++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   8 -
 3 files changed, 253 insertions(+), 159 deletions(-)
---
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


