Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75898C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7upYdJ6N1NsAA6K8KEn3cSwjep8M82X8zV+sP22K8jk=; b=QiI1F2T9yuPRUaXVVoEQGj29u9
	9Ih7WdCqrWCX05tzM4OAeV7vjOTRmOvl15V5WlIzzvFplrrOdzBYWw/CLpdNUoujgdwBmCQbVUMKt
	RGsObmqHyGp9qWWKG2l2lYv7b6ZY6hsReTdedm76CoOFbCr0qVp1kQQYf2lVn/Oun01GMRWJwQPnn
	GtJ3Bm95OoT9Kv6HJSR53mGp0aSHWKwKcQnmjufrIm1Ed+WaosdpZ03/2i4WdI+8OmzVZkwMyxQb+
	oD303CiVhHPBK993dbFzQ8yHJ6LXVKsZT0Qac/6jpr4d5QoPLRX6KI9gCgSRQm3ZFTWLziEHyrRNL
	llAUEzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX1h-000000061jw-3Ymm;
	Tue, 18 Mar 2025 13:30:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtV-000000060Lm-2B08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAq2Cn010333
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7upYdJ6N1NsAA6K8KEn3cSwjep8M82X8zV+sP22K8jk=; b=d96vf3+Nyrwbkf3v
	IxFpEpsrzOzQK7/SLK59qX33IrMkDo1YaPNHntbWXmgKgRe10oSARvD3oFftUkCH
	Flq52dYs/1eDqxaCTONHF+pMT0sKBM/5De0BEF7xIPgQaVgCvqLGIEfqW8T5ub9n
	UBOb2ZHQns5UHcYezcLyT3WKb7IvIu0HA961QW5iD+HZFpn31j95gc0FvAKrkMxP
	vj49lCQlXagPq7uKiPAbovjNlPUPcJjKvHHJlKe15iZkhOxMsKL/dZ5jY0tKqs2u
	fe/622IgiG1IdGBeqY5ZudeoW685gp4fNLoPlwXuCoCwox5ChQJLx11Q4G1kXzS6
	uYQmoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx3208m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-474f079562dso209598181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304128; x=1742908928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7upYdJ6N1NsAA6K8KEn3cSwjep8M82X8zV+sP22K8jk=;
        b=OzW5jvK8odfHjfKAgtbDuRX8oSRjzM1NkRJUNMevwYepdCNXAQ/YQ2y0Ox6o3l+U3m
         Wy/GewbOzQCzyzV8n5QxGwkNO35iv4k9JoynXM6K7Orlr3ejqw8P1+brlNFzwXJ93fpQ
         EQwC0adFEb7NqtOmb6MHjEHLxOH3/sjApqBLxbpuGyUmO8l7cCytusiJZZ1ZHiFjnvlf
         D8S8PJjCu00vgkXn1zm2D6S6dunVt4R5UU6HIaH6tVfv2S5ff/GYZ+MavEpsqeLIIg24
         GyjczlaQ/hWblIj3oFBIi2oMpk6Aoi0ogjJJ4m6odL2Yf2TCB4e913RBtWBfd5IlhpRc
         Gg9w==
X-Forwarded-Encrypted: i=1; AJvYcCX8GVhfBI1m0B50tG5ybOrs0X13XGGUaZHNrXfR6Mt6mGKmj5dldehYwC6gZBH7wd8noPEQ1Ts270AJP6R5Zjyy@lists.infradead.org
X-Gm-Message-State: AOJu0YzEBrEBU/z2z6J2v7wIabDf5fvjFTGzdzFAhSjqiYF3JlPBvyJk
	+aAQB/aU2dX5NP45W3Yf21HNIqFOmryB+lxG/eUvUZ0EM2evgtUDTWRS/2Za4zqFuLqaxKNYezm
	uU4PFaYd6vk7gzbqxzRqJWzBOuXlEhy20mQmyybThHqLXlAELGpeJrsThxfRO+fMy8S6u/Z5w3w
	==
X-Gm-Gg: ASbGnctlTyFtHn47qq2bhHK2DRm2LFeRFWyHkz70TrAp5ouH6WV0dsohfNt/fES4G1S
	Canen1QcfrDFJFDhgd3PYY62/G/873DQMcO3enZR448+ZBna1V8cS4xI0DX1pnX17wq5Hth5Lie
	VPKq4QAMGfwKrbt6bq7oOtz7poOsy6DfESyJfLQojXTbaBeOovr6cgQd+2YEc3SV4mZV8JjCXxH
	eKeko5Y4r94Udk88r23UXL/Pzrs2oMjBOjJDwFLntL5LelTX6KqUEi4Jyua+nO+flg6y0g2rK8K
	fKzb3A+GhsX0A7h0K7LjF+IidxfscbjFV3FpF8AqgQvpC3nHJnntsxZ3J4N6wKkkxmxISO6RB7w
	RfddZphomQah3X3sAzpNoYoRcisjx
X-Received: by 2002:ac8:7d14:0:b0:476:9e30:a8aa with SMTP id d75a77b69052e-476c81b8083mr237297291cf.38.1742304127787;
        Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyjFpZgE4AvVRtmbsyhAdFg8jsqIKxx0eZ9NIiT1apJ6WBsEKHhpnpfBGf/aSEao+g0riIZQ==
X-Received: by 2002:ac8:7d14:0:b0:476:9e30:a8aa with SMTP id d75a77b69052e-476c81b8083mr237296911cf.38.1742304127430;
        Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:57 +0200
Subject: [PATCH v2 04/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-sps-sic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-4-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BRp8ajWiZ3GoKRS/wFU2oNiCDwEre0XdpX0f4IeiHvE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN1WbdvxuNPjibDFM2fVqXm5cN9LXfh95gmK
 NG/CBLuHLaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1coNB/4j4qf66Vdg53zrAGhVZa9Tk/yd2qYYnPAaO2sqDfaZwxpHJKCZ+YOYVBQi2P9yiPAOOUR
 uDf9GVf78TdxK5ZWe3OxPHkvBDW6DXlaFS2w8bySrqpyGcxZDVZwT9LnD8QfLSEI73LmfSRcDhx
 0m8c/0wFJHcOfj+H/vrs05P80MZR1xrHKh1r79bhLfDEajwLek2X7tN4gVK9/XSG+s/71bwxf9w
 J/rexdi9kFAoE//gdW+xVpjMZzX8/gTTj6pJF6vxm+ve1MCA60IK8mlZ3aH8WsPaCxrHGW5/JXC
 UUhB+72pCgni91F4HxSBG+SRmJe7NTgzaWH3vp1CHFhYzE5r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d97381 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ECSAUwpVvFTYNHoETi-DL08L8-BFwcQg
X-Proofpoint-GUID: ECSAUwpVvFTYNHoETi-DL08L8-BFwcQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=727 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062209_569857_665F535D 
X-CRM114-Status: GOOD (  12.40  )
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

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm APQ8064 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 2836e4793afc918067d3ef93baf5bc7096f72f12..0d2530bd05b8c114232926e3ba8b0fed99e276f9 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -95,6 +95,7 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -195,6 +196,7 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5


