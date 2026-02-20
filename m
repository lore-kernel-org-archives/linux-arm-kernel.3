Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636F5C531F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4mPm+ZoP8DxO5yOKQMVe/JsfKSmfmW2/A8ErJD8Mio=; b=WFqpI+weqaJ8QrH9VJjcTdYuEN
	x3AiLPCmQz/540nMM3SInBPE0BZXbNRE6MtzKYn/NyYnzl7SIh13jiOGRFLjGy8vvF5kCwysdOS5u
	hAEoZuGnBJtIyBE/xFJfy8SBs0yhp9qJfH86EWQkRL0fE4WHbdVmRJ+9GNrRwc0+wAzuN3GitNr70
	0amqhQaY4Ep7W0rIIS7OFZPPD70tswvJglDJi2bsUg3FreYNL34QM2919vwmCB4qQlO6ENCPYmN8S
	XQFFRomY6wDjk9SUJYtOpWeOg0HTYvI4Gd5n+/8z81n3d5CAqNYh4m8VE7xX3yO484EFCTh0ESLY7
	03cieWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtE5C-0000000Cgee-2kce;
	Fri, 20 Feb 2026 00:09:22 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtE57-0000000Cgdm-28LS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 00:09:21 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-4043b27ddeaso905266fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 16:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771546156; x=1772150956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4mPm+ZoP8DxO5yOKQMVe/JsfKSmfmW2/A8ErJD8Mio=;
        b=eKjICPHaImCLz2OOiqUrObRrVAG1U/2tMCOkDI3ua1PcpmwdNimYfistcFV7niRkuM
         oeTZcONzJxYZpCOWe7dZZWtVukmqZbxsh5oGp7VbDvI0ze3YXO7kwDokP/NEN6PSapHw
         cKhbeVw3XXVq8FTD9IFPALkRPW3lmQfRTN5PMZEt16Q0G1kTwtzJbvkAwxGOtLuhjWIU
         QLucVg2Nqd2MqZIipXQaxyjCasElQOzEUk1r90k10m87V+JCjNjLKsSp5IekDNjWksfa
         KTuQKJ+i2RmSXh3FO9qetruf4lPs8cXPRolh1uPb7WdvUAFpB/wsEbnBSP4Nu9pF/OBJ
         /+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771546156; x=1772150956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4mPm+ZoP8DxO5yOKQMVe/JsfKSmfmW2/A8ErJD8Mio=;
        b=Yalu82+zzcZ+2zQvx1yHqMCQB3shkBq0cXKQKkYngYYhTeef3qr3HQ2BiW6rJ4XZUd
         UeidWb6a9qv8Ar5TY0YtVzBa22QbwJZymd0eXRIgnw6c7m/XXUF8aS/Tc6oXLNJfwIFN
         wbpLDe9jAHdvrUWfg/eBhID8opGVL5+81RcGIt/O3FTvZfRBtyJfgcdzU/RnCUm/QPcm
         X2s+Tx8WzqBQBWm3ADv2iwzalnK9Cn5une5lzOBR7YnAm7CqwiKZkz/gNN709KFlKom+
         ///dfoEX60f1mEzm510C+XoauYIEYqg7+bjYHnUkZmxruIBjoO84YpqS/U7emsQx1Rl+
         eb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6Y0LCMfyv87KcpmpqxQd0IED+epIsDIslLVKmP34D0DQtnNCpq0fDYt35V4R5HfCwb7CTkwe1vNOaQQypaaWy@lists.infradead.org
X-Gm-Message-State: AOJu0Yze5Nou2K2Cx1rLR7NTa3UqRmsIxdF01DudWo+R4V/ikeA601p1
	NEg/yUWpTW60LTg2mARi72l5+/01YhEHOagM2M4wo8PYEEjRokq6mp2utv+GQ9JQ2f8=
X-Gm-Gg: AZuq6aLDy7pHGD0BNOlb4Fm7ZVyZraEXg8aSVdmnSisMFOpWNldCorZTHpSTf5YTndy
	yzjBQKo/aiVh7tI+zq32/pcOncgtMggv0hW+NhRvj8aPcEtfm4fBKfBwDhWOpk75YABCfSa54Gx
	LqOLG/hAPLyvfF1Yru4sv+hjf3NUxzp9mm2uRbIeq/1PZKpRVwTG16qlZDT9gbGkExHiAfoUvp/
	qcxTZum9mVVQqi9arDnK+1LnemSryDsv+M4aYP/x344N4Mg1ySShrSp2OS/Rvln2EeiYyAP4tuU
	1vJRXWV2ihaLQ5/L5W11nFnYUZxWK+3cgjXN1z1YC8+8atG01SoG5sao9dimhMarL5KBSv0cgDc
	frDJHRxSq+sbY4wixCyqNiupi206aDsUdqI3NF2tFEUbDBTDtraXLSwf+0bArISuH0PIZqrQ2qc
	djqqSfOcaMq+cHdh+9vQi92x8XSeYlAEc4xayrRkCOXxcLXr9PGKYSNiVlvQNsCTPRYWULJITzR
	MVwU5ke
X-Received: by 2002:a05:6871:eb01:b0:409:7c0b:6aff with SMTP id 586e51a60fabf-4152917bfc6mr3628005fac.43.1771546156112;
        Thu, 19 Feb 2026 16:09:16 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaeeab492sm25902271fac.5.2026.02.19.16.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 16:09:15 -0800 (PST)
Message-ID: <23778b52-9aa2-49fc-946b-e858b99fc3c9@baylibre.com>
Date: Thu, 19 Feb 2026 18:09:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_160917_872019_9DC4085B 
X-CRM114-Status: GOOD (  19.46  )
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

On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
> Add support for MediaTek MT8189 SoC and its variants, and a device-tree
> for the basic hardware enablement of the Genio 720-EVK board, based on
> MT8391 SoC.
> 
> MT8391 SoC is a variant of MT8189 SoC with a difference for the Arm
> Cortex-A78 CPU core maximum frequency (2.6 Ghz for MT8391, 3 Ghz for
> MT8189). MT8391 hardware register maps are identical to MT8189.
> 
> The Genio 720-EVK board has following features:
>   - MT8391 SoC
>   - MT6365 PMIC

Is MT6365 PMIC ...

> diff --git a/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..744641916952111a4b389cf6adbd27c429b6eff2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8391-genio-common.dtsi
> @@ -0,0 +1,555 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include "mt6359.dtsi"

... really 100% identical to MT6359 PMIC?

Asking because I'm working on this in U-Boot and would be helpful
to know that this is correct. Would probably be a good idea to mention
it in the commit message too to show this is intentional.


And I wonder if it would be a good idea to add a compatible with fallback
just to be sure.

&pmic {
	compatible = "mediatek,mt6365", "mediatek,mt6359";
};


