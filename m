Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C378C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=; b=AcNbI8XMkUlrM+OQox6MVGrQwA
	Ge1Gpf4sy0oyfgAhN0YrM/DxUgGimgHu0hH+ZyZIGkG5T11UIjXyFsrGQJjaLk90bpnmtvCyXjhPm
	lpdFz0iOA/yZGRiAMXC9Q2DkuyejVjcKKpo047r0LpXgrtdEfqVHV47ys6t5fA5AhTdXbem6jOqCD
	svf/G7jMHOb+7ZrbtHfx+LK6iPyxZYT9TMoCK6mFlVgBpueQGyCH/LRde0f77mB5rsQWUOElPVOkp
	0fTBkc4ay74Ul92hgVDXa3bR3w3ZxGXpXwS5OTnzX0Xy2aEToLxbTDRsUR20/hVHhiQ9yYLz/kU7U
	kptUNMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zRy-0000000AHic-1xPD;
	Wed, 16 Sep 2026 23:54:02 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zRu-0000000AHhD-0IhM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:54:01 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91064d2d54fso2390486d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602837; cv=none;
        d=google.com; s=arc-20260327;
        b=SpbR05wuQ9HNB9Xs8tjrSbF5aJVeGfd4nrAwLDH+1fxTDRdxLJjCHNNMLGnq0KMjlI
         fUxlC7Lbzo2u5NDK/BV+OXgBvXOqJD1pKwdTB3FLpVGautZu7c+sV0hYYy8vNFHSlonR
         42BWvEwjjG57GX/Ts6K7vPPGiUmLcjHkavFcEa9Tg0CYPEbCIKeCkTiTgJOv9MHPiSx7
         /hGRx+sZq9S/urGZAnC+e1bEx/Oiv4cNaTK832QjgeEYNtCh/okL/b9vJIZAfLz+Ci3Z
         OW2bIpNlgF84RfdZeLAkRgROs0hKt36jxem239a7opi79YUTlj8VGIFKsrIOwe2ZF/ol
         I/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        fh=SYKHqInnvZZaCWl4vU1+wyiQZfFsC5LGUkKo2udYnQA=;
        b=qJcQlzemMjMbGggSMJnTNC/Iz9yKXwLNmSLTNn/XK7X/PfSSOWle8mmQwkovPj9T91
         jQNyQ8F+aNObKFqdU3B2HFlQaWZFoWw7nCZA8g7ScRzUU9MRRAqgJFNRdfzWFh0VIhdn
         jyqYR5Td6PmIhmQ4gRekjKQsg3CrpfhXxlLAqD1CEGtnjqJeFESyIeNgwG8J1E2ueY+U
         vV165LOBjMNcP0rmLrJn07iYlIy98+ZMsJ83hm6D7X5IxITB6uusVH7V09atP6NySqIB
         cotFdiLey9ldegwsOTJCgrW13cfZElhTsXSRpM2PP+EaSXI/9qcnbGQUwUNRCQA3FrQX
         2mqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602837; x=1790207637; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=VldO2C0ha7T7xKtkXiiP/ttW0bBOlq5Ou4dmL+Q90TnSLi2rxiw/BEm6dRrneoPC3Q
         m1tfi+1gi0VrvKFAYMom4hM6Qy8AucYb+F5pLdv7yrYbKeGBsNUpotuiWoOurxfqXJW8
         1wlUQg3cSHjwm4JnRJvocbzSq86GjUoe3x6cVTHEyODILI3k/XIfdTPmSs/jO36ukYny
         tU3qJ1lx0oEoAieL3dwN9fEcfRk+jU0xeCPvFVjALRBbJGpbED7g+uZwBTbtbeTXXQD+
         G0HsayeduacNtaKYjtcLEzHCTbFtE1NjgU5GX34YcZB6H0nKyYQql49wfkz+WSgw2NYP
         soOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602837; x=1790207637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=YMXVBo3arxGrLg2gkb2IpRMwhm7apbl8EbNrnxxAAB06QrmfxZ8uHb/1JuT/ZjepQP
         Qb0uTJwvR/DZNo6bmfELXbsEl5vPdztrA+DRw/TPdEJiu9FuEJWRc72/kassjV/dSyuZ
         tFVwNHuV0OpSb/VGSk2EUCEmL/yF147O7Qs3W2roJ2fus/5488bEKvA6aTHKvV1ebf8Q
         eAsxDipbvAD7nEJBJEfEdi5gUBwuIHxhDEW1AzxyqbiW/e/5IeUPtN3NeKxqE27UVCN+
         nn5eKr2//iTuDBI0tQqKWopm+QLhMi3EDS9qPtGRCRTx+UghOosBcqcH8izp6kDdjEmF
         4Dxw==
X-Forwarded-Encrypted: i=1; AKwUvByT4ALhrIXczbA8MuOMKc95uAftG22M2chptAqYgXnEY8xe8ZN4R5mex8NB9P2xEbIQoi4qNJiXvxlVadRpZQ+j@lists.infradead.org
X-Gm-Message-State: AFuF++lFTeejNAZi2YuNBsVhiSeRl2jHiZi3epK84nSocevjnFOrj6ok
	pnyxM2/vujJq3NEz/VR/aVvRVI6HLOjRcFt8kQOzejV70M6pzBo4CyhxrNeRZyt72iF8al4ZXwh
	f+RAa37d8QJnxYFLAk1ks5tgHZ0gd4QA=
X-Gm-Gg: AYBFou3jH5rTKLDACbYtuFAN7nuvPirwTzTyQDIeQYqL279uIiJZ4UxWj5bOGx0ga6b
	I5c/1tC8nbnyiXQrWKuO6CSHOpPl7J9aHtsPJqGmX1j6fx2zsIJhGvn+zpqHrVxbfLIh0o4aYhc
	cQf4jsPXlMWjeGUhqKJHzi5q8tQk0VENxkXwQcIuRww6/gaCAhcNHvh2SG4uJ8gbN5nHV8b4/dZ
	tNs62yraxeOFltIY9+NJ2Tefcln4V/rNP+BTCswiyGNFu21zR3UbBGm4DCCYRmW3Y3TL1aWSnjf
	Kowyh59sNvNbkvy9DIIYuaPXKHkO8HvpFgAOZgYX5FNONIVaoZMt8M+3ol2tJ72DRw==
X-Received: by 2002:a05:6214:cce:b0:910:94c6:2ea1 with SMTP id
 6a1803df08f44-9123d7318a0mr91642006d6.12.1789602836616; Wed, 16 Sep 2026
 16:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260901083001.8044-1-ansuelsmth@gmail.com> <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
In-Reply-To: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 17 Sep 2026 01:53:44 +0200
X-Gm-Features: AcwNN1XEi8i0bR0p6V2XML1oNL1EMS0XGZ-YJo8qlzp3ByfRA3buomyIp2Ok6rc
Message-ID: <CA+_ehUw0KK8mHDmaH7UBKxq-By7CvXCaWDUg9NvoMPzSe5cgHw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165358_145036_EF43B2CC 
X-CRM114-Status: GOOD (  13.81  )
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

Il giorno mer 16 set 2026 alle ore 18:20 Maxime Chevallier
<maxime.chevallier@bootlin.com> ha scritto:
>
> Hi Christian,
>
> On 9/1/26 10:29, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
>
> I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
> series doesn't apply cleanly on net-next anymore :(
>

Hi Maxime,

yes the conflict was caused by LRO patch on the airoha ethernet driver.
I just sent v16 with the series rebased.

Also Andrew had something to say for the mvpp2 patch so maybe we
can discuss how to improve that.

