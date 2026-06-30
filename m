Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACB1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=; b=OXmQ5xYF1DjTUEzcpkDOfGl7AN
	JB2E72FtLskjQgP89CW1VspTlaN78Shda2h0xvI2JYnLPxVkEE6ZrQTHTFTtAjeSaXGvsMsF6RyPL
	VDg1gqnobChhdfkdnqYxLEltiDvuT5NEqEzu/Fm1IN3ZSICvUfh1p/mRDIKWxMtrlMheqWYOLelI7
	CT0Ef1n5PMNFnuPUUwuq/hUx5EXW16fcZoCzJEAXzHCQIwIPs4Tar+95ctxASxWVWHzCU9BzaXJhn
	6zzFzQZbzgjR6eudx28pgoUL2orzkEsvUOlU7RwPv5Dcu7gu6TnVvnAnLxbgdhgZsoDxE8r8qH+Uu
	R/ZCG88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegcy-00000000Hkm-1jQl;
	Tue, 30 Jun 2026 22:08:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegcu-00000000HjK-33Fg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:08:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDqIG2947930
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=; b=cCTN+vD4HZwmI8lY
	ejqu7lzDeKTXwqFAMS/sTRNpvdMoMiAxUyoiJA4eFhpTgRLfRvMGXkbNO/sLcOq/
	Kr+o5qtLY8bZPydk48LmdD/QYhha9Mb3Zu6Jg+jFbz2OOi1lt4JlAnzouxfKRufJ
	1vGYuxgbkXfYsDebztJs91VxnfPK2OfyBaisU1JmguWpqdxoLPcaXic72syA9QUH
	lQgzTeaDRLIA5CkABN64XzCZrZhXKelOBhJ4L0wGngzhGDLoUE7KBunhksmwlV73
	6OwRuUZRp541lZkHdVRtlTvsEu9R7y1qiVobl6Ek9AO7twcGrKJzrgt8SbClgnEU
	dlxizg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0ask3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:08:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c364ae3bso1083885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857298; x=1783462098; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=TgYBaj8mFHD+LyDr87UTUqhnWcQkNOdxuhM6QUn4KlcU0mvuKug4Zbb2iAcxacRlNl
         kPlMVBkqsMRWuyYLnTOM7CEkQ/7WfP3cEiA7IzSNimh/Wl8lgWIQzrljZc+fYy6xMNuL
         8xhs6zfDkUGg0ALd9AEpFTPaAb633EgWrsbXz+znULtW2dCPdewIwL55IoY6b9xMdv5V
         y/OxdnvavYYt8n82D+TkPK6rndQ4h/WYVwNqaqpEzcyIWzLqZ5dkU5YvWrfa4VGIp6gV
         EL/+WysSkAOxiFaiJRDnNyIRXYbJopptQb/dQMHn12xcE93nlSYOa+82d16dobEumtOx
         gPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857298; x=1783462098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=iDyViFyx0quU0394RBNzRhKugAMI5hgDHh5BTkbfjFbz6jb//EC+gaIe8fXCecNJPk
         3KvXpigwFihB0fDAB5C34Brw7InKhrugAs47Uv8TmVCht3+h2EJ5R3vCtNFdDs+YldPa
         bCV6/WYIgIQlRvn8/R+OUqF3ODc9H9vKWIVm0WJyaVmseo1DG1JvfzF9fo3pDKW+SQ9a
         IPQ5xdRRnoYx0OzpuqbB0YZr4p9yABHf6NxQlg7OM1hd+ARYJwV9x74wx5ZeWzh4g08+
         GG3JnEBJj1UJ1GykM5lDXK5dBX8+S6U+Lsx+vlnzlS1/5JqI1J1IF5oHZ4D9yrHrfD/I
         7yLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+u/ihDeNhhaHxNoAeR4FXCYXb12q8/9fhduYc0HqiK3mknWVGBHJ2caXcI07adKjtwHPAaAwhMXlBjUKpPoyHe@lists.infradead.org
X-Gm-Message-State: AOJu0YwwfkjeS6opcvpxQ0QdDmmbJ2/cQ0QRtVkXW3RssZdnyua+757X
	2bSKSAyyfUCrhPIEXnAwX0CBGAXv164bynMdzBomrT5KIaRjeYLH22aKWndSxakMFPsIoKD+k6e
	j/S6ulmugZOpFeNzMv6ktCvPE2zu0iFnCcpv4N1WzHcMwKxKhUtXdyru+YwuleWwVrJKPAayA2J
	bUHw==
X-Gm-Gg: AfdE7cmMUNkVa8xReuNilHVLSMG5HD8IuDXb8nuSlNYpJDnhH65sTTd2mhme43I9rlp
	V7N95itRQuEbXQYZtIk36CFrlnccc8VswfztvaEeiLFLDBl4KGqaKVLTTOqTXVPFjQUrwaC0jBt
	zFcEorlOyPqMlzgqP9RM2My4ktPCAo30o5QFzn+vD/FRTpam8NTjDfiVAOtwdmbkH4rPToHFfhZ
	EHScPtkZsJxLuxITRn/vxihpSWxvN6bnpKQJ0GzTEHS/uXsuFCTkkzlfjplv3/2epSy8m9ev3uq
	eHS5AepkCe+Ufw0JK4PP4I+cagEwV3gUL5H71QRciOQOcxMfzWWuYVYUAHNdOtGLiLxLF0rZ44B
	foDnLgUzhvEz15l3VgidwwvJm6jgH58PUOL/LBquAu+si9YuJH7QXaqgBs81Tyg==
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909681285a.60.1782857297853;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909671285a.60.1782857297248;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm9903482f8f.19.2026.06.30.15.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:16 -0700 (PDT)
Message-ID: <9c94a0b6-a2e6-4d3e-872d-b1d3954a4071@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] mips: replace linux/gpio.h inclusions
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
 <20260629132633.1300009-4-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a443e52 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: byge0V7HdaBIjIMhnBSLyUY6j9M42YBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX0TKCwFlUkhe9
 TcEC/POaDceC8GQLXXlHN2zwYQdNBlPvXOXaMNJRdoYQHeYhxhIjl4jv26FeDhmWmHXfHMozhTQ
 Z7NpICFciFMVvxgDbwuWvFOmSASJF5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXyUCoRzO7llwY
 ACpfiWdl5edCe8WWXqdAIIgW+2Br17rxOrAxdo7JRSDZJYnKrXk9R+7JYh8sOi+MFrAUZCSKykq
 9QvfeMKPFB9BfsQnlMVaXUfpMh9gFasFbowvW7JSP78juO2QR9bB+J/fW0KmSnWP267eS0/gHhS
 uIh4uYoFP4VuII+h9M92nG0xaxpO0BU9JIJ2O1nyTlZWMQyYPF1fL6c4OFkYocKO4pZXqZX8cRr
 dtMJ2cOoryCwtAZEY7yrgR2FoeTl2gQHk3/3APkKQArl25JbcCxFYyqUrFSGluRbjeNvZBKfeCw
 pi8YmAdWX00ES11J6rldeSElAbBZNaVuvOovkVXtvB02HTUzmeHm5kSo2zRIP98jTPhD4Ngl9b9
 9K40/4g9f+bj2n9ZKE3Umsqxi2LnVfAVMb4ah1Ui35whwdfW8OuYb0N2E8pz55uToQ/FVl6zV+3
 mmy3X/hVoVd82XrjlFw==
X-Proofpoint-GUID: byge0V7HdaBIjIMhnBSLyUY6j9M42YBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_150820_892837_1A41F7C2 
X-CRM114-Status: GOOD (  12.98  )
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
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/mips/alchemy/board-xxs1500.c                   | 2 +-
>   arch/mips/alchemy/devboards/db1000.c                | 2 +-
>   arch/mips/alchemy/devboards/db1200.c                | 2 +-
>   arch/mips/alchemy/devboards/db1550.c                | 2 +-
>   arch/mips/bcm47xx/workarounds.c                     | 2 +-
>   arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
>   arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
>   arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
>   8 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

