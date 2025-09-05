Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F76FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yR4MNdZIy35U00ccIKzjKaOutSLR2GPJ6bo+zIk+aFo=; b=Bv1SIefFIdc9ooOMCiY3erXDq7
	H0uEyGAlRHqMMcJ8vEZ9Fx5V4/u3jJU1pkNkCUVqX0LcXyuJ+xngXATxtf+tTk3ZeHIMUNvCyQPJx
	WU6CgqCjEv0NEpeg+Xkkk3uFuMoAyROhCcZE+XovEzaxvIqrZrXS1LGDN1u74p9TQC8MP448drTnV
	CbTImyzq/BZZzuCcs7hIUWlsxQItucIceisUl6x4gE9fh+V4x33341ca6UYd9Pj2SDOsmjpNrlP6A
	wThIIoTqZdlGQf5EQ9oyNkxYYMoc5mwYTvLgpbdv7Jm5m95/OnCH0p/k6fvkZx7dyhBspkhds0C2C
	9zWibI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEm-00000002hHX-0E3G;
	Fri, 05 Sep 2025 15:20:28 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuS3J-00000000SUd-1NUq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:44:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62221568039so134378a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757061852; x=1757666652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yR4MNdZIy35U00ccIKzjKaOutSLR2GPJ6bo+zIk+aFo=;
        b=U0Ut8idgIX+ER0d3y4AHWPqSm3sIEO+0ZntILYVWnWBybX0TVRvdwYHU6l9GiufBvi
         3+j4/4zT1LvoalZriaTWaxYVwadHgym1yIVCfqAyGjUYJPDJLeOW6EzIvTCFnItBnVPn
         MrqVjDr3AUahG8avQcz+6ZrkqJ5MwAcYmgVpV5HcR+bQjjnMMVjp+X2xu44gUsX0Dapo
         oRSNRzH+zLcjuZJfiYrbcwANnHv0dS7jBS+IMi0iWg3fdtI3QgY/6Csmid0wKWg4LXGj
         UrS/0rGKPE47W5yOtsQhBn5JXFTb6GSLs1xQ8vFoUQs0yLZKNxZk3qj/Mh4BR469R0pR
         7RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061852; x=1757666652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR4MNdZIy35U00ccIKzjKaOutSLR2GPJ6bo+zIk+aFo=;
        b=tXKT9/oIZw2fM7knYaP+L9kK6De2hxt38w9NujzTdOhz6Knil8/MO0BBgzOnUpbyUY
         4tSmJVrRDO2l5OyMfxcGF0+nN5ywGwy661ETEXKa7JLTzVwN88zAF4Hl/OEnowQgtlqn
         CTrvot1u2ohX73fXBZPOWR0UGGcRL+sw0FHy+TmtyAXj5XRxUyCyxezmvBqF4KO2RlxV
         uStA5oC7Zi9bUGnPEsJfbRsRzuevGR1O1yGwABZ+BE1eYwd8uIwT5p08J75NTWYYW/XD
         9bIXCP7WK5YdQYVsNgKVPHo7bY67fnjqyIrHp/O1Oe9lDO5eE8gXEllCQYYvfacGK63V
         zjdw==
X-Forwarded-Encrypted: i=1; AJvYcCXQGhdtK68b3r0Zi+zyQgaiTBDF/8isa+4gOuRt2Wu6x9am28BNGe6rgp4Q6sMtUFdn7erhk2y7uV+fdmadB+rB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6USiaJsQRzb0r36/I45EcJvp5aGb5cYUziS5f1W7erypnNtFr
	WEoDaJwkn9Y9z7OHHgMfcKLowZ2JBQpH/DfbJPyaI29LLbenBNUlZT3lovm8D2aJpxY=
X-Gm-Gg: ASbGncv3jb3SDbj5A3s519GF5epYSq5hHgTd8YAdQb4reRsvZyk9QCTylFMVB1wTJYm
	/P9S9YTr6J9KquSOJCAUr4rJrH62Ww28vBs96iUEgklLCrgWTOz0WPDMhlgGKDHy39iqtc95vTS
	33mjgQC+1eFL9zwW7BEvbC8OglaO5tQu1rkMDXztf7+lAiZS6scEIAwvjslJplYVT+c0Ke7Xn2e
	PDKhGnKXJfIdqGIPXjDYCPIyCzWq4FXMyT+8I2IiUqZZNmXTq3obDv/OXY/xGAZ4b/a/tlTSMQk
	icyWTdRsAe+3pCsadGZWFhqeK8NXvY5N8CVM9y+OUlBL92fOAsTr27JY7+cbzFpbitGE5tAMYtA
	z+kmoDyrKriUHChukYkmubaQyP4HBWynkXUekzUJuaU7dJJoHO/naA6vSSRkZClOW+/3vqJD6+V
	t+fsPmN9QHMBHBinAGei/yJQ==
X-Google-Smtp-Source: AGHT+IGDLfdyG4Skr26W8CIxq2lA8TSvgcUdWiR0PPFTvWtp/0QiihczvwRvoN05VyOwttajNkcHvw==
X-Received: by 2002:a05:6402:2807:b0:61e:a13a:27ce with SMTP id 4fb4d7f45d1cf-61ea13a2c3emr14799399a12.20.1757061851705;
        Fri, 05 Sep 2025 01:44:11 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbc51sm15734349a12.27.2025.09.05.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:44:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 5 Sep 2025 10:46:08 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: rp1: Add USB nodes
Message-ID: <aLqjUNAdremFoM-F@apocalypse>
References: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
 <f7bb0739-3161-4d70-87e5-8c978a023361@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7bb0739-3161-4d70-87e5-8c978a023361@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_014413_390074_36ABEE45 
X-CRM114-Status: GOOD (  16.69  )
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

Hi Krzysztof,

On 13:05 Thu 04 Sep     , Krzysztof Kozlowski wrote:
> On 28/08/2025 15:50, Andrea della Porta wrote:
> > The RaspberryPi 5 has RP1 chipset containing two USB host controller,
> > while presenting two USB 2.0 and two USB 3.0 ports to the outside.
> > 
> > Add the relevant USB nodes to the devicetree.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 28 ++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> > index 5002a375eb0b..116617fcb1eb 100644
> > --- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> > @@ -39,4 +39,32 @@ rp1_gpio: pinctrl@400d0000 {
> >  			     <1 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <2 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> > +
> > +	rp1_usb0: usb@40200000 {
> > +		reg = <0x00 0x40200000  0x0 0x100000>;
> > +		compatible = "snps,dwc3";
> Please order properties and nodes according to DTS coding style.

I'll do. 

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof

