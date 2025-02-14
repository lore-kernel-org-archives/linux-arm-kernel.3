Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553CFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+zHukzTxoUAqQh1pniz8wv7WSmBiWd4YYjBi2Wtb9c=; b=kQ6IJ3PgevZU5aiN595gVgOiT+
	UkXe/6vOI4dg2fZh0pIVc1Jkp460MimabBK7P9l8My+0pMOYpUaxl4XqFX1fldRn29epTvludC3t9
	T491S8uu3bsqwbewTK3h65B8xcR6kd5AJxDYlfr/FqHkmA+/W2tQ/TnwRB7SJqddMUgH34VMMIXIy
	0c8lH2jmsLY/I1ywrsps8jTCpbxZ/KZ1XmgvakBHC7QfXjryOjX0sTQS+QTm/vJAllpfb74fsWA75
	JZrlqFglJMSkPm/4HXXQAH4gSgNe9KW+X7lHWwwbB9Tlc1UENqqLgEwsJtHeLBeQ2iHWsfX+0HoFY
	ytTZZxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiozL-0000000DnK0-38fm;
	Fri, 14 Feb 2025 06:15:47 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tioxt-0000000Dn3i-0aqi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:14:19 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so3736446a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739513655; x=1740118455; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+zHukzTxoUAqQh1pniz8wv7WSmBiWd4YYjBi2Wtb9c=;
        b=sR+sOGfwMPusrPWUX9DPV7PEqX82LI1mMlyGig7altJ8coyH8RbSUEdcS98vQYQ2vX
         ipwVPEKhAGM5adLVxUwT5sX4aPuwogycyVN/4Zza9U3AFLhhYQj6J7pn3VFrgJqIqGZG
         cnvSrEuHxyAJG4IjudX0Kai28aLpqGlbXvy6fb5udoHoql4Xwhc8icb1Q3B/fS1auYPv
         ecAAGciOdmBBUXQ243PRm/EQenWyT7Hj+anTaDsa8OvMQ1+dJ331LsGvFt3CQ3CcOGpB
         w92lVCXwz2B1qgrIB5dhaKNAle0XDER3SGYs0YKANAIL4RL7idHaEHTKlA+AmBT0iEAq
         j09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739513655; x=1740118455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+zHukzTxoUAqQh1pniz8wv7WSmBiWd4YYjBi2Wtb9c=;
        b=cLX15+H6yzBo5rX2xOsAHENEaWarHpSMy3VjkvD6hoCQePpputUERR817MtroAixkV
         HxJDC65EuUvp6DSBcXgJVMzgqHi8FVIjFmt4GV8W70adrd6oijByOQqihFzc/Rp9C63u
         W0Drdzo2MfCXf6kTP5zcnF+KKR3p68x4/agm/IFKeCH1hkGN+CxvC6ioof6fx/r5ZD1v
         DukQJgG+9wwbu2sYBw7yDloPJd8LNHQud3aCVmpR69SCw34m8cTgbcBNseze5hO4EgmB
         ltCdNosRIcUPzZSQUkJAhBKKjOlPFztqnzrEUT5M8lIg5S4zStmY2Z0r6CNEcDJPFoyh
         8vsg==
X-Forwarded-Encrypted: i=1; AJvYcCXtOrR/qHUOrQPDKLLfGV13xyZxYqBbCt5NNPhPflfLXYZ6zTQjMIsgEGcoSl81sKN9CaRagS5L+cVtZbhAJYLx@lists.infradead.org
X-Gm-Message-State: AOJu0YzDmvx2h6ZDEli+hnLUk6vQIBT1IaBfKH0KtOyJIKN+H9JdUOnF
	ZIIFAfUbD60sWUehwrxDGrrejWR9WNvz/3DuNvfPeFvRSq3A6p2k3lbAhSCqCog=
X-Gm-Gg: ASbGnctVy6J5k0URz3sIbZfGUL9wkv6RVICyMPvq+8Ge6/JWdgpHj4XHgJzEYOG4pLb
	5OofZisWQYyjzXy1RxmK03OnZUnOAFSpE+55s9bPpWzEcVgvrPii6fqJkTCq0V6Id61zVup5/TP
	frsTMMs5OobNGIE/GYEG1rqUiE6sMqRFkgVEyhYYVmhlH9/ZA5I7WXL6/VBv/lNyDiA1PIjGje3
	pOI6fq2duuwwShRGsnAtxbK/s7AK78PoOp+hf+warQxhziYM6bE8fCba7vjmQtAVlrOO8Qh042i
	LQ3utLP6lbr8QH7SQKhCN/eq
X-Google-Smtp-Source: AGHT+IEmV/spFwDvPJBmBni+qOvQYaJLBVXLCJxYkFEXGyz6aAo+8zl5YqR1HK+HjXkmRorI/a/vqw==
X-Received: by 2002:a17:907:724c:b0:ab7:d10b:e1de with SMTP id a640c23a62f3a-ab7f339c868mr973175866b.13.1739513655453;
        Thu, 13 Feb 2025 22:14:15 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532580c5sm276049766b.56.2025.02.13.22.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:14:14 -0800 (PST)
Message-ID: <f4967c68-d79d-4ba5-ad0c-5526e7e1ccec@linaro.org>
Date: Fri, 14 Feb 2025 06:14:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] spi: s3c64xx: add support for
 samsung,exynos990-spi
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: alim.akhtar@samsung.com, andi.shyti@kernel.org, andre.draszik@linaro.org,
 broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, peter.griffin@linaro.org, robh@kernel.org
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
 <bad7b5b6-c61b-4e93-9415-6476976c8e81@linaro.org>
 <Z65MYSNuDdCFNlv6@droid-r8s>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z65MYSNuDdCFNlv6@droid-r8s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_221417_191355_6FD7D739 
X-CRM114-Status: UNSURE (   7.56  )
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



On 2/13/25 7:47 PM, Denzeel Oliva wrote:
> Yes, Exynos990 has SPI nodes with 256-byte FIFOs, and you can see this in
> the downstream kernel. Here are some relevant references:

thanks for the references!

