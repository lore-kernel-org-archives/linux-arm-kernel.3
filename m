Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F0CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=; b=uuf7v2frQHzyNkZVCpW1y/kWon
	lRiwxNhZ+5/PUV4x6A4i88vcu2knFOzMZLejKy9owzYlffdd8dAfjDNszdTfHyLbfUthI3DeN31xK
	Pwk92wYTQ0+3AjepVhELC9KdnTfwJUoWlyINlmRmD/rGQMF/YcQChiDq39Q7DZLp+aOhUt+3aGPNN
	l+76d9t0EAMRQwwgsDvMkWwvRt8MprK71VuFPn+1Efrf2g0bHhWAdIseaQeKBPatiQnJRurMeEB5J
	bTDtiKF5Bd5NFO23fKcdNOXHOi9Uaex3VCg38AJW4XVDEJqwvxXeKaGJdh3DHfPRENkBpgFBX1xBO
	s2GO33bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3Bz-00000000cVd-1TCv;
	Tue, 06 Oct 2026 11:18:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3Bw-00000000cUw-1eoV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:18:41 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1248013a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 04:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285519; cv=none;
        d=google.com; s=arc-20260327;
        b=AEIxFubcI5BwvUSQGxI0jq6A9CdO3zgOaZ/t789NlDhM9mOw6yPVFId5QbpWsI76k+
         Gd1WlPRMVnsXl3H1Zd1gV+eoauWfpyB85vhEg4y7nR1t/iT5mFa5grpbR9qRk4GTj5ta
         R8XGFgoZvkuNP/sgtqIDUNbAcGYSLuOicYsDtU1tBfMw0ekknkE1kSDWx2CY20J2oa6M
         tkqMFaRSysROJ69ND/Chb5/qISmsSpVfAfiO7nPnYz0qqjcGZmiMa+AMy+PjoWiq5k02
         93od7C75NAfRK7IFT2ylU/ndcR+sNUdONN7Hh5h35SLPeutw3QfrKvCy2vWU9bIETbRY
         P0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        fh=7Ysa4K1N4wJRbNCiTVgGqrnzvkjSdpXZ0HQcEKT7Fxs=;
        b=VT18FLT0rr/2+NZxkDePYCgfCEccV4qO8OHZ2ZgIeybc3tKz0nEpO8sJYJEvrkbfp3
         tJ6dDNh8Ngh1JSxFaQkLLnFnwpsKMB198OpYCuXS5CRBicbJAu9JN6NKX3OFu33PpnaZ
         +HRr9rwGRIIyc0o9n5rbDqNBXmICLgCguOQv5tRFRwGU9UOrMdLFkfXQpxcIJLar26zx
         hJ6XYMPJDDJvUWaYJxACBh3KkB4WvHhBamc9sak62ejR+lFIjhJH/VobELWk1NG0ADzM
         jOFYUKXdwhZhStT04kM6PxQhIBWSm1fNnagt4GmWdFia3DaQIgkSf/MFLaa5/qXeaZ+u
         M0oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285519; x=1791890319; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=RXr3/MOjPbYYaVuC+cTTsDeiqW/Jc8NvH1SKHBI8p/rHmYwmu/Lpl1KvqkhD17H/HK
         lP91B7C8boPk9yqeHzDGF6DDBrGlRt2Vxs6rXdiNYCBbx9t3qhilf4jk/yak5G0S36I/
         zXcFfF/wj0AUGM0B1cqbo20HemfcYgrFcngRBGRbe1RTEgnJGEUQUG4r2NB74EiPaynE
         9XZPxQSx3wk1+eN0eBSi4ewsUO+xpwCOpIFT2chb+F6RsJy3xVcloKjYgikI+c+/o1mq
         AaevHzf+1Ada6BsToGtIOJQE3P2oess8kjo4iyvP5CyMh2YXaCYdfD2XmpGrX6D/ogR2
         0+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285519; x=1791890319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=jD9I+dJ6YdFfVECNGWIUFuRhtNvzH0OzrKzNElBomd8zFuM27Rge4roCy0gybMgQos
         KuL26Cl1V0q6ZtGZnK0Ye489tlVdgFTN05wmHk3zN+RlFDqoWIqOiZNr4/jjgbnIyo3x
         zR/sJwuPWs82dmr5laWzlH8pLVEoeyPfsjgYpwnZV+VneSv4zkzu20pwfhkMriJ9m/DH
         G7X2kKn3aD/t+vVN3VRoiaLyB9cp8H1PqFTBX4WZJPAyh0I/l2csp0s9nqVVm16RyLRR
         UUNmiN2wbNm47JNERMwZlyZMh2kQiLCLbDJzOuDDKxCQpLkDPHMz/uOnbfziejv+gkAd
         Lnrw==
X-Forwarded-Encrypted: i=1; AKwUvBwuwqTjWNw1cXfdQtnm0M0v8md3hAJBY7H2ufYW8Qar4Yf/YAvOcuq7mT6JimFql4frVNj/r4qfZp9eB7f5EPJt@lists.infradead.org
X-Gm-Message-State: AFq9FYKDjOvtPPetD6pE3E5RD1gcbDqEUBCKL1cvcS6hge+vnZrsSTyz
	EjKnI2pEu28xTQQyIkV0Gtn44ZPuU13xqgMEFtBbDOWSE18CoKJxPOih+Ua1kpZLF6NfUorsb+o
	uPtebaY3QTC0nL7XImKFO02p5Avn1X60=
X-Gm-Gg: AYBFou1O+Sgbmc7Kqd79Mey8vzSKph4257oV092boQHDYltVGY1pBoMJSOLiNKRrO2V
	1grqgcdeXyEBRDiJpzInxwhq8XBzXkW/0Lk5aike70RePBP5+xRBtOuqB+w3uyC6OrkcZw1K0KS
	zG6N5X5rloPCBB7knJ8uL8kaI/OLtHZomo4XSpuiVAUZAonCO5lEwehiFnGG8NVSuzsPVPBG77a
	dZbY+s6gNczZOZRq93Ny7V42o6AlNISrcxMmlxtT/HH3Z18lOCSU2Jp1sjwm5jIGK7Tk0zOriF0
	xydHTVM38Z0dy2QXGXymASZA7Lq+/wWVqN2EuZ8FoRvAICc1kX5TduDOcZhJkK70zTrOSpkOCGE
	W6a8y3uJRG5lKqXxOJEOXNnpTh5p4VrN9dXco3HnOYpFpcGYmOLCg8cFtOmiig4ZL9qs=
X-Received: by 2002:a17:90b:2f05:b0:3a0:b312:1fbe with SMTP id
 98e67ed59e1d1-3a873517948mr721042a91.23.1791285519572; Tue, 06 Oct 2026
 04:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-4-phucduc.bui@gmail.com>
 <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
In-Reply-To: <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:18:27 +0700
X-Gm-Features: AclHuK8llUKr61cpB9foKw2h-ehaYs9R91uCOJ-HEm_z8nUdGQwIllDsJU3R1JY
Message-ID: <CAABR9nGYB6vyR4AraotegkQzt3Xd1s+uFMF12GQdjY69nJiZEg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from
 mt8189_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_041840_434891_B0FE517A 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Cezary,

> Nothing major here, just the missing space between 'mt8189:return' in
> the title.
>
> IMHO the title could be made more explicit as you're in fact fixing how
> the snd_pcm_hw_constraint_xxx() is handled by the driver. "Return 0 from
> (...)" misses the point.

Thanks. I'll fix the missing space and update the title to:

ASoC: mediatek: mt8189: Handle constraint return value in FE startup

in v2.

Best regards,
Phuc

