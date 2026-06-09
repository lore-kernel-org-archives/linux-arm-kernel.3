Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6639BCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=; b=asrmNWUw05LOmdEsabtkn1Su/i
	B1/5uGXLpRZKvweJKKCqRQ+idyijlIleBWuEyadN9JL1vL0+id/61RfTDU5dCxgn03ofkvqsu/Rr3
	7t0u7Zdbqti4i/YseCxGD9o+4axnAIeqV37GKTV+hYxH/J6w5kUiPIfOv4OqlT2vPW8XHpbJKKLla
	TIeyJs5Mm1w0X2jubg72xYP4FLaEORwhdOr9iQVvvfv/qtgxeRZ9TZKhP+CyuR+k66DQ++ulCyt6g
	3mWaCLq/jpfRlflMBPKmzpQGOkmO8E9yPT3I4ypLCtpjY7PxXtswBnGKv9skxOfM5q4wq2dwDrqAf
	e3m9p8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuUU-00000005QrD-1LKF;
	Tue, 09 Jun 2026 11:19:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuUR-00000005Qqh-2cnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:19:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xHKM2208531
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 11:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=; b=SaD8J7J+KoME1LFQ
	+jHB5AafuO6uZABZe7R3tIY0iyInJ2xkrUs3Xk28za1Vb6AAqD++64P+iLrc+GY+
	n2I53ZO9eXCjei89JhxNyGW5rh2vbIjdiiBLlLGZeJ54oN+AjRy2saZuZZoDv3rm
	Q91cJNcXzKcvdbmTWxE8nxgHOXkXHRKSkPnU0RTptUBFgMll+j/rdZsm3tknhQOt
	mwuBhr2XgCSMm7HNENnfKG1quJ42DyCI/CvFrPhH5A4QfGLYFKRLQtVfaAws206b
	ZbQuiup1FYwhVguGH5ymL6BDjWviDV5q4kQBA/v3C6WNcYInScfsubYo+WU2F0FR
	+r6qlw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gwny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:19:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so73716651cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003965; x=1781608765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=;
        b=Y3XK71tsQGQUJoPfmNLy9viLOR9dVyp833v16R8Fg+VJnh5AQbhixwpnY76XwXYZLZ
         enXEhIiK1J/SO7YGcxhe2CCwiK/qQ/86VPT1PVxk43fR35kBGwpc3HgkPZoXgqmTt92O
         z+Ptnzexs7nNxiUZhY5pozbXGk42yegkxpJbSnUiQFAdPX/DiC/qKcTikuxZ6ZzzOX1P
         u9n/K313pP1miijJusEciQukj/wJCkH61eUc1mjvq186R0UTOkjk3AF86eoSGQAEW/RH
         GPYRSR5fVZDAItkcT9JVqyVQP+DLVYIuFNVwu92dEvYtnL1erDMpGtvbzN7U1saJYZ6h
         IO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003965; x=1781608765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=;
        b=Stziahiuqa1ZJnVSV4kRCrrjRZ6HJkuD1WDL+aFIfDBlq5dB02zJ75Li3C0lV9OgR0
         7eoyIH3ZNWLwz0a9YqGA9zUc1aK/5ed4WVft73Duoq/X04fieFPK9G6fqaAHN3oOMH/5
         +ccSCXrMyL+MNRkmjP4NbqxFGivzC3kjDjYxSajIvpiX8TqyUjs5kgsUFC5+TJuxSMwH
         56QWSSwGa/ASfD3ubwm6Cnud6ff9YVXzEKJsFILA5n8b2jrG1upQAKiq0ros5CuEoCCj
         aDKWgqV1/yE7tM7qEWoVc1S0JaJN8tBdI4oWuk097YY0MJ1EN+BQxx7NjPIayuaM5o92
         Skwg==
X-Forwarded-Encrypted: i=1; AFNElJ+MSSSeshUV6xu4oAf4LAxGHiPNF8kwrlJNAlnfHh+DhQjs3uSGSVmwFazYmk/GCEP2+ZAfJdKeasQdHnPl2wqk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5/rX0f18lOHGM+2jIh114kCqO7T+/FWqz/IxDDBTYtn8GTNeP
	YFPcVLJWfwX7FvJC4o5RGukHV7GkYQTZpxgTWcC2VgqMbETo+56jLqLuk9Ke2wR7oL1sc2nl5pm
	wqfwygbh5OHsKETiEnVUqr4hmhY0hmVtZlJj7YqviAIuqE8SY2wTjvTNBDY1xJm/WxvfwjXaREX
	w7ZA==
X-Gm-Gg: Acq92OFNSRWVkG7oyQFkTJypP4rKrf93n8BP+/ySfONybWnuGyWuuC/XdTXpM3pLUfr
	3fbNjrkclBJXQngsYkVrIu2dgIMlmvftCdbBHfEg00WSHly+JE+0dcmSULfnCZa+og4wTcm4EYS
	kq3t1k8+Buh8p57Spd/K897o2efhO++E2o4gqV7FvJjRzV48PV+CDbe23wgk7/lBVQYdq6aegnK
	LnyAiVoU5RpyTXGp14Mv/f8bz1rJmOAHcR+48UzFNpbk0XVwM+nzRpSzid+is2cG3hGFE2gKlSi
	WUfzdeIdS1tUAl6YR4l30pn6PvC2DwL6D/QadHIW7N2ehtgo3GdJmG3KlZczKJ69Cxh3hhFj98C
	rPKcnRJaLah8a93r5vs8qdH7bF8nIp3QCtWKT/CcW/6yVhE0PqlRnRxAWW5GC
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr196423301cf.24.1781003965550;
        Tue, 09 Jun 2026 04:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr196422841cf.24.1781003965040;
        Tue, 09 Jun 2026 04:19:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm564612145e9.9.2026.06.09.04.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:19:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Soren Brinkmann <soren.brinkmann@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on remove
Date: Tue,  9 Jun 2026 13:19:22 +0200
Message-ID: <178100395690.129636.15367322855327740442.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609073313.5-1-ruoyuw560@gmail.com>
References: <20260609073313.5-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27f6be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7uQiEZHuaxwACd3cpN8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: IRNzggiV9z9983BffPTCFd6DJdi7N8t0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNiBTYWx0ZWRfX1YSP3BskF3bW
 DX5pfhRQV8oqSYjj73PxcV6Nmjihu1t4cADrtQOz6Pd+5cJy9eJ290/2HVfTjg811M8oeSHIq3P
 yGeRfss9V8N8OFuGIfKmkf99ERWdREWLj9DSTmM8cPoFNlvvxyA8F056STwfnWLnizJmoLnx6Ye
 ZcBlayWRaYkv53V0JEPWH4sZqcOJYwSuJM9U/ss3Hi6OM+dfP4Chntdt1Dt0uu/uONS0spr65id
 YbPLO65JkygvlJDLnc+iMBi1Wu63Eat0zUjLF1AmyAQSqBxnIwXJZ7TurXVTeIP920cY9f/i1s5
 RXjfvLKUsFee+BWoVVvP/kbfH58tctvQ5/dEMRuzHy0gZ2sn4EtFWR9XADmT6oUhbewVAKYU8IP
 EGA5qVKVaVur9iPj5IvQzEKHxm5cZVYJNaEOnFKgktaofxhJfi5BE3X1pahl2qPTZBW9msrQMx5
 7Xm6/q940XZN1d/FLhQ==
X-Proofpoint-ORIG-GUID: IRNzggiV9z9983BffPTCFd6DJdi7N8t0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_041927_779329_A8A587BA 
X-CRM114-Status: GOOD (  12.17  )
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


On Tue, 09 Jun 2026 15:33:13 +0800, Ruoyu Wang wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even when it
> returns an error. zynq_gpio_remove() uses it to keep the controller active
> while removing the GPIO chip, but never drops the usage counter again.
> 
> Balance the get with pm_runtime_put_noidle() after disabling runtime PM.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: zynq: fix runtime PM leak on remove
      https://git.kernel.org/brgl/c/6edb934de9bda3b7abcec856eaee6fc8b4278dd1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

