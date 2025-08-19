Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF15CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=; b=mtfiX1yI06oRG99/tq9gnKxI9X
	RTON+iGiknBVBV+RxnLMYVw3Gs2wLmgTtiK/TSL5slCI6A03eB2OYYsITINGsyAa7onc8+ta4Z5Cx
	GcTKCOOkOfAsKXZfVq/5BWNxAvtnGtQiYd8CwTuTcdCv+SHbIcqzIkXRvP6CI0uE12rYFs8e8/c+I
	fapibR0vE5vGu6rMnttpNsakzIMwnxS6iY0qR1Bc2CPmg9nn4MZfxkGSknt7H/XGa3kN86EbCwbXS
	Ftzw3uLZ34h+QWn+SwkDHGI4W+nn5pMvsg4YKbZ6em+kfe3LF2aS5Bpe1V7lSxz9vuqjjiWuJOWmi
	RQeJgsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGIg-00000009bDd-0LFZ;
	Tue, 19 Aug 2025 06:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFy6-00000009YR2-1Acz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:37:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2SorG020696
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=; b=FEEiPTOsUZeFu/qe
	+jNrfAA1WrSJLADQFgBeTqO8iKt92jHLHJ/BiGhzjA0ceEjv4YwOgLKuL807UJLo
	uGIbkBatZVjtcAkZZiGW1cDnpaCVD7jeVGHZF6/P8u/aoj8R9dKd/LitOHQvGx7V
	BsldcVCDya8C+8C9UcDpM2OWD4vUQtXPEeLdSGtNoWOTUhbiFtQ6mKEBuSlus6at
	cDN3wFXdNyWSSZ5EUqqsinu3JeNjHw8tsbXbI7HQc67vKtwu4A5CLFdnN2Dfb2wp
	JVcOIF4Q8SFRbmNiQL2ZMWCbNipI+VTBWdnPVvmd+DFM4BHSM0i+dh7gyPojtET8
	cuxzbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagydyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:37:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2430c5d4d73so67752595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585432; x=1756190232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPgiFAJ7QYLG2oWj/sNVs7ofikmUpmx59tiZmMh5Oas=;
        b=nKWj+RLlbGQ+ji1ieUWGVvkftMgWnelJjnZa/S+NjDTLRayIwl07hAa+43SUaJbnRd
         fyayUyInNgRb6I8MHg3kNk8jqj7kNwCZYVEU+Z2eS39I9U8bqtclji2VvRKxmbey6EIT
         e7IaqUBhiKapJTmuiYh+VnWbB7/SttVRPvL8puMlsimo4dWZmM13UBoJi0mnxEOVUAC6
         oZycSfVUCPhlXww7HUH2ZfoirmUpM7+Qq7EU9Zs60OFFd+iMlKsrUQFi24G/ZNZBMCQe
         9Jqw6Jbwv//0EiHm+3gRyB+wRpMRFTU04fcEk0SChvfMibcHdoEdJ5BfQUW1C28Dnd63
         CdNw==
X-Forwarded-Encrypted: i=1; AJvYcCUoVp+k/WestvH/ia3HTCxqdEkyJsiQWOBZPP0uGuvqbMp74snpcK8ZsEsftI7nJrTGipgIngVQ9/DzP1CD2lgo@lists.infradead.org
X-Gm-Message-State: AOJu0YySSCbvHRy2PZuebu6xYxQ2b2VX1F3n0fe+DYETIkfBk39VM63r
	NQhHS/oJngcvBFE7STjcRsZ6MekW4BNmqFe+ypqrWlLBVfROYDJ2JID7e1YATUEVJKxSFPVT7MQ
	Cghq3mTUdd34YX3gfJloVmYf46WSIH8ihfMriXe8QBAVNZH3YrQrZLqeGRnJXn3MwJtuS/r39AI
	kD3Q==
X-Gm-Gg: ASbGnct2OThYF3UfMn/J2mSiaoqsxODj7XAo5URvVlBuX3zgf42y5NhYV/6LT2+TwWq
	zZ77vm3T/WOKaXrFKd7faNg2tMZ+fkxQY4meXR2wt61Antly1fi9KcfHenAy1eunfex0NcbOqyz
	RumYPYCeru7stJMbi3Snr1yOw38f/bajs6xAlpv2b6pgwn60yqNDhhLY9eMCrNIws5bIKLzsDzU
	AzG9pZk01fFoz1B1nQ5a4Oo27zgkdciRnWJsgzGT9go8A6KKBQqengRTznPCsbsn96AulxJEjXK
	1W88K26JmSXn6la6IZvdN7WuSExtWQZc35j5OM8/dxbgQOch2hOWv4q5S6QDcruW0H5amPQrfN6
	rmEbzjkqh156TWTJ25JDCt2fFgTL7U/SvoA==
X-Received: by 2002:a17:902:dacf:b0:23f:75d1:3691 with SMTP id d9443c01a7336-245e0ebd338mr17897255ad.15.1755585432121;
        Mon, 18 Aug 2025 23:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs5sSOdxz4RmFjmlJHx9g8dTbVBE1WGeTusAu1XpGUGqae1RKUVGWzRGqVqz2wkAnydBOXQw==
X-Received: by 2002:a17:902:dacf:b0:23f:75d1:3691 with SMTP id d9443c01a7336-245e0ebd338mr17896935ad.15.1755585431668;
        Mon, 18 Aug 2025 23:37:11 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:37:11 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:36:01 +0800
Subject: [PATCH v4 6/6] arm64: dts: qcom: sa8155p-adp: Inverse phy-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585389; l=949;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=UVRoIFA7YXNnu/vJQ5olTkDt4U/pPMeeSryOJu9KTBM=;
 b=tsf+6WvUJKGOAH+FBQ4hmhftcJq+MxJgP5hpWHWfw7nVpRZpaoDF3ljPE8azKnO8ViTgXsSGS
 YPtA30xLy2ODO3YSOHN1nrjjEXlEbtXd3G+JBkkD4/mZWXfZrbYVwV0
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a41b99 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=78Yoz-F5aJHhz6vTWxYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Fn8knJQu2T9u2y4-A6aAHEQcpKjXWAxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX8apwFJkiqAsx
 Odwoc8j1u9LKamrGfbDYi5LZy9X2SKxe2ZRAKMY+TAaHpyk2e0UX3Qwurmd+NeRPh1JYKdZVnu7
 Ssi3Dojdm3JX9i6+3xgedcWsSUiTl7ZUgrrHi4NTO4Ht+guIyirKzkEJBYAGqbYof/u7228Fs8Q
 qQ44JTvZYmVsDciA2LHFChXQfJtds1/kn6q0tf8jaz92hSaLtKzRvYenT80qSkN6/ev5ohN9nqE
 s+YRWdUaiY/+Kub2WpwXNMN7zt+bL3/0u6AFYen+q5mNVbH0/YAgj+C77Nnxrqua9U0hGSpdzXc
 p1Er/JOTFALsQyUrJOjOxuqDvSlIWkMBiLJnd59dl7UITrPUlra9MsNPRVqM5apmLe1VO+sf6KY
 hSXaw7qb
X-Proofpoint-GUID: Fn8knJQu2T9u2y4-A6aAHEQcpKjXWAxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233715_960973_34B66529 
X-CRM114-Status: GOOD (  15.64  )
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

This board expects the MAC to add the delay. Set `phy-mode = "rgmii-id"`
in DTS to match upstream definition and work correctly with the updated
driver, which switches the semantic handling of 'rgmii' and 'rgmii-id'.

Breaking ABI compatibility is acceptable for this board, as it has no
known users or interest from any users.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 388d5ecee949..4ac1a5b09e30 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -325,7 +325,7 @@ &ethernet {
 	pinctrl-0 = <&ethernet_defaults>;
 
 	phy-handle = <&rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";

-- 
2.34.1


