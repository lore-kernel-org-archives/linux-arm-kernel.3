Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E974C79F90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=; b=fsAVHj3h/iAI5X
	wD8zf0NtpUjqVptI1IgHZ7CkLA6ZUR5zB/wuqtDxRhQbm/lF1fszrvnfU9JcG6L++v9PKkgl+G7cU
	nNauAgXMLxxGJoPcNUIjfcERKd5P55uOpVKb5rPqOEVRBMPeHPFYQzwMOgdp0rvymrq94tdIaKVpi
	ww4TBXoJZAKVuWHNfvn9LTknHsy6i8R+Awgds9wVOTEXJ1sKy1CORoPbdsU6RvGJe195z8YCTXVSO
	kQQpDVqB64LJXqUmv8e1mSSL763L7ilZtMg0RVV0HfW7OTD9PRH6OcClRy2WJXXdmdUMZyJAQ1w0d
	j/fmbcfdfEhBgZw7HbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckie-0000000BSwq-1qZ7;
	Mon, 05 Jan 2026 13:34:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckib-0000000BSw6-0zKe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:33:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058PZFw1234621
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eBLWi/Kbuhx9TqF7mhxf1H
	8jWhbGxH4EXAW6f0Ac6FE=; b=MIb4tc2omLHC+vOEDy0doL7yPHZHY3nhgmuou4
	tYf+C7eylsOinYlUZQnPWRjlT4buir1bjJnhXin1wqH5aHgV88H5mYY8r8dv72xP
	q/F8xrIpvv8VwuMU0MtOQ7cGLH5qZ0qtXt55KUUW1lGFeqthcRgPUZfMMOwJWF3X
	rXJ0Bz8xQSaTbbDEEvB1oaxjA20tmKa2910eoYv53t1kCjospC0LPgy2U9e4kZCL
	OVzWgnhkwPtXTXcGKLui980aI6cvSzj8E0XktjoMwI5OiJQrm16siZNsBan9ekBk
	DQ1R0+DI7W+cR5JNb3nZffJHN82h/WNKN4SRT/AQKXKJKHoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hcj03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:33:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so540072131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620035; x=1768224835; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
        b=B/l93hOpBeGzlpyu9KGf5z0AKD+j0v/PDfOr3rW4/UmYHcE9GgpYjlB8BgnfH1Mv+7
         8Ou6qIulVb52Gofe7mfCZl85YFk/kIOJDqz5ogfTlJ7Zt/jgUzsu718V0y9RtosV0bR0
         8w12oyFFS3G+Rrc4RQ5ETpf+zPCAYPifkBPyjXIdFEku1wIo3FmTdCNOGq4Y80YwqnAs
         pXjo4h6QFb48THezLx3DlQhWYn3n1fKd7Y1qrJNSr6nsR4H/yxz+Mv2PFbTfeSypDFbL
         4nnhD4T3gYVm7l/HFyFoYjbRsr+iwocZwlVVc1WNkrx75EC9HvGK2zeOoT4vrvfwAZ5o
         owIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620035; x=1768224835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
        b=Mpqrz7GrKT99GrNzmczW1bPzpGwnfoopo1C27v2D5m7DczHRK9vW1kbJ8OUQifbBg2
         GOFl05CnQDGGiPf21yjUcVjCElJ/qHvmQkOoh6mLTiaz2oEkanHmN655Wt4AmE68ZkNb
         Focz2XiNnU7rWvEC7uCkeljlHUBxLNAggcZ2jYlE8//8qatk5lUoGRpddNcy2SCXl8Oq
         qfI4MoYexToMmV7AfyZqilu2y5ssRKpQ0aEY3zsJmOQTJg8RwDGJnjmUW5so0N5YeK7L
         eK7rzeanlpGi0OYIR+ReQiUaxWVlBAsDjoYgB2oBihsSgOEetXMuyAln5D53o+uEfKxY
         AZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbDXEjQ7/P46Ta0voUrtql2Y2u3Q9tRVU+YL4kbceBHoSTN7GasIDpFaXMkTp+5Trqo3IRc4vUhV0gJxYnLnOG@lists.infradead.org
X-Gm-Message-State: AOJu0YycQLiyMgm0hMzLWMUqU4mLzYnEjPaflsWsW9axeyAhahIjz+pP
	p+xTH9MJQeWmlKx4+rluwDMG4X+8wFgI+6ZyqogVahKAkaIf1/UhNYWvWJv8CvxreBlQS6Ws/m7
	fXPotlJ3r5UhlDFz1EkaJqzkFk3opCUiQBu3WDG1D1mGFZNwGLaE2FR9/HK8+N0QlhdBqj+3InS
	jrIA==
X-Gm-Gg: AY/fxX5dnF3a8H10mYSlidG64+mixi9r182JCkixC7dmP5mmw4RcCnEskSY+Hw6p9tD
	AyxVRqwVDC65vdc8Hlp9UOGvOSiC3kHE2f+MOdFdOrTKTs9lh2e1BlgS2VtfbdqlC0mGf7jgQEe
	2sPi9m5BQVMAwJvgwvp5V1TMjEOtTNxR6947IMgM9Zp0Wj0NdBV2qBx5EH1czJHx2obzRbim8gK
	MSF5+3aJm3NypLkaSjfrIZFIfn2wjrkwy0r2CBeynb4hoyqBKWqMEswz+4cvVV56FUkwVU4Pj02
	TYBHXnlPxTYcCL7F3xeohdqOvg0rfJ2p2HhwljRhx2Afsr0/vsOCO10ecMjXSn6Dc7syrLe5961
	SCGodfrhUblOQTzt4NjHjMxWebkdybKASIQ==
X-Received: by 2002:ac8:6f0d:0:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4f4abcb8d23mr696751661cf.15.1767620035230;
        Mon, 05 Jan 2026 05:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJyENY1AnKxxs/GvCTILXx+88Wewnlpw6vtBkZZehwqeQb52jMZGVzw5b/PZHtR1M+E/dfEA==
X-Received: by 2002:ac8:6f0d:0:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4f4abcb8d23mr696751151cf.15.1767620034778;
        Mon, 05 Jan 2026 05:33:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:33:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Mon, 05 Jan 2026 14:33:38 +0100
Message-Id: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK9W2kC/x3MSwqDMBAA0KvIrB2IkUjpVcRFPhMz0GZCIiKId
 2/o8m3eDY0qU4P3cEOlkxtL7pjGAXyyeSfk0A1a6UVNyqBEjFKRrE/o5Vvswe5D2LwUCqhfxs3
 BBavNDP0olSJf/3/dnucHfr4aQG8AAAA=
X-Change-ID: 20260105-of-for-each-compatible-scoped-285b3dbda253
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LOzUYd+dRmkv3oMmU7xQB3tIB1OpRm86ei1dR0EieQM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7212LDD9aWpmO2pXajLqrMXSfYpdw8+/wsif
 01n3q4kghCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9tQAKCRDBN2bmhouD
 1/fJD/9T1pJUb2ZATSYxfBTsBulhDfg4M2cKxMAn3j5J2ZUJ0IpQxNIT0HTjj1huRozwEiSTEz8
 jbTVcl4uwbM2MppZBpdsT7l0qa2DcDLLsicU2afLE40cOYHueRcPJ0yCOWOeVopVIZ0ooCjHwMQ
 IFQhnUiEIOjtB0CNSBe7uYU/43VB4uovE1YiNWZHBHuRQYShbjHtDQObKlx0H0wW+jxBmZLbjnZ
 uQNYKHFL5PGqilIwKhBt9yWAWSSse5KGau0nb9iBuI/OJCNaEEoGmv9ozbm/jkvLQ7tFZA5BTBR
 d13IEKUNKAbdek4MPdbypLIp8yag7xIgPxRGSnLnmHIS2+vtASaXW+CqNg2GdYAq0jQjo9PAeyh
 rS/S5zJ30SOZxVJTNuJC7lTcBOLv379N2H6pvnRejAzj690y8b+uJRDSMHpLeqqKZ/VoZgutyP6
 ZJqJy4SMwUqO+G0EuIFfAFXgxMF3NyEJ4XMZu6rTRncQxM8TbfHJiof8isywUEkxs/iCcDvlSXs
 2Dejv85c5Kqs93S9INZGOwQrv9mQp2rfKM4GC+VOT279jb/n4qFaJcOW6iiW/ipRYmtPvDgBqJA
 trjLF6akNFp8akjaJCMwOEw6cZOkvAqoK2RTjO5BkrsLl5ZmYP20XaNI237J0dPJhrDpUIm61s6
 10hjLcSwFVNVocw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX2ELxZUBr/Ld5
 msuX3JcXvVKQMgy94JFbE6O0CKmWFfxhVYytH6J+8mfDoEV2pNGWpez6xCDR6Pi7XKVWp55QIHS
 bamrbtj6k6HGWmTcT96QUWTpyaGOjgkWvaABGoy8K9tD775HtBTWv7q5OGIL9X6dUstbGpm4i3B
 JjS7beq0/9ru4LE08Kt2qNFutQFlBNhtrGaUHodro5ed+hofE5rn+LBdr8j/b+dq/7ljzZrG2pE
 jkJA/6/PpC9zzeoPnz8u1Ld1ZOYgdKYuxifSNafBEreEfBfO1V8BvLwHBrDWn4WaZTUmM09wwGz
 X43+/qOSEU4qGH0YyXKKIwBaHmKlYjazv4JfYEHQBKfSXy0yWUgYnpgSq1D2zoGPmR3H1AxlbIB
 NS3sIqTqNdapdhUbYAU8MiqYh/hOu6CQ4ejFl89sx9c9QNhTZyt1UoxyS2nxHxh4/KPoKTYgx+r
 OdW/Kl0YkLs4JgS7InQ==
X-Proofpoint-GUID: wO7DyC2LjZU-jF9dWMDHj-SVCFY0eBtw
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bbdc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d9g9ln5aRjr3gUnP3tUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: wO7DyC2LjZU-jF9dWMDHj-SVCFY0eBtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_053357_296025_50068A06 
X-CRM114-Status: GOOD (  13.34  )
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

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   |  4 +---
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 12 files changed, 27 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


