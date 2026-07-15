Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8808C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=; b=H/+1Mxva0hGJ/rY57Z0EQCZIye
	q2mtmQI1nZQmqZd1SPjYr++zknxZ9pRuZQP9oRsJhjEVCzhIXpqsjUxg4dnqCrqFwoziAmGNLmnCl
	e8jEBmaMMDOxXiGaZ5ss4vQe6cEyDPu2qtcNPNf5uhbqPltti4vrb+BsBGW6l5kYBrD/jnJoiEM9L
	RO1RZX6OKa1yO6ngGPXe77+5BtUC+kAgG1NnAXTUXJf+Vnid6DzpjD60msyisCphgFy3TuWB9jBd/
	HEaHqju2yjKyD+FR+fvkXjtQ3vQfINSLsOF8Rn3VtxsHdLbRS0Uu3rBoRi2XElPS4ygxXDRWGeE3E
	CQZZTqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyXN-0000000EkcJ-16Fc;
	Wed, 15 Jul 2026 12:16:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyXH-0000000EkTo-1xfo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:16:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcrVh523562
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=; b=CmZ7BBxWHNVIiE7b
	9K5FHG5xi11tYAg6Pz3uhz4my7oUvjcWXl4PmgKDnAXWxzL2YxIuDxV/ReM+bbKa
	2cydCZkDYBl9ZiWSNAvRG7wToFurk3xmONkySWWIy0zyQZ2r6VNZXt29gk8/XRs0
	oY3Zgd/VcHam5DI4T7YD96kxET6QvI2SqvW0ilWo38MOj0mfJIUPGPNlMSbW5ebx
	RgmD4T2oqIx7gZALqFl5wl6aXQEhIc31ND/r8iKfO/HyF2ZfDRJS00zNfLEBLyjA
	uiAB6m+ZvnbUijQ6g0CSZ83AX+vW+RFPgh8+Gv/8kCFNnhUbtKqjelEhe4GLtJhz
	9RUN6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68ws0sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:16:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e4ba1cfabso20717541cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784117778; x=1784722578; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=;
        b=dGO9jR8v6cl4Zz6Ofvvdaxzch/Q1oq3VMFJSxdKk5gMM2xzKJNs+084RWvCupmxZXI
         0+fRdJgvzgymHth2BmBLvFroCW7xiTuBsabkGSCZeKg9jNuSOobRvYRM6tbvtVqSDlbt
         0je2PhPuHoWic37eVx4WVR+0n2ODb6rro0mS0BvjiOogmufALdGIqRovjPiTCnUji/00
         tB/jxO+P5Azy5sXM0pgsZH7MqL8/Z4oUITDBkylSKQlS1Jg5XiEIEMCi9J9y4VXG8Bj/
         PON1dPT552Bkm7n+X0UCS91bTYxfSpfqEFmbdaqwHuIj6mxm1lSSgR5vkS7to0cUTXDD
         YUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117778; x=1784722578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xAzEXbpzsfN0W9pJf/x1CRXBQ/6tp9oQ7JRTKhYAFk=;
        b=gLYNrVI3YCMVVRyiXN8MTbkf7Ql+Nshanz+4046u38FZj2rcUPEH5NI+DHk/IF7yPy
         FDshx65gmEOIK0EvtDehwviTPUZERP9bqLMnEukzFFkruQrDGiwxdhcjdyYqxkFFRg/u
         fEMpbZpYSBfYCNAkvy1MqGGpiHhBtGbwNRTlZekbsAO1araLFs9SOEf4peQSC+aG19/A
         1W4zgeMiZ9i4okD+l9Of+RSPhTy0QAIY2cQi6LzIly+Tf2tXyWPE/o+t7XpnSpyr7Ji2
         5kMYSWFSOKcuHmBD0GtwbRQHG/wWSHiTol+NAU5MtRFtQObioponTruVVcjnGMOPsfcN
         6SLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeiCtfVQYEJ92TDr+DGfBcLQSsRr3d0bEpCbhLtZh1n/YFcYDyONBjCFXUKu6/B9kLbWhowfKFeNx/LqFPSqYy@lists.infradead.org
X-Gm-Message-State: AOJu0YxtYhvjFNCf8uqRTKDtCmbiU1SEITTKx6IxpqzX9UhGEK+VBJK/
	D5n2s8Swjmdtot8zoluiSzPwTf4tfhdCG5wZ65UoMEwk+0EkE8jo59wU+hkU0VXGIxqDAIh8WVu
	6BUyMGEK7ZW4hU6ibqWwl4nv/bR1rIlAe3CtHuPmlb0Ta94mkFgS/Z5j89khVpsOp554UJ6LRz2
	X9QQ==
X-Gm-Gg: AfdE7cnPM1ksFzLfE0lVrKmceYIBzv4UNpXYdH2323EuWVVxSsDjvdyvoJ7M+ID7uzd
	UM0OWum2g1J89yypOIuDOEr9y0erWydTG9T8C+eUMQyUzcyrfJYa/vCaRdyvMH7phJR7LKgJGCS
	AH5CJY7TsHGkVYVwbIF+XVTLoeh+0j8bRyaxvRTAc8xIJcQFdEgZg406k9vJ0LvSDoZN5L9dOGx
	iJSzkyWra6eBiREMoqctH0kMsDhalOTFWzHvULhk1EJ2AocwexbxN6H7aEI1EC7uYujjmQZPyAh
	8rpdomPM/o+g3gQQYInjfpPfgs3JpPTRX9yl3w9ShfN8kY+8sL3owQ3KKIhpqqo0uLdcQnw9+Tz
	kd3lW414pDCgb5b1FPJnp05niC4hHVn+7Yg7YM/Q=
X-Received: by 2002:ac8:7e84:0:b0:51a:8c97:9391 with SMTP id d75a77b69052e-51e4f12e7admr23055321cf.72.1784117778372;
        Wed, 15 Jul 2026 05:16:18 -0700 (PDT)
X-Received: by 2002:ac8:7e84:0:b0:51a:8c97:9391 with SMTP id d75a77b69052e-51e4f12e7admr23054651cf.72.1784117777741;
        Wed, 15 Jul 2026 05:16:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1716:4a80:ed58:2ab3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm14947235f8f.36.2026.07.15.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:16:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Daniel Golle <daniel@makrotopia.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Date: Wed, 15 Jul 2026 14:16:15 +0200
Message-ID: <178411777251.18877.15051361128846466144.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: --HH1pEDQBNsLHQp6uE6xvMUNm-fJo_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMSBTYWx0ZWRfX19YZqIFT1DY8
 gIC8C8GZy03N1zAUQzRA1OyBAkwrjHQs79nZJPkoH0outrax0bfj2OkWC6CQqzOFHLr6c5TnfYt
 LwOCzmh8euQ4wytSWNp+p3tKZ+aD/UbjXWL69GnWXT9V9Wc7zPfsIf/wbScXe1LbWRDDq/0CWK7
 h8JU3r030EIiZRl70wRZfpMEh3aj+OuUIh9MtTEqGeN1r/iSVho7SgglFhVXzQFK3mmXViWLAIe
 5p45xw3YAED+UctSh/+DFifYhJGYtRiPVA5KyzQ/Spf/xI6mzCGJLUcn/oYbw1vzMIyQVehzd5U
 oWpgW8T3sQI1HF4/SsYn3cgCGIkgG9FKKIh60GMiMN4KmLd01nSGxFHad9ra9toXFl9PNFG6PsX
 V9/YS5nMOGsE3irCOhKoFzgxIUwijmtzfBs4ZwnNwCTykybzm+X+TkkTOXg0dQ+aXF8ZdUVBMRZ
 +g2Sdc0zZ+C02OqXF/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMSBTYWx0ZWRfX93mHU6lKtoA+
 sLjYDv9ilsaSf8KmDv9vr6gzAYQ9Be5yG5mbf9SFszbWpgGaZzBBTXkarUrnGGwWPzFRzoX1pQa
 Ckpx0hLYbeznuWJ86+OeVOJzBeAgNig=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a577a13 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LCXYudziaqtIdDzv8-QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: --HH1pEDQBNsLHQp6uE6xvMUNm-fJo_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_051623_538146_D4914B41 
X-CRM114-Status: GOOD (  12.05  )
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


On Tue, 14 Jul 2026 00:30:53 +0100, Daniel Golle wrote:
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
> 'input', 'output-low' or 'output-high' properties. The error is
> propagated by gpiochip_hog_lines() and fails registration of the
> whole GPIO chip.
> 
> The previous OF-specific implementation tolerated such nodes:
> of_parse_own_gpio() warned "no hogging state specified, bailing out"
> and of_gpiochip_add_hog() stopped processing the node without failing
> chip registration.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: tolerate gpio-hogs lacking a hogging state
      https://git.kernel.org/brgl/c/e1cc8fa0fb9e5112d15f2c310b68ac316981c06c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

