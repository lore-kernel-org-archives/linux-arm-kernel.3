Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A07C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 05:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLp6cnqyCbjFDWsg2nybeJcpM5tSNUhvPi8JJGmzqF0=; b=TvHLU1Vpc0FR+vaQlI0AiLo13U
	mYs5k1EFJ71TVXqe4D7SxhgpQssh++GTSxXdPmQ7aRXJQFMUKCFxu4qIaO+BXk6Kq1Ah+LkK6gk2m
	90BxQWoowLen3eJhbly1T0pGSWIk1syQ8LrF1o7EG5TzLlcssTwiXs/b/CDp7C0or2FX63K1tRV0r
	xT3EFZXC8f0KjL7psuRqt20mFoTZBcsACT5vWrkU14FkHRzdPmJH34gLHTeeDZCpClYpYD/Q6kPMN
	aa7AIddcZSq0H41VeDWUjhvxJNQkQrWqwl/5aDQJLTYkx7JjPjniEAzNu80vcG8U2GOGqBYnFvWpS
	enEVWxOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJQgf-000000088v1-3WKL;
	Mon, 26 May 2025 05:47:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJQYV-000000088PP-2rzD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 05:39:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23229fdaff4so19969885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 22:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748237962; x=1748842762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLp6cnqyCbjFDWsg2nybeJcpM5tSNUhvPi8JJGmzqF0=;
        b=ITuNB1VzNOygISUGtIKQ9YUegCPKWOSMZgpQlOJ0bBkpOQqfnUPOpxqhWuIiHI6x8i
         e2FUwm1jRCedK+VZfjm6uY/9fCNdJt3oV33XLe8ID91dy9SM3GSHovXq+dC1SgG00jLZ
         nRba1a95y0ktp/bHkNZgls8DkzwK6FM3kYUca+WWPviHX4pUUN/wrcc/6odbLGYOfh1O
         s8qQDTGxeUMKzgehxDfCBVYoyQb+Dcl5wWPqx9tVtbWylRMOjCtAEIUFW+dT18ieGcAf
         szrurt4DD0SJS474E3PkPzHyoY1NSVOM4MJl5FlZHWhksq+rQMM3VVNQsIC7PlPdMRzX
         VAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237962; x=1748842762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLp6cnqyCbjFDWsg2nybeJcpM5tSNUhvPi8JJGmzqF0=;
        b=Gr8EZ0F74cBcRN7M853T9yTfu5XfZgZnkIHfuVTO/cljv4YDIaxA0pWINcCNBM5kD8
         S3GhQEcB4oSBQHWNPK0IUeLQJWapvmvw8N8jPcwHftWLz3gNaMaXZRn9rLtV184D61D4
         mOHhJH8Ts3rAbBC0W84HJF6obcQsRdorr54Gyyc7SwE9OUFaqG/NEh9OdimMzZ9SU+9s
         y9MWGDmpcbzFkA/klcmikmNhZ7qDu+EN9xCoXO7pQb1Ncw40oZqmd4AQKfQJNIoWHR8N
         EIPrfMlfZg+g1u0OTzf6qebo+trm6VDz4J6tqPUJs9ahukmGOHLNlhDPk9WR66ByjYsx
         37bw==
X-Forwarded-Encrypted: i=1; AJvYcCUn8ujGp4fiBhGl96EPbx1yKmWvD9KFITAhdgNo+VxGHTX05AESFuMZWkKnmM11tH25rfuSwyA1GFqa7cav5V3J@lists.infradead.org
X-Gm-Message-State: AOJu0YxhDY6vAeWk+QpsP8J2ikgq8xwtYBulCwDQin6ZZa9yh0PlS2S2
	Owj40t+OfwkdJKwo2CVnyo5nIPVEW9vIlUeCRyy4/bb8k0DUmUb90cTm
X-Gm-Gg: ASbGncuzpksRZcpy5AZlMXgYIWmpUGZ7IQjmGkM0XK3VUFN8dJ11WBiNS/dOeRgUGvf
	Wg0KPDk2dQCvHiqZ+f8X23HxiASie3VsHiSO5yRcQ5+yhwpvQTLXSiQ6WZviQbaofz1+x8E2GxE
	33a1/tJkcY/2uULXYRC1DbnrETn2weTXlSLmPLbEV1mzEDjshUO0Agu7fzbP31/ySk6dvaLPhIn
	cqnbkEUxkTw6hQWWW33hZ/yDn8s9tJZaayolPuMtaIAYJGA39Dv16u8p1AO6JfPw1Ustil2zdHy
	Tgqmw5x8YgZGUd1ZcrP5XuO8+CswSW3Q3e3+gnEB7Cm2JgL0a4K3D+QubtAta8WRHtam2lleh6W
	wNnHWLJTZxaxff+hSPpLJdYnt7/nO
X-Google-Smtp-Source: AGHT+IG7xgzxnz1Grj9UzPDie6FzHib+saLpOZH8onxhz75DWnCGce9JBep2Vj0Bc2x5YD1GmylXew==
X-Received: by 2002:a17:902:eccb:b0:22e:3f1e:b8c8 with SMTP id d9443c01a7336-23414f5cceamr132744715ad.15.1748237962243;
        Sun, 25 May 2025 22:39:22 -0700 (PDT)
Received: from [0.0.0.0] (ec2-54-193-105-225.us-west-1.compute.amazonaws.com. [54.193.105.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343635891bsm22297405ad.130.2025.05.25.22.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 22:39:21 -0700 (PDT)
Message-ID: <705d99b3-9803-4f5f-a807-607b49349b68@gmail.com>
Date: Sun, 25 May 2025 22:41:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ethernet: eswin: Document for eic7700 SoC
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, jszhang@kernel.org, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 lizhi2@eswincomputing.com
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011040.801-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20250516011040.801-1-weishangjuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_223923_808564_08803D93 
X-CRM114-Status: GOOD (  14.23  )
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

On 5/15/25 18:10, weishangjuan@eswincomputing.com wrote:> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting
> multi-rate (10M/100M/1G) auto-negotiation, PHY LED configuration,
> clock/reset control, and AXI bus parameter optimization.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---...> +  # Custom properties
> +  eswin,hsp_sp_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: HSP SP control register> +...> +additionalProperties: false
> +
> +  eswin,syscrg_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: System clock registers
> +
> +  eswin,dly_hsp_reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: HSP delay control registers
...
> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {...> +        dma-noncoherent;
> +        eswin,hsp_sp_csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
> +        eswin,syscrg_csr = <&sys_crg 0x148 0x14c>;
> +        eswin,dly_hsp_reg = <0x114 0x118 0x11c>;

Please help explain the meaning of eswin,<reg> array, and also the expected
number of elements in it, like what starfive did to their JH71x0 device-
tree bindings. E.g., this is what net/starfive,jh7110-dwmac.yaml looks like:

...
   starfive,syscon:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: phandle to syscon that configures phy mode
           - description: Offset of phy mode selection
           - description: Shift of phy mode selection
     description:
       A phandle to syscon with two arguments that configure phy mode.
       The argument one is the offset of phy mode selection, the
       argument two is the shift of phy mode selection.
...

Otherwise, there's no way for people to reason about the driver code.
The same should apply for your sdhci/usb/pcie/... patchsets as well.
Also there's no reference to the first element of the hsp_sp_csr array.
 From the vendor code, I'm reading that you are using the first element
as the register to set the stream ID of the device to tag the memory
transactions for SMMU, but in the patch, there's no mentioning of it.
I'm guessing you are planning to upstream that part later. If so, I
think it's better to put that register index at the end of the array,
and make it optional. It should then be properly documented as well.

Bo

