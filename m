Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C17EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucvdGfSAD6BNiqV/MexDFRF6BGv69Ix8outD2J2Fl5c=; b=LE6toV8/WIEN5fFI0keJ1/Ci11
	xYdqxwsqourFMgF04E2P3euBx+XXjcuaPVWHQAbzVhC5CaDJir5a55cv4MWkcGXwATOTKtir5Lm2p
	F1tqFAkph01rdAuTHS2B/mzuE/eH5BUQjk8j/x2bDmzrjsOC+va19tI+gPYE6xPnrqp27G+CAprGy
	8TcJXkVdafYSr4O4a9v61vugQYpXX3+2RhT63qpdbLI1YqXXH7CapynWoCVSrtlSwukBO1S5Bss+d
	NKK14/babRmA5hlfn4MAnx/cw4KD9rq/lWPf05ksU3yf/OBUtSBcCRmlZ1vPVAAuqPVzHMrOsufz3
	H42xAIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu7I-0000000CPl8-2LZa;
	Thu, 10 Jul 2025 16:27:24 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrj2-0000000C1ey-0GnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 13:54:13 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-717b580ff2aso9703467b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752155651; x=1752760451; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ucvdGfSAD6BNiqV/MexDFRF6BGv69Ix8outD2J2Fl5c=;
        b=kQxNlCjtyPtUHAKgpTR72I01PT7H82Gh5v6LHU5yP+IBUK8D1qQyclM4UElx85PW9X
         wVedg5dwwHJ0124OVv2kS2UHRnfZ1QeuIhR0ICD9E/nUsOIZJLw0l+Ot8x5Irpxuks4R
         EEpf0C+G88TDOwltFwP4pxOj9mgFw1ZhOkiyKZPHa5RCjuKngHMlgwuAC7iYthBnwsct
         UYulsAq8656o5MrI/ZpIMW9fNymemKBn/zKQmzhoiEaK7Dwz15MEsqVSVk2Rt1Pu364J
         WjJdvmnNewLAq64YSJt3iA0JJMx9GpPEr3GMFxPzhEhGSEGh7TL18b7foqHBm8+/1Zo9
         FZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752155651; x=1752760451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucvdGfSAD6BNiqV/MexDFRF6BGv69Ix8outD2J2Fl5c=;
        b=GbB/LpCT+xFI6V4qB1wl2ltUMdWh2gV/0JRMj4WsxbyJXBhSf3B1XVSnDuFj9PEWwf
         AZThPrmYvKVXXDKy2LIO3QUlvC6bchug6Sr9Ik9zQS2xP6BLMx79POFj7KcJgHUdcQvd
         n70fF9gPCVoht7s+5M0cMUvxHQa09Qi87iKGMGC0VCfbSlkaNpN9ZjYegAarS1ykL5mX
         dQtM45JKtYAdT2HwOFbeKLyu9TRL4Ctp2bK6whfThhAW+hZmnWFMmL6LkYxHjFgp/dOC
         Y+UG6HRaoH8ScvE6+hOCrvXx1jDMKhW0voUVhD+ms7Jhn+Qg9t7On4o4HA1prnK9m3vg
         7g5g==
X-Forwarded-Encrypted: i=1; AJvYcCVlEm2KK6hE5E0cnO1bbnmdpNCJa2q473jSBKwESYejrgHpP0gnhUT+8Zx/Np5l1kGTGDT48vnpZzIqEQv09X6j@lists.infradead.org
X-Gm-Message-State: AOJu0YwfLN7vKq0vBiqvUCQ3YWwdbyXEc63GxmrcU1F/nHlcoMa9+ALr
	U1YKOd0W6zPLyADevuaKfZZNc5uA4vTG+nT9ofkHOp7SsmY0Q7yQGTRibYaEYPUSpZvEvhhSddA
	Gq+HyevDzeCspgg1kXLVQjMokDWrWMW0=
X-Gm-Gg: ASbGncs40Rt6cMRDyeKQW67ctD3N1A+jtDKix9lCpXfmSH3/8GQGI51KOjZpecFyk4k
	Gy96AzlVn/aTns7yoOtsPU5ANc8bvi67TsHvRCJKWBqC9w38AaYDA7z1zHQOBu2lXJN28yON6MF
	MWSnYpssdChEfEq6UBewNwxskVyMqNnJQVYKMoG4A0yg==
X-Google-Smtp-Source: AGHT+IGEs6mjRSoRv4DuwjhMRI12lBJa8IqS+/Fzcgdccj93qN1nI3jcEoogDoLBGHOtc2jgXEbMvX49hnrkdMtBpEc=
X-Received: by 2002:a05:690c:6103:b0:70e:7ae4:5a21 with SMTP id
 00721157ae682-717b16a5e4amr91278037b3.4.1752155650931; Thu, 10 Jul 2025
 06:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250709220714.85697-1-stefano.radaelli21@gmail.com>
 <20250709220714.85697-2-stefano.radaelli21@gmail.com> <9b503f65-5c8c-4f04-a1b1-40d7a1202e8b@kernel.org>
 <CAK+owohgk3CkQRv_PBDWXh44X2uN3p8FWBU2t9VtmO-xzOKTow@mail.gmail.com> <6656b2f0-5258-4f23-8988-567a7b598497@kernel.org>
In-Reply-To: <6656b2f0-5258-4f23-8988-567a7b598497@kernel.org>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Thu, 10 Jul 2025 15:53:55 +0200
X-Gm-Features: Ac12FXyh1DZvJM7tmmJAkdYGtcey-gUnTnYuleZqhE3wLHbYgj5zc8qvxVjp4t4
Message-ID: <CAK+owogfXDNpjT5Ywcvjaegf0H8-pS109039WadhxHXHbe3GSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_065412_103155_C46F65CC 
X-CRM114-Status: GOOD (  12.09  )
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

> Then why do you define it reversed here? How this som-factor-processor
> is an argument to my request to use som-factor-processor?

I apologize for the confusion in my previous email. I made an error in
my explanation - our compatible strings actually follow the format
"processor"-"som-factor", not "som-factor"-"processor" as I
incorrectly stated. That's why our compatible string is
"variscite,am62p-var-som" (processor-som-factor), consistent with the
examples I provided of Variscite kernel like
"variscite,imx93-var-som", "variscite,imx8mp-var-som", and
"variscite,imx91-var-som".

>
> I asked to reply with mailing list style already. Why are you still
> top-posting? It makes the discussion difficult.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

I apologize for the top-posting. I didn't realize I was doing it and
will ensure to follow proper mailing list etiquette going forward.

Best Regards,
Stefano

