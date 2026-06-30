Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C04C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=; b=IQL3gJpJ0Qx3nvn+X7ZWNXupxp
	N9FJIuBxGV0XCblXkLK8WApJzlsZRY9dgOiEukZ1C2fTufhZLTsW4pGK81JC3f/snjF+BP0RCuG7D
	hHCW5Th2V6P+u08Ez2FovhahJ6r2gO3d2QYFhR/MliIN0kCFDCw8yZNr9u+OZ5N0q6/TXZ+3q30iV
	0WbbxMCpVdrCKKPqzdct5Ip5CN2ln0l+QngSHPu7diGpfahI1HVWa+z6pwxuYhWwAFgTUlCuh4c3x
	jv4zaFStYu6BYpmSmDqHr/KMhOHMX09b76TC7lSP4zBxA6i7lyHFBkLC55+UzMlAV1Uqp8Q46nLT5
	N+hGEu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ4K-0000000HFCG-2ZIw;
	Tue, 30 Jun 2026 14:04:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ4D-0000000HF7Z-43KA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:04:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mrB81542070
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=; b=FGvGLwrYQwb0wTLS
	Z7JvOlsgO0GP294YGQUWXMPOV9SQTnVhfYHluhNk0Wwz718qWtwD+LbPR3RIaO2Z
	/DrgzXqnZykuY5S8OWJFpE69CkxQq7SgXnWGaACmV4WHiQPuy0KG5aWs89ijZem8
	qvDbZOAPwmAZGRnS1frDotFS5V8JnSKUJzbQWMTXJCV64YeK11g7mm5Xm8e/B2ST
	j9mcDfqKR9Q7dlUe0BEM73bHP5yaxw6+2JniS8nDIi7cBbi0tYSLhBjtWqMZ0urO
	/cgqY4TTo88BLrAlPrSt/fpatRnNfo7TJyxpFYHsSUFoPWdZ0omiRALqpBQuhG7a
	TZny1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jtsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:03:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fef645b85so1777481a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828239; x=1783433039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=;
        b=HuKJnJxXaVDZyA+1e/bEVrjnqmX/To/Ref2sDGhL85yGlC+dEXgr94dXCNVRxhscEv
         jdwwK7TNsbJzD/8kWO3rTse29twcVIo9zgUdiYJtUM1v+ar35sJLccko/kIvUstLWIv5
         z+UWcE3fspCiBy8/ImJgLHpnbHT2+YoQOAbalDrCTsI8OY5by/Tp32PMLOrlIY70y1A8
         e6NmlH2v/mxA/qxyDSQTg2JahRVo0lf0JuJtv7mNBHo0ewzjlpdPColgXCAJoW0nBTFl
         mSesbJKXxKZOyczoT2ERsa9RBkGc/for9DPHETrzF4IO1oiC7IhW0NaiqcDo61W0Qy/t
         Ppyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828239; x=1783433039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=;
        b=k7I8QGFad/cdeSZF0NmdMWQD74k2OJwkQaW+e6gaunEcV18DoWECmir8Z2PInORyzs
         1p2mhPx2O4OPyKh6YUbdrZBRHBuz7zogjF1A0uHESnzxTuZyywVMSJMTTRE/Vdu1ZcZs
         1pL3s4bG3rNQDx1I5d5Za8C7ZcIAivUxipTGs+YHj1TYiNXUFPiXYe+pzj4HJRF30xH2
         KKNHJwE8cVPkbL8GAbtnwMGyxKtU/X59ASt8OLAwVASWvsB9V+JwnGk5Bi0SUJt1ATUi
         x3uDziIdIaV55TOKmEFErUorOcbiYnlUxlK1MWn1kyUWWT1zPNVSpQQz1Z8/ao8yAj/L
         Utlw==
X-Forwarded-Encrypted: i=1; AHgh+RphYDgwYXACzNuQC/codiMNqbwpRMeVhRXyuI5BvQnsnPiqbKjpFPksP6Qx+QA3S35T+wRHnfkq9Awf/VXr2bK2@lists.infradead.org
X-Gm-Message-State: AOJu0YztpeLO9cqQtO6Lq5Nuy9ZlUInC2KSU9j0AFMq/Qr7T2l+XEVaU
	WxW/c6wXiqDQQaTLUqSOOzSBcStLf2h8NqFf2oTC0xAlc+IzMWzzKw3Fe6mBa1EdjCsaD8zsWiS
	w2jr48qMqURfitnEH7oaGpXTBmER3RoMZgXGjETSyenqT7sDkpeMdr3ledGgYjn/xc+43pHS+iY
	mHTA==
X-Gm-Gg: AfdE7cknuiPmzRPlFogEW3OVQDk+Ez68Xx8ttAneSoYHcM6E/wnXxWS77WokXu03P+v
	aV9sccD2FYk+k2yHPBo1hu0qM4IY3l9i5nX/VxCRNMmnKNlbnW26xyxr8GSMQruo/82CgoEuL0b
	rsR9m7tuu+Q5Ai9dtvSUghkTMVEhjKw6vsp8FgIlcyz8yFcfISzTGW5JPy2RwiDjelPP/OCU1e2
	sr3p6sTBRxaWkwXxzjAcrAmzlV4JsdsDJnKGXbUEdvHidVOdaLAr1Wlp8o9ACeRw9wXlt9AqamM
	dtynS8k5g+9UIbwClC7VNhMRdxGaLz0b1N/e2W+tfdDk3gvEjz/+KyxVuiK9a2lP8sG51ZBODOG
	2wuqAzlecT2j7FY0bOkmYr0z/SU145gvU2Zoc9qw=
X-Received: by 2002:a17:90b:4a51:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38052733442mr2797969a91.16.1782828238906;
        Tue, 30 Jun 2026 07:03:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a51:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38052733442mr2797918a91.16.1782828238391;
        Tue, 30 Jun 2026 07:03:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be171501sm1600495e9.15.2026.06.30.07.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:03:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Tue, 30 Jun 2026 16:03:52 +0200
Message-ID: <178282813039.20935.7644113033947538749.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630101545.800625-1-v@baodeep.com>
References: <20260630101545.800625-1-v@baodeep.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rqd-8ct7dvAoZCWRfuLVVvS6u2k55YA8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX+kfJLEEfo54k
 UJ97HN2uFGKlYTw6qFIpmNLc3ifVhjzsF1/tcL5izDOi8L4W74jdVNkExTWw8VHDblIAvMcnLfb
 hlyiMa005UZOmLIoyIRi4PSrrlhVBf0=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43cccf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W7lOHgCGKF-i3LWV3W4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: rqd-8ct7dvAoZCWRfuLVVvS6u2k55YA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX7RdcEsDGSrXN
 GbrSRGEIlVsWd2CyRlqt/dqMKX84SbERhvexQBtV/PyiO2olNOr1aJ68QVDcA9QAHlo3dHYpKlb
 BFaBgcRqRgPm8Mjc84C1Y5ncomLYYFQoHsqmZpF+f4peAkWVYD1Z0ISqMq7UD7CJkL5j+Wci6HD
 VeMmzdbfbcU9oox645kozGoP5unCmRG9KbAHjcj9JCC5ErjiXBvt6nb0b3kVTtWoVAmEh/lJp2D
 1SCuh++2K2BJL3w8cUoEeEFVXvhmMY6RCj27Eak8uv/tci2+HKiUBgR0mXOSYtoO0XU2mFJ9xxQ
 jfdDelAqz6asGK2SgEgN8LO9eLEmOu0H0L/1u3pVoy0PaUqnXcogg7GZvAqYtfjLfFp5wQvKEAQ
 hyGzeXPWmFC6/9NPLI4MU0u3Rr/cZ7apaNYZRFM6DJl4r0yRje/pSg9L27xrWYhJHTleQ3MEKfh
 8YsekotZek3xB3U0LEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070402_644026_6E5ACD03 
X-CRM114-Status: GOOD (  13.77  )
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


On Tue, 30 Jun 2026 13:15:43 +0300, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
> 
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
> 
> [...]

There are no build-time dependencies between this and 2/2 so let me queue this
for fixes on its own and Linus W can take 2/2.

[1/2] gpio: shared-proxy: always serialize with a sleeping mutex
      https://git.kernel.org/brgl/c/efecde8a254d1f207b75c5ebcfba2c51f4c771d9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

