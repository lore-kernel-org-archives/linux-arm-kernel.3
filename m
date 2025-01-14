Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D7BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ktZm4+HEeNwL4UyziLyj7Ln/Gvcz2agAPMRL6M/1u0=; b=IrOfDj+TZwjiqK7EZHeuhVdAUM
	0tUllUpX4xSp5nUMclWbs9z8ratX5I/wsTStE+lMAcWcEQHEDmzbGDYSQF/kNgOFfHxxIiwthCoSJ
	VkDfO+psyeHiEtlt1lIcYaTe7sCUa4WmdM8nKjJLUj4aRjmRa4tJLEKP+UerkcRkhylxncJfnTaDn
	elWh2HSxwH//EnEg2W9prBc+dpaWqJyZSlyMWwA97dSQ1TkCZU5kqYONjYzIkA+6STiggblOHm+KF
	qM5P6ahdC5iweQa2AAivzAjQ60DBI4pDg/ysS4rf36wX05qbfbe0JPu16jKfS8S93ZbK60bUYbww5
	ByIIK6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrZB-0000000AEXY-496m;
	Wed, 15 Jan 2025 00:47:30 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqFR-0000000A5fo-0JlK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:23:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso8027608a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 15:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736896980; x=1737501780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ktZm4+HEeNwL4UyziLyj7Ln/Gvcz2agAPMRL6M/1u0=;
        b=NUraQqMRemej1hR+WM6nwxP0mW9mV8H0MsXTtAyLmXVa7Cb3aurW/tG5rD44VnJulk
         +nd2lmH/lJWbLKypjqgAbpx+qrA3ANce6w0N3+MbntpAkpAApkqKGZj4dzKhlQVwlYBt
         +UsnJKw4oZkqXg+JwvsRLb8r0d0q0lCf0szsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736896980; x=1737501780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ktZm4+HEeNwL4UyziLyj7Ln/Gvcz2agAPMRL6M/1u0=;
        b=fy5Xkd3fG18EZsoy9Asov7M58Q9h9dhz18KaXKSZoJlkCg5rEMYEJnXKQAgo8K2Nd9
         9ARbjKBDYz4tQnUrFlXliRZJegTyrV3+PpPwprL2Ne3uxiN4n6m1GmUwuxOhgZB70P9k
         VHIS4BDHkR3+eojnwYoRi6WtXSZDofMez+TjTrs/Dt/URqbZtasHZhkPh70yJ+Y/Rhpq
         nDPl5dH67t6QBSh27mkBqojM+95HfaHtkgj3MQlHnxgwzVhAsX/nsvgbKlhScWgq2LBK
         3D5nEQUb5gnLdPcC+xWtw637AQJGw4Eyas1ujB+fBYaGUPv2fa2TMKZr3u7ROfiw4d6r
         gDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTmoDw7b8uLX6E7DTsJxxoBfQFkNSBkkXz1jfsEmIvDbaMvWqFiHFZbZpO5mk51uPeU+jgKA7TRXJ6mZOF+5cr@lists.infradead.org
X-Gm-Message-State: AOJu0YzMSH/fVLT+ABxhzmZ7xU//djrOoq5I8SMdMzyKfFUo5xxQ01eR
	F2hwnmNT9qM1Ycy+c9WMD41VHH/ApWei6XWjUimeKqhuQQZpkZ2u0UKdavUGnA==
X-Gm-Gg: ASbGncvAgpTVtcmoAR9amey7yXQCk+MO+mZpHDM6f4XVjsNJOPOhRCTr7NIXpr/26l5
	O9Kp/VoNahYZBBW6yjduPamoo+75trooDAd7ziAPo5eaSs/dSUOaTuX65H+v7RN6nonZNhI19Yh
	nXtBbNSEhcVnYNmEYyPYzAvF8l88zQTb0VUdrthC3qMykoxqY/03eO/rO9cGXQe2Q2mvfq41pbs
	pEm/NGO6ItpNS/bYjjDW1Kd8qt/pFbPw+sg/DiCbtrbrdp0rEsC6jwFpvH8IZ/xQlFzlQDlEUeX
	NLocbw6/6W+zXBcsfF+ZHXWjDY7k/v4=
X-Google-Smtp-Source: AGHT+IHYaaIEeCtxTSlEcqkzmsamMknTRKMWkeud5UyaD3eXdIdlXpa1+uQkyOgsb2JQ1mIA+JvKdA==
X-Received: by 2002:a17:90b:53c5:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2f548f33ba3mr40365723a91.10.1736896980453;
        Tue, 14 Jan 2025 15:23:00 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25c655sm72631625ad.231.2025.01.14.15.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 15:22:59 -0800 (PST)
Message-ID: <6653d749-608c-4a84-a9b3-fce2fe056725@broadcom.com>
Date: Tue, 14 Jan 2025 15:22:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_152301_190464_60F8B4AD 
X-CRM114-Status: UNSURE (   9.62  )
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



On 1/14/2025 12:36 PM, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/bcm/pinctrl-nsp-gpio.c     |  3 ++-

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


