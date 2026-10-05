Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF13CA6000
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=; b=Hn8w0nt8VKq9RDZZMeTyp53uUb
	vXWu0x1264eCcttDRU6Ri8/+n9rrj3gPGuzhkRb9uW4rTdgDEkxzoT2amhcSWla7eSfWWvZ7dlMkO
	UxRaJrh8J/TO0lnZNyGHvR3S5NnsfNOlDBGB6ZHrptMUCHk7NMQwt1A8/7j2qoW5pg4l48+tPLM+D
	r+y5X4mADQZOd2WzpFgoCgYpB2w5+TcixnAy0PyBFNYdonRzbTFPHfW2g9ZW9p9nlNwDjnDoJSqpq
	ghiMpsqg+gBDGkQPoRbQROmianKveKSRlM7xbhiDBJT/bz8M06TbTqbekyILv7AHqzuns0BF6ErHX
	9hqv7voQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcsY-0000000Fm4C-39dw;
	Mon, 05 Oct 2026 07:12:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcsV-0000000Fm3R-3jjF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:12:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc502d509c0so363452a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 00:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791184371; cv=none;
        d=google.com; s=arc-20260327;
        b=s4WCRK4sl+SaCljwhWdAREitKZroUOobpiXGrJoSiMSdewx3I8T/i43ZxTqy6sypnI
         akHtoKXyH5LaX4fk0ZGGc3U48luzES61cu6TJ8pIP9ibtwEc6nRfDGVt4fsFlp4xJHKl
         7IDqwPdCSeHsw63dKwpsYtIQOKO21ucQ6doxgPYpgG5MrqQhgoSriDsgApy5TExF7TB6
         GnGZyy9dfrtQdfawGO4gBkqe6PEIRgybClbh3teEmVyTkFzepFHA/tx17aS5RL3LJeuq
         3JYhmPXT7pIL/fWAkAqAe+wqts6YoC7RPoBVM6LdixDrZWETNsbJ3X1ft4cVJ0eCBDiq
         58JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        fh=QjTmdFWO5ndyfNq2kBJqW7w8Fi/RCa4fgL2PNivmTrk=;
        b=Gz/DlnHtUM8ZkRpY5yNSYkd5CpJmRs/L9WTDMb54pKR6psKQmgJ2rN75ftX7aJVh0U
         wNT2nggw/YLVns9PVX3wq/DdEHwW+5keI63phBmndQUuty+Yonu9BWRGkFpHkUGa9IAM
         8hHZZFR4r1Ad8FwoxfMwr693H5fbzvUyWwzDbqJLu6IsF52JtHyLsCZ6YttsyC7sgwRW
         9Q0qieWZNS0YpS0GR45eTLEn4Kj84BfSVwjly0n7tK4lInael1h3R5egGVEzTngTg+ed
         qmSIH+7xuTb0rRziD3fZEAlnkqopYRJWPIESd/cfbvGNcxT2H09n2OXzL3DcTJQsA557
         hncQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184371; x=1791789171; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=O7+wjL5N12Aq5Jb63mMRXk1Q/h9UcQsQWVq/ORerjJCIHZQ7Be4nsBVt1jbgwha26F
         G6q2fGgYcLtTkHQiLSbNidSTI2JbW1aJRMTFWuUzrzZA0jODpN1Y4yRP+qVajZuwNtw4
         Drm1QO3XUzNsuPPU05K+c+YYISjba+GBjv1XdkJK8OgEVria45LNcXIohOJQymDHVU5m
         Qcst1xhOPZYLaMVjUWpK71ktWhNO1nGxkQt/SWbXD1wSPHueWzrqg3lZUi2onY5QQkZm
         nsEoQ2HkETmzcjNYWN6yXVE4PckOUWJPlTIq0PQsCS1Ctzz6LDNRAXT6Yv5HZOCgYtQp
         QGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184371; x=1791789171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=PCdLso9w3WDohZ1R1j7D8YYdjeMsRv7rpca0HBZBcgwGKnVPDquZTgms87YqdiB6wW
         W8e9lp1FFNH2Zl6iXRHGMUjXt2NtMFe7+k2Omwv2x4jlENg12xvw7+0VZ5SXdDpXNztx
         N5KPADYGw/tWKmSxMCmEv/Jt7FUwK+qzs4IQPvjXnZBzqOysGN8ZV8VmynBMjCcjavoA
         zNU6t+jgCU2O9eirNWIlLpz1kbQzOnmhsVp5m/8q0qU5IPQibgiK4lwGD2rvyi10Dofy
         cQ7xBsU6WVbvvJ895C24N1WoPp9guOFsKIcwvoKGuWmMQCyVLfK8tLwHu1TzZeWn6WhE
         Aing==
X-Forwarded-Encrypted: i=1; AKwUvBxtnVcuL/byc7ylwrUdrWfyg8MGXBwgs1Nw7jH+CRofliO8oiNiTn8dVHEHoyLQPlhQEsGX9LgKxC2dodIh21Zs@lists.infradead.org
X-Gm-Message-State: AFq9FYIXCaEvuJuh8rqTjEW1o2Y3NZz6zdI4mJBzwauvDDkWpNvBUEzz
	vMo6wtwzDsqrREY0jsNfh9xNroTJ+xNT7PJ0938Wgm39njSnCpbGRAnZtb7rV1anHa/MNtDu5cY
	dduL/3dlCV7HSAzgCDAlp4ZY8pnptJH8=
X-Gm-Gg: AYBFou0D5JnPfXCGrVj8DIPOmPd5QxjX6/pqJrqX74wEjP2X0HZf+LVbd4QcUccPPDW
	l8humyEjVaA8wzey5G7eMlHsWDzQxXEdVvPkQhznSUWPQZrjLefp8wAPq+CM0ZzomqJsbtVKPpF
	pNVYtsfE0zLEhAoEs6ZistlYdxuqJ4bqALX9fF2XIWMGL3KGFdWKncrsYOl9+XfadmaFT7JoHHQ
	0SDYZNkQkNVwNp/oPoz3jenQkenqh5QHX2ByxxUC71loBRVqsP0n6bZ020cD5UQvGQ4EXIbNLoK
	Q9vsfIeBEVWNVHAit1MjLnSmSz7iv88RlIJbpMQdZgHdLUzcp/TLFP4t1fYoCqlAfU5PSlrTK6w
	Yb9Xp7ArdA5mlbBj6k6vUFppaTVuHzJxfAxU+oHmcpu1re/LOXPn0YPIlgJGJj8hpXwb1bQ1RMx
	Tz3g==
X-Received: by 2002:a17:90b:514e:b0:3a8:10e2:ad05 with SMTP id
 98e67ed59e1d1-3a810e2d610mr1367843a91.50.1791184370925; Mon, 05 Oct 2026
 00:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
In-Reply-To: <asKt42FgsbhSbQUP@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 14:12:38 +0700
X-Gm-Features: AclHuK-Et_fC8GWEQTaTqwFWDt-VY_3yjba5DhCZkN25S8jgTJ6mltQqi4wer9o
Message-ID: <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_001251_932302_2C6C84B8 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Mark,

Thank you for your review.

> > +     ret = snd_pcm_hw_constraint_step(runtime, 0,
> > +                                      SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> > +                                      MT8195_MEMIF_BUFFER_BYTES_ALIGN);
> > +     if (ret)
> > +             goto err_fe_shutdow;
>
> This will return 1 if a new constraint is installed which is not a
> failure.

Do you mean snd_pcm_hw_constraint_integer() rather than
snd_pcm_hw_constraint_step()?

snd_pcm_hw_constraint_step() returns zero on success or a negative
error code on failure,
so it does not return 1 when a new constraint is installed.

snd_pcm_hw_constraint_integer() is also called from
mtk_afe_fe_startup(), and it can
return a positive value when the interval is changed, zero when it is
unchanged,
or a negative error code on failure.

I will change the caller to check for a negative return value:

-------------------------------------------------------
ret = mtk_afe_fe_startup(substream, dai);
if (ret < 0)
        goto err_clk_unprepare;
-------------------------------------------------------

Best regards,
Phuc

