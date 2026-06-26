Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B56FC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=; b=eeSKgI7jYXvJ2dPHiqAYCBpke+
	RXcJvcqoHQch9pur4Yyc622KA/3cmoOo8Fk4mPlgTPJRU+0eImcBym/wyi/cXPkLn25WaAqeF9Dfm
	POIqZ247H6QFSfCApH7A//ZY/URK0a+tIl5fFlrir1pnwiCIKhJMXW6qHhCiY9+r0znqhRQnHb4gk
	14jqQQUkyF8rhcLQ83MK3WdKxbpv7uVxQfYglFmCbxfyXsPXeP6azFeA4YEg/g9QoiyDz46YWU8N1
	D1PG01q5YY4O10HIZA8w+lu0WegfbeeF5lx8rUHp0ot7jdY8zZHB8QCjtzVIylgGbSefPhoS+mGBo
	xSHJQywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAMb-0000000BhUE-1y40;
	Fri, 26 Jun 2026 17:29:13 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAMY-0000000BhTS-2SLo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 17:29:12 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e93a984f79so878633a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782494949; x=1783099749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=;
        b=Piz0V7OSUlEZJ6i1UN983vDF4MMa/LdpYdYWgW1J4FxTFboVcvXFFto1JpIk2ZNf11
         fwRfcbqdJD81rT3R+bYKvj6ewoOyOumH8Vk7sXvkkFT0ARAfGXDZThu44XLIhYrZ5V5W
         cyjILQPkk/XV/LuHq16NwYE4fZAMy/mFLjSrRcIwmzcnAHdWgs/r6fDre0tMFo+Lmzuf
         3M0GOYJ9BJbGy0gEM5yiHX3obb4kxxDOjESnNQ31Pcu4wCfZFbrh+6p1iOZE9XE7oXCb
         aEkoKg+7QifHf3HNJoCCq+cWA/rwT7dVIJmn12KR2N0sv6DFPx2hLNG5gYxRiG07fB05
         kKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782494949; x=1783099749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=;
        b=mjtCAmyXKVcE7Wvt2B5sXInWT5k5wgjmo9WUhGucKTKgk+x52KAAJuFc/qXgWoZITf
         dfbBqVYqYOipa36+tf5GoICUMq5dqkdKAd80WYKGMRN3AKMwNnjErobSWk3rpBMLSTTx
         BX7QQowKaFTABRK9Mpc/e6XTUAUx9ORyZMTcEOIjTugY7+EUG/Cog8XqZo8z/OQPNPvZ
         H6VX3fL6xwPfowvl+M24T/pivsQ0iXau2457ztq+3ef3hF565mem2fiw5B1HCOTxC370
         Wc2ptJe4YnciXeZZUqMqJYFK0Lm2a7e+DrUxwWtzbbQLr4C0hyfOexUUdcC8mna/mObr
         Vo8g==
X-Forwarded-Encrypted: i=1; AFNElJ+43yjGX5augnywKJpf5KEjzwdFsl5e27hH+ae9mMY6SjmMKb5w4GVO7PB86eeqwDpHGIpyZ4AyyMzU2DolCnes@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6jc+StSoitxfNOy9dPix+vGEDwOZP6sLQOEHkUGX5UeeQq7st
	Mpe64VvwtUTExXnOqd/R7WG5uO309hmfn1ZhuslNJJG3MPmo97XwazgJ
X-Gm-Gg: AfdE7clTNUoGkNyfSIc7ordqZz7y0pOt0ygvZtJhviHqrndOPwTH3vnAmUGBYn3tm9l
	1fPeq62wyB0T3vuSC9bROGIda4MqO1dCewFSs4ei9LcLEgRzmhJySEU3o9uqa2Jl26rBBKf2NMU
	2yL0HouqyscZcThFeXi6DBMjoTzjAKzLRzNJmpP2uPxtoeEKvNzByVY+Dh10N+Jitq8jVhpZ64r
	Vr+gCBxiAIVPUJDoUWYI4BeAfiEl+xOI8iATWGenCqukHaDrLN4OhbiqfazojwW3hySKrx8DY/3
	0FXOKcZpD0cNHCBrRq4fWAsPB9+7MOWIL8iI63rEDxxSG+ZfIda1DcVUjeamQMFA3fwWJRd8r4i
	5Llt9PSxccg07tD01sXUwY6I10oBr5T0zbwhAcAorM/Y8zTOsnZBBCtIPyO6TZTFOVtsBxUN9eB
	Ebd6U4
X-Received: by 2002:a05:6830:8291:b0:7e6:ed97:ce5a with SMTP id 46e09a7af769-7e99c2ec47cmr6930978a34.4.1782494948915;
        Fri, 26 Jun 2026 10:29:08 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa78751fsm2063757a34.13.2026.06.26.10.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:29:08 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:29:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in
 codec_vp9_rm_noshow_frame()
Message-ID: <aj623aQRkNiVdrnM@stanley.mountain>
References: <20260626164025.52694-1-doruk@0sec.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626164025.52694-1-doruk@0sec.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_102910_632419_3356EC4B 
X-CRM114-Status: GOOD (  22.16  )
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

On Fri, Jun 26, 2026 at 06:40:25PM +0200, Doruk Tan Ozturk wrote:
> codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
> ref_frames_list without excluding vp9->prev_frame. When the previously
> decoded frame was a non-show (alt-ref) frame and the current frame is a
> non-show inter frame, the freed object is the one vp9->prev_frame still
> points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
> (use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.
> 
> The sibling cleanup codec_vp9_show_frame() already guards this pointer
> (tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
> Add it.
> 
> The fields that drive this path (show_frame, frame_type, intra_only) are
> parsed from the VP9 bitstream, so a crafted stream fed to the stateless
> decoder can trigger the free-then-use.
> 
> Found by static analysis; not yet runtime-reproduced (Amlogic Meson
> hardware required).
> 
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
>  drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
> index 8e80ecf84..572f418c9 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
>  		if (tmp->show)
>  			continue;
>  
> +		/*
> +		 * prev_frame is still referenced by the MV predictor in
> +		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
> +		 * already excludes it before freeing. Do the same here to avoid
> +		 * a use-after-free of vp9->prev_frame.
> +		 */
> +		if (tmp == vp9->prev_frame)
> +			continue;

I have not looked at this code before so I'm speaking from a position
of ignorance but codec_vp9_show_frame() checks vp9->cur_frame as well.
Shouldn't we check that here as well?

regards,
dan carpenter


