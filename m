Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3E9E9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=; b=EOASlBIu9AgZWfKUb/ARa5wC/7
	H2tcMye25/Opf3VjH4qXuzfs4/o1tuqubQB6Yo+sxsNYqJQeAr3+j9pVUzVe8U9V9oNVzgnS5r9Bu
	AbkXO/PtFZa8s5ejZo1n/r0uw/bzr7v5FmW0UVNJ8GsTQewI+9nL+5eWM2e47ZU050UGmFWij+L5O
	5bHuTZ/sNq+nkO8uRf/s0XEny/HyNGZTkNSxv/doJL3e28tSNfhSYKw/FolUwZ/y77YmoxvN+Nw6q
	kUno38oGDFUmzghH3ZswFqNvPKCSe9mCXvYeftbbKsGxuY6wFBWva3ZSvBc4Xtfj0u8Ua9qcsAZWO
	Eh0DnOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bt-0000000BHFO-35hP;
	Thu, 19 Feb 2026 11:27:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bq-0000000BHEM-3Eip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:27:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J7skQk607975
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=; b=L2TYlkTPyyp0CHuc
	Qd9a43DHIZveEBAUgpBJRkPft2Y/7HgTN/a6SHJ5vrvSTY8Wg9JKJ/IRDr1fgYiO
	rfedf/9BjsRlfmzNH4nfJ1aBMDVi7njvd3LxpprgqCLUg7HFG8KgjZh9ENfZB753
	mNz1N51XL3ZxYl+0qKVSgT83PYozzTA5bVgltPfewmW1e5H3NTf6RTxNjXmsihpe
	IIt6M80GY6V2zgmoLZhFYeTbZ7piwH2z2Sy7xbZN+MUSAoPp1MPaJrbCnVY1Dngb
	lMWBr1pjo6xSo1xvyeI3+73idd0wkcr/5uGurMt/DSNDks6/ArNPQqhWP5nDmjag
	Kc2Igw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvsu13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7166a4643so638123485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500445; x=1772105245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=;
        b=RGo20CEQpRps8mQWlkXrJEwtgu/7WOb9TV8dGuur+N0vKEi2ZxGCj7ZNWi3dAyB28i
         kEFWVQBWeG8MvbYLdyjBtWHkJ3S8JfH0WbxjcZb8BqVLcY8Kz7xTqiAV9mLMJOvj69Uy
         rEAFR4zBiYW1CAsEHFGHyANQYGKMN++40sU0AoU+8lBmkKjNUtyowU1efpjMKhOamXW9
         a1m9FP2PN+ECBHl6RcrG/mH+YBFQRxv7lVq6pvH8Dl7xU5TgV4cK3vAqCC2Beq2qQQLj
         svg+2maXgqQM3w76GQB3TkAOur1Yyhs6qKN6E+v5SEgL6p7jp2mmXfmBoIeHITwJhmYS
         hl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500445; x=1772105245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=;
        b=pbtCyor0EPxIUsjhKkuchyJmhS/223wiqT9apdnwaVAMUTTFMGZrDAID3GDNkjqEA7
         c9kmjg4AJxuA/Kk5Q/2uqZMyyrYpZgga2ipN3K9th1wCf5p04v90xSgWL0wNCg4mXhvw
         VXFGWXPYgIoX63CKGV/Yloz7KYO81mkJvXih7oDbET5mrQL5mWx82VU1yCEmENaeOCae
         2JatAW5FbJde39tEcUiDjI8YBkH5TnEa8kJTSkTlS7UXY5V8jmEBqwEp2FHI+WR2hgAW
         ewX6lvPxN/9EuCWY1ttEYN1wfPOtkz5WPNvAxmjl6LgSeaVITT+jalAfupUaowQyrFNl
         FOMA==
X-Forwarded-Encrypted: i=1; AJvYcCUtJY3frkc+IsaEpd8Qx0nSXuHVpqB1du8tL6aOp6AX0KxEeaHv126CSSQSOjYg6bm72Ty3YhXE1/fEDf2rOtQE@lists.infradead.org
X-Gm-Message-State: AOJu0YxfwsrjGglfvJY5TQVsKmx7v+6uvedWjBcFN7PaLg75VDxb6mzn
	MoEMhMx5RkTPrPTvZTweN7rsAgfltjF9P/7bJSTBjCyiKC68CO/puajA/cLtep/ywasGo4+yCvl
	QeMA3qZgtDgEV5L7LuYUen9+C3MA3+VDXhH5LFK3QxygqO+qwdR8m8+czyAJ7i+9XZm4m9L0/hV
	e7bg==
X-Gm-Gg: AZuq6aIq3ttaEoUWKHWPpNWN9w0jNHdunkWp6w4iLafHgyUmw4hCS+qfZ3FplDW7KMp
	Zw4wTHcc/2k/79/cy4ted0KsaDxSLeO+Bn3e49a3EVLhDiyMEIUbkqMwsT54OG/jLTV6qUbf6KF
	ki1RHvw9BpW91g1bNiciNktVgBeKbUvMaVA4Ah74GLSL5AlI5KV8gE3Kg7BYvQKq90vJ8CfdLjC
	k7vWoFQ8BfgVNepRwkJwq2MdbOstXbN7yhxIq325SPQCVjyWzxpw1RCnMF3PavRHZjkaSMRXaZT
	SPrKkSwWZVwNBCwLm4jgBA5GS00JY6IT6r3pNQFOwe0/A5shZholEFWu3OK7M61MwdEgqBR32BQ
	53fghngjehoKGXf29cDk/FsU0pO8aSMS7vEn4qH5ZIMci+g==
X-Received: by 2002:a05:620a:4492:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb740ef205mr615677985a.67.1771500445310;
        Thu, 19 Feb 2026 03:27:25 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb740ef205mr615676285a.67.1771500444867;
        Thu, 19 Feb 2026 03:27:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:10 +0100
Subject: [PATCH v2 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-1-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QDmpj9Mhi+yaAgNVbdMPNkUREhCivGToVpPYIMUn09A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOXAyCwdeeG60WQzcr9Uo+M3mkJDcWzTWLZ3
 kXMLJDmM7KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzlwAKCRDBN2bmhouD
 17aeD/wOR6DTrP+rBWdXbkF2r6rb3/tLd36u8MghhP0UWVrgi2z0y/jWoTssX+J0V7oPlxzXpCI
 cMgluqyML+MC9L60z4kTPIFqhi/AtNdC/8CVFU5a0Hx68otOv/K0qBDMJ077FvMe140HHGGnh0u
 kpO/PsZ0EJnWWzvZgqVb6M051BYBvsywoJdt16H7swNJHBnCLfBtK7aXx+Nq71u8405lw8LuEDL
 iZhrXgvWNZLN8mbNFGdGoZQLoKAbf3jbwoCLxRuLB1W66O5Y2nvPVw2vIszBoJaHfAJ6HM5rCAb
 HKqodL/5CTHrZBnnr/3qTltvJsRGisotNasGln36eo065HHND1/NQdUPEf1PInYEOZPsohYAu0Y
 tHPyFYJud5k6PQIrP1lcHEpkQnH0ggxXaVae1GMOEVf/DwsiO2XajyruDU2k+eI7idNY1AO86SY
 WNvog6SSmc8oZmh8in3yvpOO7lKGq3WMcYrvrUXfv7F8uB7dRRTHbti4hWbN/wfWct9ZatBDN+c
 6EKzxbtIuFUTi8QB+AhmcL2uZn66/y2PdJZb2xgsRacVhy1rrIVQl34XIpnmbC7Mq8zJWWm0kd4
 gK3mAVXA4SnwngfiqWpon86kStiZ8hVlMbBcAUCJ9uvr66DAjhB0orNeIRirQiB1ktbGltC1Ayr
 EEFtsxNfwsjn84A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: KWjUnly5Kfna2sYpjTNHQfuJaIeZAB7B
X-Proofpoint-ORIG-GUID: KWjUnly5Kfna2sYpjTNHQfuJaIeZAB7B
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=6996f39e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ba0xTr4slAEstdPKfgkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX/gGKiUYNFTpY
 6g0KFZq/nJyvY96MPaC3dkzIa4GyMWuolPejWWUAcBPEjTpybvUmDJBEoR798S7SPwNudHHYkAF
 B3VYKbOfdwbVc/hQrswChZb8j7t1hn9Jq/Omx1UeOTGxdK1cqx1HmRQl7fIvgsQVBSjp8lKTqKa
 zbxE3nymL2KA59oaIVftIFnUr7bIGiptKSiW/hC4r0k2H/XxWg088fJAPJNvv5kLgIdD6/FoC9g
 Y9eMiLUYdckUYqv5nRp2TVPe/Is2DOw4lfZOuRgG6qEuuMs3oDKZxf66d4Pf6javfTZX33ostzV
 5tAOxVkJoppdaa/HpBU+AO8eJ/qeUTWyllx6FOuXRlLtaM2RD3lznpvb7Mbkm9xasXEPzzG+fkw
 zx8Ra/l/0qdudRcRUKjcDbi23PIidfC/ogte82ceWWmDh+cS8tK6SmNsE32M+yIKIlG8483vUwP
 mMclbCl7gvd2nLyao3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_032726_816290_A2F58E47 
X-CRM114-Status: GOOD (  15.98  )
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

acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
as index of array to map them to error codes.  Array index cannot be
negative, so make that explicit.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 961d7599e422..44265db34ae6 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
 	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
 };
 
-static int acpm_pmic_to_linux_err(int err)
+static int acpm_pmic_to_linux_err(unsigned int err)
 {
 	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
 		return acpm_pmic_linux_errmap[err];

-- 
2.51.0


