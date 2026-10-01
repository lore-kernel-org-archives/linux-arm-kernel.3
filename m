Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9601ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vL+NGGHGnOqAqDpLAA9zVXrhPezAzpq3G+BHPNIYUq8=; b=uj2qVIcy7/5X+C
	tqydRrlOdN+4ube/u4APexnCL8EQpQYU1hG90bPq+i/B5L+aENnLkn4O1XL41IcPsnqo4glVfrDH/
	BHY3JHK3EvZTSnT+dGXaWAt4VTJHO+LuXJn05x0+NO8E9/Z9tiXiR0dkf4VCvc1+u0E5hH53rNahJ
	0tBFntgkNNLFGwG1DrIhUK4Etm051PThpk0d5wBv8aPw1MFmBj7KjC9U6UWTOvyw1E3/FwcjcF711
	NExdvyZopfXzQMe39S/ZFBM+v0J3hyUI8eeQ+OGGX4xejeSbEFYthX5RuZ8td8MppLjLBEi/aNtat
	qU49VSe3ICppj+m2gboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD3k-00000008MHx-3qu0;
	Thu, 01 Oct 2026 09:26:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD3h-00000008MGV-0VNd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:26:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xm6g1661068
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 09:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vL+NGGHGnOqAqDpLAA9zVX
	rhPezAzpq3G+BHPNIYUq8=; b=e9a/9ElTdJXAvPYX0PFefR/z5Lmp4i7RozxKNY
	GXfzWLUPTVDTXh5wEPdyuYJTfb0mFDb6nkAjtnkKo155rPEWADOCTBiGx8+p90EQ
	vqPzx9O1a0JFzSh3h8VeDazroXPj0b6lMfzTOZ30sYV2Mxu9BLXE7HmpoT6mNPc8
	g+4G/NGQkSw0dbgZbHq6mHaj8MqzDeLRiZJHCpI493dq86ZDVy0L1fPKVt+cbeUo
	Al6ARetcA2L41uqH4r9kpNFrp8aJ2rzIJmKh7jVmZ/ttRtuz3y63Z6Td9fNx9Tam
	0/4SHcCGWhKGUyfqEahYCIcT0mW49tTj7ly1DMjQyed6feZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pkjwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:26:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c58ee2116so1166794385a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790846791; x=1791451591; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vL+NGGHGnOqAqDpLAA9zVXrhPezAzpq3G+BHPNIYUq8=;
        b=HCkDuVDIymwWXl+nhoYnlIjusDo5ZonEzTGceyeRv6Kc2y7KCYODqkfCGUvtGeJICC
         4bkuLjQoVARkbs7aA5WrlykXTQ2hYc3OClwlQjGpoz3piLL2aj26p+7uJ1IKv2zaArRW
         nZjLhFGG5U/zmnJmlOTJ3k9iTfT9Su5u8KTBWv7XAKqkkVUYL64lG6DbzMndZcTDEepe
         zOBAwo1f8JQEpVrTb6+gNMo3jUqR5w+n95NUYLMhOmlFtgO+vbs8cQbDfJIUHr0LWNi5
         PSN+FHsFbLBnrWH3LSJ5JApgd5+JGbPJ6ef7z6yoDv0C09OI+UF8LbQaI6XAXu4Qgjms
         GIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846791; x=1791451591;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vL+NGGHGnOqAqDpLAA9zVXrhPezAzpq3G+BHPNIYUq8=;
        b=nQSV5JUwNz9IR+XDHfY8n5+z30ksszyxe3ZMp/iQ0AtmXowXhbtuyuj0hBHOdhOol6
         qjDfxEZSA1NpUQkp/nbFef21iHhJ+X+507/N+ajZN39SUX8ld2qdxDe7v8jDcUTlqsxE
         W4dGGZwXnARItRwafrxoXwfgUcNhravH7en5XB56MYsZGXwxbaT74irRNBJBNlVXqgSn
         dOyGfTr80DYC/drOjJ6j/lDqQ0Z/jKU99LJd8m1wQkk2PWohs+TYsAKlQ2eWQlgIp38g
         nvxGiAPZioSgOnhZNxA1HCCoiy23JEo56QgxPfj8IqbqF6oZT3ZXEEPpsTm4byPoprmc
         uWbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMD1F/Jl/glO7ja6hECQ5w94yaLLPRUZ8oc80AL79nY6gra++5x5o6bf/gZXO6TbVqy+c+TYXxSUHgPIddKtPU@lists.infradead.org
X-Gm-Message-State: AFuF++mAnfMxISlXKfTGVNFj7WvklDo1+/aUujlMLvxnjHM28tQGDDMc
	ixOb4hYRMKIKP0CmAI9rhruiHUqchbjI2Nrf4iyCPAZNN/gv8BoE7yXgBwtHumx4kenXX6hcXBx
	6WgYl8xdNsGYxl7OKKizasCFaib/cgzOvO7OQd1IlJg58PUYoFb84O15J8zbvNjicc7K5fF4mxc
	mURg==
X-Gm-Gg: AYBFou0TGeh55MLXGyeuhu17pPGPQ4lqm/NLFvs3WUmNUupagcqdLQYBwAilCdICikb
	BeKUHQ0CrT8AgJlalp/B4Ew7Th7OpNL5V7nfVFHhXDuO9tcDwB0UPmZT4iZ/tcGqBnNiskZupYP
	dTizTHV5zbputbQFLKYAOkduDP0qlr9seL6z8M7NPtqGgyyryeUaAds9qF8q5BgtmQ/Ly9SOcxR
	nn2Vu1ExSKeFUq5I2XFs4l9P05b9FPnkhBvmgBiGQ0D5Vl3NA3fbeMA/cOHfsCvztVTESkQo6h/
	m8n1BBuvzq1rgEpWKwauK/qGqW6Fzxf81quIo0Hw5KT28/4ZwFL/beYv13Is7lmpy3TYtGdeoym
	VjS3Zwno5YSy/Hg==
X-Received: by 2002:a05:620a:4504:b0:93c:6b90:1d18 with SMTP id af79cd13be357-93ca97b9304mr702908485a.62.1790846791112;
        Thu, 01 Oct 2026 02:26:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:93c:6b90:1d18 with SMTP id af79cd13be357-93ca97b9304mr702904385a.62.1790846790543;
        Thu, 01 Oct 2026 02:26:30 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc751dsm119255166b.67.2026.10.01.02.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:26:28 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v4 0/2] net: stmmac: introduce XDP multi-buff
 support for TX path
Date: Thu, 01 Oct 2026 11:26:11 +0200
Message-Id: <20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQrCMBAF4KtI1k5JJumfK+8hLpI4tQHTahNLp
 fTuhuKii7oZeDzeNzMLNDgK7HSY2UCjC67vUlDHA7Ot7u4E7pYyQ44FrxHBKAjRe21h8i6CN2B
 MWREvKmUbxdLuOVDjptW8sI4idDRFdk1N60Lsh8/6bBRr/3PljjsKEKBLoYXNEYXCcx9C9nrrh
 +29z9JZ0RG3kNqDMEGcS6lKUxqL+R9IbqF8D5IJsppXDceaKmF3oGVZvh6ow6ZVAQAA
X-Change-ID: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4
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
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BTKHZNzLcu-yas_8Q45a5VPDIaeHiA6j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX7Fb6crO+L7OD
 rYs6vTSOUyqvdBhdf7OOjj5Qdjq0ZXTN1ZmxUY0y+29FMTRFl1F2yUpFRoC5Q6xpEz0rSXFr+nR
 BZguKcpL3YfnzSAnephoyMOp3iP9KU8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNyBTYWx0ZWRfX0NLtVhuyZ5Ue
 w/OEO0Zf+nb06eeke9G+00QfhyD6Oqss5v+LvKrnDk2NSpYInJEObjW4ZRvvRvQ4IyMaT0KQHr0
 ZEsHwjxrGhOBVHq/76784KHYCydXSZa0MNWM7eFtc1I3XLfO0HmBVsAKqynAEjmvyC74Zrgt9uz
 IY8/Z/R4HWW0qxrS+CexxGu9/pdglVp0TQ6oz631FoG7JS0IZ1f186CD+/9ZEW9AGQWExbf3nuu
 cqnETk9sFVXRD8N3Pmxl9l1CkEs0Ae0Y7qpnFghzg5cHEpEnH/QIr4iRq+/qQRL4fAhiR02hvVh
 w8npvN0AbCQz5FMlpmAhKfCyyCVS2JF8Wr9E9+uUfXEq/2Y0RzDSZf6YV83zdfU/Fxsyp+dPe/X
 CnQcN2KVr2gtEXXc4sWqT6sUawL4QnaBgstWtV/EYY/n/JlNzFoHmMrI4pIL3p293HPa6Boiq6m
 OmF71FpUhh/iUqZFEjA==
X-Proofpoint-GUID: BTKHZNzLcu-yas_8Q45a5VPDIaeHiA6j
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe2747 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VKprxIfjjedsZqdkuwoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_022633_276993_963DF8F0 
X-CRM114-Status: GOOD (  12.59  )
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

Extend stmmac_xdp_xmit_xdpf() to transmit XDP frames with fragments.
Fix TX coalesce race and div-by-zero in XDP/legacy path

---
Changes in v4:
- Add patch 1/2 to fix theoretical division by zero issue in xdp/legacy
  tx path.
- Link to v3: https://lore.kernel.org/r/20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c@oss.qualcomm.com

Changes in v3:
- Advertise NETDEV_XDP_ACT_NDO_XMIT_SG capability.
- Add missing dma_wmb() before setting OWN bit of the first descriptor.
- Link to v2: https://lore.kernel.org/r/20260924-b4-stmmac-xmit-mb-v2-1-003347b7bc25@oss.qualcomm.com

Changes in v2:
- Fix Tx coalescing logic in stmmac_xdp_xmit_xdpf()
- Consider the max between STMMAC_TX_THRESH() and num_frames as
  threshold in stmmac_xdp_xmit_xdpf().
- Link to v1: https://lore.kernel.org/r/20260923-b4-stmmac-xmit-mb-v1-1-a71a1c522142@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: fix TX coalesce race and div-by-zero in XDP/legacy path
      net: stmmac: add XDP multi-buff support for TX side

 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 160 +++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c   |   2 +-
 3 files changed, 107 insertions(+), 66 deletions(-)
---
base-commit: ea3b2f0356c2f33022c10dc7ad3fd02bf4aa517c
change-id: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


