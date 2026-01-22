Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268FBD62618
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=; b=HjU50wjimztC4uaoyph4loU7ZB
	lYGRMtbS16c6rUYAOdq5KdurcnIHbpGhI+6UaCLmkDoLoCoo9DPvOEoOJGp0IGbRnYcxUWgCMvsZr
	84I513dySrrKC6P36H3aNGNiXeSpN83HlPzlrEVckB9f9qC/i2zkLW5SZJrBUjcMksg6VXrElfVnq
	gZRK4uflZGQcDkgu/pWkvfCYeg59gg4yB5XwvnMheT6Ekq5NH4BDi+sozeYkTsmuBnAsh6UZ78Fa2
	nXYH/1C1M1udP7XHz7AVm4k7Wg3IlCoKWZr1/0wD0TZE6Js7ICzIa2lUHdSWUqP3dsyKF2f/amtUW
	WktPC3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGC-00000006ufE-2XTp;
	Thu, 22 Jan 2026 10:49:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGA-00000006ueB-1lJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:49:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M84Mkc107530
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=; b=gm/or7banhIUobRb
	Y6U5/fD5tQyaKKoOKNDIikR9TuSeUcdS5/zEsW4Cg4AONlMgCGCT2Iuw3WOMyx3Z
	EYzP1GYMysOjd4njJpv14m1U1Wur6HCgurSIji9cMS6BC0D7y5lzWyG8pkfd4Sf4
	NN5jbdbEb4Clfqc07BxewBRNT3UCDH06ZcmAlAmshlhVlGGBWUKMX2xzq6r7lgzQ
	SaMsnj3AYr33shWK+6JbuWOd+VOvxqRUvQ4UeKfbL5qv/eH2LgeDN+3OeXcHmi5u
	GRCsehfWzXc53zzUXVIvXRsMuzIeAerg1Bt0paTLWBIDGd3PmTWQQVOa2hoocwrD
	NbBl4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgt54p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:49:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a241b5cdso138318285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078993; x=1769683793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=;
        b=QMu28kqGOFUB1rW3RjfTOBRD7kKzS1pnUtwh5tFX7F6TFYPLpL4LgPoaCJNmM/PzG0
         EuD5JQTnyOL8jpoQGqKqdWK1qxKVWh+gx8Oq20casJyfa3IlsUGYeWLJtVzpz/64Yre/
         5Yof9G1DN06l2504L30ug+PEhBIvc/KjmS6y16mP4CkKp0hpvwCbT7o0+AVjE6tHzc+Y
         BSfpfe1irNLbkKpojWjCmj3uGPYH4kAWL6Um85FEuhxw6U2HlZHs11zszFKyIwlkTVwd
         /j9FTYzt9wQvbmVPNrs6FQI9qz991gOqD9e0+AMfnAH2IKnsXxZAMMH5vr3+H6sw9dG3
         Fprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078993; x=1769683793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaVvPdxctaVfym/v4SBx0duzy99NPGMCqQ97rGguHm0=;
        b=PA4bRA/pIPIPolgC8AUIfSsBASu3ZaVnwTRsTDHhe85ZsBC9E0QMYdc3ROzSub+qDF
         7BjJHClg5fw5Vy7S9ay44ZzYMPbjIWlMtjT6Vzu27KNAAB8t+j5Kb5vFTvO3S+iAZwqY
         uQeU1AbBkzK3sbdgyrCzqPC8RJnZ4HQnrbm1b372vI30xZa9i9SvNOY0eVAuHTHBkgHF
         5fwEn4IH45VJNomRelYtr7aVnPwj3YxO894TLPxLjF+xZTMBAEyLfzW1iSPZ/pFhCPOq
         gJl9BH5ejrjkTsmKPF/iUZabsZAaPzkK1iVc4izsHr7B0DDUdHcIbAO111vc+NFSzwhh
         SBCg==
X-Forwarded-Encrypted: i=1; AJvYcCVA7r5glBbhAZA5bpIs37Gvqt4lRZw1hxF8qdyCS/7vpIdbLZNUjjAbU7m4nBm/0I+hLobawwNnO5o9pv+r1IZO@lists.infradead.org
X-Gm-Message-State: AOJu0YwI/FzXVqowd5AY2teAsQfyuS0tdujNV8NNMjFv/OM57kr2d9oe
	qJHRAJxdEoVapz4v3769XYYyepKmHVAz8AOB36OkNQTFdHaJMjamlD7nt/4gnSjA/RFvajvmmD6
	y0vWHjrC5Qs/rRX7zS4E03OQtsefRzMGlfGkBHYugt7o2lpTq3FPocsqtogiUOFjsHVmnWBfolu
	LDYA==
X-Gm-Gg: AZuq6aJk7FfM2clvpcb9oyIEpl1zAgkUvvLD4VCZT1oC7rkdeDhuYC+f3UZsEaR1Ynj
	ZUcVmovtk4nCmuqoPaKjpuhlhLyTL0EAO3W8DUjA4M0tFFq9ML5YEOjAJTSxmNh2FQVmfAEf376
	SSh462YGJAsZCWamLjxtqPFR7Uv4AzgwSsU60a0+r+651xtrxA0seUdlRp/5Z1g+BHt5HwfpyCD
	5O0+N3nblxCQg6yAFr1len+9Km/kMTe2PqU6Hl3fOdFSXjnGtGi6d05tq9ZpV8+Ta5T6UunIDFS
	ZF+zgYUOJks6cebxJ513cuRlKvPWBTWQgTevMSRthIR9cWYuGk5lVUic+H79/1QXbAcJEoAzbpO
	AyWJiPUurEUegVM2+GMeivX8OF5eM0waTwDjpAT+Ez6Leq53feceS+fK5AU6nE+cXaJrXQxOwUl
	o7
X-Received: by 2002:a05:620a:4081:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c6a66c8477mr2937671185a.5.1769078992838;
        Thu, 22 Jan 2026 02:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:4081:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8c6a66c8477mr2937669385a.5.1769078992452;
        Thu, 22 Jan 2026 02:49:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:53 +0800
Subject: [PATCH v5 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1158;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=B5r+Yo/9SDYaZ8RGuV/vWORvd/4+ohBj6uYfAX9/P04=;
 b=avAvsXrSsBDrajbBbVZwDtpKrzztRYABQg9Drw+sLt8tWOBjUKXYhyJd0Aj5Lwaih2O4gak5g
 XLgbYhMHt2gC2zhOC+GhVdTii6z7WSaE9dVle2ZyLXVggnaU0ACmWXT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX+Zt/GpSMjIh7
 YVugJ46rZPYeW7H6/0jszY1FzIxUBn8sX59l3Wi9aWfBGerfb1HIl3L45WndbBDPnpQZ3p/E3qg
 pmLzAOVmBh6hog7f6t2SFgib8C+NY+MHKMbDUnT90l0nkYekmJ0TA7/qz+/Pl5gCNRXptUd7BuV
 T/amyZTPnA9eAmmQ3LW0pK7j+t0Ti1q0c9E29QsU1rbOnKprLO5zC7dx9mMi9fx4b+WT0WqKrYi
 ku7683SuTaWXXVoGdH8QRZ3z/ie1IkjuLFUXvbQHXNepRBYIzO98AmrfesmQ90Duko7Q6pFQXVG
 qZKsJnlW8PIlkANDc1n96LNsdzOIUYJIC6Lkrpu/+LqemEQFQujqqUw6dmN4nIaqCMUY1Egz8BE
 RIPHUWCoFNm1MKmg7u3hjo7XcNWrPTFRs2vDdLzsGRa9Bv8gw0Lk6Galg5mfe115qZUCtdqFnqv
 NWcIxKdFGlT7x7Bbb7Q==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=697200d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MV-VTd0to6NmDFHxSyAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JggUTkuXnq20Z9naJ-uAmZGHgh2VSyXN
X-Proofpoint-GUID: JggUTkuXnq20Z9naJ-uAmZGHgh2VSyXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024954_585375_8CEC5CA6 
X-CRM114-Status: GOOD (  11.57  )
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

Add the sm6150 CCI device string compatible.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c94551583d8deaabc 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -249,6 +250,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


