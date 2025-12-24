Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7F4E75426
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=sBAxsYR7nsZ0WrJhycExAxM+Ya
	gHi5kz+n8Wv2p7rN58SpMeJbLFAJnOgHFBpWD4Z0wROkBmuLZ72SX8LSyoAe2FeFp1YFDeKH3LI+Y
	JCGPrPzB4qksGWwmPetJ7wn8EISUiqSWcyhA90xdz+TEMu2Qwo5wh/0X3sZbIpF/KLy28UNK1rV8I
	HJdili++jF25UmCl25br8dzJE3lFnJr2EUH5zEzBbGh2p2sh8HFczNHLURHTXeUQI6un2cFVHGQM/
	PfZ2TXNanl6w17krWrm96mflruStQINd2Afr5Iq4J8tGf3chf9bxu9G0VruF101TrY5RdDcWKf9UC
	amlDJtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKqR-0000000Gbth-2CV3;
	Wed, 24 Dec 2025 09:07:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKqM-0000000Gbne-0G7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO5gH0g1018224
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=OSrDd3j4D1M6iMRF
	drhYNwsm6BxjHnc+2o8SZUOKM5dsoq5nJTuZqu7/MfOnu7IH/UP268Gp7nNZln6u
	MrAFzOnChYi9gbtCN5XJFgDIhKX42mGMGxonm3UxGDlguhOpobY9dpSNwzTQ+3KM
	AYFAdPpA8V2Jgoypqd0rhj/pM/X/7u5vB1y9YAJSiPnWVHknrS6zGJ97OUB6Gsvj
	E5G3cyqHeVC1vch3h06Va54tlGpwo9GXHdI2q/9WVg5q2cXRvj23UxKl6lpLFps2
	92qkss3LHeZvO3nDdpMcB5KregO43FtA25alfaTD4PUciRf33s/S9qNrDTkbxH5A
	YrRUlQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsaddk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f69eec6so72555645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567260; x=1767172060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=gUquMSieqJhL073l3k+28bJjVTkVQXKpmP9EJpnmC7mcfhUOeFVf0SowjDVOfx8dAv
         /kRrcyzjMc7t2PLVjWVvSfAJxAKRy3Zmb2SWKVKaZnHgzoxn0YtNMrhsSYzKkMig5v9J
         aqSFHmInLPH5Snpf8s2mmZoi4bJ8aNlmywcz/lRzeeDwq7JErDAAhWuaar2H6qaKY0uJ
         KOogiAfvqOBktnNskANumxg1yTr8xXQiVs2Yb/8U3kEoolChXV5oESb+nzpvK1hZpajo
         bk1bDLWiesBsQt0an+CD3GvgqsWUccyNtrdulyEj1X+ZE0wBQnxizTB7mT8H1V2bjR7+
         KJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567260; x=1767172060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=cn3BTpibhDNcmaPVd87bn+bEgbAIug2wz30VkKiL/MlCNBU9XIECO3gY9dyLtVV5GO
         eaF/3q095jKqP1+plP3LYr3hwFdx/jLJl4tGgpUFhJaBiDUJ91JOsF6lD3tYFIsmvU5t
         exMAuFIUrsYcSGMuDjXctM0vGmH2Vly0ZDyVD/l2RpjnDPtyXjQsnW41/lV7bcqr//8v
         Y+UwbXeEgslYRNtuw7woOthTSl6ZWMXTegG9YpdQsrn3T44KklBJv/KUVAyOnqeo0SE+
         OnCJI3BHQZ07b+Ly5x5Rj6er/iiGP55X4d74pmmiDBkzBJ1ccf1tH9FE6YCgSdJQLj3e
         g4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuB4zPIkSqz7kyhTVzioHC2uagIeb0PS+Ki1KOK31z0doIYVMfjFR0DE3PCrlRmfbRATk32vvL4cY2iCHKPaRw@lists.infradead.org
X-Gm-Message-State: AOJu0YzIM2CaXPX2I+iBXSOLEaVbmFnCiP27QiskTkYG9ff9UWddAlJY
	YF1gLLbyg2HpYAROLN4FKHrXEUz8mLsgM5QNgXwRfCrmY0jPIknXXXenkefODEpkoZt6EKUgjbI
	vDaKZojv99vvD1heVDGEbf7yvHs68TOOA50OYMUSoJj/9Ut0QY0Rfx1KfzFhx3HLRssakQaVWFJ
	q8Od6eolkoWg==
X-Gm-Gg: AY/fxX5J9LcxGFVXiB6+bcJiZxmeB85G9duFtvt8Y2FO6HtpoxkuCSnb8fRWZzPduij
	Pvm2Zqtkw/kYiq2c5gdQJstVSEbbxk6WE7HzJRD3l2a9RLlEQ2z+mxIaeJncIZcZ1FDHl2LRMdL
	w+Zd1cr+WC/RuF73YfNJN1HPiA3x4Gt3d6iP8AAcSDvw1TUTQBn6cemZGaxZIVJqwWVBtjdIuY5
	I1gTVwYlDScOpB7GbrVj8ygY1VHryhkssGRZg1sHgdctsraLyFSAjqPy6aueXKAvE4amxFVZhDq
	wepwRm8bWnXUJYU8bzNLDPnU2lQppwe/VyvxNkigiV0tiarNzwI/FNeenWhkYwapyF5N988jHG9
	VushkGNEsnp1XLcGNvBB+zguFb2qIfedVqgF741X9vJkXFkB27LVufOmRSDyTopnfC5k2UfoQ
X-Received: by 2002:a17:903:240f:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a2f220d4ebmr190382265ad.2.1766567260055;
        Wed, 24 Dec 2025 01:07:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfndQQFrwSQmYqTWg9bPiFI4xmA7WAVtvf5bj4/YDmimFXEhX/VKCH/nn9DarFxK9sBxj5Hw==
X-Received: by 2002:a17:903:240f:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a2f220d4ebmr190382015ad.2.1766567259590;
        Wed, 24 Dec 2025 01:07:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:18 +0800
Subject: [PATCH v9 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-8-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=/7WMljk2g9bMwcAUVum+/8ImzjtIdqkJ6u3LAw/S1RhZMZQVJ9HIbk3/Y9i5dVhdvInLNMczD
 oObxP7p5avFCgtwV7858IVS3H6cwDqA8doPNQaq74IT4n106PqSnj5E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX9ay0mIJMdMOZ
 Uk3YPcruNOAl7+WIPBmxLs3Sd60UfRXlyluFuDnRegJan5ZMgoKDvZ4kgPBvsA3IIMW6OKK8Cc4
 3O4crbe7GN2iZADoXj3TcTreKJKEyDWGQpiHJ1vzJimja9JkY1hXfBmpG2OXtv8k4q1ZVxyaFuw
 ZHhsyZQJdk7V+hPdHBloYJx/n0+lA9JPs7kQ+jBxM9hVyND7ogdQulNisT1E2G1XHn+2nQqNr2c
 NqzCXiYfVgIDubWpLiWtkaBX0euJImHA4eYb1t4gkjnl0UYe8W6QVyTLkfY2NkClhe00YDGapYC
 SGVd5N8vm1yy7hBWifWR4OuKK5bkACxa7peMwKmGIv1WVOBfWzfkY1VvMJGF/I4qIXHMXQtMWsK
 1u+UuTl8tQkRzo36ZuD+CM6O8FqcpKRpAEW7D0ajRCF01x56CdHHIH3mTN7HaEbMxqdcUaiVzA7
 lH+cQUF09HlAJphI2Mw==
X-Proofpoint-ORIG-GUID: qet8cAzBR5-_PcHpGUrKULa-d-DO0HQ7
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694bad5d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: qet8cAzBR5-_PcHpGUrKULa-d-DO0HQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010742_253792_FA79D282 
X-CRM114-Status: GOOD (  12.45  )
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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


