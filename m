Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F79CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=; b=3sbo3bN/sPI2vwmnVd9LvjVs5l
	QsyV+A6ReRVyiGh5qL+aga7wnwI6XEGVrR58kVPpm6MRZgeTBJ+oBpZnXoKG1Ch1Zggul4pFbD+KM
	/HPXt/fskjT1l/Pz6nwk6E/f9UR8wiaAoxwj60FA3PxYlXWzB99JYqpLDyskXCHxd2rSZUi8/bc0m
	TITiHyRshbeyWKjdnJBFqg2zwA5tnm32KKyTw3X4GpKT+fYMoKSMwMpTeEdmY69g7UTpf/sN79sSP
	HvTkmFZ+HTNHvPJ2uJ299hqIiDn9Hwng2X2NB4xylE5WbYwv39uoGBwlibVqNuwcEJ3SmrUeAe+si
	dMJeo6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGG6-00000009an8-0kOt;
	Tue, 19 Aug 2025 06:55:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFy0-00000009YPs-2Sqv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:37:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INmq8b007382
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=; b=bJMZZ1+VRZp2ZgcF
	/LByZH8rEzTSngp8mNSOikSd3O0NTWP7wfWanZc2E9c3jy1om2eHJZJMrGxuYtXr
	YuN+iMeXcG9uIFswqVYqlkvUZexSZtAr/1lJncV3FXMYGGZiXgC/EPnOj7UgUjYs
	UmYMsxEoNTHDO8Ubt6ON0jz14hZSypcKSoqg8XPRRR/LiEN8/mMTXzcZuPmkwxaD
	aCC/9TJ3DVSsBwAoyfpEWXce3PVxGOdqTzjSsB+W+B8qWV9GZGNE3RQStYNQsB9d
	P1GlXir6ATskn+L59jkb9WfCjNZ+cULABOpqolm6r+CV8LqQ2So/6MIuH6OzRJdy
	iZrhpw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyfft2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:37:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471757dec5so8874813a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585426; x=1756190226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=;
        b=FV4WTfO0XuR2e3w4WZqnJOe3Y3ry9G7cmG5n73uCnM/2yjm0qeYALR16OmahqMaT45
         jnY6dGyBfOX5loHEVqKBxUx9rb95o68rdinxSFZaa6mVUizofwfQgzXBgARVAV8Je5DP
         IvTaJ4FheWZ/tyTfLfmbX+ps3oqJcHVJRE2i9A6UvkMnLApWSPGtCyQqtlt9TvQz+dpk
         t7heh2A5B9Ye1oRvrxc89B2hS6djPAFXmJoqN9sXkuFzd6hGQuQlNxqnsYS2+vxH6ZdR
         +kMnW67XCBmmfRmB1/8BE23bQU9AmZeq6kF6MJmQ9V+xkkLrkQmanlEYm85AFxREhrZr
         TmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdLrc+DXA+DRm3MHkpN547z8zVNFy1lyrF7kKwCP/wmFL0UWNODVdSf5KCkxBeJ9mv6fS6of9nNf4jBD6i61vD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4woH5o1goFyfgOV+wS0MIA+5XoosBpuJ9QQHOlrXiqnLsTu0
	0BG/e9GteTkoAVcv4GFyEAmPFUKWOUHNvZU0aR/QvFm2Z+vA3PJ5IgswBvjVywTzplQiVyYGeKT
	5lUw5RJY3CoouWE0kx3d0jyDjN8NXOmrLdIMO0FsHv52+7G5vtnlMTQDDVkz0dQ+0rcftK18AxQ
	eXkA==
X-Gm-Gg: ASbGncssQelS6OE2S/+wmFr87/OGbnM1aNQtfv3t4r/KTIa3bqyjrCw2pdP6DY/hagE
	YkrgLb7yoldj2Dx94n9FFPGTE60KJ+1cfxr3ht/XZyJWQ7nDh5nnK+BxQ6x+PYm6/l3G/8gXNDa
	1hEiqeOBjBolZRiPgjzW5jV3NQJeXXqCdlOqinJMDv9S5amTuqmtLb6VuqNyJtZyZ+qnMd86oJx
	DL70Eg49R8wTIVCoU+4ISIu2usBa3QFtOL9ihy41fEERVVQl/kElakygWExOicg9MnCqAQHjXCm
	pSAYf0R3MDpgpyp9NtZ3FiCKG1k52X4Hrg9c49T9bMOvqhbUX3/wlKkuhjJOgBk3BRUsT/LcNSs
	E1DczGj5DW/rNZLAF9n9x63Kg9Wkjxwd/Ng==
X-Received: by 2002:a17:903:2acd:b0:23f:dc73:7798 with SMTP id d9443c01a7336-245e02aa607mr18391455ad.6.1755585426461;
        Mon, 18 Aug 2025 23:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEazJmFdGaBIAHWXLR4lCSydXu9MeqjV3bEY6sPcOpXqB1mWNgIGjkbWAfT3wdTKq1teGvRyA==
X-Received: by 2002:a17:903:2acd:b0:23f:dc73:7798 with SMTP id d9443c01a7336-245e02aa607mr18391265ad.6.1755585426036;
        Mon, 18 Aug 2025 23:37:06 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:37:05 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:36:00 +0800
Subject: [PATCH v4 5/6] arm64: dts: qcom: qcs404: Inverse phy-mode for
 EVB-4000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-5-5050ed3402cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=972;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=VJbvSPzR7nYekRfOxydBQiO6Zxq0O3MtfapiK80ggjo=;
 b=caBB0fwY7GcFvoMDwpRbiG5mbkhc6TVqdTkdOaZN/liBSLS7pCblke/P68n8ZiPuYBVZRQN/f
 BsIYbowh9CUBMJa+bW1NgLEsQ7AKwPN5rzk5oXw7hs1C185gDkhyaDe
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: PFRQr-kXVP55Cqeyrcuo5SAEpOiqeFI8
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a41b93 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=78Yoz-F5aJHhz6vTWxYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: PFRQr-kXVP55Cqeyrcuo5SAEpOiqeFI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX5aa1rHT+PIIb
 WlzAAMSE69amKivir0jE0TBPLaIvxgIJoeGlwk+Ir46V2Ilwb+SfeBlLilOmPCJaQ6823ctMops
 JFMPydZJD7GrUDdoh3k0gKxtUD6AaMwowtUnce/8PFE59MCrYBi8PGhYbTe0V7m/hjCH7D9muFE
 fXyVwbrHP+exeKle26EBvsAjX80B+MsQA1Uv2X0N3rkiRVFOv64kPh9a6r9pxUCOmSIP4GRC9/k
 PvtWbESZwaf57mZGKu2kJNNeiLnDh9UrfFP/18yn7F/IrQg9YOtFcOIrNhiy1WeoEy+zvQSp6/y
 xJ+QVACNfg/nRimaRJKiVdHAHk4XJJiBQs8WsA4nRUWf7VZrKyeWOimDP94n2p++covPjzhiC46
 7ku/QJ32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233708_748130_3B81208A 
X-CRM114-Status: GOOD (  15.39  )
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
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 358827c2fbd3..a3e67e83f69f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -25,7 +25,7 @@ &ethernet {
 	pinctrl-0 = <&ethernet_defaults>;
 
 	phy-handle = <&phy1>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.34.1


