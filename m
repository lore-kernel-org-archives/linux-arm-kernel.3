Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B736C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=; b=z+ExtaTHCL/aifJxWc9NEUfUSb
	Rchf2PGbeirCPqzDVeoyHuzXwmHBFGQDQXqS5eKHb3iW7NH4SXCBDzRiRmey1DC3MteY1atWE/4zW
	GXFeS1N+hZwx5ogPStQKU+7SQVysoP/uzY+IWZNO/rFrPUY9rSGbMIkqh8a4oGSP+u3AgZIupsQlt
	xDrzt/3BcwArVcSTDO4+5wn7RfWiq3PqVQ3XScA08V2qMKDmAnEnFQkKMNm8O3SqQeSdKdX3XDVdS
	jFRlyixXahDLzSWfYaqqnGxzcmotQkLn8VA/k9IHSZ54ell/eKb19a2B2n6uLg3rV7UJtakW3HRwD
	Vtzp6hQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICm-0000000FT7r-29Ah;
	Fri, 11 Jul 2025 18:10:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHoP-0000000FRBO-0pmU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:45:30 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553b3316160so2452679e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255927; x=1752860727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
        b=WBDbfPHekSEPpF9HqtCdcFrEtlMu4SedW037rkDFQv3UOnOlVNUJ8G7y/f2WKbr3Td
         bR8ipQpeiA7GK8VLFNsyqY7WUgxX76TCs/3zw7XxRHPcRmjAwysftfFDTM0O2078Kbd+
         4yyh/Whlv5PJ3sQvz8eUnDbsejYOBBQei7qt7d9Obn7aClBfFMF3+cAsoP24XBl4fksD
         kAgXLYX/8TIT2mjYmRCwbfIGHxR1YuDKKnmJg1l60zhyOdlYmHHWLjHvaoE1+n8lDrMk
         /2umGR2jjV9rXBdNyi0KJJbWYJJJuAKQTZ8VBV7CQ5U/D1S+r0TcFc0sZU98QxI6AOHi
         8kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255927; x=1752860727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
        b=kSGs/6XToNxKOCMjJobPK+XaxcWtDdRWy7jkMt4gFg9bg8CsNWwP5jr0shA8Uap/ca
         BBg351m4P8yFojTWZ7kCmlpbANPWlULzypZn8xfk9gIwsP1M5RWURPyoF+B4tDJ2tmpM
         ckXc6bLGjvnSVfMMv8ZM/OBnBeUFuS+SGEbMzh+JJLh3ppR/VfPq6j3EbT82AsSvLiJE
         oOXy8W77d+uj8lxEL+vj2Qqdu396znSd5kJeO3zLp+ZyaADbM/tTztWGlV+scGDCwgLD
         cyKM58AdoIYWSW2uECwjlP0YSKTMawVkDYwcGTo32dCsmd4j36aihiIIp1h7/zC0P28o
         Y2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3VWJmIE88FXIymhMsV1EaAekOlB7Y7gf2Bbd1HKgqpDsERJzXQ8QaNScmHFuNRooOxh3yDmDPfoj2s952mx2j@lists.infradead.org
X-Gm-Message-State: AOJu0YzT3QRqcszz6k7eMZgc7BF5JR+hTJqVekTaL/+sBTBpznU0saU1
	IGELvbo9ErG9rnuQEHuaKc18NQhNKp9dQx4B5rdA2wXmTXeX8WetPuo3VGMI8Xtn13rOK0J9Z4D
	m87pMr6KYqXFF4V/XV+APC7Fg51Y/30MsrJ3yc43jqw==
X-Gm-Gg: ASbGncvCf9I767UWTMhp9Ja8wNhiQeOY1pboyy2XMcQBo1m4i4t71rF8oC+nXGrNGYu
	IE/ISkqAO5YN68ElaP4QfrUI0RnzFqTzzCeHJahFSYRNRD7KkB2C2w/8VWD6No5xA/MSLb5wA0n
	0i3OCnWmMynscCIeX4Z10C/TysZQEyObScJF0jG+DdKLOUXV2Y33z4j2waB+oYf7dm/kmVlWun2
	tvUdMbKn8l+AFaLaA==
X-Google-Smtp-Source: AGHT+IFZDCZTlE6gWaEB19mO+GckYjvcVz7Jadiih65ETG/CCRys4RjtiQYLjKpiBNN+Zotnz3hQQ0D3S79xjWv4t0M=
X-Received: by 2002:a05:6512:32d1:b0:553:24b7:2f6f with SMTP id
 2adb3069b0e04-55a0464f653mr1135322e87.51.1752255927288; Fri, 11 Jul 2025
 10:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com> <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:45:16 +0200
X-Gm-Features: Ac12FXxij1ZPhhWO-gI9e94mzHRwj1K4FxFxtD7flD8pQuiwVzPSrPB2LvZpGlg
Message-ID: <CACRpkdbpXPXFgRTyAG2MeZvDp7wj32yQO6eRRMp4rQ3sCbQ+Sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_104529_234219_D824AE53 
X-CRM114-Status: GOOD (  10.04  )
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

On Fri, Jul 11, 2025 at 1:42=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

