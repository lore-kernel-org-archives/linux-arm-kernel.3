Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F624CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ls62rn3dMHOmB2VTWdVw4sYol0IkmBDufKybVQiodmA=; b=mAK2NUnxWO6QiSNbzwuxKQ/Cwo
	AtXzjEPmeoBNAT/usYX+PfvIDS5DQUm0Pg4cdumz/ql09TAtGRnjY+DJgmJGw0biaUbbmRkokh45Y
	vPTaebSvuTqbI9NOBzmAVwxc5RDA6iYHT1lAKgCgTLefhKm8p2aq1lH9oOzFPrKZaFC69mV0J01A7
	Fgy4x2GMudnMpC6WOui+YYHXjuMsTpRnK0boda9dgwCVMoK8sUlnN4+wTyAvAr5fwOJeDHZeeo4QZ
	qOeo4j6olWbQzPxjydHSwD2hbZC36Gr2FV/cHWlVxm79fn6KY4Oz0ZZVX1s8irihVHg1TUmQKGTg+
	xB2VIDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrc-000000046tY-3z8i;
	Sat, 23 Aug 2025 06:36:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTWA-00000002z6Y-0kge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:17:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b4d892175so10017795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755875845; x=1756480645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ls62rn3dMHOmB2VTWdVw4sYol0IkmBDufKybVQiodmA=;
        b=DBtE6G29Qsz5jymtQiA98Jdplf1MH9f+QGflEB1K1hbBsU1oxm2cOiVdYRYQjPVyt2
         ptRu43q631y3/ok1O9VFYNJkuLXhUqTBZeynUq93loIHvZU+idIeTgNhes31HMqIGoNh
         vqPW1tw6NZR1XAR09cepfjqetlbSXPgmzvb3oxyrEWE5T9O1euEH0xBbToPXZhwIwyyP
         v+Lko3MDqhw/g9dj/fIykymMoc5MQP/SD4oEYFZFlHh0d85Oz7/TR4YVIB5V7CMQAqo9
         Z/lWSW5Di+pbJLhytU7jzHt+sSG678nTWFMYzZupRE/EJ3Kh/20CcwT2syz81YVY09gL
         UksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875845; x=1756480645;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls62rn3dMHOmB2VTWdVw4sYol0IkmBDufKybVQiodmA=;
        b=e3ThWQWzPONWKdieFNqlXOp7F1J1QSeR8GCqJbRX51QrzDPe19F6s4ECttJ1Nb+mNo
         91QWzr7t5ZLopxDpQCQctkp6h0oa2xve6Wk2CTPFEZGFCD93YUpvm6TgqXBqYOLVdoKO
         5iO+UYCPKler58M+MByGXQQuFm4/2TxZWPyVbU2j+SHnSrqWV0Vo73Jcc96QV8EuUKE3
         uSPfP8cbCWlqXIunGUviboG4EvNIaPZRAfYa0rPyF0jScNBRGTwHWVRZ49J+1pFBSlQX
         G31nsaoSwvSMBZrk3h/7mFv/YqUosr+r1MmdJlBOpuWHNIySSRYcTfGSAgm2OHu15Qxj
         A2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVO9GKGRVHnxA3NVYttzwz8u7PwwvMlvxbf5gZztPiOUZUtcRJH5EMk+YCeUrWu7by+fgPaijss4xKSDwFkDLF@lists.infradead.org
X-Gm-Message-State: AOJu0YzpLkLJQ710PIzM1Et0Iu58cqHX7U3N3xrCciLlSO+AUP1vjhUU
	J281hinhg89otCJ4Xv/qEI1bRhPKbq9IUSahHqVIVR5o3XAk4xAAtufi+thM9tL3jIs=
X-Gm-Gg: ASbGncuPuJVfmcIbDI4yUw3IYtLe7QTAJJfSRNBHAYvZFPfGfMq0YGnkR0cWX4YbohS
	osuMXcB8XFluoxgRfmFZcFcNRTZMcB7i1gpUS73RgrgorT5gG6bnLQzooa9eUrNBGFDS6g16nJo
	dJ4CTe3FLgwqYJzMd6lQo9DGcW16eKy6JKEYPKg45b0A0jegW0/urmg9llYsAz+YmiTm58odLJp
	jhQoAWECZMtSk0Clv/+vIfyM383U98fIPY7nPtKFh9Ehm3xXdPIKw22KpWSugK8ZcCHDz+qUelb
	XV/qnZm06/N4pgLTYajQtPKVB6GeVc4cXYPS+mbthWrzNgoHVDrgOEU6xtka5nrcVz/r2gvZDCP
	qf5rjFP8R4wJjh4j2lRLwYQKKfsk/1g==
X-Google-Smtp-Source: AGHT+IGNN9Z5/+uibhBqThaCgEQTDyJjDZ11Ocq8PmmFMqWdJekg1NPHuZJvr7YSISbg9lI0H3tDRg==
X-Received: by 2002:a05:600c:4fcd:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-45b517cfe71mr35761285e9.17.1755875844711;
        Fri, 22 Aug 2025 08:17:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e877e3fsm38312615e9.2.2025.08.22.08.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:17:24 -0700 (PDT)
Message-ID: <93f182c7-572d-4cc6-92a3-3be48fbc3848@tuxon.dev>
Date: Fri, 22 Aug 2025 18:17:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] net: cadence: macb: Add support for Raspberry Pi
 RP1 ethernet controller
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-4-svarbanov@suse.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250822093440.53941-4-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_081726_222978_4C484DEB 
X-CRM114-Status: UNSURE (   8.97  )
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



On 22.08.2025 12:34, Stanimir Varbanov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The RP1 chip has the Cadence GEM block, but wants the tx_clock
> to always run at 125MHz, in the same way as sama7g5.
> Add the relevant configuration.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

