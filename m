Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE61CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=; b=FO9qDuqwa4UHvD3mdJ5F2RAdIl
	glQBunckPz/CyvJzzgLiDCr0LeK2zxUFzuVh3Njx5WScFJKGrQoOa89Q3fXjeXbZjvWk7lDxvAcmg
	1w9RofHtMsxAS+64oMlmLBay9f7g4rDL0yfOYXwwqVeioaoiviV9JgOMMJTklO1wzdh2EonasDMvh
	YZi//2KUa1upRk1YB2RtRsG3O3jIkZcMQOdYRQZZIDPZNU9Rgogw9rfsNxm6D9PuxE3MGcD92MRAW
	qrS7p1ydYHCnqPmSI/wtdyslwO024Hn2hdOd6jCDPLtybC1Rp+VJt4Gk50xiBojS+si9kLWklxanI
	D2ZGKUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrqp-00000005nAW-3BIT;
	Wed, 30 Sep 2026 10:47:51 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrqm-00000005n9v-4C54
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:47:50 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso2099581b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765268; cv=none;
        d=google.com; s=arc-20260327;
        b=EtKh6wTiS6ZbezxqVcJHSMvV+GuetBJ0hU5pF98Yj6kDHSWnTNYosxIwrfXdtQHk/P
         tLa3ee7TQEYMgFWNz9zylKA7Wr8B4zj8bAV0hE343yL7tC3Cfln/WgpK7viT7jGwJuEQ
         KH/jzok8A8b/TuYHl8/3YtxM6kaq6CEbgNFNT5vsSxuvyXr5jgIq0UhOQqpXG+dw4HS+
         9DrDq48Hv/BTU92QJD5mnC9Kx+miRcyvqbiFky89MoqdSF+pgKadjVFuYgqLL2eZrbO+
         SOudDG3YIehxBq3qEMex7x3KFt18IMSRpf0cb2MstEu+TSS0t2UZTyLcqEZ6wU0nnJyM
         b1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        fh=HARFO1MYKXJ4CRcjXnsym0MZZCnYhhiuFBQCMiGJcq4=;
        b=DqAB1vhHHl8un1d2pyYxUzpBqkLzc+jGUsNVFIBH3cTTfX8AfTVuS0Ut/TtbZErQA5
         dwgT7N38MDs5jCQmvsW84vM7BUFKK5Mawtsl9Dzvqe6CAfhnAvvcMV1Qe3VwQESoHXAS
         29gQldj6iaASSAk0IoChfj0qBcEXni2Zr27u+ge5nUzVwV/FDQCPTg2hINbHDpI3PRVk
         rS+FmVfwbj4sAYJY0k4FXlwDQSuwUNow/FVSv7mHq5cVbnajCNBdB9bNIo4fOluFw3xR
         l99DiNEtFJe9CHkgwRvRNLKc0q2HROEhZEqlVOxY8wqMN1rM86ip8TUkbMN6VkIwcD++
         n6mQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765268; x=1791370068; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=WNM9UO7B3AHQHd5FqDNk9JMBB8SC2sidl7l78fEKJ+e/q2iHmOPz+GAnFcvaA+Bh8g
         0JpRkzNJq3hjgSl1ielgygTo7UlQS2/iQXC+1Jgf7ILQt1VsbiPWHuu0LghGu6VgwhaI
         upy5P5/ASFMNSleSs4g9TVQ0Sx5MaPYJdJnjXMRlIGKmP0E0Xs5IhpsF/UReq3H4XaWa
         +KLlPP+gJRVre91cUr172/n5HLjUXV0U6KMADtSquWxcFrQcIAjk38LZaEO60krm7MS6
         kZYBhq6+UWRIJVacBZTudqABDJiyxB+FJsBAyk0dbdz19cV++pVyvFJhCiA5nDgPIsix
         WeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765268; x=1791370068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=wbG3q53hIE3/iw6gv35hESoT0wX3nC39ndj44t4uPK79ujE7GvPPWtgg1HvqRt6FYm
         gZL5tiJO8PLgr200MLVJRBuOcfJadziNe/G5ghDaCsNmt01X0zjoRQLP7GRup/aP2uhE
         +ho03S1BnmFsvUsO6J/gWHe6CjMw6hGx9HJhVh0e+pHEDwFrUO5X3SWjTq9gZqGVURC1
         Lao1uT4uShGSGHRuKlAj4tEsbjroOB+VGmF1gjgS8wwrxBmeKzo6XwAeFxEk0rU8PPXL
         ETddYGvZ1WG11C/lmMxdMnCJlHDyLxhamUSLrNQzlz4+MbkUeIdh5/LXG4PHRpbXR8Y9
         KkEg==
X-Forwarded-Encrypted: i=1; AKwUvBz61UXtMF/Qwn7bgm7DpZ2vNwg0ybifL/sBCYEw2WVxTp+ExYP0aDU2v2AEn9/22ZQZ9CdsDSqD0Y+BC5IsSAoN@lists.infradead.org
X-Gm-Message-State: AFuF++kyk9wMZwmxOQbzQcBqwWuTbVUVZP7nkMnYD+rxgElEXHVI8Zii
	qI8T+3wHwfLzw018a3I97u2Q8/om3BVmTr/cI35KJ154ii/yX57edThpjgYDr9tf/ck/+D0bLxj
	RmdNQe9bwZhTjTPq9bTedCu4+TnpCRl0=
X-Gm-Gg: AYBFou2B4vHV+zDmx4TuLiDSUvjDYHjR+B6gCK7xbNJgGnMP9bAm/Zwmt0Jiw7Ii8yU
	LkxaVOaygvMrI+/2oM0dARw9wkQEZ3B5l/EOBscZX4rPyG82+pyKSTUrx3uZ8zOPuCoO7NzrjCv
	z2k/eYkDkyHQA0HDpkBQuELlh2DczlC3ZErS3HTxNtBEDYM+uc3gubcchnlI8bmJ4h29Uq8HODe
	zmtrZko8zzD5YKTXJ7TMUUGzvb6mWMAsl3CfmsTFWrGvtSUCfpC3BMx+RJFx5n31RVh3tnvsbO9
	fp8N02t2gNA3waqR2YmdPbksznWi50wQY977AP0N7fMq50hWw5uvRH5LgGYtV92yZv98ifs=
X-Received: by 2002:a05:6a00:6c8d:b0:880:3b31:a4bb with SMTP id
 d2e1a72fcca58-8874a89ae36mr654876b3a.20.1790765268145; Wed, 30 Sep 2026
 03:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-6-pmazzini@gmail.com>
 <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
In-Reply-To: <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 30 Sep 2026 11:47:05 +0100
X-Gm-Features: AclHuK8o0ZcgRpk54PvKUPvKEFYR13nUvSknbUcihyLHytfHbaM-Aa-FPmvKY64
Message-ID: <CAAxh=jsr1M-RHfqPF-hgQnM+RmH_D82=YX==Vn5-r2=1AB9eMA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_034749_063272_3FF7FF1D 
X-CRM114-Status: GOOD (  14.54  )
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

Hi Krzysztof,

Thanks, will fix in v3.

Regards,
Pablo



On Wed, Sep 30, 2026 at 11:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Sep 27, 2026 at 04:10:10PM +0100, Pablo Mazzini wrote:
> > The B288 RTC wires one alarm interrupt, not two.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Seems like valid and unaddressed comment from Sashiko, so dropping from
> DT Patchwork.
>
> Best regards,
> Krzysztof
>

