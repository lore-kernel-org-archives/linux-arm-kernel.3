Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C50FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN/9t8eXBgaIlZnwRxNux54CYSOA/PQxsbMhs+U3oPg=; b=xR3W/zBbLGBblNs6vCZSkSgoOF
	vknlvRGShScDrEjbNoizVNVZ3BeyVFNKdNs7ahNUYnAfMFObBRwvH2vnr3CePeuv125l6Rjh+6AHx
	deUpH5pgkRgxElTWkNrPOAeMk4IjZhGEHwL6JJab4rDWkYcPM/Xuv8VA3zG+Qc7YBeTgqpYD3y93Q
	vDxanulNOprgpvv5FEW6BLhgQLQUykMsUxLilrKg0dPfUBDxnW3uetrhnMj/qROqHxmQ6I4rDjk/1
	Hm9UoYBsFySKUU1IAzZg0ufhZJrw+MDzCM96Fu54ZF7SpAGUg3zc4HdZ4xCc9l3ITjAlYvv0Y6QGI
	98f6a2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazCt-0000000CiaY-3j8h;
	Thu, 23 Jan 2025 15:33:23 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazAb-0000000CiL9-1zvG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:31:02 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85baea70afeso236732241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646260; x=1738251060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN/9t8eXBgaIlZnwRxNux54CYSOA/PQxsbMhs+U3oPg=;
        b=XEewMawC2uxLmtZkytFQOLPOdRgN7vZLynWgjfLJWNoQ2v5zYqwk8x3qdzj0EteKB5
         rrtu2lejKTfycWVjwtZttLwcjJZfgHAfuHzzG9SgBOd+s+r8s8sOFC7Vn/4URShWs1yT
         X8bMv9Qu5BPSfk13BDnmiIwexj1bVWSM1zqEmOA5oZh1jyJZVTL8b5GFRDgZVrIljKGC
         V/8w6mWkO2ocaqk0C30QZVP88OsseQYqxSyClqeHa8y2sM0QnplHpvt8rtzn0eCt3Lw1
         wWHTJ0/5Q127MahiJmNQgl92lNNHWagtC7JSdjj4FYGNwrFOgdqHNftaNdaiOusyhYm1
         uYvA==
X-Gm-Message-State: AOJu0YwbAdnZIGsvjbUccL4OrXB6DTpwzTjI/oWGQAkKxh3AgAAusstj
	hTwQKSw0jGMgOK4SuC7aaheEuT7mLhzpkhnM8htSXwAZdWeiXShKnj/Mm1fV
X-Gm-Gg: ASbGnctABNly1wp+0f8W7YYGswvcPjPrf0neaDPchrkCBxI/W1GFhJfZ8qkVwbkilax
	cKubTzLzgTz1XjhnZdi916PevkcOi7hGZxwbqL+lmi209UrFrrNONW/DS2HJ9oMe+tiM8v/43hb
	+ejzvBAVltkv83EWBd00Fk1YDTIirOXUrmq1G+nRcn+PzOzQRvXg79T7nCvxbUykEdB2++hHxm+
	bVi5n2f1MV32pSw5a0zpABtVFQuZGbr0Ge7T7wFUmLDWOTFVcWyJgwot787TJFXS6pGLiNEjpCC
	1Xj6hKylfAqqw2a0cxUtiAgg7P578TvDIWWCigoR4So=
X-Google-Smtp-Source: AGHT+IHdZey0a4GgqtnyT54i2tduDF0X2qPvfAshWBXLEmQkFxSJHUHywcOIkbUgn0hha36ttF1czA==
X-Received: by 2002:a05:6122:d22:b0:51c:c23e:8cd3 with SMTP id 71dfb90a1353d-51d5b253f42mr23338865e0c.4.1737646259661;
        Thu, 23 Jan 2025 07:30:59 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea71de3sm10530e0c.12.2025.01.23.07.30.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:30:59 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c4557fce0so217115241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:30:59 -0800 (PST)
X-Received: by 2002:a05:6102:3ec9:b0:4b1:1b24:7241 with SMTP id
 ada2fe7eead31-4b690c3a394mr21772836137.15.1737646257660; Thu, 23 Jan 2025
 07:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:30:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOCexS14ZSN+CsH_ZxY5idiZGxMAjf1iOu8=KgKJGQZw@mail.gmail.com>
X-Gm-Features: AWEUYZnagvprOTPn_RWtx6AJwf07Qm7tKl2Lpn4NkCZVtWnZKkLl_b01qKZRVWk
Message-ID: <CAMuHMdWOCexS14ZSN+CsH_ZxY5idiZGxMAjf1iOu8=KgKJGQZw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: spider-ethernet: Add ethernetN
 aliases for rswitch
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_073101_515540_FE52B0A4 
X-CRM114-Status: GOOD (  21.28  )
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

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The rswitch has three independent ports which each can act as a
> separate interface with its own MAC address. Describe DT aliases
> ethernet0, ethernet1, ethernet2 for each rswitch port in DT. This
> allows U-Boot to insert MAC addresses from its environment variables
> ethaddr/eth1addr/eth2addr into each rswitch port nodes, so Linux can
> read and use one unique MAC address for each rswitch port.
>
> Note that it is unlikely this would break existing rswitch driver
> operation in the Linux kernel, because as of right now, the rswitch
> driver already calls of_get_ethdev_address() for each port to read
> out the MAC address out of each rswitch port DT node, and if that is
> missing, it falls back to MAC address settings read from the hardware
> itself, and if that also fails, it uses random MAC address.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

