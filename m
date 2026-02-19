Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9CFE9A05E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=17XK3meZ03iUdZqQRtoxoxHX9Zd+qrkGcSktTTzYFBM=; b=ApwXK2Acz+BQkc
	uPRkAvGYFzMRBNLYs029CGzplglFvzJnwqjwSSZrTznmFm4Lw9W5YEIZE5Omf5F9W3o9XY+NnYjGm
	8lRD+WN0Cw9bGJu6KZYWq2gdtukYIHEVv/8Sy3RiYBX+KzpUt28aWxDrqvmeXES+/H+2llTmOgQJq
	jd+ET7tgpUmBRzqgNUcnWftXH4oRg03r8Uigl59k2f3Bw6wwgepGDVuo/yoe4Fldj/Qg0uJxgk39b
	4g3vAxs/dVlNrU+GP/BfgnA+rp9GD3RQxPca3vKLPS8iY01z0bXwxcmIAcWpDuyVtV5kSx7wISVts
	JYzRWqwutBtaBp5bFeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vM-0000000BrWy-1xaJ;
	Thu, 19 Feb 2026 19:42:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vJ-0000000BrVO-1bqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:42:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCgOuc3077995
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=17XK3meZ03iUdZqQRtoxox
	HX9Zd+qrkGcSktTTzYFBM=; b=d/YoCMPy3dOPOftDx6PKyh5Y831zNqbl3bgSE5
	tNQsbdMlSrX0VIEyb8wsG2NCoR5XgmamsqgheAxCxsgFtCOtIwvtQnWvAjhZZOWW
	KOqhYOdZa1uc+j4vO4CzzHD0zhsqe6/Knu3CjsAinJ9mQYxt8rNq1cYm5lZecwfY
	K3wIginPCaUvDsixSxFO4zHKzqF1hrIDgm5UiYBxiAI8r3uMJdCVXoHWLNQi/MM1
	+iei5YtJSncVUWWdC4UWIv4/Aj1d0f53feS9bZIIofS0ta4vIqK7PHPMVfzKkaz1
	S0xqLnF3p/0xM8vo+uo0i1OyLH/873tnxfhm5Jfg0xtjiNEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk82t9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:42:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so12697745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530171; x=1772134971; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17XK3meZ03iUdZqQRtoxoxHX9Zd+qrkGcSktTTzYFBM=;
        b=bx0LCqNwn5xTi/zEfWkXhSJKjtdBSukMz7K0/Fx9Rm08b3Pf5OIrstv5JPyFwoSosr
         utxepMs1RqC5RlatGrKjaOH2R/GJYhpBmsDu/+JwE86UQzgbYirc296CLsWr4WAOivnr
         ADxknlh7QIajEf36pTtc0tdhvtur3qXOP/PRqDjERM3z9qPLeP7/c/dZ1d2Tik3fLE+J
         72+FWEwz9VcNvfgKjdPNn60aRLR4pkGSGEcwikMIe26nkC+AU0D5YiYZIFce2FAMHbQG
         8mBjtOrM9SAIZfLLkRo9JZ7mhXXA8GKGmAbLpRuIDASP2+VjPKK9lc0tuwTFDwQYf5oD
         HU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530171; x=1772134971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17XK3meZ03iUdZqQRtoxoxHX9Zd+qrkGcSktTTzYFBM=;
        b=CvJ+lEThr2+jJLCX8m5cechB5COHdTjU0npe7nKMg3WJMeeNznodd5htFGYxFDaJa/
         sHQ9RXLG/XVOnoiDjp3u5LGBU7tw0BO0heY2MlQJR/dsyfp+91+91nwgS+74n/D6TI+W
         TVPRKvfKMMpR7Gkt726elgsjuR2PP5mwns/hEqMmnJQd+Q8mn6fvvC5b3PixB+eCBkra
         ZKsb56giJMTRBVlxt4upDmyyRLm1qp+gQOG4qnEHJdOZR2VhZFk88WeHcOpyEQlq0bhK
         FyFRaETyk2pkH8fG6jXFO/dhbZ0+ZYiBCp+KFg0SX3kNm4jLbigmkZhbkGIH2qARfZKh
         4GaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcM0nQg+VMyQGo1oAv+XWHJWpZt9aEwe0+vmv3/qXoSTjcFultD4wEl7I6ap1LmibmrJbOWB8w2j8xis7p/Mt@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpnl19JB3DdFlDbZ0LsOO1h/MxbPZE9Rj7x7ZKWWKpJnhy6yb
	85FRBvBuwcEEm7ZJ8fpi6VrvJtcSulBp+lbhYsPayVzwF+7gy2NO5+DhhsENGQa1JrrqoWv3/2a
	4ZEqeuwz6m30pFJxOXdORhVR71/TO3J0EmJEa9s0u4ry6wTgsasIbC95hvvpzBS0in+a8wPG+Hv
	mMQQ==
X-Gm-Gg: AZuq6aLjrvQjoaZJH73iR8NjpmUsIXGuhQaR+Tc5ETSiELB5/UIVmT2pVelP2HT8CQC
	SKYvmFQzu7mmiyF3aITu38GjjyUTl9UBZOuKvqnaF6scK+JRWUlFRuaZkqc7pTDKdszVHvzkEgj
	Tg9VN2SSJSM/DH10RglZYadFr8A+D0x/4evNuPFaW8XFPW12fhG9Hmsgu/5YhGkX85L/l8OZvhT
	qsHlLgfSyHs7A5QqnRECRZ8ViQNChKP/0sV5G1tkBV0FtmnDFH0f8OKyKi6A75G/FsvnSCYV+Da
	B+JABLS1gTNiTY5qeiL7Z1MuEr76pD5XuZpoOw8nuNOTaLHqWCfoIaI5m0Xasva1ImS3RPDchiy
	nFHsyNar2xprZxP0H7XwcjLPfc9vGxgW9+Ap0Jfugpr/Lc7X9nZswiRzyA4ewpwkdD4gUE5xpg9
	w2cVSlgO1E3GneWwHL0Khp8GlgOaLkivmZzktHCsA=
X-Received: by 2002:a17:902:ce87:b0:2a9:5f11:3a26 with SMTP id d9443c01a7336-2ad1740bcaamr190724165ad.7.1771530171168;
        Thu, 19 Feb 2026 11:42:51 -0800 (PST)
X-Received: by 2002:a17:902:ce87:b0:2a9:5f11:3a26 with SMTP id d9443c01a7336-2ad1740bcaamr190723835ad.7.1771530170705;
        Thu, 19 Feb 2026 11:42:50 -0800 (PST)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a712ed9sm264404225ad.20.2026.02.19.11.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:42:50 -0800 (PST)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH wireless-next 0/2] wifi: mac80211: fetch FILS and
 unsolicited probe response templates by link ID
Date: Fri, 20 Feb 2026 01:12:40 +0530
Message-Id: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBnl2kC/x3MQQqDMBBG4avIrDuQBLHgVcRFU/+0gyHKTKkW8
 e6GLr/FewcZVGDUNwcpvmKylAp/a+j5fpQXWKZqCi50LgTHSbLxqkvk+OMsZWYg+XvX+jb5SLV
 bFUn2/3OgTRQZZlywf2g8zwuoT+8IcgAAAA==
X-Change-ID: 20260220-fils-prob-by-link-eef176414f1b
To: Jeff Johnson <jjohnson@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: eVE4p_l-MN6LVYsi_Kx7OWzKmcX1TeU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX1Wy8koPX5MQa
 bBMuTfCqttec2Pbh2qrJGBP/nE41ffZ1w8A00g93yKGiSrTPoHc/AlBctPlo29d1M1OwxzJS6cI
 GIgaZW/482tas3dqDfv+hH/nRjLx/cG+ZU1hESbKjgM2gah5rTvS2aoKynhvlLCYj6OMfPkBYEn
 tRK5ptP76BDtTgsa76g6nTA9yL7rj/hENq+0Mv09hvroCfZs+6T1O+zuYQjKsqZdhpnMLuk6/vd
 BCb8LBYfzuQJYnkFXadQYb7q+M7SDkBpK12WdokR/bQMD08mqMCE8IdrJvKwlhfLC6OC72YmYVr
 lTA3NHN3YmuD5ks1AYMogpElzfA36pFx+aXIhuT82uYsa2hyryDSy/+Tr34nCglfS7tWsm7tRpa
 9MymqtpNJgnXLY+XFCRbylQnI+ejGQUzmWWNca5IvsGeuNGkd3luV2zbLJMljmO7EerqicKFUuD
 ZS7/RFsWhKyg6AOkVHw==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=699767bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=wJPCH--AHzS56o4of04A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: eVE4p_l-MN6LVYsi_Kx7OWzKmcX1TeU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114253_545465_32157BDE 
X-CRM114-Status: GOOD (  12.50  )
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

Currently, the FILS discovery and unsolicited probe response templates
are always fetched from the default link of a virtual interface in both
Multi-Link Operation (MLO) and non-MLO cases. However, in the MLO case
there is a need to fetch these templates from a specific link instead of
the default link.

Hence, add support for fetching these templates based on the link ID from
the corresponding link data.

---
Sriram R (2):
      wifi: mac80211: fetch FILS discovery template by link ID
      wifi: mac80211: fetch unsolicited probe response template by link ID

 drivers/net/wireless/ath/ath11k/mac.c           |  4 +--
 drivers/net/wireless/ath/ath12k/mac.c           |  6 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  4 +--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  6 ++--
 include/net/mac80211.h                          |  8 +++--
 net/mac80211/tx.c                               | 40 ++++++++++++++++---------
 6 files changed, 44 insertions(+), 24 deletions(-)
---
base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
change-id: 20260220-fils-prob-by-link-eef176414f1b


