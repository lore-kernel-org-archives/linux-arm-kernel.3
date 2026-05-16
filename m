Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B22CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 23:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=; b=YSqgaueMxYX9NilFsk8Ta/keOu
	dzRvZJ09uX1tqwU/luoTqrFw0WJbvFFPudD1g7zyhr9m8j9lLtT7faDHsA/K021MIeHAaiDIRYqTm
	6CeAwc+o+ybQg3lH1ESoiv1uwJ2Lb09AqwLdivQpH0ppGdodLpb4DpeX+ElfMXg2Jb/cbure1TU27
	Zj9yhcBomjG1kq3DRx4knL6j8On8wOAJFA8A8HOshpKMcym9lCWKvYcBqAKZgBFS/L0cEXcvz1iP3
	SYpw5ZrliNuwCo0s62nf5x7CNdgisjCFsKhWzDT1XjwXhWcxdY5sOIys5axXbTKMnho46fKk3FeXB
	c+lmCTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOOm3-0000000BjXA-292G;
	Sat, 16 May 2026 23:50:27 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOOm1-0000000BjWj-1D6b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 23:50:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so353242a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 16:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778975424; cv=none;
        d=google.com; s=arc-20240605;
        b=DrJpt+cCOdPeMnllQJsB9Z6yu402ZdNEaOk9YtZURTlQf/mJw9wMFWw5patfCpaoN3
         yIWbFvTr1ji2ZF24RKi+0bAFXD44x+yp+5cr+6rIy3qKo8dqNgdNm1Ep+WPUocdRV8pf
         53+23FuwP51KvR+snsSW4oc9SCO7uWgltyH0brO/XBL8a6M05imQD5SzPBPu4ei8ytxM
         72BKPUblUe6VC9/61Vi8RRJb5fWPnHBiWSEnwQjOl9bxehobTKf3KSva1Vgzo78NnLFa
         V6gQm6APHAhustMX1IGKbDJdZxJE1RdgDFujF55OmbPWXfQW+YBhhtFYX2VOogLcbTzb
         v62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        fh=RhlmfSjlJOLgnwDytGKZa2ikmPyn0LGWxN5C7VE5mPc=;
        b=hW2DrKSUTSLXLo4X9EVjY5JZWwsrqsD0gh+iQAIVbUCGGpsY8Up7KYXFVETar+FYV1
         oG7EnWx6aHLv+zzvyRejKP0UcJnc+77MQ26/CM7a5p9gZX6Lon6nv9M/t7CvV8Kul0or
         u8s6V0oi14k5qtKAk+TQxyb7/kyZrZlmQu0VqwyknThA6OfFaQJ6FAVr/YcOuX1InBk7
         DHk9I+76dT/kslvud9JrRy4y4cMaAna91SCCoy7HRTzYdq/nk1H5VvsPzXC470awDwHH
         7F9QxgZUm35R8gDJcqmMxnaZ3qO39Kn8NzcsX4Q82bS0AkRkmSfDEzX0JS7fSKWmzLh4
         Wz+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778975424; x=1779580224; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=h9P+7xDaLKxEbhJ19k+D9eRsrj+wUybzq7T+HVKChZ4YnG4Y4A8rrxuiN773jv4QjP
         NBa5th2ybXqQ0T43eHqDdpVMFtI4mgpcrDckRhMZiBM1Km5oslFEEVfWZeFfKOQSUIkE
         a9vKn3TDT0Mq49KAVVPsS1ye4MC4cd0BS5Ao4Mll6o0414Wh1OANaObvmQ3nNL4j5lD5
         ak25ssltadhbSgdyA6gOqpTNoKJGeQTPeNF+4E3gFVU5pP9bFexyJWDzbeDopw+IiJML
         KVIbIt+4eYc7PiJmno8TRR6TDITXd4DrwDG/TmJyYycpXCPfyrybj9gQLy6kaOiPeb4W
         lNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778975424; x=1779580224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=TpCl7ARDZjTD5O4erQxilpdiTc2MwrirGdPPz6e0uGxjFs9mt7Ok58ydha1YMQF4Yr
         FqLFFQAver1hSkaovYrISO+OOk13XjE+Bjhra1RYKfBNW3HfxGLbCK2Le8fvBrhCzbhw
         BD68+/rljgqgJE6wplxA6qlFXNc9ltLxTVFs51VVb/nOfnW+mnVxcB3chLaMctFZV+Nz
         FD82/HWL+5d1EQQytH2qd2xMq4EsYZpXvfS555xLc5pt4eWkBawct8WhktRNHZhKs02C
         +nmrPYyezSM+gAKFnmj8gTo0zdYHaMFvQKF0qa1LHdw52W9lMry8jRyjVIIRqo2a3pRD
         5cmA==
X-Forwarded-Encrypted: i=1; AFNElJ/DvvNmod6BDLF/7iVsl5RAHjV0rmMhk2nl01xEFPZ2A5eiafQWocNSUEqoi9Hgb9q6gxgFJyoF4zxBUgy1cmWz@lists.infradead.org
X-Gm-Message-State: AOJu0YwGtRzt/jnio5n8SRlDM7kvWprWcd2SPggB/p6ZjzABQBVMFHN4
	/s7txzpBiNkJrX7/+dl9IKnDPftuIJL2DylLb6aZ9mxQg7Sb0s8KD9l2YhUZwtrjNeEqezG+ELn
	1RO8SqaJpA/tEYjQ6tz7eQG1tNsty9sQ=
X-Gm-Gg: Acq92OFVd+DOKaNCA6lA/eWbsUwCOO4ixaSmcYRM8PQqJ3+LXtBLmi2PkiR+qGHYjEa
	4KJAsXOX01gmHBCNQqG6ys/4Qe2SJABk6O37uEesG02m2d4F5B3nJDl+OOlhPGKTYnvvKaHGbTI
	aaDJISmTQhOsKe1nnVQMIUdxbeMh/wUW2bxPaOnzjP0ONeF+XFLlpVeBf1vZvJ5fPZ2PQBm8gbd
	OItzzbwNcwktF8LgHPB2GEvsHT/n957KjZb5ZTlfLe+H6vgQcmWzYsJHriZrCOX5zdRmw2zoesT
	hZsN2RTPERI5txJJcDlTSMaGYF+Ek2MqCO5iRsI2
X-Received: by 2002:a05:6a00:3928:b0:837:fe75:104e with SMTP id
 d2e1a72fcca58-83f33bae7d8mr10282417b3a.5.1778975424205; Sat, 16 May 2026
 16:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com> <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
In-Reply-To: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 06:50:13 +0700
X-Gm-Features: AVHnY4IsUkQfn46YMLJeefxvMG0oEQBhPAdzpdl8m066r_PvU5WUFTx-_5lbq4I
Message-ID: <CAABR9nGsb_zvH1w6GFDqGFNCYjThCGuQ+RC91Bpkwu=h9ypcJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_165025_368252_C7216E26 
X-CRM114-Status: GOOD (  12.35  )
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

Hi all

I would like to make a small correction to my previous email, and
also confirm one additional point before preparing another patch.

Correction:

> However, I also looked at a similar case in the
> micfil_rate_set() function from the fsl_micfil driver:
> https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

In my previous email, I referred to the function as
micfil_rate_set(), but the correct name is
micfil_range_set().

Additional point for confirmation:

Currently, in sun4i_spdif_runtime_suspend(), the clocks are
disabled in the following order:

clk_disable_unprepare(host->spdif_clk);
clk_disable_unprepare(host->apb_clk);

Meanwhile, in sun4i_spdif_runtime_resume(), the clocks are
enabled in this order:

clk_prepare_enable(host->spdif_clk);
ret = clk_prepare_enable(host->apb_clk);

I checked the binding documentation here:

https://elixir.bootlin.com/linux/v7.1-rc3/source/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml

It describes the clocks as:

properties:
  clocks:
    items:
      - description: Bus Clock
      - description: Module Clock

  clock-names:
    items:
      - const: apb
      - const: spdif

From my understanding, apb_clk is the bus clock, while
spdif_clk is the module clock.

If that understanding is correct, then the suspend path seems
reasonable since the module clock is disabled before the bus
clock.

However, in the resume path, the module clock is currently
enabled before the bus clock. It may make more sense to enable
the bus clock first, followed by the module clock.

If my understanding is correct, I would like to prepare an
additional patch to reorder the clock enable sequence.

Please let me know if this interpretation makes sense.

Best Regard,
Phuc

