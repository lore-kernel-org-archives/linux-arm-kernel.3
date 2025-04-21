Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=1fF2oNc6wCOy0RVT1xnzolB3mV
	p1oYgzm9gcXBVvrNce3iITgmBDDoYmBQeKGXjERosSi2Dnq/gzgIiV0Z7t9/RXus0t6eLWgVFnTeX
	/cDYoinlO0QkKoP2I7G8kBDy3QqhmEu/2MaC/x2IE/BdbSqY4dRx3EG5BPzvxi8o/EI5vhNoomxr/
	dTdbni6BMi3hOY0mPXly6D70JQ8r4dFjqMeZUNj/NobcMaQxHqTlSMB0UhVoABmqT+5O1YZZ2uXPZ
	25wp7JAdBNwrXhhPJrQQZdgg6sEKESNFv/Yey++Os1KrzlqeteVcWRvQIQYzDr/JvQi0nTpe8r6va
	21NNfsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ziz-00000005LZx-2it0;
	Mon, 21 Apr 2025 22:34:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zC2-00000005GiT-3a0B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK45am005757
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=nq1x+XVipYtvqB3h
	gZ27ZxD3jPt40Swy7B2SBpIwfKJTLNJh4YSg8dUCt63Hv+BkWpq+9FGVqxB+uvvI
	HC4H6B/vNKDOazTkgko0uXWTKiXfALHq19cEhhhVss8FlJKcxCxoH1LB77zf/l48
	7YUD34nf9uQyupf5k5HjfP0+B4UbtFONYLvasdl8Bd2rxzbbNL936+nTUZp2leeK
	jX2MwH0PEj+Y/AtUy0UQMMMjTh5s75UB6ZqSWccgsBHQprnTZD2daAIteVqQ1d6L
	5UjUlFfezrpUnHvlRA8eozGrYUw/ZvORaDSsMmjt3NVhWSSvTU5a7ygeC2Bw9GhS
	HIe98Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9der9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b5f9279cso3664002b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272829; x=1745877629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=Oy3HH7KaftduFRFR9CCI9B0ihGeJv+s9AAmnQNuTTV1fXIrJp8SNcM9qtFWfthNxZb
         i9nLZYuOWAdrBLhATWCcpikYCB06hCFjKNuaCdU1FrxWiahvTwcKad9d50qLGo4inY1s
         6k6SkAWEe7OOQk6YN6t7LsVyw1T1JICf87HlRG1Um3lWkzCBs30nuZsmVCwWYwqfa4WG
         iGhAIt3I1VWpcsYHIJgNiSUPCyB69/P70dVVCR+GTBDa58tQgWxdkozYFRGqSmolWl2U
         YxLQutBnqr8poJ0vMpHrJToQgcMv+Bh0EV7waHlwZiFKfWvxL3DQA705qXReKM6JY21R
         VeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxHSJSneHbwH159TjU/H5wD/2hsfeWZR/B4S4bHEEurZIoIO4hpGeuaeMCj15XOpG+97+qaN9lrgR6aU4/EiHY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdl5efUtuLLqvAQ1p+9kdqD5uDDw07IYvRJkZLjBRVByBrPGZP
	aEsQ76fjYx+H0XjMGDyOt3yiORTcaoL6ZOUCOaeF13VktGx+5KwZ3K5hQqsh6y7KB4DwY12aREC
	ybmbR0ixQK1yNlED6sVNIOKPKnKx5ZHMHNQYYzOMxGYJOKJFPHf9MXRtyr23xDEIQ1hEtmgfkww
	==
X-Gm-Gg: ASbGnct8KOwUWwxWVgwKxhtQucbuF0lJ/nlo9e1hEREyfBJQLz0HZgfc+MJ2nvQW7gm
	4+xbey+Z7TfxMH7kDJkpiaXidgxbd5RYnqawV3NRKtFdcuXgerN3eQWHVAFrFythRjiQd+t7VZO
	eryoiEl9WojW+5bqJ+Go6UwVv+ALvsQfaxOjlVCaRrFjcAyNgITz87bdKthXDjPV2q5QwQbsS8b
	ssrBbQIpmejM/9WyFgEZ4QVVpDUMC2BZTM1Clfhq7mKGql42bifEOcgk59m64FwxejB/7gWsr9Q
	9ifLQnRd9lWGHd8L/xJyAj44uvEd7Ang6bTnlbXnEXLTiM4GQ70idkMLTz8cnIbEFJE=
X-Received: by 2002:a05:6a00:130e:b0:736:b402:533a with SMTP id d2e1a72fcca58-73dc14453bcmr16346765b3a.1.1745272828425;
        Mon, 21 Apr 2025 15:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG+M2qcme5yQCukoxMyaSAlmWYa2RdZuaZWi1bkdOq29qfFC4FEiaqTX/rJnAHa5HEtbsGtw==
X-Received: by 2002:a05:6a00:130e:b0:736:b402:533a with SMTP id d2e1a72fcca58-73dc14453bcmr16346700b3a.1.1745272827980;
        Mon, 21 Apr 2025 15:00:27 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:27 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:08 -0700
Subject: [PATCH v5 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-1-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=iztD2zVXDUPlkb2VzvABWkpEGUouCg6l0hBj4efv6tvZx/fXQq/d3jg4tWzRkC+RxycYWKOM6
 WUgksta4vSgD83ZiGs3JU+XpGlgYcvc1K97If3KS7uVnVzanamXocRx
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=6806c00d cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4n75atB6gt-f73wbWcl72U_8TiMa07P_
X-Proofpoint-GUID: 4n75atB6gt-f73wbWcl72U_8TiMa07P_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=935 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150047_090227_E8CFF29A 
X-CRM114-Status: GOOD (  13.35  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1


