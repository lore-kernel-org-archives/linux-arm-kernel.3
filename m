Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F2CD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=; b=1u7neoQl5uOyXPeMXw8URwclTT
	FAiS21xukJ48D7ffVovWGw51406/FyDcXLac4cYi6/otaizFCx4gozbHz1PmyS5F1YwS3hIhhmc4e
	U6AKYecjHF+MSS424ot9SQA3rXeBapq2JI4rUfeMha4XXzj5Ew89WyxNlPT5sAfg3vO1lbzSLtqZq
	GtV6CULXQs4UKzNGCcqmHLu9AhH43ffafrQ4WdGaest1cCEShpq7WzLA2oxHUDEaeugeRLLwOGUd1
	iu5ksmR5SvJtg6MqE4U78o7yPLEkbQeej+NOCWsXa08ZapE0JoOhDb7bYAe2hUhsR7SKBp6QxanDP
	TXbaOm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfyH-0000000GVYL-2bqk;
	Wed, 17 Jun 2026 02:25:41 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfyE-0000000GVY2-1UFm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:25:39 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-842848fd613so4513350b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781663137; cv=none;
        d=google.com; s=arc-20240605;
        b=L3rIYII6NSaRrskGMuU5p4JCNUc71KZ4GvoAw1JZPN0GsYem/+XPITv/eD9+xn6gPy
         OadRphSfzTet0yvPjIJq0jz9K4LfEmt2LRt1BeGBwPtfM8ShboW/IWTufFs0sNNGtIKD
         4z2JSDAw7GZjZPPaaT06IyMNzE4OJTWIY4//AR2dPIsY9cPX1DPv37vCmHyW3fngc5dv
         qmV9Ok8E4ZM5ocYu+A9QskEpvmKMHCZady2tvzds40Tdt9K2RIzoQags57nS+EaHsM8e
         NfxKDa3/vCNg5BWzEdjA5z++Fv54PtCcnqTQn+1bmnDu1T7FMZimkrSXDzvoCCu1A6bv
         JD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        fh=4OgSxBYx9HzkfAdk7QefnZyj9vrqbKgCQl8Qo10b3Dw=;
        b=N22Q+w6Bh5jNSkXlLgqdnD7ELig7rOjaE74xbpYmL/8LQm2s3oSI6Ed75ahABjyKaV
         qBAVHFQ3UEKB1QlfYpq80gkwL7+LpotI/Bdkc8iLQK1lnbHN2dt8pau1xE2zyvrajIGF
         97jWlxaTjitXnBc/QuuIwXFz8gtEfDtAwLk86yNbbUgM2ESsnUbJs1vN/980gnviZ5D8
         BNXD0PC3dxzDL7tV508zbz0OIJynomYsEtrlhz69GVTmRAG9MAkxvP/AjcZS1Q0t1Bvu
         DXn8/b+PXE7BhVwr5kyRDtrT2mXjHE45VqaNH/M4/7JuxGRNQLQM+i3KRb7Zq86tyXFs
         nMZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781663137; x=1782267937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        b=iQ2D/gKGI1poMwx4oRs+Sl3rMgkVgwkIdTRuATbX0kGn2IL1X2T8yyCG1ownKzLURA
         3xDUp0k5gCSUZGMiF+ghTq4UOSzemjCFjDyG10itY8/4GAjfL0cE98UDC/yvmzvZ2+Ky
         vvJ54T98nT1wNWhYXLOcHzyfvBtzG+EGv95l0miNm3pU3gMurtw4nspHZJ3TBQKFLTS2
         290uSeHdEbRe/jecfV63McYWeczAv1Z2YpBi9xIGRfxrjXz6zsMVHsnJ9Kbv52k3SsJh
         TUqcyBhGIGUgJm7QhfQVM0s4Z5KPaZxaSxX2TyH0OWUM0Zv/+JEhOfHueqq66dxDfvD+
         uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781663137; x=1782267937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        b=bLvL25o5muLtAI3faFb0ROzk3nQWMaoPVwzxXvy2wJP1d/Yq75YzzozA3RscLVIn1c
         uVzNnHH8f7q4HcHNC0svuIiyTlMZQDq09Ruocf7UjeRiLlA+NfIRANyxcGDLNGSF7qgM
         fYIdVspufJbg0b5C3QGH+okQ2X5nODdmazES/1KfNYCGyOolcOAUADTTZwlmzX4HYKtZ
         rUugp3w9UVgZ2z0FMENgUT6OrdxduEMy4VDcGh46qMfKSVGC/aa4+4Ifk4PKzkFR7kFS
         iLSrz7NYS5DVOT+Ct82VMpMoSFlrq9v0gzpKW0+h35mDPxECUXguKuZ4K4aqeFTpKUuD
         kLmg==
X-Forwarded-Encrypted: i=1; AFNElJ9fqhf84o8LpBn8auO/nTV0tRGtZbdEkp1WgZmWibYKQw2gLHDbkC7gaseW2DxYHFHnkSYYwMgkIz6NncjzRScR@lists.infradead.org
X-Gm-Message-State: AOJu0YzEQ0dJkFGaLF+cTPrHy10Yf1s03HPpwbhUU8YEKWReuJzURNyd
	V9DWw69dYA/rGHssxws4+EELPlDKwJrKx4g/PiaiNfd7hH0eb5+fnWosC5XN8EPJvcfXfo7D9tH
	yOSG9VuVZojE0eE9Niol5GF3mx9wCZk0=
X-Gm-Gg: Acq92OEfbvW1RTIvBx1TDkDFoBrlvTZbLnGd/zi/0tJvJozdl+Z0YFOZ+8WxR9MCllz
	zmplhBjle1KPXpwb7dy2FR3hTFuugi4r74BuszsbjKLk5Iwo4cDVeNSGiBIa7r5KeJcrXbsEpIq
	rOQcXL+OEZotkPCjX1LDVmpeGYOjgxJZGnT2cPShJuEkIvcCmeaGqlHb8xOGZJZvTaVPkRdTgTa
	uxnJWVx9qu3PYY+bvyTGG/8ONz1v4lHDdrk/xZzlvNwgKPJrAUwvKTicWH1QCBhLPwsU0/66W2D
	8d535Z1GuKsLbbYeTzRBjmdRocI=
X-Received: by 2002:a05:6a00:b89:b0:842:5da3:9b8b with SMTP id
 d2e1a72fcca58-845245994cfmr1624839b3a.36.1781663136820; Tue, 16 Jun 2026
 19:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
 <20260615093824.115751-2-phucduc.bui@gmail.com> <ajAJt-EV1sSfG3OC@SMW015318>
In-Reply-To: <ajAJt-EV1sSfG3OC@SMW015318>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 17 Jun 2026 09:25:23 +0700
X-Gm-Features: AVVi8CdoNbD47oGFTWSfJEm9Lr238WEoMJ3mqPMc2xN9snSeNNUZupbWD1q6iqo
Message-ID: <CAABR9nHNLchAnkeuGrDWoS4+sAKnqQMgx9b0cuv7rOHzC8P6Pw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_192538_564259_4BC3698E 
X-CRM114-Status: UNSURE (   7.37  )
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

Hi Frank,

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>

Thank you for taking the time to review the series and for providing
the Reviewed-by tags.

Best regards,
Phuc

