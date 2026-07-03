Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7119AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=; b=aaHZ5Fz0v0EW/qB+KJj0Wqku+o
	BaYdwnrTatyyLyUbHfoYQbWbrgw09Pws004eG9qQEyiPSSKqTDCvnuYXUI2QaCw+eoG7FrXsVUPnv
	4n7eMA4TIzsbwhiHjbitXpmW8XKu+YTkIHckwaRlNO5PNGPcsYhyRqCUzjqD/BR/AcisK4CoSMz4O
	SCF4AAklPUxSHBkDLQfoml2rdXTpbmnJGLraNmt6m3PJLKZGJe+/yFN9EsxsK/aJosLlc5ZrU5JgV
	xDId4p6FKoUMvoUWCgQUxrt83gp0TTAvzxVqI5dw+m52bpmXls7WZnuSK0jqUNRQfDq/mjgbuoE79
	G4VU0KNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcq-00000007sWT-3xkl;
	Fri, 03 Jul 2026 20:36:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkco-00000007sV6-4AGV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:36:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQ4BY1021181
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=; b=GzQAeyrUtLWL/Att
	0BQGtN1jrzTo3PMxpYmNXjkP0hrCClkfQewZAXWIWWxjar8OD51Bd38B9gAe8W1z
	D9WqjaVyv3dEC1uk71Izsejfrma03HUbRJO8L3bUJwdJeJibdKzRV/Ra5BDO9IWs
	uXQKF8q1SKTXb/qI+Hz3JKMCpccz2ytTkp1c4SfdiLAJ+jaV5EMaBNg+Jxc4LtyA
	mbQiF85aF0mcSqVdK780tKeDjeK45dd8yvIN3QTb1wsm22g+OHDC73Kfy7ZCoRmF
	+dOU+6OBoHeh0ETKIAcxURhiNX2mqDqloLlkSr+myMny3zHBLPzPBegUcC3xzVAp
	/dImjA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkhdbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:36:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so1436950a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110997; x=1783715797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=;
        b=Sg3SOrZRLPwTmH+YhpGxaBZOltmwngVAcB+T30r4l9VMBn1NlD2VKxYd/NTpjFkt1j
         eAont6ORmDNuk+qNwpwsrdlKbWkNBXdTas6+c3NHugzY/hmwQCCfbgWq0TKWrUcsHqc9
         PyKb+w9P6cvb+fwapgn65FgsJMz5YXVkLu0x+GlfZSF/q+3eiRLxp+nd5IYjYq5HsZPo
         seL+QkjShM/l62QpKbNbTrRRY5vnDWXf+EPZMDEkMJj7qVRhhylyQXt7Hr9Pv8OfpDTQ
         61PR3kFgG3AwKmX6GjbRZcqq+03BZq4QGAq7yFOUMmwlx7DrbsyID4U9MSPUNZj+pZYI
         rd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110997; x=1783715797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Ewl6TyrZ/SLK7WpaVFEgmD0kq1oJXIxrfIN/wFdQXs=;
        b=rBrEQ82/FDutFGIgOhcm4lwOcwF0plk9YwbV4yE6Bhw5rcnpd5JRrbROk3a5eyU1jc
         OVwgkMOjeEajmmWkBCLnwHtghCO/T2sWXwMKBAKJrTMzACB2KiVZuZ3VYV7e/2+zdVn0
         LfmfdSG0xmDnXZKu7gjAFY/0PN7F/S08oKP+N14BsGI4gR9mb3sOfZeo7TdwPscALbtO
         jzdwigcMUl5A3Ka+0y74lOv4+IZLeA46YKJGaVMB8Du1dkO5zQ63l91MzMfwJQpEJpG+
         XZIfQn6XyinjxFK2iKuRFL4ez3kC/msH4fso//5ZnWwPcWu7DewGT3H+6x/FbHgWkT0J
         HC/w==
X-Forwarded-Encrypted: i=1; AFNElJ/l5xB/GQx/AdGXUsJVSbVKriyFv/27f55T9cZZvoz4Qnlm8kGLANfrn7imHXpinvR9dmVRTYRZ8g6Zvb4xhVvx@lists.infradead.org
X-Gm-Message-State: AOJu0YxicMJ18uvwFEgMfmc3mnqvjdqG4m7xWSZXvP621cu/C4eLio/A
	ZVc6K2k2aj+ZHE4du6ze1UmJfU1ZXO4in0EFdgPIyrvd2Itb129aDSVQV7e6SQUIbnvi9vo2VfF
	6nkfzFa31DvAOH8vi16ycNFsbrD1OpG2EvZ8WVGmSbaKQ+dHJ2cDKOwKKtDitQZvqkbTaVyVevB
	ou4w==
X-Gm-Gg: AfdE7cmauBQm42tGZhuSgUcCTki9sCU8/Dn3LCqE6DYavpTB5DacwPuDwyNERMO8e+Z
	RpDBPsOWYA7uocDdPCuSF8UDeuSF0GVRUtm/H+u88xSwEuZ/2hLYrf7r9Sm+VPnUZwWLn4sQu64
	N17STxDGhQs4Dc9yEsCjcSvtUmgMNnZ/YF7Wbi30qtKTRW46gRCZB0nnTmwP8IgbbQickMV3N+q
	rmtYsvF5BZK+hpZx5VAw6xNKB1cXeL3G33e5ffy+XdcP7GZi+9yJNmdGwaFzb7iJRabkmnJREuL
	bzJ1MP9MuxD5Lnx+VDoGRUnS/1geWptSzwyk4SGSEKSV921nrOOSpSeF6RnEyepw2W0L4zks2t9
	2mRhrgJ65F0gZ6Of0/TURaUv5JUIa3pCDtqU=
X-Received: by 2002:a05:6a21:4cc7:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c03e3065c8mr805373637.25.1783110997144;
        Fri, 03 Jul 2026 13:36:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc7:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c03e3065c8mr805345637.25.1783110996652;
        Fri, 03 Jul 2026 13:36:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:35 +0530
Subject: [PATCH v4 9/9] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-9-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=893;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=MQlXtxhLQFtUqLHdZjGZifsTsVTh3ESNrqyekz7rOG0=;
 b=MzhVMhZap4fsAniWO3w2MNYPOUIaWxceqpeu98aHYIopN/QURKoMDWtY2N1HuWpigtKSVKySi
 wFaarKM7dXKBYN942TJzB1YH/LjyAJhqYOZLEi4us5GnzMYF3HTZD2L
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX/B2qP+/DDeJN
 h2znKqfedn493P7iL23/y0lSHz5Khi8CPDIO3IeFAS3blwhckWEVcEKRm1dvmdurlf7LzEvJWGv
 yMX+Ho4dc992Prnlp+d+PRijRG9+by9yQb6LpCEyWtIg4jDxXk3U4H1DAYHfRCkmM1y6Yl0CKJg
 X/IV4pl+UqVpOKp8M9fff/Je4P/5a/NAaa7MizBiJSx9ZFM4OUtRJAXiyp2xGxpzYSGG0YPyqYw
 BF/J06XCNxt07AClQ/Wcnko8McqfoL3AgEzRoYx1ktAwdJmLg6H52rK/KpgKvX6qqriNeGPqfxv
 MtlybngtCZ4LY2/uwRLA85hhrM4pCmDjU2S1nrGyRCWz6M52Val0EXTqZwUHc5PhZfQ2Mnkyhed
 xzIM2Nz7mWSHz/Oh4nqI0SO6o6ToF5h3L5y4E6AvZmlJqQAmQ+HNQg2OKVqVXMeAtCJriVy/yXT
 xa9bc+3qiyPz2LjPRfQ==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a481d56 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=C5heC5qkSJu3Z_QeR_8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: rAM1eQLtYWY-vSJuKVqd-NhCKrd0uQfQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX+1JlBkivUEyJ
 /01P9qlDk9nsSWcPR9JVx7CkQLpFQ5/84USrlS7ItOmAGHtE6RbLVK34O+PNGIe3p9wNZHkga20
 cbO+hTWn13eQNI5W7WwvaHVG+fskcU8=
X-Proofpoint-GUID: rAM1eQLtYWY-vSJuKVqd-NhCKrd0uQfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133639_161267_8E9D6A5D 
X-CRM114-Status: GOOD (  12.26  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra IQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 743979b5ed5e..b51aee19ee20 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -58,6 +58,14 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.54.0


