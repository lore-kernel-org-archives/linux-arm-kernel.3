Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B4EC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMK1YqKVaUf0IoyRsQOMCKJ4gS01F7A0JEX5JckEMXs=; b=4dc1f7dl7uOLm+gC0CQ5vKRVXn
	M1T2YtHIuCbPZiwrwTTXdAwJj6iae1St5hg+Mk7qVlgcukSlaZPJDnrjcRgHwYSHCuPb1/GMSSHi4
	2ivJJ7jkTaIS3lcPETFcXQCDuSeLPyj8vVK9Mn9cO2A/4oWvBIqR3ig9uX5ojzMpp+klvcTXoTyHY
	+De0NctVIFFuHnIth9tyWRunNCB1C/KF4oMuSUHbPd4XgyX4UZhoYZ4mVeUBD5mws7Qg6yM50C86w
	l4yR8vrR2bCs+y7nNcmb0EdZHWRaODhnClSImWe5z6g7raN+VbrYxx0loy7UZ6Xi629pzOEpFp40q
	svhnoqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTN5-00000000C4X-3mOt;
	Sun, 18 Jan 2026 14:03:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTN3-00000000C3h-2cOO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 14:03:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so20008085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768744991; x=1769349791; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMK1YqKVaUf0IoyRsQOMCKJ4gS01F7A0JEX5JckEMXs=;
        b=Nd7RsMGXfUxSEKedpjObQKmhze3d3KOEO1TJtx5Y/iVWr8e+tDmVmgByxzhedis8T2
         nL0YOG5kT2dDnC6qzpeNfAf56ukUOmXCuirhdSlIsnzFJsMsMiSliucuIlRhtjBcy0h4
         N2bwVYKCPJQcoDGULuDVBKVCpmZJjaXSVm7uF/fOxbIYlJf5gniRPEpDBfpFithQD/co
         yR7Px06eIL+wcjtl5i4iejnOLiNdb7XrE95tYoPgzMpKvGCQC3aEFEArtKapbrBtodFk
         CcrorHSwx1MUGVGK8sH3coo/NAV0LnmqYhyrYDFfqgHkMKOH+s2Hhe3a1llYE9QMGJNr
         jPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768744991; x=1769349791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMK1YqKVaUf0IoyRsQOMCKJ4gS01F7A0JEX5JckEMXs=;
        b=b9n5Kqqi7DS1DBXIVOyv5WFILZ8GK23WRr9hClYVL5w9Segmoge5xAx8QVzTbi1Csx
         7STHuMZLdeNgE3v4GcHD9lg7JwOORxFRiipU4GkRWcWKQLlAMS16ThIW+7lAvgFkPHxd
         VzuvI1BakAHgwkbop8fSEvMjQH74yniR79OUEvqHpqE4CH2I8i1AcOIEWGXX/Gt0ANmB
         UyPlJBEDL2O5B3p80OGR7C5gsWQ/EwfC0ql9ZuCACyMsVV6lMoMR4dQnQ+yd9SUE9h+X
         h0p2OdiWpBJkoYDcgOkcOT6JdjMKlZA1u6eX1wqud/nbLfmhsRhmJweDHKCwZpx7WPXb
         Bj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlz9nHQX5OH6aI7mA4FQV4/1f88wVDEQoKqwfBNxxD0Zi33Yk8rfJ7gfVrtqeFji9ODfRF7MZBjyiSDoYxtXMe@lists.infradead.org
X-Gm-Message-State: AOJu0YzGo7pXiW0IUih1EALAqRvoaqRVqmcHLc1LP1RyTSpFwmwrJwgt
	V5Julmt0pOiN+oP79T98WpCjbmUUP7XtwUaWqlioyJ+ScnMCVg6Ar+Wdn1ZBN+f+nk0=
X-Gm-Gg: AY/fxX4MiVtOfmXQ8J3B5vgWGnF1SPosI5+ey0vWzukNEHTooMz2Ox3dIiVnpJDHryx
	PLoL2rAPCiXTiWHx56pGm9gXhcjMXPCT10Uq+o+OzQppKL7yxj0DDsNG1P8ARPIQ7obrYlYqfOZ
	oSTQogp69tKeaIkqQ9VIgtnD4fANzUwEDBfv7aWrkumWX8e3oUFrmzp/HMJi5y5syhE5NOLe0e2
	/pRgHFpeQA1mhejzxbkTQ2wD5BZNhdfPUFKzkgjmj3Y/ixx4Qa/ttPhYY/gIm78hvsJpMIf0rpu
	AQPVjtiBJ0JViG8ZJwPRxxZsm4SVTH8uqevUiPaTyxyiz+O1eypLgzcFHuT9niyRZIchemU0NCq
	XHTTFqghorKI8nWLBXdSpMiDhafL1ssuTGdi4JvvhOTSSGLdAqRe6cW38om8sV3a/dVYMnEw+nh
	4wP66b4p6UYvnCGmwwXQ==
X-Received: by 2002:a05:600c:4da3:b0:47d:7004:f488 with SMTP id 5b1f17b1804b1-47f428f5e9amr84049025e9.10.1768744990847;
        Sun, 18 Jan 2026 06:03:10 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm17725892f8f.3.2026.01.18.06.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 06:03:10 -0800 (PST)
Message-ID: <9c34b805-8c6f-4711-9718-6c39a141d451@tuxon.dev>
Date: Sun, 18 Jan 2026 16:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: microchip: add EV23X71A board
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, lee@kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, linusw@kernel.org, olivia@selenic.com,
 richard.genoud@bootlin.com, radu_nicolae.pirea@upb.ro,
 gregkh@linuxfoundation.org, richardcochran@gmail.com,
 horatiu.vultur@microchip.com, Ryan.Wanner@microchip.com,
 tudor.ambarus@linaro.org, kavyasree.kotagiri@microchip.com,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-12-robert.marko@sartura.hr>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260115114021.111324-12-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_060313_930499_B33B4C1C 
X-CRM114-Status: UNSURE (   5.43  )
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



On 1/15/26 13:37, Robert Marko wrote:
> Microchip EV23X71A is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

