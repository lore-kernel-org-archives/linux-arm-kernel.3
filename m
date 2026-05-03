Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E4CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 03:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=; b=SuQH+pt/IoPt4YfsKkFadqxiOB
	PS7txsxvVW7xkaetiYqzmuEWFDHMEXUDUhcDv9CYMgNV9WmKDGPtv0IzpyCtE8hShrsOnQZ9UJteP
	17JqpUY8cpebU77xAADV1oimE7r5NfroIIqnuTh5BjVN9alfDYH4VW6zgKI6j4guTgi76q/yVGmMV
	G/NDDqQRzkuhv2KbRuh3o/wr6D4Kek3XhKkEO1PZYpPZn61NfOwOmKYX1I2PoW5X1Ga6ReBEp9S8l
	dfZWdMBhOvQ0gg/o3+yE7heuF5AQH/YZ7aT0shkDh51bTHONjJAI9gOeaTOPsTSq56s0xopSA0pZA
	O/+E2MWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJNjD-0000000AGJ7-3jF5;
	Sun, 03 May 2026 03:42:47 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJNjB-0000000AGIF-0y6i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 03:42:46 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2015609241.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777779763; x=1778384563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
        b=AxnmxteGMppqcrf5o0rg+488dL2pyOWFl299kJ2tMXiTSQzqkYsHzD+b4gcKGpHPCq
         0CsTV3TI1or0e1VgFypWuhzdxg3Qg37LNJz1x7yi9+TJfFYuGiEl7Hj+RKeinXm76eV3
         J+MkD+zoiTu6taRp4fKTc68XfMpoWL96CRd/4kS08MHRN3xkBFLdhBY5iFXLysQrL2C+
         cjVvXBHRsMAvDnQzZFMYcv//JrRq9TPJqKGvZcSOmG08QZluE+5rv5EjY+VoxlI2pj/k
         00wHoc1aT2w1gF7w/HiwTbj8o+qD+6JO5pi3jMXQK5X1JN6kjmeMzN11wRZ9qg5sVYT7
         74Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777779763; x=1778384563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
        b=NtMpzlv1zOAmZXVQPiLanGnf/XggFjxJI3QUKdP6skSSrKTY+2VQCGeU5Iml62KQov
         3PNKcDuuSI5Osg8ksbgcqAW9UQ43TsM7ibO4Z7MX1Ur2jOVFFoipviiaRfQ2EcDQF87p
         y+IITYwicVMvEowRID+jWwuyd8saJY04a5zM6RceAR8XeJykfEU6+IQrORp5sWXq/zOP
         gcDM0ECpUoNDnDXCVAbpObB1euM3TPeQsOPcbt4ymasuLwoKCb1vKrKI2SwkdZpv+2ql
         QkvlizlRMN8nqFLHASs7to7gc62ju64hL0rZzc9IoUdt6KMT1br5nUWkHOc84ChG6XnM
         SF7g==
X-Forwarded-Encrypted: i=1; AFNElJ/Moj9QQ220B/DoZ02/EdL/dCWyYzsFhFiG9K9CyhxaUIPfIxh+OmqCdqLo7XYTPeUKKKds/heD5KSjn0oNpfdY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Y0nKvm3LuePQOWBYqaxRa/w7ttEqSSEQ5nVMJuZ0bNvp3cxC
	MG/ZLHdJnM4K23iRkejmmpfIY3CL6QUUxL+qMllxM7/8TethDntTm5Ff
X-Gm-Gg: AeBDieuxFOzauziXe1G0qttWPJYq82TPgRAVx0DKRBsAB+Q9YovfHshxNKcUfEOYYDa
	W6T3+/mrQANgK8mU6PleuyktNKvx/TLKZu5SnadEmgKz77a+oV8nBRl6GVbBO4HPG9PuzV7eMof
	CGUnqYxqdB9mnfuiwUd5TkZMB1ZFYxhk63LAM/oJ1hlsPPLtIwyHLMptzoz5Xr6xp84uwNKbMVr
	2O2kn2Szgcimh9OALrf5Aoqu/+JLn9dJjj3aU5RE6qCRkPXz4oNLle08yRInZD2uBD/XPrIsDx5
	5XRS48pOQdF/bB/78K+h7bind6JceA15ZOqjQZqEZJ6kCwulKxmOVgG0h3TXviUEWINDVFjyOHK
	k5b0w099FDHjXIAsYoTu3d9bl7PtYELSReCKDktfskeWUNKcQ1KH1HMfwAdsElOFvO8mKVUcVlV
	E6MILD4pgaC05hfuS2bSQlo5doTGVjswdbXupMwBy/DOE=
X-Received: by 2002:a05:6102:4b0c:b0:604:f29d:84be with SMTP id ada2fe7eead31-62d84a67460mr2488161137.3.1777779762631;
        Sat, 02 May 2026 20:42:42 -0700 (PDT)
Received: from [172.27.209.232] ([129.222.53.215])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af57f6sm3669350241.8.2026.05.02.20.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 20:42:41 -0700 (PDT)
Message-ID: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Date: Sun, 3 May 2026 04:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_204245_306401_675BABB5 
X-CRM114-Status: UNSURE (   8.27  )
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

On 5/1/26 16:54, Alex Elder wrote:
> +config GPIO_TC956X
> +	tristate "Toshiba TC956X GPIO support"
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI

Hi Alex,

In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
make the 'default m' unconditional - assuming this is what you intended.

Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
'm' or 'y', respectively.

- Julian Braha

