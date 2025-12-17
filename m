Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E112D6552A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=Di+eSE1GlRU2MsfVBofOdVS28Q
	n8h+8hsfWCJs9Q+ARpPAOl1HwtAogDzS0DCwiOjXoRkd2U6Wlf+csLcpfysTO4mqSVVhyESmjXjpa
	y9lO+Mrbg5/w16lUg6hKCu3nUzLcVk2z4SXKP7KrKWxiI/A2XBbCqqKletHSCPc+CfdShKQ4VghTx
	9crp1c6UY3b0/28TbFRhv/iCsBpZ5DdffWEYnkfZkU2/dAdlNzCpFeii6FuZejPALfBTNjP7KAYPo
	Ht3AM25X7a0w2e4WJxFExWLvVSMthBtJYonq05AdSbAjgdc3E6kxG8J/PgIp0aG5kBmmaKYWqMZea
	YlYgxYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCb-00000006TGS-3PPO;
	Wed, 17 Dec 2025 09:52:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCW-00000006TE3-1wUc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:52:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH86bdN1946952
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=UBHOuPqJzAb+W3+V
	yQNen9gKx9+QSAd7t9bkn8zaPli/H2uBY6DiAUmRHzzvHym1pqPrDG3c1hcXmhXk
	L2dPm8fkl7ZuU9ug8K3BORaFlx0icsjlTOaUTP048GyWXfl5vSnqBpnlewuJU35C
	5ZqVLyWxhrVp2cL3H7lSa1eGucdjpt9u0Xfobh5Dn8gGb4nBqSXRR/HXvgzUU/QY
	J7W+69dv2egVsqafQHhlw71ZeIAd2XttbKYy9UnPGbdRwTwu4zP904P2/6MBO7dU
	fNDnr9wz6D/TZmCCL/pwXdU+fMpqG1O5LNyqVxfvVHp4kSnSkR9QbD3QsR3my01W
	UFgr6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa8cfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so175443621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965126; x=1766569926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=BZKiT/koGNGsQ8g4DYzIKsGKo/nUMresYEVXjOMooz+Bwbq7cCDfqSaTZcmU3PQ10Q
         7LeTl7hk0EQxOs8vGeylBEbCQ5orSPCDfFxi6exu3mEGiJcflH0FQMTFECOykLJgrgvT
         edPgUTwXToVRvmkhtHwE27pqb2/HXwPHcPwE6YPecd4tshQ7q0D4NhL7+X1ZEEgNkFZ4
         Zn/UlCSaV3hPP95cpAhYsWe5Z1qRTl4BkOA9vOGH3E9OQKO5E9EPWOsMi7BqxezQB6NX
         Wt1+OOD0AjKLBkIfXPxLagqBpe05XmfkFVQFswRUlTBajFdut2PUf6Lu8tVKvDtEGLBk
         kRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965126; x=1766569926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=LMjtB44p1vjJlDSqzex5SNpGlhPYb7NvqQzDIVvJm3xvsqLOk8k1xdVgvAnd9q6iWZ
         eRBtmPIFUZBANQwIFKavaIpC0Tk4BO4Rh2JLu1HfufLKB33AcAOieWYdVP8kuWnQGQQy
         wrME2tTRIQNQLXjQVPg6lBaNRMUzL1A3rt+sjUuKFKfZLsmWIb3QfdlRjRl5ZmaS60mL
         BNdM6v1gJLoYc1JTChZfueqcO4kZkgHHYZ0IIL3GNk2qNVn+1q8gK1swhX5FRb31jz7I
         jnZf0SXk10DnhZOrtW5WfnW4MPodwa8Ub7B65LDkZQYF/UISxds2l6TGeuVqHTmijhuS
         MDxw==
X-Forwarded-Encrypted: i=1; AJvYcCULzQ/Mkc83+LG8LMjK/TYGEe+G2/QgMM4USIaQefJEnDUjILcrCJVopEwuJzMQK4aFOHO9Oyt9HH82zvI9mbG2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1hw+a0kfOu6DyoiNt7fahfFR8s0gw/39Ixw4be5L7tP3+dzEj
	/IFeJLFZ+qKM/jUemDtTSkSKGOy+kKQ1irbmuLBTDvNYN+4ZJ74B+ptM7v9hdPeaTGyLicA8W8T
	FRGaLqLSGlWwcPiiag4gk90jKS8SpQlffJ2xc+oZlScXsrXDRm9n3rHFDgXpcXuV3konecJ8p/N
	xwF3ZmqOFVBA==
X-Gm-Gg: AY/fxX6mkSs1thLd7IXNwtcnF8KytXNm/6UClA1QUcRk9ws8p6RRE7w9Qu9GmiFjAMi
	KCkjgLw9oFZ8QVFvBofuM/psWp+3ny4ejeTjwysYGLIGlPQoCPKHYdcfG9VA5L0cTWpKKNUXtMA
	KVNJeg6XAEwtXY1n34c/o4pX4HmZ5rb3WQQokwKJv61z3Js9vC3AWlG9wgCEur6d4rYwxgV/sZt
	Up8lXR2DkWkSGUVaqhP8HQw42nio2cRHMUHjKYbR2Uu1/flpVzGyjIZfJg3K4rI7iGX+PaWh51X
	sfHMdcy3tUojKkHW16EBgi781/t2555vJFNI3m7cxcx3QT/vuVIJHPg068mG3Xx4P0o5a1QOq/c
	U1/4JwBj62lrE0x2Nt7mOplUm9yK3QB0C
X-Received: by 2002:a05:622a:5814:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f1d04670acmr220676161cf.2.1765965126514;
        Wed, 17 Dec 2025 01:52:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpW64vWVbOztrqNzdldttczNbUys4XmjX2XMOb2lmN014HTYnX0B8wUrudV0PofBerDJRIzA==
X-Received: by 2002:a05:622a:5814:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f1d04670acmr220675981cf.2.1765965126114;
        Wed, 17 Dec 2025 01:52:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:56 +0100
Subject: [PATCH v2 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-3-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn09FZcbkBt3DWFaxdeLWRwB0+wi5dMMjPtjq
 9FuRKbjtOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PQAKCRDBN2bmhouD
 1498EACJ7JmJ5D9lgCn/cvg5WjscrraVzzRiGsO5Js5zixZgNLnjmlNI8yHbrHvLRxJpkGfizkh
 StF3sQFJCwCEy5yFhg1P1sJDVnEJz9kTL5R4yhR3AnUbgaI5Z3Z/PfgwXH2ds3ZH/gt1zkY9PRa
 cOwCiHq2j7cHToNrkLryfq1wlgPRxjI7RiYhssueTP+6SjjlkMPMCA6x/sjfGx9ZFCogPjEFPOM
 jhn51tTFp/KugwQT8yWZ+5Oq4FQSuNPZG8+Eo6T/QpnwEe50CsQrTVobAL5fdwI8ePw8AmWBQEt
 Hg2YZGtWC+AUDp7liYJvFtA1gDiAAbBJML00kZjkJPxTKBYnWxcP0z5D1+RUIGivUpWkuWa3aa+
 5V7aY11NLtxl8JqOgexeLGFvMd+/eDmVBmnu/p+kK+JUdEa/e1Kky2GJiDPQJZu8zGcutcg/NQZ
 4dp6n3JTb3H94NzoE2Oya2OC0rXRYh6i7UlAl2LVTcrQLbnyA4eNfujfHeVbs/xyqYWSkAC7LaN
 TtfQ3j6VaCA1j+iOhkTfcUwFe3vJk1+HFuNxeQqbsKvx+z0+to9+by247FbOYM+WQwHIJcdcCqY
 D999LIh6ouixbSL6SR0TqBlT3nSzGkNgu0mUWgf0bXSKgnLruchZqnPnfle3KrntrEfx1yBfWxz
 823+AR+skWUYC3Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: s-uNCH-SSJgMLjq7U8ixQ4GTUgkYxuky
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=69427d48 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=87NIDPt55Z06IyZ_8NIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX9D2lt9PMlOPw
 YRDRsTWG2VREwcgyxwkPaMkFccoVXjTOoRLOFuKL6qecfi07ck6XCCAdhFMjIdldaFzHRxcUURa
 eODePp5wGAkK2VxIW/uV9KJ4LlG7rDbtdjegxz1GZt51wKY9TWaQMqxVwghKg4za7qTkyaOp+dc
 R7MT2z18ZvlyIPv/yXZPfJ1waImoRSrOu7Ho17ig7269oWtBBbb+T9MsCJ7rewxouoWMAGA22pz
 O3V2F0CxnBjO3p+vvHBlVk0KwLYv4d1I/iNDyEVY16OROoZU6d45PuL7HVXGDYmFy3zdZTuJ33r
 1UUsSmOUqhQMnJLOB4hD6gaJW+ILo2KSIpruYkrc4X8SV0uIIgptfZrdIXiwHlNGjGYTQH+iqi9
 bbHXrO6gOWi40O2wfEd1DuUPTWQPig==
X-Proofpoint-GUID: s-uNCH-SSJgMLjq7U8ixQ4GTUgkYxuky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_015208_511559_380F2252 
X-CRM114-Status: GOOD (  13.80  )
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

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f..51e597ba7db2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -19,7 +19,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-wdt                      # for Google gs101
-          - samsung,s3c2410-wdt                   # for S3C2410
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420

-- 
2.51.0


