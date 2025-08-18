Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o7I5IvyDpDsrud1uxxC1FOtgxPWQpfNuEtfugWVnsak=; b=Wnkg6pLO7P0Jfd
	5DaySkrApkKDH5HE+K6d5CRJnc4M2qGwO/cJ9MBrCm5WMMCD0dKAuVHXRS2nXX3Y8i3I1pbVjZ0Rr
	0sEx52HD7bSVITCGQzP0135DOjS+gjKCnWxEiObzy777XnIIhLPwkE/TXtoTfcVfGGHVnaaRO2ADj
	mKIgOQCYI2A9xErZe+7RH9oCFFledjcbRjC5rt/4To02zKUUU+uEJlnVHsMaIW9MLIrsP7qpC92vT
	4HFXKrQ4DeBTIlfkNHXrD5KCTqpEWhMIxP8qvUdmQZY+iWSwMmd+sKlgnRy8l+XhQ7hdXNeKVvqB1
	wEiR2/+JeKeeieUYSVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsC6-00000006Wux-43r3;
	Mon, 18 Aug 2025 05:14:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrgi-00000006U97-3lZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:41:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HM9AsS012131
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o7I5IvyDpDsrud1uxxC1FO
	tgxPWQpfNuEtfugWVnsak=; b=UOYTTFc/erC4fPfz8RAalVneWLd/EESS33toDB
	PwesgbCjJ+s1P6mFrJb19zLedA5k4WoiFJSaqY3ZAfKBk+ZkDABVmZNQYu1QxeSG
	sQ85p0v2Kix9UzlRs1MRjTTlsgwsUkHntLZ1QYwya2PJOi9ui/1AFr2+m0LVZsKp
	ydqYbKlzAeW4xdkZS8q5Pjg2aN4XryCzzgD/CzW2j4alxg4sD2vv9W5s7eSMRvVC
	xlBdu9BTQVeaLaz5yySVdUbHN0hxuMY4cx77EnTdrAvqzgVZe9VwffnhUglBJtsn
	8NjaIDkIB3Nqwx1UX+6JChHmqPQsdIyWeU4ykEN9LisD06Ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7u7xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:41:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458121274so43455935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 21:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492098; x=1756096898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7I5IvyDpDsrud1uxxC1FOtgxPWQpfNuEtfugWVnsak=;
        b=BSHlZINbIfU3MjfZJmXL72iZT2eluP+iuFVFtx9DR0HiNzRxBd2PAsErJPcHp9xIBu
         9c1pBmGDd7JwU71l8KZAEEIT0AjWI14IUjI+i99V4JJl+iun0F5QLnEBc71QJSZxw2KT
         msw/b3zk2vm6bWZ+0xPhb9bw7Po8nD5aBbKJH00q2GgyQAAK5ShnO7aNpvz+P+DGC6+G
         eI+iaNG5VFEaCiEUtIiI+YJpxbzCZC8CrYQrR15m+rxGPEbwme9qrV3BxMnKIYMz1d5p
         EltO752ISleRmzRPcTXxrfBaypr0Zq1n53AGQVbzaBo88+1l+b0GYEwEtMMi8V/kgZPV
         8AFg==
X-Forwarded-Encrypted: i=1; AJvYcCWRKya5EkPgvFTxfDfOdP+/lXaHva1gLtRQz6UvHSLGLnJonpCFbzMnixotqPQLQ0tXypo8KcySu94VoXjOCp+y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3dgOdjcFBiCDG55q77L5riNjHyg82Im3qPAGbw6jvdvSJzzVQ
	P7FwSnf4xkEdRGSjCv7gpvkNkJWEK+WckERFzG0bE5Hy9HFgPDAAnz7mEKn00xJoUgqETLYfm39
	ZcUEOZsk8mHDOU1rCzH32qENolFO+3ehBdATonx7a00Pz06i9z7dGbezUwzgZMuafPOLGtOu87C
	tJGg==
X-Gm-Gg: ASbGnctm7THRZN2fuI3sqOnxc8P9vbBs2KYCQ0J/xZ0oqHrfNjxj70cRxt+Jn72bTGL
	ZlBfiPG+CN8WtEScEZa84dHDEwuDagTCdoNspvJKcm4+u6Sl3FyAdMrM2ow/HhmQdrRCh4DRXAv
	0Oe1ir4+F1Nm1LG4NeYaeQzgqNllBbE/SGl3Ei9kGxRPHkrymJk0q+KpXwAdzxMGY1pgoZ8fYLx
	1hq8xq4UP9rbYFnS2lcxxemqmL94QKZ1evv4pjQvPYwyCfCNz49iLSDxSt8IABmM/sn3ohVKSUC
	RC3fFX30kLXxasDF+TQ1TK8zEUUh1tZdswnklimwA3V9Vv+lbxBheWkwz0bAqBA0VuWxOVE+IhB
	gRCFTWjsYmahmveV9MiaWd4dtYVvKdAD6vIiCE7XvN2t46hUACSyzhOlN
X-Received: by 2002:a17:903:2288:b0:240:50ef:2ed8 with SMTP id d9443c01a7336-2446d756f99mr124189115ad.21.1755492098147;
        Sun, 17 Aug 2025 21:41:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgpeqD4kU2YgdCDwpl0WnaZOy8L39AQdgkY4anazhYf3iTsVeZyOcpkw9FZe+ue2OHfVzGWA==
X-Received: by 2002:a17:903:2288:b0:240:50ef:2ed8 with SMTP id d9443c01a7336-2446d756f99mr124188845ad.21.1755492097690;
        Sun, 17 Aug 2025 21:41:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ba5fsm67547155ad.113.2025.08.17.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:41:37 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Subject: [PATCH 0/2] Modularize SX150X GPIO expander
Date: Mon, 18 Aug 2025 12:41:22 +0800
Message-Id: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOuomgC/x3NQQrCMBBG4auUWTuQKYQWryIuQvOnDmgSJijB0
 rsbXH6b9w5qMEWj63SQ4aNNSx6Qy0TbI+QdrHGYZjd7t8rKrxLfz2D6Bbcu3nXeqxZGryFHGG9
 IS4ouLF6ERqUakvb/4XY/zx8W8Q5GcQAAAA==
X-Change-ID: 20250818-modularize-sx150x-gpio-expander-cef7fd0a7511
To: Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755492094; l=653;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=uDnTCUlVtYUEnhAsmvmthDUWGvkn8yZ73+H3knBCChU=;
 b=jTwENWg0yo/FzfRh8Zq338WcnEPGHT7GBuPKLFuCbN8N5GU0P4PIlg8/A8qeEl4WfIzqif4Fn
 CiriMa59r6LC/Zhw+QRK78H2UqOPYMaH/Zx3qxA26aS9ASWcv4BjKHq
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX9hZytUwV0mzN
 BkDml+MsGa0oEew1+ePk5A/i+9eHjhcn+M59LP0WqppFKVb0nm1eWoYLEfsF+LmaVpwzSSVYR/g
 XxGAVHYfKZwXvaES+UKN55uEecl+S/JE/ugKuVa88sO6MhA6BgI6YLW5hMF508/K7MHCfxlbjZT
 pHNEbdKh/w9pPX4RtUjKtn5gqNGWiGLOFYIk3cxoj+IBAOqO1fdqlAuBLJ9mmKOt/m1FPcgnOzx
 nsjhS8f2ysaJwsHY62FFoCunkEVmlHPIkmGs5OCgeWNYf46xsD/V+DUZCOWTJ/k5sK+Ql3r0W6l
 teBZ4QO6CLbNFzbNFY0QDbZVbxk7xAF3wzLr8QhnRsoRz4vYBUH/vRUNEGbwkyGtADuOt9K1ZZY
 78KthTsv
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a2af03 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=li5FUaLgavnFvxL7-nUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hyDnQuwW2wVPn52sVxJpFkx09dMnNgqa
X-Proofpoint-ORIG-GUID: hyDnQuwW2wVPn52sVxJpFkx09dMnNgqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_214141_062453_91695BFA 
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

The ANX7625 relies on SX150X-controlled GPIOs for reset and HPD for
the QCS615 Ride board

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
Fange Zhang (2):
      pinctrl: sx150x: Make the driver tristate
      arm64: defconfig: Modularize SX150X GPIO expander

 arch/arm64/configs/defconfig     | 1 +
 drivers/pinctrl/Kconfig          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20250818-modularize-sx150x-gpio-expander-cef7fd0a7511

Best regards,
-- 
Fange Zhang <fange.zhang@oss.qualcomm.com>


