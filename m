Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8749C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kHN4m1i4fZ9hfNrrNW/cU4TdZC3J0BJV+UC4pM93O7w=; b=BBlW8S0SNKQLkl
	02ZeBKHhiFZrRhfYRfbugSK4bN2sQBZ5sSsxhF9to0y04Z173uJOlxOyN/FU7ThKM6V5djBvOy/YK
	ycdWM5fTZfG+Z5ftW3YaeWLPUjA/d22BvSzzr+Z5IjgjkcdACXQD+7FAqhXg/1xw4j19mbn0c4gxf
	TZnD4OfDCByYUPFTfEeoJYT9kLdq+iLHZXPT4oTYz8GkxcC97gK2cWLs2FGPs7gGuY/Z6gCZJtwKd
	bW3tyh87aDUDTKEkQCSpqsAnka7LA2lRKr5b242HZUnN8Lol6GZHbf8+jEuwb+C5tO6kfvGZURCK9
	8DB5px6kxewYJ1Hz42+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oh-00000001Chb-2l5Y;
	Tue, 04 Aug 2026 07:17:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Of-00000001CeZ-0iq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:17:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67418SQb2265281
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kHN4m1i4fZ9hfNrrNW/cU4
	TdZC3J0BJV+UC4pM93O7w=; b=KXbKONuqoIHsDYQfmg1pF1W2I3AtqZXbqPoW1P
	SfK2N+9eqsO3ErKvLj/3Rojasp7O+J1w9J4z1UbZ2nMyfQTvI5IevuTVzghfTMHU
	aekbH95E4yJrhV2O1dS5aWJscs0Ts4/FdNhf/+hjuUIVCt+SANI41wq2hOkBQVJl
	95vZzGBMu2JZ9VmV9Z3ehyQROkTtYq7p60fGTZTcLLjtZl4cHfG4CQVSMxJ0BHcX
	aF9wAQndmz3eTTCOWbHD8bjYac8y/2RNbHDgcjDA9WppzSUKkXMPcnTY1EFFuFSQ
	rXlCM9k+Vah+6jiGFACR7W6zApW7A1pztMbsOCvDr/QryHMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sb08t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:17:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so88992601cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827827; x=1786432627; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kHN4m1i4fZ9hfNrrNW/cU4TdZC3J0BJV+UC4pM93O7w=;
        b=THv91D3w1gmqVi5LNNK/3BJcnTwHsbJpz3WDQozJgXlDbMxdTy9CMZF1Qpkca0PwGM
         pCxZY/6vaIOYpaH+UmhZG6786ImOXtvklaj5Qh1dShTS3m3qaFDce06f8N+rJMCyl1PJ
         LOPQ7YcMqNhBEitgE9GacS8M++k/k3Xkm7PRTq2rh9eXCNNfaTWs+88M+AtJHqAV/uii
         sBUMairX8wK5LaF4CXlBfncjfGoDDj/w8Qq+6XlvHxuAyHXGDz6gcL5emeD7/DwC0EG7
         Yy0nKryp+tWy+OJtHBzZfI/d2nguhTUA5yhAS2/GkPM2kIMexE+BJjBrO4DPsyImdr1X
         7FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827827; x=1786432627;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kHN4m1i4fZ9hfNrrNW/cU4TdZC3J0BJV+UC4pM93O7w=;
        b=FE6I/jILELRnzlAVn+PmABhsobtw60OHg9KZJ4LR6y+tLyacW+TNkmw4vrR0pNPUS9
         weRrM8Mt5OrcZd2XOEqb/WzV62uR8C157apVOCNbwLz4YcFxJi5IOKd4w2BGaj8I7wJm
         FgIyBpQo6kp/pzhnnHOAucng5unEfHmcpC29ekDiQQCk5Sl6/Gcr44kXMNOjWz7z0O1r
         8Z+Bci3uy5K/N9x+e6s/mpd0bqp864KBgSKXm41zBYCmjipgHzHHrzxHOTVLhwzpdWBb
         KpQpsJ7co4mew9zzaBW5/B3Hkqk78VoCsSBq9n27iCZcZJ27aOfDasOZg52oRTFYSOan
         G//g==
X-Forwarded-Encrypted: i=1; AHgh+RrANBXizvvOMLhHrI3QfZp2pHdIcO/fKXHne1q7n8beeBLDpSD3VDtbYn4fWwC7KmMOpLnnrgTGjHUDFBokuF7n@lists.infradead.org
X-Gm-Message-State: AOJu0YxVrgxjeQkao1m1evjxFfpqb4wTg/ta/0oIBCnpC+oJUI3bac55
	NCZiBbUG1HfN6Jrue8+1ehcLiKKerf/1ukH8sRdtwnqy+7TDuNou56We25gCZ682UDXfTatc/vc
	H979mQVQf64INNNdAlk1Yp2k8pkBZ8ltXLQ+a1hsIfRKMwcJBH2S8H3loHFGXgudJv2L0y9TUPw
	u5YA==
X-Gm-Gg: AR+sD11ijwX4J1WBEe1zm1mCBGSlzPfSRd1tY3+0e0paGpnriwtXhDMlfcJwuGUGXcJ
	rbeHLeZDqZRkGoGTuvmIUDDO4YFysazDdVT3mY4wYPKM8Ji1qAmWslUEEpWgTF9nVfo0b+CTSDD
	hwhDO7vCkxY8GRUsQHT0YShhT1Fh6zH2NwHy5gX3sXNZWDaSe80t22hkw0DS7MZidIOmPlC2+TI
	AH77n+lIs211sYxjiMpTnHKo1m46+nHUm3yQou419kv+5BMKNiGOJ9ox6yqgUYNqDE8bNfhxXHy
	tsgp+Si+R1Jlv9siiBbYn52CzQlyyY1ZLg9wzcMj9FjkUz7uXEQLd4xGPCaPRb77EWvNVmsbMo+
	74puPYmneKhYYQkuXVetuK84P
X-Received: by 2002:a05:622a:598e:b0:51c:981:94a6 with SMTP id d75a77b69052e-52b5674b67bmr262412761cf.23.1785827827121;
        Tue, 04 Aug 2026 00:17:07 -0700 (PDT)
X-Received: by 2002:a05:622a:598e:b0:51c:981:94a6 with SMTP id d75a77b69052e-52b5674b67bmr262412501cf.23.1785827826721;
        Tue, 04 Aug 2026 00:17:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] spi: Few cleanups while looking at num-cs
Date: Tue, 04 Aug 2026 09:16:56 +0200
Message-Id: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3eKCTN280lzd5GJdo0QTw+REEwOz1CQDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAIMz7PBuAAAA
X-Change-ID: 20260804-spi-num-cs-2a41ca406eb0
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ls46oUW3bm1glu/q7llsd5yplMkVIyezxYsBXy8ZQ4I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHqBPClZfpx1wh5keQDr3zLrCGUMiLQcHA4U
 Zegl36y7uGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR6gAKCRDBN2bmhouD
 13xBEACVxYKsnpFVi9D/eGa7cEiCkwXQkiARdpJdGupvhnpc7wn2ew0Fa47XUSOn7TY8c7ES1dM
 OffyXqsuAzvKWCNnEi+XlD5/tBr63if31kI8qU5OChfLHackqYD97Nll11mWmspja1vHutsZCiB
 qZzVBmlTZJzXPCU+RS8JRiam0Ju1jV4K4Ub9s5WiB7qAyo6Q2Jwf02gWD5LWqJTiNa162HYuHvP
 jl3MqLIeXLIR6JHh+i/92OZIQIBFM+C68zfwlR6FtjVp3YXeNc63dQoCMjAf9on6+updiLJ97y9
 be7yhr9GKCj6tVG2T3T7WHhH83KBzgaDiGQS3sQILTFohNrGnB9oQBaipibhZtkUpDfkxFKqnKO
 Ha8pu1ap61SJS5bp4VgT9ajX4BsV3pUXO4opjafzfo4AlH9sZt8M5oNkFnC09B19Qmk6LxigqHj
 6zNr82vtoITYOa1JufbOpf8i+qhszFl7XYvP8MZv/zqRXYu442PIQ0LQA3AiToxRDhcmvgAEUdj
 +X2dTpftGN2ZIY5Y+CRTOqGy0xLCFqI2qMcVSxCz4LhaxEEgvkYy1uxeNcfXk/HXgbpFq4hM7A3
 P3qwmgyMi2Npu9g/FKbQHzRRhv9Lrp9NQOp5e6CcDDB/fbm6XPuGmOikJONdvZo9KvB432nZjue
 ODfKflWYf9ksuPg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a7191f3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KYoR_bMC0TEJ0A7QCGIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: R9yuOGsycwzH4isXo06bK4VvKo5oMfkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX9rZakrSy9ijS
 8p739mqodCYMFUB02QZLf6nVKcXFpw6KucSSyO7Zce/FvIosESUR7w1JBde0Mf2dw+6kFjKmdgQ
 s68H6la31vgY/6A5x58vkWjMXeL7nQueCsdQjp1m/3lDFlziRJicdSYlfrMbv0vghzcIvreAyjp
 XREImOp+HO4i9h2+1gaexnyDrIM4UXstjHI0wWYjf1vGnRynYPza2JNXN25BrE8vqP3q1vrUBOK
 KeIucDxfxZbNgaUahIhvHAPmq5r5iLTTkXBhgR/vN3W/rv4j0SuX64jZauDQLoMvUBfTsSTEw2o
 6qAJ+Pm8Ka/Wfxd/qazoR7KE/OsYBvgKGbJa5VOpErRLlIuSAH29P1aBFuLo/s9Nv43dyCPMEQg
 1tZmy+Vi9bXKFtt4foOpX8kNyR2dRy6pObrZRPmIB3fvahWQPvKccX8p2OebTPGc+g+BcSKy8yG
 cJ/5BsYjpGPwDaEKwHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX1mjEoH4rFgYt
 EQldRdUPOH0sobXzy45VhLvnC2e6fcM8cT6W83SW8wV+RZy4cCmDbbRAi7AJidRDT/GVDLmdASK
 zbz0jQWnEsvT9lk37aT7jHs4U/zKpog=
X-Proofpoint-GUID: R9yuOGsycwzH4isXo06bK4VvKo5oMfkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001709_624173_9D81FD99 
X-CRM114-Status: GOOD (  11.11  )
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

Few minor cleanups for DT bindings and Andes driver.

Patches do not have inter-dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      spi: dt-bindings: andestech,ae350-spi: Drop redundant num-cs
      spi: dt-bindings: marvell,armada-3700-spi: Drop redundant num-cs
      spi: dt-bindings: axiado,ax3000-spi: Drop duplicated type/ref
      spi: dt-bindings: spi-cadence: Drop duplicated type/ref
      spi: atcspi200: Drop redundant andestech,qilai-spi compatible

 Documentation/devicetree/bindings/spi/andestech,ae350-spi.yaml     | 4 ----
 Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml       | 1 -
 Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml | 3 ---
 Documentation/devicetree/bindings/spi/spi-cadence.yaml             | 1 -
 drivers/spi/spi-atcspi200.c                                        | 1 -
 5 files changed, 10 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260804-spi-num-cs-2a41ca406eb0

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


