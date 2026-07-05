Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F67C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=uifQLZnuJe413S49wZS9taou6b
	bjU+IlnRB00AgbEE5qyUkLJv/PvngPmHKnaMl3jERRh7DFzqAnNtwAAx74ISUFQPgnlcOv+5MTYFw
	sk5rJ8GbnaeVG/HZICFJdwZ5FFBbUiSWNJbRl+GvFb9aie5CMTBiOQU2Xkhiz9fnnpMXMjYrjrNfA
	/gcf09pNAwLA0sdJUX8cLzBWjJc0WsgtKjueTfzqLmBZLA0yUpPHQd41Mn96UVPbh8trPCgdHF12c
	Z5lR1gus5ImQDPX4haaRihKCeDr+49EHmav3Jt4dedwUGpL//wxo1uF3YXYQEkF0muow6QGW4YOuo
	IMF6mayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHna-000000095Ki-2xe5;
	Sun, 05 Jul 2026 08:01:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHnX-000000095J2-47UU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NArhR4084353
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=jYWEQSrAUJv+G1cN
	bXwUmbtQ3c7ObjQG+ukJt9DZ40VEQ6PTa/xjw1+N2e3GCt812eSCQk+dPYd2jPfi
	rdTvb6I19xcC9R/SG8craVD0o+htkVCgDwPS6emwf2k6+vSmDtvS8BKtlB5TFCwR
	2Yvk/h9+K5xpEjlQR0+3/csSwc3swKpXMlA/fFjTxuekd8VW90Hx8V3lnn++WKs8
	uj+4EijZA6e929hOWVjRvdmmowQ8eOkNKLvKPDUsQPIEsuopeRVeIE98bduRFh/2
	dfKFu1+t9kKTb9ibDwtygmTqsxF/C+CdpJ9WnMrG8DllrNmWFT6WW5Xv5wzseDX1
	gULo/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgj5s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso3053134a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238515; x=1783843315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=ceJVUEvW4biyHduIfIbOyE6y2lyKkHaGG6Suv1bc1y37SKvRGYylAQNlSnpZG602vV
         Vwa2x9HIx/wI0HwIYyJ/K5XNGctyANYHlNchC2Z0rNwdSFhilg2L0dTo0eBW4reMPl5B
         aF5Ae4IwG1x62Nj1IMuqd+VQj+fm51+zwUwYBm34mAjmS5Vwnw8haVlKST7zZUbKy+1g
         M9nGE8eFxdR4E6ewbHwrp88w9OoVeTJ3XMXPFYIuSLCwrXdw2pUm7XSlg14pN6Ssbr0w
         gE9DjTsd4vgCwRayzbGmZdG8I5F5mWb/3uvzysSbp/EcqrdZfqKHPSCK1fF4Gv/6paNG
         ZjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238515; x=1783843315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=Wu3dylZnSG7YQ4Tvx2fLFYjD94rNpS1a/VKRQoYriOEIkucoox9i+2lO9s283Y87KU
         Fzq81IT+6Ui2KVQgpK5ZXJ5P/t+6q633PHJJD0pn0+JTwXSoK99BFfi4oyjK/2Noqfyd
         9YtE7V2FYNPV9Y7DIMytHAvudotqSuuZVfJ1fjmp14eaPVnAM8KNFl2+7nscqBDIg+O7
         +Tu9h9S6TX36N1gqE6z0K+2YUr2kUQRSY+xA+gare53/+xPU4Jm7WduCVhqNwA4fKa/r
         GfqurhfkTEaRRgJfa9HaFBF9TLoTMqDOLQatcZs6fiWoCAWbuNLWDFv/lE5KKtzTm3EE
         551A==
X-Forwarded-Encrypted: i=1; AHgh+RpJh97AztGeGkwV0pgIg7STRFMU7mciRoSFDByZTsRMhT/gk4hJebnRyJoLDIaLw7bR6IaCSW0f1+AuLipSjyoH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn8nBd7d1pz8Y4ByhII9MzA7MIGbhuAkVKaZhQeVV27s9VUXYK
	t5xQcE1BMc00jIPTASlGA6gF7DWnalx814TS8nMUo6pjbPKaIpDXSEcazSswbdxvxJpk3CxZNjZ
	Ejg9WZnnlb6HAQ9Ldw9iU+VWX0r+NT8y8AlpTZOxxxg3dtAbSlmEpzwmS4cHOdyroGSV+C/QRmS
	ktNQ==
X-Gm-Gg: AfdE7ckgIAts9nDdk7H2x6lM61aMd3c33BUkC6NhV95y1nXN1X69zfa00xga810yLVG
	jlKo4CnrPI79HP6huuuO7fnRnkbAUdn7qBszCR5/RtGefTCNyDdI0by7gqYjJaurEcaR/YnXQrS
	PdODHJricBt/Qm8VY3+Da9qRa2HolBCRZu3olUYD665bhhZJ6UyqzhghMkKGaCOrnGKXKiFAh2u
	hoTzHDpxtHbb2r/SUN4icErehM+63sjSUkJylY3QrTeluOGvfulm2RH5/PQv//V5Ct7bXZTdz+k
	4CAv9lR2iDwqQKPswhjzKIY1OwmbIFY0AolfsrXsV/eOxI3gpgRUEYekoBmkx3/AcR9zgAtxGa4
	YibcSco7ZVF3Cn/EBlwAn1MiOtPg9WBlUlzk=
X-Received: by 2002:a17:90b:184e:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-3829f0074aamr5305973a91.16.1783238514734;
        Sun, 05 Jul 2026 01:01:54 -0700 (PDT)
X-Received: by 2002:a17:90b:184e:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-3829f0074aamr5305915a91.16.1783238514228;
        Sun, 05 Jul 2026 01:01:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:12 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-8-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=851;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
 b=URv+TD6nyF6fnwSALrkof6UTYsZQKMpZN6Rz87h3njAQB0CgJ4EMV5S7W8k1U/tDgpRf3l9zN
 cRBp6AKKgf8CR9cghxKkqama10bv835Kb/xUKijDgF/ifhTGcqEIvaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX9L3s0yrThT4u
 ROz+IFo4gq95+s5Vp5ncaeS74VvdT4Lli/edp1PjdFfZVLpHVryzyZL1tf/1QgytiydfpMZLkxi
 kbPGMdzQshU3QbHzRGTq/4vEHJhbphw=
X-Proofpoint-ORIG-GUID: jfrB8cnCueyRv5-oIhDhpYZKlX1LDBdc
X-Proofpoint-GUID: jfrB8cnCueyRv5-oIhDhpYZKlX1LDBdc
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4a0f73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ckKq4DLX54o5ySWhiFgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX69HKoTNhYMve
 Pl1YzewzRAVxfkECfku6eO4wgZf5LzQEMhStdr+2t/wFIo/ueuoButOTcIrmQ5aUNOcPshyrSgN
 z8bcYcj0ohwkkH7nM5dsf0eg/xNaCM4aEb20qwpM9zpm7F9e+2ahZgv81b+/nRJgpUcwaIJ/U+0
 iqxYJGHmhFt8BfoVPpPn88Sc+O6/+Tg2K+XgDC/MZcJ5RHyu0TxnEBrZuupK1wLtym9Sm3NdRlY
 /sEHo97kvhCJ29V3f4qPY3sjuoNiRYWteDqso6SX4kt/bZXlTd96HAWE1DY7KgCpwKTpVieHpTC
 fOUm4uzdiyvcHlFqVnGnKfSzu7jkEVv04eo1JqL19LIBxwzZZozWbi/4mIVRJ65sH02DuW0YDwE
 xdWOaAnQ+65qHbKkhilJbIYFicq48kgthcMoItddRGB/AXkIec+ZUHHD8KBDp65+fkJJla8qSR2
 b58LpB9I0oVb0mxRpkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010156_033745_09216794 
X-CRM114-Status: GOOD (  12.33  )
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

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.54.0


