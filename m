Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69736D72369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUCxTM0YhciBvG+Wu0fAfickBYXzp1a3MFu1VYYkG0Q=; b=EL1gKra/24TRn2/qHTlQRRVb2v
	eDQMNk8uNZd5wpNNAPGFuOGj8fPBtVCEdUgDOeUI213w0i4P4/T6Abv4vSUkPq2lgrNh3ipeuwuGu
	A+otXF0M+XILGPXrhdQ0Kwc0lNiMwqpKwANE6CL5BPJS3ZE1+i9LM5vHM9YBXNKnAAmMLzeptG6e8
	WLRM0Mn9LRehhV+aBf1FBhu+ZxNiilTxDeKK19gPVvnxPVkYu/tiszJW522mc5hMX780J03+h7Jxr
	SPrNdKnEIurrj4uszboodi2+tIuQZzOK+eyco7vhxDHOEWUXzY7ta/1KQv0/8Qx7FhdDCB6T13kcm
	xLhSMozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjE5j-00000008gBd-1tQz;
	Fri, 23 Jan 2026 10:08:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjE5h-00000008gAy-1Ywf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:08:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so20392915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162911; x=1769767711; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUCxTM0YhciBvG+Wu0fAfickBYXzp1a3MFu1VYYkG0Q=;
        b=lDwocWURVI9oMsZklct0/ZW/QdrE0TcfSFBPy+VlZ9Y9DV6MD4w5PFfgtvxjeRNsUV
         YtUzQBCuXMYvTBQAv8HjoysS+jUgFdqkzl/O2P8ZdT6apJV0oU/i902UHICe2A3yduKH
         cFvsrkpvq8x+6NY1i1AklPbrNpm6uTkyh4LIE7XYUnKgoNZZhOR5Llxc/PQt5/MxJ4Jq
         LJW90w5KsV2rhkc1p1oPj3yukXAkJA5/miZdzNaG0h9zBC6omdSR9dWoYooYI534Iy+F
         KC2qsioJ3lhsuEkG/Vs7FBuRHj26IhGykTOh7gqRFXUGn/zCqQONTnXafqqj2W13hc6u
         fM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162911; x=1769767711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUCxTM0YhciBvG+Wu0fAfickBYXzp1a3MFu1VYYkG0Q=;
        b=OYbh23lm5VYBxPIFcMY5bxeXzaKTqhfapKSrDZFZ1yGzuBVhd8u07EWjNkYhocVJgf
         5hzterTx5a3oRBfm9ZkV6XPp4iX+Xn1Besgk1Xa4hqaOJOnIWzg7RN3OQYxvSRJRHflg
         nd7WuD5z4WZeXxrYJmwZdfyI9lZ+rVzh+HfrVSgCw1TPrnn3g64RVGsCo42ZPIbpZ96b
         Id/Kz+zYz2nPfiJpEhtlwXF9QA55u1Z4r+io0jFC4t0yM+iypOAz7tU8aS4OmlJeB0Wb
         4qM5bq+btAmYkpfFYD1E6ayxxMUNPaNk/YqoZduL9BhtfH96YBYjS1TGj040RQZTko0G
         JpDw==
X-Forwarded-Encrypted: i=1; AJvYcCUDRsf4MxahkhPKE/UO7KOiY7urG8oQIs/C4+7CBwhwwHU0JJT836VEe7r7gaY+U+JiTUhBPfLk5xv7M79jy+M0@lists.infradead.org
X-Gm-Message-State: AOJu0YzI4aEJuTPjuH9n/e1MBUI69tsizkgS9wvnN6jAyalLPDjh29sz
	TXJ/627C1cobNeZSwlKOkcoIQBNJ6sn0UKI0GS7eih30Fxe47f1UCcsf
X-Gm-Gg: AZuq6aJ53VamB8mGMdmAYTfeNfmUtPWESmZdUMaHYxfEpz3HGa0dUrHWUONHZW/waP1
	GSG7Nwzc3IIn3MzWLhUfoPqGST8DxFtrHYV3/J20XZ+i3NYHcHT07VN8EYIKz/PkriLnSg0ABtl
	g0DI6xOhLjpjtlbRbNeYDQ5IY2Ip5FhsH9RN+mtAFHwk0riora8CsDozb+Iod4G487JUirdEz+x
	6fsz+kOALdpn6HNA6inZTzCw6VVb96iZ7W8ctnoiGkDR2K/prAb3KBNqBVPS0QMm8omO5a0xXAb
	Cf/vBxEL0KmfW0wYgki+RLufxAoPIKsKtgPO97yKAp3yeHZmUTBgKP075GgREfZ35LbJBi+kHWL
	x1gRVMoua4kd/MpwhJRB+SH11uFzF/ZFX2oniwgCDGWmL4p3Ayp5pyacgRkkBRzGJD5ihm4hm3T
	FVuKFevrpzJwoI3Km8qrUhnDBpeRitaK/7SucCoFAGgii0
X-Received: by 2002:a05:600c:548d:b0:480:1c53:208b with SMTP id 5b1f17b1804b1-4804c9cf3c0mr41244535e9.36.1769162910876;
        Fri, 23 Jan 2026 02:08:30 -0800 (PST)
Received: from [10.25.213.222] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7b4d8sm5236892f8f.38.2026.01.23.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 02:08:30 -0800 (PST)
Message-ID: <86970fc1-c4c7-4a52-91e4-f9f93be5990b@gmail.com>
Date: Fri, 23 Jan 2026 02:08:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 laurentiu.mihalcea@nxp.com, daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_020833_421103_CFBB045A 
X-CRM114-Status: GOOD (  13.06  )
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


On 1/23/2026 12:48 AM, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices, so need to clear the Supervisor Protect bit of SPBA2, otherwise
> the sdma script can't work.
>
> As the imx-aipstz is a common driver for all apis bus, so set default
> value for all opacr registers, that the peripheral does not require
> supervisor privilege level for accesses.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)


Hey SJ,


I'd be interested in explaining the situation a bit better in the commit message.

The 2 most important pieces of information are, in my opinion:


1) SDMA2 transactions are set to user-mode in your particular case.

2) Your script doesn't use the peripheral interface (connected directly

to SPBA), which is why the SDMA2-issued transactions are subjected to

AIPSTZ5's security-related checks.


Of course, please feel free to correct me if I got something wrong.


Thanks,

Laurentiu


