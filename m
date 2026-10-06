Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E520ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjdEUuDsrTf0VQLIFjJRwxhwQ8VeCQeKJmf+o5tGzMk=; b=KlzI0HiNqoDjUS
	Oi7IQ6UQxgt6FlefVR/KZ5JCutKKEc3MQLbloNtva/8CgTirQxbs1IwGiTrjVdhyRLSwaSW8SFNlS
	4wdvyj8TIZJ0SveVjb6zlNjYYQva185xQqJK1T9MIcI1CE1T+/Rk1cAjrkPRwCWbAcLKf9yzKROF3
	CBPoNs5jhTbFHzzFUt+0Nu0rAbadYQwAPq8IAn322QmpyJx+2hSKAhGn72xRm1wGiYjUyUnFo6bmy
	v37ml1hFR316KQbe1pee6YZqyzvPzl7zHZJ1zToRLo3SJ3bXFIs1QAvOY3P5zrgUuDN5Qr4VUy7Ya
	EH+Kg4+PUmYV4FvNHF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2h0-00000000YHA-41Um;
	Tue, 06 Oct 2026 10:46:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2gy-00000000YGP-0Cfb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:46:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ASPrk3331227
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qjdEUuDsrTf0VQLIFjJRwx
	hwQ8VeCQeKJmf+o5tGzMk=; b=NVzLOLEmeV3T+JyMO+9t2iUSNzdv4cqEJ3AdVE
	XP4arCNIPVfTtdHzX9Vest3hqmZduNdawznEf00RA+tFAtsVSYoUkikVO5augjR4
	kel2TT3/C0y1lqM/oa/4Wu5bc7qdvMa4/RGGvEA4SMznW9Fm8IWwO+a7FV7T/pOs
	um9rKWD62dqU2pIxH5OQibj6njn71LQb1VuZeW50nCrPetRJTulxXanNX9lqVCyl
	ENr8aKLLk3aiwSsvCEW8HMM7EVCQfnZJmcqaFB8geETutsb++AuOjkXUjrUVKny7
	AzGSGRyjC0DOHzaCRFIqThDtEEKuaidFDB5mQQu7Td7AMauQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4y91g1sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:46:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbacbb996so438951385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791283598; x=1791888398; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjdEUuDsrTf0VQLIFjJRwxhwQ8VeCQeKJmf+o5tGzMk=;
        b=WbwYTBgql4o/da9fxInShI5hl5u8mTg1PNYQiQ501V2llEg5rS9ItgJxhfKWqd/1Qk
         zxm/6SC3nfcylk+AI9RCiQ1wPI4y8U4Ci4xADTA+1JW+KaY3jWnqaj2W9Ia+sTPecvOW
         VPQY8UzwHqtMOq9nrUvbvUjPdPGSE7Nr0Su7gJw9UUHEtsXCvgfMoJdVvuHlDoMLzi76
         o2vbpa2uA2+SWyuzxA17mDIb0BwPIepNu58tJEn/J6v/Cto359bmDGFAyzhqB1cyfngX
         PzpZmXhLJh6eszS9q1iNvnFEfpSY7gdw01Kwa2BmA1iV8Dr7kRGVYSG9ofbrVJJId7bv
         vQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283598; x=1791888398;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjdEUuDsrTf0VQLIFjJRwxhwQ8VeCQeKJmf+o5tGzMk=;
        b=ZxPp/Udwlx+abG6P2Lx4dq0AgEDy4HW3T31xanZgj+bd/sy/eP/P1JFhdM4k/0icc4
         twGZyYmer2s38+KCgs+rVeaoGGvMyHl19q5pP0r0qxkw7dfoY5nt/VvcyA+d6zHuI18J
         6CiykoEyik1WtlKYA6+RNTZ4cUuPuZBr3VTv3KXLBUGS3/zBnNg/9qVw9Pl+NQI95Jor
         Jf5mvFGuotHtdLfYRz9kC0bL7oIn60K1f5BmhMYWLSj68I2KoQtwJZVO8s5n7pagrVDV
         u1Mc2QGGK6xq0aGSeBHZ5J/ND0sUu5BALPz1Hef1Mqixm6yVQxm1Er/fC30bbw76wqiy
         3zCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx342RfOrD7LEbePYKfQFkArimhhaq/Eedsw7gYHs3gby2f7OUJT69cHPHrTgadVRJ70bX/T9qSybioXiSK0IP0@lists.infradead.org
X-Gm-Message-State: AFuF++lDSzr1mHShGqWMMBpf9kQz/5otI9AGEJRVT7D3vDrnnBMDpDbS
	N9lxYpWPk4zfWJO26WXlt8ziA++TH3ri9vbKl+eiKPCgs+V26aEgRT8OnztVHxhIDLRCHFHrT0a
	R44sGjZIDEsWdOfrQWzSsJqsCpXEkPnu9FOZ2Mw/qWzzmTR6YhXDbHOlkd0jxnXXi7DizC7rlaj
	yLFc6oKgbHQQ==
X-Gm-Gg: AYBFou1UuXySxsZWuiE65I/PK3ZcTf8L+PhtrcUqRXKZ/kXq0NNMFh5cLKJrmAyKhBp
	TI/NcK2BVbZfTmf6pReFWyMI4gHkGo5hMXRwbZKFn1rWKujZNaP4cx+hRWKiLX7wJQCG9EqC1Q4
	CX+NlDPjRJxos8r4EC0Ox+0lxSr8/47slmSc7L5k3Ew3lYclz2GnCdEAd4/UhM4Bq2OjSQ+/kU8
	mUWiB9SFkLs/0mEBDUfzERs/L/+aUOlBR8rAFG+rKfTG9idzZEXrUSYYxNqcorF9JUsXlsk9aUx
	JzZezJigaGwKyOcP01V24JNRqc8ENxnBnAvcKDOSqpvb1EGUg90C6Ms4Xvtz5GZEaCkYYKXwGBw
	SywuMICkrYVNXHA==
X-Received: by 2002:a05:620a:8805:b0:93e:653e:6981 with SMTP id af79cd13be357-93e8f20609amr163842385a.11.1791283598267;
        Tue, 06 Oct 2026 03:46:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:93e:653e:6981 with SMTP id af79cd13be357-93e8f20609amr163838585a.11.1791283597698;
        Tue, 06 Oct 2026 03:46:37 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db0929sm63762245e9.12.2026.10.06.03.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:46:36 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v5 0/3] net: stmmac: Introduce hw queue priority
 offload
Date: Tue, 06 Oct 2026 12:46:24 +0200
Message-Id: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oz24CIRAG8FcxnDsGWBD01PdoPPBvKoksCuvGx
 uy7l3JoPNRNL18ymcnvmwepocRQyWHzICXMscY8tkG+bYg7mfEzQPRtJpzyHd0zDXVKyThI10u
 JGXpkxHM2HgavudcKlXWaNOBSAsZ7xz/IGCYYw30ix7Y5xTrl8tVbZ9b3/ymYGTCQA9dMKnRW6
 vdc6/Z6M2eXU9q26PrMn0QuVkUOFNB7bXf7gM7hC3F4Ftd/HJporA1MM5SUixei+BUZpWxVFD+
 iEu3QK2RB/iEuy/INrmltvMsBAAA=
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfX/VDZuFitsrk1
 UoV4dwkVNW/lT+sUQGrm01HOZoH7LZgJFZsVSvgWe0/eFfCpwu+dc9Pp2bfnzkonskQy423WBDD
 qLVJcGbNtv3x6Lm8Z+t0CJiMj1DQ6ZQ=
X-Authority-Analysis: v=2.4 cv=Ho/jiETS c=1 sm=1 tr=0 ts=6ac4d18f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kCoPmbC7odpt6DihikQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfXzx3Wt8Hes0Pu
 X+yJccxbIyoqvHdVPac4sqPtplLOIYpnCpCX2rjey03a2RDJonvVQ3WTWwbV5nLsLWQkuLscZiL
 3nxfeb6fYkHEx3SDETlgsM6zPLQlI16Ob8TYWNM81+uxopU+9uoqaLylZR+SH+g7ZEARRKCoIiX
 Rx8r35Opw0W0vvsWITI789OBw3Pm3x0PL2zNTU9Z7hU9w73MHs6HMgaGg/3nzZtW/ekAfD6tjUo
 7NUDsVWuJosZayidIUQe82DlHe+6etToW14Ufgt8UYeIenEIqb1YTBOFpYgMl5o+51kUtaSO46+
 KMDBxCdTnFDNW3RrB8OtOpVsDlkluND6f5Aj2jwOyHedEK/cLXqxAky2+QRFmVtvUEJt7A4oP2T
 VIl0H9Di1gpLvfR04e+okRYrVr7LXn7Q2M1WT3vneNfrDLWQ3TgiakMeeZzcZnLHAaKwahiSDTX
 yZH6h6QOiCsVZpLSBNw==
X-Proofpoint-ORIG-GUID: Ks5BLuH3idYZCgenwFaNWNgOfk1vgDgj
X-Proofpoint-GUID: Ks5BLuH3idYZCgenwFaNWNgOfk1vgDgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034640_121223_8436B7E7 
X-CRM114-Status: GOOD (  16.10  )
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
Changes in v5:
- Move max num_tx_queue check from patch 3/3 to patch 2/3
- Check MTL_QUEUE_AVB queues in stmmac_reinit_queues().
- Update commit messages.
- Link to v4: https://lore.kernel.org/r/20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  45 +++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 146 ++++++++++++++++++++--
 4 files changed, 178 insertions(+), 24 deletions(-)
---
base-commit: 8b4e7209c842d8cb9516f1f5ef0a88aa2d8831a6
change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


