Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F5EC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 02:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=; b=IhgPcG/Ra8ZR2vTipSKMbCVgnm
	0jEhqs7vkoEULdm824gH5PAZreD60FpUnikV0MfdPtfGVEJnh7p6zV85aJFu7xd7DvMYNiEyqgUSl
	qT0UMvTRsrkyAd3fMCT08qISSxTXScUWVW4aynGmGXvVqWJo7dYc1WwNjpTngsgACmnAoaIrJJExK
	xpRliqfpJpvox76AOwNPVdWkxxE7AgY/nst0167Kg5wBomSps5Nxgc5KqCRrYYeR7CQSkEBG5JRMY
	XV4MsquxtLBaiyd9awdJww8BakZz9ktiodkYSqDD02U7iZBjSp6sVPdox+YhNTa9TkXU/iiv5CkUV
	hMtSl8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xf5-0000000GFQW-3Ds5;
	Thu, 03 Sep 2026 02:58:47 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xf2-0000000GFPl-2LoS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 02:58:45 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2217463a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404323; cv=none;
        d=google.com; s=arc-20260327;
        b=pVJLxYWSMo6Ct1vMOHQH8AMQMJYcs3RXBcq/B1y5HhyjQzYHmMV3yhxpXjM/V40+gV
         BtOaMzOez8Dbf79q9WIo8AHYDLwPyCZYLDw+1psNkRejvDIa5kCEsi5w48UOWp3xPU1C
         HeCis4tRdhKKzt4L8GQ5Qg1OrWHZLUu6UFcDmFo9rTzdQLR0P69aj2twm06RbLOY+j2+
         yW+clAGnmUCFhH+st1fDRnNVMlK20Sjotcgn2AI55G/Jeym28H3rFmfjj1VrYExNthSI
         A9+81r881mNhr4hzKd4DQwNKkSoSeWflgi8TZdPvkB6fJdjTl9EYlpxybhX73BaMD0Mm
         RSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        fh=86WCzfBavSSzv3rSuTf8ZebjpkymYSVxJkjeX/8oAhM=;
        b=VuAXcFdObg+SruE551sm97nJzVssYWXqOVOPKUL+BpZsOqjNYwrCESVbYs+kV+61Tw
         p5P9DA/a/jbdr/HrkYb+2nsobiRqqGFnlxi82Xbur7d4kGcgvKj1NlVJMtihezqZalFh
         T/rd3RLWGzogBjOypyVcvxvyiHcD+g3lvZI5QLME7/gS1PjKNfRUKAROoLmpNCsHMO/u
         3vNjejwjJSAPE355XznCXgNpAbbI6ydsRP81Oa3iKXOP0NVVD036HFP+Jqn44ivkEHJg
         tApWAeSXbTu2fdtQQX2m1SwZ/8hbp6/Jdx24vXlLQaMeuUQtwn7N2BSxpUH7ysD6mkHd
         Goew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404323; x=1789009123; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=RgODpQGWcy+wx+0B4mY0BJPUNgMTgDXLg+CP6xz4OM/aJqOTvJpPom8sdIEJOopzLK
         pOnkNuJRemGwOeggjwEXGg9/ZBLsu5S5dY5w7kWVa4xH1UgtxoIkxYR73/XVlaDw3EXJ
         pedC526aSL+cb3lv+jgI3DDAcgnbf5cvBD5E8t20Nwno+QqfYuYkuVr07XNkV13RvFSD
         Sx+K2wEdhSlw6BRa40HIccWV77FB0MONwS1vuKMfztDbM3Rr0AcQ0fvoIjIp2cDLchYj
         E9YconLzTe7LWWdlcyokjmjFlSVGbjiN36TOKFvA2XwNHbweKhVJiNa/8LsmrBNThLr9
         iF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404323; x=1789009123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=EuILntkmEOFA8uSPTWIFHygo/dxEsTrSeBJCqOzys926z+M98fjfcZwTQt4EMJFZm8
         USlu1CbVq5hPSLJYKcWtSH8tsTYPP8AWbPMtUy1bP+wwIwcaCnoiveTgxOy003Uo9838
         CXY7ScnMsqB8d18WyTMhRq9MTlQEJbyxerERYrl+Us/Gg5++CLA1IFYpR3dDCR+fEwLd
         4ggMyMR37HQLnmlwzvnEbp+lH88cOVYqBr2epNrGH4RhmylgN2g6CjYdrdRnnIL1DNsE
         2tGOTSyUfsYi7PB6iOVvq01mScfhUpXctCipwkDr2gLImmxk4tJ8mBqmq65Y4w7b4dUG
         3S2A==
X-Forwarded-Encrypted: i=1; AKwUvBxh09ypTl3Hv9uxCQRoA3wz2Kf6uVt3kxZu9TEqr9tfu3bNUMG1j/J9UjTY9Ib8YnVSRFs6J98kjksJB3PbRUun@lists.infradead.org
X-Gm-Message-State: AFuF++ki6F0odoGkqV541R+3SqPHxKSDEoJ12AnViVmKjY9oe8aqkG27
	jvFFYFf75TXwTbaAo43zEoVrEWAjPxraQP3RIX/G7pMkx+U2xBFCeA8OdDArEFY9NhdbQp5ipPk
	m+aaqw8SvOwLC2UVRY1ym2Aon9LTm30A=
X-Gm-Gg: AYBFou0fnHcpqfzyX0ZwlOEuGtUKoZlcEoa2IigWEYMmLNDZsFiL7uIPYuumKiwf7MK
	aTOhfAtQt9LudRMzuFwlIuU1T6CyoVKaIqw9VsT8xyFzz+i/UleJtf6ACPLr62S5SOdK/q9caEi
	+u2ti40Bn7xoVhkMUfvNHYgfqbul5xLp5aTsLXq//4yETetg1nKgnUFmtU/UbnSyLvs4WQNR7QD
	C2cbfotCyQZm1qOSooP4TucmRth19JflVbRv8/NNi8tK6PsyKnYFBT80akJVUOYxXaNm1WaGjXD
	Isau3zLuKrtA/Dzp3/Z9M8pNGU8WoOqgdTDgr3IaWuQ7L2bdieKPqEMDVPrrUhqSFKaHNtmSt4F
	8usWDNzvrNfXU2K6vnxv2D1na6ZRoO399DMqQnvNAjRNMDSRh2t6iInWIwuwLQFJKJg4S
X-Received: by 2002:a05:6a00:10d5:b0:852:38ff:b4b6 with SMTP id
 d2e1a72fcca58-85ed3f6cd26mr11933247b3a.17.1788404323051; Wed, 02 Sep 2026
 19:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
 <20260828050526.590761-3-phucduc.bui@gmail.com> <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
In-Reply-To: <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 09:58:31 +0700
X-Gm-Features: AcwNN1U5zeKxmI35EGDwvUZzgzhqsl97lW_cejqy0aA9Qkk84c4bJui1c3m3NJ8
Message-ID: <CAABR9nH5dcpaxDSyo3jjimorTJ35nf_OjFF067Mr63aiCO3Q+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux
 disable path
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_195844_603306_B9ECE09B 
X-CRM114-Status: GOOD (  13.58  )
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

Thanks for the review and the suggestion.

>
> I was thinking off a typical teardown procedure - everything is permissive:
>
> // the disable path:
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>
> or, if one wants to do this properly: split apll1/2_mux_setting()
> functions into:
>         void apll1/2_mux_disable()
>         int apll1/2_mux_enable()
>
> You do not have to go for the split, the first option is just fine.


I will follow the first approach and use a typical teardown procedure,
where all steps are allowed to proceed and any errors are only reported.

Best regards,
Phuc

