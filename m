Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EB5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MCaiuVauVevWTK+5X86VRzOwhbUf69GrvAJNEIq6vA=; b=sdo6ponjAVJVcw
	ONTRuZPVlC3LbslQQx5h1fCBYUmhW3HPTWuUI6k8/2Ax+kLW/xqMkAbU8Fq6twvFQbsm/JvYZYgo+
	t/GvyOhsVN9wS0YzPhIH0/fZN2l/O1wmmuNYPIBfgPjsv45ojubPhFNhdToRlotSOn6KhsoLruexZ
	ae8SwheMYiEsl+evq2wqKXDsIrxC80DTpMUJJtD6H4GicYfHX/nkMVnJWHNMkeulx7hzS4F46YqX1
	Zif7fP3Vv4cWgTaVboboBXUs2OdTK4J+FG2nPnYnLKn5Abv8Ex9EBUC8Sbo7V7srCO5q80vgsEuZL
	Kzf1aGsxR3PsOt8aAWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxVN-00000003wWm-0yuF;
	Mon, 17 Feb 2025 09:33:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxE0-00000003tnc-2yZb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:15:37 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so6381374a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783735; x=1740388535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MCaiuVauVevWTK+5X86VRzOwhbUf69GrvAJNEIq6vA=;
        b=V9rPt0mdWVBedw5McpahrKmYfOvE+Dh4owZPcPpdXPTkn61dSEzeRzGx15a+tUOYTH
         fHMK/oktZ1WWs4R5Hszy/h1XU+i8Doo1QjVTGQDxc3R5rHBrGob4qxWrmGKDF7D9YWmY
         dHE060MDU9xtHLrj/q5l32uFUl0hellViljkteVO/F6E5m5pSeX6kX8Q8Z/659DxYHbn
         1oUkvKuI5O0G3jdw7DFTocFhTuemm6rn7AXkbSkw42IGGIkd/0K03Lahzt5J0lC/vik0
         rbdUNWOT3ZkqbpizBv7FxISPK4w0pAx6ZtMYlMYZHCq96tyF1Mbpd1JmqnhNB+kN+WDh
         Y42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783735; x=1740388535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MCaiuVauVevWTK+5X86VRzOwhbUf69GrvAJNEIq6vA=;
        b=r57tZQFnG2d6/ZvmqktZHU6gwLjkpQ3w8RUNpmgZMyydj1EJXnKtYZ8hUo7aaGJnmQ
         FdKlTCxOHSaTMR59xH2y6eLYWSbamRDI3Wz7sJcuAl2IYOknZraIm+21p7Vf2L9khXso
         FerxSBsdIaSnhI8rnynnaDGq5nhWXKTOno3cZLXWqxs+qwwBWtDXQHapyBJG9HR1Kc6u
         +H0mUbqab0hbTHS3rnmk+B90D1z27PUTX5ZSrPelp8DR8Ca0i1ZaN7ciNCFDEaTPiTgB
         UxRfM8lPGvObnyyL5HnUCbMD6W7J0sK7KAp30CGD39ZqnLH7KO0Goj1+9ZCmspX4LIGc
         Kzrw==
X-Forwarded-Encrypted: i=1; AJvYcCUtFzlPnKpHOiyPNYsWjR2DMVQ/weeHD1wGbQaRZIqtWe5G8EhXnueRkf8SVFVVcMc+j5GccrOtYJoGscGcSTW7@lists.infradead.org
X-Gm-Message-State: AOJu0YzexcpXCqzb8OA4uBfnDcpWXmQ/0TzicpcLMzGbZmFe+oIdUnon
	lW0NwV/GVED29AwhTLac9Xvy3a72VnP9BogyWT2asZzUOkZjb44dEzwi7Q2ysDhYiwqjqonL8Um
	4
X-Gm-Gg: ASbGncuQKkMGgiHi2HvEyp2/ZCix9fvTKJA07aSdEnTzJxkiv5Gwma1UiRmW5gnNRd6
	nSfff4SBvF7EhqXmpb/DB7zJOD0xoyCwyqHPpVc2ittWWyKuSznNZabHsVfI+iAnlpKfQuPO7W3
	vKl7TLclioDuz1ikS+fuzxaZXFQTiMlws1rd5lbDE4JATavEuG8TxOSgkc6r0lMY1E4ON3Ms0rb
	u1X5GOCCQ9i4W2DRlJ+ngYnyuuaceu2C7wqS55gtWRoqRCxePIemf4amyOQqSHW1YhFvQb4SzDa
	XVvPlGxqx49cofixRVrv2gw=
X-Google-Smtp-Source: AGHT+IHvViYkmUNyNgG7oVYdZhYshZ+I/2VClApfIC6lRoJZIRAdKzNw4ZUWZ73tXd38AkMNqN4PvA==
X-Received: by 2002:a17:907:7247:b0:ab9:76d7:16f6 with SMTP id a640c23a62f3a-abb70c2f4a5mr873259466b.32.1739783735234;
        Mon, 17 Feb 2025 01:15:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9d1a0049sm147226866b.40.2025.02.17.01.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:15:34 -0800 (PST)
Message-ID: <86d94a57-7614-4973-bc5e-ab7e70eaf541@tuxon.dev>
Date: Mon, 17 Feb 2025 11:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: dts: at91: calao_usb: improve LED description
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011536_749615_A3E58C61 
X-CRM114-Status: UNSURE (   5.44  )
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 31.01.2025 18:26, Wolfram Sang wrote:
> Wolfram Sang (2):
>   ARM: dts: at91: calao_usb: fix wrong polarity for LED
>   ARM: dts: at91: calao_usb: remove heartbeat for User LEDs

Applied to at91-dt, thanks!



