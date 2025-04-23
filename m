Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE49C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D3Kj5y6LQM0GkGMDpCZ97hnqQlmKF4F8r2fuWuGeQs=; b=nnHL8PNax2XR0louWRs228B4qa
	oE93uQ/9XCYUNKiLl02TZtrWHEjPRX+YTfcwNwAFowNQJ4glaCH1r+oTBJcogIdwvE2bQQA8Ew8Xz
	cSW2qwVDsRBKvMny5WPR/wTaRfrjd6t04Mrr6jpJKGkSlQ3GscmwssWif8q+nSBP6rdnMr6KeeFzN
	nHWBqJg4UbC/Q2MKpx8fP7zZ0WP3kq8pTiEeQq+DTpb4xJkPcZlTR3YfzVF1yp9mVNVGDH6FPa42m
	8tyD0kHMkLbaygkGwsRKF95nAM4UUV6BhHvSg0QwlX1h6M6s8J/dYpTfosa0rTOJ1mmGWeYesXAP3
	uWTtcivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YEb-0000000ALHd-0nKB;
	Wed, 23 Apr 2025 11:25:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WAn-00000009u7R-1reB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:13:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac29fd22163so906062766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745399619; x=1746004419; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6D3Kj5y6LQM0GkGMDpCZ97hnqQlmKF4F8r2fuWuGeQs=;
        b=SE/aglOqSRhq8t4A1js8dqmZrNNu11ixH9sBRwAYIYAKM5t03aoBiaQUTrzGt0awSK
         f1UYQ+wB5dyTSomAWXgkm7uZeB5ltHikZPeJ8IoXSPGUd3AD0lj3jugvS80TbhMJA35i
         oCfnPf3VF4h8Cqrty+Pg7ac97HJq+4TyYwWFvzfvsPBChmSSxToUGzZwEIlaN4IkrGRj
         WDnI3pdmhY2WYVaNkTWta9MUQqKdHQpE62mn3h1WgnXz6pTz6SjnTAdPH0vUiQUsii6E
         eqdFZxYrvi3sQeKyufUbTAJoPRA66EP5lhjlkgPy0GG0Da+2OPBbXYXy3c1TvcKU46/2
         yzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399619; x=1746004419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6D3Kj5y6LQM0GkGMDpCZ97hnqQlmKF4F8r2fuWuGeQs=;
        b=HrexreZc29KjyLCMuurbyaaqfv8+yONUsefLewzmFp8nftJHxIMNWn42dPNk8iR/MX
         MS/D2fWKgGeMoJqhZ5s+dN/sweqKsqVoV31LIpu21wgRwJqT0K/m5U5JQePcBrzX6d1D
         K+kluNrkw9J4Qw59Xp4RaqsJ3asHK4zpAs9hzG4COW0vhMGeL2PZCFgzUOrPKa/BXpxE
         G/sSczr6+j0v0VOr+1fUJE9Z+58dvwgQqoSUgFD7PIJONFsHekusGNPSpHjU75mkZxXT
         edEOoqL4WV9wm3/ca/qJRaJ+YB3dt173LzVVfRwWTkz3pKU31j7Dyp3dSjq2kAjtatEZ
         9quA==
X-Forwarded-Encrypted: i=1; AJvYcCWojjzFq6DuOk67kmqTIgyxMz5P891If8nT0ig1hZRVCCihqr5GSzB9M8MN58w/Vou3IkJ2F2rnmq0pzuosRBsh@lists.infradead.org
X-Gm-Message-State: AOJu0YxFcOULMyTqkKzSB/P4BUwQF0FLEIbz8mX0PtEKHPrRdgX6S1l7
	5ub5DOvduMfsd4dmEQdxrApeufSWBgnJeACodj9ZOxnc6vVLMLutyUiFoVMW2eM=
X-Gm-Gg: ASbGncuVSvqh0krI4RXwEjOKTo8B8d64oVQmP9Wgl1DG4nc5BnuLhwj6mXQj09+41uf
	RmfYj1egHYs5Ou5WogqBTUHqcMh3p8FYgT7imqMVvxkbylj2lXD4f7ORmiOXUoTkPhr52mTSZuU
	mh+p7GUO50NIjvxNKzyRKMI20njWJdLpXA/B9K8SlbqiP12Dy6Mxj+bc7k1Rqfm0F+1+Wp7gLjw
	Eguaar6jVxmMCKBmQFwGeHW5KMBsm8dIffkv2IRQvKCb0q+6UIb9Hq10ys4YqiSyizXKf7C8iGT
	4j13/Mjbytn3CB9gmSdbGj3AEuUgsict4+8u7idwxAn1GK3QOsxHG21Qr07zQ0HaAHbnVuGunCN
	4DEjvUM73
X-Google-Smtp-Source: AGHT+IFzxFQiGoaAPQvdB7be6/KuqryShsyFvmGaT1Th41MerZiCt57msNGvadM1uAaSSZVi3+rZ7Q==
X-Received: by 2002:a17:907:c807:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acb74b2c9a7mr1856705066b.17.1745399619029;
        Wed, 23 Apr 2025 02:13:39 -0700 (PDT)
Received: from [192.168.1.100] (79-100-236-126.ip.btc-net.bg. [79.100.236.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47763sm780902166b.141.2025.04.23.02.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:13:38 -0700 (PDT)
Message-ID: <24a6236b-3e4f-4174-914a-373ddcc90fb0@suse.com>
Date: Wed, 23 Apr 2025 12:13:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 10/11] arm64: dts: broadcom: bcm2712: Add PCIe DT
 nodes
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Stanimir Varbanov
 <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-11-svarbanov@suse.de>
 <20250128215254.1902647-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Stanimir Varbanov <stanimir.varbanov@suse.com>
In-Reply-To: <20250128215254.1902647-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_021341_476061_57F3BF08 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 1/28/25 11:52 PM, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Mon, 20 Jan 2025 15:01:18 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
>> Add PCIe devicetree nodes, plus needed reset and mip MSI-X
>> controllers.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!

Florian, this somehow missed v6.15?

> --
> Florian


