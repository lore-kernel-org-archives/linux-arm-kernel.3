Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C57C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=; b=Os5hg9MnQOcgiF7M1JSm79656P
	J3rMpFaHU+PZY/FNP3l7J6BY+MaI+XyNPTIvOrYMLcM/vwsvNJC+O+d02Se0nybaFMZV2TkwnR+p2
	Y0Tk8FiwGOSO3JLSr0IjQ0A/KoYJQs3J/Tt+0jePfPC2TzyGRe78p5XlWAtclwQxRamiSfVs2z3zK
	Xlzt9qn8w788Tpv4nfl1FstlRZA2RPq8K1b5EA6GJSTHxQ9Zi/dGa894dIh39ILy4mwMfBYOsb5W2
	e58Qh3PL84zM+IK2e/ZMwWkT9btipopIsk6nPiilOMROUfZU8eiTmiIE/q9zGeOnDD66tb8KDUeHB
	DLMpMiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Eq-0000000FUpx-0rP0;
	Wed, 12 Aug 2026 06:14:56 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2En-0000000FUpY-0DT2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:14:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso631719b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786515292; cv=none;
        d=google.com; s=arc-20260327;
        b=ZobFg3GN72TbaHBa6edrUvYwa0Hx482jbMouKJsLIiBaD1qGvp6EtbfbfKCOoJwWaO
         1p5lzHRIWgVWYr3QcKvxz+Y4jYfto1vsIahtZN0J4AkYkB0MuizWZH0rF1njbfTz7oZA
         j4NdpLOrh3Clk0iRFrAP9VXJcqJ/2BZfynrMFwmVCDLvsV4J0+mkYTR+ya4OVmSxDr7G
         98j59bUJOVzThpucQtUErclOkO7zbno56yvP2jNfn3qxIO/MxRnjml+Izxq8RhwemsUW
         1Idk1PM4mf+Q7yt1wcaoop6iGKNCR6hc1n3IbAns4R/1ZjjcLI22xqsTpwEAhz32Qbll
         KujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=;
        fh=BWqdZb1t9/1Jm0DENR79kU/ZFr6tPwPOjM4VVA523hg=;
        b=gu/8huS7px60L/wIoC3YAe6ebLJRRltS1bnM0AnwnOxT5Xo7mwYJ0c3UzQhfSk/gTh
         NZq4Jp6i7LU64aHHGZyg4z3THdWlzgqUDAGkYlpyConPA4k/GOLpGYQM6/hQnPh/WQk1
         VT+HqSq+bW0IkYELdoU1tLTuZEB20a2kytYQHNL+GqaHhhrzZe+QyyE9czCbbhY/M5e7
         GrctlHJ7Ez1CrCGSj9AmSMcEUZLoUtVwyO5Mi0/wv9dArPtH9HfhQ101icmwtKag90v5
         G2XAQEzzoUdbak+HRqMbn5tNadqcq9v/ORBhWAbbddno6VCXYzfonIDDwZtUBeo8eBX2
         2TiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786515292; x=1787120092; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=;
        b=pnKMHViSRaeRO0aHU3h1Ii89qF5bImrZPuioFOHjxoQCEqKmkAtrngD6u9eua1t6tE
         x5KYkxwdKd6Hek/UtpRlLF/chrTtrddbVdNkhE2pWwi3xbzPBfNhBxLkpG5SCR3VIi9K
         bf8510kCltzjALBTfs7lPM5mOA/j0fL7L53mrUT5C4myX/ivJhYiRiBkYysoFaEAkcyo
         IECMNz6ntH2n8hOJEX9T86TbbR67Qu9n8fkkYN56FZqKGlexXuJbwZD+gPTvIPfnzttB
         1sqbJd2579EMbP5lJss++xAuWQy6m5zEkpM9W/A4xYffLa9FDudo3abTPJE1BZJS++/Y
         tUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515292; x=1787120092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGpcKaZyDGIQV074XSBk8ZsfBy3nSYlr/HYg40wKCL8=;
        b=oYIYUVaqWAlGMljOOMO9em6fE0J73VImV3YyRVMP10vUIqm0Vj3areaCsL+eHpvL1G
         8Ji3Y5SaiTiHyQBRpq8t7oO1zbq2p/ifaflhNx2GEQpt5TidsaJ5cSGFY3Y0Spk0N360
         z7JPxbYA5OVTvJCkHLtRvHppsWCYlRnbf9dJTpwsHHVepm377vVd+r0BEZ+fNzfC/01K
         ZqnujNXUS3Gx7uS5j2OXmhkXoaVTZDZT+JnEXyewGF6jCN+swtUndnXV+eC1o4Iz4x67
         m5/mGAUDddsBS/1X2kv+XkH+iGfdGbV7D6NDO3slhqXEBs9aczp8qXSV/yySOKqa6CB9
         olsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPgPR9INDEHc/6tQjMGkX6g0ZALWAKOh68ZrII46c+K9IBh75SiUYWwu6G+BBuS8vLayiLqtBtO/NlVwSxbnE/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy223pJaZ9fIa6FnyiMJ4URm2Hpo/yrDW+JqXJnTKM3xhkOFB0P
	XLdrBpI4hq9lRVIb/64P9IhgVDUl217tIocMx3/lEJglq7d+IsB3+HmkCwF9P3fA3SL7u1Re4Mj
	2YJ2zvjANoXLLl90dG1B07ot6OtVOx44=
X-Gm-Gg: AR+sD10tKxiNIaVipt8zCAte5B+nx0Jhr7/S3gQ+zHB/s1lxT8CTws2zgxFhjJTjojY
	DoQ+DVdhvTJEaQARfhOIpRKNXZcUb+72vNGllzctjv37HvzfqRUDI2EPxktb53R6oOlxe5zZ/ez
	98eh/ErcTjA6wK/z6WwygJ1JS+HQoRTJ/rsmFcBjT7rbwxJYDPWNBnHN9snmvEs967XgCEg3y4C
	geg8myFmnrUe564GkM64ke4itRlMahnMlhekXtwgh6OFak+ZQsMR1UngPHvrFfTUr/DFb1bve0F
	Imz2H4i7URi2k9fLZuh1uYHdLchyrSnEGU1POn0ZDQDjg05ZYjtgih1DNbxstuJ6BxR4lERoMlz
	rTYw2biuTfjhrsPvfmRKLyXVUjATAeYla/QwnoEyybzrv14BrPUttAUut
X-Received: by 2002:a05:6a00:3a26:b0:84b:e69f:1b3f with SMTP id
 d2e1a72fcca58-84fb64a72e2mr2017392b3a.8.1786515291613; Tue, 11 Aug 2026
 23:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260811034715.6034-1-phucduc.bui@gmail.com> <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
In-Reply-To: <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 13:14:38 +0700
X-Gm-Features: AUfX_mzER_EgLNEvpTJmfvYgwL3eK_-FLtBiAbxBe6igcUypPzt7NIe6sQB_xgo
Message-ID: <CAABR9nF4q=eyUbzmo6-Co7NfVcg_bufHnffy8Ho4ZehHFZpqJg@mail.gmail.com>
Subject: Re: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ lookup
To: andrew@lunn.ch
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_231453_093518_2CD33978 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Andrew,

Thank you for your review.

> > platform_get_irq_optional() returns a positive IRQ number on success or
> > a negative error code on failure.
........
> >       /* Check for Ethernet core IRQ (optional) */
> > -     if (lp->eth_irq <= 0)
> > +     if (lp->eth_irq < 0)
> >               dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
>
> What has this change got to do with what is described in the commit
> message? If you think this is a needed change, please put it in a
> commit of its own, with a good commit message.
>

lp->eth_irq is assigned from platform_get_irq_optional(), which returns a
positive IRQ number on success or a negative error code on failure.
Therefore, a value of 0 is not possible here, so changing <= 0  to  < 0
is directly related to the error handling described in the commit message.

Best regards,
Phuc

