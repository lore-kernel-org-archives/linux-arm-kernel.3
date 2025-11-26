Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD54D1118C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=jVpY6IauDB8z8w1RUEx6B6uEwl
	GVkJYsN0obKVsWuuaDYfO+ofS6PaPxaCvZZSXV8/XvR66l5H4QDFaxqSI0MRhI3G+IJpBC1RClxQq
	3BWLhWQQPr3PQAw4IlqNP19bhQNeAHbBtSXuL/UMWDDeNHlxISjGCEgAOGMpMX7fujS+UTM3HeWOq
	tJ1/WjhAN3sD2piQm09X4yyNgHmTxn516xSMPq8xPYEQewgUXXdfmYKW+eekSucaWHcamytsEIBS0
	VSaWuAurxuepPdZKmgWAHYMtlyIhkmwz+yfHqQgnyoSP2oXEVysUUxL1+fcK0rbkCgkkpUeLY/vcY
	2xssU3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVb-0000000FR2u-333T;
	Wed, 26 Nov 2025 17:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVN-0000000FQtB-2QAd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=Cyh2bLAAQ5te679xN7blg8NEPu
	N3vHVLe8tsZ/gOUI+yTCVqGlJIuZAFFbobTp5HBXvovuEGBONElag9S/qgCNEaGCBaFxO9xm2fVjg
	exXBwR3B9Ib/PP0KJFo46deK2mgZyo5PLSvWI5rQfh1jfTnrRrg/czD+VErdA4B0w+lnBWRkJkSLN
	XIkzkkkQlqdnaoNxU9+LEFCsDXVSJ8D34yteWCwuDifkvGNzwTJrDTJoPK5Ckvhl2Kp+a3YUeSlJu
	ARz9IjHp0rXaNuN6HxoJU+j0oJ3Ci4v0QdSWBmPQLrRzj62s6sKnCeHLTwYZD9NR1QP0nNEQ58yf7
	i+vwBi3w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdk-00000008WpH-0Orc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQHQf8j3666218
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=E+BqSqmbiaNAb7vw
	8UW6PwH67Z2RGFducWxuBNS8YDwBtvrqrchDotx7GR06oGLdfLhpM/c6AvzBBTsc
	XcA75/GmWOL6oR8/Bng/iHomcrsNI8ZCyrj4HciJ2MxKFIpxS/2Kn96oKZ6WtgRV
	cyUl1tgNA4c00CuhzIm+hR9Zv50ayRnihL1A1PfNZiTSyTNG8CXjk0koI2kYfWG/
	6dqbgFbjg7APbtTU6PyONswxE6pd7stYlDfKhAQ1DYNn398VdubOPedw7eosAZ4H
	4X1M4JUC0q08CjCsmlgYDzbjQT4edkW3/mItFU3q8Fg3hV4sJ3EMOefxsucNbim5
	M+odng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemu0va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e19c8558so1535725685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178832; x=1764783632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=QLnMGJVxP1OWUKIkuj+Zu+aiV4ZqUBvJVrCmJEzk0lvhOZOV7l1E52851VVCIWEI9G
         wvcMzF8rvt4F91frMrlx5dR3G+o22vAAmapzodot5PXW0yXdmsjcAoUugzumNfiP4Lno
         BuDLDOE5a/HxDLrlmES18MCl+wZCnZkrk955L4yULjj82CFPsftzX8I9iU+NuNxs+UHa
         Eb5HnW/E/srxZYZzB2/xqR4+9k2y1jHuOK1FvTLHoFkJFHanj/vD5eI+ld34oQFMV54t
         AkB7kLJffKEP2+TItzSeJRC8RJXIbb5KSr3fMMCJWB7ynvq306XtIFWAgfDKUAOwfOeO
         oUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178832; x=1764783632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=LIec+4XSh+KBOoDszv4Y5WOiu4Rbzz85+Mn08VKtP60dTQoM2O39FtHCjxDYBwllf5
         TcGONZxm0o5DFKuPhsMCW8QneyW80teWHsw+NexHRQelF64nHfM0idymUi8qoCvmxeAr
         TSieR4yBn/+6OxDWL+HeCRnvZ1CCP0BOmQkb5dvvhJ7no0r8kmjMEdoBZSFGCM3T2xFL
         Mi7/6ePh6FomRJ8zZsMQ1ntRlw6Wltliz8VsTlmeySZqi6nkdM02RpGWnqtBHcHoUSgU
         eQ1f2y8LPqNNSVVA2ybV3c28jW5xq0mT7yYX9BfYynkf10up5d0/5Ud2k+9BQkgPsqfF
         MdJA==
X-Forwarded-Encrypted: i=1; AJvYcCXq2lobnsgmpnIh25giKYNsOUUjtU/D7Sjg6TCmPNbpxP5ndnhOJuqs7jb2KueAcaXFud6jIO8BHxBpDvXbnLT4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnyd2fGoVDVzH9YUV0R0uMRRTPKktG2VsOhbSEkidAvC+hH/DH
	5fGuF6mE0oVI6V+AoQQjjMbQjZF+lwsQSK1+oflgA8c74/VkC1iBWK0QAtORQLYHYB9F7E64Efz
	GA4AFZGQHOOVGK05r6EjUtvdWV1aD02YwtkAIaw0jKvgyekxTC/m65Zvrpe5wVhInnjDcwrz9yt
	mdBQ==
X-Gm-Gg: ASbGncuErm20isO5Gk/A1AmPHLuldW2X7p5TUKx0ED6q+CGrHuimedv3fkb1ucFFbhS
	O3Pl7wX0g6nk99aM9YIHHupEV0sHKxawf7Ty6QTheb3pR9ccpGIzKOgFfkRN/UDZwV+mTh/FcBd
	kxDrhcJ0Kr1k5AryhptFFkWabi4fcKIoegk0gQi7R8FU3jJXv+gKkTivZGhsBiyRQStczBMpVMR
	QyysqiEVK+WWcC0g3b/4QwrY2zDb/tWjVFcBQ5Z0mJ3yK9UFyPa+1n2FepwrasQW/gKHrYGlzeB
	frDcPOBE1ZVtWNrdFvZlfuBaBvcfkWX3p2furw3TFnmuzG5P9oy7IP55We9he9qk+7Q+0O5Wp0s
	CpZ5xO5FfC9QdWhOrCuWZVJhi3MPpsUpdlQ==
X-Received: by 2002:a05:620a:2909:b0:8b2:ec00:7846 with SMTP id af79cd13be357-8b33d1d100bmr2726795485a.28.1764178832015;
        Wed, 26 Nov 2025 09:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbqjKB2O5sFoZAhlM0Xp12Fq79ZAX/1usQXGn4gK+ya5/tETRvn2zPSCy7xw2177LVeVx2DQ==
X-Received: by 2002:a05:620a:2909:b0:8b2:ec00:7846 with SMTP id af79cd13be357-8b33d1d100bmr2726791185a.28.1764178831610;
        Wed, 26 Nov 2025 09:40:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:12 +0100
Subject: [PATCH v2 8/8] regulator: pf9453: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-8-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmZwf+gqSZxGRRmKDKGj7wIJ5dnf5CYeGgO2dqTIhtc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzuAy4+4pJL42G4NnFpgzf5sY9W3LscY+MVSN
 MQ99It4xk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7gAAKCRDBN2bmhouD
 1+EED/0SBwYzE7RXfH6kNNQOVHrlmegqHI8oD3Wp8oWC/rAteI3V6KVnUlW+pNM9N+/eF3v1WOw
 3EWld96KEMWs6ha/2f8+6XHKUvA/y1NChDfhXooLoxhwu1OJSWOcmeV72joeqc9m7JdpF07zH++
 x0SxMUUvB0vIqq+d+EfZUPhvxxyYJvntH6NIAnl28Ahtq9Lcwar4OcgDzcOi3LscL7/p3STeT6Z
 FdXMQuUaSc8gQUmed8XJ6APlO0OEP6ZmcvNBaSr3tqYgurmKrzIjzOuqS5MubAZVOBRZ2BlNEUl
 dVGG7W/BB4SjLtFiy06wBW/aiu8nD5yoyNEWCXWDo0iSuyll0f94EuRbu2kTsQ8Jm65woX+h11G
 QMbbFTFA7ZbgrBhMFl/6KsNCISAYRk8l1kxIhLct9zx7f3f2Bv2ilaxH943wU01Y3dTQU0O54wY
 0mqqzHGwM/yJp2z7WqEBUFSJOIdJnEZnU0PQlpI89/LO1WTOzfbHfVpBbFBtB5AwjKQbEXKSEF5
 DjyVJ5SL2O/STz4sPT7fJ2IECzJpiBrj7vS8gUi7zHzxsavZHHYXTqMG/VLMGbommIyvwE+07Bn
 rhXhx2v4M2fNmRO0oEtu2b+3tEqB+RcyDqXVIp9Ax7tdzcZDH985n6PgnMcf2/fKQMYiWyrxGKK
 vSGcM6CkTkD7XaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: qIlE9LgjA-TByqFVBCuowFo01krgA_Ts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX1SrBj2Qh/vU4
 fUJ2csJvgbeqy5ohnWO7Yrfho/6c3u+0XB+DRIgQRsHSBZmr1VTT3rvMM3d8nzqPHDn7BTo+gpD
 q73MC9rskPrlZaH+l1Dk4QUyuY/ApAIVQ1mbZUiohorUhHgco+EW0VQRwdGVAfrVlX4seVEIzFL
 DLQ91XqyHMmnRvt+ebMosjXmgmZ5TLjMFlgTuWZf/e/18j0IFkqmDt0QX91B6if2zVfoHa1Ch+/
 hwD8yaWLokdRq0FR2IsbnPzMmDZsRK6G5rx49c863ei9OE8yYwm5NccjbjVyynW7cYdM+KHOYXu
 TYawMtfZX5VT2325gb3iB/lb/TnSuMop4DmMExC6YQHyoz0i870eLEEtKKI3Y5/kakYjgVk/8n1
 4vmLSOaFQ4itjOkZJC3H0bduxl/qVg==
X-Proofpoint-GUID: qIlE9LgjA-TByqFVBCuowFo01krgA_Ts
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69273b90 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164512_533978_890B76DD 
X-CRM114-Status: GOOD (  16.85  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/pf9453-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pf9453-regulator.c b/drivers/regulator/pf9453-regulator.c
index cdb80f9d1bd7..779a6fdb0574 100644
--- a/drivers/regulator/pf9453-regulator.c
+++ b/drivers/regulator/pf9453-regulator.c
@@ -538,7 +538,9 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 static int pf9453_set_dvs_levels(struct device_node *np, const struct regulator_desc *desc,
 				 struct regulator_config *cfg)
 {
-	struct pf9453_regulator_desc *data = container_of(desc, struct pf9453_regulator_desc, desc);
+	const struct pf9453_regulator_desc *data = container_of_const(desc,
+								      struct pf9453_regulator_desc,
+								      desc);
 	struct pf9453 *pf9453 = dev_get_drvdata(cfg->dev);
 	const struct pf9453_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;

-- 
2.48.1


