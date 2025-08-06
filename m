Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DC7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWQWyYoXiLLkZAoiIB5sdcKmoITnPW5rVyw8e/6D4rw=; b=UInCjrjiLkCVFJsMkJ5KqrSpFE
	x0GVviFvnfolzEdqdt3xICS2090sjoJauz75XCklF5x8U+8qcglLU+38V3/J0pzUWqxH4CdanlbWh
	2/amj9U4MVVAWNuB35R4HWxvwGvHaXKgBnoeTaxMvDpkPww5eBAYCiEvkcpeUz+0EPn1HrVokzNfW
	RqlKg8tTY4LyX6qIXclMoKV8a2knhr7IW0Mnc/g0OQaqolHPasoxkjrovpPUEqeoAOzrdTBLMHpwx
	Of7/XWm1l+PiW6bRC3Py/g2NG6VkSiqiuXZBhMSNuad76UFLBEmghfq3nYzUigYvncYtJK8J4RQUY
	4YzNWx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujcSw-0000000F1ky-0u3S;
	Wed, 06 Aug 2025 11:37:56 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujcQM-0000000F1X1-2yih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 11:35:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so5795311b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754480113; x=1755084913; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWQWyYoXiLLkZAoiIB5sdcKmoITnPW5rVyw8e/6D4rw=;
        b=trKZjLVzp68novJ6m1BrTkQZHV57cSYnYIRAc9vi+UIKpdFWcmfYGgTrietBUPcgN4
         v2DqY+yFXlf+Khx64qpnCm9ub6SyNN5xxzdM+ZY7Il5HfJEregx93kJd3M2EfuvtAKe2
         9dQs+QmWBrtMDk1yUERK2swIuAZkK54czNohYdT3NonGfsQNtEJ/ptkkxiAez78NXnVc
         MlZ7l8wu9ocWhZbSRAsZuRAAEcY5P2RnRbyevx945MOvxhICfH50fM+4U+euoULKSoXX
         /0vE+XUfUSR5V0naMw/F4s4iTHgn+0v69zlB0cGy1qkk9PyIpy8es2xpPY5DzzTSGGBn
         Bt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480113; x=1755084913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWQWyYoXiLLkZAoiIB5sdcKmoITnPW5rVyw8e/6D4rw=;
        b=irltwXOcXtSgcLbCnQM2yay9MfQer51ANRNGZnn4MpiaC7HE95BW1lK4VFDjgSUrdo
         opyNh1aFLdu6oyAbvhclopqXK1fsTvIlkXeaw985pxrZIZl1G/zGO9l75rc/H6JzNd5S
         mkhPqBCH3UGhb/T/THfm/itZn3VkRqiXHr8ilydeyTUznaEoZJs1FZNu0Q9n4RMNzPcu
         WWcffj7JgCXdKkhNrWK1i1cldP8JcH1YZMinXxHAVPoa4rEAVKG6hUpGX1l0cPivE4jc
         AarePZJ6+kZo0fq7wlbI1FeG8lYSQ1/Cnv9C9ADKmwVHMJ7DgD4ZJe4HKiQ7xstdwhqm
         F+lw==
X-Forwarded-Encrypted: i=1; AJvYcCVVUnyfxK9jYaS6c1DfUWSc9L2wAqE+0cVi4B8mR4YuQYsvIF+GyzR7T84jbdx24cWGsHaUCu34aBs0XWEen5CQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yys2JNblWdmVS0CXLs5zjYeB3wgl+XPVUP9yeW7UhJHrkL6jzby
	FrEULDtaqTyHkJJ90vhc5EHmfgSx/6nbFruk12gkwWo8IzKqUQUnrAfjFaLWIkTKNxws7uLPIqO
	/IS6Zya9qmaFgn/DuPQwr08xFMBG36rdqBhHZAOih
X-Gm-Gg: ASbGncu6MEtci6dtSWmKEs/OKAdl+WlMss5iwJX7W8eZCc8aoZ8ymE8ME3857a38HQ4
	/EwLkYW11qZvRykbZMjTCnCvZF/UENT1W/yVz7UvwrHeviPNem4qpP+NrnwbAp3/Ghl1P8oFpkg
	1UylbvOrdypzXpHvyXHgWGsEidXWm+cqu4QCKqUyagrcMfUT4vCm1L/zywzYni+cD8+1J30dio2
	x3suCnHMu48eeEzFYpAKxH3t4jUXhzuyGuY8FHn7PuC2Lu2WyU=
X-Google-Smtp-Source: AGHT+IHC937rfNHLj2Ketv7dG7aNMCiksImoAukkEKJ9dvpFLVmtwt42vPOJP0hdb3k7rsxJhY51EU50UuhO23sAjZg=
X-Received: by 2002:a17:902:f543:b0:23f:f96d:7581 with SMTP id
 d9443c01a7336-2429f57624bmr34189925ad.20.1754480112491; Wed, 06 Aug 2025
 04:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com> <aJGM2zXS6hOLDFm1@vaman>
In-Reply-To: <aJGM2zXS6hOLDFm1@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Wed, 6 Aug 2025 12:34:46 +0100
X-Gm-Features: Ac12FXxWf93J7w4DWWOw2n4oH9fFRZLDWbJIwgwctng7o16PPG-OqeOwbdPfDf8
Message-ID: <CAAntYmLYVeMEpEtzhhMZ_kyAuwqv5suQK=rjF4ixgu1QH3yk=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64
 ioctl
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_043514_805000_D0C36FF8 
X-CRM114-Status: GOOD (  31.28  )
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

On Tue, 05 Aug 2025 06:47:59 +0200,
Vinod Koul wrote:
>
> On 01-08-25, 10:27, Joris Verhaegen wrote:
> > The previous patch introduced the internal infrastructure for handling
> > 64-bit timestamps. This patch exposes this capability to user-space.
> >
> > Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
> > applications to fetch the overflow-safe struct snd_compr_tstamp64.
> >
> > The ioctl dispatch table is updated to handle the new command by
> > calling a new snd_compr_tstamp64 handler, while the legacy path is
> > renamed to snd_compr_tstamp32 for clarity.
> >
> > This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.
> >
> > Reviewed-by: Miller Liang <millerliang@google.com>
> > Tested-by: Joris Verhaegen <verhaegen@google.com>
> > Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> > ---
> >  include/uapi/sound/compress_offload.h |  5 +++--
> >  sound/core/compress_offload.c         | 19 +++++++++++++------
> >  2 files changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> > index abd0ea3f86ee..70b8921601f9 100644
> > --- a/include/uapi/sound/compress_offload.h
> > +++ b/include/uapi/sound/compress_offload.h
> > @@ -13,8 +13,7 @@
> >  #include <sound/asound.h>
> >  #include <sound/compress_params.h>
> >
> > -
> > -#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
> > +#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
> >  /**
> >   * struct snd_compressed_buffer - compressed buffer
> >   * @fragment_size: size of buffer fragment in bytes
> > @@ -208,6 +207,7 @@ struct snd_compr_task_status {
> >   * Note: only codec params can be changed runtime and stream params cant be
> >   * SNDRV_COMPRESS_GET_PARAMS: Query codec params
> >   * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
> > + * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
> >   * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
> >   * This also queries the tstamp properties
> >   * SNDRV_COMPRESS_PAUSE: Pause the running stream
> > @@ -230,6 +230,7 @@ struct snd_compr_task_status {
> >                                              struct snd_compr_metadata)
> >  #define SNDRV_COMPRESS_TSTAMP              _IOR('C', 0x20, struct snd_compr_tstamp)
> >  #define SNDRV_COMPRESS_AVAIL               _IOR('C', 0x21, struct snd_compr_avail)
> > +#define SNDRV_COMPRESS_TSTAMP64            _IOR('C', 0x22, struct snd_compr_tstamp64)
> >  #define SNDRV_COMPRESS_PAUSE               _IO('C', 0x30)
> >  #define SNDRV_COMPRESS_RESUME              _IO('C', 0x31)
> >  #define SNDRV_COMPRESS_START               _IO('C', 0x32)
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> > index d3164aa07158..445220fdb6a0 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
> >     return retval;
> >  }
> >
> > -static inline int
> > -snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
> > +static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
> > +                              unsigned long arg, bool is_32bit)
> >  {
> >     struct snd_compr_tstamp64 tstamp64 = { 0 };
> >     struct snd_compr_tstamp tstamp32 = { 0 };
> > +   const void *copy_from = &tstamp64;
> > +   size_t copy_size = sizeof(tstamp64);
> >     int ret;
> >
> >     ret = snd_compr_update_tstamp(stream, &tstamp64);
> >     if (ret == 0) {
> > -           snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > -           ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > -                              &tstamp32, sizeof(tstamp32)) ?
> > +           if (is_32bit) {
> > +                   snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > +                   copy_from = &tstamp32;
> > +                   copy_size = sizeof(tstamp32);
> > +           }
>
> Most of the applications and people would be 32bit right now and we
> expect this to progressively change, but then this imposes a penalty as
> default path is 64 bit, since we expect this ioctl to be called very
> frequently, should we do this optimization for 64bit here?

Valid point about optimizing the common path. But since the underlying
.pointer op was changed in the patch V3 to always return a 64-bit
snd_compr_tstamp64, there is no longer a "native" 32-bit path to fetch.

Any call to the legacy SNDRV_COMPRESS_TSTAMP ioctl must fetch the 64-bit
value and then truncate it down. The current patch reflects this by sharing the
common 64-bit fetch and then conditionally performing the truncation to 32-bit.
Splitting the function would result in two functions that both call
snd_compr_update_tstamp() to get the 64-bit data, so there would be code
duplication with no performance gain.

Thanks,
George

