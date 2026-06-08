Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB61CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=; b=GIxgOAWDJyXcwrKF9w/Rly5y/e
	FWHEA9GacUhIJ6YpxYBokdxpUW3p9jNS2ApNPwoCaosYCDpwUxfVDAuHtJDF74y7AfqiWlUoz8j/j
	OrAj2qEnWWQXVckndsXLJof6My/s8C3r+K2HJER4yiPjUB591EvAjyv2oITBmRmh9CzLYm8n7A4Ig
	6bVNC5XzAOTwp05EWeGelXFM38B4b1RJaYFh8XcjRQoSXHUEPYWKf27oWFbebs1bdlvCg8rAVPdVr
	oZX2ML0g/I+xtJLho/e9YDodNBBBcErAUZpzXc+SoStAN3BzU22GnCFS9yZSdbYmisSkJkAh9Abcn
	bcLag/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWad8-00000003h2N-0t83;
	Mon, 08 Jun 2026 14:07:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWad5-00000003h1a-3pyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658Dl6r83275794
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=; b=UfA0kCOE9uCPqG3g
	liU0SAShDXaNoU6BsRL/1uOoxrdPZII1lCxyDOP5apMDmj+62yWkZATABGGMrzT4
	fPpXI5IDslNlWAkvAHG7E1b1bUZFxuDNj0yADO8ouA8rB9NsJaYsv3v07bsXfsyd
	BKcOuAUJpxMnRGY8dCkLKpA70LPNej1dsCBrRKRfRtv1zNX2/ucJ/xipDFxj6DeO
	Z4DuTBxCetmLbE1lbAPPNsNxpp2L76jXimYjc7qiiwSqVPw0mt5swIbzlmOBeQH9
	Z22mPW7DeUNRKTcnYCxY0xR4BK81B5VkjVdS5ZDl6gkatRf3Z0Aa6tO8W+3n6LHK
	lEzbqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx402rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so81078805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927623; x=1781532423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=aFAxePSPJVfboIPJoVWPXiGE2nxrmVmua9INanPR4cv2Zw/5Q66F06Cj9565rOBfy6
         LgJtt0VRoYv0iVM5ERTiZH4Qisco7GjGCHV8IA2F9+v1PJpFTevqVa7JQXbNsgQl9UHv
         Mnyt173V09tm8f9LsY2a/Ffke7zAbud77wnsA9t3/lgjfWxp8YEzD7PJN5gtzAg6phw8
         ABUEINNcawqwKPXiwOOr5WFVhdC3Rwn91mt1jkxXNdiZXP+tBjGBnvtDjNFo77J0jHjS
         xoqkb/LpzO6OITc7nw05KcxRaSD1iY1ZA9ZNpAplH0OPhkpEMaBPeY7L9gZQSWMqV+gZ
         ZG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927623; x=1781532423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=khCt0KrGz9jz/EGG6BAcOQkECKHKmFD7Ch9mTB028Zt9b2f1++XSuseqHfB7uAZB7h
         E9prQBKGlhm2cIL4r4U6AwUvfsNBcz/V2ODSASZ6Fcf0m6pSxZt4mihnMr44Vz8fwpO1
         owlgnuO3d8ZkbmvrlnGCOGU3lI/QpiY6In/fbzufWnjg26DZewLL/zAfgQFta+/whZJk
         EVhq0gBPnQfmxeyuVCxFCzb+PA45JW0jgqrXr0OVBi4f5XMe/P2ob5kn2ZXVsG3N+ILa
         E2oJm+hRxd+g2ssv32k1G5Wh+vQwxG662MeLEC29ME5JwPYfdgKJb7mPVpqNrmdGqoDq
         MX9w==
X-Forwarded-Encrypted: i=1; AFNElJ9iv243wFHsy5mpRX2qjjj6EBtSBLZ7SgpfG24ahvCr2lnACu0Q8xCQ5oF3cbgFH+gIQXI6W3t4A95I7F6JZSPq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy11Mq94Z+CE/SbcnsdEimOuTRjaCRYNv8o+eDOsMkwZP2MiXIH
	j9yf/bkv9bUwLGRZ2hbvDmWvMIbEbviXe8hFkceh4ifbzFeZrmrCYeBL7VktnRVL+oi6CwjY5pB
	vFRkpDDExSXdKVmJK/AoQ2zJ2A1OYxpHxWq3p1M3LG6nR8R641HAKhiayFyNaRvo4fCxnjRl6/2
	54io6MA24SJnUg
X-Gm-Gg: Acq92OEsLGsLECrc0lWN9Du1XHKx064KyHhZLta1zKrYI1GgGq7TUuIaSuasjWLKzBQ
	9F17qB/nErKXX9BuvC7y8b8HanY2Ag6OEfHtI3rzBG1xV7aCPKJaQWknL5gyla/2OkXhPzNeqpN
	8NH587epdKom9qA+nUfPhE4BUNq9tX4iBjHLFMixkTJK1q9nz433IweGL22b2h9xGnfp1nTpI4n
	wov34b1cKa5A2eJuVCxCynEwa9WPPMwar5gOXW1MUmP4mK6BzJZ2mTgATDgt+FDsIZrZ9KUCDdg
	MYh8ZNc20wHxQI7liwn08CqcWKwRSXgmWQ8XBwzuy3ZS9oWfdrUCqAlBGdlooIxGxOC+CWJPQB8
	jlkfX71Pj17DxucgvoixQ2oHfGMA8OEy5jtm6qdbZ6LhH81hNkRNpmX1Q+bmWkIM=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172955075ad.16.1780927622831;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172954375ad.16.1780927622304;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:38 +0530
Subject: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1604;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
 b=FZuP+b0PVwGIBsTb2GSNEUF+DkA8aVrDemOfdhdUPeRG0/7CmMVJj+ha+mLWH2JznULmJHKZy
 hFtJycnzNmXCPR/+tv5qh+moHGxZEQjCuwFQ+XkAezb5qj4THlqUzjK
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26cc87 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1VV9djyPqd4hf17d6swA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Iylu_7LU1fYeunBvyNy_pkvJPrXRmJSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfXwD0fmKlgufbE
 Ch9tJ+U6Kpx3ax2qjUTSBdeRpaGDK7DOYACQ16ZDd4tFeQ5RAAIMFh0jfA1bBD6amW5AM1+5FyA
 fWDC+iZ3ExyNGiMuvan3LhU8u6HmMIghOlP8e9YFIk1kaUIvXGK4eh4BBWmauOHquMjPdFhk7k1
 pwe9Fd2/j7Cd/Bfe6NUB1w/qk0BBIysKekYxblP9dQ/w4tHk3XU54zGA8+k2qMsj/u+4iNshtZC
 0qMxE4dgi7Tktncm3uM3wUpDanLC0j9HQzKtYfc1qki2lsvFerwYMcMI4kg3TFSYftzvfXq88XE
 TktWI/cS1+Ui6iDNGzRm8RelBo2QagQ4k4VUABRnQ+EJ5Sn8508ztF21dLJ/qjXalf6DnfkzS1o
 +FtbK3/spnxqlk13+J5nWUBVA5H7V1S7Rjsqe1ua/bJRz4tmP83sbQsH3zuxBtN00jJYDj2DnSa
 T6FKdEmBqNrT/vtW4bQ==
X-Proofpoint-GUID: Iylu_7LU1fYeunBvyNy_pkvJPrXRmJSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070703_970755_C3C5298F 
X-CRM114-Status: GOOD (  12.42  )
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

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,8 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
   reg:
     maxItems: 9
 
@@ -76,7 +79,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


