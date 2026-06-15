Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD68CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=QU3/gZStsUfrlvxibBbBlY1MT0
	za0ex9ZGUgK+TJw74nrPviv8RmEesBI+r2v9150zNiVWsIxKBRoeOPoFulqyQ3y71ZbMiFgOEWQXp
	zGF2xNRIyqR71n0SnTMvO/6Sntr5ISUixwh6ls+24cKqorHYuy4yfIBVe3wThEW33AOZBmWLdIkwY
	SfnYI7xeF259zQrYoiA4tgKg7MF6c/pSFPsX0T+7H2JB/oNgESqo4gPk0Fn91jJs3+qenuOYzZx8s
	LbiJnBmOhVFUeVaZQic1LTSRUXqeC6iaA42YTJTdZKwugQU/7Paw6BzGHAthmDdglRyJ1cg88Q1AU
	kdFFQqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1V4-0000000DkFj-3euG;
	Mon, 15 Jun 2026 07:12:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1V2-0000000DkFK-2AIS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:12:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LJ793912074
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=DPYp/7V1v0KJTR6k
	Pb2ikbRoKdm7tBCZIv7ExGns2q6zkh5AJzlF7prfQqdeCXtF6nXkST++T4QmHZ/9
	9iDGAoGPbWSpSQG4+IqdWrM17ShIojeDAzNB+8Bc0wE2+y0q59oEExuxqKCdaG2v
	5v928V9ykaIk+BIz5pfyBpeiIUSs+lcGYbV2eafCMOMJcmTA0bCcLt0VVIzWR9i/
	gbgWMKmY1Lk4ZDTL08fhBI77CCWP6e1iENUwerWdCIXk8pk03H1mSIuSDYRsndci
	EP+9iZke4E05gj9Hg4jM8fkirUaW8MttHrUH7yCMT/OxDIl9l29x0dLAdgaWjVOf
	qd0O/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x5u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:12:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2945069a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507567; x=1782112367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=H3YDRPG/uDziSOmp1tTjksLBvsG8qvx60Dvy+pqxmd2Wp39JTMgMQwF1y4cXA8BAt5
         RstEDH2WhhgFu0I8SOs/eQm0xXWqFmdsY6MorpPN8cOI9qEsZtB70NDkzuaTrjgOx/T4
         U2PCAbvELoVQxlboDhKBBPGmcRYdRNNGyBQ3GZxg96IKdSoQTIO2bvlZnpzEUXJXAjgW
         KovMj+IbeaLApGXfreQzIDOLJLcTZSIt6+GaZlk01lLKaRojlbXEk19v90yj8Jhp203f
         BlHH40EyeIIJjrkwcgkalbyP+Pg0Xl66oZZJdyi27DdItFRYp1woMzeflgWeGd/3VFQA
         lXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507567; x=1782112367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=lOPUCyGN/amdqcGLb/STK7rjLJMu0mwuWRVc311GbhIdvfC2HM2xsnfsBhifEhwMmP
         8XCRTdmEqDU4mIObCNRX/Jy9XiHaM2r4aK9ZbbBAh2e7nKs2PGrBQCa5DK237k8yRVYd
         7FH6Lle20oEIMCh5+A+O38UnMb3fVTfxHJeL1OEwm8wXMtHgOnObUk6BKTagjqIDMy9p
         Aa9MRD1hvwewBd5N9aK/HWi7chy0LVroy1oNHYs8ELyMVncWqMkdOhEHJRuaXTN5Bg4B
         OO5e1ymzGnT1plEqbmmyIR/X/zqlG1Cr+pWa2eBhMXWp5efoHLPPNmVOVMxvP2NDs1Rq
         Jj/A==
X-Forwarded-Encrypted: i=1; AFNElJ/LjV2C00edSPMyrU+ZrGIjZZ2TnpJe8wrkI3XQED+YoEdMIaMCyWZTMpKuYNqMKF+SmlQLVeACGGEmw3wBUgT+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95yQHAWzOkDbXGR46LfkxFOQHDGN5gfvg7wJ0B66chUckadCG
	OsZ4gCmR4z5bS7Yd5iQnjEAf2VwSJoudqw8oHk4j/hju+0uckoNc9bQGpBqiJAYRKdYisa+gmiT
	TIzzp9QlzGeQCqQYLP92gN8eLWCTLnxkIL1HrsXiD6KKOrVZLP7x+cToE6Z/ClbZWnPH6kDEGHd
	jp7w==
X-Gm-Gg: Acq92OHbwwZdJjG1ZdunChs9RC8c9O6IDg8faP6bi+69QjPcWARDpKpXeOLPJwVAzy+
	mWhF7zoENbN33QPMjhYMKoSo3Cj2iOmYvjp4uvoio6lE4iACQtknZ1wfPF9KPstDbZVQ1XctQNk
	HmwS5RylTwW7Ozs95FEoXVmD1r3PLBWxlf/uB54I6bH4bBx869ntIqe7ZAP4Ujyd8OU9PLpfmgO
	EGvG7n91OaV4VWWu27PwbySpR65b5pccmV1Ka6BJUANs48vc/4HKpSG5hFfG0Mny/UWdEopOT1y
	eUgy8XUkE3RcuuhZ3bJHracHM7hISP8Gg9reMjhkzUjtz90OPWglPVIr2s5qGiRVMWg5caShja7
	cnlBHJFVCc71BsEXfd1AqakqRfDPnSGC60yGaBemh+cWEFyHm+Wxz
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907981a91.16.1781507566650;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907946a91.16.1781507566199;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:12 +0530
Subject: [PATCH v3 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-1-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=f6wJE4CawInMX9KIDvKJViD6Wlt5Tb8NHLZYnQ3WetCaKjTUaanZjZR6mQRiCRIVFywgsCQa2
 swTrlMBOBRpDRRcvKXIC37+gh3lI9mSmlKbAJyP4d8IYj/e0sooWdzj
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX3ukTpfiw5I2b
 ZZ/SMVYBFdIlZ8RQg5BCOu6mA0Smrc40qtzknpDrNiw2Bkg/dA+jiITgc0aPjtkiUCETpqFxfKA
 HBYWT7AH7B9J90H95OgbwfI9EPrtbKI=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa5ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wSENcmGjK7Z5pOTKvZ78WNf1qVuA48Vm
X-Proofpoint-ORIG-GUID: wSENcmGjK7Z5pOTKvZ78WNf1qVuA48Vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX1pii08dRb4yu
 rOBX33ZpiNGVMo2jhIjzCiGZ2f9BpCGhAYgtKzb8Ax0fVnJ9ILyBdOjsucFotSJKGQTcD08nB00
 VSOPGVN+S7Plo72vh9T6oA+JoIVi2Szt74Hql7ECdlhsy6qrohAKB03QhyoZNqGAX94yH8mBJ5o
 l4jGMU5Ry+F5flFo1h23CHRMfMtOUW14NGZa6KB6sWgRiihXUibClpJnKQ6Qq16DdEsw45O5BVw
 apC5ReojMojWG7tdfRwBYSv+ZzQ73tBpa8U6r6d2YZX6M5EROYcmTaIqxcIHA0RIEwgN5EmKIsa
 PvltEknKp6jmgzJCj+4Q0pyxjIoXosmLGCsTkN+hrGmEwLYvI7sIvcbmUnkEU8zl40Tv774t813
 WynEjWQIcA9+ZzbErBsJ3bMXS1+l2322V6zfXzH3dwzvQLvkdwQ3ll2hD2H+tYJCL3AxTQu5HLb
 p2dgG8hTZWfcgkGE39w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001248_678615_0767DAAF 
X-CRM114-Status: GOOD (  12.79  )
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


