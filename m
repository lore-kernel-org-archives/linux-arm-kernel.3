Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EC2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbqhHpDGnLPGkVsMmvEXgPCxtKOy8gFGjV4mEQUjUaE=; b=q6AMoBwle1u27uRw9XCZnoXPkc
	fV9oIVAHsm6Gs0kssqdiw9NxFz3ThrQilRoWWcoKRz47J6QxVqEH7U44iyCIKAUoYuJ4XwlMi1Chr
	SVwSDsMBLHaKYjbBBLFPVSQVwTC8Y5xFjpjo8YGhBh6SRFio+fxw5443OyVOVYl9gCe5ttQNe6cae
	+LMYdav8vA55w6Bd4EhPEn7Cyj7OPh7JEv4CZGXYi5piAuUNPbzmelw3GiqwIZg9cXQYu4kviI23N
	eQmCThgBV1REt9k1D6eJ/09jSU89T/URS8fO+liNAb4LlxGkD5jMoQh+iL+FBmIr9zJbw3LED4zGv
	D6QR821A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A4V-0000000D5SG-0F3D;
	Fri, 11 Apr 2025 08:49:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39ul-0000000D3Gm-3eHp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:39:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so9190875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744360745; x=1744965545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UbqhHpDGnLPGkVsMmvEXgPCxtKOy8gFGjV4mEQUjUaE=;
        b=Zrp/hfu93Cv3Pglh8FxFKpzmcHQMXB/lV8XiPdVg+BFEGSWfhpoNR/qIy7VsG5MLQY
         q/OMFIl9r+52v2Wr03jwfq4icgeaWcJk8w1tFyrf2bQv25Xfh0xQASI/AI10yas5JniD
         4Vi2XfXpWymF26bk4vmVWePZApaTzmukPdNeMi2zlz68QNWGfiX/OzsF8hiHpMt5l2i3
         gRT6mNKCmeaVmkItGozZewFen8TE8YOPiK/XTdBcK6SMOkfnM9CS2TldTZgwDMo73r4H
         vYjMtBjVuT2wcoLWf8nr4JlMokhubGQ/zWEMQwmwDRDcXUS1BSNvBBYh15h6H/HmP3Oe
         ZwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360745; x=1744965545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbqhHpDGnLPGkVsMmvEXgPCxtKOy8gFGjV4mEQUjUaE=;
        b=ZHt6IBXNVsLtHERX8rkx3Mva0h9XpgaiZ0t+qWpMJa1pIaj/lmErXRmCkj57FiMUvr
         SRwlMrzS0/tKQc8PZ+OqB7xO9s2D16xaas7MgX8OUzqQ64gS+gUpIJL5wExkq+lKO7By
         2A460Qk3RrtPqg+NraqZgLVuSzUmBAak0mVupSX/H4xKKM+LPFcOBfdIPXay0sEUcGO+
         Wxb9v87NFu0RoVPNM0OIoGKfVgXtuY/C0tFaYITeRqsDQE4/StVVcFQz2V8U4G+5p58H
         kOAdHxswhjTkKZPMK2crCjCEQX4eNCJD5I4LOfL3Ogb1qI0OLwUwsyoFahbJemrlrOO6
         tvqw==
X-Forwarded-Encrypted: i=1; AJvYcCVx/NC/iFzKjWKlHcdTES/8QZpVUTDyc+0H5CYXCHj8ykmZ9PSW8NJSX0PGzSQ6PfDltfRcMSezZQzN72uX5q5q@lists.infradead.org
X-Gm-Message-State: AOJu0YzyYKr1Ppdnt0CK9lWOzx+pJQpszkMwNWcYi/cOK5ucIOoQRLr/
	8VdItPbVuwakX9vWp9J7mQQavVIToT7Sihxw0AQsqxB0YMo38Vpu7RJNYBVDTn0=
X-Gm-Gg: ASbGncvB7H9T4sCKlCwBBP8IuRJeAyOofTuuYgl+D6CnVaxgtBOYA4B5jpcNSRkLRqE
	czFxrNUA6JSX8OrQWs95HBJKpcK7r2ljAl4SXXnX1clXVgKGZFaayiEbldGhLAisy4a3F//wtfv
	Y2jy9Jsr/LNQezOJubieJzaYHJqxBO7cYw24fCBQ0CAuERjF9hv2h2CIevhgBNku2RZzWDy2eJ/
	fvkYT02473iBoUtelYBGD7Ux2SBz5lcjBEaSnrnSig/8VEQtzmEyekpQlDdMK06dWVY6tb+chsR
	g19y2CFriLKqN4j/yRdPUQJVz9c/U+mGAdNMcQ==
X-Google-Smtp-Source: AGHT+IFbch+LgCuDELs3WvE9MRNvWpRzSp1CQ1o92LxtiZcQYdnuekpCyYt/EYUT5l/w0OVuxllPbg==
X-Received: by 2002:a05:600c:350c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43f3a9b02a8mr14817275e9.31.1744360745461;
        Fri, 11 Apr 2025 01:39:05 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207aed49sm78118455e9.34.2025.04.11.01.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:39:05 -0700 (PDT)
Message-ID: <99ba6e9e-463f-47d0-8d1d-52d097808098@suse.com>
Date: Fri, 11 Apr 2025 10:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module
 over I2C0
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013907_912413_C98CFD36 
X-CRM114-Status: GOOD (  14.01  )
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



On 10/04/2025 16:48, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add support for the PCA85073A RTC module connected via I2C0 on
> S32G274A-RDB2 and S32G399A-RDB3 boards.
> 
> Note that the PCA85073A RTC module is not battery backed.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index ba53ec622f0b..4587e1cb8835 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -153,6 +153,11 @@ pcal6524: gpio-expander@22 {
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   	};
> +
> +	pca85073a: rtc@51 {
> +		compatible = "nxp,pca85073a";
> +		reg = <0x51>;
> +	};
>   };
>   
>   &i2c2 {


