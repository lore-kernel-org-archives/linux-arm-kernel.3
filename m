Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8F0CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 20:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvFLFLPPs3+yk89H/w8+G4zuqCvw2dmeY+SAI1xVWLk=; b=xat4ioI0xO/F5+BsN0QhzAK11G
	Q46Kw2l5o3zuAzrWFvyXvKaZqmDt5CWY6DHeoHNwpgk07jXV+K1GZxBMQ2lvcfgbvvYQUpHhpgiy6
	So7qV5+M7T2G5vqsKBlR08+/xBDKgxgxagY1sf/a7kapHAv4dio7JqV5JlBEnyJ+gZaF69UvJEp4N
	tzZ0+ibZJppfz5wuDkol5IEKDMlx3Tle8m6ghTapGFCRub/XBsLx29pHsAh6cjhjkVQv0fU/OD/aG
	Z6KLQHl93IFwE6LtTCJYEJ2uxXlCxQfjDGRqbuQmq3g3D0z3IGlD9Leu9imY997/0GY+5jJg3uuN7
	jajk7kXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpvq-0000000GaiT-2oWR;
	Tue, 28 Oct 2025 20:04:38 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpvn-0000000GahR-1L9L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 20:04:36 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b6d78062424so1364745066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761681873; x=1762286673; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mvFLFLPPs3+yk89H/w8+G4zuqCvw2dmeY+SAI1xVWLk=;
        b=ekm4lXpBEyRDnZcum+nuyLrIllOLG1U2CbCqdflESvHTVWFStUqkSYxLOxq4iOP4wG
         SUqHZj4UgeLTsao56x+9FU8HWR5SE7+Bv0K296wnr5FTPKqEZkCT8BGQPjPyzrBiWPaq
         uSA6Vz8yBwuJM8ezDTYYCQNdQuKv4uUCYommF+1aQnm75lJXNYizoqRvpfl0xEK7TEGW
         Ex9sMZuEMvwkdvuhsTY3QH38LJYMKm10UDpKKv4Xfgr/Kr6uPrcRpchF+2ZMTTjv7RTT
         qpjbtSc18LrBLk4xSI+RqWwVwPIUXHgN+VO23WHgUJYnrP15EIO/8qTRvVcIQy0tEufS
         3xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681873; x=1762286673;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvFLFLPPs3+yk89H/w8+G4zuqCvw2dmeY+SAI1xVWLk=;
        b=p7nJ6wAYmHk2ikJo2UG13sDJQK/eekzfQTnnOdIURi0vfDMjnfBxmAdqYq0AyKjn9f
         70TBUD9/8MUzCs6hKYlWEMNbn5cwE4NjKaa6PJpgBYsbYG14jT6WrV4jWHE4wtdpjB07
         PN0FWIxGkTQtjGZm9wG4YABe12Nxksd0I966R9tlDF6YpJp7sPfYBpHRmdUlvb7/HKP9
         oXcQJ/aqiT45sv1FTzghSOm+GbGPex4/1F2PdtxFAvpr+SvRmudlStxHg0hqIQcD2O9h
         gZ+lCMnnCgSi//65ukPPJVHp9sBBQmR7pS88lpU5NyyRWkfv/kCl0yGyB8lPVL3nnlLX
         sW+A==
X-Forwarded-Encrypted: i=1; AJvYcCWN9AL5vEnXorr9GGG8vxG9LWyqz8TayQu7Zr46Vrj5jhlwHTR2jBnfzZYRleSdbQS4VZmjifIVjYffvP6YpFD7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9WU4Txe932fRCKqO/5Nr8uwHzJTbxiDfY46t+Rr7DYu1h8Sa0
	xd82MsHoEvDczREqWef3MUNg8VMHB3z5/vaC7dCOkKKSfyA9WQWcjO/zTfh0WD+nbBIRsG+Bj4d
	pvAWGyjQagPZ45QQE26/H/1p7jYh0q50=
X-Gm-Gg: ASbGncs/GS/lI6T77OqbRnuScXclNQcHWM6PbD6on2GoU+6+heqi7ctgXfD6pBWXnXZ
	zCRbadaBtx+8AZXkeiiCaHuJA5C1IIReLVso8oTXVdRDgldONkWjhvsQTIaFaXrV7+8i7lWnoDg
	LAjqVu0iEfABncQOy3FXMIzKsMVXGmAk57juNEBXGN/mG/dZ29d55D3Cd5ptDRJvYPtV8nWkGYf
	J6v/LCp61GhzDJ5pARo2FlDXyLJSUBfNVgDFICF6BxMGQUWmc8oG7nehgI=
X-Google-Smtp-Source: AGHT+IFDjK8MLECJT0dENFGiL0Jo9FVPnXuxQmfyQEo4KDojw6waYKY+p+k6inRp9kz678PqRBf337s8mwUojDmyf/Q=
X-Received: by 2002:a17:907:3d8c:b0:b6d:75eb:fe67 with SMTP id
 a640c23a62f3a-b703d59b4demr22265066b.61.1761681873248; Tue, 28 Oct 2025
 13:04:33 -0700 (PDT)
Received: from 724652696919 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Oct 2025 13:04:32 -0700
Received: from 724652696919 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Oct 2025 13:04:31 -0700
Mime-Version: 1.0
In-Reply-To: <20251028-semicolon-audacity-dd5bdd418207@spud>
References: <20251028-semicolon-audacity-dd5bdd418207@spud>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 28 Oct 2025 13:04:32 -0700
X-Gm-Features: AWmQ_blF2frbmtiB74GgTBUwzGzFsZ-ptZ4Fky8q-UuBPD1Lp75A76H2Sef8qTk
Message-ID: <CALj3r0hWzH+pmkbJe7DdqEzwqcpSQdkfPFtv3S7m-H8gZp0A6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_130435_381375_ADF3AF06 
X-CRM114-Status: GOOD (  24.43  )
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

There won't be any problems at the moment.

Just out of habit (because when writing code, variable names cannot
begin with a number)
There may be some misimplemented parsers that cannot do this.

As a practical matter, the branch of openwrt has added support for
this board in advance, and openwrt uses the DTS name to initialize
some default settings such as LEDs and bridge

I'm not sure if he will affect the version that has been released.
But maybe it's not a big problem.

If you feel that there is no problem, I can send a new set of patches
to fix this problem.

Thanks

2025-10-28 19:46 (GMT+00:00), Conor Dooley <conor@kernel.org> said:
> On Tue, Oct 28, 2025 at 12:38:10PM -0700, Coia Prant wrote:
> At first, it was to avoid problems with the beginning of numbers.
> What problems does starting with a number produce?
> Given that it is already used by downstream projects, we have retained
> this to ensure that users can seamlessly migrate to the mainline
> version.
> What's the actual impact of changing it from "nine" to "9" for
> downstream users? This is a board vendor, probably nothing is even
> interacting with the board-level compatible at all programmatically?
> Please don't top post.
> Thanks.
>
> 2025-10-28 19:35 (GMT+00:00), Conor Dooley  said:
> On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
> Add NineTripod to the vendor prefixes.
>
> Signed-off-by: Coia Prant
> ---
> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d188200..37687737e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1124,6 +1124,8 @@ patternProperties:
> description: National Instruments
> "^nicera,.*":
> description: Nippon Ceramic Co., Ltd.
> +  "^ninetripod,.*":
> Why ninetripod instead of 9tripod? That's what the company uses and in
> the marketing fluff for the boards.
> +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
> "^nintendo,.*":
> description: Nintendo
> "^nlt,.*":
> --
> 2.47.3
>

