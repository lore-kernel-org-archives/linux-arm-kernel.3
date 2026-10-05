Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BDECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=; b=rP1ffHPmzHv/K7PhFTHLBufn7v
	lOm/mKIBPwR0xmxZypMeRqsJBgX91SjQ7ULZvd5PhlbyB1h6va6YNzlBF7jwUk6C+TDXR6RKGMrsi
	YeGNznQlgqGpnQeNd9d/nghWbXCMAYcrl4h47+d1NAZA/xrD5kzLGzBbwGdKdaAp1dfy6b/Hw53fT
	dEuveFavXhq4LSOqp2OyKSs10yLn5qDO/9Fk6JUx0l25usjuce+P0412hGc/bYiGiEyT0kFUS2RxK
	YPb6Oro9mteqzTzC8hVtEhf46iis6Uh1L7X4kD1TJPYBUFOD6LeRjJ/KPFV2l3XJyWRV0trDqkOvY
	I7ojgBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf7t-0000000G1AQ-0T9D;
	Mon, 05 Oct 2026 09:36:53 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf7q-0000000G19f-0cXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:36:52 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-86b90133ae8so388618b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193009; cv=none;
        d=google.com; s=arc-20260327;
        b=hsqFQN/xwNJs0AdPnFwrynMUhVbmXo8lb4+g65ygmnD+h0cdvGkMSmIm7sg6FPy5nl
         bkxopGrmqA+JFKVq3d9jlpA/rqW7bQYO3VfMJuI0I77X6PL8CeZBBxOsM1GVZ6daG8+7
         tGTnBgJtco+0LrrolA5+q6XXf3VMEzGAJQAxQZL8y3M6wr6O9pPQakTBGN2Ewn9DH7ST
         SHw0fMH4QPoBMkcjMmm0xpL8Qp5zeVIEjTHzFBoGe+WHqmPzeNcWonxYYNGSuyyCnA7r
         Vv7i+cIwV0bCiKKeu2DI1JlbHC39jqZUMeTXAmhgIGUduk6ecBIdbpUTr6ykdLs/KeQg
         Ebcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        fh=mr81zUUX880XO1ackZOeW1CCiRea2fx+NkIIwSXnMgA=;
        b=rHZR0DJyLhF1ZwVkY2KXnsDHCQvbGLwdNbLay6ubuWrYmmlhS564dPwuqRj9D8Th7l
         RfPY8cminOhCSRCKmlMRKP3dMVZsU8py7sM8CabFHVLoy9AeGnVnCDfjx2bjsbviENAU
         MClEooo9fsjfHfUkGOU5JJW1iHrC1r4gSZ58mt7kzEEXPUdm7ZIMRMouk6eLs3VmthUM
         qG3we/3M7Q448dbXS0FUFUy2/J1vwL+jpd5wXVxkWZJ0bQ8fQvF7DRu63jHj3U7K4pf0
         hwsjLeGzl0X8wGIhn7L+V3Wlu/ux72sflUEoMggFFjMCHS1FeXftKIudpBAMp/AXJTuw
         RQXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193009; x=1791797809; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=N6jWEqz2ECZvGMe38NZj3ZhnIjuU5pl27MAQDkVa47bi7Lz+O8YBFNnBDZ6au9aJ63
         U39Q+kFb6ziBJRHYWgZLcaPOWZVT4W5g+mwVfSpzWeMrbTSCDwlLPuxwvIcUoXLunQdp
         jNIsWsVrMcPsOkJxCbeCS03jP+8K/oS3sYcbz0d6gNsroMlLHfm8ToHDf4AHpbatdtVH
         sbGDe1c8kBZVFDSnNUnpLF/D4fveMITP0Q08xo38bdn06cNLhKRwuGaAriTOhb7UR6ts
         lqScKBV3uoq6E5/s6FC1OMKKPtP7Ra+L78YIZ5C0mK8MWMu4WYeQMZ3DfMkzffuo9roV
         yGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193009; x=1791797809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=LJnPsiV96eCBc7425M8Pf0NtURdClLpoG8Kd0GrGyBxE21lfFazMqOSEmFlwleC8JI
         Yv8zcisu8fJ4rKGJEFM3eozi2OO5Zwp6uBqD5tp1Byx4S2AXG6sTWJH0LMCiyNAkKi/U
         NHJ7Ccv3rPTB4cfLbLZHgs0w+jb3MkMB+JI18uBoolb5nAUBGSYEpJkKJHiCRJ5UJ9vS
         ViBJjW3RKYQ1jlHJzEvLD8sv0yBvJ0An+avCOPnQAG7RlmLYEcEY7/aQmcivCSLjY0Bx
         bftZDMaaRCe/uL+cV++gpC4KV7kHhPxe14fSSxCqIxChckd4H7xtP91uOfe8dA+kdrnm
         83kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJFfl6gFu0GBNb8K+ZMcHuxEbx6L+gPqlSmWQMcBEGYF/OtB2AXfybgI/hM3kzrAgaEg3WAMbFumMGfnA7R+E4@lists.infradead.org
X-Gm-Message-State: AFuF++mCrTNh7wm+8R3imC7NwwpS5R0QYeLhPNjdJb37DHD15tjMZsMz
	kzE6Fh9ZAeMVoyL+/5m+MqgBLTA9+zzpR+71gHTAuaVtXmnkgNFHPO1uP1jn3roqvnI5X9IjCb8
	lPCJ1YK4YN4e9RyVlqO8A4u6ESEsiRXk=
X-Gm-Gg: AYBFou1bxSSK3VLTcYx49bV5I3X1UbcVrV5nqE5w4Rf5rngdFnMUTC+cVx5IhrPhaWq
	T3fF3Fce54oC1MZfEGna9POPAv2vrIMcKzpXB/cqTjIt2y7MEUcZgFxropgHfxZ7U0L/FqWcMPR
	W5/mXv/YB4wFRt78yFRzkGfTvv9aq4IdiTACXBjO2YF2QlsCnayAL8IDKHb9GWR4O1r/tgCnF3v
	Mmgv0TyAKHWahn9TFG4Fso1I+zCUTl7VOsB40f01E+Hxn1kpq/7CkC15veKNqOrqbXn5cJCpNIV
	EA6n+YOz+kfZeZzi++D2QrPNvvwX6THzZUaH/PZ/M8PmRVtUejjjsS92D9wvnMjObtlBVNxUDaV
	3rGG2hfEl7+YrR177frsQRuUY8VOTBmioCTPvDrs6xsAZ5SgktycgQyUNklyyNthXZKc=
X-Received: by 2002:a05:6a20:ad98:b0:3dd:a196:308f with SMTP id
 adf61e73a8af0-3e0bd41280fmr9275066637.63.1791193009054; Mon, 05 Oct 2026
 02:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com> <asNbjSrPYVbeqSae@sirena.co.uk>
In-Reply-To: <asNbjSrPYVbeqSae@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 16:36:37 +0700
X-Gm-Features: AclHuK8rGaIRVCf1BZigYTPKZbRcvBezN-u_N5cJZ31HBEOmlU5r-ZSIA4c-8uQ
Message-ID: <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261005_023651_281931_A5E277D9 
X-CRM114-Status: GOOD (  15.57  )
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

Thank you for your feedback.

>
> > > This will return 1 if a new constraint is installed which is not a
> > > failure.
>
> > Do you mean snd_pcm_hw_constraint_integer() rather than
> > snd_pcm_hw_constraint_step()?
>
> Sorry, yes - Noticed it in the _fe_startup() that was called just
> before as you say and didn't specifically check that function.

Some MediaTek *_fe_startup() functions (mt8195, mt2701, mt8188) can
return a positive value on success, e.g. because they return the result
of snd_pcm_hw_constraint_integer(), which is 1 when it sets the integer
flag. Others, such as mt8186, return 0 on success. This looks
inconsistent.

On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
it calls soc_dai_mark_push() only in that case.

Is a positive return from startup intentional/allowed?
If not, I can send a patch making the MediaTek startup functions return 0
on success.
If it is allowed, I can instead change snd_soc_dai_startup() to call
soc_dai_mark_push() when ret >= 0.

Best regards,
Phuc

