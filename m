Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351F5D3E797
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4JiDGHmMEDPcD2wgDRhLge5WYsd8FkCL+2ifcxAdQk=; b=pH2rbIUgSaECF/L7xpbRvN6fRS
	HE3WJXc9e3TfMmHsHqE3z6KYIqcOXx5wImcJZS/81cng4b/Xls46+MGTP18xn+mDRU+Lqq4zMAhQ9
	m1vd+XYNd6I6knTFYitsAqe7js6vhamNvQyDo/zWhGx1AewGIRG9okICZr5MKP0PKqbLWAWKtHBLD
	c0s/zPb+iHyKXm5fEyZZlbxyBijntE1YNvP3vei5BHQdMB7xs3VAV/8Af7zHgbX6I4E5Ex8bS3ZGu
	k6ihQEMYQ39Y9r7LLFkOijVjsbzgTJyi+uybYogl/lqdRmf9QFFXnfHmeRJh7X5quJgoIjQhI1QJ7
	PuPFn0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZuR-0000000GGrT-3cnO;
	Thu, 11 Dec 2025 06:12:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZuP-0000000GGop-0pzD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:12:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB33t1v388276
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4JiDGHmMEDPcD2wgDRhLge5WYsd8FkCL+2ifcxAdQk=; b=cqPBoDkPQS276QEC
	8w7jNdNzsYxlAy/ps/9Qh0U2H+cQWG31QZ+LUBvrw+bbkSJPMOAiEzngYmg4YTwY
	IdE+WJHSoD9pFYQMiAmH4HkJQWElLsNyWwM9y7bEk1HS8yLC7tbuFZMWNdU9PzJh
	30KoNTi6cINKQWaivw9/R9Mv6suGIR2ieOi0OT2zNO/dvdaqFYPwBzmSQN8qbSXa
	nTvV1YsFsuqWiHCCiG2QQhwcLP59NwubxH9DF8Fo+aUN+IUoFc2IlIzEwOenHy+z
	unLdg1n0NmgiNItAaowcDBOpKvcuF3uclZN96mjQyjoUXg19NYWBD3hruQsDAwA7
	CSBYkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynqp0f6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:12:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2954d676f9dso5854855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433531; x=1766038331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4JiDGHmMEDPcD2wgDRhLge5WYsd8FkCL+2ifcxAdQk=;
        b=FWPhewvZknzFzW5mt4RrE32pKCQdGbfQ+5h7CeW+6nKh9ac9r+djogHSUp1I7KTpVx
         GIlD6AtfTbhZy1w4Tm1dc/Ddu8bETSe9NMFpfkj2RqFytZOSPhA79hc3hSMe+2LI+CZy
         /UslludhIAPtW36crAGi1zEtk49qVn0LPuoE4wiuAgr2pd047NzVG/KFYZBYld92ilgY
         X1TEFknE3lUYAXE7NUFb/b4iSHROBabR+xZ9T3OPsfb8SwInrVdoqcQTdjJcDw0RFuf3
         VY9UpaQ1UjJx0cI95dU0vW+Pldn1jy5F85B39udCtlgAJWwO/+VUcwMAItlxi/955uFs
         rrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433531; x=1766038331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A4JiDGHmMEDPcD2wgDRhLge5WYsd8FkCL+2ifcxAdQk=;
        b=Ufrx5w849xW7z+xRZDv6Y65OrZUPZUsfe0DeEu6sDdrz77IlvPoLtO0CBDYpCexneg
         eFWsNiw03xdEsIz0fvJWBQFJ0k37zguutzzyqlPbasKXom+GTR0trWC4uCm9fYYcOiRu
         tgi6U14Yws9N+jbZHKpU19uzhHlucSw6eBA4gILQi/XRvqLN6dH2kzjdteuHAc4aVC1k
         t4IRXDl6lInK+EcrJIBoKHHbKKtwX9aP138KFWNuTKT6BCgQE0ikwrA4Pu5k6T6cAJV2
         yfhgsVy0/FZg3b+eLmJMYQWf/QLlpqgfeV7VePIycotTOwS/RWemA9aGMLGrozyudHNy
         mMSg==
X-Forwarded-Encrypted: i=1; AJvYcCWMZ71co1qpbLY7UIlgN47oroT3jbDIoSdRO7rga+YPaqOST1JbU8456UGesvm16eO0J38ICiZKJeETGTonQM6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzR93AoK+CE/7zKav+bFFccCWIMbd9i0vmb07R+qIXo2ewAMAUP
	mLcdYKTwmDSRDeWADUSiE20RbbOF3np9IZxs06FLFBWuhbag/0gSJHzNNhcCD3ioLloXAG3STFh
	Mr/JKWWIaBf+2kQQ4NbEpAO7YwP1iz5K6Zvo+ftW4tJ5Mj82yqlzncyXtFzVoKA1zZaeBfAreXH
	zp7Q==
X-Gm-Gg: AY/fxX5ITA6KrF72iA1C4sOD3hbNFjQBtvbbns1DrEcOYytRT0Sfk3gK4gsRanS5qCB
	kIKW1zG5bL9rCfhHybee35elk+sg35J2CHtmKgP77t4wHSJY/pazAXBVGulzNX9Sklt0JuQEaM5
	jVrZLZ8YClmJgGdOic7pRqen0rvloVptdfPKouIuSDRwUdTjt7eNwJ1/vJTqDTowTO7Bn2u2fiT
	/AC1EL854SQH6qMlJ6VS986UszzTWbQ7wgZ9EuMXETgVWHry/AIdAT0JGaHQV1AwULKjhQlm5rF
	JCVddakAGxpRnFmhk34O/m9gAUX3tq7SStEv7owHcv1CKR6O6nl1hw+twrtthBg89jfNRQg/kEX
	EfVCeyIoBHZ+DzULqOATAQa9onOksHXK+3S8ZCnl47tV+1jI66yV8gfJSCuWtg9T2IwVrkqXY
X-Received: by 2002:a17:902:da8c:b0:295:3ad7:948a with SMTP id d9443c01a7336-29ec22caca3mr46292585ad.16.1765433531087;
        Wed, 10 Dec 2025 22:12:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwpyeBJog8A/y6aFNZOvOQS7CL5HjLOWRtqjKGI3ThqTrSkk6w7Ru+P//VRVWCIf7gX5e7pQ==
X-Received: by 2002:a17:902:da8c:b0:295:3ad7:948a with SMTP id d9443c01a7336-29ec22caca3mr46292275ad.16.1765433530616;
        Wed, 10 Dec 2025 22:12:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:12:10 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:47 +0800
Subject: [PATCH v8 8/8] arm64: dts: qcom: lemans: Add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-8-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433485; l=826;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TYSRWgmxRNSLt2fH+36XKupwzsybh26yro/HGps6z3Q=;
 b=Ux3XflkTrrUJHp+u7FIF254VmIX3iOfhW+NkBHok+c3zuJeA5LieWfVOFHPokKhPaZCUr783/
 7nAw//SIn3rCaw1MyLtijaWEIOLpdIrDfw9bpgsjr955vjm58gSoAvp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX23PsxPOse0et
 CT+k0bEJn2tKh7hbXulctB9Wt606xatNj+J3QUC1hgzYVZEgyaVufv3nPFp09NCur5htbGX43Xc
 YNfWb2fwstfN2EqghY5riQa84IisFuYyRzUEQyE+VYl1vzX31e0smfcSoIV6SOznSqhWQ6Y4oYj
 pqLahk/egW+TmTNJEm0NsX0jzlX0wS3dwu6AoJ0ps7r+WsQ3ZmcY188CL5NNGCX5VBTEsZGAOD2
 fxb9ZIRavQQ7r0GvHag0JR7xAE0t7SOoqMSlra8I4I5P12afTE+HazZQC4yYn+mH3YdTssVY3MH
 qtJX2qmKjq2wogovMh3aFzPJYK2A/+NAIv9+y2yxx4I+o+t78/vuRkTouSCqTEGiUJmlxvuK74x
 BA54EV0vFdNQllOXXT8eXeLDnzwuzw==
X-Authority-Analysis: v=2.4 cv=dZeNHHXe c=1 sm=1 tr=0 ts=693a60bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: AHQk9mkYZxkikG6S8LiA_zHDECN277xI
X-Proofpoint-ORIG-GUID: AHQk9mkYZxkikG6S8LiA_zHDECN277xI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221213_361853_00896BD5 
X-CRM114-Status: GOOD (  12.42  )
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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..3c4633e044d9 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etrirq0",
+					  "etrirq1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


