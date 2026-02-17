Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304BFE68153
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MS3hOD6m1Xbn2MbT5juObO378HbR+C+3UhwUs/0y+8A=; b=d3IbvKUYqU6c8y
	VBLObShq5S+fdraLrfl+vwhpJgSlDQyn+eAX8yk9lOOih7shm914k9EM/qj4xXYgm7ObF0qyRlnyL
	uXi59DgS9waFbuH1Mqdg/jbcJ7hrKlmnDvVH5US9QXbEgHQt6oPJWQeaJuCpWZAYjDXrfEzgfQqLH
	UH+IB1CRrrP7u3czpr5Ose0a/rK42p4/AZ0RFi5YMZzvmhlphhibSf+NSuYy0yhGXNWVuMEXCZK+H
	izhxnqLMWLMrK8KUWNIZ2X1grK7SKjONoX9leB2wPmbXYpZia1Ck+iUpRQr5ZHGXhdMDDwEbK6yyH
	G6f1xljmesw7qurx3PYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCO-00000007vD2-3Nye;
	Tue, 17 Feb 2026 09:16:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHCL-00000007vC5-2seo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:16:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H1lhKD1441859
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MS3hOD6m1Xbn2MbT5juObO
	378HbR+C+3UhwUs/0y+8A=; b=Tqs9XoGqMHyJhDnFRxMTnUMq6VMJPXp5/OyAMf
	zLuLNEx/bq1D8lwYawytRf9T/eU9/VU+sIE68ljs6nsa4fBwzHjjSXZQkMRZhcsx
	pbVK1hda901a13I5jS/Oj9MwBAmdRJn/Qpd8Tm3MdATDxHL7cqRFjHWWKFBdXPBN
	5/5ryISPnlEU+88CPg9zFbp/YOqAcT0S4aoONWYHHcFL+7tE3+3AGVT+tPfEawvi
	L8JIUgoDnS4K1ZGTxWXfVIp09/kT06aUMqd76cfPEi1VxH86ee0SJemjD6eDKhcL
	29bWiGZYdiv1ML79O0UyF4Kw+o7eDdnY4G1rrjgSr1GcgI3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9ss7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:16:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso1534733085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319807; x=1771924607; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MS3hOD6m1Xbn2MbT5juObO378HbR+C+3UhwUs/0y+8A=;
        b=OSER//pf6sGeb8HipuAdzbe7sQUnZ+6odxQSQ0Cbq3aUKGgzqpPnvwGf6ulvsEnTjo
         L5ZfVAAyCrE4XG8YF9m76lCG3IP93jTMHpN1OcbxxkDnDIr6gtLn8XWzp2ij7xXGnUHz
         S2ydmgloFMBvLokXmvva0/Oq5EF6Bm49UfrprwBCHvlRH3fpv2h3qH5XsjYLFffjf5as
         JfNUhBEIcEEPETJtZcHin2UtT0TVKU415bxPqbnzmuPh7knOrU6JveJdrvmYpr4BRqJv
         kCfr6iO8j2dmXWzxTXU4mm2PMh4h0zciYlRPk2vVeXXD12F9GpjlPJ6ekC7hEUVPl4sn
         fv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319807; x=1771924607;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS3hOD6m1Xbn2MbT5juObO378HbR+C+3UhwUs/0y+8A=;
        b=U935MMaAScrtOuZIfSgeBPZi0oxn/4m0p5kAT4CzZBYGSne9n3EygzZ5h6UBdyi6sB
         mBBjTl+jFYQqF7cT5krPwe4rEeQUPLEaAU4sDMomgqPaOfpcuGZIeYq+PcTboousZh9Q
         IFdexKL8rTn/1gLQy41OGp5s6/nOpC758GgQGUFGXcnz17G7lhSEhACy89smZIbyciKP
         gpWT4VPVcnkN5LTzufQczMQoqmVyabwJuJK+G+AK4wKLqiwG4KyH2Dm+m8Zc0dxGFnPR
         yMP9ztPu5CKuoW23xJne8jEWGd4Sg2bS7GZrgEp/Q3jQtv3VE+VVNUKKZlUaFtJAw5V1
         x45g==
X-Forwarded-Encrypted: i=1; AJvYcCUr6lT+xLRevjIG8v5jVDBirnWVhkpgSC5IyMNayUJnmJi2gPfxHmn17vMyBmMpPHlIIBoUm78s9dxAnc36Ccpr@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDeF8Kfksm2Rm8o+fNAXfF8j+9xmu/fcQPFbwrIvDi3k95o0Z
	/QDHVKtFpn/6e+k00PjhwCdnDOvqcMRvscrFif5RSIX79zLbd2j/8PumtTW3m/UfXqD8jbpH66p
	MpbamEh3n6deS+RBrshgJ50RwbYOJAWPSzeUPYz2P3CgD0oH63WxqzBtXvijnl6YLhvZOIQ0wt/
	P5nA==
X-Gm-Gg: AZuq6aLxQ9ngR/ozIlSn1lnZqKV17HYwSNYJYuE9TOjaGVbOGoHOuPiS1cr3KJvtPaH
	6xpJWg9mCRc9E10RrPf/NZF0nATFScZk1GGeItc/n6MKBNEnZ6fy6OwqO38tqyOo6ue/S2+rJFR
	raV5OtNvgKfFDLG6oLu8e99f49deUA7PTaVratxredHUUAFW/OQ4JtOSTAJLKm/OaymM9P/zSW/
	ynVI3p9m+e0qYCpU0xFY/ZcriJbZd61GbaJyhbRUlCmcVPEkRdbTnkk6FsCUhth0VbZmXbrzF2e
	asShTltDXyfm4EScUb5/drCekSm+UWMQYAQPzUmTlQq9Yk0wYJUgOgsq27moUx81AZUwsb6t0Gu
	XycbVDnkvIDgV7ttI5/faIgR6hL+9xCrFpL8vi6aHC27Qog==
X-Received: by 2002:a05:620a:414d:b0:8ca:2bab:a0fb with SMTP id af79cd13be357-8cb4bf9783emr1280047385a.11.1771319807175;
        Tue, 17 Feb 2026 01:16:47 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8ca:2bab:a0fb with SMTP id af79cd13be357-8cb4bf9783emr1280045785a.11.1771319806731;
        Tue, 17 Feb 2026 01:16:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Date: Tue, 17 Feb 2026 10:16:35 +0100
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMxlGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nz3eL8ZN2S1PSiRN3EouQM3ezk/Ly0zHTdNMOUNGMLEyPzJEtTJaD
 mgqLUtMwKsMHRsbW1ACWU88FoAAAA
X-Change-ID: 20260217-soc-tegra-arch-kconfig-f1df38427b95
To: Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EztO9yRXq58OPjDRS7fRx/PH0JJemW9dGn7fxYyzExE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH3YqwrUc5NnLK3u8481htj/Zn2sG7whA5Iv
 AzVI/nZXu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx9wAKCRDBN2bmhouD
 1ymAD/4y7IU/yGqe2u4a7mxvx1zRiBj0RQGP2t7jdlE7edxzaLOPE4HIeRIJAZzQM3/G19zhuSb
 gTC8DAkCFCsI7JenmsJBdt3KsFkZpuB2KIaXzi/EmvrIeHdixEWJ5JptGCvAqIOk/gMFR/AoWTj
 WHA+9MRfI4b4+CsQ3uG/I4q3VUL+ozNFOY+f96xm1iRAf/v6QFqjcjSpyBLke9sKfF5x1m5bo5R
 INGD2yehKC4EUUoQLIrl3NKmkGVVqGztcIP62QA8ncqh9RTPf3V4xWyjOjtT1Vnuphst4f8dCdG
 qZCxR1XReZoLXVQx89LtioyuBMcbj9+6K+nlTNDaaJkyo8juSDCvyiaWj+8l79Q1Pi4BzOzJSc2
 vm5ma9c45TmjOqjtc5F0XfvmhBhenU6p/b2WQoCNenK6Flh3/u717niS6FVobyBIL8LxcMYUtoD
 LosyW0n+FCO2uJREwD3Ro/MmvW5K4kSlfR4KOr7cwr2OwBKnOsk+8kdu+X+pi96q+sGIqHgWE88
 1grbXtrvQfarY4xab3Qn/ll343iJ8NlkW3ADUR+9Ju16o0T2lBnCK5GSNrqDw+grJWambEH/O3s
 NEZFHqnZzoIShdCvTpSVh1ciw1w/ivjWuB/wVpue1N3vj5VDjA8H3JyB/8vYWEs0ar4bVabAH9k
 8PgbXlkJMisNN0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX6Y99irJNlRgV
 Sm1BvZ2efFmYOTY82gtKi/EEl7TfR0DoKpGs9E3OZoiy6Tf2021L4fXU05m6DNdxSxLEEKPbzmb
 iaK0xAiketj1k0iu14AnWHFK4sQuMAsm437RqaKfdYll7fH715s2kgw4yifZVYSxxz/E4KskC0b
 RYYmdfE7p1cBZds1DbeJUsCQWoc9BHPp8XWqFbNt3aPm5KVt8CO3v4x0dQuTZp4IK9fUcAFradM
 wj8JX75mwsTAnqb1pXV//W6IR9GESUJZEVW0nptPH7patdGuh7sjY3ZA3yR01JZyyHfJcV5sp0i
 mdkxIzEyA9tp6PGHRSmQRsFZ8tJvfTeqvhXUTAoE0T0V2SQ68g7NS3Txx6Pv1LHD7PNEleTjYgh
 iVmd6fZs+kYQZcPaL6kb6t9lB6LjxsBpmVJIbmZj0rzE0q3SzyhRaANP2EOE4ouKE9Jub5b0ADG
 JZoCkqrQgWM2QNsOaGw==
X-Proofpoint-GUID: S-nKrfyV8Kn7VrCv_9yO1Y7z4tXRYmKe
X-Proofpoint-ORIG-GUID: S-nKrfyV8Kn7VrCv_9yO1Y7z4tXRYmKe
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=699431ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=8zlw5Bu2NciGkZGQnRMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_011649_866373_E0F780FD 
X-CRM114-Status: GOOD (  12.72  )
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

Renesas was fixed (thanks folks!), so let's fix this one myself.

By convention, only one globally selectable ARCH_PLATFORM is expected
for given SoC platform, defined in arch/arm64/Kconfig.platforms or
arch/arm/mach-*/Kconfig, because we target a single multi-platform
kernel image.

Dependency
==========
Further (2 and 3) patches depend on the first one, so should be taken
via one branch or some cross-branch-merges.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for Nvidia Tegra
      ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
      arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

 arch/arm/configs/multi_v7_defconfig |  4 ----
 arch/arm/configs/tegra_defconfig    |  4 ----
 arch/arm64/configs/defconfig        |  7 -------
 drivers/soc/tegra/Kconfig           | 11 +++++++++++
 4 files changed, 11 insertions(+), 15 deletions(-)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-soc-tegra-arch-kconfig-f1df38427b95

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


