Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFB2D277C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MstKQXEBKQFl1f23eAMncxqsqWPHstHgdU9Q+t8Q39Y=; b=syeoVkJy1KwgnIiBk/Gf/nuE3w
	ORMSkZk06QrJLgT2yvWEbRoo54hX0j1FsohYMCIK6GF2hmwWfU+1MyuzsKRY0l6TRe3nIJTO952+v
	iRy4WO2tsZBvvPpn6T0NU9YbibUCL0jxV/DWglLzNN4/N02HqhwBPGECLQpe3QGlqbkalbn00UYH/
	ZR1KhTOYBod9aV2qsxUfEtWMJfIwEjKMICqkz5BmIY8Wo9yz6t56IQuPbOoumT+vqBk72UIDGOJKx
	dtCz035hpk4Zs5QCDhaD1vt873QxcV1wy5DThbjgqOd1AWF5/7IbHjy29jJ0ru2KMnUt/bWXeW//P
	6jFWu9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebLo-00000003X7e-1hFS;
	Sat, 10 Jan 2026 15:58:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebLm-00000003X73-2G3z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 15:58:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso31137505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768060680; x=1768665480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MstKQXEBKQFl1f23eAMncxqsqWPHstHgdU9Q+t8Q39Y=;
        b=ae3tTKn3W4GUjGXmNNwYpxhhZEfSwo8c7dC69ImtYlvidL2Q1FawyIZC/L6KJxWvMx
         nHRuMqghNmJsYQWzTIH6IHQIDq55nSJvWJiDmJXMIvpm2cTsHcJ3uK3tVmnrTpA3Hr6k
         gF+AFTBszuQLoICKgCx/Cl6089Kd4bRP7OK6mpuULheoDR9HvbWy9MlXQzQeNU0Lhx4+
         biA5MjUFmlHxNcbjoi3+JPX64p49u997ifZZ7Ql2yQOBqTQDx91SL4YKHFE3BUR6GR5q
         HMv0ZCS2s9nNK1dDF+FsmEcM+rUixmacbAxZBOJ0+IluJ/YQY2v46xXhgthjLjbxOPgN
         wvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768060680; x=1768665480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MstKQXEBKQFl1f23eAMncxqsqWPHstHgdU9Q+t8Q39Y=;
        b=v8qp3oOC/DeVuHXS/c/qxXhwNvIITUho67GZK+NBW7IOiAGhbqEQi09kwkjE0/4Hqg
         dCvsWAIog/RHOouYDDwWsHvN6yZvf5/xPGpTHQqH68J+PNBNeFMNZO94vbx2MBeRyoBz
         INiSaB0qdfdscFO5lY0LdmMU7KZNXsvISzIKHiLjA4Lbxe9HAPOVNCmbvd4a7oEisDUc
         r1+OyCuCsSao4gNvcvlhwPJJTdim7zWV71tei8vhAS5AN1tiPw9fi34mLoKIMlHiui7H
         lXJ8owB8u8AJU/aD5T3fqMvNaW64IJSREQVsKqD2hsFgexgaklmDcdJqbnjpjuF5MyM6
         nEVw==
X-Forwarded-Encrypted: i=1; AJvYcCW+LiiNun6SFkBwcaB2J+UDEaqUPmTkP0y9JArjgeKfFBEJfcjX8JsS+kOE4Fb44Evw/zxe9K5qL5+S64J3NFfi@lists.infradead.org
X-Gm-Message-State: AOJu0YzEdApMXaGKXT7XNwoTW40qffQqT6Qfp7TiuBhxbavjwm3TejHH
	lrtOK5FnHRe+O3jLwFdjKqeDjQDcl1xU1ciwgLaKaPvSCKna3au5mD+jgHViLYSUqm4=
X-Gm-Gg: AY/fxX7JGZf5dFBCB72o2BGAEmyC7+XkbJ1fROtrBwXP60mxl8je0y8cmrOzCKtW54a
	60cNeRWo3tiHwqRetHajsiNtQEX2BDUI7oMDwszd+/e8neJr0+L6rE+9kBy8gQ6oGtKyVu1Erut
	cLY6NrD+mwDZIDpedXXFONyC9Ah4Pg2xasjxApV+HLhJGdv0NjYR0iuHbwiYBJsb2tLU5AzqHIN
	gRZ4BHFxqlWrNuiUJz8HLw6UK0C+/PWvIDxleo5i8zBNcOt24shXzPftmQ3Tc/LbzGxTd+nz93G
	HQDUAcj2ZzUvySMT0ukumZMbRfvk+oXNG7oeXF7G/DXpVHxV7G2VRskVdXoEOKJ6XKiaRUj4QfD
	uTDkt6ILhJdXUwK3UT+ZezMAfIbqovNMFWUj8RjUOOy76OjQN2YCSmfP/oC6eBnNPMG3NGrb5oi
	1yTwOaSZvxCf57r/VwBw==
X-Google-Smtp-Source: AGHT+IFYcunSwtyzYzP/GgN+bi6QmSaJiBJZBLYMQbalcyroaWLcgspATNjy9vqQEsUZ4z3Uv8byVA==
X-Received: by 2002:a05:600c:4447:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47d84b3b8b9mr141151465e9.32.1768060680374;
        Sat, 10 Jan 2026 07:58:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm273462685e9.7.2026.01.10.07.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:57:59 -0800 (PST)
Message-ID: <45802d15-e094-4033-8810-a19ea5a501be@tuxon.dev>
Date: Sat, 10 Jan 2026 17:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] at91: Remove of_platform_default_populate() calls
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_075802_608558_6DC55082 
X-CRM114-Status: UNSURE (   6.64  )
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



On 1/5/26 23:06, Rob Herring (Arm) wrote:
> Rob Herring (Arm) (3):
>        ARM: at91: Move PM init functions to .init_late hook
>        ARM: at91: remove unnecessary of_platform_default_populate calls

Applied to at91-soc, thanks!

