Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F3BCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=; b=qL4luNqg+WUZhcUSDj0LDTkzkI
	aN7ypze/MfDN9Rs9xUH/nOE+LMozQ6Wbiv07SHO5QroGjYsOeWQxMKQrxunTYLXZt/9gUYWP94R+2
	sfBwfZzDUco/hkJ2T1XIg0CujSZPX5MPdfErVxhHSbvsTEC1ooRVIstsd31AKtOBRdnP7upmTP9Fv
	+6J7qnAcVCid3EwgpDDr6LzZc4i0nWXdMvHtd3fJF0Oimxw24BGc+NUQu3sJeX9Zkjzxw5Jvw1wln
	kIQQeuzdtAH8RF7MoGqjM+xKi6dWNa4s1EwxMdQIIZrQTBeurJdfnWed7RIslje4Lc1YhRQOkBXVU
	5hxvDFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9eQ-0000000Bc0R-0veq;
	Fri, 12 Jun 2026 21:42:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9eN-0000000Bc07-2F1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:42:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0a5354da1so12703235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 14:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781300570; cv=none;
        d=google.com; s=arc-20240605;
        b=fUsKCeF934RcRT05w81SXmBJcScKC78Oaqvj2txkqojHq3sLADF4nm9w2YhKf1/2tX
         k+lVmO0dq7h2ufbz2WehwhaW+MVO+2QBcIWMHb7SDDLVuZWlcaca/KPhvJdLEADVkATB
         ykuxqtp7AA1IN4zBz0rJ3/VlG4slBWsQbmKvKsy41kutOh2HFmzi4ZhzHEF1yb6rYMRG
         LtfZJedpND8nlzkBDgT8T0ZFAHS36Kga6Db+D69SJ1FR0rhDHHDjpvJXEcLSmZ3QO1Bn
         wRQkgyG7bcV+8cP8Gp9ijXe8cEDLvkO37ldrJWM1/qjwUOGkL/2kpu/pyY7StzA0/qMg
         tyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        fh=VEmI8D7/vx8L5ASMNPi+jprsnkGgYmi7CClB+GI/yHk=;
        b=e6mqKF2t5MsJLe+gX7mLhShxQ/2xQghlXHVyVGVPsU74JqRz5nRAVJyo1H54niMNOC
         H6RP7vKwvMhcSRSYK6KNrO0dSmumn6E4U9SSnDuYgK0HoIF3pkI63F3qrV+BCh//5toW
         +NX6997V5yF9h7NMWoMTYTv/AD5H3//DFuGrtW+8zEmBhzaz9RrAMO8iC+JB18O7XI9X
         pk0x7dDDQC17eU5YrgB1RiO1WZDqh1T3gU1JleYan6zTJ2c9fI5vJBYZCxtKGclKUHBp
         9wXkua/ZbyoAWDbcpDRHKK+kiflyAzknyPm3E1gVH/c3UVJ4x8lBsOakr15osJLPzXeB
         Envg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781300570; x=1781905370; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        b=VQ6yUEQ4+d8DKnorWH9vJEf4MF/kf/LeYSE6rvXwbQcVsBaAJm6/dNyconXH4/8cRp
         cCN97cTys0D2aAbRk95mNI7T4YNiKnwio9JT2trXP5XZOjuv+JhBUVuiJ+i7rDRXDjGR
         DpcbJCyvl/3tesmGbo5UqSb7IVzKQush4IJqS4+VqLQJ5zfz602FgLI6WFAtkvIBMj01
         29cLscFlpJ5YDyWug0nxp8+w4Xe4z1D1DAym+VqEwUYdm8DeM+d/gVlr69HP0C7luzc+
         i1cfEPJZn3LC0ImSyrUKAlv52F3ZMbM+8pYEbBJvLLwY+OupDPO6ntJWLfumhhXijEiz
         eanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300570; x=1781905370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        b=CkZUKhzDJYVQvl1EZiBbFUzKVIH46vCSUBZQKgJm2wEQ0drnsQZclBk69ECd2SH4La
         z8HABPuIKQtFfMWiyzKPTfpfw4C4klCwmTZyoOG2E7VQUxkBS+1MJNm3Z7JViqlna3Gg
         jMozDlm+acF1qnxQYf5WI3cZ4zZ5fAJ5iWc2ec1D3tWF9djRu6CDXRM7UW7bH85u50gq
         qLtFXQjf47vqUnPT9KGo7mwIPCvznhTsBX3iCFZrAvUdXOMyYyrR9d8QMkPlu4L/xDAE
         zP7U1GW/oe6j8k4spWRiSs9BvPwDCX493p8/xjz2f2ebnJaWUHxcDYZ0QttbIFfDFFQt
         fqWg==
X-Forwarded-Encrypted: i=1; AFNElJ9sJz5Qu2cDxUkgLxJoxG0PH2ETbFRkwW/YP+TKSoroFMPZMPBSIn4Ha3xXwyn8GKJ2uHzAIsJ6B1Rtz7sb1X2t@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9q1UmLTbt+xbyfs/MhM1zQrAwIXeDVHUdh7CKv5PnZ7qy8HPs
	dRvN8/qOaexCJvCNB1DcwAe2s0vortDkF5/h0qb0ywcZ+IHrW9qkPB6z5iVaikufZEdeJUhKWRX
	3MLxlpOKdeMTIMGyGF7GD/4VUKUE10MA=
X-Gm-Gg: Acq92OEv3HJENm8W+WEAcvn84xomsmQb6oMWcRBg0ykZjigOCjJoy09OPQpLQQJ6UnN
	gszfQvhMyfKcH9eJr4AT9J+wN71BsQu04sxFZgYHM/0SyObySHU/7bLWE5jwZ9tvo8YMexMqwJc
	i0n4gzbb0Jd23ebqRZh4qetDcY6/r79yFs8WQCsx1CKOOyCy1fD23Jj53Fz0lnmxY8sqW0OqIxc
	lhbQEGAQY8tEOVC36ce89wcwECvyYDSDKnkd5aVdc78H5OLT1dm5PbqpMShyNCcAtXaMbJtQoNC
	ScqQaq7Z92gMMKj3SRTLpRz+jZUgSffGIQPk7WlmzVc2nM7IJlUdD0M0fSMuV6hxRs+WWxJa
X-Received: by 2002:a17:903:2290:b0:2c1:88a1:9839 with SMTP id
 d9443c01a7336-2c3fb4ec546mr42132845ad.11.1781300570163; Fri, 12 Jun 2026
 14:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260612132639.78086-1-phucduc.bui@gmail.com> <20260612132639.78086-12-phucduc.bui@gmail.com>
 <aiwgIjVqa4PeGjRQ@sirena.co.uk>
In-Reply-To: <aiwgIjVqa4PeGjRQ@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 13 Jun 2026 04:42:38 +0700
X-Gm-Features: AVVi8CcQ5wnxCnP2P6gAEQ2cG8ISmqVV88AetkLUV34w5sJRMS1FX2oxjLgXEA0
Message-ID: <CAABR9nFAaLgjUURzJjuH+vHwkExK2sq7Nu2jKC1Ge5+gLxFfiA@mail.gmail.com>
Subject: Re: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_144252_163002_B9F5D82A 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Thank you for the review.

>
> > -     dev_dbg(psc_dma->dev, "cold reset\n");
> > +     scoped_guard(mutex_lock, &psc_dma->mutex) {
> > +             dev_dbg(psc_dma->dev, "cold reset\n");
>
> mutex_lock not mutex?

Sorry for this oversight.

As mentioned in the cover letter, all files were compile-tested except
mpc5200_dma and mpc5200_psc_ac97.
I'll take a closer look next week and send a v2.

Best regards,
Phuc

