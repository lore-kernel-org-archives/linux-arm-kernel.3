Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BC9FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3ufzsgyvNFjBRE8/ddg1ljmJXjnhpyf6EcPBtxg5ec=; b=SKTWYyy7LapSyf
	orCmcgIUNlxMM0A6BfPepoXMBW/siWt2QAHBzyH8HsJR7XKyJ/v7DwrpSTrVjRv+M4usRo4FMaUoJ
	qSEkvq0lEOOZhyySKW/BqPs81GvPJ4qXouz9cmpqJL3ZuBR91kUYmHOHzIxlpdwjt3xx/0ZgB8BBQ
	lOzmLUh94Kx5V+mBDzGF388KThk/lDxAmZSPk37EckkNcsgZrrs9rCYxQkYKBhtYbN08LV2R+tyJT
	UqG44fNnH7wVAdq17cKdWQUQk+VSFMJdy1q0BCVZrala0vjvSjVmfS1vwiDzxL3JHO501NpxEdMWb
	Blas6eTAHXSaerhB/NUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxX-00000005Uh3-0fhR;
	Thu, 30 Apr 2026 12:57:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxT-00000005Ug4-3w2i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:57:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UArHZg2907502
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d3ufzsgyvNFjBRE8/ddg1l
	jmJXjnhpyf6EcPBtxg5ec=; b=WgNT3htZaAeMrIvkm7LTEiHtclZ7ivdZlbhsRq
	hgZDmsR0QJqXEDxNbkzGOhlrn0+XXO6e95RFmVQH9jhYixvWZtpQSP4IEEfqX0Fi
	TFuq+dISCFZILrc3isjOy0WaJYDkbOKsQ6dsnyz+Sgv7UEGmjGvz2r1qmARBJd9k
	nTJatGQ1GZm46A4JQ+DxQHkl1i2J8eEhIm538FIhrFTi7MybHRQTZn7+auM7Lgcs
	blGM9WgkxM9x/NmhhY8fo3cwLWGiJXFMrJbuRgthpXgCUlTKr3WKdiXMPxKkabjW
	pszBbXrs8ObQlQtaRc8mByt66gDJDtqfy/uvt9cqiU2Z1FAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfa23j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so8604941cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553854; x=1778158654; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3ufzsgyvNFjBRE8/ddg1ljmJXjnhpyf6EcPBtxg5ec=;
        b=d4Nytfi2YTnJ1gWzV+UihHdgDsszg29Kp/Veh+h0wMuI3BWEIlTMBylUJZxibnzQsh
         dBpGtEyiibbvKG9cQ6kmx3deFVdVoUenNxGVjZ7sokf3laj75Q+KzVdMqAoe+sn1NwIo
         djNg9votdD+zTSqaqrMXTY3G5Gzf9eUTPkZW3pjx3WZlEBeHK9KiRLfXFeTIYawK4lTA
         VaEysXijcsopiitFIUnVdhMts5g1sx1DyZstm35Ru7L6CNTcdlN+Xm6iTb8RXDjopOv3
         5GAms0Rc0DYzm6RcVptVbTVlhewbfRRDcJ+j90waaJa4vBD0cFSb/tyLtOhJcoWD0+ZT
         usOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553854; x=1778158654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ufzsgyvNFjBRE8/ddg1ljmJXjnhpyf6EcPBtxg5ec=;
        b=YgRNxiyYMH8K18/51jNrldNfDmKuq3ZctDvtg+zkKq1z87oSMJxnE8N2/bBQxnpMwt
         vNhcxROC/s6PRLlHouDVKWxmsSRogoJulHwCKZ0Uc/gpzOUWUD96F+6WGHxccvKIEQAi
         KgaePPXHaByvi4FF+AYT0VEzo3YDpeoEbjbFHPVDr1fwOxf+FeB2UKFNs1Ga8Y5visNT
         URt1ouMd84mO0Y/Yo9e1XRTvDrkBDF3EzuBvpgnAItX3ayIsH1kSCtdBdqP0H4t92/Wa
         P7mllE2EJOysbPVar2j1Ujvsw4V3YGmcknJx7WKaC0iFVPgWeSjtqK+kirbZOMEsj2Pc
         X8Hg==
X-Forwarded-Encrypted: i=1; AFNElJ9vOQievLxOMltEpz8/tVkkRcx+mCAAgoAjBX/aiPpQcKmKtD2PueaimljO9JhtsEVgLB5ZF2JnO8Ye7TtAbc6M@lists.infradead.org
X-Gm-Message-State: AOJu0YxaXV0qPLuAcrM0cxgdOYnCBrsML8bxSm8yhzI5WkxWvlzLBgRY
	ihUljhrRmNK2u0IE0RBhVrkcnX9g8nBCWbeUA5z8Ys9c8Anja2ut1sJR1cfXvm1HdLXQBePx/wB
	w0EYW00pNxqkBSvq1sdkaGrPDsY65P6y+SboHi2cuQ3NhcIUChD8G++4hUusHy+r1TET1LW2d5K
	bnOA==
X-Gm-Gg: AeBDievmasyA3SmLlozf59a72oJfm35V6hIHXCdy7FSM2kLrtcR+dJ+o1w0P/39u4gb
	KUmD5AHu4HklBqwUkflMsWaHYOKzQ4UvGEm4wgB6by85WuzvMvJolNgTgTZtArZuCBhATsYtHio
	SRiShRrFBleWXXEwEY47SSjA8Qe25oFVJAO3Y+amMkG6cSU8IGU3+VUpmzKsurRdX+kBSwXgMyf
	EHYfh+mpKgJT9x1F/m2OBvqFNsNkC4sLrjhu8LvAtzp66bdcVN67IDp9piFZ+B0jPibGz1+85pr
	QAtikh04Np34vo2CoIyzSZPJNOfeu78hj+v6+pYQ52gP8JwaU+ZkdhrTAp3fxLOlB320qOO40Xe
	q7l2sEOaGgmLQ3hXBaWzlwcm5o7kogQfHTzIjTs/SyGl85unMxdmULZ32rpWxMQ==
X-Received: by 2002:a05:622a:c3:b0:50d:83d7:686a with SMTP id d75a77b69052e-5102ae16055mr34237471cf.40.1777553854203;
        Thu, 30 Apr 2026 05:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:c3:b0:50d:83d7:686a with SMTP id d75a77b69052e-5102ae16055mr34236941cf.40.1777553853696;
        Thu, 30 Apr 2026 05:57:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] ARM: pxa: attach software nodes to the GPIO
 controllers
Date: Thu, 30 Apr 2026 14:57:17 +0200
Message-Id: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1R82kC/23NSw6CMBCA4auQri3pg5TqynsYF5VOoYlQ7GjFE
 O5uITEudDPJP8l8MxOE6AHJoZhJhOTRhyGH3BWk6czQAvU2NxFMKCYlo+NkaDv6QPE5BAtIuRR
 Gc+M4A0ny2RjB+WkjT+fcncd7iK/tQ+Lr9oPxXyxxyqhTymplObPaHgNieXuYaxP6vsyDrGYSX
 6cS9R9HZEcr14jqsoeaV3+cZVnedeaQSP8AAAA=
X-Change-ID: 20260330-pxa-gpio-swnodes-132a81af10e3
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zE1wkg19bTTKTBR6uB76uaks20UgJ9yPFLyhDQR/6Ag=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81GzxouoE5lPdjQ83204u2PKVGz1mRPJGUjDI
 vBtDniD1FqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRswAKCRAFnS7L/zaE
 w2qXD/wN2uqRMeHAfMw8LhHN9iSTSiiwSKy/MIVXnvGelgbVZSZC+XDKjeECNNQjcGs/s8OwUdc
 Vowr+dUJ014vJeDu8Z47CJiDdirBPBic9PqWrt8Ihg1pghBiSjcv9C20RTag2pTz1p+3T7QdHy0
 d0yHPUnXGW3Hsn+Wq0x3MVl7jiB474KKQH5tBOkXXcM6z/FoKpPbbQNfBFwj/OHd9aISvgg77s2
 HLLqkEtBHC8DWkwu2F4oFiGtHZChEvZ+4HeRRxDhBcyvSEYtRorDDpmA3eaCAptgxU3XilRN63B
 a44KYLAWU33QFLfCEorlU1qqscPkEzYjntKctqGENdw6k4iJ5FRCpbrO5YFQhcp6hoUio9Ibl9J
 eX3QrYpp0y514i5wF7Di7m/iiucZoligUX8GfN059rtQJPn6PYZN8qC5SDnBCPJA+Vq9WxKSVZT
 7qlFLcKYHRRbo2BHuq98gb+5qCArZBw0pwoxzxhf8Y76QMlYBkLxnDOHw2i2G5RMt0TbGRPQPRR
 qQk84GJnqIQly6EW6+1r/AovRuA3qSG8JuAubVQREzDPexFa6xWP2LMNL2dKkM0M6r/RZAxUif+
 HRoil+TQ3X+Se9q4mmpw1pUl9EOTcIOXz/gaNIG9OV7qIGXb/Y1n9EjbrUXdLMKzDw3WAYegdMk
 hElNJbnW/U5JJJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX5hoaGznH1HNJ
 atRIRBMv1uMWBqSEN7uxUKKiCBUw2+wN/3bBZHx7VJbgANcg4j+con1LbmltPspQ/ToJW/g/J3r
 834IkWTurMW69d/BGfQGiDdQBkViX7cdjLBgFymmEDTmIuT7SyCDHl8YYI6No/dMgIfr40VNA7r
 CVI+70WH3a+fGd/qh+Cqo7TWPkDyTy++onjnorhaCv9z+MZ869+o1xCpw2GcvbL89DuBVGksXKS
 gqcFddthN4f3U/UdEIDPu4XfLw++srhZBmjtZFkBLlpZG4We4hJGeaIuftIDuKnSXJs0HQVEwYa
 tt580cVJnJ1gm99UCGN959upeAjNpGCqNEUew6tl1i5ZrfYrjGFrvtpWredxjpOiXg08Vh0Wgn1
 zEz+V8PV6/CijMY7wDQkvlwxCVFDZC/PZK+hpZ05pL2Nb3Lo3S/G4E4uJ38bTgoKP3FANZ2Q3Mu
 tH7cz0dLFhP1MZFJgvw==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f351bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5j7h0pFm_H_taD54xyYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 0JRmK6z2I9hQCPt65gOaJPVZHpQnIsKC
X-Proofpoint-GUID: 0JRmK6z2I9hQCPt65gOaJPVZHpQnIsKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055736_006098_0A190982 
X-CRM114-Status: GOOD (  16.71  )
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

Convert GPIO controllers and their consumers on the PXA platform to using
"attached" software nodes. Since everything happens in a bord-file, it's
quite straightforward. We technically now have a way of passing an
unregistered software node to platform_device_register_full() but that
requires using struct platform_device_info and since the existing
platform devices are either referenced from other places or defined in a
different compilation unit, I wanted to reduce the impact of the changes
I can't test and went with the older method.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Simplify patches 3/4 and 4/4 by leaving the devices in the existing
  list and limiting the changes to the fwnode assignment
- Link to v2: https://patch.msgid.link/20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com

Changes in v2:
- Rebase on top of v7.1-rc1
- Add a patch making some platform device definitions static
- Link to v1: https://patch.msgid.link/20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      ARM: pxa: statify platform device definitions in spitz board file
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c |  3 +++
 arch/arm/mach-pxa/pxa27x.c |  3 +++
 arch/arm/mach-pxa/spitz.c  | 11 ++++++++---
 3 files changed, 14 insertions(+), 3 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-pxa-gpio-swnodes-132a81af10e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


