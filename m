Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5D2C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp0sIwX7E2EAhi05BS45TpvyiGPx7g9xheU+qhe+MUs=; b=cyG5fFOnSd3LlkyWAdALwaAjj2
	rtsiyvweOQ11w90AfmKltVYZZZdW50KHoCSVmY6WZP+q2MNZXzmiGzKmTbjH74/lhPg65u+2CI7TY
	tWAqpXJ/vb5LbrFxlc3CLOCw7gtEcnU4ILBcPlMrKQD9aMHOehL1WX/mpmzGl61tRoYmjjGILr9bk
	oPDNsnMwpcyVhUUrxA96FeuUq5NzogzorTxtdpskFLST72u7j0EThJRnmbUS69h1ICSF4AiYl8sFC
	oC/8emIbbdA7WPFYY5D/rwEZSLfYjjabIxjpwgZLXpZu0oQkQp3h+7VpOS1FKufY6XDjCvLbMuusd
	t17u9pqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0Vl-00000005FpR-2mhn;
	Tue, 24 Jun 2025 10:04:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0Qw-00000005FHP-1jyL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:59:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8rFKs015342
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jp0sIwX7E2E
	Ahi05BS45TpvyiGPx7g9xheU+qhe+MUs=; b=MnYkF6IsBN1ogjUE2DwiLZi0W9T
	RDqnLBoUN8cMX6Gszw5g7XjNWHH1HcyFAn46vAjaHPGRTnmQPJeyoYTGe7lvXp9N
	b+m2mX5rsTdwUPF/wJC3erh6rjuMOogVSuHhFoGCtg1AhgjDrNnXV5lsyr75xCs6
	MbtY/9+XD0uZUn9Ytaa/nMgjPsn1GWiLrCsd9xxngAck7SH7dKkBBudl7mJeBpqN
	VyMrof+Pmz/o5pPpZPIrCshq+dZWeSYMshvxKeqHeghf8L/spne0mCb8AatZqMIb
	u9Nmi0rVah+ee1NJAIURZJyrljL6R7ThUhri9jL9XGUvFQD1NXyfgY/0Orw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqj43m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:59:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7494999de28so480413b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759156; x=1751363956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp0sIwX7E2EAhi05BS45TpvyiGPx7g9xheU+qhe+MUs=;
        b=hOEfr/L4kgoDJ1V6NwDh9WUvfwHHLo2z8M550nfIDdRDJMDm7m3qd/FWiws4KLqQbK
         7EKIJO0Tzkwz6zjfD6UW8sXb2zI39xGfpNDGttYsnTJsO2Og/uRqbsQxbj4bOjCb699b
         5GaMir8upsWCuYWdoDtWJwGiF9CsxE5nTwvVsZrGITJq2AUmIyZBVQ5biMUJfSqoml6A
         1YN7sTgGsuGISxGAjEawo6Y+2sRL1C98SoF4yviFvwwn/H9rNd2Tnyw/hsgBWOZqXDM8
         8CojFQXEho8xbitx3KSBuh3PkL1a895jlX62vJ12qSoIhn0Fgva8jyb3mqF/8JkDD17D
         g4ug==
X-Forwarded-Encrypted: i=1; AJvYcCUlA5ysgO0W1HCOl5Zml+nADTE8aMF8KYsCUg3UIYd6QL8qLw7MF2ZqWPcETJIKWx+PTPR/oyHIG72u/6VhGrZB@lists.infradead.org
X-Gm-Message-State: AOJu0YwpabpH4N2997H8sfxzH1UoWoknAXWP2AXn8jnEibYB9jhhlAAd
	JOQobcV/C8cyIYzbu2+U/jFYKACxP9P3/sy+x3sazDBe3DKEmla5ej1vgpvSO4LsQHvsaWCbZqp
	P1UoaVLEvg2vtkQyvP8Lr0Z3Obx/O0am49UMq2RueYMepY08AqJCY700MVSP1xBW5vfoAJAOCZ6
	/ymA==
X-Gm-Gg: ASbGncugUIwF5YeCfCSfHrx55sPEy+lqE/6xvtr5MH95wC48hwa39T+5LrrcjoEPhYN
	W0CtFcdtCsoFUSRRK2Hcutt75niCtzECv8I9LUHkeYSwRwFVPvvJiBLT1YD5ZJfCbybdF8MWonc
	SKN0+r/fIRL7pfJRdDODIcIC3/EIkqqYx73JPrpp5I6N/XKEYlOFwO9ZeoVzN1vecGfRVigHXlf
	Gio77x0RuIoCDfCYpEf7lZ+cmnYSVry9JpvxOiTDQZGotlzTc0Cg15k3G+ZhO/tcrjXmBCo1HJZ
	PuU0U8yI9oFunChukWoTEvlYDbYugpTdj7SUKhVQIwIln71bkrCoEApO+pbtQW66m0W/bTqOpbB
	UBg==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr21503566b3a.13.1750759156373;
        Tue, 24 Jun 2025 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBdcW94g6W6ZO1JsBLmEcLZoxaG/MEDeLrVmYb/zbIdyWpPel//mQz4saWpm6SU1788XX+XA==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr21503538b3a.13.1750759155985;
        Tue, 24 Jun 2025 02:59:15 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:15 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for QCS8300
Date: Tue, 24 Jun 2025 17:59:04 +0800
Message-Id: <20250624095905.7609-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cK0Zpzm7FZaiufO5c2CHqNAddvGSJ6Tf
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a76f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=T1NhNMajUKWQjJ4YovQA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cK0Zpzm7FZaiufO5c2CHqNAddvGSJ6Tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfX5HFSnhiPDAeK
 F1AsibRn3iMMuSiMZZLNWdSsBYUFg3YeLCRPTsK0N2kvviqa0+tUNx7+vlLJVjuuauh4bji2T+T
 Uo9UfhMgfb7x/Do78NxFvlZoNYTJtxk4Jh3TAvaj95XhW1ZGkM3B/56OTiYkL9qfiF7BJjoASHr
 l2STQOxEIcOU1gLBrJUh6gwRVh4f5+4wAtHhxW5hikyDDGPGw7AbG8ADtS9GQ20/UypoBx9oSdb
 +7hiUIxiU3AL8CTZlEE/baKMixhJBmIGodNmjVwiI1EU7eWMyOTCCCayB/NtHVTXZ4HBcqGpufN
 bnXhwNwPAOsnImDgd47Y/yk6niwe11U4VPdkKGJtUHiPN/vV0KvsE3W8SBWR0a1vB8CW6IGEDud
 MC0GY+sJ09sDdwkM58Upk+VgSP7Tk0okFH4JtUp7FTNZ4byU+hZaJBB2SIHUxTjWzKLmTWcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_025918_573597_071DD4E2 
X-CRM114-Status: GOOD (  12.72  )
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

The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..7f3aa503da53 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1
-- 
2.34.1


