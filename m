Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D395FCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Du4B17GN+QveKazUySHoKkQedCMgGeIDGXNO9kfFt8=; b=qsjJ/9j3gzplpMVYOlXL2fJvg0
	rHUCQT8341Z4MoLm0Er3EyAaWpwgGr9UhTcazvtO6PGwSpsfymrLJvqq0kfo2p1z1Wv0i3OsRIbUb
	mZW454MlT4dBpaaMsfUNvaNRb/NeqY4XyvBFMrKbGpce50sRUb46Cv7xH9kC8YieO1YQm6iXPYtzb
	FspR+rgmbpNJB/yJ56QtRHqCVTqUVvqQ8LQ1WoylguatuBVVyawmQ9x7eV3cVMNDZYuDxwmsH8FtC
	WIggrTHxJ/CxpfsjmvIslxyhry7JhiU0Hn8cPXx7OKxo3NUMsbuqxh2ux4uqiKlKrVsmKc8210Sb9
	/XUwa79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHenV-00000002ZEl-1h1Z;
	Fri, 16 Oct 2026 10:04:21 +0000
Received: from mail-ed2-x0a.google.com ([2a00:1450:4864:33::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHenT-00000002ZEJ-1QZM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:04:20 +0000
Received: by mail-ed2-x0a.google.com with SMTP id 4fb4d7f45d1cf-6ab01685260so1351035a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145057; x=1792749857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Du4B17GN+QveKazUySHoKkQedCMgGeIDGXNO9kfFt8=;
        b=qtPUFFjXU74bVxXHQM0I/grjN8BFIBvqFy22+LywYTj5lB1zVsJmKmuxm6RDPiInKH
         dS6accCyIflu3xlGK6y9V4tgdue/B32Dkwr1vnNvZ3ag33YQVj53FnEJTln/xnkG1a41
         S4BCX2wyeliUT8Im3INx0n2Pm18HtrbMmLGitLFy8MFGU5nHRikcxLPfmgiRElg8dC5x
         t/432Ug39zssDgX1XtYl48l9WqPeh9hXE63bsvQh6JgROcH3gTXLXZsAUKAy8pNrWwBC
         pxUS2t0SJce2bbOhbla36aoMrQVeo4kCFkAEVyzIPYOn4w/1ld3tOk7z8IbwwfxzkHrf
         WNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145057; x=1792749857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Du4B17GN+QveKazUySHoKkQedCMgGeIDGXNO9kfFt8=;
        b=2EnXS1O58fGr5pz5uXbJ0U4XmWhM1/Fu18AZdHXRIoLe4J/0dmTjWMcbAQTFh3GNOv
         Gy+89y1Tu31SLiPqH+vH4ogss/NdHVwsJ9u3j/q6Uo0/QSU7pWKE5MySnGn2/s+dnwXz
         AsKyUBY9hjvOWVpvIiSmcZAlHSIWiuY0VOWJmDzNiRNRWlkFeOYC3U0ntNmy6F/AS+mC
         tXfW6Pk10Ks4Z9neW3uZWtQ8GCGut1e7AxMN+f4wLEaIuBJwRHhjnY8JbHczmrBaUunK
         M+nClIUtTNgUNiZW22vMwhE3qYEfYPOKAaOF03OiByMwx9qnwicj5BzvFDJAK/uUd2/u
         kU5A==
X-Forwarded-Encrypted: i=1; AKwUvBwoExp9xm5SQYKMMATQhRx+O4DxNgIzAO/j1N2ChD+m9uwMQy5lYWPV57HevGyefJzsFif3a0NTENKTizAepr1q@lists.infradead.org
X-Gm-Message-State: AFq9FYJL2b7vpIIpZouAvipcDLMqMSqOdGMXW8Wt1GFkNZbWqkrpPhQ1
	JXgQepGxKL6hbe4VfNu/Bl3VnbkfMXanQIbpmqEd66q1x27C2H1hNEB85l9cXy7n
X-Gm-Gg: AYBFou0eLvkr93wPzyfB7SUEzueztqVvjuCbq1sp/uBp5ARIkYXpAXuCh/EgH1ZckDh
	6wTcixWlU3EDjIptwfCqKa+Cnl5hV+Pe4Re3KyJi8KDxjy4nMlQz1GTmymwa1KkK33bd9w1Pz1K
	p4Tnv2tdNVJXZNgNS1RId4hA7HpUCLH9SUqTjbOwrbe2k2Hyd89Yuy9s1wJidueQYtUAar46ZGp
	rg+R0oeN3qIg8i3SSDM3DLJ/1p/XkluZoTkldoH/tuEY/uFWJ3fEvp/w76Pf+SXmyPMYsNW/eQL
	w9R9npbomEOB8ZirX3BzuwajB3D/VITek6j+VyQRxjcKxRsNMuNpWOh4dFLgmByt9KvSeWJllBd
	rAQOSxI6HOm0v+McjpFLrl2hpeb7OQTdVPmHZGLFeo/HC08EQ4Z//Nu7Smj2RiucLbID2dDMS5e
	dsYyIXcpQJ8YbxZquoLwiyQv+a1MmqXM2GkO8nxz1VlGW87YE4TCui1Ut8uPezJZRW7L4rGcLBy
	xaB/oEYa6e4/vY/W20wAkDPEH89Gq4e4k8SPbVj3BN0Tm/CtcvXmkITWcOCG9zlaGX9HWS8diXe
	h4v7x+ZuhXEay691CzDP0ufQ4Q==
X-Received: by 2002:a17:907:3d0f:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c31a9ff4c22mr1864689766b.9.1792145057089;
        Fri, 16 Oct 2026 03:04:17 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcae3sm57098966b.57.2026.10.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:04:16 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:04:14 +0200
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: i2c-xiic: fix clearing of bnb irq
Message-ID: <atH2njvkxHjq_75E@thi-server.fritz.box>
References: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
 <20261015081127.1566244-2-thi.zirnstein@gmail.com>
 <atFf1ZbNi29Lbdbb@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atFf1ZbNi29Lbdbb@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030419_407434_6DDF2238 
X-CRM114-Status: GOOD (  38.76  )
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

Hi Andi, 

Thanks for your review and feedback.

On Fri, Oct 16, 2026 at 01:51:35AM +0200, Andi Shyti wrote:
> Hi Thilo,
> 
> On Thu, Oct 15, 2026 at 10:11:27AM +0200, Thilo Zirnstein wrote:
> > Add a function for clearing the bnb bit,
> > It waits for all preconditions before clearing the bnb bit or times out.
> > 
> > Tested on Zynqmp dev board with some custom logic.
> > Tested-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> > 
> 
> Please, don't leave blank lines between tags. Moreover in this
> case I don't need your Tested-by, I believe you tested your patch
> before sending.

Ack

> 
> > Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> 
> I'd need here an ack from Michal.

Ok, but this is nothing i can steer somehow - right ? 

> 
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
> >  1 file changed, 33 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index 5e397a7e63f6..da9cedb86f94 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -230,7 +230,9 @@ static const struct timing_regs timing_reg_values[] = {
> >  
> >  #define XIIC_RESET_MASK             0xAUL
> >  
> > -#define XIIC_PM_TIMEOUT		1000	/* ms */
> > +#define XIIC_PM_TIMEOUT 1000 /* ms */
> 
> Why this change?

Unintentionally, :/ 

> 
> > +/* timeout waiting for bus busy */
> > +#define XIIC_BB_TIMEOUT		(msecs_to_jiffies(1))
> 
> I don't see much benefit from this define as it's used only once.
> It just makes it more difficult to read.

I think it is a question of personal preference,  
I prefer to read a meaningfull name instead of a "magical" number. 
The driver code has some other defines which are just used one time
( XIIC_PM_TIMEOUT, XIIC_XFER_TIMEOUT_US ), so it fits to the code base too. 

If you not insist, i keep it.

> 
> >  /* timeout waiting for the controller to respond */
> >  #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
> >  /* timeout waiting for the controller finish transfers */
> > @@ -392,6 +394,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
> >  	return 0;
> >  }
> >  
> > +static int xiic_clear_en_bnb(struct xiic_i2c *i2c)
> 
> Why do you need to return an error value if you ignore it
> everywhere?
> 
> > +{
> > +	u8 sr = 0, isr = 0;
> > +	unsigned long timeout;
> > +
> > +	timeout = jiffies + XIIC_BB_TIMEOUT;
> > +	for (isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
> > +		(isr & XIIC_INTR_BNB_MASK);
> > +		isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET)) {
> 
> this for loop is quite ugly. I believe that with a do...while()
> you can write a clearer code.

Ack, I can get rid of this whole loop if using 
read_poll_timeout_atomic()
A readback after clearing the bit is not needed.

> 
> > +
> > +		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
> > +		if (sr & XIIC_SR_BUS_BUSY_MASK)
> > +			xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
> > +
> > +		if (time_after(jiffies, timeout)) {
> 
> If this is called in a context where interrupts are disabled,
> jiffies might not be incremented and you end up looping forever.
> How about using read_poll_timeout_atomic() instead?

Ack, good catch, i will fix that.

> 
> > +			dev_err(i2c->dev, "Failed to clear bnb\n");
> > +			return -ETIMEDOUT;
> > +		}
> > +	}
> > +
> > +	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xiic_setclk - Sets the configured clock rate
> >   * @i2c: Pointer to the xiic device structure
> 
> ...
> 
> > @@ -1225,8 +1248,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
> >  
> >  		/* Clear any pending Tx empty, Tx Error and then enable them */
> >  		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
> > -				XIIC_INTR_TX_ERROR_MASK |
> > -				XIIC_INTR_BNB_MASK);
> > +						XIIC_INTR_TX_ERROR_MASK);
> > +
> 
> this needs to be aligned properly.

Ack

> 
> Andi
> 
> > +		xiic_clear_en_bnb(i2c);
> >  	}
> >  
> >  	i2c->prev_msg_tx = true;
> > -- 
> > 2.43.0
> >

Kind regards,

Thilo


