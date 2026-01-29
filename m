Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE30D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ioB3D6BXyeLcWD9XhvHoJBhn3PqyGRuLvXy6++BvIU=; b=vnh6k6f+2REx/pUBre1E9H7jka
	noicfwqtq77HFF15842wQ3yyZ0AlldMyoICUtzLXGq+w1dPNp4fF39p1fY2S6IgWDPszYVD72sSsg
	Jfl7AjRNV4b6CUGjETjIPKdSUeO7DLLD8gdPn1bu/4AmXzy+4OqnPZEndyr3vf8/xKqRJ0rx8EKno
	73M5el5ZeyekpT4L23y2S1F7FPRozUmHC/fgIgRNlwrdM+i+JeqqrlvSJwCypjKE0M6lc7F4Tf7tA
	IXuzgsktSpSlri8Ew6clwq3Qz+4SpryJKeiV3nOSA6h9As9dCb2VhlcVLFmjNJa1BfIMpUFuQaFPe
	2fRu4Fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYDw-00000000ag4-2tLJ;
	Thu, 29 Jan 2026 20:02:40 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYDu-00000000afQ-2qli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 20:02:40 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso1118997b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 12:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769716957; x=1770321757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ioB3D6BXyeLcWD9XhvHoJBhn3PqyGRuLvXy6++BvIU=;
        b=buSJJmK7azCa4vxfnOq6VJl+unAiKWH25I82Gkt6xYc1pU4reD4ZhaEgFO7/8TApU+
         iss9oDGIcs/DlIcQ22tgKuwxzUxWpK+iFSbGYfK5HZRgam9lP/W96eouan9ttZLFZb5S
         QuIxfzTQOlLl02UgUHZ+K2hvT2smS/nsEVOQYHFtaU5g3iDrR6GxgF/nbC6wyCMEUauc
         4Mj7sFeyxHfGsLZuybeFTqP3imtoZa2HHa3V83v5Q5YQOa3UmB+KGVVxXZAbQebMFLY8
         jMUQje7CkFOqSqfgiFxjslcCxxGh+eqTNjtLEQTmucHkDc3bK1vPCmvxEUxe3scUD8iV
         Aa6w==
X-Forwarded-Encrypted: i=1; AJvYcCXUdzbo8wrZA85hnP0NO69n2CzmeFWguBh2B7Z1LOT+EDdW3qhANm8Alg01yyflht7n/1quBDS+UCZBPIZh+v9D@lists.infradead.org
X-Gm-Message-State: AOJu0YzP1uLxOBvmvHjG34x9q7csYM6iaa8EXFhj35OG0ro3RDiTxo5r
	V9/niHnQewpbKhnCyWJIinYX3nK9SR2HFPYAD7JC6y21lPjsoW63kGYnkFJQHJoF81jihBPQXMc
	niGeFOGuO4jHYJ6eeiqbnhn8hKD7kbwvJLCk8YUfnX7zUPVa9qsKmctrkwhH0o21VSMm/bm9SPL
	pRH1nFHp/3ZabQu3+aQfHMJ7UKTtzZg7RI4BvpdNjnL7kVde6OtZJKy042ZRFX2VDJEgJ65qKlw
	ioUILbYBaxcCT8mm8Dpw8m29M08G3P5Cbg=
X-Gm-Gg: AZuq6aJljFWABTcwqL6fTuxNnLvzbv7vFwcMDSoOFSg/EwTvE2Ai/wDarcGDj9J3GOz
	GSclEiH8dbyl3AFG6Ph5CTTpaAXucOMO87jTF+gGqdPSRmyb1z9x+MsMHeL9JYo5lkeueDorASp
	pKq3yMLHe4Rk4edeDF3bULV3nkOXj2vd2izV3Y0IWTBiiCgbQyh7E2QbpCUG756kPZAGH19Q+vn
	len8P9iJb7Du812rnmlzxNafN6PJHqu4O0t6D6I7SZhz8TVIuDpE8yaf0//sV+sr4sB+KztNKsD
	5W2FrUcp9jukb3T0oZX8Qtd1JrH58w6BfKeh0+Xs6p9rGU/f8LInvw9yyGy77j0mgp3I2Yker9S
	uLPOGID1eKR6x4ey3M3L4sDaxEmsz6rt9xDrBVuNxRvKXl+T1QLW9poJxIA0YMMopHHxbsvd17/
	hxSUXKcKhXzQRiqWTjrb4V/yfHCQS9wYZNwwGpGUbc1BaF9AEnSQ==
X-Received: by 2002:a05:6a20:918e:b0:38e:9b5d:dc44 with SMTP id adf61e73a8af0-392e01a8de0mr192555637.74.1769716957138;
        Thu, 29 Jan 2026 12:02:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c642856670dsm375995a12.4.2026.01.29.12.02.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Jan 2026 12:02:37 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45c91358254so3904044b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 12:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769716955; x=1770321755; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioB3D6BXyeLcWD9XhvHoJBhn3PqyGRuLvXy6++BvIU=;
        b=M3vGFMOmB+y6KlHd/21lCUTySkSAwZqqYXHbDdL7Pnv5/Gm6syuGmdFjjggf+grC1m
         RCqxl5NJsQmF88+bH4Cio+WETfCOa75X5AOC305hPnqbI/RN/7aJacMxcscGdkTjkqga
         DFuXqSdmCjrj3opBZ4n3UZRQsjeKB7fa5Z7xg=
X-Forwarded-Encrypted: i=1; AJvYcCX2xuq0O2OGeP1g/+8bX6qVsZdbE4e4WLtH82jtJO2oWiXLMps0+KMxGxO3WCXiBs8E6q2ohrq5D2GHl8k9gySP@lists.infradead.org
X-Received: by 2002:a05:6820:178d:b0:663:389:6acc with SMTP id 006d021491bc7-6630f3850e2mr356031eaf.44.1769716955285;
        Thu, 29 Jan 2026 12:02:35 -0800 (PST)
X-Received: by 2002:a05:6820:178d:b0:663:389:6acc with SMTP id 006d021491bc7-6630f3850e2mr356010eaf.44.1769716954859;
        Thu, 29 Jan 2026 12:02:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm3657258eaf.4.2026.01.29.12.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 12:02:34 -0800 (PST)
Message-ID: <b9732251-936b-4935-a586-25993881ce4e@broadcom.com>
Date: Thu, 29 Jan 2026 12:02:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio: brcmstb: allow parent_irq to wake
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
 <20260127214656.447333-4-florian.fainelli@broadcom.com>
 <CAHp75Vc1om1XDT0os+md1D-mwYxrVZJGfbpepkdPJrHOmFPBvA@mail.gmail.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <CAHp75Vc1om1XDT0os+md1D-mwYxrVZJGfbpepkdPJrHOmFPBvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_120238_748255_2602B1DB 
X-CRM114-Status: GOOD (  24.90  )
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

On 1/29/26 06:23, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 11:47 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> 
>> The classic parent_wake_irq can only occur after the system has
>> been placed into a hardware managed power management state. This
>> prevents its use for waking from software managed suspend states
>> like s2idle.
>>
>> By allowing the parent_irq to be enabled for wake enabled GPIO
>> during suspend, these GPIO can now be used to wake from these
>> states. The 'suspended' boolean is introduced to support wake
>> event accounting.
> 
> ...
> 
>>          if (of_property_read_bool(np, "wakeup-source")) {
>> +               /*
>> +                * Set wakeup capability so we can process boot-time
>> +                * "wakeups" (e.g., from S5 cold boot)
> 
> While at it, add a period at the end.
> 
>> +                */
>> +               device_set_wakeup_capable(dev, true);
>> +               device_wakeup_enable(dev);
> 
>>          }
> 
> ...
> 
>> +       /* disable interrupts */
> 
> Still the comment is useless.
> 
>> +       if (priv->parent_irq > 0)
>> +               disable_irq(priv->parent_irq);
> 
> And looking more at this, I don't see why we even need the check. Does
> the code WARNs or so when there is no parent_irq available?
> 
> *Yes, I saw this is the original code, perhaps can be addressed in a follow up.
> 
> ...
> 
>> +       /* disable interrupts while we save the masks */
> 
>> +       if (priv->parent_irq > 0)
> 
> Ditto.
> 
>> +               disable_irq(priv->parent_irq);
> 
> ...
> 
>> +       /* disable interrupts while we restore the masks */
>> +       if (priv->parent_wake_irq)
> 
> Ditto.
> 
>> +               disable_irq(priv->parent_irq);
> 
> ...
> 
>> +       /* re-enable interrupts */
>> +       if (priv->parent_irq > 0)
> 
> Same here.
> 
>>                  enable_irq(priv->parent_irq);
> 
> ...
> 
> All we are diving into is the 2 questions:
> - is 0 on the particular platform an IRQ number and there is no sparse
> tree enabled?
> - is maple tree implementation clever enough to not crash (or have
> side effects) when we ask for a non-existing index?
> 
> Anyway, this can be done later on.

OK, I will remove the superfluous comments, add punctuation where 
necessary and respin (removing patch #1 since it was applied already).

Thank you!
-- 
Florian

