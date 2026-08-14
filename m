Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC26C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=; b=EGofTeuvKwdlwN9NmaNzU1dTqX
	r4kVipcSFN7M86ELj7bNQuV83TxzbMnV/kwo1eihJO/hXqgidmvRnKYZfgeFAMUiRTUq7UHeF4XKa
	ZwyCdHxLetKPna1UAp9r+fX1vRahJuLeUSNEQ5hvga4CgfygmOXxi4yFfpFG4jEmiLUTiZwXFRQTT
	oNQcS16R+ApYaf9PTNH8ZZ5vL9RPZsICstjHh7MeWm17Lh9EMD/LBNKp3/ThXQ+CJ6gyTYQNOyxQo
	FoD8KnoN0UEPinA99K9tQkFeeKWtyZUGD3kA8AOeSZpsMKJJ79TPVOcA0QsAZc8rdeXSbQTyhO7DI
	19Q+IEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumXY-00000002CHe-3sp0;
	Fri, 14 Aug 2026 07:41:21 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumXW-00000002CHG-0mYG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:41:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3811f512167so881516a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786693277; cv=none;
        d=google.com; s=arc-20260327;
        b=XRwq0eouDsPuQwJxEb2nPAFqqjkam5dVeNaQQgW2Ku2QJW+Sh5Nda8CzbemVV1A6aB
         AikB58IXPtZkLAPz8QT6/mP8m8/mZZA8plNliGvU4q1Tp8zn3nZP4ojzZ74g2+8ONU0C
         r+duqXtllaUVbhwp1+84HMRpcTR2qB1gEjR+Jk4d4Ul+RxK3Xo0YZRUVdNiDOOqe0u5Z
         Na5Mwfa+QYyaWsl62eyu+BjMt1pdOAr8nrGxUSsFc9/+dtzoeNxr15JTvRIDnSvkmOC4
         02EASYl37gJ/nKjYEhkSBPXLcZekY+QUTVwJ1eiIFWpo1N/jmVvmuypyH/hQpU/e5rBi
         /7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        fh=uNhe1U3yPpzmCWjZe+LhMTLQ6aldNa/6VNpqojpCdxQ=;
        b=icR3tMFLuJDdNadaciE15kMLBHReqQTHXKbZIhVrbLmbt21CFNus9ZIh0TfiHSV2ZW
         xskMpZTEzYHqI1rtgthgb61UogYRjHzTMMjQf2Vjwj+UF8WdZpvw5M6DC9AYNbdltN6m
         L1v5qmwbV7ylF0QaEaX9OUQ6WNNQTrbT+OXMsm5/7Bsz2DdIGZ4KENC9xdCnELDeVRFn
         6bJ23s0B5WhFJvjMH78Z/eCf4Nv31j+1rVmILdX15PK+5JLCTv3HTpik41kOp0jvsnzZ
         229s/BP6z5Rx6Q8EWBsoPB7pU0Xqascd88YP/lwD1Ud74UlcRGnu64CA6Q+50N6uyWOB
         fDLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693277; x=1787298077; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=O9mSu3DRTmrnV0buF8GY2oVlIHzM+fAnWGb4xclWCZdWS61929de8XckHGX3dhNnmT
         6hQxjKi5CtRpKQsi0D3VPwvjkf5Qw72jydaUyJytU9FWyRyMMJpVjO9LGqrYWNA6YHqy
         GnjLsG11DHFlon+SafbO6zdfFYYLXj8Hk0VR1v4ykbiBoE1NbRAqrgTpE9ztL46iLgXt
         ATyca/034NTM13QiJb+ydWdGBMqEVEUo5fV1Mppk6yEsn5miQElP0ICrArJxwIpaWR8B
         dcOaLoguu0Si4W+tOKZP3IWxzgoTnOGsVC4t2WcaR6YH1BcKs0Iqr6nqQNjvhrDmZNKJ
         Nf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693277; x=1787298077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=Fx1xZZsC9HiNIt5okw7RxoqBk1T1KLbO8D3UqhSxKrGjJ66rTLimNymXp2sZUaDG1o
         wiegkM3zAMyGkVEPI1vY4AMojCWwZHpniLLSXAr4kGTcWO8Zu3brkv+oBcSyZwA4X+ab
         WUictetcJeXYDSXEonrqqKLt0hzXatL24WSIQ47Es4Btek93a9MN3nJOLx6X9A6T0OaG
         /EDsiuA1vxjzuwuhtpLrCmy0gov092DOA9UtyfdvKGALZKReHg518xaYCT01RevFz4M1
         pQB6tsK0YJZR368blhrSetzk1t1j7+bxcIwP0QceOAKC2IGZj8+6k5H04cXuEFP7Kvvx
         hkBw==
X-Forwarded-Encrypted: i=1; AHgh+RrwV6/DGgohIA3Dt6wRmoIKGacB5GL1byVlKrCTAuqyHS7QnMFf2YhGeFvoDC+1jvArUH1141oYVNL7xI/ZDC8A@lists.infradead.org
X-Gm-Message-State: AOJu0YzP55tsPgryD/yUZHAAE1/WHYt1g20wSthrvDk0VZB6M+C+oXkm
	Jv5da5O34zftyMJNemUv9cXr1R4txNcNPydE5ilVetodWLUahWokOD5SKtN3IlrwLDyBXqpBKSN
	DiG5xVs0RvqBpqkTjMAd2/aWJ3qiU2RM=
X-Gm-Gg: AR+sD12riH3Q7VkNSBhKGEZ/3aIokgl+9y+JkknGpbbE363UMOvlXM1qhG+HoQPgW79
	DLwe56MmH73YSwJnveq3h/YHnC28PzhnG6RwfmUs0mcb6ScIj7rkBWVIu9I4x44OimJpWNuWeZT
	X2w4H39dPmLhCsX8+2fkkwjukI9nAQBv9g1E/9Jf9on9mQselvF1ICkCYmQpFW5kcxQ4qyR/+b3
	sjmEHN+4ib22K95RRJ2mjpWngMuKdd86RjLDqfFONRTWtw0jBxRORMal+6OHtFzyaXwlUwIRf5f
	COfbwG7h7fXcQPK57oAkMX1lz8mPOcRTfxo7t2HJhJNxkw==
X-Received: by 2002:a17:90b:3d8b:b0:38e:1497:af5b with SMTP id
 98e67ed59e1d1-3933b77ece8mr4578497a91.1.1786693276690; Fri, 14 Aug 2026
 00:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
In-Reply-To: <20260814-lean-classy-hyrax-60aab2@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 14 Aug 2026 15:41:01 +0800
X-Gm-Features: AUfX_mxVp0mCUmIh3cD49Kgp4iw4sN-NjfTifnUiJEeotRXNzWAYJPCWyxB1G3Y
Message-ID: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_004118_228737_3FEAC268 
X-CRM114-Status: GOOD (  12.77  )
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

On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Each one or only the newest? You will be getting the same questions.

Each one.

Best regards
Shengjiu Wang

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
>
> Best regards,
> Krzysztof
>

