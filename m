Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18130C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8nLSUsm88QMj2KXiJKv/xrkbZBm4Zb7nYR0CSmM3jI=; b=LUzQ02wsX7KJfA4nSnd2cSPdmg
	UwzZBjohXuR7Hp0qEUveqOLXCRYmO07QIiTA+TsCZnc8IOOUzvyrySvnwNIGZKUi5URvgVWezlUgH
	Xpldatrj1a6/3uI94MD9NzeNq8Y6QGve4hPZD81nyiMXLcliztXqNAzPQSaO+kxu6nQJ2cZOW5r+6
	qF1B7RR8/rD8Q/+FEdvqp5DFv4GOiGNld01wvCa+FUpHQBlLwUrkxzkxKrCQvUafFTfpc7oNWOazm
	Wog5djzVtdmPR8BQr478Kq4bZNy2bk/FfjTDRBIc4Y9+HT8x6WOXp/5vI9nsbILg+5OVqb6ylmz5C
	Rq7IjtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursBM-00000004Zvj-3D8x;
	Fri, 29 Aug 2025 06:01:52 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urs8e-00000004ZYs-096Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 05:59:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afe7f50b605so33631566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447142; x=1757051942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a8nLSUsm88QMj2KXiJKv/xrkbZBm4Zb7nYR0CSmM3jI=;
        b=X7QjHOjzwuShzwjXXKUUf2gslFCp85chhzdrxQLy2AqLinqVmm6fR3sY+x86jwuLa5
         BluYbJhiHIQuCyv4kRDP/8+8YOg3Xm4f9CanoY72mfFpopGsb5IP+es/21tEunpMtFxy
         M/Zb3UTR5IQIj4iNEvAver04hRYaybosexyOmESoUY2lM8LYfgIfUnmHSt9tybQIHJT1
         zHkwyZV7zsFr7Ho6QjiQC/O+EIICZ3ZzTFZrmFjcDxJm6WvBgfki0J4/R4rTRtBHcS6n
         /gCeN6EOyIvIcPmfG4tExuXBWLUpFtFDwNO8bVY8DuuBAuZ70M0ecAnjWX59z76AcqYi
         y75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447142; x=1757051942;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8nLSUsm88QMj2KXiJKv/xrkbZBm4Zb7nYR0CSmM3jI=;
        b=Tdw8fhjc4GF74Vip9aqwjEviibpAbZmjnSjZ5SsvXhH6TKqNtQyq1cbyxjhDwQ2ay5
         nKbdLAbY8aEejJdIJMIlj3zmN3b9UHDVg9DHRL2JF85F1USQk4XCu1ZydreKc52NkHHa
         0YrfQRTqofp332J7BOQdSb+xvoGvisJ2GTNHBzodLHP3syy4v+r3cDRsD8ADeLlnGLEn
         VO8TtBKVh27CYPx1xMYcwhRPgGUlUJ7N5Bi0POleLkFanEXZ0YoBxRTC3EiLtvnzeKF9
         g6zqv7IoIIfM6FkMZfnTBJm6Neb51kipuFAI0onRoEZjv4MewRxj2ekPdwbAv6WVRQuS
         oepA==
X-Forwarded-Encrypted: i=1; AJvYcCVZZ+XQLT7muf+QcdbNQ8m8z081ZGiMOEFUs8dPyW+7lnvF59QIIv+iNaYGmD+ThpEgQpv46YI+b9E+ymbqznY3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8MsNNnnUafpMjGicECmv8l+wqHtiIss6W9K8Pg3Npua84Q+yp
	unvdeRWNx6+IWSOpHbr8cprPDlv2BuNRlm8VjN77/EBzCQqiuGtZa/ZN1jGcle0MV+s=
X-Gm-Gg: ASbGnctSXjZvcOah4hHSLBrxvea3YIsbYzGJ3MEy0rOHvmeRZMqFzh/Ma1+XGnSR4hL
	Y/p+wPfaLc+HfkvnTQYzTIaRnTUs9CI4Pmj18nVdXtPq9Qa5ICkaoyuo+kQbP1ZPRv5edmORAjk
	pbju44rQON6BFRDzuJpeUoSM5k07rmRv4FyiyeZZZ1+JqUsUGPQVMMKEZOE4ndn6RWn/ZDVDpGg
	AZhpWYFFXxO+8lsFb07/LJouyVNNG3xyZAv20hF7x/5iqdRhKGn4m1A/SHBygyw5k5mk6Mac48x
	VbrQMyOD5xdtLBHWZlbQ3kzZliQjgCPVhaeOsPECWZu+ySu5uSNMKTTmd/j35daGLMygc0Br7Me
	HfqLq+xKAFWOtzVx3iOlDnqpwsQOSvnu5EChOAjYuPCX/ULq5pXNnKA==
X-Google-Smtp-Source: AGHT+IFJoBS+3mvK22Fgj6iGPN4/Io1Wtp2BF5CgdO2geYPYBqSJlkS1FUSI5IVAmVO8bCseZE6bPw==
X-Received: by 2002:a17:907:3c95:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-aff0e28a1demr8112766b.0.1756447142009;
        Thu, 28 Aug 2025 22:59:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff00a5e96esm99362866b.88.2025.08.28.22.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 22:59:01 -0700 (PDT)
Message-ID: <4e51bbdc-744b-4a23-a695-a6c49d82e779@linaro.org>
Date: Fri, 29 Aug 2025 07:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: axiado: Add missing UART aliases
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_225904_090321_D0771327 
X-CRM114-Status: GOOD (  12.52  )
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

On 28/08/2025 20:27, Harshit Shah wrote:
> Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
> uart1, uart2.
> 
> This fixes the probe failures on the remaining UARTs.
> 
> Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
> - Run "b4 trailes -u"
> - Link to v3: https://lore.kernel.org/r/20250824-axiado-ax3000-missing-serial-alias-v3-1-5db4143bf189@axiado.com

Please don't do this. It just generates unnecessary traffic. See my
instructions you receive on your first submissions.... unless you want
to send patches to soc@ (which looks added here) but then this is also
wrong - we do not send patch by patch. Collect *all* the patches for the
next merge window and send them around rc5 (rc6 being the latest).

Best regards,
Krzysztof

