Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECDBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkhdPwR+i8G4KznbeuRGEbuhMQKkED+QsjQdmytH0d8=; b=4RvUHjrJix/qF7TLMt0wdDJgvn
	LEc8DnN4lkJiZOim0BDAcFV5gm92zMR1+Wd+a2p03kZ+rCkUQx3WJKb3Q6MBWn7rnCORhCZh0F1MH
	wUfv50GfGBANRX0hP5nA4MHFlm2dAL9U4Amwkdnf4VIX+LusAIaf0RzMU9BGTBvm1KwRIiYtOv1K/
	JMJ/PvkdTlBdgoKk9hKXM/xKhRVfiKlS6n2Gu6i9YScUvinPVwNJUUlOJfg4IHtYA6DCFsZNrmbaO
	aUmUOPSN3xdsoa/ZhC6PbKcHPgKTora6hbpP1mD66uDl0E3VLF9Qf1wZhoBHRyg9u+DLrOS6stXcq
	3FCLeImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYphG-00000000sp3-4Bga;
	Fri, 17 Jan 2025 16:59:51 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpYn-00000000r0i-0aRt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:51:06 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-724a5d042c0so69632a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737132664; x=1737737464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SkhdPwR+i8G4KznbeuRGEbuhMQKkED+QsjQdmytH0d8=;
        b=fzAONFVuDlt3GbHdQmqk3akOu/CiViIr3U+7Jedbj7+3cIzOevR0nEqMoAs2Tq50m6
         WNZFA9IvOsGQSfOMrQ6Bh2NAjf4sUJMnP1AHTxxCzqJsAeUgB6nXwRmrLSmkz1Q7Xqrs
         Omq/3t/blajwECJ3d344D/qA+nhKGn6Yq1ako=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132664; x=1737737464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkhdPwR+i8G4KznbeuRGEbuhMQKkED+QsjQdmytH0d8=;
        b=nDYSzvM/zPR/QqndwBcGZFSrrvIfSUyQ/yL+O9MoSSDrk+k4z72MoCw2RxBqPx9vtT
         Y2dB81x/zcorUewqwaVbi0sF/XPpMTp/bSsJ1RJJLJK5OryTx898h0eKNxbQW2sZt4R+
         ISWtG/Wyt2rpVPvYhd4BFv9GFQc0kSIoLahDSbgsEJazrP39OhATEKxt4gICFMG5gCnX
         VceexAZDffOxsfa68sd0VKEixP4wthMAra4Q3044S03RkZ489j7sfdwGmbK4qNRKgIJF
         0RlzC1orbZez8I/l3jzija6+lrVztWzrtHYurUksmEE+vhighOCUFA2kQiGE8/OjIibR
         5m1w==
X-Forwarded-Encrypted: i=1; AJvYcCVXjgd3N842jgzhaEeQPttWWTU99xLBKDKwDlu9TJczb6ZOsveJCqMnIAXu92cumEECPAit9kNEDiUbSdpk8o7C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz36ZnrSq66o+fLhPYc4OyGTeSKKa9DkmlKwEXoBo27b73clFf0
	xNHdW0ILiaDJdEUW0How4ICaCPwIXp0bm1zbfMyjzLmJ+eFXiZX0HLq00hZRcw==
X-Gm-Gg: ASbGncu/I8kJ7m32rPH8Ly2SdwxIvJ/m1twaQ+pyUELRq2Za/4TWDel1ljg0Sn3PF9l
	7+0EVMB24pVkAA1m7PEFcOmRrwXSmHUJJkvjv6J23VBkf9TKUIQ8PL+wphC8CA3yw3TcjqKy1wM
	K9kR2D4Gzn4qf29x0SGynmOjHn9ZZUEzMHRn+229e5UuU1OoTeR6vJvkOmR+U+CurI/GP8b1aMp
	zsV+cf5zSbhoNwIiBXhRvYNFOFn9sE1dIPTrw8G1dZN1GlEFMNYGWUa8vglYz3/3W0g/WWikUSw
	vbEwphZgzm8uSVd1k7YA0Iyzl6Ahj9o=
X-Google-Smtp-Source: AGHT+IFKbDhEyNtGWlN2yc2R755sLxWqKLsveQjo/EwG8YGMpFOe5bAas7SyegTZ4OtUkrD6juv5rg==
X-Received: by 2002:a05:6830:6713:b0:71d:5b70:41bd with SMTP id 46e09a7af769-7249da7191dmr2187325a34.12.1737132664380;
        Fri, 17 Jan 2025 08:51:04 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fa35f07ebbsm846110eaf.14.2025.01.17.08.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:51:03 -0800 (PST)
Message-ID: <7c154b5c-e745-45a9-8939-b0d429299b31@broadcom.com>
Date: Fri, 17 Jan 2025 08:51:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <bb69c32871d162a06dfdd26ba958ea0a74b592d5.1736776658.git.andrea.porta@suse.com>
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
In-Reply-To: <bb69c32871d162a06dfdd26ba958ea0a74b592d5.1736776658.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085105_181609_71B02E33 
X-CRM114-Status: UNSURE (   9.31  )
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



On 1/13/2025 6:58 AM, Andrea della Porta wrote:
> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> Add clk_rp1_xosc node to provide that.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

I don't expect conflicts so this could go through the tree that will 
merge the misc driver (Greg?).
-- 
Florian


