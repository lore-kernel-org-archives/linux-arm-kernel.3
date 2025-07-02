Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784D7C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=; b=zSuxkd425FyTq4Kro+MazXyDRm
	QxHkyk7ATSsaSAAcD6pswRQnnwZdX9KHmOqOnZSN4vYVzWOwB/1/JAxWjEGMtqDrqDXZROJUWEZ6v
	zw0lXjqzKJu2jhKUjnB/wATTealqJJyrN4IhTpGoJPtJ5dOtybS6L09B4LF7Btz8P0jeszDaFW7/7
	KqUwFHXXpkT5oePPEgABaTCz0peCYW8hOyHvEKOwCDy5I0K6SsVh08ORSUvlKjVqGMVvT51cj0kiU
	+LUS4Qouvws2FQLJpSI39eOr6uXC+8P93dLcU8elUL3/JOFXYHJKFLMDiBX+3WuUdzjKSnG47X+6I
	uh5ikldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoBT-0000000789Z-0xTm;
	Wed, 02 Jul 2025 03:30:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWo94-000000077uQ-3mfz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 03:28:28 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-555024588a8so4140337e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 20:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751426904; x=1752031704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=;
        b=M6rOAJamDP+fimSFNhh88+rv7/OJ2txVRA9qJWJGA2vnxmwy2fDejOZTMdJNSBwldZ
         EfVTin9weFSQDK+d4XiT8ufz9d+eoMYLNVQ7woJVSIfRQeIyUuWtFTxvWYcdhcN2Tp/l
         PLBArNsQHT75L20IwOETPV4aAeOCUJInHdGv3ggfinwc9eau9pLucY7OenBYkyrwfBvE
         klY7En7ItamjP3ZTB95eXghFfyXCUZrAbvc4oHyYVnHGQ4b2bWYkMo5uwT0i6ISbUgNm
         dIqQYhwUKEms8FN0vgGmgnddvuAsxX82gSyx2xAcTikIuJdI4o09UG3Q12B/iuAlHvaM
         5+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751426904; x=1752031704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=;
        b=nVCUd6krsEmwL70MkT/HTTwxzqO4Gs9UJhmpF/fB//jcEBeWY0MCpwf3LbeSgL8dRW
         SEVlbqRuxPK3yoFjje73b2Imd/ivCr5ieHNC2ZZPeKWycJfGZndB7EAGPueI5l/Z+AkJ
         Koww86quUhNBXwcTvGFiVuFYuxXA2g5/2g8usAe70MihNlVlhLmeIkijCIGPwhWvwEyq
         s44rHPv1viFU+rDRzpW5LMmkTUR3mWXceGcHRfFKh7l8hbDLL2bLiDLE34BsVUgJrwxe
         19kLn/Ozna5s1IyR6RVYjSr1izGflllcnbgBfrEwnyKPHn47m9bth7pMGRUB246Sp2qa
         6MQQ==
X-Forwarded-Encrypted: i=1; AJvYcCURsM8vePx72K8o9lpk+N4L757/z9jn+jb16xXe5YrI5yQKufmA+YW7eHr4DM9GwD00yN56T6YPHA7brosVjmd4@lists.infradead.org
X-Gm-Message-State: AOJu0YzjQtvR/cdvAAICElWCDfnE/vxkFSMf/uHLsfVeElkyiHPfrmpV
	RsHX9UZpiCs75sGEj52F8i3mdAh6NNEA5A402qHkxom3Ai3CopXgqsQoOaDtbxouu1LOXRjrJQZ
	VQsWhRHx3a1UZmk2jV3kHo5PFzMWii5bzH7oyHDE=
X-Gm-Gg: ASbGncvBPlHS0Tw831NWs/4c+kNtEo0I5Hbh2UOAH8BDKicTUzpbp9EC7zbjcWBWl+A
	wa37zyNEgkAXOfnQfnDnACsY5DPBY2jRFQDQyqKIlOdEEjypzKy1169my+gqXU3s2kIMlJsDD2X
	7ErcFtGMweK0EveyNqqRbFNuU456O/eTtRgon2iVqjzfwL+/ERboJYO7Rr2BkaKqB0G0loZTrB
X-Google-Smtp-Source: AGHT+IG7apXbcjCcHGp0kZ92UX+gym5ki6TPagVcyHMy+qG0QMpO2pvfDEUg2Wlq7uVoA/TS/9vt31DS/gX08hJFeHA=
X-Received: by 2002:ac2:4bd3:0:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55628388443mr413354e87.51.1751426903821; Tue, 01 Jul 2025
 20:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 1 Jul 2025 20:28:12 -0700
X-Gm-Features: Ac12FXwwpzKziB_llADT_ppGncI36EFdCzpapMYlOJvYbZhU5k4G0Rc4-PwHlfs
Message-ID: <CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_202826_960947_A22FD593 
X-CRM114-Status: GOOD (  22.28  )
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

On Tue, Jul 1, 2025 at 7:14=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com>=
 wrote:
>
> In our testing with 6.12 based kernel on a big.LITTLE system, we were
> seeing instances of RT tasks being blocked from running on the LITTLE
> cpus for multiple seconds of time, apparently by the dl_server. This
> far exceeds the default configured 50ms per second runtime.
>
> This is due to the fair dl_server runtime calculation being scaled
> for frequency & capacity of the cpu.
>
> Consider the following case under a Big.LITTLE architecture:
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> So it will scaled to 238,418 ns.
>
> This smaller "accounted runtime" value is what ends up being
> subtracted against the fair-server's runtime for the current period.
> Thus after 50ms of real time, we've only accounted ~238us against the
> fair servers runtime. This 209:1 ratio in this example means that on
> the smaller cpu the fair server is allowed to continue running,
> blocking RT tasks, for over 10 seconds before it exhausts its supposed
> 50ms of runtime.  And on other hardware configurations it can be even
> worse.
>
> For the fair deadline_server, to prevent realtime tasks from being
> unexpectedly delayed, we really do want to use fixed time, and not
> scaled time for smaller capacity/frequency cpus. So remove the scaling
> from the fair server's accounting to fix this.
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: John Stultz <jstultz@google.com>
> Tested-by: John Stultz <jstultz@google.com>

Thanks so much again for the multiple iterations here.

I've re-tested this and it still looks good.

For what its worth:
Acked-by: John Stultz <jstultz@google.com>

Juril/Peter: if/when you take this, could you add a:
Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")

It would be great to get this merged and into -stable soon.

thanks
-john

