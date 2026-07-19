Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82142C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hviuhQxk9tmkFzbE+ozJvymbpZxDhoz38nMQh318+So=; b=pQpKsjhGR82kap0KxGJRcpq5Xf
	XwHOMlyEkpU2la/87kvDzQghh8xtNNLm0poKh5HByAmPdq0XWLNU6LD9NqbW15JNxpeThNIxBz85c
	EAWWfcZv0+JCVDBEhZOYjqnn863PJkc7SSD05ZUMNdEmVK5hEUDf1oPJ2eWTCrlw6JBcgNtAB967+
	HXaRRwxws5/+0vybB0q+XQ1QhvsNvLeJYF6gHeKYuyvPgeJeoXe0R3ONzbHbOaAByLTPPwBklKxsF
	ROVYFpER683zYhZYDEO+GhxeUMeBwJH9USofcnvPdBU8r4M7a3rZ/jxezJaAWXWQzQvQLLAJi6PqZ
	4hoF7CBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlSBa-000000053GH-21YA;
	Sun, 19 Jul 2026 14:08:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlSBX-000000053Fw-2QG4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 14:08:04 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so6938546e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470081; x=1785074881; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hviuhQxk9tmkFzbE+ozJvymbpZxDhoz38nMQh318+So=;
        b=gn/oWsYf5Tlhh1afEZ5HvRNH81j0AlTcw6xK6Z78tFcS3AV/Kftc17Y9LBq1sk6eeU
         4dY7rS/kytQK+uiQ+jfMpK28LBHStgaYpnFW5CKsUutAlgEyMj0SxsfBpN/bNBBcrgR3
         TH2PNi41rz1qVA+B6GbV4A8OrIFDh+0cDdKZ6ZkanylEfTTp81Y6cWMw53QZC15vJiBz
         t0T7gg0suPlMs+gwhMyipU0j3r9hNXYaitDqwNLqEocS5B75ydlGT6+EH2gHNWkpI8CP
         VYc3Kk8JSekBA4RXpN+zAumFe/9qf1ZRLfTbkrq4H6osYoYpkx1TyoTAyX7HKfA3XHxc
         +NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470081; x=1785074881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hviuhQxk9tmkFzbE+ozJvymbpZxDhoz38nMQh318+So=;
        b=tHTBvQ1wLiG14MK0m7tt8d+B0j4p1vo95qlU9SvcKJ9DH+NyArTixhe3NDn/rF+OaU
         /iWS+63HwCxnvK0ZLqD4iI7AykqugPwION0x2msI4tAG75QlLxPV5Uj7RRvubd3zkcJh
         3JgSHq6ZdOQsClA2DUfEpyzr3WwOO5UzSbr1EbCDK1tEN9UzsC8C4LCov7hG0qV+gB+n
         Bl4nGUITLv6bCqlJNGVYhptcC+P/j/xLk9mcQuETChdcT3FjNOznOsJp6/9Ig5ROcAY3
         GdTfIZzEXRwQp6TKU7HTCcFDNeuAhVSU3OaVarTXqwbxAchMX1omRo/w5KxTJtMmFVwZ
         r58A==
X-Forwarded-Encrypted: i=1; AHgh+RqGXS47iLPyUkimV6LpULP/3CyrOdmNciRc4pariCIVImfJ2GwStl8WkSb6yNfOHUuRvFQ3qJ0Ad4SdYvyozqAf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy55v7mSeL5Bxcy6dVJrvU4WvMGlfO91IGjext2n58oRhdPs/1l
	yAqqQ1WQmM+BgDjIRBbAkni6eWFqZAK1uNm/WSVBnjWWni/g9H4O7Gsj
X-Gm-Gg: AfdE7cnJlDZMae6nkovupsPej4g5B+ulVS58zz3gVCqoOTR+H47oF38NjmrgW3hm4iE
	bebtbke8810f8asczXG6ExNdbaYcvCT6aVb2iYX1hKBfmswpl0ksMJ2y780bGkaLQncfUJk1TW0
	vWhwzZXr9OpkiYhSwRViVNLhUcYvwWqjlFts2I+tjoTJQN0d52KxXL8NaX+5BwO1cMcqqYOaB0o
	yKTGm9Lg3Z9yc8pKKclezGXtzlGOKiu9YpTrRZQ/rcjqEuTQtuY1yKHG+4/9SinPxYTDAp6Jgvb
	8sqRbQtpeIIm71cwFuQq2pLITyjiLXkEOH8xXZM9J/hCCji7rMjB75uybnBWzCj5LaSZw16N10P
	1ztcmCnw+6XcLtatmIIJkMi7lhl5VYx4I0n98JhVJ7SrZEAFjKjcgSgb8jDOJjphSw2vSV7EUEx
	HnNq3hjt5BcoafzryhqVXoBDjSdVslH1a8qI47jt4=
X-Received: by 2002:ac2:5fe9:0:b0:5ae:b489:b844 with SMTP id 2adb3069b0e04-5b28f9acaf9mr1417664e87.32.1784470080335;
        Sun, 19 Jul 2026 07:08:00 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e2480csm1794315e87.72.2026.07.19.07.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:07:58 -0700 (PDT)
Date: Sun, 19 Jul 2026 16:07:55 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/7] i2c: mux: add idle_state property to i2c_mux_core
Message-ID: <alzaOzSFklfpN18u@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
 <e2d4fdf8-4dae-43dc-95ae-b9aa1884fdf5@lysator.liu.se>
 <alfZYOKCjf6CKN6i@gmail.com>
 <c0b47180-d3df-4b58-9311-d02734213716@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0b47180-d3df-4b58-9311-d02734213716@lysator.liu.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_070803_639425_44EC9FED 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Peter!

On Sun, Jul 19, 2026 at 02:39:34PM +0200, Peter Rosin wrote:
> On 2026-07-15 21:02, Marcus Folkesson wrote:
> > Hi Peter,
> > 
> > On Tue, Jul 14, 2026 at 01:29:01PM +0200, Peter Rosin wrote:
> > > Hi Marcus,
> > > 
> > > Sorry for the very late feedback.
> > > 
> > > On 2026-07-13 09:19, Marcus Folkesson wrote:
> > > > Muxes treat their channels differently when idle.
> > > > Let the mux core have this information to make it available for
> > > > internal use.
> > > > Reuse the same state values used by CONFIG_MULTIPLEXER.
> > > > 
> > > > Possible idle states are:
> > > > - MUX_IDLE_AS_IS: Leave channels as is when idle
> > > > - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> > > > - <n>: Enable channel n when idle
> > > > 
> > > > Default value is set to MUX_IDLE_AS_IS.
> > > > 
> > > > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>


[...]

> > I think I will introduce a few defines in i2c-mux.c then;
> > 
> > 
> > #define I2C_MUX_IDLE_UNKNOWN	(-1)
> > #define I2C_MUX_IDLE_AS_IS      (-2)
> > #define I2C_MUX_IDLE_DISCONNECT (-3)
> 
> Hi!
> 
> Please keep AS_IS as -1 and DISCONNECT as -2. Using different
> values will make it difficult to get rid of the use of the
> defines belonging to the mux subsystem in case the actual
> value has crept into some .dtb or something like that.

Got it!

> 
> Also, I think the right thing to do is to put these defines
> in the i2c-mux.h header so that the drivers can find them.
> I assume .c was a typo?

Yep, it should be i2c-mux.h.

> 
> > [...]
> > 
> > struct i2c_mux_core {
> > 
> >      [...]
> > 
> > 	/*
> > 	 * The mux state to use when not active.
> 
> This is not 100% accurate. The value stored here is never
> actually used to set the idle state. The idle_state here is
> only what the driver has declared that the idle_state is.
> Perhaps word it like this instead?
> 
> 	* The mux state used by the driver when idle.
> 
> Agreed, subtle difference, but...

... even better. I will change to that.

> 
> In the future, drivers (most of them) could be changed to
> use this variable to store the actual idle state. But, as
> mentioned, that's not easy for i2c-mux-gpmux since the idle
> state is under the control of the the mux subsystem in that
> case.
> 
> Cheers,
> Peter
> 
> > 	 * Possible idle states are:
> > 	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
> > 	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
> > 	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> > 	 *  - <n>: Enable channel n (starting from 0) when idle"
> > 	 *
> > 	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
> > 	 */
> > 	int idle_state;
> > 
> >      [...]
> > };

Thanks,
Marcus Folkesson

