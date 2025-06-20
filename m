Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13ACC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=; b=uBNvqy7MFFE+duEOWPZe1u/O6/
	wLH3opTlAA8pY0rfEcnmInlCp6A0qmMdpnDbEldE3jG+sr/NxAlkXuuiQsxHIO0PWwXD76DA01Cze
	YVsDgokhWl9oh0lQ4UJfKUE/qy14P4PUrj2J7yeJ4OYK1azpeT2UD8d5Gq+za+0pzW4/EVydzZdvu
	5mshtogFeN5xHuVw+HfXfEUCGNtPDTzQxRv7QeyMkIIzehobo6dfHiK0zW7VDVVb5uo5Z2uocarpu
	8ExE61yoGjt3AAsTMkdMx4VhVPD0QPzNNL2C5UiTw/lDPd+WzWmbPUFUODdXPQ4pSnGcpTkZZoZa6
	b7nG51JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVim-0000000EuOm-0vl2;
	Fri, 20 Jun 2025 06:59:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVeR-0000000Ets5-1eBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 06:55:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K3Z1R0014509
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=; b=Vkjrk8oZKMq2xXIl
	mNC6vNs074IW/Y5LUKAZcX+EeITRGSzjKAi8JHm8JOX+iEh9tCNmfBPZrhWCX2Vl
	dJH13mhNgoewXPBWcWGiRzj7DkbvetfSwZ8RSpJ6OrCoOFE+WqIl9ropVyc6l9m3
	WkA7CPk60wYuVzFOOWF3qCBsYOvlEY6Q8Ydypt4lp+bcSb7mfUhypk5SNl0yxNhb
	ElX6TTu2wXtFGlIgKge8a7eAOoVC73FZzQgE0xIt+h6e/7QOu0gPJxy+Yp3yOhNN
	YBpwCSi4nVG/DYWmN6NJ/STY89laFZp0a7HtTXfy/J7qF7ykkyiVw0mo08txwsmg
	2fp1Ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7j9fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:55:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2354ba59eb6so24133445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 23:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402501; x=1751007301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=;
        b=PYhzWv5uSAoAz7dFznXhonlq83cCu7m9t3bW4j7gaNFFGYLqp8X2/R3NfgIY4h9Ahv
         Tu9ZIBZnAly5SSAfK6PKKIGXUAiK0MTvY6XGCDT4jVO4pajDw3mX3CExnpc7Pk33kQHN
         FcZ807oRBxpSI7FzWZbHNdQuiZ4Bbgw50t1Ij5FufUzBAoapeH6AjgoSoMH3TW4KCCxg
         PsFCDLCUb30olQzBbmRXothjoF+gqDMAnjnn9LCf9uLL2c2yVrRmVKeYps+w2IXp+kkU
         +OA7yRk03KxQDBGN/ndlNS0byl8nwhaUXTBsvMVmHNPGxN2a0Q0NtEYXtYr65EhvSQ8y
         JuyA==
X-Gm-Message-State: AOJu0YweecKLQY3fFoeo0X0KlQgPpEQSfcwt50UDfWHNPJOodRoPreaS
	FdoCsuQZAne3ykbF28n6kZMgO/fb1JhXdYe7nSTAlH8imfcPu+ygcYFwzmkjF1NkFAIt9YK7eV5
	PK2q0Izd/wmo9w367UtTncm2o9Ba7LiS+kiGpWYat3vhKdFhSEVKqVEmHian464rt5Nno8EtSwy
	6v/g==
X-Gm-Gg: ASbGnct0cfi7XJy6J/QYV5mpVRp2sARLq9eTSmNBAMEr9tqU/FoX8SJAb1nu/bQOIBj
	MS/vXRdsyU0SGWpICj8e5/5a2kZOVC8ssx01NE6U5DZtJULEBwvEasdKlsYFxMX+SvI+IkWGbN4
	qFrWlcpCFhNgjUt6Wuo0mVrW31wKnF8P4l2A7tzXg4uPtPpmXFiGWaNMAdFkk38jfqTsiz8s0du
	PRydZ+vHqd8mO9fk/HvU8jXTWnmIOEk9o37yRGiqFuGK4D5mRqaLGuzmNUXuAhtRGP2S/aFFJd6
	9+9NSqmtC/Sx8KI+Ksc4hjZ4+KslHGp/
X-Received: by 2002:a17:902:d58d:b0:235:f18f:2911 with SMTP id d9443c01a7336-237d980c6a1mr28550165ad.2.1750402500679;
        Thu, 19 Jun 2025 23:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMDsCNHSiBKMs1kY/KjnuipJmlII9kCnPO7IFtdMURRQwxNK64L+TG4Mrupen8/n1We9Zr/g==
X-Received: by 2002:a17:902:d58d:b0:235:f18f:2911 with SMTP id d9443c01a7336-237d980c6a1mr28549725ad.2.1750402500248;
        Thu, 19 Jun 2025 23:55:00 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:54:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:28 +0530
Subject: [PATCH v3 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1734;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Jtd3nbg/Ox1IZzmZs1FmDMcvo0C/VyluJ+Ezh9idyY8=;
 b=LjU0vVC1hUPqnFgJGxkwdrUm7NneephzJaIH4RMyAS1VSeQdKXhhIleM945Mr6+vbjpelI5WK
 afkcNVHNlA6Cvp8JSahtciGIKbP5f9LD41HiTH9T3/d5UKd14jd0GvC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfX3plhZ+2mTjdn
 1XhJk0vgwHffKpQ83db03wq99FMMV0jN1QwnaBGJqiLwyyjmIYUwBHuMKBqnA+unHsD4SN3f/vC
 okN8IwE47875LM5H16SP7fAHpOwYww8OiXkFC6w2Q8HNfMsYGhP99HpdJ9G9CgAEYniL9p50NyM
 zgcxZUxO6wdyhmYsyxV91EMgaEz3+ySrUSu14/SQuNFHm+Q1YONk8ZFe0X2FGOmybGZfKvGjM8V
 Nq4EYSgvI6kgUknUUNy3zNT3OyZIPF3EYbuwYxg6+1cxNhCvmI617M9KIkbGtTc+Hy3bsC5rvuG
 fjKZYkjsoS+kGFg6+Lk2viQXUQE9paEVZfpqL1stBq699G+KdrUGZkG2nPpzh05o9vdzMeiBtEe
 UwdQEFKV+tNKWUFgYd4ftJUfhD2Lwhuv22HquA77+Cv+sQ2FDc8Ay+fXzUN6byAmPtkR2/cT
X-Proofpoint-GUID: Xs-47y_18HcgF6rIsJU4E990KpNrrvd6
X-Proofpoint-ORIG-GUID: Xs-47y_18HcgF6rIsJU4E990KpNrrvd6
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=685505c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=PEQATVZ-5NWm0mRdv2wA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_235503_563638_8A004965 
X-CRM114-Status: GOOD (  16.03  )
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

In some cases, an OPP may have multiple varients to describe the
differences in the resources between SKUs. As an example, we may
want to vote different peak bandwidths in different SKUs for the
same frequency and the OPP node names can have an additional
integer suffix to denote this difference like below:

 opp-666000000-0 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <8171875>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0xf>;
 };

 /* Only applicable for SKUs which has 666Mhz as Fmax */
 opp-666000000-1 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <16500000>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0x10>;
 };

Update the regex to allow this usecase.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-[0-9]+){1,2}$':
     type: object
     additionalProperties: false
 

-- 
2.48.1


