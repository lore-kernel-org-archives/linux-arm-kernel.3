Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DA8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=; b=ZTD6EefxqNqk9EygfVO1Fltg1X
	mslyeG9EZG9frA3lMNm7A4mvf89y5OL0vHeL9L9rEaZE3ZnsIB/D9JGFvY7KtMzo3QQB6uZEyzK9c
	7Zek5fy8107z61BR+hCnwMCOdR8uuRMgq0hzkesPbEOXojNxAeHmZa7O+laU6JHDBrUYL0+LMPwVZ
	wNDX2nd8A7f0Fi3TKWcFpJOzz6TXavnPduh24Y1FYdbo5CPJjaKMVspcYoHBNcTMJ2KwNRbhyHqHF
	hak5kxIlYJJzYlUjPEY4xs2TE13WWwrWRiDR2HHHClClzofhVnsl1cKqSace/TkX4pn6WcIZOYDlA
	1LQ3gGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3nJ-0000000Gnyl-1KHF;
	Thu, 21 Aug 2025 11:49:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up13l-0000000GJpg-06sM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:54:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-244580591b0so5975535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755766451; x=1756371251; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=;
        b=Tpd9kFnheYUSsbeRm+9ybc4CAPHImnVa3hqkZpk5jfkKkw7pEHBlYJF5ZGQfSoLy3a
         kEjqQ6yT7idHPdgZRJq5y9u9SGgCh0bSfpVhEFhm5uJTn75WGja/FFv0XEVJUarjhWfk
         XBY1dAGo3FdK0HspLnjYyUWvb3Yoocatrx5IgXgDjaQO9MNoi633aYN5zJKqpjazZHLS
         T1vhA7Z/0q9kIW/3iPzt3phbYGU0kE/+dctP7aWzvwtVI1g2BczciEhogXMJl+HhEpwR
         JTJAx8W80PliUY9Q6r1r3/s2USkGxcVSAH8kCcuZFMRh+DFE4LLxLxV2NtjT5gJGmqI6
         ilFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766451; x=1756371251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=;
        b=TXR/6M0j2iWBsuIiwQqQXx32CrYdRkVNPuVppOfqiDEiizrYXtEoYYxCzMqnV+UcHC
         AVq83e84Mbqgn47AtexrzH5Rf3tZLk9mwOOZ0B3470kFfi4UZA/IRU1Da+naOluJG+c1
         alQh3bS+znqa2EQZHe5GjHz1KQ97Xn2AD1E4l8G3u8/n5WmBaV8M4izxnYrcm42U3AnI
         OMkOKaUMrDG6hDKmnUnD+tmRUNapJx/JM4m//TlM8Bw9lTttbeE+WJgCLWXiRUefj0Nj
         Y3T0GTWZCxstMJ5QECfdyep7nvXodSlXsSxCynwPVqd0L6DTLyukriyO3lS1Md1T4+pq
         ZkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxdtyrsljcL2TOsnIHsLiObmaA9A815DFFrLpr4x8APSkYwP8CdY//UDkQLsvGaOuWc+AJi/aXQDSyJlW85nbc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtcx3BG9yI7lojKjatmeHP0KKlvm/sWAq5u54sQAadeYGgcqx4
	j64LNgxW7fE7e+jCDSbGr8qKOrTb5VuLp8eCzWDNuIwkcdJKjpuJu7PbaxvW5pFJOqmTjLp2IlU
	IzME7tJLbOWVOyFvTWr619uIjdbY6COtlRA9RDePN
X-Gm-Gg: ASbGncsLj/AallOD2LQLHIteLEG2izl4t+/QLiHnA/qRLqtiol/7NLS01MkvoVfgQLL
	Wf+gZnk7ZuBvONkR73zGWmIdtajFfkNOdD13vfun+NFIgGwpk6i42KD5kTfuUHSmNEF62haAunv
	ldRtu9O0nCU3r+KijBtu5OekITkmh/aUL2h1qhuWu2/4+VSqSnfVTUo66iilyP5HebYMvRx8t5v
	ARYcCP6tgK0Y6lDSHc1R/XK
X-Google-Smtp-Source: AGHT+IEOJ+GiHnoM0xXwePeIaKaKu+bZ/GYxKzuA6yTE5qBa74SEtPQ+etUTrmOlcSdW9xiNKjgOpyr6oyET1zwx1W4=
X-Received: by 2002:a17:903:46c3:b0:246:570:2d93 with SMTP id
 d9443c01a7336-24605703276mr19916595ad.59.1755766451273; Thu, 21 Aug 2025
 01:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-4-verhaegen@google.com> <aJGNgphPCTuE7FFD@vaman>
In-Reply-To: <aJGNgphPCTuE7FFD@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Thu, 21 Aug 2025 10:53:44 +0200
X-Gm-Features: Ac12FXzXjgkmnFwjD3_zb-Ps1Osi-BQvLWpKMG84-DK22RezOWC3UFnJT0qOukE
Message-ID: <CAAntYmKu_tsm1D9koxCZmHpBMQYhrt-HxNBYFeWz6rCqdMZqPg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
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
X-CRM114-CacheID: sfid-20250821_015413_065881_29260506 
X-CRM114-Status: GOOD (  20.50  )
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

On Tue, 5 Aug 2025 at 06:50, Vinod Koul <vkoul@kernel.org> wrote:
> >  static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> > -             struct snd_compr_avail *avail)
> > +                                struct snd_compr_avail64 *avail)
> >  {
> > -     struct snd_compr_tstamp64 tstamp64 = { 0 };
> > -
> >       memset(avail, 0, sizeof(*avail));
> > -     snd_compr_update_tstamp(stream, &tstamp64);
> > -     snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
> > +     snd_compr_update_tstamp(stream, &avail->tstamp);
> >       /* Still need to return avail even if tstamp can't be filled in */
> >
> >       if (stream->runtime->total_bytes_available == 0 &&
> > @@ -233,32 +230,47 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> >       }
> >
> >       avail->avail = stream->runtime->total_bytes_available -
> > -                     stream->runtime->total_bytes_transferred;
> > +                    stream->runtime->total_bytes_transferred;
>
> Lets not do formatting changes in current patch please

I'm happy to revert the formatting changes. Are you only referring to
the alignment of the subtraction operation (avail->avail), or
something else too? Note that the second line of the function
signature of snd_compr_calc_avail got re-aligned by clang-format due
to an actual change (type change to struct snd_compr_avail64) so I
assume the re-alignment here is OK, but please confirm.

> >       if (stream->direction == SND_COMPRESS_PLAYBACK)
> >               avail->avail = stream->runtime->buffer_size - avail->avail;
> >
> > -     pr_debug("ret avail as %llu\n", avail->avail);
> > +     pr_debug("ret avail as %zu\n", (size_t)avail->avail);
> >       return avail->avail;
> >  }
> >
> >  static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
> >  {
> > -     struct snd_compr_avail avail;
> > +     struct snd_compr_avail64 avail;
> >
> >       return snd_compr_calc_avail(stream, &avail);
> >  }
> >
> > -static int
> > -snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
> > +static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
> > +                                   const struct snd_compr_avail64 *avail64)
> >  {
> > -     struct snd_compr_avail ioctl_avail;
> > +     avail32->avail = avail64->avail;
> > +     snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
> > +}
> > +
> > +static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
> > +                              unsigned long arg, bool is_32bit)
> > +{
> > +     struct snd_compr_avail64 ioctl_avail64;
> > +     struct snd_compr_avail ioctl_avail32;
> >       size_t avail;
> > +     const void *copy_from = &ioctl_avail64;
> > +     size_t copy_size = sizeof(ioctl_avail64);
> >
> >       if (stream->direction == SND_COMPRESS_ACCEL)
> >               return -EBADFD;
> >
> > -     avail = snd_compr_calc_avail(stream, &ioctl_avail);
> > -     ioctl_avail.avail = avail;
> > +     avail = snd_compr_calc_avail(stream, &ioctl_avail64);
> > +     ioctl_avail64.avail = avail;
> > +     if (is_32bit) {
> > +             snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
> > +             copy_from = &ioctl_avail32;
> > +             copy_size = sizeof(ioctl_avail32);
> > +     }
>
> Same comment as previous patch

As agreed in the previous patch, will leave as is.

Thanks,
George

