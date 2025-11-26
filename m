Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD86D1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=; b=i0nKm8L+8WvvLuS7rDqNMesf4T
	NdQeD7yuwyUMvawbq9wI6ln3pR1uWnz8dbviwPUIOL4LaOVN8GJMt/P4KaJzbkYPu8qgEC9HrtmVn
	grSCm1aXSNdDuBSGoXfJJtZF2FOKO/Er3bjB82QVTTQMJ2mJlmqFHn0XIU2GCf1nkwxOz11SjoQhl
	RBN/4xeIZJoy5zqEY+vQHrKpyleKgs/ZwKLMdz3t5teoGuoR/icLNPZPi359E5kbN55aVhsBEXnAQ
	nc2hBvmOWhXz1+Gdm9BYfLMQBihdHqXM1eWt+urAfu9d7pwi2TNrPBpLBBSBT2YPkYTNfE2JoLTDe
	R0I8MMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKAb-0000000FUgG-33zM;
	Wed, 26 Nov 2025 18:23:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKAV-0000000FUeD-2DtW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:23:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFEJ9h3738620
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+9vRJxvQ1t
	q3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=; b=eK1YVoN37dVGXypQuoUFAnIJ8cn
	4ZN8jLi86Uf2O0eUEf64Ov0M+R78DEMFeVId2uhvSgKeBNZiE8LsVWuXVJIlX2+K
	d2a83n2oH19tsctUUwlWiV06dR/9Gp/oSMrYdpECEmRL0xQ2oDnIBvr82he8WfZO
	8Moo1U2fa/ANk0aQGZ6olHmgAsAnUafGRCQ/ViqiF/NOY1ZHIXcF2tlWFhFNiqeN
	Jq7R7xKmLVibbOkKwuUhSA4D8ogt7Egx6dn6290knSdOlPHWbExZ7Tu0orajxDSo
	NttKaNkSjKX5duXTplKyOCJ9jZ9XLHuZMxSGvi+avbs8YMfWQM8Iyba7pEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggykt3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:23:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e41884a0so5364985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 10:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181386; x=1764786186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=duqgVdPopiun4+QfhgtQl5ZjJtCIceP5aQ5u7y9en0aqIizVTbCCo7+crhh2Q64ayD
         L3sDFxFJ/07DcMYvS3AyvUCCr/FIqjd8PhF34Apc6cckXAB2lopotQ7xh++hqkLwLM8g
         T90IBEI2Fx0LXTMTw+4/aJv2Jv+uQ8sy8o0tVhe9dEDF5m+AF0Xo7pl/2TZw6YswuCy2
         n0SwKwhk/CaGZHl+0i1E080Rq3v1KK4KB9MCFXdqzugTHvBQSK6NZGzIrXXUtCwQdHZ9
         10UQXJ6Ir7vzAgHAo/tSLwsBTCDlUZ2v8dCAtpf73BDXtpBhsJsdOR7e74JRUmtX7fny
         Irsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181386; x=1764786186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=FGrKFJl7+BBsMFvPQklfEFRIqW53sSwud+GbL+hgZf3UssJhK2krKIhCLowF4AR1BM
         70kSBuI2+Ya55aMnUMbSGRzPryXHVdCVybOegLSMOGLGo0XWu9stmCtPgsbHhy14fIoh
         EmADnj6HTiZVZUFkHlKxqfBhIlbTltTIihMG+tbkvQuBaxXFcgErHdsd/bb2WgDzoSiG
         5SWQgFnGKOtsa5GqPyhDe/vQaDykmlJ/wxVkTTwXJV5w1SvEeOftzQ1rkiw/SOg0jeMQ
         dlVTn0gVAcUdPbEWRqXFNhUG3vt9SzANOrFTOuQ9sf5J6Qc6Dlnz0z8j44jnMUJTAFM8
         2NZg==
X-Forwarded-Encrypted: i=1; AJvYcCUkN2U4KB2sr9VCrLIgpnOEX86o8tjpmOzCAcwVsZyHLEhy/U1XZCVYF0mp5WUmZ8HUs/f1rwxMfulXwzK0kZlN@lists.infradead.org
X-Gm-Message-State: AOJu0YwadZdZqztDmLzpDeTt8OitXL1jjGNd0AU8puKEaWK7p9XM67VR
	DKEPigpHbnSEn8+fiqu+0p23tCAdo+41Gqeuv5bekB5psdcn45C9dl5P47q4lExZtW19VcPfmyy
	OQgpTFoHQuvLfDUsMdpkCDj/AN+tHhxzPazzZrGS07JBmE/y5tcLwm2gjXm6dyJwLSHlmmU8AjI
	KnRg==
X-Gm-Gg: ASbGncsxrvHGPprQLrO4pfwV877XfaivjBOoWNBMrAO4LcHXbVg0g6PLzejjhxfKqFK
	Goel6V49VYXtm4Grb4uZ0JueprDdxeyRjZGELrFUp8vwyUJWRKZrhVYieg5Hw5YnPNEv8Pf/BaH
	sZXRpzVFx9yB5abAfZlcCOXf7qvIPgwO+NP2N4eLo51JWKKBlx7hFqO8GRaPm5mH1qqS5BEAy38
	0snRQs4nxNTClbov11xohH1/CJcFAqK/NQVfk6DDsefHmC1HkoY/SCSyrMXIwZxe2Rmmlxf5yF+
	PK29cKKGxc7cyuBQ2IDk7psXDMFa+hhqVBjq6QeyEQkpRGyUFQDpYNWYI/y+st54VQ3u8E/RttG
	msA5C9BcMWMqgIehsQCcXbSwgb5+8
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654388185a.29.1764181385925;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAA+ANOolUOJpeYZQNlTAvuu6BHx4jvUZDLcOS+/JSPaaolDrtSLNNu1EpO7HNNR3BrnQAOw==
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654384885a.29.1764181385500;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
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
Subject: [PATCH 2/3] i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:59 +0100
Message-ID: <20251126182257.157439-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JUbs4Dl8db_lBCq9BAxCr-tbgDxkA-Oa
X-Proofpoint-ORIG-GUID: JUbs4Dl8db_lBCq9BAxCr-tbgDxkA-Oa
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6927458a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX3r0wQqcD8x8i
 T/hAI8Y1ufc76oYrI/2RtUYKNGJ8A+Kan1bdsI6CCVH9GsjzypHiXI/ls+00MTUXBxFry5Q4EYP
 39ELiWZdErai4i/tYT5OxXWnIKRGeKAJhfE4LlMSfAqJhWTmq+W0fdYpO4e3Ae/PVvqfqYCVnQo
 /fKLyEwAFm+KxVxWg9/6jrvyKwI1s1CThyrZXEAePgrdzQW09nGEetngjERMCX5A2ZDpDuCZ6Ba
 NIi3g+qLezDEPN79vKeU4v/r1opo/kYaRel+//Q0Wy2qq5klJz+XtDAA9SS15mXgHaOoqxbitV7
 LfCEEQXFfJYeMQuP1CYgf+zj2WSADZA+GhbHYrn4BKXo6o9UH2df6dLv6aAICNDo12kFmA7l1VV
 paCwz1ssN1+6VwQnor/Zo/ciFJbXEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_102307_706698_794FFACA 
X-CRM114-Status: GOOD (  16.58  )
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

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-pxa.c:1269:15: error: cast to smaller integer type 'enum pxa_i2c_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794da..09af3b3625f1 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1266,7 +1266,7 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
 	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
-	*i2c_types = (enum pxa_i2c_types)device_get_match_data(&pdev->dev);
+	*i2c_types = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	return 0;
 }
-- 
2.48.1


