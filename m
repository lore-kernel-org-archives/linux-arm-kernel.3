Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB1C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk44P/tMwWb5jvG2T/9WPa4Knpsi/zzzC0HCj7+/6MI=; b=QAvYUbbkVBRcYQBA+MmsaZEtZF
	/KntVG6vDUmbdbok5Dcp9gRLk/qN40r+FgO3jzbQazhotR9cFdaat2FjELe26ci/0AHQ0K6TEbLhW
	E4BL3ZNknd1x+h2mv+RWEQw8wWmS1au8IRZpCbadpkxhFrhI1+lgqtqu+y5p9f2HGki0h7FCZGTB3
	tJbT5qzCB5uybdPaZJ7SBKh+c9pP3dc9lhfYIX+KTqrr2s3VzO7fQQ0nd09bCFG3KKtH7xYhiJc3R
	5Oq3ebZNjgQUnqGKAz7qKdyAAFqMaLE7Tty2tbTgGoORaoX63HsYtfq/3sDTpUG5pqG41rUNTCJb6
	K3AhB28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxRx-0000000GEEl-0ln5;
	Sat, 05 Jul 2025 07:36:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxLb-0000000GDX3-1q8K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:30:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so260374666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 00:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700606; x=1752305406; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xk44P/tMwWb5jvG2T/9WPa4Knpsi/zzzC0HCj7+/6MI=;
        b=gYM87s5v0gjXC1Hj0/4wSkImjbZRh7ywzzG1g9oN46U1A83pyPVVK4vQhm8nJRvUO6
         djalAvTkCCMAZQztqMRMmiZk3E76OjY0Wxx5T1+DPJtvBn34reERmeJsgwM0/nh+7iX7
         Fy/nbUm9ZHtT5++Ol2aIGzqQbYFGXunOOuCKQMSI7vdbdcwuevIeNKWfw9SCzuLYAdyJ
         jo8xwFc6lkFrMtVNJprKIxFp9ghggTudg2WA2n4jQfC8bbljg5VOMR+HbTGn/46ZyOzO
         RkfNxJcE+GKvAcAfBGQEPzVsRsfScR6FGgx/yTGHMYQYobBy8avas4aXHxD37LyFUQGV
         6IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700606; x=1752305406;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk44P/tMwWb5jvG2T/9WPa4Knpsi/zzzC0HCj7+/6MI=;
        b=W2Yls2wV1xqJZF7HFAfHsTB3qoTnT9IaFxcN0VXJK7DCad05tAdyxfLUyu1YNeAGSM
         fa22xhkVjx8pfErPmpb1Ydlk+gfRa7T9qnMuH4xh8p73XZgRL777/y8vFjwoUQ4H6phQ
         qyM08ve8as+zewYjjU5jW4tu7LRWhif/cp+17XfwzBrXVOalLq7bZiY/OHZXvc1Soi5w
         ESjEkzbkKg32ciufqRMS1w4wVypJmH2N6lzDgT5MittgiX262uf0Z9+Vy5aovYJyAJvM
         mBNuzqY1PUN9nIdRXkVl8C0wKLo7jlQXXCE9XdUezhTTuEKQzsgMXJaH5Dh/JnC7AuOi
         tTiw==
X-Gm-Message-State: AOJu0YxmntBTZTOMraw8LsIYNpU3C3WmvPFxluQ6viaEkVGfz7sgMii0
	okJlBjW0kqj/Qd9fUT8ZrTnv3XeHHti6x+Fm4gJJAYhNb22PWpMjw9/b3Y6ITL5HiVI=
X-Gm-Gg: ASbGncvhNa7CZxDY79lUcESIfHKRS29ykN4SJjY6amu/09HOBG+tdCBjBN4yLsIVa4p
	IR/NtNlzZaG78j9D4NKDyfbZNWz7OeiKjT3DG9yw/BCyupKx2Dzsxe+MytlhxeyOvnrrjIsPUBO
	TfZP6xW57fed/vIlvxW0rIbMlmhF18JGLP2ptagrplCYUpY5sW1sRX+ippLzGD0WtuT5qIE1zMI
	KnywxpO37hwdN7hUz/pqk2hUZO/PU7yJVAd9ak1rA6q/id0fAfDonWnCikiuzYq2rY2kqmu2yuo
	LE85kRR+Y5z15+3mRNJ8KjsfkT7lLEbiIxR+3jwBMa4fJyE30nJT1Xm7KYa79dukCTVB7A==
X-Google-Smtp-Source: AGHT+IFuCK5oabUlFZOlpvhu8s1YtyWEfrIHxmGvq90ix7OjS8+i1mXBbg8hRAIoydzV3g5HcH+3yg==
X-Received: by 2002:a17:907:7fa2:b0:ae3:74be:49ab with SMTP id a640c23a62f3a-ae3fbc32cafmr564687566b.10.1751700605632;
        Sat, 05 Jul 2025 00:30:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e6f30sm304287766b.33.2025.07.05.00.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:30:04 -0700 (PDT)
Message-ID: <a297088c-1242-4ce3-a449-0be0413864a5@tuxon.dev>
Date: Sat, 5 Jul 2025 10:30:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sam9x7: Add LVDS controller
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625-b4-sam9x7-dts-v1-1-92aaee14ed16@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250625-b4-sam9x7-dts-v1-1-92aaee14ed16@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003007_549059_3A7DCE67 
X-CRM114-Status: UNSURE (   6.50  )
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



On 25.06.2025 12:08, Dharma Balasubiramani wrote:
> Add support for LVDS controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Applied to at91-dt, thanks!

