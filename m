Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4881EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=yiWqzKkFb5T2DGLtJ0fAeuTgeQ
	GA3JiYCXGw+kjVZFjyR5x8k/rgEwcW3L/INEMiTGj1ZI8djXEyFWRpKW1zYJIoU9eNA4pjkXmi9ce
	HLdICPvhRdMEMXBYo6VOT1Ln9Dpq976PIz9w6b9zr9NDI+YsPhP4i845k8lirN/ptBby7H7rJlvsl
	Ji5luHN8DuhwCnk3OuOf0+k4zp0cEWlpL4eu1/eNQncY5D769fiAd4YFRtc6xScJISi97zukDKIik
	Ctj86Zx92ZvcnkoSLb3TGyLKpdNjy9Mg0K2XkgsW9Yp7lHEOwXkV9WpdL9zIKq35aHg6BmX8uE5Vu
	/INbD/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegdS-00000000Hro-3Rxr;
	Tue, 30 Jun 2026 22:08:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegdO-00000000HpS-02V5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:08:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJEAlh2947713
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=YjdrKYpVqZ8H9XAX
	ibF7vH/kUADBSYjVGZClU63lnyKF8JVv5GZII67PEhUmScSfLZEtlySCd/8RXj6x
	o+rkx6Eto9cTsN3V7OIW3H3NJVDGsBpAi4uBgzMTXdfS8EGc3015nJ1/UL2kEZ4+
	BA9iwT1xYJSu51qvtJlUaI7KWY9mpv+Zf/4q7MA6Zp7fhxha5a52zn6FeCol17DP
	00t0lcWini3dby7PAFSuxWS4FE74H/bGbkax08nYfIc7ANpPU3ABvUKZKfwTZ7uA
	3ZIoFEoYf5v4XPixYIG36bcjUj9HG8lp6iaVzz8ebgdDiRlDt/46JVeyX2EfpF/f
	aeUJpA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpudf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:08:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef8249f871so685106d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857328; x=1783462128; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=FRINyNfOvzBlDlRJtG+bEGfATaG7O8/yFSEW+JW/6U8g0s3hGynb4c8UszIVcEzQYu
         NxplCYj1d1McaM/6o/ZWdkzdBnhF0dGpSORowbmnUCuFGigWbBlh94tMXt88gskOvUVX
         Ru3GEBt9YRj2TyT2ccbbepHYz50td+z42v1buJy9JgPD72q/mLzm9O5wctBCV+bl0GDc
         YK0irVnNNXZVJFePJ/6V6j02nPENgktCnrvtktojB2Fnd1bXQKuLCOytNqle0vGF003/
         7qGZGBF7OdHImOPQk3yUYscciCwZ5KxNG6KbjKtcBYGT0ijuFio1b1oOTn3xDDCNFC0M
         8dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857328; x=1783462128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=r+3+RnTQF7hO+fluWA7TYYl7bzxL0ZKBjkMHINagpuP6fPOcrBCmeTwCYowsqDWE9o
         PRxfMU/CP+QsbcoEma/eB7r/alYFsAc+Rbl83COOrs8QO5jVjiy9rE7Yzk0BcaXaph28
         nhdubXtr6KSlALUOn++YuQzRov3VJ6FXq+9TqmBoBYVne9C+lzDYxx26XOTvk1kyJjjU
         pf91dB94EyoG8W5ZYwuUtWJQXvnDopjBnAcChUif3CuGwfVVj8I7hM4kt/msPtxei96G
         XaJola+GwibDPlBpiL54BQZirlMDpW+S9UfA6MHyWMDLtHZ9L7wFqESjdzwyIx0CbLGF
         m8Uw==
X-Forwarded-Encrypted: i=1; AFNElJ9HPOQXh1BjNkrF3KoT1LWPnzam1K046W1FCzod3qlOcxrpZ5mR/Vkq9bEvn+RUbAMMSUjzwTugDhFKzFcJKihZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzM3UwUYB1V6mh0QlVRtOmGtBGFMtIdkRBoAoum56fFy8og1yJ5
	K4Hn3TyuNM2p11SdiwEm4vGatCUpS0jGT0hs3ZE6QBw9m49ZXNyMBFTgbssv+ADre/RuzFTStok
	Vw4gu+31xLlyOMIAOZc1TNlNmHra9+FyTiStiB2kecewh+UbhHGfXd4Tax0jw5zRyR0JN3jdjBT
	xd4A==
X-Gm-Gg: AfdE7ckoNTu/OqS3lPEe4YmsaltCWjtqjMCH7kabMJA7dkXiuvcMPeN2tiYZ2QC5AG0
	JfMydfQ69+4kWuVhmEcvEVom5711G25Nc1e9jed+3BVMHIzbiAmKyi2XGtqKi/y+hdAQL81qSYd
	9elysPze/m4bKHuc22Sl9v+sORfCnnRu+76267EOz8vyvusOsYDiSbVmQlhl/iMRN/MFBmCiUOV
	cVwFVeaNcfIDrU1n7CcFQAobWjqWXO4pXah/5SUWIKSWYMX+Dy/4baYZqj2iIGThSOHnotW4wmH
	FzDcOP+K7kdx01Y6RpCFpkKURiDEwLLiTnwjJpyZmnfHjzskmCGd+F6Xuf38Y1lZW4IkXaP0g+Q
	qSUSxugkatWYPCju+HwUPyC8/HsnM9/O9QZJrKBQj9UClt72mh01m9zKuLnUzcQ==
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404386185a.15.1782857328347;
        Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404382285a.15.1782857327863;
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d9daasm28380565e9.9.2026.06.30.15.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Message-ID: <6bcfcfca-aee3-42cf-baba-9a926ef26471@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] sh: replace linux/gpio.h inclusions
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
 <20260629132633.1300009-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9BT4QuDB3YvpA8-Z7FIWoRirQuFNUCiM
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a443e71 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX+EHrPlwNu8yt
 9WInWUd+oZwwHcPwvdJd2bjQXk6E8XuYJq6N4o/TjvSqeDFUZPsj5K1udiVrh8525s90e08Odnx
 U9PUEUhn+3bi1wNoVQ1/MCAEOC8Qumz/LCuLldDaUKJp5UqKqBU4fQ4NnWPSkGA7siPWRsc2FRd
 3tmwZFKUiN9VFRlWajrmZ1xFyrg+1SViNHdeMLOrjSfU/N+u4DkKk0FRDe21wAmp+wVeVYZHPL3
 T2jYs46EfqwhBuJygXnR3Ldi5t5ZBqbqYOWbhy8gdninCtLRsvDhzTBjgc7cH1/pE1rcVQpXf5F
 +WFUKuKUK9Q9/IwaZ65NzESalExreo40oQG4G9PaTlMQWDJS3GWzdGJautrl+VmGuU3+Tgi+VwJ
 np8wnYKdAYCM0LlEU6XT9reA7W0pj6XTylPXI9v1hOQWeJ5p6eiNdkoesd6869v/JkihY0Q3K3/
 kzVBaRFxYMOSOfa5cXg==
X-Proofpoint-ORIG-GUID: 9BT4QuDB3YvpA8-Z7FIWoRirQuFNUCiM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX9X1dhWhG2UJS
 RYkD1YrepY7FSg7qvgKU2xuRlp4FRphN69hKJvR4mq9TsZWsshKPtUQs77QtI1URCLy4za0ZAl4
 TEz0oyH/7agUVVMvgoDypNJCKisOo08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_150850_155594_3C1207C0 
X-CRM114-Status: GOOD (  15.20  )
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
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for the sh boards using the legacy interfaces,
> or remove it where it is not needed at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/sh/boards/board-magicpanelr2.c             | 2 +-
>   arch/sh/boards/board-sh7757lcr.c                | 2 +-
>   arch/sh/boards/board-urquell.c                  | 2 +-
>   arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
>   arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>   arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
>   arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
>   arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
>   arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
>   arch/sh/boards/mach-migor/setup.c               | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
>   arch/sh/boards/mach-se/7724/setup.c             | 2 +-
>   arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
>   arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
>   15 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

