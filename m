Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6D9CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=; b=JY27OPqHuheb0b5jC3My77UNqu
	L2bBCxqYntDm2EdFhxJYXTd3nWAP5YZsEZc+NguEZie7tDepBeB5ghuJvKcJZ4t4PU7Zx3lXtD+ov
	aXvlPLGXGRh6Aq5YdjE5j9gvs0GYGm8SrUsdbVOkyNotuf48xu3X9Pd8qs0xMHllEwhxI/kw807m0
	pA1es0aZtowcmlKPVEulqxLn8eSG3MIJy1uVBShgEt0XwCc0QCiix+v6A6W8X/K+lVuAQoXMbp7Mv
	yQbqdYwzHAIkA2HEnk1Bhrc5L72NmT4sKJ8L2iJt1qM8Xju1nE2YRB6ZRw+UaRwbU/YsLLsDTHfVw
	8X19i3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg6U-00000008sgJ-0SwH;
	Thu, 25 Jun 2026 09:10:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg6P-00000008sfV-3n2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:10:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4631679f204so365191f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378627; cv=none;
        d=google.com; s=arc-20260327;
        b=iohgTpbEDDD8g2srShKMn4jxgUZ8pU2QbDA8TyxbY/apLo3Do7h41fsOdLnhibMTDB
         AinxvxSyzmajtOgo9R9io5jiAu7qVz5RTMX1DlaKsVwnadRG65BNdN2Joe37mw/1yoX2
         rcGzF5UM9GUxr+mAXawrFKkFkvePU2Hm8pzUSU266hWvlS5F9uRXKMrlp+Rhf/EZNMnz
         DsCbvUyiiK67q2LVQ/t6HX/6VWdA+adGfraVdc4svGCrdMW4wNjrsdEtHfg+bei9CEmF
         wedeqXW5ackVIDw4njyiVHbPV2RtbKki+/8fUno52p3H1N80NZA+lMUiPLlbnGrSPlx/
         tJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
        fh=cue+fImAbH/fPNwAQ8EiaXRD1nA1ObfIbmFc8sgHO5Y=;
        b=c+RvgGLHrG9+ll7qoPKW7X/kR43bSzp9VbH87RDUAKuL+vCDOpKvMVnSYYa+N5Ckx0
         ijRDxC4mEILUn5U7+z50yx9X9cN0MZfQXkpPQLKdHlbtpWn9jpWj7nRQ6D037CFUw5Tf
         E8QBCEeyHSOJN7IOZN3DYTniwceTxc8ZXzmHpKyGnVAEdNsAZY0lRi9tF97rV3cvCScW
         iTaVWwoidywKADhHOySxFjA5Ky6wNX3GRuzkPsgYG4P1m828WmK2L2lkaM3VJAeQgpZh
         sh7p34gnR3sLhKn9Ejj+Lnc/d8uktJxJLkslTtvB/dIiVYLaKE1WgrZyiak1PqdZlqtn
         hq7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782378627; x=1782983427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
        b=We9pN9JCBUmAB4cgkAWJB0TPGHJBTXwEh3LOwtPZAflvPQPzKYy7vsMvnlsFeRydND
         g9/ADbk3TlB4KaDk1VreDuJWsm5qWDeA7wDUCBV7+x9kg35+DvN8v0I3+EQGb0M4kCMf
         MUwpNCTKqdTDr37wYJUijqKusMzJmyj+PE4QKjgNn9g/j31/xtXl9rOMA3zgJeHjMAVz
         9wrE+AMT5iDfEikhTmjfvkZHsRzrrlNwDzKO7RzDbtOAIlXgNVcNH5IaQaKqbbapTd7n
         Or0718rkoFK3WQkIahOz7s/ZDkGkbShVEo71odbatnPJp0EJww30jFwL1udISnq23KJr
         EeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378627; x=1782983427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PybBbFFbv2qgp/wGc6XtY0wnuLp8C2DGakY4TdWZcjY=;
        b=VKllN2Om6w/IDcs7II2bqflic9XMviHY+QnatmWx3ETBVmv3d4dacsPBxXHQ/0sJiB
         b3GKfppbC/otMgGMnUmcKWgW0fgZ8WSNDpg16PemC82J3cqWkiWeGyJsYMCouTvkIIhJ
         mPjX7nbfqbVfQvqIUaLj/55V67N1MjEFxGOHgb9H1801PtRZ+11L9bZbqsO0fNd7Qcmy
         /G9+9LvtUkqgPpmHqT0vaCm7+UslyBxV6PWdes3AjYqxLfPFjh8qkNW5l/8R5ldQEqPf
         tHH/WIoqb9G0bahhoC2mUsqPqWN66R8ZcD2xD7DypyGRjGDL3cEMIPpO4/zS+sZMB8PX
         f1PQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4sAtSpn/GkBZ5KbgBzvgvnSwexZCfIcsJxCd13Ggr0SUq8zF+chXgXzUoVXYmb8t4diJtBR1Lsea7eamgzH7v@lists.infradead.org
X-Gm-Message-State: AOJu0YwaFj7bV8XQ6mboLLc3UIj/UejtiluLbF3PhV3pyw8JFJGZA9VD
	R7rBN/TXrzGI643nEl5oQ12J5CYbSGJU38eJ55ft6WwO4GA9siZa5GoZYXS7355IRIwX8cB+dI/
	GXWbgZn6rk8hxYpVnnpf2rJa5jp71g9vmDPOXEa0n3A==
X-Gm-Gg: AfdE7cljsaRGDz43YNh3kvatalmfGsYpDJ4MzAsrx/XqwkCsvjaM/vZ+G50kO06+Su9
	Tv/q8xW9vIcB/9gCZyRlpm5NYSL379liQwEMqR6tIOOPwb8RjD/FbK7lnk7eT2J1iI+pmuMIuhZ
	t0uZpN0WB+68yciwdZ1xnw/pvHKEQJ7LGL9YrnUAvFaKGhn83DM6os9IG1W/Pac5mPonFRSVoRX
	c4yUMJRPXB2WFuNebjnYmyhNURskBE5YG5gGzFcFjFAwGxmuPIIqGWH13lQogt3PQMUiA/gbTyJ
	GG21glea7SdH6LoISWO1b8tZsKycbCL+aLIN1cqVCVpB+zMWcgU4dgwS2w==
X-Received: by 2002:a05:6000:24c6:b0:463:b7f2:cc7a with SMTP id
 ffacd0b85a97d-46da9508504mr2493751f8f.17.1782378626958; Thu, 25 Jun 2026
 02:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
 <20260624-original-vigorous-mayfly-dfceac@quoll> <CAFi2wKbKr8FMcJeGWA5e1UZUTh2=LwYNkLEj6exd2as7=AcvVQ@mail.gmail.com>
 <b9ca9e36-a851-4a98-a739-ca99dd534d6d@kernel.org>
In-Reply-To: <b9ca9e36-a851-4a98-a739-ca99dd534d6d@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Thu, 25 Jun 2026 11:10:14 +0200
X-Gm-Features: AVVi8CdVW0AmRhEG0L6wUoqXHMzj3ec0waXKRN6u-RXjXnalVyhv5A88QhYFWcQ
Message-ID: <CAFi2wKY-73nXEKxp3vfB0RBsB+VB_stNk6NKk8gCopaoav6Tww@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_021030_222767_83D2A48F 
X-CRM114-Status: GOOD (  16.13  )
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

> > It's a Virtual UART. Internally, it's two FIFOs accessible via
> > 8250-compatible register sets on both ends.
>
> I do not know what is Virtual UART...

Yes the name of ASPEED is a bit weird, it means that it is not a real
UART. It is two 8250-compatible register sets, and the data path is
handled by two hardware FIFOs (one per direction).

> > There is 4 Virtuals UARTs on the LPC bus of the AST2600 and 2 of them
> > are bridged over the PCI bus.
> > So, from the host, you can access the 8250 register set on the PCI bus.
>
> You mean these appear (or are) as PCI devices?

Yes but not as a UART devices.
The two VUART are accessible under the same PCIe BMC device, at the
VUART addresses configured on the BMC. They are accessible on the BAR1
of the PCIe BMC device.
There is a 2 bit left shift between the addresses of the registers on
the BMC LPC bus and the addresses accessible over the PCI device.
0x3F8 on the BMC is accessible at BAR1 0xFE0 over the PCI device.

The PCIe BMC Device is one PCI device where you can access several
peripherals. It's not one PCI device per VUART.

For example, you can also enable the KCS channel 4 and it will be also
accessible via the BAR1 of the PCI BMC device. KCS is a protocol used
for IPMI.

Only these two peripherals can be accessed over the PCI BMC device and
they need to be enabled.
The host cannot access everything on the LPC bus of the BMC.

Best regards,
Gr=C3=A9goire

