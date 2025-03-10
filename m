Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0148C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hVV9pYsXZmqC1J6J4fTFIaqWY5CQDoFFEox0FbshQk=; b=tmeza3WnO6bbKfXOnDUSQ/PPdZ
	hd+vvYjXao9BoDHyhW7QANinS+c9sxVqVwdqZIUPcREbWnz0It3DSxQUZmw8iqTaqy1QnTBM8DvD1
	vZYcySGHzt/8w6bUpTEILVuyD3kezVUpxzMPElgEmDRv3lD50BNE7pine8aNAjZzPxfmB33YKVDTj
	crfJF04lgRs+D/E/Uv8d1xvngQsLXASZuorHoSJs/sUTt2BiwVxIb3EyCXHRrS6+WTqU6q0XrA06A
	pkOHO0PlCcYEQydLkviyWzSDkClponOV+4dLbtqDoHyANzX+b3ZRtnpI8FPwX8K3uAZTcJUR0/gyA
	TUTsdsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treOI-00000002ymD-1Xvs;
	Mon, 10 Mar 2025 14:46:02 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trd0c-00000002lMG-1ft8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:17:32 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7275bc6638bso762764a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741612648; x=1742217448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8hVV9pYsXZmqC1J6J4fTFIaqWY5CQDoFFEox0FbshQk=;
        b=BMo+Fnks0LbgLkTll2J/eeV0RbCgQNart4kmQXQlgThijXH6MdQMqScgisrtDh5Bjo
         RPA1GocEy1Hpr5G6juwYvcQ7/ziQEISNH1CYvTvR6aEXYccpos3azg5vIiK+ProsThSI
         2CTu/zR+86GyPpOmZmHA/8oJZfTswA73aE2nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612648; x=1742217448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hVV9pYsXZmqC1J6J4fTFIaqWY5CQDoFFEox0FbshQk=;
        b=QwxZXzDWrGGQ2iuFpD9dq9KQ0MYaiXnP8/al1uvV5TqRhTkLlYdXxqIuovxMvxxctw
         wFTX/oThWfIkfIAzNiHuk6mNuvDpeqg3ix0RtCV8u5YyZjeM1H8I+ifGQRuFl/9M871g
         wPT1iflrBvmTJnJy/2qFCuTwGwnt6fbi8/37YVxTMbJfchQkK9/0bLaj5mVaaJrYySrw
         cswI2HM/i5oPWY3Mo+MY0ECmfxHoo2qeq+xv0cTb5lSeuvatYMyV6Ui/l8A2KEsgWp2G
         LDU4Ut+SyDo/xAl7ubcwZAY1Ugu3PjPHv6U5EDIr8KLZeunqIEVWmZv7oDXMb7IUjKdk
         n4pA==
X-Forwarded-Encrypted: i=1; AJvYcCWBUGAubcPWza6SViaRhEnclqFVT2MBb/nJs91Sa9U1Qwbsu1AljBnJzb88Lq9UFdtRk5FYi+RkHwgzGXSgbeN0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh2d+sXCEc9r5EUCE4kVAJVCIc0VXsWPLTofjoWqvd1mrXPWyP
	xJiLeA7ZUtt9cAL8UXe8W9Ek+L/DjJ+aJc3q/Gd7yb4vU3iykCoL3nCYv+uqlXZ3o7WByUDKThG
	jcQ==
X-Gm-Gg: ASbGncs7MV1WMOyOFrV7b1IA76r1WfP0EklsRqrjoJc5R55WEmizktgYbdAoKEneLBd
	ihqeS36ByxacMZb1bRvzrCm7Gsj01N7hoU1UzTZOyQ2hdoDT385pQaIg9aQESBL9dEy1x/As0lh
	0dLBT4QVwWii5RGxxOzqcj5SOCWB7+QoehbC4HevGl+9T5IgKOahcaJjKf+GZXtcYm+fBmq9xME
	ADevhRTPX/ZBpDaUhfuCmnxewIeklJwQMqSck2bT3ns4u/J2Qlf6YQ1hYonQtJQ4lQqju79CyVs
	Aw7a2qi0RlfzoKT5kNgpYoP3W9z4RKnPRoC0DFmshjSBXPgP9r9Fq29/gE7qaww+Zx6AF2JcfFr
	M/co0B7IGwfeZz5p0zV0=
X-Google-Smtp-Source: AGHT+IHOtYVjKASEmQbKJvWKm4BF6A5oOWYMfkeEhMYVuALyNuSXIsPApVmHGXH1sFnX9s2IVJE9HQ==
X-Received: by 2002:a05:6830:3498:b0:72b:95e5:edab with SMTP id 46e09a7af769-72b95e5f050mr450321a34.1.1741612648382;
        Mon, 10 Mar 2025 06:17:28 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c2d1b00173sm207615fac.19.2025.03.10.06.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:17:26 -0700 (PDT)
Message-ID: <c55f5485-0a32-4745-98a0-d620e4a2c4f1@broadcom.com>
Date: Mon, 10 Mar 2025 06:17:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
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
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061730_481350_63CC8FE6 
X-CRM114-Status: UNSURE (   9.50  )
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



On 3/10/2025 3:48 AM, Dan Carpenter wrote:
> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
> 
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


