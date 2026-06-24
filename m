Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EA5CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=; b=2mkOww7v1PyvEZvQkwUFQgAA1z
	e0ONfOQKVPCQ2uo2lBaNR7SDE3Wz69ouJMEPvBUkDo8aA3n1HrCPzsBf9DOtMflES3UdK+djMD9OE
	G2MXJi+kL8XqAYS6SH91RwcHv7BVaTn05NtI74LdlwXF77mMg0lD2Yg0MRDfowMqEW+Bn/cXPxp/r
	FBqMwggI9ViF8MSw22mHNsgDo40/f+t3NbB2G8HpVO3C0HYp9PTIaWK09YpAMKYs71LrQb5RInmtf
	SzMdU6AAmzEd+dKIaAj1nurjdljAQMgekY+VkAbigq15JEWJdu75JRI8nciV+WNFbmOOtPXS0xp6c
	R70UQNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcN1g-00000007m7y-12xq;
	Wed, 24 Jun 2026 12:48:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcN1c-00000007m79-0f55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 12:48:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49222b6e871so6363625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 05:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782305294; cv=none;
        d=google.com; s=arc-20240605;
        b=S1jb97indqluV3xMS2SgsOb4blSbDwBFB4kfS2wBGB/jTRs52QBqwiOQOgGu7hrdeW
         cOxDkHC1+2QKHBkYrN67w0jHJTpLnkrMjpLgWQNqjACW7UndPy/YyXXWHFO8JKjRy/wA
         wFC7Ywq6/5v8+C7U9wMoqDzFTzg+5PBTjw4UqlDIsp3eXGsW7joEMvZXUABWuSHOLqY7
         7s6ZOjhuN6b/aqM2S8tgXpI8AMZ1zgJa5Xq/Fi7ZQN2fshb1VvwRbrtNS6ihPRQ/Aqqs
         xPb6EYGhNW86W0pO9EB8SgrzyhdqQytmlL57Nn123A3L/XEFfA6gb8OO0hHdsHFPFI5r
         aefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        fh=a3/Lnlc2w5Sm3lMZ/lpN/hkVP492HvPgx2wtln5AO2g=;
        b=KerRs/arwy2MFpo4jwe304Dbu0sqkk3BNMuKpPfJx+OsZgg9VnndKH9f06lKtBJLMH
         4Hhj9MG2LIjFTPZsIj6hQjbxM6/RU4yMDPJIRbc4ok3+rC2l0ouGddT4uWNGsrkmMA6A
         6aErArmXOWVrd9BKTgyHfTHAl1Vb2rd8/SAJbAWtZfJULDeL0/mRkASpc5DahWqxwPkj
         +AFMig4nWhKA745rXZ4plI7HXtWDDbBPaeI9JVMj4P/GzIugmGvkmGTvyOqDL9wthc99
         4Idmg1S1+y+Zmvq43DXjUFVao/pqwdSC9B5Zsn0cXYBanlhlJOIMvBX6Jh5i4XtOUJKU
         x3xw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782305294; x=1782910094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        b=eynhUOCH5CGiQNVBBixox9c6zJ68iVLR+WLfgLIlrUEQGvWdxAptN6nsMWc+N8a8y4
         b5bjeNhvmEJ2NVqq82hCorLvuZw4L8Azoo1AVU3ggOmvq8bmLyJ7CVzuVHLKxaNsSBYu
         UrtRYFzx76L89GXMQFnBcFu2a2jPpOHeOc0tKDhxJJ8MdCF/ulPS34353sgMhCnRCofc
         klNb8l2SlBQJegrMB76gM0gnnkel+GR/nGf2lPOA2U2GZkvZzkv0rdD8Sy4FhigVDSo6
         Lmu21Jyabl69xQRtiyEU2FZ0lXfaIA0OmEWq3CgG39TDMQ/R8OGgAaLbemBdaAVdGkk2
         4Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305294; x=1782910094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        b=eRn7qeb2l+WcE5lOXGf9lSyTOJen/oHL6S3sCMS3/VIUpMHuA8/FswBIyyPMlAe6YM
         580rYu+bsJbCpmRgv248bLNKqVOkrL3U0UPqoiebFAaqldicj2vXV/+G7rcG7QKWo5MJ
         7EZmwR1qEFhKbdzo8M7bi5gTgUliOlKF2zhF8kvBKh79Z7UZu4fl+kTMCQ6707wVqdW8
         f/3BYiQEglGUI4x+bCDaYm8eniX5mL+plVEnYc9W4UDcLkgThykGjetD3VH50axVDiPb
         JAV0HclHWUtoCGATu91eUItTT2Hl4ztbw5cQOSu1XDiC+FsACfRNVlBKLFAAIIv0DKmE
         RHHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Da6QeMSvGoYYMLGzUfqhVOdhiAMmnwkAY/kyjTSVVwCTNxc4htMur48a1QnSsEC/P4iGxNQFpr8gonE2E1w1H@lists.infradead.org
X-Gm-Message-State: AOJu0YwHtEOPg7nhAShre0UbXC9XlCuI59/GZQL8Jn4X+cbCXOUQQTy2
	X+mMNRg4dx9d45wYeNboe//7wKiFOq6Cr9QMQoZ+mpLgzpiJDhLnq0/E1dWb+n4spRNxJDVrVIT
	lh7RMWzYou6+o7OorI8PW424bTFP+fk8DFW6ldvPEyg==
X-Gm-Gg: AfdE7ckJPmtjGVXUBrqK18rtjse/gdT0MCtYWWXpUFgCd7+c0kmhhYHi/ZD+gjTW3FA
	3F45jimRsauiYIVHJm9ddZUX9dqRcbK1CxrYtbcjtrYVO8nU4fJyPp0wc/B7rjS0aF7xx0KHjG9
	3zgJFyxX5XZuH9bCRjzm4MDUfRBdGB2I4Ou6Ocd75m1FYgL2DhTLkA6xtL3uunrByNzKLOMv5KT
	arTRzlWYhXYuHzvrH5vPFBBlEA1LkwV+jC4JSBkAt37lhsorFuKp5tX2ydyrAHf/5JKCkHFwOb7
	jPCvf0HaEoxiauGFUgs9jXaScSMW4DrLHrqgDS2+pGyQJBDli6TPkZQN9A==
X-Received: by 2002:a05:600c:699b:b0:492:6113:d4fc with SMTP id
 5b1f17b1804b1-4926113d5camr38002035e9.17.1782305293997; Wed, 24 Jun 2026
 05:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
 <20260624-original-vigorous-mayfly-dfceac@quoll>
In-Reply-To: <20260624-original-vigorous-mayfly-dfceac@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 14:48:02 +0200
X-Gm-Features: AVVi8CeO23_9ds8O0yHhJLM3WPWltEB3CF7pRM6viO6egbyN_FuIGSRsMbnIPSw
Message-ID: <CAFi2wKbKr8FMcJeGWA5e1UZUTh2=LwYNkLEj6exd2as7=AcvVQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260624_054816_653410_8B41455A 
X-CRM114-Status: GOOD (  10.73  )
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

> What does that mean? How UART can be accessible over PCI bus?

It's a Virtual UART. Internally, it's two FIFOs accessible via
8250-compatible register sets on both ends.
There is 4 Virtuals UARTs on the LPC bus of the AST2600 and 2 of them
are bridged over the PCI bus.
So, from the host, you can access the 8250 register set on the PCI bus.

> > +  aspeed,vuart-over-pci:
> > +    type: boolean
> > +    default: false
>
> There is no such syntax. Please do not introduce own style. Instead,
> look at other files how this is done.

Ack. I will remove 'default: false' for the v4.

> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.

Acknowledged

Best regards,
Gr=C3=A9goire

