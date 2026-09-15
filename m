Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7927C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=; b=c6Aa4TjNsCi4M/2fPgNxeHaDFK
	1U1BVkxvAN6ssgIgeocXQg+ff0YtKAwUL4Hv05Mt2SfKs6OHPLPJxn1zw0T2AT7pNRfL+JzEa36uR
	Wj506GAUX5W83xhg1IHBo+ENrnluiN3C2apthcKchme/2wkzI70TJV19IO+EB4lgiH3wK1DtGI3p5
	omqEWwq/LLiiEfE1fe735BEXjbmSw0NbCGDGr6VVqXu0a/N9kwWN2VC1U2u0D2apBt0nyR6Pl6l15
	tP0UAI8ONMeTPgvG0wk37oGc4Zl7UX8jkdtQDxMqBrHEXLspROR2BhVPYsCY6DrsPuBGpOhbJwXOK
	zjb5fdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qe7-00000005y75-24q4;
	Tue, 15 Sep 2026 10:44:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qe5-00000005y2X-0Uqo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=; b=bQt8QT0JOPFwNWs2U2PcdbqI7n
	C2DZEBjkl50I+7Rzf4czeOs6WkJOH3+t7XAYI7LilYTpzqGUCMdyJqCFdzIJr+FmUVpBkym4WzBzR
	Em8SeFJWvFkp9FJN+UNlLs+AQdHT0oMgn8L+rpKj+AT9KAZV6PYr2zjLjVmWJefGZq9Xw4ZHxALn8
	iCgovyke+OWcYB7Em49us5F074+p9ThEf6dBv/z5A5Zrl+0tR/PxiH7mf3PyZBP7Tru/gwlhLfrmH
	9n1RIMX9ryGs5U5EqG631lRzQiwu1hGiKcaEADpnmCJ6aa/mODzWGlKkJw0WeJYCEBzLFzu5ebUY1
	nCTEmURA==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Qdz-00000006Znq-26El
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:44:11 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso57616b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789469044; cv=none;
        d=google.com; s=arc-20260327;
        b=hjKGZG18CcH4GIzyx+OE+UGdOmUqJq/ZA2HCGeG4HRBIVeLtUdteIRgYTWQn0PPv6j
         a8Q/uUrNa7fxIwT+GNGae1wRLuKMWtuQxvw190ngYyYP9e1whrbWY0ob8Wu07lN5ftGV
         ja904ObmZx4Z5QmISgFLtIZ9UsX8VFpipb+a/Bhw3wot6zTQVeDy5B6GepJKZFbqcPrE
         SpUcGrm/J8GZdsuu3T3J+2FzntFW3y3Wnu+4Wyn18bPsqUmB4hMr7vR1FYJD3/LiH0Sj
         Xs92vWxko4Mk/49VNCHQb+FbUyrZGy5dB2yXY3O4mOzB9n2t7PMIX4rv28Xw+KssMm9k
         MWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        fh=ld50ZLHzjtvFUvigF/T8OwecrtM/OpASMo2C7pM1ADY=;
        b=SNHyQkYNYiwGUSSzMhiTqjGlwflI65E/2yYs6SQpjrGtBBjD/g42e+LcsInGtP77Vn
         phbP98WxtNpISt9HvDDOgnnilS5f8OePtTUKhF5qJhCMt8TMbx/7b+PXP+nDCrAOmyhY
         1L4kyv03PGFTGXXOfpnc8iqNinne3MYJ0IUamhqzObWbYzeu78oxDPMcBgftwriw/EHt
         +Fuoq824X3ciCph6LlhGuK+XA5y57Zu49kd0wXndPViuRSvIQOYA57R+Kn0wUtkD9jXA
         YigOMjyXab2I+AEzMnjZYdwpXFwElJGuhsE06P/reOsD/XN2F6MRxMwXk9MZWjtR+qbb
         UkRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469044; x=1790073844; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=o+paCriTFEcJaYp+Ay9jBdu9SUQdsc34uHz59/wzo6oqWLj93ZuiFZR/nspYbQpGM5
         3lT/crdQM9GAmChhYR5wa4IkPSyZnHPmPTjwoAyaqJOSXyNpLaRhAqKLmikz7TIWBO1g
         cbNtgIm5vMY3qI4mBVu/42XIblI/HuH5TCn2Q8flfD6JJnLOpDwvCHBsLxCkG9d5bTfi
         WdOmggy9iYr8GijkJ7kiycSrixciicuzeehc7zppD42dnNlampuOnGmk5VAkXRXgCMUk
         /1SnDtiF5ImM04C5hNZjrYoKEwe3olgUCyHyBp73f2dEB0G/CuJ5keAtsKzkczY1mSGZ
         lVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469044; x=1790073844;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=Pby6x/c5AgB1fN7HMWEZ89vGqceDHFdr/geKCP5sziXuf3oE/YVVjdO0Kv7zvyCHwo
         vOudRm3EkNDfcO7JA+Y0vt1m+Brp0VbH8vO3il0C4Ct8pE5oQ8x7pX31nbE9pmeqmi/c
         P2yobu6z8Xx3YoyZWQ1nBkvx3WgV6ICm6QMjqWzdAlSJtcJn2IudjfKZH2lYhSqgdvR9
         GFOmpsIjZOpxaBwtYY+GLay6A1YfG/5PnYGT2yUWihLZUve+PASndHMqts3c+x3NqF/p
         hAOWXg9bLC2WFoYI181KIKBiaVmL16f37QYCp7rbbjpThiLzv6H1TbJf8I1ZY21QC96f
         UZLg==
X-Forwarded-Encrypted: i=1; AKwUvBxhPyjX4b+FzcBlU/pVQCsVkLPx7AOMYgyWVxV+uvSd4rdfHyCL2LIOgyaQePPhuUctYJOdC3zC24nwEUj7+8Hg@lists.infradead.org
X-Gm-Message-State: AFuF++nFkGgAXUnk5Ma/L2afqEQHuob1EJaI90VESDPDlZw3C6iUoK1m
	z9PuBEE8nktN5MhhbduNYzK9gaOF0abch+I+8DuwYfRL8EG5D75CtE1M5z9Pa6Gfz1wS3eEUL4k
	eCuWbfXMvuXRC5trKPxtHHeKhW7SOLhw=
X-Gm-Gg: AYBFou1+KYk6WXyPG+hIt1qYn0jXjil/LQC2AOAAdFfh7luj9JXV8Mno/Wv6qBdAye4
	6bQjXi4vQff6fOVkvUcxgzkCtvEscIhv2NfVexLzNRukUKhMuE4KdEq7Ukl+dDYh928k9jCW2/O
	oSe4+6HlvbqPlGZ78KJEcLT49QNFBle+4vkVXy2yyDbtZrcjVQPUA79OFhmR8YbCMJ0giSOvasP
	rck604kIqa5lDLI+hQmA+ZKk7WQUNB/z6zp/3rlRDDB8kU3T7j2JtVeQGGDoufZRZjFMqjlZ//b
	+oLQICrFso4DjKEzxm2NPYGRBwbuJ5bsi1AOoezWPSL9i3HAeD7j8QMst6D/KpD44UYzc7zcJ0S
	KDWln7y+SaM7iyCVfP8vYnoDEUY97RnRV/aaLU3kCH2e863VQuRHZtMBJVuT551EhntE=
X-Received: by 2002:a05:6a00:4b0f:b0:853:59ed:5539 with SMTP id
 d2e1a72fcca58-871802d02a3mr595616b3a.16.1789469044380; Tue, 15 Sep 2026
 03:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
 <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com> <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
In-Reply-To: <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:43:53 +0700
X-Gm-Features: AcwNN1VdN0Kart2_fiEKCb_9XCui4hioEfW5Bf-MzLe9rBW1HbK36VRqiUYolUg
Message-ID: <CAABR9nFHDNw=9WYiQM1C-dyA_GDr+b22w_SCmedzLJNgFOn5=A@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_114409_804732_767608C4 
X-CRM114-Status: GOOD (  14.05  )
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

> > So if we remove this part:
> > ---------------------
> > if (!afe->regmap) {
> >          dev_warn(afe->dev, "skip regmap\n");
> >          return 0;
> >      }
> > -----------------------
> > from mt8189_afe_runtime_resume(), that could actually trigger the bug
> > we were just discussing.
> >
> Well, then...
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...still, please check the other cases.


Thank you. I'll keep this part of the code as-is:

--------------------------------------------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
}
--------------------------------------------------------

Best regards,
Phuc

