Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882CEC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrpAv5wRm5tVkVdVuPsn72RSEtYGripQsP5MpQKGhfk=; b=I2EsppaFLjRFTut+D6BN4A/CF/
	xsdSNpZgJ+9tgGZwvEXUggj8mVUQ/c+JJ4wg60dYT06vbSP4zW1KgmNwc9qzs0UThT6ihdvUpc1u/
	zF0Vo5avm7Bq4qTOeV8MXLDFTVrPc8SYzZvkKZcjbvMVsNf9VH27YL+Qr3jn4PluulV0jnBxtBJiE
	YUK/7+MwuhmeB0YM873d6/g+1ugKFOqz4YwwqagXIcDHy/ArjhMQkZD39KYBVzQN4t19AvHnJP2ef
	Qm1x65mYdMA4XnVQKGW1R1TmzQkdfw2qVKzBsMapMGLwtVhGkVJS/QycZIvSCOKOxA+9h9wW2azEZ
	gy1B+veQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXf-0000000GK1j-0zmP;
	Wed, 07 May 2025 17:26:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChr5-0000000GBvF-12Rg;
	Wed, 07 May 2025 16:42:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so152718b3a.1;
        Wed, 07 May 2025 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746636166; x=1747240966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrpAv5wRm5tVkVdVuPsn72RSEtYGripQsP5MpQKGhfk=;
        b=Yl0C5zZkrbeDenzwpAbozQTF0m8Ub4ykBxU+BpYam30m/u+cBhnqCW0h/Qpd/PsVO/
         87OscbF2Kz+G2CF0ECgoyU0f1qAuz308PG6XkF16Lla4kVcKByRfV9zKzmY10m3rZTqL
         uoLheZCJx4SQHf72MiWtXE8dY/gTjlyh3vD9L/lssKPiY1OmUVjY9IomP+ntcXmtiVCz
         qmM9Ato8z8Mcn6P0CYaRcvdy37x8xE7vVian58vOv+zVPX3Wn/Zu78LccAbn+IcbPFxI
         VEDmffWmvpcGLrlxOI5SUJ0zZBJ8MIFlZnWXa2e8FdV3mHryFgETv403GlKg3XJx0p85
         Oudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636166; x=1747240966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrpAv5wRm5tVkVdVuPsn72RSEtYGripQsP5MpQKGhfk=;
        b=tpi1xuqjTWbGrfrmuFV2eo8mwkIbtCS4oRKkAi+dKRICTiQ3RSw6dQ1C0f+XrjUi+p
         knXTSa2Qa45D5Fkj5qUeFdFlb3zJ4SCcw1z3WFFYwfstmGLtfvaVkcSXsvfevpsTFduC
         wy7+0F9sGa3HszVsEMqb8hvf7d0YsH5ow1b5Pf7CNjhR0NHmSwWisQ1BJEMK+Nu6mlEM
         da5uF2fHdyDD7cdrCKiznze7+JdYBoL5T2WzQigcQVlbobJm0nUxARO1gjjmygd23E9J
         iOpxLIASCfO/0J8GrImt0lT5XHJ1xV6xiIb5kS9L4UxBpwqnwvKCCP6VUZc5KWxrsNHg
         3RrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Op+EXWU38Qj9mjtDxUIvNfcHc2FLoaLof4DNYVwLosDwYAZa4MOkbg8YqLai95FBw95ctQZCNWrjRuPfKYd5@lists.infradead.org, AJvYcCXyF2ZFbfSmhzt/dQ4Kcip6S/5NPCqTqjo+4jIRaQ4iHjPnUkhy7qWoCrdSFwcketvUmfNDS6KHan98DjvP5VAiUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhUN8mGej4cOyvKLdfX88oXkWevLYjKPjhuGn2q1+EMk6SwUC1
	HFdG2rDlK2iOAPffZYkRpCiA9vofgg6aORUNAmSqNctin06rER7C
X-Gm-Gg: ASbGncv0BsKalXP0oPGIvj8HXBOoGv8CEXNaKTJLvumie96vL4bpKtGGoM5Y2S9RlDA
	O2LXGdmaNEdrRvlVQJYoe7Gen+5vfRRnKh9soU1f/K0hZ4BNHcH8WFgtAodxtHednLOzPehTpj0
	xvPeY+jJJPENvig23xQKIRmaxjjhmFDWuHOPLnpTe4h8GLj6crGO9YI5+9tFgLpcK1ZrxVUo7Mr
	6wJAsy7XVoLnSntH/oqMxH626xnjstvK90OfYPpCZt2ZMxAsCRWWo2Bm+Fn2e6RsnJFuFL9eton
	yp4wsMA+dUVBNwcAlZYJBz1fIopZ16SiLh3QT3OF4EYDxgZr6d77/VXMoa9Va81N
X-Google-Smtp-Source: AGHT+IGJIkVx5zZt6zXCROkjsSU2I7/c8Y4B6zDviETofWcquGoGsY4tXjVou0oNL4hYBjlYRPpCgQ==
X-Received: by 2002:a05:6a00:8d96:b0:73f:ebb:6cb2 with SMTP id d2e1a72fcca58-740a9966d64mr34295b3a.3.1746636165785;
        Wed, 07 May 2025 09:42:45 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1c1sm11528004b3a.6.2025.05.07.09.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:42:45 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	pavel@ucw.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Wed,  7 May 2025 23:42:19 +0700
Message-Id: <20250507164219.10083-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
References: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_094247_283524_7F69283A 
X-CRM114-Status: GOOD (  32.50  )
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

On Tue, 29 Apr 2025 Andy Shevchenko wrote:

> On Tue, Apr 29, 2025 at 8:02 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > >
> > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > >   and update the title and $id to match new path.
> > > > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > > > >
> > > > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > > > Thanks, no.
> > > > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > >
> > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > > > but...
> > > > >
> > > > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > > >
> > > > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > > > It is not just an internal wiring detail.
> > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > > > pins control 12 LED dots individually through scanning. Each pin includes
> > > > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > > > required for proper operation — it cannot be treated as 12 completely
> > > > independent LEDs.
> > >
> > > Scanning is really a detail.
> > >
> > > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> > >
> > > If this is used as a power LED, SD activity LED, capslock and numlock
> > > ... placed randomly all around the device, then it goes LED subsystem.
> >
> > The LP5812 is used for LED status indication in devices like smart speakers,
> > wearables, and routers, not as a structured rectangular display.
> >
> > Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?
> 
> I have mixed feelings about all this. As per hardware organisation it
> sounds more like a matrix (for example. keyboard), where all entities
> are accessed on a scanline, but at the same time each of the entities
> may have orthogonal functions to each other. Have you checked with DRM
> for the sake of completeness?
> Personally I lean more to the something special, which doesn't fit
> existing subsystems. Auxdisplay subsystem more or less about special
> alphanumeric displays (with the exception of some FB kinda devices,
> that were even discussed to have drivers be removed). Also maybe FB
> might have something suitable, but in any case it looks quite
> non-standard...

I understand your mixed feelings about where the LP5812 fits within
the existing subsystems.

While the LP5812 uses a matrix-based structure for controlling LEDs,
it is not intended for displaying structured text or graphics. Instead,
it controls up to 4 RGB LEDs for status indication, where each RGB LED
consists of 3 individual color LEDs: red, green, and blue. Based on this,
I think it aligns more closely with the LED subsystem rather than DRM or FB.

Best regards,
Nam Tran

