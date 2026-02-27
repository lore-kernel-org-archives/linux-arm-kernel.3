Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B8BFD9E3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=; b=RAyOQB9OXpxyY7
	RIEL8voabSzVK96TYRJW01e8t4k36FATuh9WSW12fkaohNnyL8ZLIwuGO1R8TE6tXXbE64NMkAuLC
	YKwt2qW0SKrEUYzzI9EPzy0NmDeYvL94A5zOR0eM8qAat+UzflhMuTOAZrLh6JHcSZPglXvszSRK1
	Gs/krWtZkcQdmwv/58Us49+mnkNb8AIBwhg+WXVxGhnLvBtv/sBFFCU98saVic3N6qbTvMY1yefFT
	yJzxB7kEP3ksdX4ah4+n1Bgdxw0MhYuhPn071C7H7Hx405udvsPBvOyP7O5Ta+Ba2gX0PFEy7e3US
	3vA691XXaH5Xj5Ds4Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqQl-00000007iIv-11O2;
	Fri, 27 Feb 2026 05:30:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqQh-00000007iIK-488D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:30:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K5dc3747272
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 05:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HJn9ZHvf9FI4W4WNYfDcOy
	VsafvW7lubtQ2GHHlairk=; b=FKhh+pinY+/YaQp3ER/MfFUCP/d9wDyoa4o3+t
	zg7jxURdZQWse9Vx30RxhcxyxfNFsEmRlGTHEtU9tCAb/caI3OzeVoVjbg5cfFIa
	4IKiddnOk2b6oWfNy9lL/GM1j8+TJVr3NaLxrEaNLbQqYd6lx0WPvgXRcOd6c4as
	yThIwXt53MEBjl8rO52P5JHJ23adnPYJaDLMe2Tp+XlDqoLNJ7/DGtH6buxoq3Wc
	Gf5iqcq6jlXfsHzb0m8FJh15tjp+NmeKhum+c+kKYCiax1e/Cm+Rha/mYs5hi07q
	P1wcMECobaXiqHLYY6VIsUE+L1GwCOjJUyTmIg1SqIh8NUiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur1px6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 05:30:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5061d1ef1f3so225054751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170218; x=1772775018; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=gVnhhydVFlwLplIYDVfa11kKIzydrkKRNNJLbwQ5vIi6RatP4Av3cPpCKmliid0Pwt
         rmC/ChLER6EGP0k1ooez24WTMgG11nN4heWPS3/J4hxi5U8zjDuX+SOZAR7wS8tKcx/Q
         ghJeFMn5E/p0buKc/ZyYJGSshoQMvIJZUhG/PZdnLAE+AEfudeUuCAB3q8S/9ZW2zsqg
         HTpr51EynAMtAMiYVUkjjKfnBLPcQ2WYIdhDY5wdjk6xfwU4EQrr1PdHVb28/WSJtiKR
         fzrRHq1Y85/9r99mRktH+oqz4Z9N+hJZlRdPeUS41fsZ4XA3fgj9bIilskvVqSDm8ShD
         GrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170218; x=1772775018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=Iy7W1VlmhsuhvPiiFlc2Ucqc/ms/J1joxY9OIlK4UTvo4GUFUGih+7LsbODfWdDU/K
         vcp/jLv8gJaWotyHIW1Xrd9jOU3I0m3BsLRiD2dmJRcImGj3sAlFFYPmyYpWpttDDIMe
         TKquLk7TK+1+LKqzG0rU8PculSsyBRlXtxvyuQpOvXAk/KUGFXnkKJxLBvc4RiUNPwmf
         9hkGzl6tp1ckBug3RGCNP4gyIfpXgfDvFecMnxYFdXYF9bcRiqQwc403y17G5BMx+F0S
         NChYY7NVuIltMnOdar6mpsDIh0ttIQxV0pbW1QCdezmcWXiNLp3MnA7+nQ9bTHHN7VDq
         IWOw==
X-Forwarded-Encrypted: i=1; AJvYcCVIk/P8BhNsqfaodhOUrgHtdeKosXu7krWexePtbk75K4JgsaWqP0WP7hJffWgECobQypPb0XGLRKkH63DapP8c@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxj4mt9Juy/QwZhzKpZldDHSn/fthK7eQv/pTWx0d6kdFjbSrH
	51+12NX8Qdu+X/lehhZ4cg1lSmbCq/oClQm19BmITyQvwmcPIItVF/Pejk+r/BoYQh1JaF9v5La
	00vqRAMgfwouczrtVXnpiv3TzYKOFUyP+n+aENV4F2t/N4IGlyflK+QEbAwUPyWQ6C8bZJaBHkM
	yO9g==
X-Gm-Gg: ATEYQzwlD2FuKSDPhXlafNAte5eu/v1scuCaVNYJxSjkyTKpIbfVR1VvoKVAJTRIJ7r
	9dbyGn2OK/qIv1bbAgg24K4FPfbh2WZLV20Q5pFDSMFdmIMVvwPZwGO3NT9xu7Jzl64Q00z8pFd
	6HlwTxpTEhI9qdVSv4jfP+/SYTbuNe2uawJSj1EYTrouinD3DgF6plN8zKcYwnbxYBc9On/tRi6
	KhspXCqGvPrFynsmUGzyXirxz+pTSe7GJuU3tN2bi6mYmpnevIw+Jr8YKVdwoL5GgcOPTbMUhrn
	ti8BpiAiVC7sEOz+Ku9EdQ9TuWpM4TrYI6curjQGevUTOz+OrbUYujNLPQDPnEUr32aoCe0MYuu
	4Uf/fipMLaQ32j/4SWspxczx8f1btsRKWhdE9/NXU8lZ1jK4rtjBlP3RPIY1uSYiMCFHdLbzp6o
	4dQtBTl00LK3+3
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21107171cf.5.1772170218362;
        Thu, 26 Feb 2026 21:30:18 -0800 (PST)
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21106691cf.5.1772170217868;
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Hamoa EVK camera DTSO
Date: Fri, 27 Feb 2026 13:29:38 +0800
Message-Id: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIroWkC/2WP62qDQBCFX0X2dwdmr9p9lRLK3qxDq6auEUvIu
 2fVkBb68xzmfHxzZTlNlDKz1ZVNaaFM41ACf6lY6NzwkYBiyUygMChEDZ3rR/eelk8QSuvoWiV
 jY1i5P0+ppXVnvZ2OPKXvS0HOR/lLtFXhaaw5wsoThEwCzt0PtEZJ5Y3mUTq7SPbX4rGRXIJX8
 EXDZYUhrTMIDSih1HHOtPEa5IgQXJ8zcI2mrZX3O/H1P3H7yhwW++DpstO0CI0OGFV0jV34Nvc
 ul9ux72m21SHwoLDT7XYHY2KbfVEBAAA=
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=3165;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
 b=8RV7fA/Sx1rI6qohw3+zb1LKEYDpePCGdcv7PiS3aBrOv03aRI3r6pv4Gg73BxcSzTs+QRu06
 fLTfZK5SwEZBxqkZrbXaCwIg39Nn4+ww05FHBxniBH+AvqVQbZNOcGo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Cp9eSua055Ztt3uxJPa2UWbbOiNfubAE
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a12bed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OrI9xjwDScBevOMuhrwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfXySqbqHg/I/48
 UnThrfnQh+hCdaPCX8mrthqGtyp1NAbDYaS3cHrTgTOfGK8mrvYyBA+M1XcFm4zl5p5ENrAWb5r
 2iMl9pOdqzsaf1ejo9xurlFXlnSDEhEk3g0dm4IKH18Kwv0cxqJ+D8+E65gOU9lBHKplzmjepY3
 GnZP3z6pKB2S/6hOZB54ypxNOL4e13qqdMY2cMY50hAQ1NJk/LWfaYiNX+pW2QssWkcf4BHzj8x
 nTqPwAqVJAnqRjvNUcUl340RxEmyXxG9OF86EXFCd+ayFSRjiPEYkrDJh+Cr8/fHYG7J5YJbyUM
 xGgwzcD828myEbQg7DFUHfFCv81gnHdW96VCm+OtPTQ+o+FA28KQNHQVAkEcLQ0edEbnbj/l0Tf
 FndqErLTvq/WwMpHEP882M85PN412tfmkzny5nXiw5A0y2wDXVa3auUCSaN4na5j/azI7jEhz4K
 WnhWhzxwpPHw8HUesKQ==
X-Proofpoint-ORIG-GUID: Cp9eSua055Ztt3uxJPa2UWbbOiNfubAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213024_337065_59A01D4E 
X-CRM114-Status: GOOD (  10.67  )
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

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (1):
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        | 15 ++++
 4 files changed, 117 insertions(+)
---
base-commit: be8c02c846f256767d06a28759bbc7cc0257a1ad
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v3
prerequisite-patch-id: b92aa0af5255e56e1a53fe2bc06d8bb57f155117
prerequisite-patch-id: d39af25f984300c48e6eddc4c7bfe64caae1d61e
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v9
prerequisite-patch-id: eb97bd225a1426e2761a40a8793dcfeebf801673
prerequisite-patch-id: 0dd709980bffcbfc3c007c8fb8b2688cd2bd5e49
prerequisite-patch-id: 3c7474e4c705da65499de17ce4b7090bd8a8a2e1
prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: ec15148282029b78c452ef5445b0346dfb7ae43b
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8:v1
prerequisite-patch-id: 33b8d2fd11bfd7ed5c846c8e56713e0f13908da1
prerequisite-patch-id: ada8ee35053d0c5db6a290449ce479af06974776
prerequisite-patch-id: 25f09813cee88243e1bdc01b9df9d4fb9de3ff5c
prerequisite-patch-id: 5f2c62b86829efaf76f2ba2342a991199575751d
prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
prerequisite-patch-id: 89bc5fa963a75ec2b85403160f884353baea5bc0
prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
prerequisite-patch-id: 09910d9b9b2231a65fcac9ada44c7b2f7b7a9a04
prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
prerequisite-patch-id: 98c6a10ce51f628ebecb59a447c891884b297444
prerequisite-patch-id: c3e8d5e110bf0e25a534bbe911c43996c21d2cb2

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


