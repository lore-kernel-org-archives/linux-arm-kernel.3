Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F51FC9EFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDQMkVUFxT5s/n+9ZbWq4xqHcwWRUDj7wNkJNtnMF90=; b=2sNc5hF8mRo7wNZr9cl7JSmauW
	NxyBYbtJU+AUEAQBHz1LDtnp4vkMQ4LmBzfiNU+9dDamMaAwSvqnYiEf1DCrX1/Ot6zh+nn8XYkVY
	W/VrpZ7Fcf2NiIX2MkxZDLlb73QaUlHkjRzYmWnHS2sLd4vlg5VPmAGOhePng7sq0aLxF50KerP6I
	q//njvQVvi0S8WVkkImQ5vEEVUPMI/w67Ij+J5fccKIJjAqqMw/15L69F8US18xHFJw0LewZ6yIAN
	QCa2wm2YQZGxDB+PpDkRXKaAR14retGkZPOH5s2FxnzoGleq02VDVWCLvLjKwRSeJd9/ILk3P+hiL
	Wo2W/tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysgZ-00000005GNm-2oP0;
	Sat, 07 Mar 2026 14:31:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysgV-00000005GMn-1NPY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 14:31:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso5071435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772893873; x=1773498673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDQMkVUFxT5s/n+9ZbWq4xqHcwWRUDj7wNkJNtnMF90=;
        b=LdNX1FiOtS9/9Ozhyv+5TGeYsPoNMjFeNLtU9izfPvA6CaDePuThYVRIuxbroOLx25
         iUe4cSmvfwAN+EazHvlhxPyG9aWXQBhFNA5V8Xod+gxwmNPZhiDDkdiKLXiaUN5qHZ6p
         xmHFSB20IrufTtoGlC5QQgtRrNs6LVoZJFc+el5Odlnnx6vnOsGgThhKjNIJCrFK9eCP
         Jap3uTam5IyLeKUFGMSGrsdcHFOMzY+W5UzpzCZOcDVBZAtel0huINaDBEWEtjEEt2kb
         Pbtv/iMQ2l97TZzr9+Kk6AqVcwzPWe70a8azDtD0hXqVYt84GAbNj6vEZeHbS3zBMsvA
         bC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893873; x=1773498673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDQMkVUFxT5s/n+9ZbWq4xqHcwWRUDj7wNkJNtnMF90=;
        b=XuhpbWKJZbwJCiJcG3Q/H7TRQBW/97zN0WWfx8YE17l6sDMH/o5+VCb1eOz/kxFE4u
         T5DvhYFTXrfne5V22ofqqn9yHjoUqewcZ0vCrZxZRI5fB0L8c/aCIczTSisl8IqV2aZB
         avdnimrOVP1QnuE8cMd0Txwm6spq87E1xIxEwJt2bqLfZ2MgIfS0wRm2p1nkhAZzb/e1
         ohPhRqipUjq17BXW3cmmFr/hWQJ1n8wMBlaNqYHd+6kPH3ehZgbRhQSnnQTcfEibDerX
         DWErwvLUS93pJ4XwqZwNa/bDMOhQme8SsoS97ZWrw8Q2TtCUEfVbEQYtk6m6imt+jj2q
         lxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfo/HDUlbjsZDw7CvzWflXCYpGke/4dtmV1XYyQx0NlBWHyI2r2/R/s0g46b3ETqpghNNUoCkmZRDNSj7j8Vbb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7+QNetgXnulrb34DFa9oqF2GWfmugRWeTPOrY77zE7g6PKfKr
	1b25v6qjHe8EKZXdcOmYcUi1I1hnWtSMxjZSQ7ZbWFa4TPtbwvNCuN/aQn3Lo+2pm/o=
X-Gm-Gg: ATEYQzzYH4b4OpIYvxhJ0BmdBAnYkRbd/XoBAIuGI+djzDRcpPdOgfByEXcdVXBkvUK
	75VUIW4yrlVDorvErE3ZE/p1Sw7HbYeC1q25yXG7tJoWC+2Eqc4ebxZo7O3MCh01KaThdlcNfyu
	MxFc0hPxr6VMo3CtRzEMM7rj0e71mvNDXjb7/QXMWjsXuHEePlczf5zHAAfh3F6T0Qoe3Phz438
	incyl8ASCfg4kZKihX57Y8GhKuUdJ+Xmq7IvuPtCkr+xSNuJwFAyOZFh3NIgOXj0p6JKAuPvCXJ
	LTfD/klmyi3Pwozi0pN7oJ2fq+o2LsJwk91btQg5vlP3geOU5ynbGbq122dxvK6ho0PByhyfxwU
	v1OVDB81t1Wndtuy5CrQj1dcGOTcP6l+6h4ohdEkhk0l91uU+fzfny+2kkPNCkwVzKwU/TTEAnH
	CQVjp4o7hNx/7rv8ejpYWv+KZ1vIXn9Q==
X-Received: by 2002:a05:600c:348c:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-4852695941dmr96370335e9.17.1772893873187;
        Sat, 07 Mar 2026 06:31:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237dcf04sm65165115e9.1.2026.03.07.06.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:31:12 -0800 (PST)
Message-ID: <071925cd-a7dd-45dc-b7c3-4a4723edc6ff@tuxon.dev>
Date: Sat, 7 Mar 2026 16:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to
 DT schema
To: Akhila YS <akhilayalmati@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-4-7e2ae1c5b5d6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227-arm-microchip-v4-4-7e2ae1c5b5d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_063117_412124_DE47ED2D 
X-CRM114-Status: UNSURE (   8.21  )
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



On 2/27/26 17:14, Akhila YS wrote:
> Convert System Timer binding to YAML format.
> Changes during conversion:
> - Add "#address-cells" and "#size-cells" to the properties and required as
>    watchdog is defined as a child node to the timer parent node.
> - Define watchdog as a pattern property along with unit address in
>    examples.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


