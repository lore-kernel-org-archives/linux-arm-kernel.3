Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1459E7E34C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsj1RGLAszaRKzpMsR2E+ns4h5R80DTAT3PdStNjiP8=; b=u7L/TohBwJ2nNcfkSrUAKBnkLc
	nkwZpzbvo4C2PNDBkkIbD0l1QVTKMaR0zFX1KBA4w1cKNmq0AU0VQvHRoICA2Lu5iFwHMdjdn1N3q
	AI449nDKKHnqizhtCHE5N+gp5x2FBuRUvPQ4nBl7y0rD7GOMPewwS37uPAXeiSEZrAqlBi4tu93m4
	06BZkUMGpGnxLInoaBUaA0GnigosJ1Wy12TC/IPBCjU1+LKNmvTpk6Os3RKF7KjWtuhOc7oScK2/3
	vKne31kaar7J2HFeXq4dcsInoFUxDSAR6CfA7or14aVHjfGVlJZriLRB9L4Ui9Ilg66JUvAUcJUf6
	22PfiMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aPs-00000001lVQ-1C4A;
	Fri, 03 Apr 2026 09:02:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aPq-00000001lVI-0W5h
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 09:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qsj1RGLAszaRKzpMsR2E+ns4h5R80DTAT3PdStNjiP8=; b=KQBe/JM8Vpxeobr0PRKoHo7GAG
	R98x5c9nmWI8yDsd7DODlcHaJoQjhDoq6k9j+LsPKkFY7nIDmFLJMFOmCbsU6k4isrvdvY8zbU5XZ
	l6wDn2ZpkM+gzdJ6dubc+jSUOaUNsUkwmAh3SR6HD2Yz8SZtcNZo0TM9edt+HlWuQ+ezdmu0tTCFo
	z7RnxpGqOBAq8phdg8GaW2RAEePei8EuNRLMK2yWNSh38y0PRd1kLS/yavvG8+NRiQ1APyYVxe8aH
	V76nrEnJjUXmSjGPdbwkLz/E7XhjIORFaFkaIndPDuLj20uVG9cIQhcsQuLvlzrZwm5KhUIsmlkm7
	/ypgubSw==;
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aPn-00000003rBz-0ihA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:02:08 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de664b541so523079241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206925; x=1775811725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qsj1RGLAszaRKzpMsR2E+ns4h5R80DTAT3PdStNjiP8=;
        b=Ss9Te3aJ0UIi7zr5qD7az10DaNYY40oV6PeYYYzIGDrdasmJoMjziV3T4npAj81uMn
         gBRdy1u1Cu7o15r+iEPt2dKhYX//uv1iQW4TkuzFPJBdlw9ayEWVC8NRPsFEx8Jgt57u
         Oj8qKa55l77jenJ+g1lnWkhWHUvEAlEtW9YPEE23eCseaZM/goR/Az8tQjG8l9KVfwPn
         I953aAtS9vWwviOSRCxS+JUAtU7LC2L1XGuLYT3ERDMkb5GFgR7+hg86oEkJ8ux4isPM
         UK5cyda0RMldDBByCIWAhIi4ini3RTFdnmq9f+DphBlaMZ6vKkk8RYZwqeaNMSdYogpI
         zW2w==
X-Gm-Message-State: AOJu0Yz1iDDnYKspvRj37Ja1ECt59bAxE666+q5EABrYy88uoeZCtuI1
	qCcjaMkdBuUjO2IJq0QZeKwx9rR5zJ3C2uC5p57wPShwXJJ39PIWaiO3kzqioFE4
X-Gm-Gg: AeBDieuD+hkvHfP8pofqoP9ypJ5D1r2fp29U6tb+kuY+4zf7g1A+rij9jnI7LHIwFMX
	c2LiFktuYlE+eAPlGLe4f7K/Jf2xvH6JW8N9T1m3RG8s3S/gxUBs9hIo2SJ/8AFYME6WEQHOZ7v
	K0vJOKR8ifn9EOfvQJKww8+OFu/i6FDvzpS2syQhw5Ee2CTt0fI5+nY4LVKMekl2pohZsGRMrVK
	WhWmVNVAYfjjUMj+/Qc9wCLBEUBlFXoxWE5F3Zs4t40F7yk2jZpJw6GN/SIPUTnG4CLUkiLIiav
	Q2MPeVkSBXkuHchjwtHsI0q7s3pbTIFNEAJvJKPW9E/6y1XduNU353b0BVRal7vMzkvof7CU9st
	S7XYdkh9MAAH4WdS630ZGTPaXTfnsAA6o5ofNRLLL4JIEosPMcyTwraqocspQI3UgitzMiP1Vqe
	EeK6teC2rnbCkieC8Ms1ki8wa9qHc2tAb+zLCijUK8SHgOw3Mp9BdFhywPNcmoiXIP
X-Received: by 2002:a05:6102:914:b0:603:dc3a:6f27 with SMTP id ada2fe7eead31-605a4fc7d46mr692147137.22.1775206924525;
        Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e73126sm6908571137.4.2026.04.03.02.02.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56d85881a68so663610e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:02:04 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:56c:ca38:ebeb with SMTP id
 71dfb90a1353d-56dab8243c8mr760736e0c.2.1775206924117; Fri, 03 Apr 2026
 02:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:01:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCRCbqWdJMMEsJCbk2TFVxUurjOmFxwLMYxHzPdDCo5Q@mail.gmail.com>
X-Gm-Features: AQROBzAnTN9lYrSaM9ZtCA2x2wm4A4eG7aiOhMzuh5U7vdK_Tlzo08dmx-AhkbM
Message-ID: <CAMuHMdXCRCbqWdJMMEsJCbk2TFVxUurjOmFxwLMYxHzPdDCo5Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Fix missing cells and reg in
 Draak/Ebisu panel DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100207_292523_8C35B79D 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into Draak/Ebisu panel DTO to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

