Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DC3C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=; b=EleJR1P7IOTK/2De1Qa/sx/Zwc
	Lp882ycvfmWiJmMYkH9+n1LE3S9gaisquELOpg86Dx/7JNbj4GZ5rdj/kTEVPNhmy5XvzHY2M0HXT
	lLWx7V4DAQUNSxz01K5UQzqOmMKxtk0b8ieNw7AH1ikBKmaacLJyN2BfLuLAdq9g2CGYDMZQz3hAa
	whxAWlFk4HVGVFhgqYV9pwn/2NXumUtFar57GQieSjG+31tt4vwsJj++lKdIKSg5GoQsdrQO6bLYK
	v9TtY0DtxofZXoGq1Q8oU8tJJkGV4DVtFfLnNWH5YHl/edZf31/0fSkTtBq71dnK1gZo5smzU2UBi
	+awXygNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1r6-0000000BbZs-48YP;
	Tue, 27 May 2025 21:29:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1U0-0000000BYzR-03LA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:05:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJkw2n022962
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=; b=eFOUBIeAvN/dWFCq
	xOi2G013rlZ7UNJ9SVpmPsTDwPGAB0oEuAjvAfGdvYksbrdY0symWV4SsdCUOsvr
	H5m77PaAXjMPVVVdCT9P3/+YHl8oK9cv1yc7qN690fZPZXzsLObszn5SD3YFxVpb
	nsJ6boRRZavZhS8IKbberwTGTRdwJqN0P9P2MJiWDKgdSIlh4kro4o67+Cydu+Cl
	YA4eIzQHP/iwFdzCEDtfnZHghqC0g1ri76po2htmvubU5wzX8UV4jdokohDGlsNs
	M4HGeox6sJpySVWdUqXm3ocOEI96B+VrtD5xDV0fycJ/NciETksjai7aCIAzwQIq
	v0TNbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvpxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742a969a4d0so3016859b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379910; x=1748984710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=;
        b=LlZSrzgjpQJx7B+BsnZ0QDRFVebymRFxT33wwdlVub6gmILZoTgwe/iO3VmFbQplTN
         AecHDSSTYmKKeTEnHFGWhcB6oMKiyyzG6EXdUZcgsZSsxB400lZvmovmGxXG5PlKMLAB
         me0czY79N+u1VtXT1UUrIRd6kjSjzH0+LwMWIkld5baHogz7rEIoXffLEaD5AiG9YXZ6
         1QBDbhzWuF+EUZwgFuDm3gZWSVVC29bYrHa/0CUfz7sPjXA5hvpTMtZN764Ios4ua/KD
         dPdCmlyoRDNZ75l+QiOnQYF9a6c4LD1HHJUYS23+EQHI7s6XFn8UaXyXNdVcxCkCiLD3
         mcaA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Pl3hp3FPMd1lGAl+rKYyyj/R+F3JR96xTrEfLEt8qMZAJlyLj4gOi5ExNbSIy2q8T51Dte0r3GIQZ3bRmW+M@lists.infradead.org
X-Gm-Message-State: AOJu0YzvNQeYNgT5z/jU9V7XgT402CT/Ha3fffDqc51oQeK8NTiTkhXa
	tB4v4cUCA9u1BAtQcVQ4SX3FAS+wHSBl8qpbdJeVWw9o9a5Zoy77MwZgVynZxsJgQIBo+okPcjR
	jABYEkdFTBEJlh88Tnv61U/M75NPde82d8LfwwMsftil6CYCT29OOCPMKbkyCH1G5LdTAqYxsUY
	dOGXm+nlzv/A==
X-Gm-Gg: ASbGnct7tB/2YRXtY8Q8kiyIuIIcj1S7h9C1HkcxBikWIyFnowpTmVGmCeHVjgt6Exm
	+sb6ccgbQV5QXvA8hVAccCvPalmMy3xm18922YS2yc9sPROjW1vT9z+Ek3NUWEs4Co1l4Gu5w34
	5GeyuzswOufSVZ0HJ4ihPV/FOkkEheBF9MXKBdY8keug20UE1Tp2HHHcnKSSM2mj2lCfsThwj06
	S1g6IGfTfcxX9Ztd/NsLBs+P3Lj/4h6bPH2azM8tzP3LcwC6jIoPkJWGohxveFDbH2O4XLJgBYG
	MNmzjqm3G+UriohJ0GcpQ5TXxg9RqofgwdEoTLzE2UTJ2VVuPWpdZdk3GqqWgbTngW0=
X-Received: by 2002:a05:6a00:a96:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-745fdac80demr20724862b3a.0.1748379909728;
        Tue, 27 May 2025 14:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE89XO/JDVl6rd3hud7F4tMJEpNAb1237KFGDPWMLXu7CEJYly3v5ShxkxUVfmWpgn+xSWY/Q==
X-Received: by 2002:a05:6a00:a96:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-745fdac80demr20724807b3a.0.1748379909299;
        Tue, 27 May 2025 14:05:09 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:08 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:46 -0700
Subject: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=926;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=wCdzpXsKw8zqQyaRyA8EfWIj8Ra4i9wLlBGWl4/WARQ=;
 b=JUlbr6mF6I6cr5T9ZHdAGEijiVb5Mu+5V1BZNQUxXDHvq3yjKg+SamgDa52qed7t8bmWdrkdW
 42TjvtABTDkAncpbXnX/wXXb06bSMRhHbxRyyU16AIFkDNCwCzClSUq
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: 2wTWMkUnuw4OB_41riCUyxOu6jlOTnRX
X-Proofpoint-GUID: 2wTWMkUnuw4OB_41riCUyxOu6jlOTnRX
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68362907 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yCBuECYR7Rf6QDnvud8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfX3ryikEETdQ4/
 Bj4/YKHTWswxDxfkNPL8v4CNpdZKvcF8N4qBdPqqc7J9TSzGQsj6lRgjBJ4SFnx+/r+vYvBTprc
 ubo6qqOKlMNUOJqiwOJCCm3zFBUfwpDtO01wBzH/UzURsqEd66h5WV2zwNoroeA+/dMfbhDYsZZ
 pSYF58Su3nyO4vBMWL2kvHHzQ+zoF8/eizfWSnIb5gKHZ0fKEx6Tmx9zx+/Jbx5FftJ4pTcXP1K
 OP6fd5aCxPY3V7Br478XpUddg8oibdVc2OzeCuBLPOwfx756GjIqp3n8/l9R+eV3EhYEL+5trFF
 YWToO2bwP3Vs+v/uWRyyJ2q0XlTIuswchEns57U8TwtOb7ImJjxDwuMwqfTsjO/mkvh87NIdoon
 Ax2lBiGHV8fPk7FaZX9lXcU4XM2tctOrDshTazDZ7DNwgl/GNzenkejpscFKiPlORKrPFQih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=586 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140512_164773_E721DD3E 
X-CRM114-Status: GOOD (  12.39  )
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

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1


