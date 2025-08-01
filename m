Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA12C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhG5DbnyNiSNFxOr3+CmfhAT0XiWxX1Ob5TAR60O8tE=; b=J4ijic9evVcNZ6O+hK0XJMl5qP
	8qKC50oRq5VyBqpfC4i/hTT1Q4Dkli5gc0JdT2xUnuvTxTrzVMq0SQuGXnZcPgeDURHuTOd0e274G
	Y8x3MhkV4HhZ5+sRo9ugIeAMKZhAaDD9VFnDxCSXe2vsU1KhuXvcuI7FfmPVTZ/OzF/Nn7RxW4HiG
	AyflRCu2cU7OWBfKpqsMNsDUEBXfRWWfOrud+bXl3j2W+Q7dFBO1tWKef3GmMYjhGGHjlmzaqsvL+
	IFNAioUMhaK4f8vW72a9EoakEa4F/KK4bOAmSDybqirGGMtCKJ9vp2PXPDlIZ9fUlKK9VOqs30+0x
	+ZMDdOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoLo-00000005b9M-2qmr;
	Fri, 01 Aug 2025 11:55:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnsU-00000005YJm-1MLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 11:24:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-af939afe5efso32894866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1754047484; x=1754652284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WhG5DbnyNiSNFxOr3+CmfhAT0XiWxX1Ob5TAR60O8tE=;
        b=F/GEO8Mrp6YWJw6WrXDjRkjJv6XzqRs8SYnM5JrGyY2OsEujFz3WVJoNrX8nq/xryz
         C+yNZ4UiTK2ZyImh23URH4r6GC6h70R82yFTS3s+oUE26/W2yoa849mMol38K3g54T6l
         TTR8x2lRUGSsPddicUGD6hOLq/SOOr4novf5U9W4uLzZyXUbQVStrY4koe1baF3YlhDo
         h3y++ZDp4nwJJnLx7z+ApiZ8UxqBWmHGrQgdBwDYOYLpWZrnHl5gPKV9LLi7oMk7crme
         J05YhKDDeMZJ6YG3tbssCSxWSbzqIOr1Ok2fh5tf66anmywgfOmwLYzn9ZLenQGc4s+K
         3UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754047484; x=1754652284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhG5DbnyNiSNFxOr3+CmfhAT0XiWxX1Ob5TAR60O8tE=;
        b=vQ1m+n+ot3XKD2l7j8lP+bhRqWkOQB8gx3Omnkj3s0B1JC40LfD5zykPh0qtMJ23XT
         2Ed7U/As3eJTV5db67gfOXAU7MjkYGrdPEW7awSfsZDKa2pDd9gfe11eINF8ecR5kG6K
         zUEhJBm0y/9CIhkCDCwj1/5utJV/bm90RCFQzVGnna6De7Ge79MsSz8wOjxUWZEX+KjY
         DmbPzG2V1rXEj4Z3j7r8S4Xfytwf8uSUkA6CALCpdoDyDchZoA3p7YkpsUsj4rkpOwCB
         uVbaJcxxfe9/4Io4V4s1ysOlw5F5+b6k6+SH8+6xalyhEDJMA2iZ+7YWXkQ++LTMo7k8
         ubOA==
X-Forwarded-Encrypted: i=1; AJvYcCUcbgQrmEWDOF2PLktwQ8iq0g69ezfIEK/931/mzz9Z8MzYZDHwrxYlwblqg/wVW+iaPPYj7kRHqCUjskeG3TKN@lists.infradead.org
X-Gm-Message-State: AOJu0YxEF4J5K6xsTtzI1HLq96iNGLsxwXXtcLW91cEU4Bz7BarXHKwT
	J6UE5/OUwf7Q+WRnQuoSOUaZZSJM1/vhoPsVpKrLS0EhokOodmPF1NZ6lf8b76ywdg==
X-Gm-Gg: ASbGnctBomjokwIsbpHuA1kyFA6ASOolgjR21guN3kxZyMM57wfK+AQ2DigP46MQnQc
	gX+Q+LBC8GjzHIxwxmHhvPG9yzCSGZhqZ8qP3OwQndLFJH1PzzRL+KA6fQboq9i1BimtjvfrVSD
	byp+ML/EQExFAyw/BGPs5R9z0GVSSndj+9izQguotL8vt3J9S7VRmWfXI/xjyMYNw2WAP6+oUFf
	1BybPmy6VJ/5B/pGu+y6Mt1BOa64bKPSTO4s/Ba1Ft4+9GxlC+sQ6SMQyiW7LhUbB8df6wUeiOq
	zhSb697a7GejsvNec7HOrCd1dXtg2qHghaXStuhCcUTTfm+NQFGsGtaMu/e7+bnCQRGMEcc9qZJ
	zvyoqsBC+HW0mCcUc+gpJqfXg
X-Google-Smtp-Source: AGHT+IGAEwxmM6s8rcf+dLmLhqgPa7qSr1WrKscGfc7YN47rj1asFrZD+UvRmLT4EZYOZoO7IqhLxg==
X-Received: by 2002:a17:906:c149:b0:af9:35f0:7a0f with SMTP id a640c23a62f3a-af935f07da4mr192102566b.28.1754047484211;
        Fri, 01 Aug 2025 04:24:44 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c06bsm272442466b.119.2025.08.01.04.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:24:43 -0700 (PDT)
Message-ID: <64e24ac1-e0dc-4d0c-a9ab-8bb26f5acdcb@monstr.eu>
Date: Fri, 1 Aug 2025 13:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: zynqmp: Add support for kr260 and kd240
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <cover.1752837842.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <cover.1752837842.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_042446_372581_7F7B891F 
X-CRM114-Status: GOOD (  13.27  )
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



On 7/18/25 13:24, Michal Simek wrote:
> Hi,
> 
> add description for k24 and kr260 with kd240 boards.
> Pretty much both k24 and k26 SOMs can be plugged to other carrier cards but
> not all combinations are tested together.
> 
> Thanks,
> Michal
> 
> 
> Michal Simek (3):
>    dt-bindings: soc: xilinx: Add support for K24, KR260 and KD240 CCs
>    arm64: zynqmp: Add support for kr260 board
>    arm64: zynqmp: Add support for kd240 board
> 
>   .../bindings/soc/xilinx/xilinx.yaml           |  81 ++++
>   arch/arm64/boot/dts/xilinx/Makefile           |  24 +
>   .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 390 +++++++++++++++
>   .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 438 +++++++++++++++++
>   .../boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 451 ++++++++++++++++++
>   .../boot/dts/xilinx/zynqmp-sm-k24-revA.dts    |  23 +
>   .../boot/dts/xilinx/zynqmp-smk-k24-revA.dts   |  21 +
>   7 files changed, 1428 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dts
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dts
> 

Applied.
M
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


