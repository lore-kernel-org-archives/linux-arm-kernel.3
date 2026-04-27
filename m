Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CECFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wVJly2KbK/XJ3iSoKi7tMWmJlaWYkcPh5yIHu0NXuKQ=; b=J30UdX4maKdbw4
	PkHzO9mpKdiBMAWCcbTq/iZFGmUyYXFmv/VeJONA5pMk6XHcWRaF17seyDqORXDoN0NtzYMeRYLHy
	CZrEi3ykxhD0duqZvoq+pWcj7sDR8fIDbA6Xo6bchl30P7/UysQTwojIwjr62Riwy+5grqS4RZZKc
	UxeHqv6M6bt1YpPnHeUZm0oUQ+mfLzlIOs322BNZVpe8EEfHME1ztOc5Kn425EbWpJzlf1fRoINsJ
	bCaX7Ic27xk4fTK0BnsCuTF3j0MVP3P3XO6g8Nu8494rd6Ihzy72yqB3zplX7eQ+sHJMEQbtv15Ha
	fEgpruu+lvCmC6LBdsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzP-0000000GfRl-2hPy;
	Mon, 27 Apr 2026 10:14:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzM-0000000GfQq-1ico
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:14:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TGRI665743
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wVJly2KbK/XJ3iSoKi7tMW
	mJlaWYkcPh5yIHu0NXuKQ=; b=FvQOGicR6U8nmh+NuB1O9hXzAa/M3GXY/wdiXw
	pgd2o2VeS1oVJr9mESXTQU/Af7qpRJpYYGyBe4s9JUUsvOtFKuR+3GZJjIgv7fvq
	qvHa1lKfnubf7CC/FPRSfdJCoT5UYdY6GeoPPC6xm5dzNetZj4jM1SQcqpCKA8HR
	BsEn4lcBKoQdrRDXooikYgH58P5OPnLlrrzehf+5YogGa5QycQkNRmUM9T24aixl
	hEdmwkGCgXVpY6h46WZdDC8PePT+0LsxiAXj12JqExZRI8d45rhSWxBX4UBBUla5
	0V6G05H7DujNIHcZbPf5q/C5jP9S/9XLNyLFScnigrERR9wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0w2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fae95c82cso177190761cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284891; x=1777889691; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVJly2KbK/XJ3iSoKi7tMWmJlaWYkcPh5yIHu0NXuKQ=;
        b=ETYFqNw1FyhTUr5qk2MqVJKvpU3u50umPC1QNDWD/DWJwUoyK78b8esIrsh8Z6w28o
         bbMzUqF1FgCci5FJXC/LfNAlhjO8H6514DNgK8yPPNdGCd4wtkor4FcuyykGTcje/XKF
         BUU1H5QywpPdbvIuLN9nLtU8QENM0A43Y0iq4avQL0zkur/C4oW2OxaCUw3ILl1NVgVn
         hMMH6ZMcyskO8SfS4L1Rp4OPv7i0h7rcORtqoRSFW7+91BFNHyVSdykQ49kjGJA8kpSd
         5WOgAVoC1gHljfCWL7VeG5SUzrc0Oh1KMZhx5XuBuxMv7N+UUBCUazBKgSPSsc0hWJES
         4CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284891; x=1777889691;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVJly2KbK/XJ3iSoKi7tMWmJlaWYkcPh5yIHu0NXuKQ=;
        b=TrWb69F14Y2gnJzPlU+zG8ArKEi2ktGG/HOw0TBEPRD2CoWBVdbrZJ4iC/uJYYXzTq
         FDg1OxEQMpkRYumiIgUvIcGmv4uSvHvrhkHULQJVqzDWpJTUOWPg51E8zvZ1Vre6XlfO
         pR395F/wQjUm0j1lilgzJ2uEeyaqWQvNGAB6+ZvVuTFA8Z5d/v3pF2DotJnL3fF/m/8j
         MnX2oWKyUkKHd4yFYOQaLlAfaVCfRzpCKM8MKxC9YoG21O+b7Ji5sqwM6ayQ8m7iXWQx
         jM35Ylsf/8Yvd4nbkA6OuGO+y1l9c5lgXrmb4AoF73z5omB+ZrfHT29DMbyej3/m/Dbd
         609Q==
X-Forwarded-Encrypted: i=1; AFNElJ8JCI7M5MYuQ7hknu3bmfoZ+Q9VqMN895Tchb7wyzUgGygT2mPzSLsZk4QHu+iEdRtv8CwQfwEgljywruIVhjs/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyta2OqdMlZ4jFzJ98utElMmk/jXMLc7qe9nZuajQhopiFt/sXs
	OMMzpoLwz6AGYo4zhSED7hFqquacgyi9dEeycdWOiMDe+jwZ1795w2GQCM103yMQBeb5TeizWut
	CQmltl/nuXRWK1xXjaFXUQxMTcBMSFU9yk9dpC3GuzIPS5hAUUrBM61t9deTESkCddcjhIcduwk
	r/cWNCfGPFPQ==
X-Gm-Gg: AeBDievutulhk54GYTIsVzsLkWm6kPwfF/1ZD5HG8tVSD0KmDbR+D560usxZ1IQCFLb
	0fA8lAJpSlGot0vYTsi7G9dQPPbezROoiHOJc1DgAEjKZU8AhLR0GF0RLuIEl01Yw6FH2QbI4wC
	DrFkXykB1oybUz+TC8qEzvQxicRh4ivSFLwjE5kd2yi8Rph2ofkGRb4P2JAN/guOuHynmsJqWDy
	mFTrLdE/RadHhOblkrr4CPOrOvS5i+YP8NUCsMrxp6clWX2mWRh5olFqbMCwh2HMHMsST7JqJW0
	poPdb5EMZkF7fmIfHJ2Yh2/N3TxvOLOiKu7JvkCZ7uFHT3k6gTJHxIXDd0p8k0Dn77veNnt6uMh
	WvmegOT1RBEWiAdR7N1jiJ97npk/5m04NXRz36uoZ0Sy4TFWfwtvnFUhdVvMeZg==
X-Received: by 2002:a05:622a:5516:b0:50f:b904:454 with SMTP id d75a77b69052e-50fb90405f0mr370935301cf.11.1777284890907;
        Mon, 27 Apr 2026 03:14:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5516:b0:50f:b904:454 with SMTP id d75a77b69052e-50fb90405f0mr370934991cf.11.1777284890483;
        Mon, 27 Apr 2026 03:14:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO
 controllers
Date: Mon, 27 Apr 2026 12:14:31 +0200
Message-Id: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAc372kC/2WNwQqDMBBEf0Vy7ko2gSA99T+Kh2A2ulCNzbbWI
 v57U6GnXgbewLzZlFBmEnWuNpVpYeE0FTCnSnWDn3oCDoWV0cZpazXMq4d+5gTymlIgAbTGN+g
 jarKqzOZMkddDeW0LDyyPlN/Hw4Lf9ifDf9mCoCE6FxoXUIcmXJJIfX/6W5fGsS6h2n3fP3I92
 U+3AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSj8QcbqhwM/xcyTOwocmZYInT51CeFqDex4cF/M15k=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcNXC+nCopNbtzxa8izNabMX9mR1bIFSaxzx
 sf27cFcB/qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83DQAKCRAFnS7L/zaE
 w+YqD/0To0UqW/A9osp1ipMI0jSERxvWfK09+h/kZ6otcNDx8KnYOvqN0Bodi2/MLUzQIPnuKNE
 XrkNwn8zOWzXkMcFEejZMNARgtV6WABt0gCl7sMRdZiMJsza0/0XdzNsOBnd7VxZiPdCCLbWNif
 tjjd6dUan6rQZNJltaBS48Mu4g/eQtUTw+zvjlMzYcSZQLaDxl2ClqWYPv/XAPCINWGSXcb94dt
 vvb6QndYAIk68LJY8ZIomecHmUEBGXTts5DU5F0ycRb0mTm9yn3366Gwhgnm515OY2fLgAdOhON
 WILAk208dBYl4vvgwZxDYqH9QdI/mvQCvV95UGh/m69bpMFQz6TzNFzq5P5+onq1vevIDQfeVeA
 eWvOeZvKHL1G9pyIlCJ2yJrRA00FyxTf6e7LRAJNRyg/YpGXCsYgWz4p7ZdUnaDFD5xVsbDL8y/
 LGm1/OWnRyrURUp4v4gmNdiaJTdXrixGKwGK3r69Ca4XCstPnuuvRajS8sqibK6AlPgTteU6oSP
 HzILoM9q0LKbbgyYMnzRLU8zmynGVqnuRJwHIyCFmgmeAqdPxK2pxNI931J3Lu/48S2wkugrHeh
 ibQ7hdJY875hhHSnq5tsXdpGKm1xThe72PQ8YLnwnUpAIy58LGtf+gUXWsjiIdnsfMDIHB+eDrL
 uQwEBZIyZ9jrJdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX7094TeqAzX4o
 K814Q32zZvSynsAS6wQM4vkBoqQcaS1I1S+d82q7967Yoi3jQDrWUGrv1NDp1BHS7yPxXggJ7ci
 njYm2hHHbLprwUc3qEk+BzjVmgkfWh+B8fk9Wk1xh+BDsvd/LRJHN7rKmPh19RHAEWTL2OWqzl4
 FYJYDYq/8bSEhUrpnPa3jdlSB5bXAAwrv6SDGSFhQnq3wONCvlG1Vq6wzGxx1v5k6UFwHBZH71h
 nPPEwV1tc6xpAHHgM8czRgRJ7FsTGjoMTRt5i4SuqLDOFZykKStaHydWtwQzm24JkOIlq0wnX0H
 AxKUdjEvXdk0tYW5DIHjGxPYw9AJS+vDcEStZJDEol/BY5GG3MXTvdywpgjGK6Srcv8A8Pe23yy
 YQyKoFl6AWK+dZVgTbdCRZBT29LbrpjsZQDE8LpmJHjdfs36mwm+i6lN7jHO0TXlpyW/KZy8A3b
 v0SWDczR4fDCMLN1lFg==
X-Proofpoint-GUID: lM7uKddOQzmUKvOuaMn6T4s_a2seqHBZ
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef371b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5j7h0pFm_H_taD54xyYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: lM7uKddOQzmUKvOuaMn6T4s_a2seqHBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031452_463460_BAFDDF3A 
X-CRM114-Status: GOOD (  15.91  )
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

 arch/arm/mach-pxa/pxa25x.c |  5 ++++-
 arch/arm/mach-pxa/pxa27x.c |  5 ++++-
 arch/arm/mach-pxa/spitz.c  | 11 ++++++++---
 3 files changed, 16 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-pxa-gpio-swnodes-132a81af10e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


