Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F00C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVQO+IqVJBjIpGvloQABHH8Rsr9K0FypYEqAHJLTov4=; b=O4saICSz9KJv5iiEy0fC8dKh/m
	bd2+c8mpvrSyxCxybQM7kzBx+8Zb/aTHDFM69hD086S5gehpd91X4Y5SLatI4hhiczTKTLvHQ+sGT
	zDA8SgqKZxDtC4/DLJGDg0Fj+V4HvPJMrog8aCkdwTHjQqi1ObfZn5GWs2qyofOueKOYq75Jhr5hJ
	jLDwzHVsfP1wfwlgWTvKYpfHBD9EDe4E6MupK+GtbKPPHEd7KzjjzOOIJq7iFpYsEK2/OmxUYVkYV
	8O68FVNaORxymzNqsCT0FfW0R/4NMfmc8E6OWj+Wl3dmxR+4NvdWTCvVCNBdWF3EvHz/NZKDCAr7T
	lkEm6H/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ej-0000000GM1t-1H15;
	Mon, 03 Feb 2025 18:58:49 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Kt-0000000GI5R-1qCm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:38:20 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5fa3714d4bbso2139659eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738607897; x=1739212697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SVQO+IqVJBjIpGvloQABHH8Rsr9K0FypYEqAHJLTov4=;
        b=FF7z9ynZchjjeG+abjxxE78qso27jebS+BsYFfayiFDdqQxY8pnvadiI6zz1tTgWvJ
         Bd+aR1GQkbLGMp8xUVGioYAaL1hLyNRwIUkgNWyZvYPhps6nxMByWmjrPzi1aGV0R84P
         sU4YxCRtQxjMO+kWHuCQUf39IDG+wDADmi0as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607897; x=1739212697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVQO+IqVJBjIpGvloQABHH8Rsr9K0FypYEqAHJLTov4=;
        b=fWXu5FXEL7v3gP6G+1yhz6gRZVh7TA6KlSDyznhJSYpYCXs4CQQ808ZIN3pZZ2K6P0
         r70T6xObssIXQPBK2oCuk4rdFFX2AFWIhtxdKtQQ8IDv4KysXj1+UFk1MeZK2v4FnCNI
         xTK43YodV7fqXYxrfMli/E/Si5QYQjuql9X1pxGPjsRu5GcBWH+xPxZUaWZFfkEYEiD+
         QJ3nA0I6jvX3STT6MlefINPwi+g4DXurUYdnXMhux+JNk4VPdTBUC90lrYYPdmK4hESC
         PFwsEKX/TwAwGozf2xtGWFSylrwiIAuJJzvc6KtIVCmOFwap3cWmw+MlGh8cRJWfgAHt
         KZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqwibqifNqF8AoXDADBGFYNHgsalM3N/TBkycwCEcuZGXLW4zXpwcU8WHoGomzVJs7GNyDxKnu0J6BzTk17dIn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk/MlryYaMkLM25LffUkK98ng47Ig6PPyHwDurF40GYwVgpmq3
	XUQQskPT3c7VZd1v0dtwiZusUoddF1R2XjNMrzTsFvBKw2NpCh3YHKBzFToEIw==
X-Gm-Gg: ASbGncudbq9AdjHEl1XBAB6X2b3IzbnQPgYNUFBL1OCtwn574jRCFM1HC6XZbAUAPXh
	q+QDyegunDEixqw4AzoODdnslwG5tF1FNb92QxXLXzhbYt9UAf0cNSNM33xF0dROOiAOvwDJBp7
	SypNYrTdWnyieva4zaMm3LKpC72eTQ88GxPF2gjuZPTZDvyYyVPNsO6ytCFLp9larAci+gaLmCB
	gH8RsViKAubcinBmlTbJW/bhZB5x8uXm/OYFr+QGjDFIl5BooA2GOvcwpfDBRPLd/OdQarl3+vk
	Hb2VSJ0qn2xKaFUpkvxuMGC5tMG1zQyVphD2dgv2nQmrG5MY0xUkE3s=
X-Google-Smtp-Source: AGHT+IHq0UgRpgomIh9PzY77Gg9Jllh5zVnpCNlPjS94WHuq2Eom48xqYLcjpklGGEZPFXErKSueNA==
X-Received: by 2002:a05:6820:2d43:b0:5f8:89bd:b99b with SMTP id 006d021491bc7-5fc0045ccccmr13214655eaf.8.1738607897456;
        Mon, 03 Feb 2025 10:38:17 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc1059ae47sm2782744eaf.28.2025.02.03.10.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 10:38:16 -0800 (PST)
Message-ID: <682b3f4e-7a32-4baf-a4ac-04ddf9c01a3c@broadcom.com>
Date: Mon, 3 Feb 2025 10:38:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: brcmstb: Fix for missing of_node_put
To: Stanimir Varbanov <svarbanov@suse.de>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 stable@vger.kernel.org
References: <20250122222955.1752778-1-svarbanov@suse.de>
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
In-Reply-To: <20250122222955.1752778-1-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103819_484917_C84C9AD3 
X-CRM114-Status: UNSURE (   6.42  )
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

On 1/22/25 14:29, Stanimir Varbanov wrote:
> A call to of_parse_phandle() is incrementing the refcount, of_node_put
> must be called when done the work on it. Add missing of_node_put() after
> the check for msi_np == np and MSI initialization.
> 
> Cc: stable@vger.kernel.org # v5.10+
> Fixes: 40ca1bf580ef ("PCI: brcmstb: Add MSI support")
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

