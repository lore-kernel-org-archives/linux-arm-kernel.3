Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=y5nKPTQoQ4st2WqrL1CBvM7fla
	fSqWT6Xmuda1pEZJi4YCk1RtDhcWeoY4wM+Gglxmvecmm0BKM/OsH02uqNULgr+bhO6CWTJmgAEa8
	mQ3lxkSGxdt+rIITSBgPLk9dl+aC7ZqbTk4WgWUC7IKL6CS2z7dj7QsUhD0vTZnjoTb9bMG6m5TG2
	KEBRuonmIbm2X+7UrmvhhLPXEaTpeWOX2MyK8ISuwZxy9dDY6h9I3XKgaRzdE2XoK2NJZvFGY2kuN
	DIhi4lP+XznH3jBuCzjPADSeEmoulVx+GSRTKka01CPsZ9G9K3C5LfYUqa5pHVCZMJyNwiBx5ArfD
	xqLTN63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegeX-00000000I9o-02zJ;
	Tue, 30 Jun 2026 22:10:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegeU-00000000I8d-3h56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:09:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDdZJ2948578
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw0qnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:09:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e61b38eddso485400485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857397; x=1783462197; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=EiKTsCjdzSp2C5cz4wswYGIXVkrGsw2/+kkXDgxIoKN3tEpEXVr40RpKCmxefphf2i
         /LGMlQWFymPZTJOJTPtavWRLwLd/U+5CGqsdSIzJzmTu2M6uQnqAfU3P7zgnrUoA4p+T
         k5oi16SARKa8H/qqs1TCvFi8pMKOo/FDJLlGsAjeCQcCjlbyh7wVIiaqPE7Np6/J2UsW
         FVDlj+augOldAjrzsd5Ys5m84q86FmECSMe2sXdEEeKAo0LBeCnqcQZ3cIN0Rn5/8q56
         bY5fWxrLJBgdc3kECIHDalFNM6W6E1ajvcORdShcZM4EQZSW77audqWne2kbGLe4eMcd
         9g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857397; x=1783462197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=s4Bec9RtorrK9HI9FpwEIYhLZhpwVc/S20AQ4x6mYd0OBvzSWTTcKXccTmS9LA4dMC
         EO3z5jQ75wdtcqTDiTPjJyQUGd29dW+gUP1pHqfCufnWfAN3Dg8EZp2oQ/Ukp25vAPUf
         UFneKi+zYtAZ9+GWr0ibaqTTW52wPVpFr5LTrXtuaOkmnkMV6IwnPXpTnQRYBDd7wIw2
         rNaf+viQDMY97GZtO81zS9t+tDG3qfoSVlfUJeCUL87ZcvPpQDDvw0bj9wF29hja6Ycf
         TLN5P4P2DUkKqRuPxa9W74PaLJjYf5CZt96JZSf4uoVVRXU1n9GgL0fVW5ynen0YlKR3
         OFTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ODkZ7YX1bT60R6/x6LJL+SHPBYIjtL3sA9q0tz+FBNn95fG2U/7c0SJ230rYcExzUpx/7aJlbk7Dv/yw3bBRB@lists.infradead.org
X-Gm-Message-State: AOJu0YyWYSOAJGkekfGvSQmlYqbLlEKEHEA/73cJ/clfxk8dtX5j5Ees
	RMCSwyG6sEm1V7/nGlZnVxqM/MZxWGvmM2AfcZTfc+fA3yn6V+LV3wau84kK6O6buNhczCT/CFl
	vZotngaLzus3oTqAvQvxgPgcHErt3D0Z4TS+0iFN2OF5pK9LmdvHKiOKwya/5fjFIBTgw6iUH6k
	uvDw==
X-Gm-Gg: AfdE7cmUgmwLF2xSdqQVmgZHuLVZ0xT7J799i4zDsAeMRMvp9Pr/ggyfOMuR1viZRPf
	XnurEoo8yWuCFPDglUl7iI5HpP3x8zApBkXR4u0mYFTbO07mmEZfmMb+LTs0P9ZpMNmf8nL0xND
	S91ZO2EGQ7xubNpfzA52I9j1/NfoUrhA0NA3yPaV13MSPtu+VfZq8IwgwbNzcgrUuhyFtONpiwZ
	+jkyMYumyMT3ZfYMxiG6CZldWjvr3ixbuoPxsRRxzr7X+h8CjsLHLkAfOSabdaHZ5XPpxJRma2l
	2s4nWxbfIJYQ28JaqwLB1es61fkIRDduvRlmOTc37iteXrYdjNVTlSIfVAxNCDDZJoFyZq5p33F
	bQIQVri6W7rQtUpJDCDjLBPcZqmO8GohR7W1pkmBOVUCxF4KVPIreKXCB2rQoow==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434242985a.66.1782857397398;
        Tue, 30 Jun 2026 15:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a443eb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ly87drOiROY3PiPwy6iQ45vpLjHFaVYR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX2lPv+Jn6KtOd
 8GdSV1QTpSq/qp6yGswaVV/7GIFDryvFJkgW1E8dqFFDvg5076WoLWWN81rd6ws6jfuJsNsgKhc
 u09HeJ7s6XnKgueVvqZb7/NGlyb1kqk=
X-Proofpoint-GUID: Ly87drOiROY3PiPwy6iQ45vpLjHFaVYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX7yKQ17l4vlrp
 d/nkD5Juw0Ijkd5FKbld4HAA/tDUp6u8ioHkgArR5unyIjXHcuAxTUGfmQGIu7SP3xulHsXAhTr
 ZIUbDMglkVarnrSZegKJShFta9oZW9C1xbbutL4rzOpXC9wU81Cy2CNz2wSqzIDu6zb7YYxwIjX
 4M2uqv0jXy+SHly2Tyyh3GnBV4DibdRkpmCHYtKtTTM8r8O5eWGCInwY/zJIYTZXg3M8eem0sx9
 gsL6l1k1blHHRZ78Mhis3q4RMYv9agzvVsIT9Q7HlZVtGMHCYSzKWzdeSOSkEVj4/oMJNfNkOmO
 kFklITPsusS5blSie6UXC0F2fOkFb9H9yKJ294/2rZWDh8jEl+XaXijtOV6eM9Oynbinofq7v/z
 qbb6cM7MOLyeBlVrLmeLN3gjxXmtNcjLnUeIYrSdJrJ5YAE4Jx+jq0NLAym7B22nAZ6wtLNS86x
 xe+3W1Ka4fgCa/qC8dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_150958_915606_DD066952 
X-CRM114-Status: GOOD (  13.50  )
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

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

