Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD371CD98D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=; b=OjoAlSvtO0pPobE2S2goOct3sy
	aKPGj2vXJUJH3wZUvM3/pKmfL9RYzrHX9q9hyPR36rC/PYRIWQkieYi8cYKc3W084aeHwMf1ppEOe
	D85ilSyV5aipcwKvlLc6yl9Kh0veTfgxDg2K1BU09DikzSnO8O8/Io6NNlSBqAtpIe5PfKczl7QVB
	raO8kUAMtL/7mLbryTKs+jcadqeO5X8qRfkzJnbLS+b8KjO5l7NJb4YYfIrGPLXwDK5Pw0EtodLex
	KamLaKq+K4TBj6Jz1k0bnqnN5qSHgxXh6nz+VglCtMXuoxSJy8mhMYrHh2yWFRFWz2umcs7kwonlI
	W8Kr9p0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHP-00000009tIr-1lqt;
	Thu, 11 Jun 2026 18:37:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHK-00000009tGp-43gO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISPRG1435276
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=; b=Y7RcbeXrUvc6Z1/b
	nZ4FOXt/Ipi+MICJydJ5E7HgxkF/zc0pd36ESrMyQty/5HKx8rB8q90epNh9ZSTY
	s4IRDgyOn/teB7YqIPL/M//AxaBn7tfmitVTFt6o6wx11Ppq6KMvwa50tc7kdHEA
	PzCzNUlz5hvFg9OUNq7uk53/2GlIPXUNIhRdO8s2JhsN1z//Uz74bi+bIVgxfdPC
	kYqX2AtCmhkc4mPU+zdTDmf5Zq+Pmm+ahs2XZP2NMgzf/uCGh1BD9NIF66np6GWJ
	nrqB6KGLHPt54PAJGeLQidsD+ixDwDVOv+DQqKs97+feaM0mBX9DW6MEOrNOjfL6
	YT82+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5jd9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84238e83851so124269b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203041; x=1781807841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
        b=UBtpYUHhZE28tHCsdj+YuNwrYOK9G34S4gE9/2P6zBJ9vwj+emkBRmi1OJPPLz9cg1
         zMyxEdNbdvdJ4ZkzgiOBKIjdneMwMO2rHH0nt7DZRkZN9PLCh16PAtf4KFCrcyf94nYG
         tdPhgkkaij41hEyjcfuCrZYfonrWmB2VGX3/TR6IJWAElgkUMxbpGpFmQMfe26xwTeBh
         vS3fy87PZLT8ezYFqUbBxTn/bZaXytlFzUVWMeOvH8gtuXj3Baf/hzVTN9p8QM96LpgP
         ih3mJrth6Sb02tWjbM91BDqSKyqfWV3wx8yodU4HT0vB8Stb8tj5xuFVrjjFW85xuepu
         0lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203041; x=1781807841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyxmGXU7tCETamEQ37pkjmBcE0pG+FwQBF/uCJxPNaQ=;
        b=LV4q5xgQ+SWzSfdo9g9dHLbOll8v/C4kdXvTA+GYpgTqqvB/VWnpfjqtAI3urocuNL
         /X/4C942gXxyY7fzOBF2jJGXgkz5PunTgMntheZlKWrfhaYKjr+6NzxqaVcunJY1hVwe
         PTfbh+dZuuS+48GSFSOadmItrArbOjEnItfmmD1UE1xKCmaXuSYDlL3B2Ds/k/p54sGi
         HZgNdv6U1pSr/oDnllBZN5NR32oI7gvkUmJ+fD17tRP/QGZLYx2vGyDQwYHkTghtzR90
         cngT8/LHYv9oiwDk4NzEZ0gki3XcQICMMbCgT2jX/GQ/mZveDoO+kzHLA0BtoDFROv5e
         uBSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hVWFM2mHcHsgwga52sg1h3ADYz1Zf90DH9yQPRe2WUH7gwSv8aga83kFm9QvNbkDVhKc7iFX8KodwLJG2HxLl@lists.infradead.org
X-Gm-Message-State: AOJu0YyUOF/OLAtd6Ms5pT0E8axkf+BZx+8g6tXz6jyd27TvlTl3kmQ+
	p+DTXuXoA5zMSAE+BJYEPrTtk7AIJt9pPmHpJs9KfDF2wpE3YIomNVgx2JNCOoMs1KOYYNBc2fA
	SRCU5OmZhSVlt6GcxRPz4KIZM/eJ4M/RzPYO/Jtb04/CywPuMLrB5IiZll3UtNgVQOeSEuzhsH/
	SKEA==
X-Gm-Gg: Acq92OGTtCtabZqdZmxC9SezaK1vMTOF959TnLKjYLKRFCm4IXCnU7DTWrT1gW/eAay
	KoXKGEX4FsopOjpwy4/pfh+i5yqMrEViNfAn0fcKbaMMAIEEIzuBuy+8DHABn2pSQmDj0rTKQEY
	4FV8WYFV+AhLczAMNR6LNk1+iWPzrsS0VcZVfTUs7brvlWYz13lRnQAaeBmKP2yzNYmgBf8A/Dx
	cFC6HrrP9Nuq4cug6A1tTh6KBRcRRwcvjTe4v/2+YVFAqStDzfJup+wfDsHxu15d4Cnj9K7TTRd
	ywS0ECFhcGk36w2aOaa/UH3RcmOxhMr3cbVS3ZuaOx8OKMSgraYIY74ManwVw935NtLdFJnYXO/
	HfROeIWH7VSop2dYKHVsDvpavg0dOAET4KINVk1j0vhiUdReIJY8=
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id d2e1a72fcca58-84336bc69f3mr4345825b3a.22.1781203040952;
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:414d:b0:842:732c:568b with SMTP id d2e1a72fcca58-84336bc69f3mr4345780b3a.22.1781203040445;
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:57 +0530
Subject: [PATCH RFC 1/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-1-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2195;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5T444QwrYmsTwO3v1gCqDgxdhU4Jck3L9IB07WNXPS8=;
 b=Y8TuyI8PC+fi6lUIQ3mPFu/M5131hg3c7XDWYgoxoDB1Fd/WfaGv9PKijnwpIL8ceTzv9YHRr
 3aHjmo3PKU6CzJz8jJBD+WK6JDJtkQlULNu5b5xAVGiJM0RbhvweZN9
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX6OL6U4r50pPe
 bDxXMcseSv3R3oKq6WIrNjfuJZTlbcqyj7cbEtrFi5Su3AGtCFPqfEruxf7cqt6c884FLlgzfFY
 Rn0u8adToHWH/m3jU7GAzfzB3mrKisnKmF/HdVKh4f+2jIO0RjZnqTmc8GO7xkHHW2iZ5B7hIek
 fZ1kPGryX91XZy9okxWYR3H1dS/VAYTCRDs9vMzBveBruOovmrUigMAq40UK+QbJ7+lN2HkchHM
 rKVyjymmofs4w14I5UbQZ+L38VrrcqKqCzpJTYuaVjCIbDIVlGQNIIMPFJwPo+Bs8CSIlPMfv4I
 JORTOFS02s3WsJBTSBI9BvpIfj7FANPXiAbR3ib4sBDWRg/xPDdi/eKnIxwCBukSVwkUG6iMGQ+
 32B/PRPE0EKS4Pah0r2OSb+0IonTgJGrhUuFlJJpVNPdPB/44BosLR7lRTQHxyL9hf8q5lafdS3
 T8Ko/vYj5g56SIv7aig==
X-Proofpoint-ORIG-GUID: twAYys9U1xz5Bi7M5OohHMim5tSC8GWu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXx6TDqVjLvj14
 MmPqxD9LvMeS9jDyVuHJy4gPCAbDshctHelq/DSeDnx4qmrxVD22HYyQSIEiBdJu4DBoZgD/adc
 ItHXDZOhKRAxusVhzsbu2kntYNoeEjI=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2b0062 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=w-NwtAtCphaO0WLdcGwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: twAYys9U1xz5Bi7M5OohHMim5tSC8GWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113723_145015_C9A6B16F 
X-CRM114-Status: GOOD (  12.34  )
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

Shikra's EMAC requires three additional clocks beyond the standard four
(axi, axi-noc, pcie-tile-axi-noc) for NOC interconnect voting.  Add the
compatible string and extend clock-names with a oneOf variant for this
seven-clock configuration.

The AXI clock appears twice (as "stmmaceth" and "axi") because the
stmmac core and the driver's NOC bulk-clock array each consume one
reference; CCF refcounting makes this safe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 31 ++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..4528946856c8c6e33bc6ad4159ed111f35ec37d9 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,16 +58,30 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - enum:
-          - rgmii
-          - phyaux
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - enum:
+              - rgmii
+              - phyaux
+      - description: |
+          Extended clock list for platforms with AXI NOC clocks that require
+          explicit driver management (e.g. Shikra). GCC_EMAC0_AXI_CLK appears
+          as both "stmmaceth" and "axi"; CCF refcounting makes this safe.
+        items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: rgmii
+          - const: axi
+          - const: axi-noc
+          - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1

-- 
2.34.1


