Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BDCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dauqN1FImNWy4rwXPKxul6Sk7/dfHFTeFablnNaeE7s=; b=M0EnFjbDQxnEocjhVLbnZ4zlaI
	H6c2tItCwy8pnKSvlDWRDvCvVTRCwxahPHigj2wGatO28JeXihxJx7Xb/rCz2z4AmZL+ZYl67WQT0
	NUDpwMV4UW0CYNNwg51taINdDROUwAsFRIUqe6ls5aIY+fSK4N8FCbKcDuxEc0RKBdfQLASOiU5kh
	2sQQ6gyAQXIVUw/aVEQ3I0XZBxr/ZvjBfsxj6qsHkkRUzaTGCcnA6M+MglZbCBbHnx2L1sFwzT9+A
	/FoKX62s8Oew4hndspAZx6vQwTWvqT31kndGbr8FdZcsJWHnjYWqLsb8RIpmVWPruhQ2rCoTJ7BBY
	X/vtb2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPVq-00000003vs3-19ZU;
	Thu, 30 Oct 2025 10:04:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPVo-00000003vre-01nT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:04:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-37902f130e1so8196341fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761818646; x=1762423446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dauqN1FImNWy4rwXPKxul6Sk7/dfHFTeFablnNaeE7s=;
        b=H5ffkeWaX+vaJ9MISwZSUGRA2nvKFnEPPcInLrPpFZY2xFV24dpxINh/jlhA7rrzcw
         LlcQKJXh8HjhIQaNIPcwTGhQ8s6nXVjx3MT5BCFHD6MjVbJSoSibt0NIhZMSWA9Vtw32
         WEqLriNAb6w7vrUC4h8qHGIoiQIWxJ7xwYmJyOCuhnhCkXhOADhb5rsjx2mQN+q/uOby
         IL5lxBPUbeJBHAb9PmxsVXDhQm9rTuEeTPD9ClklFgAVrmRWcchmx5GvG3RcaahIPVCW
         Tj/QT9uG0kcKqOGkvFr1/blllGFSn3Bcga2CLrq4zttkE1OBe5AzugSnqz/SwWqqCKs6
         DOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818646; x=1762423446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dauqN1FImNWy4rwXPKxul6Sk7/dfHFTeFablnNaeE7s=;
        b=JoY4wRRMCDWQ0neM/RrzxTYBq4rW3PqOGd4iHtWy5kQ9N8zF0B8br+NH4AOxY1A9JM
         QpaVKy5hv9fnJAPvbfoIV0azT4cZfrwAXh3ThIVhwRgl8ChcG7rAC2FBZUDCEHzJ9ciy
         3NHZYKa+H/fsM/VTNX3EcJfYbPl0w66fY3SQEKwSTWn+6lY3GSCiO41hblQdgIlJl5M5
         pBbDm+OTYNmkC/UYkwsp6NwgUq3xwU8YTlY5f9vDrQ18+dl3nl9yumOZXVMWxeA3mlZu
         z+VgTusuIcr1tZknl1OFrELuKmmM6P781mFscEVdQv9K7Scs0BITJJucJjxROiaUDHmb
         FktA==
X-Forwarded-Encrypted: i=1; AJvYcCW/0su8Z+4Rt6roe1g5YQUw3pAN17zayzLQxc18UW/gDgIeZ/ZKlsvY4FJlacsomMCRXEM3zqqZXNAPxbK5M/bv@lists.infradead.org
X-Gm-Message-State: AOJu0YzOks0iaEYFY4Dy6vBKIIkfLFGk2Hgm5H0n1iDfoAOz9zevhXKd
	mYYe612XPaCowHnSev166QIvBcVIKB1FPyb1fTxu5n02tmKg57esrU7S
X-Gm-Gg: ASbGncvS7P/XalXukDqRkeEglniJH8YZPieBiBNuCpPHoL2oe7/XBfA/QlYEaXkYbOK
	IoFfEZs4/922fJI/hoh+FtCS5zOpTaG/jYQZIHvAevV7jUnXBEg8V7SCqDd3VOzkJLJoLNZ9/oN
	g4ZTY0AMZ3F4LiHFOPT3l+TqFQLlIai23ndeSPNXiqqQOzAcp1U1mfNohtPNeZEPcsPZr30sfVt
	JS1XrXBYQAm3cOQ3woP+Nivt2qw8U7Oln2CnflBl/b+zXI/oCUySCaTYF2G02PYkXUnVRhU5Q/V
	Bx1GXpY1zHwuRZATFrEbS1QoYqqE4dOIRNfR+ikyWU2uHx+cJVh8c1DzLdFWQGmbSYRbfUIXpSP
	83L+NPsF7oDSwGLRowQ20FIgeI0UZnH93pHa63yl2gZiO5JYzYHRCV8juVxBSVpAX+KBs/00O7A
	rG7F1fq3DqboKXZXzWxKciuXT77jNoPlgGpKQCdL3c7V8E+y4Nr9+5ReLKdg==
X-Google-Smtp-Source: AGHT+IGyCpQSfbBRdEYvu2lNdOmyrZXNNZuheExnuJl6d4xQSCtQI8cyPqqgwbNtC67LbnCVinYQhw==
X-Received: by 2002:a2e:a9ac:0:b0:373:a3e2:b907 with SMTP id 38308e7fff4ca-37a023b0b88mr20842611fa.10.1761818645333;
        Thu, 30 Oct 2025 03:04:05 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0bc2aasm39339011fa.24.2025.10.30.03.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:04:04 -0700 (PDT)
Message-ID: <bd938b24-59ee-4a61-87bc-4416b1a0e55a@gmail.com>
Date: Thu, 30 Oct 2025 12:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
 <20251030-mini_iv-v3-4-ef56c4d9f219@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030-mini_iv-v3-4-ef56c4d9f219@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_030408_055873_0A864959 
X-CRM114-Status: GOOD (  10.01  )
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

On 30/10/2025 08:35, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Ka-Ro Electronics tx8m-1610 is a COM based on the imx8mm SOC. It has
> 1 GB of ram and 4 GB of eMMC storage on board.
> 
> Add it to enable boards based on this module
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
FWIW: Looks good to me.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

