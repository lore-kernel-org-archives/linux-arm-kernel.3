Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F98C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FejjzcessRXamuxdGef6IiWtk5XK9CE9N5H4NCWgoR4=; b=1eHRNmoEZNgypv3fAEvXBAvXFr
	a2Y4hvzDo0F8QaFc4najCXYkSJDE74Lc2SUJlXjIdCXsUFz/KBmsp9IxvjOk+NkGLg49Rds70PqzN
	x9JgCM0iRawGG8wcN6ZpZQwIOm7uSEQHZkw/H5ODwURUNj0wuLllSiP+4fEgKfxXVrNz5yRLL0yPk
	AUh7euzy7h1NI6uQLNERu5iEyfHZjlsUE++zuOLmJ29qhukoQAGeaEgOJp9BZcbncri5yR169pbrc
	2nRWZWs7NttgDUPuTev4EcsVKZN679hIJF44fJShGt1J4TOuubF/VYYo7HGU3zJcycrOmCd2I+iF5
	NhlkS8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduCl-00000000J0h-3LYW;
	Mon, 21 Jul 2025 17:21:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrv2-000000000e5-2PGX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:55:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9q4EH016321
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 14:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FejjzcessRXamuxdGef6IiWtk5XK9CE9N5H4NCWgoR4=; b=PNXilcgUTbMv1ouq
	A1YYn1t4ZKuvtrEsH12jT5n1aov+zYfP8o8+0WQP6+kg+4OMdpBurm8ataI9Yw75
	bbL0Yuj0mw33YiN+G0TsVc/fEtdvAlMObpiKSDHgHN/kWSajdPZTh3fpciqa6t8C
	qL+bU5nSd7BjCvu2t8EM85mbo79+Us41V0/xkeqOzmqQVcJPubC47CzFtQxj7Hhp
	eLjnJ3Mb8iHwtdJJ6ZiWLFTen9nj9Fupt1Anrm7QLGUHBPiPp3hwY8sljekyf+iM
	bP2He1bdTd/PcUuemlCkKHgrM4DrGv2NGBWc143uV/VLaZFYJX6GQAyu92P8iToY
	r4oAkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rwscn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 14:55:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234a102faa3so38195145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 07:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109705; x=1753714505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FejjzcessRXamuxdGef6IiWtk5XK9CE9N5H4NCWgoR4=;
        b=CRMloSYlHyh39bRj2tg6i9Xy1Nb8D+7MDQ34Sbt9of8UDb3BepbBsmgyZdWOmL6FFw
         6g2FwpvfG7NbN5tWGtnUnFVSOD5K1eeo/WU5aBqUq/Akn24Bp4UjlObOMhPJo8xkJdb+
         mj4VySGQCwpAMVuKfF3lvxhbyQYFDoO7PcsoBUaQlyoVRRxAvnOL9ZLiBiBcPUJJVSit
         zf362NnaZqAztvTJMmkOiYU81UE8URHF9T9WDtWHJSiKaRCQmduv1/5vS/VB9bpQ13tt
         Wm8SrtKCz/5GpXDaDwlSCWAxdPrueRsRDVm0QQBUbb3I+K7WIyi5jKHr67w2Vf/Qt65G
         Nmow==
X-Forwarded-Encrypted: i=1; AJvYcCW1QUJa+GnT9MA+mdYGpiFxaQF9rVBCG2l1oV6LfAQZmTRXQyOVmuZxDE8OdWzTTTrQSnheNlhcXqL1+hsQldO/@lists.infradead.org
X-Gm-Message-State: AOJu0YwL5sZRFkIH4VtLzumzEk6343muF7t4swCK5nAnNbh98bCG0cG0
	Y5CDU5EdqbOT3sQeQsNiqrwVLQAwm9dXwolyqGJJY/u6bKLP8B1jbSOB2bPgGStipOHVCGUZLXi
	P2zb2LYQrg/N0wnjoYPAFf1sKwnqeMO5/EjpDGM9LEngTgfNaEyhrRFxVVyyfcF2fA/HBJuhvpO
	5o8g==
X-Gm-Gg: ASbGnctg/YAjWIlJZER6JD7B2m8FkNXw6/1IBv4wLtaA+6vzJXSebJK3dQqkNVJfBug
	1o1xNre5S1aPLwuCzdw6WpdRci4t835Y0apyJQD2zs5GJJYZQQ3qxuJDm8DEFq0aRiQehwOS85d
	h9eVsYMrG6z9DReWlQDEMP/N99F9a5xn7Fn+C+cvWT49WoIBkEVvEb/gUA0v/zoH7mHgethD/Ta
	gfqbCqCHIKAfF8Rdol4rZV/EjEi+FjePpkmVZzCEJANml5vZ+zdgMtM6dEOpEPvk+ZQvrieXind
	m0/BnktEbJ3QDngdmQvXOc0Ur9+Uxva6wWzxbZaFhAInZPkgGLyWwWBdT0omAJopoCE/CJYi2Ca
	M8YDoBiTyS3+xFg==
X-Received: by 2002:a17:903:284d:b0:234:f580:9f8 with SMTP id d9443c01a7336-23e24ec73bdmr227526375ad.3.1753109705052;
        Mon, 21 Jul 2025 07:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ97391DW7uxpfMEy3HG26NDZaHXwi2jparAOfw5+iKlWu2Jnai8JQP+g81zAyqSEzBAX4EA==
X-Received: by 2002:a17:903:284d:b0:234:f580:9f8 with SMTP id d9443c01a7336-23e24ec73bdmr227525925ad.3.1753109704562;
        Mon, 21 Jul 2025 07:55:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfa0esm59073595ad.145.2025.07.21.07.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:55:04 -0700 (PDT)
Message-ID: <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 08:55:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzMyBTYWx0ZWRfXyncCt9kU0l/+
 oI886pdAJt/KeB0tqobuV3OFHiM00YWuHo3jCXxZvGNJaL1JLKj79XEu0zpxt9BTrJZlUC4s8E9
 ptlCsv1lEdnPh0fJcU6P1jfxVy6K7zoPvnAimnSkgfi1ZTc93sZ+p2XfHAQQyzK3FIiRGxRWvlb
 A653gHXpMJzo8gzaPGydYUuf7eClP4KIyZdOLNAhmpZZNEpYDg9s/Lr5ftS+H+ySuCauQ1f4w2i
 gZ20D1KwRUAuz65VB9oa9B2d1JqXNzv5WqsaY2MpgZemxblOHVH/4uOHPumNC/+6QY3qTO4lnx1
 6w93HvjHwJJ4djYsU/YysdTSMQy091Yu69t0pUxPoeYhxGiCtLFQ19a8gejr6OPOsVO7yVTe5W/
 J6o5GBgDD5MrrdREXFJszKuce0Oppd1+dMdbiyI5TbXZuyMUbJV7Q92arIavV/Ro67dPOnTo
X-Proofpoint-ORIG-GUID: VFtV3a3FvN8Tcqfb_bOhujVSzQ0Lug3P
X-Proofpoint-GUID: VFtV3a3FvN8Tcqfb_bOhujVSzQ0Lug3P
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687e54ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=I0N-cO3Jf6GV4mgy0ZYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=851 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_075508_741323_A600578D 
X-CRM114-Status: GOOD (  16.37  )
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

On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

This (and the userspace component) appear ready for merge from what I 
can tell. Tomeu is still working on his drm-misc access so I've offered 
to merge on his behalf. Planning on waiting until Friday for any final 
feedback to come in before doing so.

-Jeff

