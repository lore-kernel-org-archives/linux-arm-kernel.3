Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24B7C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=; b=KJ/lNwHY+pLvJofaIOqpRFix1R
	rKUr8Nl1m7CYrLV89yizT0YDvavkkXD6E9RRytAJextLlbrpY873+EQnnrWgtiWK1egni4AemAeH1
	kfIX1V81oZwlQs8iJ/8nAr4GWM4xrCfH+kGOs91MozqhnAOAQz+RiFLb7kS0HDpeOExGlAGg7HmfB
	jEZNxWXvqzmqhutPhf/csbnshFZT6XnIsQrfkh0iGvUqQ0IuIoC9Kz9d39Qu6ifQRtFCO7KhSFQBI
	goXPm4+m8IPvuiVkG83h9vaQ/I/q1OymCm1L4Ij3bcBs4DKRY7tYRUmwpOEnvX2Z9BePdmFyDpIJ/
	Fl7emAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZd-00000000OSX-06K9;
	Thu, 03 Sep 2026 18:54:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZa-00000000ORT-1Tl1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G39GQ927741
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=; b=WqyiFDsb1eWDZKId
	NODY7STdeeFa9Dzz5GOt/I6NOzR88CxjuimoDCw/cOwtphA7NyMRmQ0d+YoNAHU/
	aoH4rspWjkNmuxUgaXiiTnW+2KxHI519tqNvxIK02z+5dwzVTTcVKr40kT/gzGbY
	2XwCq9QNWHj7VHJaSb7BT2kM1QaDgAaCecy4yUPUWmd1xk49R+tAl8p2kU7o0mEC
	Ug7xOhHWVb2kmknb0mHNYlEC2RlpCRCaRdJgFgjwQLM4Y/OQL6+RigIcStGqyJx7
	V8nSt/NJ9qNkYx3+C2Fkwj41W3epOf6FgC6qZ6j+P27MTA3CTkivsRCRKSiu04eE
	7uCIUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx2brd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso234593a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461644; x=1789066444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=dZsvRP91vCSIN1GHdd1evh8RNTKgwVeQz4Kmv7o3+gR+3HeOpAlwfA2D5tF/ov/SUU
         +A2vmScAcm1hqlpvFKYKaRLp5t+F0vxoFD4qBckNobdCxJWV10pMNup4dRZnCiCdsW2f
         KX2A+G51AvZfmFG61jjhO7DK6aDSK0Li8PaiY6yPf2pYiGbgjIeWMwhPIkQmfmJwLLN0
         uzRWCv5UgIuWOglpHYGetj4vk08xKu4p68JX2cilV6XKQCJDzMmXq0gggQFYn/B8/gTZ
         xfTBNN9peWfeTYI6MKLDjpmbB+XZ1tbsTq2znspcw1MnkHTjCUBxtN0JL0slMaIufpGz
         +FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461644; x=1789066444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=H5CSZ1f1bBQX9S0JBu/KjjwvE9RJcDg7yf4WLaffPYzEn3UlRwbiwDDyyV32U/sIY9
         BBFWkdiQOFfAO7MxF1KZh+s+R1GpE3feDiQUPB2xc+O5ngD4L40h6YUw5OgnQNCj65tn
         hOG3WlL0TAUneEFY8SUtXj/cZNGTzZg3eTONNM0eAzCdwDwvhyQXVB3t/f25FNv6VYFT
         WbJegbWMaLZO0NsdeU6oUos1vRQ4aBipWHxKkDzypekBW8jDY0Pqk+9Tm1jByc5HVzO5
         tLQHRdoETbmxOnqd0DnyCMUZu+fkNh7l1Nxskbmz41wOtMm4onrysEeL8+H1CCT5S9YK
         eY8w==
X-Forwarded-Encrypted: i=1; AKwUvBy2wUzcItZyUftYwgFmQ6Euf/cFro2qOSvBV0r8y0drZodhN4O+2leA4cJLQSuPAXz1eELnsN2ep4ywQU0FyW9v@lists.infradead.org
X-Gm-Message-State: AFuF++lJnBcVKZospNkVieRuCafUEb+RD5QUNDF0lMZKCXmHca/hZ1DR
	rsaiq+eMJs1noJTE0+pzLHB+Ef08ivYReAnk8paXNYGiA1oy3vISqa4WAx+t/5QJNSf6ER1SxOA
	VOww+7gNBJ/Ou0gdky3QD9kNhNk9U6StEOpzQRlrXV7xJoWhYuytIH0HOIgHRGvdzrlD8qNv0de
	7rgw==
X-Gm-Gg: AYBFou16IKNFvhDGTM3hvhDF4JtClKnsTrkzOfsG92z9XXRf51XcFiSSR2WrBMj+vMn
	JO4TBuPQSYlXoqnLrt+c4fpeqWZYAIP8Gfz68uQe42hnwLgdQCNA19JvCv2TL4jh9fKwFr9VK+p
	GRsq57Y64Z3083hF27sgJC+sd7+fYNyViDmBPUEembWTnyDOHqsTOFSbO7mzm/3qmyk6Y7oUoOf
	X3kXgZoT00tjek6lez5BXlII/4Ns4L3at1txiXcNCr8b768EAyylel5styeM2QHPsCDrKFfoLjd
	hkAVTvC1LOYj15/KSHOLc8MHei/u3Nq6Pn9gfiqyvr7inxL1CyLAn2+eY6TAikHw8TiN800aAjr
	wZUmd5Qpgd2I+tQKv2599XhYr3KNOTQ==
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr682074a91.11.1788461644266;
        Thu, 03 Sep 2026 11:54:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr681984a91.11.1788461643675;
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:43 +0530
Subject: [PATCH net-next 1/9] dt-bindings: net: ti,dp83867: add supply
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-1-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1977;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
 b=9YV5GbivqWa07EmRXOblUJxRz9P53VISN5Z/yvnsGCNVx+EjFrU1+3n4+/WNFMnmaAwQEwuHW
 8v25iuStJetBoprE3T28uAmO9+1AnmsH0V42lDK1YK09J+0UkP6t/rF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: VVMmfwCKpeaWpAA8sUt6YnlSQLTLBJXB
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99c24d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: VVMmfwCKpeaWpAA8sUt6YnlSQLTLBJXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX4LPCbtbapj38
 1Ynv3bcDKXZML+YASYQefkpZ+vfJiqHa8fbabgMa8XibuKP4lgO4Xra3ZI+V1zy8fgelXJahNfK
 y8oVDW5RYXMdvo74naiFtKvyicmWrVBQKQpxtRvzOKG5QJdorr6F9qE7Hp+DyhQ7pWa2vFKc+e6
 RaFhNEOAHfSNU/ZijH9frxJQHsVr37ZjHBj3o3IQj/uobSkaMnGat3s2GDK5LQz+E6aipvKjMwN
 q7fIMhe/l0aCeKno8wgXCtQmuYh3tgCP8ftrl23s3vMSAGQFZlvQTDky1NPdHOnHzov3tY6t1P/
 2Q8IApKzfmThghNlKHB4/XIgemcu2N++xWu9BSY+gkElMhDVRm3JyzJ5/D8fQUojSZpKuOj9rE+
 S3ZEHPbsbMyUleSrxr092G3Vz5Not+jlTjPse8mPc1vZLQkf2icrorPrRh9B6GQs5qs8ziniiTi
 ruMR0DmxYknQzcTBzRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXx4Y/DiUlVUeS
 WuuJVTSUnLytpq5pDvKPYoLB3o2l4r5TN4nDPqOFSh5BY5BTKm4GtutZ8ywT1aZrrYI4ZY/u7E3
 a70SOSoxf7TJNIk1bnzNsUnWzAvHBzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115406_513573_ED6A59DD 
X-CRM114-Status: GOOD (  13.79  )
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

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe51260b767b0a1b8b7eaf974a9af9..e78f08ded3d0d449ab75bf33d814fd49587f8387 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1


