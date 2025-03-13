Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C74C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOSmqPxIDrKqjeBpEW6dlza06ScebCb+hLamX5awbSQ=; b=qiZ0BJNlpX163DMgKq2xXcxprw
	JvIWv03Pc/RZnOeNVsqXjiA9NsDOyDvinuoztJg7Aql9TJbvjoipEca26MF2rD/Ns2/vTDT4Kxget
	bQfKdJ7Nnw0YF5ZVewyMcabtR50YORWfBBJmguoQ+ZjsFuysGfZCaGOzzA/Ce7o+rWsVHUFl/w4QQ
	3O1/VaQB1rO/t3yZx5dzcPEpNSSfziICg1O1Fq2xd//n5SLInT/+gDWfzRjNa3n59a3E900XcUNcE
	o9nmoYjOS3Rde9MXk+MnifhS4BTy2p7ENuu7cW4JhrEga4YW4H9Qf4olODDar6hmABgXAsxMSqg9k
	xk8V6Htw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tspWQ-0000000CToT-1L9r;
	Thu, 13 Mar 2025 20:51:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tspUk-0000000CTYj-2a0y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 20:49:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so250324366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741898973; x=1742503773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOSmqPxIDrKqjeBpEW6dlza06ScebCb+hLamX5awbSQ=;
        b=MvRq2Uz7CYqa3CPzmSA+Kio9YjfaFC3lIwf1ibsRn9VbHl0544y6bTP5jz4xaNogTj
         FjbMr8eZdL/aGikvBYgOLhRRvt6bo+/3k9ToVqvEdD4jx5TZTbAixHxostUlz1aGytSn
         7w6cXByWgw+IaFfOOqnyrGsPf4k8X0r2GhxCn8EnGtc3zvLPcbQ0tHWjVlwXjQSrLcQn
         n4rmWmkDardIc0hT+T8PsSKul/7Epb3pVaP+BmYmPfhCOG6rkQnKlWyStoQKwuhB5MlD
         3/vrI5H8oRzfrcE2IffPGt4WlAebPgSXjV2Qx3yoIGP4JkDVVV8cRslwk9c6q1lax2gV
         0Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741898973; x=1742503773;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOSmqPxIDrKqjeBpEW6dlza06ScebCb+hLamX5awbSQ=;
        b=EH8X574zyCrK1I6om06cIxedYrWOksdHFuLe85hd+DXW3H2NxKykbVGpbcse+m2WMU
         1iZJYSpFsys2iJz8uX40MqMRhOEqSmgCBi5sOHIZtUOtTdq7XbXrzNsO1Fh4DSpkFKJn
         GRJPd/pISCOtSNDJfQisKxclITWSvX4K14etNix+VKMB/fbtXhdvqphRVKh+2tQVS+Ek
         NvC9bO/8Tcq7Pg0r0LN1huKWJy7Tto1HSpfnCxHsfrjar3vHZ/SMusgiwIdt/RKKlWLC
         5NugCunjHuLoAARZcTBGrQ9olnEnYWcgUD1FZDXnS7fU6+gVRedK7eNFza/N0cMuR9da
         d2zA==
X-Forwarded-Encrypted: i=1; AJvYcCWZHFQ65qngpRnBxjB0yhOZpt6vI8XPJaeUwQLI2Toen1iwngx9Hl/XWXIiG6ZDPexLusGJzMjunUn65+mOhbuw@lists.infradead.org
X-Gm-Message-State: AOJu0YzrljV4BWthgYwtGyjGpzZZQLTKvmOqShfTelmMAfq6azUHoE7K
	U1MSI9XD6YRUvcoeu7t4JddZhtmdAQi/UmAwKp71P97CfDUvopfW
X-Gm-Gg: ASbGncvH8GV8uM03r1jwzaEIFWCcTDVT9FNJ6CWb2H0QW4XUH+BkRj2qwF8H9h6NDoG
	L+W0cPgJRFZVX9FrcptYyCwn3fXvoPMW23nRvLIyCRkF51lBIzirWxLT+EKf/IYMS8VL32s61d2
	63wnuIMBJJO8zhtXU6rZ05Whv8xZbjxN/AqVoGwDywhW64kjM0VrFseEwdenpSf5mFtrpsIA8pM
	fHwqM5g6pxmlDYY77W5O0257R3HC1w1GpjL1RabTTeevKRtHE4gG5rlgiZAIZA/Ig0QGkGqF8Ai
	Ot5HVAtzT5xF0gT56OOQWxbVUy5yIa5K4J0crFgGz1OUM+CZH+0gW+Du5jRbbuYdA98sFYfnUux
	ZaY7FPetoI2WfJmXWYhfJRQ==
X-Google-Smtp-Source: AGHT+IFmBSCQydVfCelVM6XzdMkt8DVaqTYnfbXEg6vlGdFQDGaNADtO3TQmZb6W9wNLpy48kbZXHA==
X-Received: by 2002:a17:907:6d06:b0:ac1:e31e:de0a with SMTP id a640c23a62f3a-ac329290a1fmr100133266b.12.1741898972904;
        Thu, 13 Mar 2025 13:49:32 -0700 (PDT)
Received: from [192.168.50.244] (83.11.221.132.ipv4.supernova.orange.pl. [83.11.221.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9bc6sm122154066b.49.2025.03.13.13.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 13:49:31 -0700 (PDT)
Message-ID: <3a235d3c-0d23-4b19-a286-637e710b534e@gmail.com>
Date: Thu, 13 Mar 2025 21:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] mfd: bcm590xx: Add support for BCM59054
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250313132136.GC3616286@google.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250313132136.GC3616286@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_134934_660820_FCF9BDD6 
X-CRM114-Status: UNSURE (   8.85  )
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

On 13.03.2025 14:21, Lee Jones wrote:
> 
> Besides my one comment, the MFD side looks okay.
> 
> So you still need ACKs from Mark and to rework Rob's suggestion.
> 

As far as I can tell, Rob retracted his suggestion and left his
Reviewed-By tag[1].

[1] https://lore.kernel.org/lkml/CAL_Jsq+Qsu-6Z72uXYKwc62idq2K169S1t0nUrrgNOyezgfYsA@mail.gmail.com/

Best regards
Artur

