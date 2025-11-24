Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4DDCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq/6lrLjwUQVKmC89a4ZJKQFFN+bx+P+dHA1xIdfkLY=; b=ei8tYiCCwY+U9dcTM+puFsT5FA
	iaEO9ygsVDUZk+x32SAJCxKA54b79ocOfqMbxMZ70Fppc802K6+dtDZdxNVHnpndIdUpeivSof0QZ
	NI/sxquhlUNk/HYjakZd///3ZXvkexwmMOi6I0eZNHCunCVabzmc33HDPJtlX7Zytsa7A/fEQh5/S
	5z9Q9lblAYSlLny1S14OMgiwg0JhpKuA1XedGRBDH1zJQptpW/uuajOyWuHtFVWepsyAStKt7hSRI
	AaXOpvff1kyeVQBqw8bSquUPS02v/OGOdVxbtRw4Z7LKNkVj3dGjCpLGyKljPxrwt6HFg1uX29oQh
	tRcVwiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSsA-0000000BLal-3CaV;
	Mon, 24 Nov 2025 09:28:38 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSs8-0000000BLaQ-3gow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:28:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b73545723ebso760564966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 01:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763976515; x=1764581315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zq/6lrLjwUQVKmC89a4ZJKQFFN+bx+P+dHA1xIdfkLY=;
        b=c1nMhwAff85+MCSo+YSds0+MtJTHi2VQ1iM2nowpO2C3vmrNL1S0akFDLMy24GyQLg
         fboVzH7PLgjLRZmznJjXeAjid/rjFko3ofMPPcaO2x8lDhbyin9ZPip0uy1sauWZ7Ibm
         uSoApc8OVPX52I29zcTUiPXbRLPTsQDM7Vq+IWrqDtIx3WfdztZH5R6RmUYezGpuBVg5
         HvZV5qvYQFn1xbmLwxAFtpGbSQCywmWOqMOnNpCknNJvlkp5d2oroDv83dDaTwFHIgBo
         Y4ZN8z6Q6ZzWHWPIHJgo+n1l/KXLtGozcr6gNfco7toDIEp7kFlNTmtdtqooASnTGOfo
         Sa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976515; x=1764581315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq/6lrLjwUQVKmC89a4ZJKQFFN+bx+P+dHA1xIdfkLY=;
        b=b8BmWCkl9VhUp/2rMy42+ctHFM8TCi4wniYKbC/ueAITjM6R0lKcPcQTMIi1Z1OdG+
         gwhWCopRC5uRhLNycyu1dbUXMWJW8Z2buo8hXQdLvxUeAnFZA0N4A+F2lnRC8VlFpFNJ
         dSQ7s/T72hJa6DwImOuMsPFQXMZJ/C7hBk6fkQ1aRWs0H+rsJptbfG7tVRYravyE4nTr
         4DwWKVCdY4UKY2z6kvkF0s0EwyphaMbcllZGBQiVxw6XkJwsTQaAIRFuYk+2suufp0km
         UnzbqxFg7xQ8jKdxKFfLOIOLpcJENeh6hHxOdzJDfzeJVW1jLfVYY+RlrKu6+32NvtaW
         GinA==
X-Forwarded-Encrypted: i=1; AJvYcCV+NzF1yJkwAGxlWJYP4ovrCqWCHoi3vBheRo8FlTQ5UcmAoXJM2DP+r+gd258JbiGg7T1tAdUv2Vn9zrGBfNl2@lists.infradead.org
X-Gm-Message-State: AOJu0YzeuMz2iAa2KDLJMIr7aQFXsiUE7RXCf5Hd0ImFpo/u26/yibt1
	BhKS0tqnhKyXJ5BxWCqQMxl0jclllKWSHunEZJbNWup9GnL5xK+dAdx+
X-Gm-Gg: ASbGnctQ8Qw8myr1MkBMSoDo7QEhxaXdeTmA6bdyJKxc4QIdnPOFQ+Kq+sl3MZ+8KiM
	w1gpVqobYtQYU6c5tAIuX8wyD5QcoZmsHI3ess77asw5B9mJjEsgPJH21J0yTg3KDu2Ea24kVuX
	jtP5cylV6LO1kHTX4/4FMngQ4cM5M2hk1OgzkTkDBSMCUpdB77eCSjpAQ1nImMNKE1D9SS6Ehbv
	ZZuhabhmsH3k/xPQFjtq4j/26DzZTxn5GKYGg4ESGK14dw5docJRAdvNAqeRDwTi7HXSK4NxRK0
	zP1xJNbdCAP/7MpedCxynkEjFjXEfOIKXOYRRclStOmHPRMSkxGqcMBJ794sXH0qpHKIQTV47od
	b6aposEiCVUY0WPrZFqdKar8FyGjB6RcUZlP/aQeSU5MBJTcjp87B9PKKV2wlvnFJVUfmyRIttg
	1Y80d4fSvyd+D/mU7tWWaxpDxtIRX5uTTDDoBhGfYGreY=
X-Google-Smtp-Source: AGHT+IE64Vdc/C7dTNfZKSE3Kij05EfXqApdigFOyeLPFVhuSXQ5Ul35Nks9lJUeS+6q64Q+0gMqzQ==
X-Received: by 2002:a17:907:968c:b0:b3c:8940:6239 with SMTP id a640c23a62f3a-b7671b12672mr1131781566b.52.1763976514338;
        Mon, 24 Nov 2025 01:28:34 -0800 (PST)
Received: from [10.25.210.163] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4fc4sm1250447466b.43.2025.11.24.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:28:34 -0800 (PST)
Message-ID: <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
Date: Mon, 24 Nov 2025 01:28:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_012836_928876_994C2E85 
X-CRM114-Status: UNSURE (   8.91  )
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


On 11/21/2025 7:38 AM, Frank Li wrote:
> On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Replace the reset map mask with the bit index to make it clear that all
>> reset lines are managed by exactly 1 bit.
> I don't think there are benefit because I met some periphal need a magic
> number to reset.


Please provide more information. What SoC? Which peripherals? What block control?


