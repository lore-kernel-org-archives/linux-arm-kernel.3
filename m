Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31CFCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=; b=tGKRdPefDw+5/DZ8dWiVSb21Ns
	NAeAFowJKtFG7nbeP5iz+f/gGJWTk3pkemvMQNlsAe7lAbxf9QBDew/WCXcefLrrbWV55E8BrzOaP
	MYdrZBgflpb1MABhaIW/m7/C18A7i9wgyffz9tacqktWEdpNamdMs+nBI+NnMcaj9w7pk2BLkjAoW
	PWbTYFeqrG4cXk1JN1Y7PUQ45KakcKs3d2s+SNjtVdorufRFNKcmf05O669uRocd/CoVPM248aKTb
	euLhAwYKN7cz+NbE9caa6FlEhWFU2vTfNNup9Sfbn7GZVQP+6YojtEXdqkNZM771nZ9XdseW8910G
	lDjU1msA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlQz-0000000GrTT-0y1G;
	Wed, 17 Jun 2026 08:15:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlQw-0000000GrSe-1cfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:15:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-842307473b5so3697331b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684137; x=1782288937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=;
        b=KL7dKk8a3JwkJBVdAGEEg1Ki+zfel651l4/9CiK5fC6dPeuqy36ZcFqgD0oJGmuhjK
         UbUYCP9vcOYLqBcCzVkMs+aOtJwJpn/Y0B1Tfk5/2OPgOeESdc4prhZkhko1rPCWmA94
         0xwIBq1iTLQEpvcCpAvwuD96nb7nDZcmCcaj0xEvtoIsDu9BWZ8Ho0fkxXp8w3Zk53gM
         J6CSOsBM/5y/r1n1l6/fjr+cGsqggvfujbXRgnpnweGd2CqTpqZrwIEteAAl+iGFr5A1
         1MuvajiXooLvsdDDrliOa5jQjuYDy+JuzV8+sHKdVFncglgssqEl57FWbvTu/gIYD4F7
         1dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684137; x=1782288937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxXn1Oj6SL8VleTEBTLmlWInvGgOzp9b11hsJyxGyH4=;
        b=l2zRo6ZZlfWnqAOq7bMBzhKVOD10tm4xj63LLnbaA4FzRpZHWBzSsIqJCxDpS6agn8
         6pQ7+CaQV6OdVddrTzNhHR0kzUEufpvd+T9Yer5EgIWrJ5h6x0OfmhINZpor1ZZipLOL
         vGkG1dlRHj0JXRf8vMsBMR9vW+vrVqE0sXEfWs5YbVvMQyPz72aYRfs8yunWrQf96SWd
         RqrYheC55QwRNtzAbnCBcp8X/4LEcNVXgE1r/5JyCrZexCnI5LmjB2QdtuscxhQM6Ys2
         B4uxmed1lkHEfgyR765EgYXK8nyjrYWEBHWBOdieP1wRO9uDyrUUdw5hDvcIL+sOoskQ
         GLWA==
X-Forwarded-Encrypted: i=1; AFNElJ+lAiPS9sLVzPkg5/tcfAMxX/7Sa3m2SSnMWTYK0/ZTbrR2I3WYC7hOI1pkFpSmlmZwKRBfXeqhERqhbd5JPpJ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu41H8aEMJwY4SpjHV6GBKUb09YMoM4tSosQ+3yc5axLGfkRGv
	yDkZ6mhaMEJLl/tDGFwMKyo6ylRK3OgfpjH57sU3iMUVxrj1sT8uvQquQrkGmkFV
X-Gm-Gg: Acq92OEZpPzlEOeLWlWHgsFntiZJeL9bvuUyf7pnX97+rajp0sGNCh/ZqqfXrqWk8B8
	AxFwdXlWV+ssdGJ1/6P+ksympA9zc/9it12fug0e4nzFnczGG8/PUIRLI7wVPHgiQFdwrqwcObL
	a5rlWQZm21XyHAYhJ7TNlqTYhaP8hQUrz2A4P1lf15P53shGU6ne19qQCfvl11KHzaC3Co9LhQi
	J+a+4iiuIS39MPHKBVluOeg4TeBN0L7isnER4GOB0uCujmczxeF2uVW3C8aC3KwJyeZnPAhm8JB
	dK1lWU/KEn/Vii4bsVef0GLk/47DMn2m6Xq9Ae86EOEiZy1ftFD7hXp+SXSgUSgaQdad3bwJRmK
	fzQpdtmgKaVxWGL68qSYTnq+X4xXTGsv/MRXpKOxVx5ZblP75gZEUeKTzE6J/fMW5n7c5TTkZBu
	90WxEQqQKQ0Q==
X-Received: by 2002:a05:6a00:99e:b0:842:6ec3:2352 with SMTP id d2e1a72fcca58-84524484febmr2781503b3a.18.1781684137489;
        Wed, 17 Jun 2026 01:15:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c474sm14054459b3a.2.2026.06.17.01.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:15:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: neil.armstrong@linaro.org
Cc: avkrasnov@salutedevices.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	jerrysteve1101@gmail.com,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	martin.blumenstingl@googlemail.com,
	robh@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Wed, 17 Jun 2026 16:15:31 +0800
Message-ID: <20260617081531.644109-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
References: <915e4524-d407-4b4b-9e61-e4a2274a6f6b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_011538_430313_371BFB7E 
X-CRM114-Status: GOOD (  15.07  )
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

> > The meson-axg dtsi now disables pcie_phy by default, so enable it
> > for the s400 board to support PCIe functionality.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > index 285c6ac1dd61..7ba249cc3d56 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > @@ -448,6 +448,10 @@ &pcieB {
> >   	status = "okay";
> >   };
> >   
> > +&pcie_phy {
> > +	status = "okay";
> > +};
> > +
> >   &pwm_ab {
> >   	status = "okay";
> >   	pinctrl-0 = <&pwm_a_x20_pins>;
> 
> Please squash this one with the previous patch

Sure, will squash with the prior patch in v3

> 
> Thanks,
> Neil
> 


