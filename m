Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDB5D10F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=; b=3G7AJWxWWMVRwXC5HYRBXqyti0
	3lXKCj1wNjFQNwWcOzd4cBblKZL2qjhQxIqpx7Hz9j0dAOCeODBql26XvuOxuQmOnYKmJisNtt3N6
	H+0lWl6JNLmATuluMndPm/yEyj/K/gHwkLjPD5r1bU9XOnI3gPRHx9XXsy0qxOMVt3zS61SGUyot5
	Qaf++mNBi7t37XrxaU5005saNwcnSysHo22hYBQ3sCTo806QdTHAdQ0xrETh7SCypsfnZIvGCEyAk
	43/IW/du+u+g+CVX/cYVXvSCa5Czu+7Y6pQmPJQw4InwE82U1+AvzWR33Z2AhrJ+WcCe4V+P6/7ru
	8A8DOkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKAW-0000000FUeb-3roe;
	Wed, 26 Nov 2025 18:23:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKAU-0000000FUdl-0HyS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:23:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFHnHR3738976
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8
	036RW3n8=; b=O3gC4FKT/6ghTBqt89NGwUogfyeq72C795ge7u7OIMuKySooCwo
	IvDc+FUzhEHHRO7I41JHttbHTHQ0u4git87zBc2sShc1O+WhSyo062JM6/PUvO4G
	Itdh+GgvMfbfNq5zl6iHeAFJB/KjCHHKE9svvzs/q5tNRlMNGhZE1IrHT7tz21Sg
	LnRekNma5Z4Uqtn7OUGIWQKVPlEAjN9oSWH34XvK+rsBUhAO+EZdhqvEyUJSP/lV
	qEWV1fNO63n3c+rpVAZLl8seXY3NRV6bhn5ZrvHFdUhKmAdVPt/oDMPZf8sY9L0w
	I0phSscHwpG74j7Kfj0h70WcZloYOu3UxBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggykt36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:23:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so6667785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181384; x=1764786184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=F9k8RfEY/duWFK/M31C/BUdJNIqgpg821imkSq7LDb1VsX9t/Jn2eULnB0B7G6/2rK
         6CvNMMcUHzqib+ZzBFUnYYj1zRkxlFtpZcEi3uUZOKxLz1lPpzwSsFPC8tL0MFbgDjRC
         FZWasbB3zo+Fa2PMtPm8FskvCWD98AVg9/n25HoTfyEU/uHp5DkWeh+M7yorMvhKwQ3H
         fig1eM/XBcpir4PkV5KkMwQPnBmwsEnepPpSI2qwLgL/pIQYeAxTVa+KhdMaQvdPAJu8
         YZyynlhwiUXdrQKVtOKtcb8KHkwcSduBrk+B8nS7K+o6AiI3ZoMETYgdkOmBu8AEAu39
         dm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181384; x=1764786184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=NPoQjPp+CrZBTafqzEwnTVzWUE3t/0lCs+U7zkqX2ahzgs+6lt0o2jl47u2SofBx7J
         SE2FohWRGsmTJmg+/TA8MTmPwAe6won7G8w3ltlcv689ICCFkjGrRe7j0LN5zSiwdNoY
         QdWNe9qxO2XDeBlO0rZWe8ssy2aj/aipdg1kkg1AzTxFgZA6Vmcsfk83DbltHmSbhS03
         sHWB7Mp6DqvZANmZzn5AmFnVO5rjzxktIETzT6W5s4Sj3WNbvHrH5kkSAc7aJDgwYtmH
         WKWPqXEKmRreelyesi5rKWQ068q77iacpjwsJJKCToNj7Q5wvUir7yj0B0J/+3GK99b7
         yxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRroBsd2FPBHicV5NWwThsq0VomUVE/FTlab6mfj1cjTDTAzTDlX6QpH/orhk/j7uKiw9b1GOzmJh6qtIdCvV4@lists.infradead.org
X-Gm-Message-State: AOJu0YxNV5Ijc8haL+TXr3RghZx6qbetmhLU5Zn4U/RcARjbkSR2VdpQ
	c2nV/pwrdx1bHLDsTrUf102VlG3i0TTJwokJUGO53e1sdsIm53KPn9K9I81aBjNo4dihVO6FN+R
	t5wuJXt4hP0jqH0hqL3bZ5TZCMAY4AEeSS9Xhfxr68KbaPasl0yqq6dT7FEbpnOoC+vi5OscODc
	1fnA==
X-Gm-Gg: ASbGnctj9Qxbo+zuGJdk8Wl0PIQHpNcGWoZSi3GaxY6ueo1RP1Vduj9L0c4FV9SZO4G
	i2u/t36Wwo6NdLHIrBLtCLV5UfT2JcRynnRCi53JzJl7nzVzZbIlgKS6TrJD0vVacs/ECMLPyMH
	twuDHUs5p6okoXJNADl8xuZm1koWGTSzT2xqhPb3DoZ+4FK1g2iWpRR7zvgOOM/myriA2Fde0qB
	MW+oyOsQzVEv7cozFLwuMz6LcJmtt8FlBBIXF5NBvb29PRFumtmg6kkrsrvF3hxcvitHhx1Clv9
	OWwfuN9ecyPK+ovUM+sFzMfcxG005ma6As6+PsMFiuTQQvdrc7390UYUesBXZJg+uDTLAoPk43F
	m3k0Llhow8j8yNPADqPkzuphpjXhK
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555117585a.45.1764181384154;
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDOHb+nGWB7edLXVL3nT2Zi3o2R10JG4cWMbkYw+mo3CYHYakTXwoxRZ4cxy/DzgqTRgGE5g==
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555114485a.45.1764181383764;
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:58 +0100
Message-ID: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ItbjY8O7VYi9QpPygtP3VgaAj5I1-yDP
X-Proofpoint-ORIG-GUID: ItbjY8O7VYi9QpPygtP3VgaAj5I1-yDP
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69274588 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfXxMYsB0ofy81n
 MSwngtkaEzN7UD4xqCvmkFPrZHLy0D0d0YawvanGOtTQ0dFPRGh51RPgAodBLI5MsUjEkQwam2q
 Hw6VR4Yu7WwVl8GS8cipbNCAuiPHhhI+VjIZpDTSRgc8euAYwW/phynqXVgMo8T/VMvRgJ2I4t1
 AF1HtJ/J0A68osGmkz36SpmGe3TIzNmyGMVlreHyDz+//+x3HpM3nrygCgRZaDju8tuphIN111g
 vgnEQ04MfFixwtMSPKFydPUI/c/1igU4u6+AVuq9sYE6cXIaMuhNYBf4ogjayL66mogk+y1h4ff
 NnJBPGdFoNQdhecIIB9CzyaAkme36D/tauMA7F/zuQ3so+5lU4GxuW6iZJEL0QNg8tPXeAeIgEM
 pal5hfoH4ADbdx0YtjX3A+y9ZV+iKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_102306_238230_E3033E22 
X-CRM114-Status: GOOD (  14.66  )
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

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-bcm-iproc.c:1102:3: error: cast to smaller integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

kernel_ulong_t is the preferred cast for such cases.
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index e418a4f23f15..b5629cffe99b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1098,8 +1098,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iproc_i2c);
 	iproc_i2c->device = &pdev->dev;
-	iproc_i2c->type =
-		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
+	iproc_i2c->type = (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
 	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.48.1


