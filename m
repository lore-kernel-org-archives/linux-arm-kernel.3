Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93C9C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67NaUlX10oTgepae7uOpNwDzs2oEs7i1yEI/7g9wvX0=; b=vhCzXN2YOt0ILRROS05xXrSJ3Q
	UklbtTAivzWFf0n8HBNmXwGKDEiHYzMtva5cKjw7KblpYD0wNpwommxHN8hRZouJ+R+z/B+xSf0DB
	rjOY0BQbQVM8JHtN3LOussb/FCeWtDZLQ5uspvzLWGI4tWGFPEJVmv6aj6z2xivj6GSLfKDS1VgS1
	lWm1zp4PTMpj1MPsYnkYBfwzhmcDSLGGoyw8JRWAXKVM2K7BqRrGi+V+0ZKP07w3b4bt2U2MFhzZk
	q173QnWJ8t9qc6/wPpQcEZHMSFMbwhCkJEwumRkX04kHQtmU48WZtRTX6JDUlcHYspb8ExpbGIhun
	mGfm+95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZtg-0000000EgKv-0HFF;
	Wed, 06 Aug 2025 08:53:20 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZrC-0000000Eg5t-20z7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:50:47 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5396c1d72dbso2591686e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754470245; x=1755075045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67NaUlX10oTgepae7uOpNwDzs2oEs7i1yEI/7g9wvX0=;
        b=ZBXmGUW3utD9Oh5YVzmcI/1QLSab6V7vseX3rSr13dZ8z0iAz2HrBEBJgvIKVNvMLf
         S945LFOKT0OkutGy7Fkn8pTVoarofePLywJxCTaY7t99Mwtp+T8Lg9d5WLjwrw/H5D6j
         IRqnx450+0sO01Ke/FfoWE6gBypECPEKEZkAj1Z0V36IzPvpgEuimLw9q4slkNSjrnxL
         KVYb/WPKusrnzpNenDI+5r9ubD4p3NxqB8LI2APW1aiQR6GVxWvBE2eXixDA5u6kjGID
         lJcJrMmWkByJl2pXdLdVNZ+vWDAzY9/MJHNWRDo7xFq3o3yZTrIp/eFTOFPBHtrhPasP
         Q0Yw==
X-Gm-Message-State: AOJu0Yzir+tKmhqdIL1HZm44bvAf18pKCpc4ObcF/b5S65EZ8x+QHj1a
	oHWfQyGent2+xeK/pptc00Ikqk5P3kRjfs0JzH9QKqVPKa7Qk1EC7nWAnAnX/KFU
X-Gm-Gg: ASbGnctws9fcrLfXh2H/uJj9OYPAu3t6a20vkSP16CosWwcuokby02kz1jRgly/h0tk
	gXq4vlEGszxZhj57CSgUuZxEXFhTdw49fXxaZ6SYs2gHjhMHk7pda5GrmBuHB92zeEbtBnfg/a8
	Y33L9X+NHaxXlkgYAN0zkW7HuehBdvvEcwQD1A2+JHove+02yRgf4/XhzYNRRHm+eO+XUpec63e
	UerF4NbSXv2M2YLNCJOOmqFHUWm1UIYGeBRPG7S6b3I1HXWw0a1st9uIEynpKNnnO83yPQcDVaW
	aVDvhj068RE8ErgCz3DbXGb7oRFpUXmsjU5Z/tvfcRmnsgLyjO3CjTKAnQyj6ScnQx8NZk2L7iy
	3fINgChpQLYHsS/Zc44JbOpcQTw5gef/q8Y3J6/PGoC1im5WRmsl5QV9nAI7b
X-Google-Smtp-Source: AGHT+IGr2rAK+WsBGVBWxQTOBwt03NrkvJBQMaPHg52y/lcMBTGEaXncVot/ARSK4xe2rSKonCRJbg==
X-Received: by 2002:a05:6122:4f83:b0:539:8b51:fbe8 with SMTP id 71dfb90a1353d-539a0239a91mr838683e0c.0.1754470243673;
        Wed, 06 Aug 2025 01:50:43 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936cbbc29sm4082881e0c.19.2025.08.06.01.50.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:50:43 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4fc05b4a25eso4092182137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:50:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-503722a56bbmr726573137.5.1754470242932; Wed, 06 Aug 2025
 01:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250720194756.413341-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250720194756.413341-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 10:50:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9LzH6zqZTmitwmBpLCqLn+=MK8LxJGdBBp6uABwH67A@mail.gmail.com>
X-Gm-Features: Ac12FXxrT45x6X7YTOqNpVc_gzzfmkQ9G50H_zgTu-Yqdf2-Oq5tksnUmX_Lqj8
Message-ID: <CAMuHMdX9LzH6zqZTmitwmBpLCqLn+=MK8LxJGdBBp6uABwH67A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR
 support on Retronix R-Car V4H Sparrow Hawk board
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_015046_517055_DED36067 
X-CRM114-Status: GOOD (  17.39  )
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

Hi Marek,

Thanks for your patch!

On Sun, 20 Jul 2025 at 21:48, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Retronix R-Car V4H Sparrow Hawk EVTA1 is populated with Spansion S25FS512S,
> EVTB1 is populated with Winbond W77Q51NW. Describe the SPI NOR using generic
> "spi-flash" compatible, because both flashes can be auto-detected based on

s/spi-flash/jedec,spi-nor/

> their built-in IDs.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM (I don't have EVTB1 schematics), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

