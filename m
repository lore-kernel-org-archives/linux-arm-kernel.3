Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72BFCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WuXnvt8j9PQBj6KrjYCUa/E2KkBCNN0xgbe5L81YaOo=; b=Hohv1TnvGNVTS0
	VPSyP62vlTY87My5pKinHlW9hnf4YGqoL5ZMerKrZvfvGR4cCYTXpKkFEE0CFrp5yG2r2vmaSzTFN
	WpomtAcEx9CAutr5HdKl+Hd/daIolzybGsPazkY6SMNQVdMplcbAZ2YEknOsJgxZdASVdjEbSbg6x
	7v8ddtoyaEjC/BT20RM9QsWZxeJZNvrSgtSFU9+MqIBnajDtAqU1FTNAtDHkzVIAx0zSF/TNrjaPq
	BMHDb2WVObJjtlD+XHnhd/vZE2H9XfXftTMujZlwaAWqj4PgrHgJtqCq1Kq1T2UX6Fw8i9uqcgdjE
	d8i40kvXQis3g/945HmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEWy-000000014eT-0qZq;
	Mon, 28 Sep 2026 16:48:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEWv-000000014dc-1Bbq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:48:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeUNG941418
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WuXnvt8j9PQBj6KrjYCUa/
	E2KkBCNN0xgbe5L81YaOo=; b=lIEA1Q+af4rYgL0mhGOaPNXzGX6mbl04C2cyji
	/uP8Qzsaxl2UJ1D41jpQLWUQ8vpUGEsFGfO+54kWwhxM8mTjTfZLNR/Rw8Q3bjsD
	8Gct3TZ1KINhYMu0Aqjqkdcx/4X4e2UE6dFUbOopYtqW2YY/BhE+BAWWAQVarNC/
	FOMXxjvLlTOupPGzPaLDrAcxAIUxOxEiCkh3raJypxfds/utzDf4jYmnSmX+b9Ob
	a6vW6PqncT/K9iBKTmHdQwc5WXcs12VwAjpG9GD+zOFi5JLfrjUpdL/WmToWbVjP
	SSOitEtHXUf3yv2SNgdmtxsA6QLu5KEK2UQlPLH93fAFxcAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt12g09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:48:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso8320485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790614119; x=1791218919; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WuXnvt8j9PQBj6KrjYCUa/E2KkBCNN0xgbe5L81YaOo=;
        b=VwR87UeOUcRjHsPNHHsA6/1OK7bai2EInFjmdaW5OgDT9wul9OUZv8AEXmUzeJpr9c
         qFPZwqJCfcYX58BgFPw2TVRS1QS+aiAdmWFU/XKFhC9odJFhSLhdUy/awEJknCq5ENN/
         V5FREUoFlS+WDCC4xS9mil+z/clFOnXdWvlFhEHibKQkG6xhZ77RgHfnodKnwJelNSFC
         WQRLNqf/d9wwkEc4zZDRziup1yjDrs5hOG7Iq8RRRmObCd/q/5kt5/aNRxkrQgThkjIJ
         1qjkeVlQMsL5GAN8N0KLTx+p37iMAFIrp4SaFNNXQ9uWySYHAZSvg9pjf5DXG6W1S+4i
         NUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614119; x=1791218919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WuXnvt8j9PQBj6KrjYCUa/E2KkBCNN0xgbe5L81YaOo=;
        b=JCTAKxhwehSlGu7DsvKfEsFVEKIb27d3Xw8R++7kkVhvCJX987WGE2PgQk7y5U9jYm
         qHoenLGNVEXp8RGD/ECVZ3tUYczsVTvjw78o85uwiNUEXASoFs1gnOUlZ/shDCno6wBN
         pjCoE7wCQFFG6TAR1YgcxPf3maCO1OnulbBeVPZOeKDIaMnU9DkjlejHKjJSc5eFNNEl
         gC+qPbFMOdUUa8Km2oppGBEUSryndlThbQoMb7sdDHjTjBjqPk/nl9v3TxQYBAySOUcy
         BegHxfZnH8E2WIld3wnV2vZHFtgHfwAvIOalhJ1194nQI6ETRN+xEzmW8LQuetpCkVNT
         i2mg==
X-Forwarded-Encrypted: i=1; AKwUvBx4rpSkY9yYwjqDI1YGXMHFa52dUCQyqsc9bd/K698OQx3v9hS5jWErvt7LDX9H6jION+QlhzDcLpavZ853ucKi@lists.infradead.org
X-Gm-Message-State: AFuF++lRaIwxeNX/GV4VABfIpD/W3hfvJME1MbEajfwTIY2vhrIGMFlA
	2lH8kCEi8G48cwNsg+8T3BF2ZjDBQqKmrvF1Ki0pa9H9UcyV+BgFy+5d5GEEKwSCoX0LMfalktw
	YrUODRUccrVd+0AkeaCzA/viF7+1qSvH97H0pnop9OuT/xF9JhZhLaOSvT2fkt3AJdTOM965QCv
	UACQ==
X-Gm-Gg: AYBFou0tpVtzx3EAt8ONn4o5qvbhbx9Zl1IZDNNS2QIev1EGHpV/daPwaMoOxo36if7
	aD0g6BobCU65J895ErC8ZsvBEQvDOHLPzs32Hy9+a+UFCM1KvJXFXHmdzI1N2LFMyjfDo/sAHd8
	de6Yfl7R9Pw1E4iuwydF/4sIwGqGq09ANh6ZgHst/6FnGuFl8Qxv+oz3iTjruCFHuKs0n+BvQAe
	SWdOyiHFPVnkfYmDpSzzuBBCNKhD4ylTCfsA8Is2RMeuhEl4LL0XcQzp8Wbssj9U7S2u8nkI2Pl
	npoqyLamuhQha/XSVz0M2ay7pAxrpv3ZpKyxp4GxYfASgCaGzGtbT4T3Ye62vfw7oIUeSUaPuWY
	bAdQiqzV+ievGKg==
X-Received: by 2002:a05:620a:6086:b0:93c:3863:ff7f with SMTP id af79cd13be357-93c8bb5a7d3mr1850785a.0.1790614119237;
        Mon, 28 Sep 2026 09:48:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:93c:3863:ff7f with SMTP id af79cd13be357-93c8bb5a7d3mr1846485a.0.1790614118704;
        Mon, 28 Sep 2026 09:48:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f68basm3662345e9.12.2026.09.28.09.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:48:37 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/2] net: stmmac: Introduce hw queue priority
 offload
Date: Mon, 28 Sep 2026 18:48:12 +0200
Message-Id: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NSwqDMBgE4KtI1v3FxKqxq96jdBHzqAFjNEmDR
 bx7Q1ZdlNLNwDDwzY68dFp6dCl25GTUXts5lfpUID6y+SFBi9QRqUhb9ZiCD8YwDmZdnLaQwyo
 1WSagFpQI2qlu4BQlYHFS6S3jNzTLALPcArqnZdQ+WPfKrxHn/Z+DiAFDUxOKm07xoaFX6325P
 tnErTFliqxH8iGS80+RQAVKCDq0vVScqy/icRxvF2bcjycBAAA=
X-Change-ID: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXxo4aRgZgCNup
 d8FK4LAeF/UOpoWVKSAgu9HHiq3kEbVmtEpreqZMbVarhSK6b7TZsMO+7WJpm3pheWNzQ43ic0e
 n9uO2Io+hpQ+SNu+7foLtKG8+gV/kh9X5sVT8/cStpRB4YK0X5eSEN2nATWB8GCqWfMPqa90xEH
 DA1x72nsS2I4xm74exI9vx23HxTgVxdiA2EJPCLc8FAVYcM1INzGwT/vZZI738Ry4CdJyt4/uW9
 SLG+H6SsRPxWjx479xtAiVDlC94oyF+e/p65Wofq9XbZhqWDfDSrBT+fJIX0c/LpTr9iR12ErjO
 6LDFBfVznUqhU8oeILkW1l2mYo+BsVk0A866yPDaXu09peIiw/0LF1q8NsWCXlbwgXzFsNwxAwA
 KwkFOVBfIGub4Pyv0+s3TTkLMg6wkYr/7iSy2nYXMXHdNqiVEnntDxOmktCTaIvMg9EDT3Ul8mf
 HiHcwdl5q33qJNCdQFA==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba9a68 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qGTJnaR_OStqIhYHjaMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QQM6uTH5qGBRx_gVCXPZ4f67CJ8XfTYm
X-Proofpoint-GUID: QQM6uTH5qGBRx_gVCXPZ4f67CJ8XfTYm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXzhITXi9U3G+x
 xr5woM3GpiQd0URjTZ9hYEAYTGmepwOkRXcLzsdN/IUV06kvAHAWOrnHOBApco5xcF85TqXPk5T
 NXoykKG85JMl2O5C0jXzKKRHFOsi9JU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_094841_447036_DAF646B0 
X-CRM114-Status: GOOD (  13.49  )
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
Lorenzo Bianconi (2):
      net: stmmac: add tc mqprio hw queue priority offload
      net: stmmac: align real_num_tx_queues to mqprio configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   9 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  37 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 144 ++++++++++++++++++++--
 4 files changed, 169 insertions(+), 23 deletions(-)
---
base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


