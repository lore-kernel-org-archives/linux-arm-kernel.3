Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5141DC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=; b=GW630TxXFcggZRHrq3kzBCfguu
	nO1FGIEmIUr8BQrt2k4YYyqRRWSq2x8gnGlfy2J6bqle0mhYfnZBoywVSRW5VpL/rH6ENFhl6MlP5
	ooANHzvcqJLxXPY9BfQ+kDBihPqR0JMk1KBWszv53Wa22juepUzoWqJYN9SZK+Tu0T+Ymh8FwBNZ0
	sIAYbln4sAnohjqATqFkm8XUQ84Ci2b3oExkuP4UU7PvVlvrZfAjMPYrGTs+U/lIukdt3CpbNazT7
	htr+0AULgtYmCIkHg+Alk8Ut6sXxghemIHTg5GJffvvnoPj1lEX4aipGnFaukU1jhKJd3ZIJUZgo/
	TPkskWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNsz-00000008UIN-3a36;
	Fri, 07 Aug 2026 16:57:33 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNsx-00000008UHY-2tn5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:57:32 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-74a9ac9cda6so1856495137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786121850; cv=none;
        d=google.com; s=arc-20260327;
        b=jZZ/6ILgfb/7emyUxtJOAeXQtIx/F/jhMY3RLtDC6udixUi/gC8+WpjuraSXI9vE2j
         0K55C5/MEMnSwhPTsT4CyvaH0QacIx650jB1Zf7eaellxT0OCX30oAkMOmwrG+ExCFuV
         0RIPVrvwMlOsxu61l9KQCokWCDJ3bbjKjqAxh7JqZQx9/LdvRdL57JduY5rqlWEDLSpY
         l1dAAL0PCuWfHt63pVyJr6UvFArIJWPDTHH8KihioJMXHECpNMysgF5MClfltSMx8Nf9
         dqWbGbtAVLQbzV9cZlAUWUR7uul853IOrmNnzpZvc+eaLvJV9xMATHr3fpOqhXAhg3Sp
         wYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        fh=en4XyQth78xkyB5bgO5sLRaLJ3e/JxQliyxBW7/84gM=;
        b=mnW/ffmNRImDzCz+db95aV+/VnEI/pZdak9XqxrEni5R4UE8yicQQBTaPnn6NOe9fI
         LW9JJSJrXl5zN/YBAidEiUpeiEFfmM59XfjBavSTUG0u6d9B6ME86jdvVAcai/HE2wvk
         aL4g3PRxSoC4/OplJaf9+hg8cOL9rx8oX2dBl2XaxTrqy6cR1uv5kLO5evPV6n4F0R1c
         LY8u9auYakZLnD1dZqaU9gKbG9qcnPUmCNt8k1/N42f49XgJo5/nessMZdHSbytw4bhg
         HF/0RN/VKQqMkghdV9flD8cobh65jMrzpWyhBF01xqaWtpPN84G6yDV7xjY/Z5nTcU2A
         ydNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121850; x=1786726650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        b=bZ3mX8aCF1SXGPk/anz7izYzDp0wJaGUgSr8+xzcWyQwdFx4s/DNkVdQPQ8Hx7oxrv
         twWNitNlcRDTGo6vaR5wxrPpvN4vUVnunOc51ml9zwSPZ0PLVI6sTBrsyRrwlArT6qq7
         QT6cb9RqK8gE0kLm8pNyjFJCIWNbES5i6rCQ01cocnc+iCq406NqfpM/d+vjGh8OYQym
         h0hNcNkU9z3vczPPI6kuzlrEY4yKeqelIFLslGU7nzYiLGb9X7cNpuW40SycUaC90qgM
         lVFvy1bkNshUsLtNUyyRjQhBYOaARUGIMN7qe2xXSBJcxobHkN+aYtSvM9Mi4P5tS+b6
         PKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121850; x=1786726650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        b=cycRfWXwGMYbe8kG0ZwWUVskgjq5S+DjvyBzQgQ+lW1/bnaMnqu7cojjnREJ/KlNX8
         bX4OaXQseEx2CDv2eFUJx8bqeW0cYhFyG52oYsaliNwxWE5I4XBMh2zvsQ9j9bNJFi4b
         iOPDXBYCaOE0sFxX2byl5L4PgK09QmVK3cNf83/97EbJ5BsiyWxEFds+lQZ5kd5m8Bzi
         rN7HsXm+1i/mfocbUAnGfCga7IbeXvsrKA4HzvuLUMGtjMknJMk1Y18Ey6GwvGXWXgSO
         6uVU+KI0mS7S63xpt18TGFj4ETFhmI6QTn8BdxYovrLaVtcLemsmJFs4chSQMps+yap8
         qZdg==
X-Forwarded-Encrypted: i=1; AHgh+Roo5Z64VrZ7ExuGSs6EYh2BRGDU/tPpC79Mnh1DZyp8Sd8Pkq6yRc6wAP9aSx6n63yUd3E6+yOLNiHt3fNJE8J8@lists.infradead.org
X-Gm-Message-State: AOJu0YzVQHdEHx+076F3sSQcNGqxv4IQULspfV79aRkQRrhMLaZCF1u2
	TrzfoUFwiUeGfkHmZKZEP9u+dYbXJJuCFsxh+HehW5qDDZJji04qyHSd074tjavVgP/Qv3Jjr6U
	S9fHvXAbt3ZYhsQpmAs+gdddU/aZ+K5M=
X-Gm-Gg: AR+sD13tM7zfGaIFCTgqhNmV2O+Q/Ty3P9NdTnOMhwy3hWTBPOa5lB7r1Dp5LSo3qBj
	TJsVaKbvbTDEyVgRIYTGiyuqfOItF9bK/lHkW+GFJOVsTYKnM/ylk7ZvX/MDyngpubW5yCv9F5v
	7KfxnBpONFdgWIonoTXjNSiSeG3aTqXO7ufpqe0uivHlp710q24z0bqE7QZsxaHIXu5zbTm6EGr
	nK+r6oI5XtC804yginvNRZjwi6cBpTepLuIddj64dQ93BUDAVWr3iJLqdpHyHSmJSPv+icyjYv4
	a+X1hA4Uz7SaxGinVrGs+hDh9WV+cGu8HH2YsMvNEuVAuLD79G0D5YoXFKmeNZZL5YswrCWRqof
	NjwDbxyL8SgpHu7MqPaX9Y1NdN5wWo9n2J1LtWw0pB0q6IRFu0gjKgsjHlfs/p0teVjEbaWu2V4
	SQs1IxYIC0Ym5sU/LxrgTNjjLx2ppu6YT9rqAZ
X-Received: by 2002:a05:6102:390f:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-764e4f2985dmr717652137.3.1786121850298; Fri, 07 Aug 2026
 09:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
 <87ik5mav6x.fsf@bootlin.com>
In-Reply-To: <87ik5mav6x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 10:57:19 -0600
X-Gm-Features: AUfX_myfeWEyYh7Y2JNZ3tcJ-zpan6IsdJA8dIqxxvbXvmFsYYO1pP5EnmrWVAg
Message-ID: <CADvTj4pHOpKfNCoVcfDmtCuHh2F0H8e+_AhCwcSKG8xosLpbzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_095731_737510_7E78BFD9 
X-CRM114-Status: GOOD (  17.05  )
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

On Fri, Aug 7, 2026 at 7:58=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi James,
>
> On 17/07/2026 at 11:33:56 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The sunxi NAND timing solver currently applies the original A10 NDFC
> > timing characteristics to every supported controller. The H6/H616 NDFC
> > uses two internal cycles for several setup and hold intervals and has
> > different delay-field encodings, so the resulting clock and timing
> > register values do not match the hardware.
> >
> > Prepare for per-controller timing data in two behaviorally focused
> > patches, then add and select the H616 characteristics in the final fix.
> > Legacy controllers retain their existing setup-cycle behavior and delay
> > encodings.
> >
> > Tested on an H616 board with Toshiba TC58NVG1S3H NAND.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> There are a number of checkpatch issue. Can you please fix them? (except
> the camelcase one which is fine with timing names coming from the ONFI
> spec).

Should be fixed in my v3:
https://lore.kernel.org/all/20260807-submit-sunxi-nand-h6-h616-timings-v3-0=
-91287b543f41@gmail.com/

>
> Thanks,
> Miqu=C3=A8l

