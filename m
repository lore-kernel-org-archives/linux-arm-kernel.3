Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=; b=v6qC0cNuU3yRoyYQm7ZiuMbCg3
	0tAY6DYWXmymA7J5r/8PMKc47IKEQLt6CE4y3la5ymsDmQ+tQCZ+wGUBzPXT6Fs3YCx5LA2ULV8uX
	c+57UhaX1UTrzgy2u+E4aU9HfQm1buthfnMxPI9zadCRbigbCdew/1rLAB2eYaifYnMoKx5GPiQwW
	54NBorNh7T2/m9G96tLyTp0OXYkgEfJvWAWvJwFgp0A17/vonW4AFlZe6040sz4mhAZMqjszIawPL
	d4NRU2OPOh+hwO6r44TiWP8qgvUAU3OvKKm7bb4nJigo3QTeuzL+14uiBoIUuYMszUyB4mJi4a7fq
	14i6rx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBdO-0000000Fmiz-01S9;
	Tue, 07 Jul 2026 19:39:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBdJ-0000000Fmhd-3xOR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:39:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caced6038eso13398645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453145; cv=none;
        d=google.com; s=arc-20260327;
        b=WQh16jaAhuoOEOHzZYJ/ZLVsM8V6wFDh0Hl4datAhAItO7555S4raXn/QASn/qOpPC
         gB4gZViftaiVNiAWcGKNR9HRtdR0ELyj15aU5xKn1kg5MNUwldIUb/fB++oZHDUHjOUg
         zDpSsjORHRauBONxUz4R7ES/5nPIpggWcV8jrDwXG6s8V0mERg+4E4crzJHMWrt7AsWN
         QqXDiPCBkYITwcKYQb2rMZoOd/78ikkzFV+aSHOhDk2zWpeb7TjsLsGMYvjQ1Eji2ttM
         Oas3DYbe+CWnsUjBtSVxNHOoQab6MRc5/bxWP9xQUbE9GTglYLjTq0lvRb6CMXokKPcH
         +jUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        fh=FukpXRwZwbKbMCJQZCCKY0qNy8hjKqFOamBcDPyxCqg=;
        b=Znuq7vp1wTVPtT2Ijqf0QRY0ljC9tpAMByamuSMf6RhBFbqCDfdjh4ATyJp4Yo41MI
         j/wIlW1MJJ2O1qJxPF0wzKc6PX1KHTeJVNQPJggizn2I3rRiUyGTbRrap8iwYBiWmdAB
         7u7916L2+yX+SZdS9crq0UPnu18og32UbrdeedKwPeKCk5Yl4YPu6/5bFTl6kv+TL21j
         hQ0m+/HWGeQsDboK1FK6QhWfSKSPPh6TJSVgBxPMY2FoaJbUS/CvzTh/5G6uYy0vQhfJ
         5Whz37BXCmd3j/v3nx9KVujzInFjS/7UajPlRGvA/JreTNb+lJgM2RQZXAYzGjNLRD88
         xKPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453145; x=1784057945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        b=AdaakdYgi8zsywAMw/1Bz/ODvGX7sRBBRIAxvSTia82LekwlO9OlZnSZUmzR7jsaWl
         Hk6B6oK9MeKo1ikGCf1bopcNS6FSYdQ3EFyWdPHgY0ZgUxxOvWHVNJ1K8KLGxrMKscip
         RjNz4usFLPM6B1arV8/vgrBClLaaGfgtrR6bMloFrU5EPTcfKop4c+xAfr9P6Cv1tlnf
         vkNg4hNYqpjmw8LrHH7Oxak35yVx2QoZKsIBqVw71RkibY1xDohUUbxvGHl+6jCO31nq
         h98eVpLsv9d9TCKxBb2dOz6Ld2PqIWg46EvFqCe1NRRjWe1HQwzJ0DoW770z/ey3g4Z8
         3mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453145; x=1784057945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXx/NcgXG31PUtUiinH8vJvIK7iycglmeDb/mzIBX1w=;
        b=sk6jhpw6+WqIICOnG36HbsekDNN7tyXV7h3uejaDoOm/KzQsC3p2EUDTFbVPL59FAy
         wN2mzswtOoMWAL8hqHmOUZz4rUOWhq61CZKvJIz9Hxha5+O/P6mpzOLdgp+aTD5GAogV
         YuO+kq3OouV5iXSJoJ8wEe+pYuZ0v4MOD3JKPCeSVzF11UuPT6cpYXQWt2QRXHD1Oylv
         9b4C0/wWqJ6+YHfupoJpkZNb7lGrRBLfdcDTp9rImNmUHdP/nTzQVA3YwN3QPex2FGbN
         LT0kZ5NIqrFbNEFqXgLyGuWXOoxzInekZDBW4AlYyTEW7JURQuLiNL3R8vTRXbFXxEjY
         lyXw==
X-Forwarded-Encrypted: i=1; AHgh+RrI3jQz7EQ/o8iluMeZ+D7U6cSAbqZELNBCiNCi6jvMMGhApwhsivnePjrcv1FGpdBp8ohJLqrXPfMqICeY7yaA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7VEU8CfbTq2lWxOMruKzFFI9hw4gADZ7ANS99RLu2IaoAd4AN
	oyxfQuykRLtsAEJOXuPgUZVYg4cueOotrcPV742xNFmgoPVPWooB4qVYqsw8qXI0fiJ2s258N8M
	0CulAqEIWCPoA/zwaIG5SbKFqsF3LgF1IVe42
X-Gm-Gg: AfdE7ckrUuZInOlmDpKvMvibNinLhyzeE1QaMPrtHXG9z0zv0NluPnEl7hj5UIgS33O
	NIwpyetotFjXIQDOxNF1R0C5Qw8q+lf79Pdgk5jExAe/NNwV7J5IJwHJv5ABRpVBSln71e1bXJn
	crvV4h6yRUk9vdXsvOXF55l4nbTxZ5JKk25GU6x83ERjBwsuECqyjZDPjhp9dT0FAIYowoPlJxM
	3uvrVtft48YoadHYKQLuExdrfWDCUFZ/yGRwFNZ5Gftzqx7cbx3HNQab0SDKA5F+YN1DCpDcttg
	CCnO6BSMOosAI3HkpX5kywffpYn9hRheb8Rr
X-Received: by 2002:a17:902:db08:b0:2c0:d94f:50c7 with SMTP id
 d9443c01a7336-2ccca8f720bmr37243375ad.7.1783453145051; Tue, 07 Jul 2026
 12:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-5-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-5-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:38:53 +0200
X-Gm-Features: AVVi8CffeiaHURy-2AEleWqNmHrerEbtp1JXKt7I-5nEUnoXQSWzsH5GdBfCNl0
Message-ID: <CAFBinCDq7dv4vSC7=Gr4iqydfnKs96VkPpqzG7w7JVUSQceMvw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: amlogic: meson-axg-s400: enable
 mipi_pcie_analog_dphy for PCIe
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123905_983788_EF314620 
X-CRM114-Status: UNSURE (   9.82  )
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

On Wed, Jun 24, 2026 at 3:58=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> The PCIe PHY node references mipi_pcie_analog_dphy via its phys property.
> Enable this analog PHY node to make PCIe functionally viable.
>
> Fixes: 9715b01da6cf ("arm64: dts: meson-axg-s400: enable PCIe M.2 Key E s=
lots")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

