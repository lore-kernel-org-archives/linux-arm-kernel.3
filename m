Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807EFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=; b=t17cqEjjlQgxgQNn4uZXKmGRMx
	HglTMPbQyAnwhh0o+6NAPdjTcsJtCyJU2FRSqprD8UQcYXa3tPxq7jKtcwanD3VjbJW2w3zCexGNm
	jkSiIdAF+kbqQ1F9XfvalQ9BzqOG+hrtK00g/ouCv38YPbNRUTcRIUQNfDx0nq2KR/LniBmWafViI
	d10oQEu14IhkKoJwcoCHDRvRN6aTHM7ZZSHcZDcSl0/H0wNQSN0fmeGuvzj/6RLlf86eYfbovyMG4
	yWWj3RTdITwPtSO6TPyNr1AKyOYI3MIQ1NAvyoPNKtcjjvoz88nrlkAsG4ZspA7nh5W/9M4nqxaD9
	qa/hiMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wws1w-0000000AjuR-0Uje;
	Thu, 20 Aug 2026 01:57:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wws1t-0000000Ajtg-3pZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 01:57:19 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8486ac3f347so357991b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 18:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787191036; cv=none;
        d=google.com; s=arc-20260327;
        b=O0EJBrzD7ZsJfua9xrJCjebOH1dR2rREryIU3k92VdewyA09FH8iMs+Une/5Umziyl
         JUDqRMXk1Sh9htB3O8nFhJ2+pskCPdJRDsAfTQkn7AmiecmOLi6AGvjgQxQfvY+L92Hl
         nPI4CWOZlA0g7oZ4LiCRPhmXLUnJ98JnxQ+RxzUqrPgtyMy6cVgxUQrGdKjGK5lo+sVk
         Dh4f+xCvR05XR7H86L5WWgQdqrnEJ3EcJGb2rHfG6ZleNYWvpjiy8Jly7E3QMBtYq4g5
         HCZVGXdlZZW+6ho9a4AOqrP1MUWMP7fyRqLH5vcW1Bs0/yL4uF9KtXJrGV3LDxLOlFkh
         0UsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        fh=gVqAKlahfHtBSH2Niq9iOjS4tl6pF8aRRwU9Pl8eumg=;
        b=M/VSehO5VgQ2mNTshjFBJWcgTZTUw4hba4rXzyWfBxFTUeQTTowuzRao3BGOmsgl9r
         3dC+eb0MvFVNDO/LL+xWPyL+35l+M54IOyYYUj6Y5qlB8sI3DIxt1NgA2wk1V8mv60yU
         TYf8wjIfVq/ELkIie6FAqXE3jrT3lnBdNtSz81TQkmDA4DT2oPIy1JfangkbcN95P8Qe
         jy202eerXcQpGtpU+VLuB3fWIB/faWAlNbNGZ/pD6iKd7PZxbyA2z0ZtzCrvFvBKeHxw
         XKcy60Zc3vtH+0SkXk2LuFi4PF6Z3aImeAIwdDdab/qX5onD3PnEaPMAIO2yhMK3gkz+
         TI0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787191036; x=1787795836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        b=Y/jJWmD1EaYSt35zUJOTyIQJknvLUIzwT2Y2wB8TV3Hwvi+nnJY6nlQEKFWBxaLxAP
         zPY2UzOO2h2hCmk2FoJh9w/aPUwkLhH8z4Xbv57QX6m4dXYqOrDcCzuJQwDXFER75b5h
         4V46ldoHBwDsoxmWFthWRGM+LFe/Cf4mELN1u+oqSecCfgEa56U7/iJQkv55CBK8qTVr
         lOOHwQygf6Yb3Uo26Ta6sZ1ywPyq4Zf/DW3n9Ms0t2zr2I8oW+RbUW+h5VD5VUajXe6n
         Hp+Dnk6evQgkKTfUdx95EsqH23GWAuWMoRc/zJUFH4sCUg3m/4tR3WcYebelgSf+7e8j
         HGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787191036; x=1787795836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it5S9JSefBP08qQNXkvnIfWUHs/AeH/D7OPJ+RS6iTE=;
        b=rQh3SlgOv93RI4FgcFKKakerSHwr0Q5TS0cV0/Ubc+8nZn5o+6LEQrq3L4D3ITo5il
         sxv1neOUja0wSQs434RHLAH5Xr6T07gy02GALu229va66bNOFjQwcMgTJL1VhvuzbAgQ
         BMbcjZ04XMH2iAoU2hVYs7umVL2aNSf2BISh2wBac3ewyEuJNMF43CzhPLbDA0jz/PGt
         kLdHGEodbJqIKcSZN8TUTdabTiI3bo4tMeS3oMtEw4ELB7yUDKmAU/KBetpOQkPHX/QN
         +rxle568xehTCDTUmqBgTSDpnKwRD/uUiP67+WkfwTeC2izvzeChuVqZwWGNfc/SL13t
         Aetg==
X-Forwarded-Encrypted: i=1; AHgh+RquaW8BVfNv4Qrfh6Ltm87NM8qerghIDzlAOG+fQvIqG6mSQFPSLqW6M3526ZhRQUP8SZr2LiJJArMvvy/ZBvL7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu6q6bdFhWmBvu5gr73s3Pnml6GexP1kV86snI+rIuNRrOc1mA
	TpIxV4OYGuajmgg5RHpM3an6si4rftS5B7IAAaq9Uv23Gb9ss8tbnfsTf4LATX/nmt6atph8ziH
	IxjNVHs09VEPgcRPIlIKHSJfrC1Z4J+szvLKw
X-Gm-Gg: AR+sD131LyhBSpMe3K80/US7GzDMHC5HCeVdfmpCceQ8UQKp0uM7VbkgWJUm0SFLHwN
	bslLuqroGVchXSPbORpWBHEOdeawQ/b9XqCjAkBq5DY8IjK8xaUnjjmHrupyFMeI4xnVoERErHK
	jfUwgcGBnZodZldWdudHvb0vzy7nI8rbAoR7Tvh1jNq/af5iL/rwqeDgDV84Nv7YJuuQ3ogQcYs
	CRG89OSQdkkWuovEeJHis+klEtVAeIgnz9YOnQNYGWfjDStzJ46j+XtJnUysZKIIp/O7DPb683e
	CUHv9r8oyZHFnNVtHW5MUwooMicElUtXYXSMktqZrBMUWIluDXJVkIgmJqUvASZkVsZu8+OEkjm
	MpTYj/iDpCDXPJkMhhEFhvePJY+En6m4f0PumLD1+3qH85IkPMGc0NRWz
X-Received: by 2002:a05:6300:6182:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cd14c6b150mr3711941637.1.1787191036226; Wed, 19 Aug 2026
 18:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101849.68010-1-phucduc.bui@gmail.com> <20260819101849.68010-2-phucduc.bui@gmail.com>
 <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
In-Reply-To: <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 08:57:05 +0700
X-Gm-Features: AcwNN1WvPV8f1W6lpVMiV3TmhZ52Aju5OoAforzPDg8091qw5BC36o8DvhecH-s
Message-ID: <CAABR9nF1VaUKeUDhJydJYYc_Jc0kdYCdD3+rtLNR2SPCx9RPbg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_185717_959871_7E8F2555 
X-CRM114-Status: GOOD (  11.33  )
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

> > -     apll1_mux_setting(afe, true);
> > +     ret =3D apll1_mux_setting(afe, true);
> > +     if (ret) {
> > +             dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
> > +                     __func__, ret);
> > +             goto ERR_APLL1_MUX_SETTING;
> > +     }
>
> apll1_mux_setting() logs errors, do we need to add another log?

Oh, sorry, this was an oversight on my part. The apll1_mux_setting()
function already logs the error,
so there is no need to add another error message here.
I=E2=80=99ll send v2 shortly.

Best regards,
Phuc

