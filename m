Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48500C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1X5Gjv7/09h4a7I6zwRasGWexPXnv1aX5JDZjLolKU=; b=qaY3cjXc2vq0w6vgMv4Q+hAyew
	bYP2IB5Vgw/uAxwxP/Cj2lQvI78cAzeUX7j/eDb5XI5ZzqA3Mb6B1zn0JegzILU9uVylAJZeGHNM7
	WcvB0wr6pqG/yo7BOSt9I0koidA3ZiD342hLA7+KDhhXYw10a2oBzIjfLA37p4mlzBjtrXYZnr0jn
	RsXOlPaLZUjrBllZhCN6wWUs6nYV/TO3Tit/jIvw7W2gf1vBojzfYDMDUOMn6NHGpDgEXs0yXyaD4
	mhR+tQTZAaOtNJrz49Abe8ru/G+ec5lnaGYVHGCcSvFlgeQso8OGfIX7T/F0sXiXqTnO4zz2iXj8F
	Yi0N8M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Sg-00000001BUk-0cOP;
	Thu, 08 May 2025 15:47:02 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2DU-00000000uqi-2vxk;
	Thu, 08 May 2025 14:27:18 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b1396171fb1so628385a12.2;
        Thu, 08 May 2025 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746714435; x=1747319235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1X5Gjv7/09h4a7I6zwRasGWexPXnv1aX5JDZjLolKU=;
        b=SK+rPyAWxE3vkHt+oo7jUg6X45NGoYzJj+7zEyNUdPNTYehBRrCHHNe1UcSoEkvXZx
         QBeEAzDCNaOK3ANrnlyts617p3cGcvQLvsYKHaaojmQgwFOGSlhuUnTltwN/1pnRv9b7
         T+eHigsiwZ/xrdeTsKl1dxQo4uUEDC4LmlOoD/cBr+12WW6yuTh9KtYqDwSexOmxP/QI
         gmmJ7jK4Emrn8gKa7Y+bIaTo4vV0kKCFlzjY34tPRe2wmWkL66EoRQBxtYO5rHLXl0pj
         fg3UpC36OmW/36f5jTRSSJ5EVukQu+0wrq+JExi/1JOEet2flr+QBXsaWANm2Pzo5aMC
         rL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714435; x=1747319235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1X5Gjv7/09h4a7I6zwRasGWexPXnv1aX5JDZjLolKU=;
        b=M+EeMjR3G0fyt7lqqQ4n+U+fkKJyxEtTezCUyGkNOyEiwwPx12Y/psWZQhf+P4igIM
         tGvQdrO8Tnsnqe4r+WuX2u8eI+dS82gWJpXpWEVRJjZ77eyn4DtyhpSyNEr6ZeryDnJS
         zEHzHXO2opNCg4LXS5AYTHpjW18LlMYn1ch6VShrID0TnHdlxU8jJf/lvW4xp/y/bQti
         oblnv4EP64aXybImdqfJuRZMPsuriazRE8AAm0oPWPaIBgS197HOtb8ZAa82cGQQ4SnS
         M20Bu73+5JHpjELkS7937k71l0FHI1x5zsY3tRSEVNCBkM+AeZJblVi9DlWRQJuDVrFG
         0p4g==
X-Forwarded-Encrypted: i=1; AJvYcCVxs3xVNcaOqtUWFVlq5flyy379i6uJO4626sBY68h7ovN1hLE93LMdAaP1rTrDt8k186j0alYFTvyOYeh3ivR8@lists.infradead.org, AJvYcCXWIhxZO+kPQPZ4v4P39g+V62ub8MY1wucYqrOZ9zQ9+3BhFbnTWUEnXsrwaCzLOTeZhT0HLlEhe1/YvOKwTwxuPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCAhoDbnRKcsmivEf7xnFCZRs4xWavtBAnoAJl/y4p3ke60iPM
	qxnc5VkNOE4By9k3BaS8ePNF/gQTfHhxWP1Azd3jrfarl4AM18Kr
X-Gm-Gg: ASbGnctAb0aUVgSHHb8D+I18XTV6Q8+Ai0kvvwCDSTc5dJi8C4inpf4eJJ56CAUoOCT
	oLjf+7CApUD7xcuQYKMeS8gOZdY1JBeRf6q0Xyt7eJGLXA8aai1LkErU4YPftrGhGcqZOi6fWPc
	IiABwgVm2T1gAz727V5zOfQmiRDc1HtBfK5+rWkSTZjroGPJ4VMnKiFkN7YZxcWsrHVQK4WiYUQ
	2Uv01dQ/U9IhxbLkJbcGNa22p/UhEy7GpCoS/8l/qWG7MO640whHa1UVxtJEzsYcLnsgvoH2rhn
	J8kbosX0BTXvXOsbMaly071Yz6nN4p6IqWYmeAuOcUAZPv0K3DYNIA==
X-Google-Smtp-Source: AGHT+IGX69fKV8SIz5ble6uUkvbicpRW5QmwPdXGWbWOXvCG1vLa4lPWJgZNrqXL8Q3jFUOwyoJcKw==
X-Received: by 2002:a05:6a21:6d83:b0:1f5:86c6:5747 with SMTP id adf61e73a8af0-2159b05448fmr6089580637.32.1746714435380;
        Thu, 08 May 2025 07:27:15 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b62502sm11383288a12.32.2025.05.08.07.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:27:14 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: andy@kernel.org,
	geert@linux-m68k.org,
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
Date: Thu,  8 May 2025 21:26:48 +0700
Message-Id: <20250508142648.7978-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250508132659.GL3865826@google.com>
References: <20250508132659.GL3865826@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_072716_737889_1F11D167 
X-CRM114-Status: GOOD (  46.21  )
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

On Thu, 8 May 2025 Lee Jones wrote:

> On Thu, 08 May 2025, Andy Shevchenko wrote:
> 
> > First of all, I just noticed that you excluded Lee from the
> > distribution list. Don't do that as he is a stakeholder here as well
> > since it has not been decided yet where to go with your stuff.
> > 
> > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > On Tue, 29 Apr 2025 Andy Shevchenko wrote:
> > > > On Tue, Apr 29, 2025 at 8:02 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > > > > >
> > > > > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > > > > >   and update the title and $id to match new path.
> > > > > > > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > > > > > > >
> > > > > > > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > > > > > > Thanks, no.
> > > > > > > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > > > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > > > > >
> > > > > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > > > > > > but...
> > > > > > > >
> > > > > > > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > > > > > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > > > > > >
> > > > > > > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > > > > > > It is not just an internal wiring detail.
> > > > > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > > > > > > pins control 12 LED dots individually through scanning. Each pin includes
> > > > > > > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > > > > > > required for proper operation — it cannot be treated as 12 completely
> > > > > > > independent LEDs.
> > > > > >
> > > > > > Scanning is really a detail.
> > > > > >
> > > > > > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> > > > > >
> > > > > > If this is used as a power LED, SD activity LED, capslock and numlock
> > > > > > ... placed randomly all around the device, then it goes LED subsystem.
> > > > >
> > > > > The LP5812 is used for LED status indication in devices like smart speakers,
> > > > > wearables, and routers, not as a structured rectangular display.
> > > > >
> > > > > Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?
> > > >
> > > > I have mixed feelings about all this. As per hardware organisation it
> > > > sounds more like a matrix (for example. keyboard), where all entities
> > > > are accessed on a scanline, but at the same time each of the entities
> > > > may have orthogonal functions to each other. Have you checked with DRM
> > > > for the sake of completeness?
> > > > Personally I lean more to the something special, which doesn't fit
> > > > existing subsystems. Auxdisplay subsystem more or less about special
> > > > alphanumeric displays (with the exception of some FB kinda devices,
> > > > that were even discussed to have drivers be removed). Also maybe FB
> > > > might have something suitable, but in any case it looks quite
> > > > non-standard...
> > >
> > > I understand your mixed feelings about where the LP5812 fits within
> > > the existing subsystems.
> > >
> > > While the LP5812 uses a matrix-based structure for controlling LEDs,
> > > it is not intended for displaying structured text or graphics. Instead,
> > > it controls up to 4 RGB LEDs for status indication, where each RGB LED
> > > consists of 3 individual color LEDs: red, green, and blue. Based on this,
> > 
> > So, you probably should have started with this. As I read above that
> > this has to reside in drivers/leds/rgb for colour ones which seems to
> > me closest to your case. On top you might add an upper level
> > management to prevent users from using patterns whenever the LEDs are
> > requested individually. So, this driver should represent 4 RGB leds
> > and, possibly, the upper layer with those fancy stuff like breathing.
> > 
> > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> 
> This is fine.
> 
> Just be aware, before you submit to LEDs again, that you need to use
> what is available in the LEDs subsystem to it's fullest, before
> hand-rolling all of your own APIs.  The first submission didn't use a
> single LED API.  This, as before, would be a big NACK also.

Thanks for the clarification.

Just to confirm — the current version of the driver is customized to allow
user space to directly manipulate LP5812 registers and to support the
device’s full feature set. Because of this, it doesn’t follow the standard
LED interfaces.

Given that, would it be acceptable to submit this driver under the misc subsystem instead?

Best regards,
Nam Tran

