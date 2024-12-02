Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD39D78306
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jP25TYUqJwcL/fuEV7RObAqteQ/sd95uJofPv025g0s=; b=eUZzqXgPOXEtE7uy8Xxomg/NMB
	CzbuGW1EW+9uIPQGqD2tMLtA7UemCYJwA1XWCyZRCfybaIPbRh9Zg/lwn3Ak2wLBzjVFrj6ezxkhE
	ZjvAoIbhrSrDk+b40u0YuwecBsI8JgEqavWedzgLo43KK4Sv0FTpNHxtrQxH7xT9ZyL6P2XpBhve7
	u9psC/uxhh+sQtGXgJy89nkz9wYvARuNjzf8iZl+2mRpCdkc7eh4+C0ONRBHwSHg4D9px7Q5VWnf7
	V6j2hmPz7Voj/A9IjEUvzQ02ozn49sC2TWcdySUH1gg9Nv/HbJGX2sHUX5WLyDCus4583IInb34C1
	wKooo7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3rX-00000005ktR-3LGO;
	Mon, 02 Dec 2024 10:41:07 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3qY-00000005klK-3AOY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:40:07 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso43068341fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 02:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733136004; x=1733740804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jP25TYUqJwcL/fuEV7RObAqteQ/sd95uJofPv025g0s=;
        b=sYfidnwPLl1Ou0ren6R2XQYKecD9l8fEbYe4NbZBz8eFfpcOSXj5aKNdjZG6wjRXa1
         UiAo6O/k1/qndKYXsQqV3wsgTPavCXbgwJiMey3cNIL9m1IvsEfyNfuRVB2oW6+AxHtt
         gAvZhor6QTXiLA9TPkVDfmtEoEs+jPplGtgOKhdOYHOd2w96hMpvWhJss5sRJ+WQ2wQ0
         D3pQR4umBwS0XLuHJkFQabmf88M5TNhj6fhVUt0QQaLRqGh28lL90w2Kkp99pjtKbPXW
         +eSD6DLgGM9kis+r2XIJvHI2O9JxWqEmBW4/u4ngmd0PEbxIs0bfkkuxb5ntMG/L6fUV
         paQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136004; x=1733740804;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jP25TYUqJwcL/fuEV7RObAqteQ/sd95uJofPv025g0s=;
        b=t6bqr9EhI59sPxqDipuLr2dRcjswj3APzEHUwWbhWtpQolGfC475wxm3I6qx1HIO67
         H+SUzq0QaEeIMd3FA/iCXSiGqcWlcpMuvg2XeHC8Uq/Kv9MpHG3Rt1us9h6M3FEgKxaw
         l9coVeSdB7E60aXznk1K6e+Szkhjzi9P8xWHnoiWtRB0K0P2DfN+6+U/NtlI76wmw92d
         /f/MqK9XsbBNLI7qyUsuscTKzmy8EHtSq/1krKNE3Xlfok5gj2KpF5bsmW8bGU8lflxy
         pRoXzshkjvLOCSR03kLJSyZI96nIyZgGxqTlym+VB5Z9oOyjUdsbKBVVum8YII7R7WKs
         Uvcw==
X-Forwarded-Encrypted: i=1; AJvYcCWljuIoJkIOs3lqNyI3LmDUpVyDsnFnI26YAcNlaPjTv9sc76PUYjj0AMNFKQVInBwwMTYYI1dIBrnGVpEJn4wU@lists.infradead.org
X-Gm-Message-State: AOJu0YyszBzC0tOeRe2Txw6c1X4//G77PfKO4ca4Kbvj+uby7oDe+23G
	+2RJZg1xcRGRul1gTwu8IyFcR8KRXeZN1ePvqBXNHUQjiwKJ+gLXwUPW+6PcQgk=
X-Gm-Gg: ASbGncvYe+89pKm0cm6jSuRzlRLc3lRiIaqg1Yf685AllpJ2dwLPHVN8WTLhql1MqHo
	xFOODBTrePK3grDc05WLBRevqSmkaIVyn+QsLhc+sxg/lyGUaB73NLeitVgFujR63FVS+0bH0GJ
	xJQH/jhZxf10pvy3qnWOR5XIUW1SmqZjEnT02qHSQ9El6mXAFYceAYVwvaRo/VNCkn1ZuWJ8Orz
	YW1VEKBtHQtGoTlWdzaHhYtBVVyr4zxV4tMXnIQT8aaeJemqHLtQo4R2yQb5WfIe+Vf6VS9VgFA
	ilwLVvQHmfavxOSnyGaqRWlHSExL
X-Google-Smtp-Source: AGHT+IG8o/j6bnKJ+zKrlKTnEYo13Y0X3dZZFejDWDKGBLT2LAuwWFwKmgOXvNqPPtyC3J1B7R4CZg==
X-Received: by 2002:a2e:a54b:0:b0:2fb:8777:7359 with SMTP id 38308e7fff4ca-2ffd611bf55mr110031081fa.39.1733136004456;
        Mon, 02 Dec 2024 02:40:04 -0800 (PST)
Received: from [192.168.210.26] (83.11.10.28.ipv4.supernova.orange.pl. [83.11.10.28])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbef7a3sm12397121fa.45.2024.12.02.02.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 02:40:04 -0800 (PST)
Message-ID: <b50376c7-c5d5-41ae-95ea-e2d68c1cc809@linaro.org>
Date: Mon, 2 Dec 2024 11:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: enable rng on all rk356x
To: Dragan Simic <dsimic@manjaro.org>, Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <a> <20241201234613.52322-1-pbrobinson@gmail.com>
 <302bdae2f4defeefe88ea4018a0be11f@manjaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <302bdae2f4defeefe88ea4018a0be11f@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_024006_800612_C000F68E 
X-CRM114-Status: GOOD (  12.40  )
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

W dniu 2.12.2024 o 04:55, Dragan Simic pisze:
 > On 2024-12-02 00:46, Peter Robinson wrote:
 >> The rk356x rng is available on both the rk3566 and rk3568
 >> parts, the IP is all self contained within the SoCs so
 >> it's enabled already by default on rk3568 so let's enable
 >> it in the base rk356x.dtsi so it's enabled consistently
 >> everywhere.
 >
 > Please, go through the mailing list threads [1][2] that have led us
 > to the current state.  To sum it up, it isn't about what's supported
 > in the two RK356x SoC variants, but about the RK3566's HWRNG being
 > disabled because the testing showed that it produces unacceptably
 > low quality of random data, for some yet unknown reason.

So maybe there should be a comment in rockchip/rk3568.dtsi so we would 
not get back to it again.

