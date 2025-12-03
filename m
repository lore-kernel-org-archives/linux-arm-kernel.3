Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F308AD15DBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=; b=31Y0IT12EWD0PGGfj8llsrgdTd
	MawgVZjPZwCLxuiFPq8hV6mT+OcqsJ1osM4FaWp4V8n1+MarY6UREk3lXcNwfpnuCMk34B4wkbtor
	ifFmlPfzEW1jnjEtXUpqUVS/yXcY2rOjg2qV7FR7/sS4x4CgHEyzHJuAyabK5DOP/5CjamgNJtx2C
	v2SxEoZpqgvpq9EROT/TLzpeDCWypNdwxvtwt8pd1HNX6JEoZceGDd7AHBQWlACi/AOeHukfVQM6a
	6B2M47YURlDphxK4Q4CwaYR/XxhKeJ6yyeb05YlI18BFYcXSEWgUJV8Xlz2LS7I29APrFeWwa3hIy
	1CCrDrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr8r-00000006tj1-1voc;
	Wed, 03 Dec 2025 17:59:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr8o-00000006tiP-3cQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 17:59:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39rd0H1928894
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 17:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplh
	MSVyrzKo=; b=hdVEwHlSU9+PVg6RP0EyVa+JR3rNWGftQdDd/3zjv63xijWkW7n
	HdtEcVL6LB/PFlxgKecDVbBa+fL9WOJ3LHKGmV6B9cSuBJf/gRn5qwRO7P4rOq2y
	a3sS2fLUmtmNnFgHQWaWeDVJgxgBezKLBuhIbSse8W8lb4toE6UOOCQ3jhmGZ1N2
	nEVPCWHWvrhyJZ054ZeWBi5aWzN8agxhzNW9w/qB6QVgvTmNeIaSxKXU9KpmTi3z
	Sgo3GHnsTNGC3gcspbJ8AQIWSSTaKbjCDvTXh3P3+NLHAA6BB2f71LVMDX66OB5F
	ups9yUqH2eS5Zf4bUqr5ZFOphcz94mWY9bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjyqhdyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 17:59:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so1058003485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784789; x=1765389589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=;
        b=YCErIWtvdnucOEjAm+P5m6pLwaBhWCPsNoqsAA7lq4aBIKmEF00yhtmrakrLXo9xxO
         ePAlMZiXPXWinbYg0L01cTbQSYv1nH1Sj2zatOI1reBu/1SyAc9I+K2kT87TNhi4D8bp
         nLz1dINuLPv/8Ecf6kw5Xbkbj2FYVBT3wPQtgFJ3JHdYDxwJBJvogqlSijspEyTqKDHn
         KIsqfJMzmUH34kexzIj2lWv4TE8pqKCvkoIQOx1H//UCZqiDF27R1uAja8OSLWof/dNB
         63obThiW0YpLilLVvU8252WPlAUeox0zmMJzm0KBU/o/Ob8t23r2ejatZKvpkcc27aZ+
         VvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784789; x=1765389589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EXl2xeLSnNctf8R17IaKM2Ov+ufudUFplhMSVyrzKo=;
        b=i33Aqhn+Yx9clobB0GWwkBkR5LNxX+l3Vo7lrL+Dm24xn5pCci/AeJhuOQOy/OvD9b
         +bfSz7R+IcZDRptFh0bO2BptcpGz+FkVnUJJdXLBpzx/13wudBjSgnUay8pyunVzPmSM
         A+9LGlqChBbvJfTdZeb6nMaUx+BWLBy/bTUHpssXHJBw9tDyZcAaPLvgE56JP1nWuRzB
         xZbVCQyEmpB38X38n3YY3vvBaEjsnyszQ/qLj5i1/Kg2K7Wgj4jXl/4epXrj3e04vQeo
         msgl2HiBXhd3NgqzJbM28KKwHZV9CSslzFKaajkIoAvHt2s1ltOSBhWt//G3xIOMj6be
         u2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXifQI3xumsHNAFMoORHvdBgmdDx0vk6rVMgKXUecpH6wd+MF0zjsJ0Dwi9/xNoM7hdYScumTok/P1B886+u/fB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01eh/DCX29B5gyvrBB7r1kl9SWL8y476qH4TCRoxYzV93Bac7
	ZDbQTc8fKaSeVNCtKeNQD9C0HEcD+oFvrKHN9u2pPLCvNm66kNaFnEUMCawhhtZWsDzzRQ/GT+E
	ApjlGW/VAuj63wLWH2mizxIihxPorIyqcrZ/A+4Zw4xXt+uE8W8L91k7oD3q5UUYIay4/EcdlPS
	TpVA==
X-Gm-Gg: ASbGnctluFRSplHcAenTLXsYzxKwHe42GszH/IdyTU4xHak/WE7R/yEOHVuReAoIyu0
	z6aLGbfup28Ir0nDZSJDQlVBvtOA9ONorgL4rRw6N7DCzOKYWZ/Uv2T7n8AU+9prL54EA623hq4
	gRkLNuLBvCwrjeuqgJ3ekLGjqGDDTfQbv/89DDUS2zLx+uMPqYL72qjqotArzYkeTAdjFVveRui
	Dph0A2QNfwcEHfCU7OPpEFomRuycMPCmKGk8S7VXvim3w6QRb5ENEekrwkgVV7E67ImivWEFlOf
	8lymu0mYK2ZSdbm25klNLuQ/Zn6QqgSmngnOeIG5/TEjhMLz+BhbhtLlv+pw196HlV10HDOpzAt
	ES5Ez/8MMKfxFcFZDcalfXuejeQ==
X-Received: by 2002:a05:620a:372a:b0:8b2:f0dd:2a97 with SMTP id af79cd13be357-8b5e59286bdmr462805385a.37.1764784789279;
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8yCiwktBCyzrwBa+KnVsA4n9L5lmxOOSzRd+h3w1NjUHwMZOWIoUMSZ3WspaThXBEBWKrbA==
X-Received: by 2002:a05:620a:372a:b0:8b2:f0dd:2a97 with SMTP id af79cd13be357-8b5e59286bdmr462801185a.37.1764784788755;
        Wed, 03 Dec 2025 09:59:48 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm43022473f8f.26.2025.12.03.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:59:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] samsung: drivers: second late for v6.19
Date: Wed,  3 Dec 2025 18:59:42 +0100
Message-ID: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fu4Hi/WfIMo2rfWLyC73B8C3fZMMk7cwdUGFfSUsWvw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMHqOfAZzaHRmIY77uLC1yV1FKmzMk1E/y3ggh
 IkPPQ8GXTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTB6jgAKCRDBN2bmhouD
 11vkEACHyrGt7dVfCAqtf5VUyVStg0GjUNrYTlUnoFRd7h/NNsKt4ZT3EzAXtiXyeAR+aUUzb54
 yCkjaXwRJov/dMaxXyinFcOJtsBGuBuu8AtJB7XZnaP2VXaREE5bcwrHtEuBmmfjE//GFACHG23
 IgVQtND2c2o2xsm4U++bkR5tLC+L3UZIMtnbaSNeRafOfQPTerr6OTQy0uqITQKcy9XZNAPMgiT
 0BBrI4JkOSI/u19OskOjHHjA9dlS+bi3jnicIQX8z4dPyo+fAaS2xRmNQK20G254/6CU0DXK9IN
 PcIbCl9QEJqYfSFtn52NEkhuSQ2psY2HClZ9kQa0bELa+8spg8Xg+v+8V2igaEbwvkNF2kYOz9d
 FuEDizS5Pk22xud6Rr3iqMj14yOe6qo2DblRcTGGkGj0mM72A1k9na9SbUYxnAwYObY6d6OkH4A
 8dzuyV1lQKaoJtMJpBLs0nGPVcNAy/STstJJFoS3xNePKg6b0SJixMP7V5h0lqlKB7oCJMtOydq
 ZO3D9l6+aHLuMvqbE9G/Ldv5eNE7m/NmReQ3v1N1rIgglQgF8E8mD3KdDJRwOIWO+vf3zqMsRKa
 Uby15/w4cFdR4K9hhAhkhPMilkwREXAsa8MqkHp3xUuq/kpu+ITxjDwOD/Z634gxlgoSycIKtHb fvTZSnx1HsJCHsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69307a96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t9IKhzsu_K_-cmMu5D8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1z-ZXRGb0-CcSOz12ch33z-ou0L8tJeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX8zf4S3zTatmR
 StOQGecAeiMW+ysvBaV5rBwBjLqbnmngHHroxWizd+CPU6qV5OoPeNK/8EmWCzsFx6VO+EO/TiS
 na65V5GmR1BdUTe2hyTXDfXJSiyzYByq25VhS1BOsP3uAs2TCyVYTqlx3fCg4aLAnXszvanI1An
 /X7wuEGU9h9p0l7x7X/TmWwb8/1FNGfT7EJ9lGi81FREsdHplHnQD+3idtYkw6lmbFFO9M//cs4
 C1/kPzWMsZ3jd540Jz7DcP89e8BAKqtGVJb7oL8yo0ea3nxCWCDObTq5c3lJjfPgOWGOn57rGNm
 NmQPeQusghNvEGx5JKrlElfuO5+C4aLAzYdu+DrcTV0a2H9vwboygtyCqtKiKtIe0n8zE7nH63g
 fqS1KAn4jPCuISDmXPUCU53tXa4qbw==
X-Proofpoint-ORIG-GUID: 1z-ZXRGb0-CcSOz12ch33z-ou0L8tJeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_095950_903239_2E2D1F9B 
X-CRM114-Status: GOOD (  11.72  )
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

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Second drivers pull, but rebased on master/6.18-rc1, with late fixes.  Would be
nice if these go to v6.19.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.19-2-late

for you to fetch changes up to 990eb9a8eb4540ab90c7b34bb07b87ff13881cad:

  soc: samsung: exynos-pmu: fix device leak on regmap lookup (2025-11-27 16:55:38 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.19, part two

Two fixes for Exynos PMU (Power Management Unit) driver:

1. Silence lockdep warning being actually a false positive, but quite
   disturbing during testing.  Issue was introduced in v6.18.

2. Drop device refcount when requesting device regmap with
   exynos_get_pmu_regmap_by_phandle().  Issue was introduced much
   earlier (around v6.9), with code being rewritten in between.

----------------------------------------------------------------
Johan Hovold (1):
      soc: samsung: exynos-pmu: fix device leak on regmap lookup

Marek Szyprowski (1):
      soc: samsung: exynos-pmu: Fix structure initialization

 drivers/soc/samsung/exynos-pmu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

