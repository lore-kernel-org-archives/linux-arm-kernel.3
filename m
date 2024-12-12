Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6205EE77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY4XSszRMLAuP4zkppmQozhG4xq+ulRYZgxgC0WoT0M=; b=FotxWQWrgTLHSPlPCh09HxoRft
	7juwXdl5sxC4bVp6Z8z0vJkRdYxIFL8YYwRqhyTwfu47ptIrNnoc0IfMplCCbXE9NAr3eNxD/l4q+
	xzqVXo1yT2mynDH9i6i+wYEL8B1Wwt8MN6HQVjaoe36waNyDb3ta7EQcvwid9pGTivoBi+o86sX0g
	EHqWOAFGGJBM7WUFjwmMvn9NGfRZwJFSu/PiO7wlCQL1KYYwjBngJu9h+6LZV0CD4Zm0i9YBxZzRn
	NOSUc47eqb4WSXGxZZuIkfZpWjyJlavMJNFbiteJR67sP5xXrbiSz+UeJ9j7c6YGX7JOMEXqLFudm
	nlgn85cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoim-00000001bjw-3Mis;
	Thu, 12 Dec 2024 19:19:36 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo54-00000001SZ7-0aLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:38:35 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4678f681608so9858911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734028711; x=1734633511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RY4XSszRMLAuP4zkppmQozhG4xq+ulRYZgxgC0WoT0M=;
        b=ZX5Rh7Y13v+IjJdqHOqvVN/qRd0M6ioub61AhDNX7m9ptbUjK0F5iTtkBiU4P0l6rc
         GjXVS9J0vqvxGYKER4kUUEKO9g844yyDfjNGDrGJyVvEU90D0iRWKzhx3C6Cp9W5xiwx
         H4H1xzfoFE0zRZFrZkQ+3YlpO5G4WHHKB4p5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028711; x=1734633511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY4XSszRMLAuP4zkppmQozhG4xq+ulRYZgxgC0WoT0M=;
        b=tegRabIXkczWditFAGkUtqTWf8ax3bhBhxyDS8dr/oTM0FqUtOQHqZ3N+0Nn2SgCHS
         nqebMnkXmQGVB0pTdXOFGgUoqA+wZiGkrzWgLsos0XGXEF8mOG+oxujGtR3cty1KPD2M
         oZYuO60tOItYhVqgKZ4Uj8Tv3ZA42Py/IJVqJvpuj+22IVa4vM78ecosgdg3t68IMGsR
         UDvFlxsoFExXmUsKr8cUOVJirzETiawk5AHtj9FvDKjg1hPhxrbLUiyEQkqp8FBZR/PR
         Db++f3DWarfiaLwvVr0mzpmJVnIjBidjYY+aZOjM5pJjD+VpimrjPeaC5QGvnflNiyxh
         ln7w==
X-Forwarded-Encrypted: i=1; AJvYcCXF7+MIi2PnZfBj3djePhX0I6zSm2Mlj8841PYRZXI8Rg59tpW460J4b5rsx/FyjYa8H4wxGzw2kyMXDlEg4egW@lists.infradead.org
X-Gm-Message-State: AOJu0YxysJ5XivMMThIk0wUNXnf3ip+YYTdJVhkiPM+iXpcz/DIHlg2C
	cKPKNUQumNuannOrxFEChmJOVU/+A+f4v5za0cvuv7gM63wEVzvi6Pvv6osgHA==
X-Gm-Gg: ASbGncuYtqXraFsAEidrm//cBRAPNWcj5MieGI7znt8XXvJ1E7/1LJidWFc7I6sQcdo
	98OFGwhlTboEPJdT5LpGV4sUbDNlAt3V0LUssJWvXoHODcxcbAQsiXZFGE5IcZnuI35JB88GQ0I
	MBEMYsmbvnJv3zAbMLTUOBldATxTMr+rdmJVtSqc/FNPbQyb+rhS80ARTSqzPrt46lm8RmwwHnp
	IA0TXuIp3PP3aE9/zENdUGoLg5UWJpwzWpQXFF/G0UmWEe5MW1NcFlcPFqJJACfgSEtXYCTxALR
	EdK/HUgMoSxCnD0B/EvH
X-Google-Smtp-Source: AGHT+IFrSej8gbXB5/x0xpywNqXzp00kjSoVVwX6s0c/neVrhKP9+H9a21BzIInAst0EQtH7/Krmkg==
X-Received: by 2002:ac8:7dcd:0:b0:467:6833:e30c with SMTP id d75a77b69052e-467a1633a26mr20778431cf.30.1734028711389;
        Thu, 12 Dec 2024 10:38:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46793279fedsm15658671cf.64.2024.12.12.10.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:38:30 -0800 (PST)
Message-ID: <deed2858-ceaa-42bd-85f0-2b280070437f@broadcom.com>
Date: Thu, 12 Dec 2024 10:38:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103834_295017_99195FCE 
X-CRM114-Status: UNSURE (   9.40  )
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

On 12/12/24 10:36, Dave Stevenson wrote:
> gpio-line-names is a generic property that can be supported by any
> GPIO controller, so permit it through the binding.
> 
> It is permitted to have a variable number of GPIOs per node based
> on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> items based on current users.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

