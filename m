Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A360BE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=52x38Crp7CeChmiOEDVzwP0vjw13npf8/i7PlgMhriE=; b=LHAHXr+XGSSdjF
	bD39nTmqffdbPUehKIMsNad/eQzw2jTO01TcbYD6dxBwf6y5FjaaHNIBSnyOLJHyAbS6NCj8YulJC
	XBBWTOQbI6P1+x1R/l7sfq0Gyt1Dn53EPgiw2Ekg92GE0/Kz2c+iYfBSGRFDbmKO4cg711OsXAIyS
	Sq8N5CiSYdgcPailj34Q8wTB3XPfg5oN2TjAfZOeCFLLKhEw8dFbP0lPX6JmoSWxNqrvbzEy2UvKP
	B9KrXbX0pej926QIs6fSDnJRpzOLQnLFEEUcpO6e2bEl//v2cLaNlk/j0A7jlkeIOcwAMgLoZ+Klq
	aVMJKmic/M7AvIyo/xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Br-0000000BHEg-1rYm;
	Thu, 19 Feb 2026 11:27:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2Bp-0000000BHE5-21Eu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:27:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INlfqP1924952
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52x38Crp7CeChmiOEDVzwP
	0vjw13npf8/i7PlgMhriE=; b=jZRTj72ylj7z8iaIFTKauHezFjgWPmcgNUT+vb
	LskXTZ0oTII9F5csT5UVazcOgHipFYpHDufw5/Obl3vGdj0Kl9afF/K3ZqbAkbC6
	g+AxtuwkmOyLMJx66JSt988c2oazWHjJPNWqlpsOBeGoHOmyJJ2SkINotVOJgPDf
	ip6KSYbWeXawz4tigWQGYIuULLJriQnJKpLaapZ2JSWr3WMq5DMPAjUQ9OKYyHYk
	UH06um5oOqeC9vy1/SUSK0F8tdZE5b8XKniqM8n55vS0oi6AcByVZiOx6v7PNwyx
	hNBNH9ejhNnpq8i5aXEUxDQhokM7h5ZTEW3dwrmxa9rrqjoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqdg9f07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 11:27:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so502924685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500444; x=1772105244; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52x38Crp7CeChmiOEDVzwP0vjw13npf8/i7PlgMhriE=;
        b=UCC8ipYA3zfy8mF0PVgU2SFCvA9y0gVZLDZBgo71uXe01+vHajOx+hFC6j6GNwtTiR
         JUx4ADN3HHsxyMb0Ohx6DgPn6Zet6J1cQKSCY/PK2bnwtLlaVdx3xrivcHZ5/lwOUZx/
         mx+OGYcXgsiRwXDUpnH91TrpGsynP8DYloQ3iabnBDI28McC8q+X969eVU+5pCUE0C/R
         HPs4Q1zPXB27NENjUtFnfs6rNel6ai1I+hTErMO5T810/lBIUSQXwXfK52JchIwyVa47
         hTXWvAD/ug76d6erT9ykie3d2aadNieMDXAEePcXyGEhhDLKr5gssbNGyL7/56wPZB6d
         A+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500444; x=1772105244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52x38Crp7CeChmiOEDVzwP0vjw13npf8/i7PlgMhriE=;
        b=lIpXmm72munS8XeZmWkGAJQouakS1mJEFJSWDxI9ndFYudPubWv/Mb6VaIHHAzyWsN
         OBOig48q0WXMSCN7dvMf3FWOPxsrsUfI+9Vk8lQhWUo522fB0JzMIxS1I5LrIIVedU6u
         +w/TM2JnCIEmV/L5qjKgATO1i8uKzO1mHz8sQJFgDBgqQ2FAbalP/wRqo6ApD1m1o69j
         z7aofdmXEKWUp29+nWBHbiEUDjXbMak1whikgjy3VCxOMKC/22myosyZSdElyQl47+wK
         UyAYx9TEO7NRuiz18dsYgytQtnrMZUYomXslX+ix0lcXKxzSCcKQlZhym0NR0caurnUn
         r0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVYeWpBsDx7jrwfPP2V+eGuyms9tA+xu/FUemtDvoJcAlwSDJX8ukFzoX1Z1uWkuiGIZTQSrjX6+m3OTOyOzJ3r@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw2NTdFW6ZPAha9Nv3fRFNmBXeichc5Ubwugw7ZyNByDe71PFL
	xN8ar5mq6E5g/L0Dq8ssazPzUDz3CqQ8Gv7knAlrwBSBdAlInFvmkRPwftetdyX1Bs07Jx6+V+4
	JHFzUgXk4FSuPHkQ+I/AxXnU8GRzU1vjZByGKFpoTCKcRHOnynl8OnxIdE1qdxfwWmVD7dV+sjg
	BmRQ==
X-Gm-Gg: AZuq6aK05/7gmJzNP154fs/8iyFJsNw5JajB7Luw18pSF5UONVRbS4pVjUCeW/8x6mU
	o9KyPb3XAEN0DReDOG/hYJOSo6TNklf2CowXJNMP+SdKGBgzIIqPZJ6znoVzQHjGjTso89du/E+
	Rk/OweT1Na3Xpvf3UDlMIu4D0+KDb1ISyct/7GX3c+98YtpMO+8RqyAEG5fd9VkdRBWIvVSkBsQ
	7sAicl2WnT6VaSfBG85YWvs8FafSO4No0PigfNZBbjl9Om8giZe6n5kqUSkQlSEC9YDim4vFUed
	lmmR1RBKgcLuLPezIgjSnJinP1yfCVN/4aVDjTQHO2fSEpPIM5ZirYAeP2JYL+ZVDXP5SCXGAtv
	gg+BgS7e7oASL0knerD2hMM857j/tVCppNt+b4DBqFcImhA==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr1230731885a.56.1771500443813;
        Thu, 19 Feb 2026 03:27:23 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr1230729485a.56.1771500443277;
        Thu, 19 Feb 2026 03:27:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] firmware: exynos-acpm: Use __counted_by()
Date: Thu, 19 Feb 2026 12:27:09 +0100
Message-Id: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3zlmkC/4WNQQqDMBBFryKz7kgcTS1d9R7FRYiTOtAYm6i0i
 Hdv6gW6+fA+/Pc3SByFE1yLDSKvkiSMGehUgB3M+GCUPjOQorOiqkEn0ZvIaOzk0YZlnLlH0tr
 RpbV1bxnydIrs5H1o713mQdIc4ud4Watf+0e4VqiwJuN0W+umVXwLKZWvxTxt8L7MAd2+718My
 dUgvwAAAA==
X-Change-ID: 20260214-firmare-acpm-counted-255f287c3dce
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PHL+irrO7eyOC+RFbe0jf8E6JbpHm5ONjsx7RhOymIE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOUy09hU5K7kefbkliHDUSxzyE6+2RqwBnoX
 qJoHi7JnbmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzlAAKCRDBN2bmhouD
 19cgD/494oTtZCYqXV22NMxx4hDUSxAi8f5zBcqPOMyTyIVknMtiEKKn/i9jq1MtxHBvzZKmbs0
 s0cC7IY+U3f+KH1p6Lm3SU+i50r+lO33BS5H1NuMC3a+57Xoehbre6BcD4kaIPU4Kx/VSy742uP
 1oxB9rWkOhaVfJJ88Jb8ReHRPdV2XMpDcoZkcBhMLY6BovdttHnBiOfrngHP0hZGzBfvuWiy7pJ
 9sAKdy7ie6sDjynF8eF4TNO/b/WBHcq1Fo5b1AECfOphD+eg5o9CktowPCQhF4BFcf42d7F2nRK
 FMrMYq4cptz9u++mdwYTZrfaLddkdcZuYi8OiZOPLv3ZrfsL14TCEqsWoM4C1VDeQacFqee6sO3
 9jw/q0INffK0Xeu2B/COTEJ8CLxY5oRJI6rZ0wmbZldngTQBrz8EOLRsRfQdWT2UUD3+Dc2DBKz
 rOg1eJFYmlh6YNh6OQ4SdHozUb1ICw5TqRGuBh6QvDUZ0l7FBpP0bmCcsQf1hgmcW5JYTSynKT9
 WtSY3rHiL0sGH6hK0SXGFWI/dhhO7rMGjRwDeYFLo55TMOC/TjjrAyyrvtHFBz8u2shtPsjGqUp
 7liog+6Nnbe86BdjWwuRhPVB+DlC7Ks3vjftNO6rLJWAsSP9dhJLVDWGnMDh8szaeX5IY5d5ISU
 HzrRghSD5yzWD2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 7y2E-tejBm8SjJkVo5_2VZy7GpeM0vo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfXyRaKKtmNhj21
 bH9W7uFzbVCnL9KYj5TIApbL+9w3aVKvdcZVyreITuYniwe2LJb7w8pUb3J+X//IG6MbQMCtf28
 tcx95AK6gL3d5OfBQoeL3qZe5M93bV5dYj8cUF/g+SuQmjeR+hYhAhur16WP2xrxai7sGIheXla
 pyNsbC8LG24tG9sJfGfviKFN+YMyqw3q+1TZN0QywWI1l3JsFu9mYwM9M/eWPCfGuFnhxXQpG8w
 UvBnd5uC2hgngxyNP7dmRBtBLSkq5sSWfGNje2oZ3hl39cMo0Adei1mJIB2HEZOH9QnEDIWnNvf
 ysvaFhdy3wTdWYvhXkKJOwcWbLCLS6IlKwZ4ec/SkYmynmnh3dPxnagXbjXAPeJYK/URW6kyK16
 5OjyGAGBVNfDn8kTa5lV073fFWdhUILUYb+bJO/8iM9S8crXKPJ/iCmbutkHHAwNHFpOpgY6ODE
 w5aFH8F26BfWNNelnkg==
X-Proofpoint-GUID: 7y2E-tejBm8SjJkVo5_2VZy7GpeM0vo1
X-Authority-Analysis: v=2.4 cv=W/M1lBWk c=1 sm=1 tr=0 ts=6996f39c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=nZb1RMZlaAfT0dxmymQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_032725_532931_8A72C024 
X-CRM114-Status: GOOD (  11.56  )
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

Changes in v2:
- Add tags
- Patch 2/3: typo, single ioread32 lines, merge the two if() for
  txcnt/rxcnt checks
- Link to v1: https://patch.msgid.link/20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com

Improve safety of the code by using __counted_by/__counted_by_ptr.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      firmware: exynos-acpm: Count number of commands in acpm_xfer
      firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr

 drivers/firmware/samsung/exynos-acpm-dvfs.c |  9 +++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.h      |  8 ++++----
 4 files changed, 24 insertions(+), 23 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260214-firmare-acpm-counted-255f287c3dce

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


