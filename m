Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA97CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agMKBMpiwRJgV1vULO+B+WBkdT3fQoGt4YUPKH+BR+8=; b=rQ6EmFRChGYTaQD40FGvSrLmav
	YnKKYU0kJSWTM+qDTtcqZ77o/gZo9/d8BzYi4XN2msnu60I5YSE/ZnDFnXYsAP5106+5iIfoSdlQF
	9tmr2Oar4jJ8A45OyWjhItudmElKgyNzfZw16xKMfd0aga7+OMz9K1tizDkYrs/AQg740qU0jJL7I
	TQggnTCzYwx6lZvEvA7PjnlThTsNgGQcXKSXRvugXiucf64zElsesyHGP9xgC+ooti9+UNHMikoxI
	yCHVZD3/E0hgEldEo0Krc5h4/G3HG6fT7B8czLkM0GBuwPUUpSJb4RTQCuQMY8JuipJqkZvi4daO5
	Ux45axaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3lE-00000005aNX-430A;
	Fri, 09 Oct 2026 06:07:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3lD-00000005aN9-03DX;
	Fri, 09 Oct 2026 06:07:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0D1043E16;
	Fri,  9 Oct 2026 06:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839951F000FF;
	Fri,  9 Oct 2026 06:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526034;
	bh=agMKBMpiwRJgV1vULO+B+WBkdT3fQoGt4YUPKH+BR+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kahBY4tG0F73YSq07+CR0bQZE6/3qKJ0ztmRXQ+MuO3LFRBD0kfcLoH7C69U4y7aG
	 XUi/ZhaBphRAEXO+sF0sB8OAcPZ6JdT2tRyq400kZ6XoS9dAYfHAT5ko1mncxkjUW8
	 1vel4W5god98O5QdHgLlWlzLu5GDnv4MHTa8qaIhFLZe+LjcWs6FXlCDweq9tz+znh
	 2fKrxLgNtl/YMwzl15XVDrFVUT9kOsXnGCLYfNBK8cn4M7My9XhH+JL9X6CRqp3PSg
	 xOD13k6GgmpkDYEwkRJAX/AbiCOVeEzE8yodMo+1KU79y/jFk0aRxDmIvCCgPuVM0S
	 ZsNOKaPL7Osag==
Date: Fri, 9 Oct 2026 08:07:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, Takashi Iwai <tiwai@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-fifo: return a negative error code when
 no irq is found
Message-ID: <20261009-screeching-authentic-rhino-bfacc4@quoll>
References: <20261009051724.3134644-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009051724.3134644-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 13:17:24 +0800, Haotian Zhang wrote:
> In axg_fifo_probe(), of_irq_get() returns 0 when irq_create_of_mapping()
> fails to map the interrupt. The error path explicitly treats this as a
> failure with "if (fifo->irq <= 0)" and logs "failed to get irq: 0", but
> then returns fifo->irq as-is. probe() therefore succeeds with fifo->irq
> set to 0, and the failure is only reported much later when
> axg_fifo_pcm_open() calls request_threaded_irq() with irq 0.
> 
> Return -EINVAL instead of 0, keeping the real negative error codes
> untouched.
> 
> Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  sound/soc/meson/axg-fifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





