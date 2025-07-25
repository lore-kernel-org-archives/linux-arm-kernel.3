Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A5FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKWmqQzdMPqFddVCcAzQVRWG47+T57+MG8ITHFHowHo=; b=J8qAdND1kkdRFGGWmfuNFSDqWj
	/pbT3KmI+dPLrIocck+pvMRZsMmISpycT/RoAWoRzw3w23DPed5HK737KRLZZHLYG1REsM7APhYWv
	MDs7vD7Ona32YncJAcV47sGbk1KanE1qgxXyX0hgpLWtr7bOrw5PqoQZ/eF8auYpADVzsY6SvKT+R
	aQGt/gaAB7Czanrd8ndmpfX/O4s+dMFUlexhSFQPdVzty84rgVRvqNYe4kkDEfkPv88GWCF7e19Uk
	O0DxEYLxzs6Cx5hH7SlI3EZydsleICSgnuX22WXFfrssqW2MvjZIk/tKdiHjJcNGu9Lb+dQC9VHGs
	FSQbxdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGH9-00000009fg5-3YNC;
	Fri, 25 Jul 2025 11:07:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFMK-00000009XLw-3WgW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:09:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9F1UN019512
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWmqQzdMPq
	FddVCcAzQVRWG47+T57+MG8ITHFHowHo=; b=E0wVWMqqwSs+37BgbCMx2GYgHY8
	s0mrSrqQwMl0bYaGZ9i0NFqJ9gJgVqs/jMajTvLlLySGl0O678VBmOnLzNDMpzJR
	qeZjqlmO2+1ZFVcVaDg89YoelX96dJ7A9P7MpaWVdI42AHnRlHMMVtgkDmbqnKAr
	FU14+Uxt7JHjMCY8pVSZOq5EyEh2V7ixw/OBkgHnkb5nhPNf8C6sXzAo8W/OcGBH
	ZCdQyv4xvoKG6i5xTvxipRt602EbplRuyyHRkLV3XpV2+9ZqmKyQpjk5q25QRZIO
	i2Z7JPL8CN+iIval3G0F9rdF/WxbID53eECxwxz+7Bn9Ey1hPRJVNPK9dWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2whpnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349498f00eso27776245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438139; x=1754042939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKWmqQzdMPqFddVCcAzQVRWG47+T57+MG8ITHFHowHo=;
        b=TX54u+4ty68Cw3JOA3OtjjXaR8DNShYAdXzIjRD/IckxIRrTXbCj1+V9sEri3XbsxU
         cVfUjYtDDSQmgpFwVU2TTRxllJNlSekfOj/nXQ9qRu/6NSTv/TslWXXQnCkWOBLFzGr1
         6Cuxyt2mIJn732G0dA5fCIFGNO98h4uHpaRtox/0RAViKNnymk6eK2SaGheBTwwzKZuy
         1ukmnCre5ULwnklQpuRFg2jc63F/5GibhUoRCaZYWCPF0qjEVCjv9us1nK2YXF4nJKN/
         0gJcKRTKFPEfwUJW3YIy1+R8LwKqaqvdyM2F3OnLVJNq4y+X4a5sNlCbHTbnV8bPdl6e
         B+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3kjLvqDMUoGgZCDWEDglmfVv0Fi/oOTf65mDoCAue8L85YcvPqF/HSpXvpVYX6OtGo70N4gUpkAv7xbeFEmcW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8+8z46lgbooCD1dKoENPHEp2iyilzGdJLTztIcaVKI3CAtGus
	AuPw+DjdWPu1zdTvlniiQOaVYRF7LHlN0HkOKgM5qzSWQKwSb8TgZmrzTYTAXvN99PilJgDfAIA
	RYeTYEAMzq1wlXVOUgyWTvstR9gtRmyZ7MaOI1I7eGtZsIB0xI6FIkXx9zp6cXGwsVdbAaCQU4o
	J5fA==
X-Gm-Gg: ASbGncvMFZwNh9b8dOgzDxM3R57N+KBF8iTGfW71bu5jdbaD+5UFdtFf4yiHfu6vSYf
	dfuLqGz+qHZeJycJyvs5HXVHNUG2ZN7ICZhIn7nT0UoGpMZ3j1vMm4DfXt6XsPTti60B02UJ3b+
	9lxnynpjZX2dNUTZowPKzL2eXx+KgsRR8MP/5jsvK35K8SmyIa74pjxlVPKtnerBI7XC3k1gLuT
	dp4sB1FFewwsW0AdO/IKNTcpCBQj/9z+/E6M4WSixji7tSq8sHD1uIzvt8pl2WVO6hl/babyG6c
	1Sa40/tpw3wVVTRnPxnKrLHddXBpp36ex22u7J7iaf4XjiTWkgSaTeFzPc+4lnNAJOy6j88CoJx
	QzOP5Ga1/MyxTGaA4ZWs=
X-Received: by 2002:a17:902:e887:b0:237:f757:9ad8 with SMTP id d9443c01a7336-23fa5cd3ac5mr77420505ad.1.1753438139135;
        Fri, 25 Jul 2025 03:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGOWyYvFuXyRYBG4B08FA0aT8mJsXIF3dBXE+GRdj5C2GCVY3bEFepxa0+JYY4aakya4DCUA==
X-Received: by 2002:a17:902:e887:b0:237:f757:9ad8 with SMTP id d9443c01a7336-23fa5cd3ac5mr77420045ad.1.1753438138713;
        Fri, 25 Jul 2025 03:08:58 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Fri, 25 Jul 2025 18:08:06 +0800
Message-Id: <20250725100806.1157-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9bpp3hweYfiDV83nbVgQifAGDsX7foGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NiBTYWx0ZWRfXzSZ7nbMRAFe7
 ibUTqKhnvHrLyjVu+NkkO6ZzADybXVkNFHpcT55lBb3Ut7e4k1rOcy5FgzJ8RKr78aBATBzEQw+
 ohOStuN/sknU2nRC91RM3wCJ24Je2Roy9N/gJ5AiyutAnmCsrJyOV317hUbsr0nmhI3i5rcohq+
 +kBvbSt3MKjkNTQxwAbrp5A1rQGfjQ4o6Zf38sAZHOy573s8cSlfqiVRV5CZPJmXHpULkh95Ewk
 tr/OXgPV7Lx+fklfP0V3lk0t/rhWcl0hgc1jKoUbj+PwW4PW1Gq2EuDdf34QGSvHagmNKjE1VMx
 uzW2orfI4wXv3K9qJlfaw/2zAXR6etXJyhtpWMO30in7fIXXu4JLSyHWYbfT/gdlyYwqsO0O1Xd
 C9A9Nas6305tUwe/q6e4LGHRM9ZKnrdjUo303ZFhrRT1DLIekkSp6jGVDVuoRDsuASWGTJwi
X-Authority-Analysis: v=2.4 cv=d8b1yQjE c=1 sm=1 tr=0 ts=688357bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9bpp3hweYfiDV83nbVgQifAGDsX7foGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=876 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030900_882104_39693F53 
X-CRM114-Status: GOOD (  12.80  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f5..4e6684a6d38e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


