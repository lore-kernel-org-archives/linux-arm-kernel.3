Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88B4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=; b=oLT42e8F5B5C2isNnj1PSbN298
	P0KFGu9dXdLvs//CUi84ECgf6iF/miN8Sm1yfTCtpJwyF1T4DUzCtnrYRBCwXFTXv23S73rk8beKb
	iZkcqTFb5/NqJfqW0Zeov626o12kuZgVyKdOLGyVrcdceB4xfcmOHBcy7lTL92ao4zS68uwjKx3wW
	QGn59UHr2gpnaMf29WRot7Lf9HDfqwXoUdguC2iL5w7Hhe68HXVEPz2HD9f88ror4yi8aXcJjHqCZ
	B1ppPIbAAg2hh2+eoqQBe6GOerGHP4yf6YY8QkoAV90DAKkY89RTvccxzUNDKFFmBOTqD7in/22tx
	iwWb+3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSRf-00000002t2t-2ECT;
	Tue, 19 May 2026 21:57:47 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSRd-00000002t1S-0lVu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 21:57:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so731804866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 14:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779227862; cv=none;
        d=google.com; s=arc-20240605;
        b=Hjq09vpfJ2Lw5K/q5fLJ1iGT54C26EBRBAicFmPha9XVTDqiMLyOCc+kSaVXEMgAnA
         Yh0d0+VgpgQz/ON6ureWhz4DKa7Cs5N5tmBDF/AVzvDzLxGaF0Chs7Av5LeDRhqBqUve
         qbh5OutU/xmbQMI8Gi64O0hleUjKLtOuMbUTfOxrX33rUWKPk/kdobLauwftKBNB2H1v
         rMjvxD74Q3WyY3bW4rKgvLEEyqBtYnC0DBonXP+zwQFOzbwVaeQvGrCRG35W3RYeBNRf
         VjqTvEspYH/lY4BQM95xRUv24Pfq1LFw7I32bJRJrj2NC6Xt74mhL/eh2tpGp57WPqgk
         avQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        fh=EtEUti6KEYvxcyDQOxJyEfr2mCjMHqJr6/azLcDEcOU=;
        b=WutHjEURflv4pMA/GziRLgMVe1TjpG7vv5JCQChAJhjTgHopihao6BT0sYSbKNO8t3
         Wc1vNWGp9Zl/m12NAlwJHJ5BtuguXOg/W2/DNY1Ok30bex/rUG8cPPETe+163wCeF+zA
         sqyF5ZERY/Pb2/0zbAu+I2yoX0lU+oYzBqFNIoAqyrizx3rjPicMuy79XFAS1wC2w0Cl
         krJ7XEs76DqyS1i5OeGdgVy6xT/GsYe0R+V/U5reIBvRfvn4HRTUSEaO/xd6pWmHxlEN
         qOp1AiTwg2C4QMo6kegtZyqwBkX94BfEVjFIedyPEr3IYqH+lLDqIYqT4mSUs8dAV4hw
         HlIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779227862; x=1779832662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        b=FCRoFurAehsxwvuBrR5q2/+6TI9hZLqwijUh8LqnmD4c9Tc1+psfFV8lKDED/MpgTs
         qnBOCwnOEm4MqoCL6kaqMPjgggIM5ABRvcIDgtFXDs36ONpySXVnxab5T6iUCMOoffrQ
         2BT0K3wUownYo1x7B+jk/yst0t1YEExd0taaIoOpO0GlbRgEfPSUNaceylW8ojKORNYS
         qFDJnlGINDBIDTTNNzQY8qBDG84wfNDY/oFUvX+P4OrlTduXSjtvyaQUJDt6SJeyXsp8
         ocCR4KNhW79Nmgvy2rOJFv3uvAgU3NxWBJn0ejrIoupNl24Ce56dhhWmwavP4QppAk4s
         Odlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779227862; x=1779832662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qePMA6zGQFViCPKpo7iLsKN1rs2GVcNovIIZ6LT/puc=;
        b=Of/F0bv0i0EO0DgdkWHOJqNm2Xnr4MSEFwpSKoq9Rd+wN6SpBccewsRVy5dKDTnfTe
         fe/g3OVhcMXbMn73KUAHI3y9X4WfKt1wfmvM+6lckX3WqQhDLMAs70dF2VI/9MnP1yhJ
         FPx+yQKEJjyEwNUJi3tStyFd8uzHg23VAovHMHHRkzkZBrkBvU0l8cSzfU5OWj8eQph6
         LOh0aBG8lSl+zIBhV12s748LkSCqmNO6oUYA2hjLMA2nxnKWoCTLQ5o6thaMomnxeov5
         I/2TjcSQeBxtNwAdNYlZ8nmTN3DjpJ/AZchY8Dvkv8LBHX5GIRJj7tya2G1sBN0dN29t
         5a/g==
X-Forwarded-Encrypted: i=1; AFNElJ8KqSRTkeSknoLfIXAQY0wqSnOHA3qxniINKymbX49fT+TNUrNmufG8wpMrMO4zpU/MALJ/ATBF8IP32vDRIlis@lists.infradead.org
X-Gm-Message-State: AOJu0Yw998mvztYktIvTYw/RoUjW95ZBs09Zbg1Xh8tUVpa7CDEYU6hM
	vU3JDTbihn00felwH8Nkn+znZSfrLZXXtgbdZ8z+Y8Wu+hrwBYwk5lIuGYRXW9mdMlfSVMQhcVi
	ZQFol9WKWe2r3eE3CvUaX48h6uTyZDxQ=
X-Gm-Gg: Acq92OFtI6Bbe0Q6Moe/Eeo4wstn6gz+egx3L1HkhWI6R9dGvA75XUvdFPHYDX6hwqC
	KWjWUGL5lp3qyYBOBOBmBMj4k9TTkqqlXR861+jahhxV2W4cqxPcO40/VwP7YKTPLrVs+QrJvBN
	OIFBLBrfnSgkvNUM/0u3O5pIa1CEet6RX/hWxaq5X3jT/dgcHu9t8QNYsS22od3TClrX5OZD8nB
	X6Z0UJUsVvvOp93Ir0UQQxe1VSS3h1q6nl68hBsW7ap1HTns03iRC/l8DzZ//use6DShbtEnz6h
	c3/N3iB9O5LLRjcfzvdfcedOeRFJWssFmxCqLRk1vAb1Yu0UwPoLPDPzRVrRIlnJt85Zrtz/mVu
	IL5tM5uKrsQkdjm3VnUKSDlLqj5W2LImoJvZZcZJVb1rVtU+ENmZDHl0XaQ==
X-Received: by 2002:a17:907:1903:b0:bd0:bc5a:746 with SMTP id
 a640c23a62f3a-bd51797803cmr1264657266b.36.1779227862366; Tue, 19 May 2026
 14:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260519010440.629290-1-rosenp@gmail.com> <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
In-Reply-To: <61fa661f-0281-4b58-8042-f3f60cdc3407@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 19 May 2026 14:57:30 -0700
X-Gm-Features: AVHnY4J23bC0PIprMi7AoskRuLv549OzojT4O6f6SArUx72FsVkA9zMJisbtp4I
Message-ID: <CAKxU2N9E0HE+4U28A2n5m1BODTEzkgeDKeiXYhcwuLR=fnNZJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_145745_234664_73BD7F59 
X-CRM114-Status: GOOD (  15.06  )
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

On Tue, May 19, 2026 at 1:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, May 18, 2026 at 06:04:40PM -0700, Rosen Penev wrote:
> > For whatever reason, GCC is unable to figure out that i2s_num is a
> > single digit number, with MT2701_BASE_CLK_NUM being the maximum value i=
t
> > represents. Add a min() call to help it out and fix W=3D1 errors regard=
ing
> > snprintf bounds.
>
> > +     i2s_num =3D min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
> >       /* Get I2S related clocks */
> > -     for (i =3D 0; i < afe_priv->soc->i2s_num; i++) {
> > +     for (i =3D 0; i < i2s_num; i++) {
>
> This makes the code rather obscure and will start silently failing if we
> ever get more than 9 clocks, we should at least put a build time assert
> or a warn on in there.
how so? MT2701_BASE_CLK_NUM would increase.

