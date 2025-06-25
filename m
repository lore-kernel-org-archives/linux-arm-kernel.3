Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=; b=XOM5ggrr3G8846e0+KD+867gUo
	qqQlM59xL6yQPk03ssnePk/0vhhn4lA8wYQ5UsfKuxbcU/xruVUKv/DHpcDg09Olf60bEj8JmA5WX
	6kaxlYrczGM3syqffg8dUqaNIgPpmvyjTwTgeYsqrz879iFe02o/6chUW0xy6RYeDj5Ujerfse5WO
	/UPNfMqxRmPdRbbp/RKt33UIs6WMbeiqYYMC3b5ZPjwA6eEmICxxNldXWcV3MJAeLsGeesscic5ED
	lRhI3+eLygdZeAnEqkk8F4xAemeaM5OjZOkZGT15neBYF8Q144F9VKt/OAPXDHmcHbgusGhsgEfMP
	/X246XZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXmY-00000009ySS-2QaQ;
	Wed, 25 Jun 2025 21:35:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVVQ-00000009huX-3jZr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:10:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7490acf57b9so250792b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750878600; x=1751483400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=;
        b=ePmRbEjug5jfmlNTAvJvpOmx1NgraIj/VvfcCsR6vNvhgZGwyIUwEcBH3VKb5rMk77
         D7HAjZTnVOW5Bwrep6cma+FX85oVuRdruNgIUeo7T9CbVFqB9JCK09WIDOZlSAxI8P6K
         Cj8CZgmiHa9o6/owvPcT4inXpF0onsjYVL/ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750878600; x=1751483400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=;
        b=ucRmVpM635ew+NRFrE/N1XtbOtYJB4JA6iMLgmz2W9zh6ragQvmPu03LhMBX9yz1oh
         BeFXzF9FvwauJlocl6chUH8vg6JYaVST0cTpNPnWfDw19EunYzmrWyxMY629cO1sAIFT
         PcY0gjp1mAWC74LYfdT4WMNsVQKmmpljIIjlbfjNvKHVWq/0eVa6r/YO/eqSFLyXN0t8
         9EloGRYL7eJ8cDhZaQbeBlXR5c/DtySIfvdGeoEanelSLRGm7V5R5CSSnrmRFzlxbIl0
         CFkDy7yXJcqNf9ri8hDBYNFoOuieCrOTGiDyOt0YCsRoRzMHn3NVvJDsB7y6sNwBwVfC
         Ixug==
X-Forwarded-Encrypted: i=1; AJvYcCU/JkjHkFQ66AUMAbNEpGbHritPCFZFCj3889dzGitfUvk+43gqGw37I0MziBzMYWEE20c2mDqKg3B36ktjaaB+@lists.infradead.org
X-Gm-Message-State: AOJu0YxxC+FoHdqMzyAUOXnn0m8IQU1j69pDRdWJ09nTLXyCAIaXRdFp
	K3nZkcewYBAOW+sX5KTj4werRqg++APC3mue4HhilCQXoyIM9amqilQ5EpMKM9o/Xg==
X-Gm-Gg: ASbGncuWm46LXdFTeUnaRbQggPt1aGXDquRiUMYDHooOjmegLm7dfI7x7370a/Q1+5/
	fg+hPmA4JOFii+ZbqQ0GshJZf0x0hmGeaVvlyjxcuKdguftiUFGpV/+fBeCT8nzhac+VU7ry20w
	bqUuIS5WMALXETbYSMbW8AmvGkZkExeg4Iyc2+LV2Xksv02j+PJhl6ll6XlrVga0R1qbVFCKqIl
	CFnyJSfuyNFytCFKXtW2pNjTjvB6/Id2iPv5sv46numeUS27zsiWOn3PCTIUYX35jYuInz4zJTQ
	qRJfcsExVO+QeRLMk6C9GIEJa737jsOtCVR98Djm/yAQyokSA7F9XW7LJPo9ZabUsLiQFRsOwsF
	RXH7m09myfy5aTT11eoa2yPAEnw==
X-Google-Smtp-Source: AGHT+IHtKCeR3mNQuZjKw/LxFiZxZrGAtvXQtQeH7qGm7c4Q8vzCq5hRLQONNTo8uXUtyVJkmfvDEg==
X-Received: by 2002:a05:6a00:39a1:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74ad4477262mr7141643b3a.8.1750878599991;
        Wed, 25 Jun 2025 12:09:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88313fdsm5242219b3a.92.2025.06.25.12.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 12:09:59 -0700 (PDT)
Message-ID: <3ae39319-0962-4e1a-ad0e-27aca86c2075@broadcom.com>
Date: Wed, 25 Jun 2025 12:09:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
 <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
 <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
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
In-Reply-To: <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_121001_080684_900D7B45 
X-CRM114-Status: GOOD (  16.59  )
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

On 6/25/25 01:45, Linus Walleij wrote:
> On Tue, Jun 24, 2025 at 11:11 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>> On 6/24/25 08:36, Andrea della Porta wrote:
>>> The current implementation for the pin controller peripheral
>>> on the RP1 chipset supports gpio functionality and just the
>>> basic configuration of pin hw capabilities.
>>>
>>> Add support for selecting the pin alternate function (pinmux)
>>> and full configuration of the pin (pinconf).
>>>
>>> Related pins are also gathered into groups.
>>>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>
>> Linus, can I get an ack or reviewed by tag from you and take that in the
>> next few days to go with the Broadcom ARM SoC pull requests? Thanks!
> 
> I was just very confused by the "stblinux/next" thing in the
> subject ... what is that even. I thought the patch was for some
> outoftree stuff.
> 
> But go ahead!
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to drivers/next, thanks!
-- 
Florian

