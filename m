Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758E0D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e91dx2Lt0A/p1SGAlZ5HpZ8yspCC620dBzh1TkoZPcU=; b=H0qlhCBBWNVh4B
	ly7pSe1j2ARSjMYk888uAvCkZEyybWVb+q+BMFXLLwJp4Uc78CbAF/VFcmnLs4XaLbo/B56EeIC5V
	EPmmk0mZjKDwm2UyGxP0giGt2fU3cdAA3H1rm8lwtuGr5132nkzE5q3YcPbbrupZwlllo18K32nBn
	F1XUfAfrXr9ficXJjWlyvphVKV1GEUHt/DdI90Xi0dgMItYfqVGNQ1C7Suiimc8YtgMMBqt81v1zH
	BopApQhFCtsK7nArbb4/OdRXzU1vKwUOuE8S3QEV2AnSWDCpmzrO8zRiMMJnNhKrY3hVvWl5y00Oa
	rbKjarjkKf1ZZCPRObbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXE1-00000000fV5-0rwx;
	Sun, 18 Jan 2026 18:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXDy-00000000fSg-1xGr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I5JKlF1994771
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e91dx2Lt0A/p1SGAlZ5HpZ
	8yspCC620dBzh1TkoZPcU=; b=ln8b4JIBtx2p2ndYbdcg7hBkEyb8pP5Fi+t9R2
	NB1P7oS6+ntgck1paeRGEG8rADyKM5ndWs1zZ+0RDq5mVA20ILOZTncnS3WdLapj
	TMk3+Ewh2PB2rVic9DZcHeU5jFpYMoABdSAjGNbAWlZrcyA/s+7t0xc6gaVA8eX7
	8QSsd2x7S2YKQWVdl5sEJHTqIKs7GeR4L5HbZLzL/s61kBoysGTYHvJpvKSiyKVE
	VbErM39U3kx54UlqVR1FsyaYP+c683FhscWbonpJQ1M5STzco0LUqT54xVB3qcmS
	JyVCbC0XT7qfVkbZCwUOfTtI86DXgn86xnEgU6+1vgUHGC8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e34xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b4058909so290578285a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759803; x=1769364603; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e91dx2Lt0A/p1SGAlZ5HpZ8yspCC620dBzh1TkoZPcU=;
        b=jPY1FGKnmZ5d+2cZ5FVfQiJ7jc4TAg4I5t/hlEdriLNWK25/PDPN6byORLfH7MSFvK
         iq4D9HLmz3d3Em0WT05CZW2a2tWoNk67gydLeDiEWGZF0c2ksVf7hVY7/VCgaEHrWxzp
         9oC54GFN3bjuo7/Coy8O4m7bkdubzy2k61PyueoPuE9apKhPpo7H/nXdeh4/2qddxniH
         2B0DQ3aeeROvf5AIS4KmYTqyXBX1wm/MUyUOmGEnxZuFDOQIYArxdpDxMr+JsnUq0KOH
         q+S2QZAkdKwKv0YDdNRZWqNSQS2chkWxcoc4CU2yZfhyIcElLHLRfjrGK8G3+rxM6uzX
         wI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759803; x=1769364603;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e91dx2Lt0A/p1SGAlZ5HpZ8yspCC620dBzh1TkoZPcU=;
        b=TUh4g0kBusLBDL5Zkce+kxve9o1SHoHC3wG3FBnRmFrq1Txqu3SYLJOOe45VzbKYLl
         k1x6TpVCuoaEZ/LtMxobxpUEIwbnhsRNk465kGpwPnbUbVIAZmhYt6GQRuZ2udei70Ka
         qYyUIm4wWOR/d+oHl7oRuv2vWpLxFtgq89vt1r8jvH7FEk5aXWSHoWOhflO2VALmewTX
         2yfyUeSplfx2mCmIgAbrz5aG0rud1k/B5N7B+2ZL7oX7IeQEDJ1rOPpDKt9ySZe+jCg7
         XN7K/WajtwKRrJNHFoR3oP03gM9M7TmrGp7ud6ERwT1FT8+Fe4wzz5Qy6c0WFaoq49e9
         DfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYRNg4WeYXjW33oVE9lTt0Z6BqiKZ7VUrqK27Xtyya4+XLGN/TgXshu4o3ED44Eao7yjgX5Wb4za2+/7z7KXmg@lists.infradead.org
X-Gm-Message-State: AOJu0YzSXFTmYdNgECXkRfUwWF+ywdE+iVD7Ev3s6lKg3xvf6/m+rzXg
	9+efG6iMQb27fA2wO6CkTrBsrl0HdDzAKq0hmRXuBtoQsvJv4PT8yDaHQAMJPEBcaANBYf5llH8
	2f2ecfEvOqsaJtxt8sFcoTPHVWoWMlVMD0k/RBwBo9yQI7PV09jr4LCUJXwW7wfNu5ywP2nWfRc
	LTfQ==
X-Gm-Gg: AY/fxX4qBCeOAJE0tP2v25NTJbJaOSkWkEDXbKI6VKwPpDPhq0Fd0HNQ31GonqSRsbB
	VRReXsM4Fj9uDdSoSPo+rYBSWeeI7RQEt26N7YZt2KJ2vSu9LG2BO/UzaFL6b+gGWxUfZH4dIw5
	JjMQjIakAKxcnLg8FdmP8u6K1OUqCH9cghlGg0Q54rQB8sE2yAM3Q4ZpZZfvcIiU1AeabhvFOrH
	DZcVW3FxpmtlwTX3pwu0txntfr8dmAMvy5390/xOFQxGMyhnddEZ0RrxAk9+Q6m0DVSGCd8fjml
	9eahwddzmRAd+tzPK+q3ktMJbT4UVmd7Yzs54PgB0OPrQmkPVLGz/cYoppDtcZ2O35UHzfJsIis
	yLVPye8AbBRvxxeBKT7N7cjeCeZmjLOQNcw==
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8c6a676deefmr1375659285a.51.1768759803204;
        Sun, 18 Jan 2026 10:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id af79cd13be357-8c6a676deefmr1375653585a.51.1768759802656;
        Sun, 18 Jan 2026 10:10:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] pinctrl: Some code cleanup including guards
Date: Sun, 18 Jan 2026 19:09:23 +0100
Message-Id: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMhbWkC/4WNQQ6DIBREr2L+ut8IotWueo/GBQLVnyhYUNLGe
 PdSL9DNJG+SebNDMJ5MgFu2gzeRAjmbgF8yUKO0g0HSiYEXvC4YE7iQVaufUE1G2m3BYZNeo27
 athdt2fS8hrRdvHnS+/Q+usQjhdX5z3kT2a/9Z4wMC5RMVFdeN5XS5d2FkL82OSk3z3kK6I7j+
 AIC5y64wQAAAA==
X-Change-ID: 20260114-pinctrl-cleanup-guard-d899b4938b26
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKxtqE6F8oVTPGmj41LTMmFmCHa0XUBAz9pzJ7TKy6A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHgS/sC9MoC46kLct9nO207FP02f+ZKWuWF4
 x/5aXRVPPqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h4AAKCRDBN2bmhouD
 14R3D/4jKkbCQoTMPrMXhhxCHhrjeKIra3ZsTo8nPBiXx1ID7N9lPwzEIYwEZO8B49U/Q01dq5+
 fUCazLvlHLe2RVwJypxPbjPXDZEh3HAfgP6uvjK+JegThArZiW7Msp/3kWgL7JRn2WAZr4FJOVE
 MhnYZ0KcknqqK3deee26SYH9o7TYNQpnT5HC5fu4m8bFgWNDfZ4f8EMv1rKquIp/HWdPb437xjK
 gdyrQCSvr2uGwRe7V3JHT13jrs8B1if8tfgU1U64WlPSQlcIvvft1IJX+mbe8rzvpggj4Uu7hem
 +pTVezsrkvRW5z+WRI7I7opzoBaGi0qFTUibXhzbG42KeuGaJCCvY3r6Kf+mgf6aaRfPhvR22Yv
 EfcagSijmlL2S5tZv8KR2yes9TEOLqDFKf/P6IrD/+WnGPgNf74qHRpqPnmIPVcACbbA1PgkREr
 zT5pT2C8Thpf7dvRv6PzP4FJs5pDS1EfusuHXjRKP740bHrWrLOFVFvVau9MYu7Ft064VpIS5KN
 BHE9uwTEtyCczL+C7z2TbfRGHmW2/mQqt9z/bk9EJJLp7iGmOsat40UDsozN9a/2VAKC2S8GziS
 HzceKkh1lcWCJVgmwBcKgtQnMHvwF0PT/ni39xYB4PY+aRw8ESy90SUN8GoKJ4qvhbAiSolNd8w
 X8uqy5r2f8iL1YA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696d21fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=SAbWReso6WKF-fSag6gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX157khsMvMNaw
 um9D+6rXRwNrMAUmdZcCxl6hLShjYeULd3r1UKFWnJoLzfqzces5rf3LFPz+51pLNU4O5EzTw5H
 hnJPsf7zDrvMbuSrbsUM7FwCG5LhkVSeEUBiiFo8I2iC8YHtHhfw65I/LpnGULjrh6oMl5UhGSU
 eMzpNxqpJqzNbGgWU4vPJGq8/jcArKa9bFCx47w56snzMrohkSMvbMxJUU19ryvTqAr0n1Vli8r
 2WKYoxSqTs4Goh8UzoSD7BsltCVDzUSe3OkQDEVs4dKWrNqSlyIUFT6CaxlhENEGp4m29hE2Hmx
 Lw17nwLg7DRrxdBI9MHGnS+kXkMf2FLfpHvi0vlbw+OFA1uVUpWPkjq97+ddrbma1Hcug8ZRtMn
 NLRmfIN1unbRYgmJEWH2Yfopyry0rTIFCKFfjTIG9CbUQeJrIQjzDHLDOMo8Q9Af6ZzJ8zhf29w
 P+/G3SyFXX/8TE8z0gA==
X-Proofpoint-GUID: SFit1ouEWYyjKbymG74MnoWt-u6BlxZz
X-Proofpoint-ORIG-GUID: SFit1ouEWYyjKbymG74MnoWt-u6BlxZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101006_507644_9A33F6EF 
X-CRM114-Status: GOOD (  11.35  )
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
- Patch #9 (pinctrl: tegra-xusb) - Drop stale mutex_unlock (Jon)
- Add tags
- Link to v1: https://patch.msgid.link/20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com

Few cleanups - from unused headers - or code simplifyings, including
usage of guards when beneficial.  I did not conver cases where guards
would be mixed with gotos, because this is discouraged practice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      pinctrl: aspeed: Cleanup header includes
      pinctrl: starfive: jh7110-sys: Cleanup header includes
      pinctrl: sophgo: Cleanup header includes
      pinctrl: amd: Cleanup header includes
      pinctrl: aw9523: Simplify locking with guard()
      pinctrl: microchip-sgpio: Simplify locking with guard()
      pinctrl: tb10x: Simplify locking with guard()
      pinctrl: tegra-xusb: Return void in padctl enable/disable functions
      pinctrl: tegra-xusb: Simplify locking with guard()
      pinctrl: rockchip: Simplify locking with scoped_guard()
      pinctrl: st: Annotate st_pinconf_dbg_show() as holding mutex

 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  5 +-
 drivers/pinctrl/pinctrl-amd.c                      |  2 -
 drivers/pinctrl/pinctrl-aw9523.c                   | 53 ++++++++++------------
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |  6 +--
 drivers/pinctrl/pinctrl-rockchip.c                 | 19 ++++----
 drivers/pinctrl/pinctrl-st.c                       |  1 +
 drivers/pinctrl/pinctrl-tb10x.c                    | 17 ++-----
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            |  4 --
 drivers/pinctrl/sophgo/pinctrl-sg2042.h            |  6 ---
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |  3 --
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         | 30 ++++++------
 13 files changed, 55 insertions(+), 98 deletions(-)
---
base-commit: ba124fc31bca9f5158f9bc00ac5ce38154b57007
change-id: 20260114-pinctrl-cleanup-guard-d899b4938b26

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


