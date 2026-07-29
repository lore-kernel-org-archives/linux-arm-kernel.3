Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D3C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=; b=gBUDSri9i1hobt8deRIrBUFnHz
	Ah+FCr6XdSPhslNlO/NseEEbHEByBDSh40Baj6eveppl+ELajgvyr2CXl/2KNuvqsTnYBZFz1SGEw
	hxVM+QaYQm2dO4v2o6H91EInC9JS5ZTt67/B43ko3gx+1SZqchV3TsupWU1IsBa33gRzir2QXKHS9
	r0X9s4zcnBMtg7MqZ1fH8bwtVc4pNbAlP+SFAULa97TlTaGHivTJopL+yjFCdpUjwdLW3tGebNRxW
	bKEw5/0dWFo5yjbgQAp8KmvuRueidDafqnlIDl2UNUCbr3HpChKxV9YEpZmfumxC4/nz6MRmebFz0
	AcAvmsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow6P-00000006rUS-2M36;
	Wed, 29 Jul 2026 04:41:09 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow6M-00000006rTI-1zVM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 04:41:08 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6689402c7bfso506301d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 21:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785300065; cv=none;
        d=google.com; s=arc-20260327;
        b=mHTTI7i2KgmxzowWR5R2iFsyxSUihkkIQ4V1HKhXkJ7Vw/MfqNpSAygvLWFpVCh+Wz
         lOY1tj6Ca0EYu72AnCocN83l/rLgM6IoFB59Nx6PCuE5YmNF+a1PWFe6WTFFAhO4MGEP
         69jGYbNFV9oAqEkMAISeNDUwSr+G7mmg+TWeYx0vJ38KBDyCfHE0VYM3j3+Be/2oSVi3
         nVqbeCA0IIBq77TwEfN21gmCo1QR9IBz9wwfCUqr6ifUTTqC507OXF3f5aCVMK+zbQb4
         SbK3GRvdkUhMrSvq/Sr+0RQIrWaVwKQhdAjn+IlXae/bHl6siGh3YBMiO9Akfp6CzvLs
         BgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=;
        fh=1oJ3Ut5yr0/pI3g9XaYwDO4BBYV2kKWRn4bnaysT7nA=;
        b=oPR7jBU4EWXVRzkl660XykYiCfItd9/KRFO1ivMpBKQKAVvxcEMZk9ZahLMyp+BAbB
         kiUkXphUSzjs7+6ZZjEQC+UGEvkLLpcIkMKYkUdEU9H/qkGRLN8wwod91fuhVlnWj/Eq
         5NsmGZNRZf/VXphqbjkvtb4U3RP7zOVIwzvlRNAl5zrKAjFsgfBCkdXM4Y5Lf5z7NY2/
         SaRMhbRDMjCvG+vUKxO8OJsVGYryXc4Nx5sEBu9XdECgRkBMR4b5AN+k64OkRj/yu8CZ
         Je+SZ2+ytrsHeEIv3E+1NRFCzC95dPvPLxx2+U8cn7/KoQ8G8BnP/FWDsR6nUtCW4DU/
         tjtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785300065; x=1785904865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=;
        b=ZNCAn45yDe903ya4dZXdeHAkTl/H2xkqvkbsvJUQexbp8WOWVT+iB29ee1dWLK7YY3
         aDsBwRulYdCCqk+qS90WCBLJitXgY2thYxFsgvOAoE/dp4Lqor56p1YSKqq4qnT6VG3L
         XgLMxBWY8GOTIGLPrKqR1WUjkED3scU9AXq7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300065; x=1785904865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=;
        b=JKUFwDSCqvXGoYLyv39DrT3QtsWHf/sKamMoq2fBJg/u3jsO0d44fL8sJB0eaSrfJ+
         WXQD4t8lxMBF+3Te0BVrFDxMVCKlCoBBUEYYI1bWKN/oeVBL93A+gNgVXaVVnp7uB5Ye
         d4N9iJ/dofOo43mZRs81VBgrRKhYBWWLH123sQ1v6UjJ1R7dJXVXbSfufrteNFZ35+Zz
         OCh442DAzRZ+SdQSRGBvJXmyTMgyyhDVpkc7luHQ5RA7sS/gk9QwFxP3vvDlf1+fzqG6
         6k/4CP+/UFeQNqe0x2BilAkaVxSECIMbQ5dABOJG6cTNnUu8I1V7Ffkjwk1HXw3vINaG
         y52g==
X-Forwarded-Encrypted: i=1; AHgh+RqpTttPY6irnWXSmsYDufxR/gJXwix53CxuAg83wKqs4BEERe1MdiPDt5wmQKjE8k2Ja3jRX6Du/wvq28ub7H++@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZjdcjn2fi7+e3j6AkNJgmv7msUUO0lDU15jYTJq2YB22aBbH
	ryI7cco5uMTvU4AqcTPtnlpQCt4gUH8wvHq6ykjYGAFC9n930ppYzPe4mJm4AFqonM5Zqj6ZC/1
	u+09JQkIjzuIQ/nN8GP3HfgVrm3B82JTeGFFyRexk
X-Gm-Gg: AR+sD11MbwceQmzy3yAUdzl6S3ypktFX3KeCRfNl11eQQIixOMpn+vGp+B0BnNcdXet
	56hV16ppVdEEMWXiw4J7ROuNe2gVe3/amdUrLoNP86cWh8tfqzemJV95i4v7t7WCYp2tJHh1thZ
	5jbngUkCYDnfs+n2D9k4hED0wLm9Fe9eTdJ0GRv0di1D54uryDhWcPn43eAlAQ7zbTys9KdYftb
	+SogxbDIAHLdPJ5whVAoG5V+tBH7kJ0wYEZ2zLyJiD0PiStoLavGQmSLlfOBb8H3gdtGkyqrjbH
	z887wOm5FwhKM9ig3yIPeGDsXp0PVMkakfyEB9rxd+ycjpnn/0uO1NtQDusBXq5IJQk+5WHtRPs
	=
X-Received: by 2002:a05:690c:4c0c:b0:7ea:809c:2af5 with SMTP id
 00721157ae682-81f9935399dmr26755907b3.37.1785300065323; Tue, 28 Jul 2026
 21:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-2-rosenp@gmail.com>
In-Reply-To: <20260728212438.54078-2-rosenp@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Jul 2026 12:40:54 +0800
X-Gm-Features: AUfX_mycg9wolGjQePESF--FJZRN09rHxCnfAnS_fOgAk4-5gb4BJmW1LYVjLVA
Message-ID: <CAGXv+5GfUGRsGkRAWyX+GnJC8GOREqgkXeN4sVxE4+Y01PG+hQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] Input: mtk-pmic-keys: use of_device_get_match_data()
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_214106_727987_DF66B928 
X-CRM114-Status: GOOD (  10.11  )
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

On Wed, Jul 29, 2026 at 5:24=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Instead of open coding it, use the proper function.
>
> All entries have a corresponding data entry so a NULL check is not
> applied here.
>
> Remove of_device.h as a result.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

