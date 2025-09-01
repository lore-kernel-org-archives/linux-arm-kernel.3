Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BF8CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=; b=TVRdSgagNbkBzroUrWovELRYV0
	ucvAOyXGyLI/YdB5QY9tLyZBc5G/qVGjk5EeKGq0GjqyAxvpS+AsKwW9xfpSpwehUyQ7hAu6UTw+H
	07kOYCCgypAykVeUVy8X5SjiZChb74KmKt6oh8tVWeyHj/qaPvIrbZXGKPch5ImxRmuJrKnv+3tiS
	fMj8dljQNhfHn2twDjiIEPxPUUSzmAXoBEfm6c6V3VnymwKcQm1LZ8xdZGrTifFQEXRB3g2S5bKad
	f23xfGAfh8uhzWiccjMRHK7VuJaSF1+ciuDrwj/SD5W1CgactTafVUvKylNW1vTM6clkwAs0fTE3N
	cJij44yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uX-0000000CkDp-1H4z;
	Mon, 01 Sep 2025 13:49:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2nJ-0000000C4Mq-13mr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:33:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso7924725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756726432; x=1757331232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=;
        b=GjtkdIMQmi/RyVeAAcyUARlsw2ny+nzL4AkpTVw0AP6fLwAZT+1RlUg+gcf0l0vDma
         vxHnV2R66z1FeyhLZe0IKf+bGNG05ULxExXD84LrKzjDW9yFCo6IAFtfeNt57a8GZZXA
         Hd4YCccOR5WhFaAgSZtnb+DuDe4ww2mRHch0wOAG201VJtxUpbzDa0mfuUhxbA+Qj2xB
         Wy8DTDRXjBrYUT9rD2Fudu3FxUKKj65YKKBnPjNFyARu/XVWmyk+RNBQhAHed7gqYs7u
         PdHDK3/fe0xRVEz21N0rxtGFePgbQkpt4fSA03RTVTWHhE+XE3BC7xKenskjblaaC9wi
         gq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726432; x=1757331232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=;
        b=tii2JeGXElxz6hs9QiuHlD9WGWl5YpPL9NR+xSimSa/6uylQeHzGzVfWTgDw3535wG
         YDYyx9JaFHBP+nyIkJryVDNdOhw3DYRcLwruAzvYmgiGDy58p46z4xk154fr4hXX8l05
         nXGKHJfpqlOridKisvY3K0juYnNu/5/yPREo3L+/5uv8+KwqcjNTK3rGEa7Qg3XzTxDf
         ZrYGY83ViVp/GfIyTE9gGyyFvRgFZFXjiT+3rgGl8lJLYr2F1M4C5RSqa3eEd+BzVbhD
         NXYycQsRyBIGG/eQhL8Ga4bhuIzUi8p5PcPvtz2Fd4ZjRWBYPSUf95BVpiUi1AM2Lu4U
         mmFA==
X-Forwarded-Encrypted: i=1; AJvYcCXJrcAYKbx/YaTLzycVFuJXXNo7/6FVPXsFpK5C3x/G3FaIiWy+bDlv3JBBeZS8k+7s/5f933nNmTpjLuXl6jtm@lists.infradead.org
X-Gm-Message-State: AOJu0YyLq8VGlXdPPv2H7WxaWIEXMfoVlyGQQeVejRxqIDmBUcGAEnWA
	ZyUmfcyleEvNOR//QE/Ppm10IOpNHiirMe+s666GlX9gcBo2dIBCxT6brcAXfD8Z66k=
X-Gm-Gg: ASbGncvefPzb8FKzHZu1cFIEawE8tMfBTrWEMkJ/qEszmm68zQWcsC68R7eymwgjWLB
	79m2tS9c3KfpFev8vIz+Hs8uExhNapMiR2ToOsUKzabhjpOo6NTUU5WgjLYvX/0cgLzq9G28y/I
	4nGreQTsLRDMg2r1shamqBZ0aEmIn6JekSK5SOeKCK6nl2mrMlSr9yEos0SvSslDddPsn5gvnM7
	D/mFX2TkPYVi5Dlrlnhe+3z8rHAE39C/wpeF4Dn8S8HWzFAtT5kF+o7sJ/+l5wT49SBSYKYa3+5
	KIDUVsX79g8zDHkPymGdADCtoMCVUOel1bB/yWzKfqioqbhXMOFNg0GWUgGL9NvA5FibV8kIbO/
	vSzR8cQ/y+yTd9pfR9wpC/GaOKexLAvG29NpGTA==
X-Google-Smtp-Source: AGHT+IHlZsFA6bO5PL525W9kRFa10Ed6TtJv6bjUkL/ZCgjzMq2fAWcbrEpWZ54ZlAQ/b0gIQUe8sg==
X-Received: by 2002:a05:600c:a0a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b855aeb67mr56578155e9.32.1756726431637;
        Mon, 01 Sep 2025 04:33:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b66f2041fsm141251905e9.5.2025.09.01.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:33:50 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:33:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: audio_topology: avoid
 -Wformat-truncation
Message-ID: <aLWEm2sQpmoNYLAC@stanley.mountain>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-2-nogunix@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830173850.323897-2-nogunix@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043353_306730_A01311E1 
X-CRM114-Status: GOOD (  21.35  )
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

On Sun, Aug 31, 2025 at 02:38:49AM +0900, Masaharu Noguchi wrote:
>     - Fix -Wformat-truncation when prefixing device id to widget/control
>       names.
>     - Write the prefix with scnprintf() and copy the remainder with
>       strscpy().
>     - This avoids potential truncation and satisfies W=1 builds in
>       drivers/staging/greybus.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 6ca938dca4fd..5bf8b5e29dd8 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1013,7 +1013,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  				      struct snd_soc_dapm_widget *dw,
>  				      struct gb_audio_widget *w, int *w_size)
>  {
> -	int i, ret, csize;
> +	int i, ret, csize, n;
>  	struct snd_kcontrol_new *widget_kctls;
>  	struct gb_audio_control *curr;
>  	struct gbaudio_control *control, *_control;
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	n = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strscpy(w->name + n, temp_name, sizeof(w->name) - n);

The strscpy() doesn't make sense.  If the string doesn't fit then you
can't *force* it to fit with strscpy().  :P

Here we're taking a buffer w->name and adding a prefix at the beginning
of the exact same buffer.  Obviously the result is going to be larger.
The W=1 warning doesn't add any new information...

I feel like these W=1 warnings about string truncation are rarely useful.
These limits are not normally thought out that deeply.  Poeople just say,
"This is probably something like a company name.  Let's say that a
company name is probably 48 characters long."  But really very few company
names are that long.  It's just a rough estimate.

And really it's not the worst thing if these strings are truncated.  Kernel
messages are mostly error messages.  We'll still be able to debug the crash
even if the last couple characters in a really long name are chopped off.

regards,
dan carpenter


