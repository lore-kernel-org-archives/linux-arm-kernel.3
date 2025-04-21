Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF69C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=; b=y5CuoaTv8R7QwTQx5f+vGfErJU
	2gV09kHjzMszedcbtEITgtMhTq5SL1LXRSor0l8gcaU8illxAnmJkloTOWJnJL4pJ9+36pfMLU83z
	V8pwiKR63OO8PxNT7rIDnE3vz7DjU4maXgeFAWRjzJ3rOdvr++jRcSdWCdC+9tcko/aJHOw/bZzLq
	Zpjs9IqWgg6pwvWQmTu8Dsl/jw0c2FgI033LyfKGQoq6r92aFLk8zIHJKU4gF0XIXe5HXvsdKZAA9
	ByYtDsYg2twGs6inDkHJyOjTqsZMwGLtJGt0nmWEAKX/ODfQxlZ6BU8g1e2L48F/mdTRnQB0kWgK2
	BZ9GfUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zbf-00000005KW9-3Zo7;
	Mon, 21 Apr 2025 22:27:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zC0-00000005Gfm-44uG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3njb009384
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=; b=inqe26SMWzgk+olk
	8pb1BlcpihFC1gP192aJ1bTHekvehUB5atwg8oPVJHx45bycmq//3/05qtgYt5sj
	sqod74pnbPzZnGqQ1Tu4++7hglC9JaEi9Ncda4LPdGgPlqFdutsa+wPr3ZHOVg4z
	UGJRPhvg1xDpvhmoFIr4uOLPr5SicmhxxC2SZmFSpkkygV3f3hoQFrWOlVLGBxhY
	EzYTExkAYKDc4EGCku7UPeBBcA6zKdZ2iebVNVcSZKSF2ol/zr1nWSruq5/hzlDi
	DHsX3HNQT1D6RMTi3yV4mm8JctTtOEDEBnVq68g67O1H8MpHp08wp0yCOxrC9z9h
	z+OTvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1dcas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso1453579b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272842; x=1745877642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=;
        b=efITNHKkWUeCSuZWstVLkdJFXXOh7sew3vRYPNP0gaVLF4RWY1tEfzB6tPuOAO15Bs
         cxCoY/IRv8ZbpgVG6xMfl6Z+6uXfqJKxDqXK19aNdeoMvuqCURgnDc48pcKO1EYgk+Oc
         hNS1CRMJlXl224NWxacdIhLN9vkARZDmameMrfHTUTp2Zyy4lpnEoVOHmi5z0DvvirDk
         PhZlSZHtYsQ1rmlOrzhJVSVM4K4pkQIv3Mh63KKripqNED6AS47VzRVz1LvPsX4dzx0d
         oXFuT5/MKsgHbtZkhs+RsS7uTieY24hG/BhyjCjQzxpeTyBgXI3SZF4PG08urn1GlKgy
         A7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWOfapyOhiRLt4SI7OxiHC4/vf8PoMhnCSomPqSMAhcVE/1/gDUKxwEyo5u9DWycsbCkBxwck5Apu9+4L2q03H8@lists.infradead.org
X-Gm-Message-State: AOJu0YwnXPDykK549iHLmkV8yWny+u1/iz68wxQDexPzPtcnytyT0ugX
	ekXOTTx83/h5ppR/e4aGhN2tTnympDXfQejv9WuFlz3DmoShgRNVNiquPLRS2UUWxyUzj31Ynb0
	72mEe+3a0blgZpRMGW/fL7aqyZEcdE8tM1wcIl8sIf4xsZvhemPy2LGjo68AncFb9EGwSVOKvuQ
	==
X-Gm-Gg: ASbGnctAwj8/Ef/YNoOuIwT0+rGcXke/gHSIHFoVRtgf6nD2nz+sVhfy6vqIe5QPjJi
	IJw/cA0sr7NQYQgpmSP/x7XQ4R5A1REeMqIy7pov8YkTEER+JoRTvcM0HNpiI5siW3o9fI3lf8I
	QgJHR5wCeaT4N6Y3wDnqOQnURJdUC1qY9V7fFJAs5i7Y+YvB1O/TIzFPJGKVkG+F9ghAx0+67hA
	v4B6FSdk/cvPQxExdiOcM4l+HrLRnWHmSGWio5aLHtPhUNWVNpQI11f0YaXFCQbovSbXCrXmL2j
	3R1QXt37lOauXQeD2GZpA50bPYMSRxaVwwc9DWfIdafKwPWgEcI9Q/wQscCVL6pQz9c=
X-Received: by 2002:a05:6a00:8d86:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73dc15f1a87mr18386209b3a.24.1745272842541;
        Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3LJ/nbFki9xpBGx4aK9cppDDFvMSSRS0eHYF1pJ6KN0f3/2PsOfl+A4A3toEqxCnFOpG7Lg==
X-Received: by 2002:a05:6a00:8d86:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73dc15f1a87mr18386147b3a.24.1745272842129;
        Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:17 -0700
Subject: [PATCH v5 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-10-25c79ed01d02@oss.qualcomm.com>
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
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=899;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=V+if1JLkseIXHxqMs/xUBPBndUeGFuwmXk5nZsv0vMk=;
 b=P2msdcQ+cRrE1nqqLOLNemRor9mB4mfi/qU6Jdv8heLzSYFu9kZh7yW0+lYDdXdjlRFRSNa0F
 7kXdxM9uxuXBejERREp0R9xpV0FE7WRSvokr6+5C9Oawzj9wlxiv9qg
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=6806c00c cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kAC1uNjDR6N9yz4uFL8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rbwxurtEePdxtwM87eMGp9phhO2eNkKc
X-Proofpoint-ORIG-GUID: rbwxurtEePdxtwM87eMGp9phhO2eNkKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=567 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150045_179280_E9DAF93C 
X-CRM114-Status: GOOD (  12.20  )
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

The SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
SM8750, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e258908811be082f678099ed2cf4c..f0ab5ba8df045bbcbab16ab736342f3d261f4297 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1575,6 +1575,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1


