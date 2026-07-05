Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B450C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=K4LC8GHQU19B4RFFm2jfYR0Ijd
	4EEZffL7Z8TvyRBV6zaH4TJU3YT/odZREpQMH/2exPjDYkdcPW2gl1NCmYItuSkpOYNUtlJjaeLDh
	qanj+y8Be86GUtVLI8iiVJ4WuSNemVdfD7GdMICjFkdJFDl8jUNtsHyERVsw0LasBn5QvMjT7wwAQ
	7GBD+KGTGO9WCHOi9yNq3qg4Fz1A17LjA28kP/qi6ASRpqgmjgZq7a74Uk/b0dlpvlpr/NxyeO+lC
	th4FOh5FdvPjN7PSkiaX8Ag2j9pldKwiwFkqSfa8sb9JkqgiERTuNKCSbQOkJcsRDEuTBSXzBe3ZL
	/v6bxYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHnT-000000095Gf-2Q2K;
	Sun, 05 Jul 2026 08:01:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHnQ-000000095EO-0XPP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664ML0lX006361
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=PWyX7gcWfCQdAu58
	F3T9QpQ04Xkrxc6Fjh+aetKsgundaI7nqojknAu9CE0124sk4c/XVlw5eg5wdWqh
	6KpnlnCGpvUdx/MUxSRYJuLaTbV11Dm3ri5JiPVD1ErN1T7IH0OqwCcxOPQNWpoJ
	eVPpPMQb+laaQchbR2adnAbxn3/UnUE7Ygc4iAGRCr3IhicamyKvNs+sjDa0ZQVX
	cHSPBMpOuVhAwswE7841nd/k5pymYfmSrxi+T4JiQcv1PafcexV1LzZhqiksWzyE
	ZW4hZhhBA2sEXaQWBAmQUi1BUhDeK2wv2uBuYmb0YuJmQNaqrbxCFw3BRgdVUWh3
	hl5eCQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4ste3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso3138652a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238507; x=1783843307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=gJg9pPlaEEFzJjuyt19FfTRFpopWLOrutr3Dlqds9zbRdaMwDmpgWqpQdljo1L2FMA
         Ra1U7vPVcBZzLUZwDGWoKylhpHHHKCatF7mpbNK3E0HbEUDT4P3tc/5LHGYGInPHhNnE
         8XhmtDJ+uE4c0BxevuzD/wJ79OrV4fLHvD6c4I1JTeJiVVJ3mLUwgooed4uEuSIoZZ3Z
         8kWJCGY80S4dlfHHObWhcUnGh2sfEWgwaeuOspyIe8QwgVJiJphtKn0Du9Weq3ouw+Lm
         54U4WJj41fqawC4dugr1JHL7yuQBubJ8BrrN93YXU2/m6y5+6MIkoCiS9GuSPI5HAnlr
         +o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238507; x=1783843307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=mfPii9guJ4665d4CywU4F0nnU3/kmpogVGq2ukrP2OXO7kby9s/swBGzNSWHNhJ2na
         9wOkUs6ILBNMg9g4DUU/Y1oOYTpj5uzBshbagZqcf2FiAfYX56EDdJsKbso4xWhHyqib
         IXI2CkBqiJc9tj9NmbYbmrf3dHwLxOD7kxjubNZ9pIS2Jdx4tNL8gk8LLHg6lWQJ3JGo
         SYugnEAA2ddP8hG4YJMuTwDa6Oc3RcQjelXmrtM6bkgNTMwBOCgdY2zz4ev4jla3a9Fr
         CmbPO/e0uxX3OV65OKB/N5BG3r2Zwe+DHO5x7ERjnLecCzEMSso1rU4LwYW0ZGvUU0K3
         h1Tw==
X-Forwarded-Encrypted: i=1; AHgh+RrzTK/yUrTKUGHQI9hCkud64IXo/hByhxvf9varEUDJBKQQP5MirvbGe90I94X4nTBxJ8HPyPcPF5ZJnOdSX5h0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyan7zyKjZouNtCaL6ezhqynNbI2+6uINROw5LGSx9GM5Hl+hen
	oNkETfkbCXAunrQhWeIQ0vcOPa7o/uy2lCOoiMEYfsN26hmbaoUxEQZd41dDKzj89/cuQGyKKP6
	ahh8E+ndQrIjgWTHiC71TeSIbT/yoeNhQ2ZF9CTrBNmvMaUsATkNuIlBvmIvJISIQ/xz2ygfQe6
	M0sw==
X-Gm-Gg: AfdE7cmVE8HinXJyo5cgIDhw5oG/VgnBpkfrWysf6Zw2u1FnwGrEO6zR4h+sdwVN4kx
	rSH+eJoM3gtmqv7Dt8ets860008kaSuwXK5PtH1j1UlPrtV3pQo+Q+9mOeGCWbIFgEblVNvt/pe
	P6rzOTWD648nrkbgO/Sb1Wb8+pfk9GuH+Ty1sZ/Dxqfea5N3r2EubLD7wtrkMLLGBL54ykrmGMF
	lCQkIiOsduF8h2vRlnZqh2bnuvOPVjcfq0u0kDhQ7on2UCsCR24vkdyv08ZgSCA+khI5PtDLwQS
	7TVTDBsiOqMbMiE2dFDheUhS+hDI87fWL66dCvCsJSizHgv3+tZQ11m3oLGAp+VNKYivPkqLjKZ
	Mvq4vIN7bG8DCx2G9LDXTAjy0/FlrQ+gjldY=
X-Received: by 2002:a17:90b:3c10:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-3829e656416mr5931338a91.20.1783238506804;
        Sun, 05 Jul 2026 01:01:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3c10:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-3829e656416mr5931260a91.20.1783238505896;
        Sun, 05 Jul 2026 01:01:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:11 +0530
Subject: [PATCH v2 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-7-6ac53de56314@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=911;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
 b=xiVpoXS8RMGK31dPCSwHTMfXAXe0kdMwaj2WE5K5tRhNxI6YaIAXwzIjirprdtrPKj3B6P3vY
 S0POanPFfdHCTa9ugRKkr6B6iwFsPGUorM72lzVY2AIYrw8NLJxCOQE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX4bM/A5rgyvqP
 z32QEIpId8Jli5zz155RpKj5Th5OLkWRRq2/yh3BBV+jJy2s9DFg8RPmwZVc9vY3PIYShy8K0tU
 ajDyZSvDpGyp1QwWnw8JhsPI0n24/fc=
X-Proofpoint-ORIG-GUID: BMDIPuEweR8Kf-LfOZXl4vsQKGFA__UG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX5U0VIgNynpEc
 gOuBK6uSPK/E0zLoumgWCuTGvXyW05yw6nDUv9gqnMNXyPtBkyYdeXJmT7WETuIa/8ZCr+GGYcz
 F2/52To2gru3/iS5dwriRIh3ncRhLzQV3kxYMJfuXejNZl1HGHlxAXHYWTw7YtC3IEbYGQabg5R
 481yXhuamjR/C+DfrU1dp8/GTPnK6pZGz092ORqm+tDpLvm9E7Y8lMWEvcaDk/d7qAgaDzL/rWD
 WP60LJzdsbdnd24PWOgFVbTI1ZQNPJ4Wc0a/FI7meQM2HZ17nmezkSP8aaHVd5OkpIJAs+uLJ+K
 kwyjeqt2o+ljKRejrEDtoQkhzvJ7fOV3y3SC6yTChyDZYzX8GMy+2qufiwr1NKrf3tDwo3ho14K
 HL2GL0BtbJvw/7rmDAI++K14MPISu9pNjwkXBt+KwpSYPHrLne/LHkW8vQUGyN7csnCbHQ7I6wH
 tJtpBwqUDLyAil25wmA==
X-Proofpoint-GUID: BMDIPuEweR8Kf-LfOZXl4vsQKGFA__UG
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a0f6b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010148_180529_7999EA75 
X-CRM114-Status: GOOD (  12.31  )
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
Kaanapali MTP device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
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
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.54.0


