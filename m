Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0505C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8eYWsGO5bR6d/A4TPLNpDeU5HcoQR1tHKfNDbSFT88=; b=LGGAPE+R4+W2MMXh21ly8P7XgN
	A9dPJBATLKtyjYdAvf9R8NhBQ+jU53nj7UVR7Wu2J2PfUbW3V42znA2j3GXtv/3rjxPXrSkxBIxHV
	nFTXKbVDdFEnlpts/kekD37LWp4kymgd+NEUswEf5B9DSohJ7DJa7wU+Rsk9CMGmz4+AsrJqHyup6
	qX05XPvwFiuyQNKVX3kCVzK7+VnG8DdrvyNkPchKRzet/x77Hcuf4tr1fDQ8PJXQFqzhd99fO5o0Z
	izwXkD61dKaEMdSpVz2OlRmOZf4DvTsxY+HSsKR8uJimE5sBZG+rFcq4l0HqzYw4YRNsnNlGINzyv
	kpYVhfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhaY-00000002TAr-0hdy;
	Tue, 11 Feb 2025 04:09:34 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhZ8-00000002T1D-3isN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:08:08 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71fbb0d035dso2851687a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 20:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739246886; x=1739851686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t8eYWsGO5bR6d/A4TPLNpDeU5HcoQR1tHKfNDbSFT88=;
        b=GQZM4NQr3LebgHiT2f6Jx6BZZVMcp4w4od+zYd4YCjFZuG14z6pm65AKVm8fr7sTQ1
         CR3ctJo5R/nz1tUMrytERA4DkMcQLipWx/OTlks+PE3Q3vH1aqFrEf/QAdCQeTRn1GwZ
         1bU/qdKVFf7b7xmHOf0mXtOmL7hjdIpQjcwRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739246886; x=1739851686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8eYWsGO5bR6d/A4TPLNpDeU5HcoQR1tHKfNDbSFT88=;
        b=neStqtPlyV7zdH8HQpqyd9KgmSGV8k2+REtGExsz6s4hqRWkC9l7FRK+zr+Nh5I7An
         xSaAIoYgc2vGMdsDm9W0bi4PhW7mQ4vyhaa5NkeJoteZAXfsBkYNrNbsOzYeel/ixNVG
         1ds9Le4pgcAqF2VnL8nicInUmwtYkcIawugvT9Bn9zzT1yErCKAeO81kdurVfwYL0vor
         fvlmgDXK+iyB/+KHbQJsIQyCmd/sEVWZs5BZGhf0Rg2tP63jtjzojIVRMTDI/sw431n4
         WOAH4uleop5i+1hccIej7xgMK0uh3Lo64k4XdltQpp394qiH+SYuiBvhBLTfK5BGv0Nv
         feEA==
X-Forwarded-Encrypted: i=1; AJvYcCXbLmqBzqDSnygOaief+MWxvgsOlVpkKpafKqXKDcE8JSadigvgK8A500kbK6D9KNzKoGam2u3TE+r+iGBUCTt2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy36LDbl7vM1TVpbvrVFrnPExNSG0OqM/LBL/a7iiLkLyUGiJhZ
	EAh9D9xPVbxGJNViDiiawZeqeIBdbcATfjaZxMRqwGgaeHUvkz7SvIaWGi354Q==
X-Gm-Gg: ASbGncuQiqaCSN+JStnR0tiHBLlVPPk+nbCwY0Fn6krr8FRxI+N4DSUd7RnibHXfgLn
	iCadnfQO4kpLb863jqV5fSwbVhiUfvC/4Zqy324sbeNATQbmes6mHFxB9KChQPrAjQt3QIfkmNu
	JhYnIaaONvigXuDngZveCxqDhEGvxIasdly6TDOp+GDK4MGYNmThxzZCE2ahJUwPoVDafatLhwm
	dfJ2cRcNvCJsj576riOkC/QoMM6A3wWJ8pesh8FTALqBhQ9RzmHA5DNoZFgD4/eFN8CmYMl1D+l
	D4g2cpOKPH8LunUY21gpzEpNVdZGZjbvZwpgo+o7ML9uXzHkRdpSiwFnUvl1PdIZtg==
X-Google-Smtp-Source: AGHT+IFapi4wMv31NrAKWbcvGGOIg6pfCWW86OI3QXYEtKOl36IiOEMw2fKlDSL1dacmx7ZY5EhBlg==
X-Received: by 2002:a05:6830:6d11:b0:726:ea48:5993 with SMTP id 46e09a7af769-726ea485bb5mr589459a34.2.1739246885929;
        Mon, 10 Feb 2025 20:08:05 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726e93d873csm380757a34.47.2025.02.10.20.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 20:08:04 -0800 (PST)
Message-ID: <d6f3bedd-11b9-4eaf-a8a2-a6da460fc7b3@broadcom.com>
Date: Mon, 10 Feb 2025 20:08:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Fix potential NULL pointer dereference
To: Chenyuan Yang <chenyuan0y@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
 dave.stevenson@raspberrypi.com, popcornmix@gmail.com, mripard@kernel.org,
 u.kleine-koenig@baylibre.com, nathan@kernel.org, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, zzjas98@gmail.com
References: <20250211000917.1739835-1-chenyuan0y@gmail.com>
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
In-Reply-To: <20250211000917.1739835-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_200806_969382_3B48B4D8 
X-CRM114-Status: UNSURE (   8.94  )
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



On 2/10/2025 4:09 PM, Chenyuan Yang wrote:
> The `init.name` could be NULL. Add missing check in the
> raspberrypi_clk_register().
> This is similar to commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> Besides, bcm2835_register_pll_divider() under the same directory also
> has a very similar check.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


