Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7163CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=PedrS9kTxPZaZklF1Dl5vQn992
	AfJqfu9cjawFOiMpsXlgsVNN2KqTRDj7ZTdPn0Muj63iEunMuvSp6T12P2JdlYhPYp1//yog6h0RC
	sFkjSrOCNrWSxdFQ2Q0Bk7wSC8NG9RmM8CJC6XBdTYhUmGIbdUWC/goS/7299Z+2aISENoXNW7mkZ
	fGTua80ScPUMdH0r5549E8fe3EZN14wjLC+9TOJBF0zr13ztRTvV70eSdbIpVP+zE0SmMGCKfmkRj
	7GsZnogL6ENu9lnuOhWVKaLr/z6mkuHygF4zgJ6ZydlkprDqrPGmah3WEfhs5cE5sqYS2mhT7/JD2
	T87HbfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2lv-0000000DsfY-1qbz;
	Mon, 15 Jun 2026 08:34:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2ls-0000000Dseg-2iC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IuV31836036
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=ch+9CQTZ/dXxcWhn
	OEHiPEEmnnGXuY9ZBEOXxs1yBK4bC7sD3QyyAVyGlJXximYY70c+C2DwnmyaKDki
	jRZGPz8CBCx7610QAYu9M9cDfiGqtcfE/TWbda5aLx1LDGjEOSUgj5jitg+rmbAx
	zdrOBY1YSGYhkW4U2foax8PEYTLQUiK7lwHmC80fwf57L9YdCOirbBQ5TvHJH6Uv
	+2OSoPxJVZS9POJWNlIM2OkR6KDxQX3aywJkoU1rlVKK0ek84R5xH8WJrMuS5Xm9
	rGZTem/cNKIM5hOjKUgJbjB20G0YIa8Qi3QJqStRd6WF2nKP8rsq8ukNq3Zcy5UM
	pVz0uw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffpdjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so2307720a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512455; x=1782117255; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=Bcv5uQ7FneKfZwe/Ef+FhxhTwf1IVNJwF04tlVmMVPJS1/bMBb5QSfkr58rr+9eyRp
         ge52rVVVV4suYK2aOooC58K0yotiqC5CEyFxlmWXwwW0pdy58L3jyUUc26ZSQ6pv31Vn
         nJ3PKYGIyEjzDs/G3CoXlXG2ZDYUKP546WRq36r7mr38f6decEcmvjhcUTzx9zNFuWa1
         GYWBSb9jp5AkNtHdoC0lLvq/JhZa25XlNRHCF+O9yMhG1B1N5sK6HY1KbtvEgb5Mogr7
         x1oc6fzLRVsZa8/d1GJpAbd2nU9q91j8vhauBzI2HjOAgvh6Hs6WUVYphK+nLkCV0KnP
         RPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512455; x=1782117255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=fzOPVLa0i3sqrzgiVMc/txNVlJgMHgKaJ5+cmLx9Uh75z0tfK6486GY2HHGbNLHw/N
         P4NY8gKNz26UrCq95x7KIMwoBoUpu7x83m+RuplhvYbRWfiyOKVA0Vly83neJkWEhTwz
         wxKVxDDpwNBwPjm58gEmxxYfx0D7I/fW2/yBU4idGgkLJ+JUpn1KBKtYx8BzEdWOWx6l
         ZeQo5JfaqXYjodthDNr0BZV0vfCguGu3xkdK8L49YThtsCtS65LSeqZQlnaO0YezOWv5
         Oha5o5/+Fvmsjknmya+0eKa7IALsxL8svevN9enaUXxV6WIULYKd8BgJQL9AFnB2kgrx
         IoJw==
X-Forwarded-Encrypted: i=1; AFNElJ/kNj8lmbGZkdkb7aetwxsCSJnNXYiv3GQ1sCau6MtwL21U/+/2Qk/qOzNpurl0EUIVQNcc1vKrjIpZukf+LvPO@lists.infradead.org
X-Gm-Message-State: AOJu0YxDYKc4EZWv6ISuYk0vUkHZ+us8WrWa5wsLHJoIan62PV/k/IYs
	vltonotuCZccmQfV5YXsF9u7LA23pcaC3tly9VtM96Ogx3xtYJI2jxDeGxKiXqDFfQnPbMW+Cx1
	9kwrlX/q653+dB/mmfkqV4JarfN2v2AEe8CMqVDfR4OqOF/ipSUJn8xuWv4vqFPHgMYA2OwoSdF
	aZ2A==
X-Gm-Gg: Acq92OEHhcHEwly91br95lr8xJ0L2zeOBwelvlC01wazC9vgtjMTMvYWeQsoTgpqap+
	2UiGwej9b1jlkwuFtvxuyV8J82f7s+wfoA8tDM4RmMS/aaJ73rl8PKL2AK3WxyZ+5Sx25wtRKKW
	F0GTOXiXRMIIwRAvnbkjTdMciTOUy59e2NbTvIryse0drqP5ogejhW07uLJy7Sfeufr2xKR1PvK
	k9k17yWh+UMt/fYIqSSwfoxGb2SGGTXzzo6nRMYHwW1DM21peDkdZNEcP3kDLYGBsY5uJuHyt2j
	84iy0NXS0fIJtlAq5tkLwYLJsyLFwlgaotDu55LDuAfV4/jjahqD8UQFgnAuU+aVC1PX0CinpVS
	3Q7YwA7K/MOnaI6c0aRgg0qgIfA/E3p4OdNKxqyH10Kq8jXVe3rc5
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950965ad.34.1781512455214;
        Mon, 15 Jun 2026 01:34:15 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950555ad.34.1781512454746;
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:54 +0530
Subject: [PATCH v4 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-1-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=15Up0J+FbwJVIGRY9JiOD8U4yeRHLJFpCKpZF7hc/+3ZGfnZWARaRaYWZU3DWtZwSxjPeU/aQ
 xdOt8iCMATcCF3QAkYKbQzM+Zsx3S4HetByuuecNdzg5Enl55/MbJmF
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2fb907 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: I9BHZFSRUvOYLYFphgHNPvKSOfS52_NV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX32rle+TLjDX8
 5oCKiuP3kQoA3ZCTqrNYOwgknvXGcYLDzI/3o/wEaf/jqBPXa3VMnK/WRVR0aFlRidhb5X33ArK
 yMi+vyPI5x3pGJU7BERyoHDOclEjnPo=
X-Proofpoint-GUID: I9BHZFSRUvOYLYFphgHNPvKSOfS52_NV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5Ux2l84SZMY7
 twkO+ugJpWhjCop2SD5W5Fea/W0dB9aAyrRVYvSnm/Qk+k9JJFe/V57FaXX16upV03gxRw8j4Zb
 c+6Mi0Fi9NPLPh6cN/SLxk3qEqAQhUuA9VqaLDEj0VrC3GnB6CWt/0re/HP4WwxsXbVQhIKyzM9
 iLWU2DNnO0veT2sEGkwkSGEJk/sg874fd9cryK+ICkraQL58WhNjh95nI22Ehc5qOhiw0YbEDhO
 uiFeP3j5JkAdIwi1QSzLq3SEhdW6kq4gW2Bz9s2I/RGYr7yjWjbiQD+chav5rznCsibPKo/Uzuj
 yTrDx/O98zMskHKGuwxSeIEijbaozfqGZYilO46ImRmE87Qwv5yLgnySXvDyyfYKmyDOQbHbUAf
 7g+oIl+92lgMmq7qYgUNNYh/9LngZ5MgmtmUaWeI5gUIaitVBtXcKTP4E8h+9tMvDsgtpb4B0H8
 4la0Y8xHQucmKmdn9Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013416_686676_DE43CB73 
X-CRM114-Status: GOOD (  12.68  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
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


