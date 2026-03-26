Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5D4109E547
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=; b=hsUifEJHHEQgcSBIcUzGrDDyrJ
	BAGJkA9tRJ9geu8o5Z+IXs8p8HeSwsIued7Vlz39gfVKqKKwmI7MbLvQC0aHxv8bWqj+Nim0zuojI
	64rJYw+ME8GuJbvP+SNsyC5Ob744YIIU7I+13HDI5mDlqaJ4MTU25zVmKa1wMarVuqxB4vKrd0Vqy
	9+Fc7CBZxhQKmwnGrB2gCHEfBc7QJxDpg4qTeU0DhRv0xWcw39zuNxVtNOy6wYVMwppGR1OcX8+l/
	dj1FlZOicIiwUyURnSKVO86GcB5WpzFskyUKExDVnFOrntNnSm9THinq2zehAC+5UpqWo8ZPGSZGH
	zslVtrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5c7N-00000004fCs-0bRK;
	Thu, 26 Mar 2026 04:14:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5c7K-00000004f9R-13lF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:14:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a27c329e98so718368e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 21:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774498484; cv=none;
        d=google.com; s=arc-20240605;
        b=awnNdKrIAi00nv4oUWBuFMtBEphSlUZb40Bw9dDjsFSWrB/B8P5F8D3hLb5e8SiwTi
         3O2bb+4oRU6bQGQHKrdHRMdq3IMy4M1ZY9YhKKAvX+bpbNf9ZkNmLZtfZBXIXVxjSYu8
         PYl/b+PP4DaY4wm6Gn7f0lEaZe9tmdH01M8wSaLLywVTPVxpV4RvD+pgM0XhW/LqKzF4
         EfoLD++QNYq7L2ZSHvnM8a10ug8ep/aSJ07rNBEzp/4J59wvvzpUq8xxhaovicGtLBoF
         Ho5P9XDUSkfPPO3Tf65C+Nf6PkNK/u8ewnK/B/U0MqqDLZNeaCzyjNweFNjDidNf9vSH
         EDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        fh=8W09vqL5DW+ODh3JFYkNopkwt/V5pM1YeOOKhD/6M0c=;
        b=ArktVkTcvNFhD/1ly1BEqz6V9URuPqMLusolo1zMw1VWhe0rs2MaauvvYHjsApOa2n
         hpTj4ipDlsj+DfWv4K09GvEmKH4PsChbYgUpO2eCxxok1kv0TauDCS4NQnB/MA/vm6eD
         KqDUk8P84tN4W9FjfIWroGWk2IPc9EMzAlKbw6nfkPQ6WH1hPg2euu1DUpw73oPWnZvm
         OD9IdYgJ+zzIro0R0cKxhE4uU4Ra8HGnm4YMlYJOzsKmdXnEnFAoxUT/mO9HysLjr++R
         D/M7tWTZTOJuMy9Mjcd5Grkly+E2OIDFTPXWcSAvg17Nn9dHQtxNiTY0+15hWzHZqTUl
         wHhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774498484; x=1775103284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        b=dJ/5WGwXV4lQj9ljO0ansBsAkqS3gAVGD8oN+FhVDin38U5cU8rJmT3fQCLfV/jQoz
         tpfpNr3poDzef2TTPHYnbSkX9JsKlQikE112eS/vgocViH+Dp0ta+KNQbmSkgp9F5mu+
         kGFxZoK9AwkSpXWWP7EUtol04shJ4wes40G6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498484; x=1775103284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        b=CW2EcLo6KqGdl7WkIBWvJ8bJ6ttbEFDUFyUNsyLyvUA+0EISWx63gmiLuYcoPeOUQV
         jNskM1azeHwTeTGphTGfGNteeyopLeZsxj6f8Re4TYlkHrp1WNrWdJN92m93ze+z+qZf
         EaFt4NOSATQQoTfbMmP8gLV+r0AzlNaw5uT8J1wBq3/ePuyL05upHYlKpI1sP/Fgg4bt
         J5XTDtIhjG8+37V0EqtgU+NTeFrq0y5q3xErOAuqpmtcDBfLR0kG6hFPMs1zllcsbWRJ
         LOKqRHeIba1CfbMg1yvnT9HsLGv7tKsRioQXsOIY5tdzgmk0cafuDcsekxUUre2JzZaX
         Pevw==
X-Forwarded-Encrypted: i=1; AJvYcCV/bGslhF1lMiLKOaPErDQg+hBaCloTYyeg3nd6KtaWLlXL4wK3OPx4Re5TRhTpo1ZblB8YUc4IrYO9V88ySxjY@lists.infradead.org
X-Gm-Message-State: AOJu0YyoAnYjoLFRFJKx5p7pQtdqOmUppeCC5roKHXgP69LzlGQgCjE4
	RvR0Svvg92RqXzlvEAWVimoBzKWDqyA0tOixQGCWmosSJojiauiD8l6t9rY6t2cxu3XLZnlETIs
	p6yhAmyx1ULspaWPjw+4/YzbnWP7+1bRJD2cu+Xpv
X-Gm-Gg: ATEYQzyM2tsaj8H/eqGCTgt2qGu53pQI7i2Ei5/hiaeIkgZYw7yFl5EBkOa2Y4QFOYJ
	FkgcUL8quBds6pvivTNAuW/U7ZRzmAxjyCWP4KKmfoAkgVn1OAHN2XBKIu7jzIQQMQN6vOIK1OG
	5iZ91BU4CFljodqrE5ZKMIoYa3ZaLfPXFksVN9sFmm1vjTn8SQLmdcP6W1AnuknhtIB5kgJP2C8
	druzDvyGkLGxH/VGWuw6E+7cLQZCmlYIEhDS6kwuB3BYc0VCkW3J9D42TmIa/m33aWNNI0VwppB
	aJcb6qooFGUYjM8Z8blDoFkpjIUzAk03ozp1XA==
X-Received: by 2002:a05:6512:3ca0:b0:59e:65ff:e57e with SMTP id
 2adb3069b0e04-5a29b976b9fmr2386806e87.12.1774498483909; Wed, 25 Mar 2026
 21:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260324053030.4077453-1-wenst@chromium.org> <20260324053030.4077453-2-wenst@chromium.org>
 <20260325-uncovered-carp-of-inquire-8a7acf@quoll> <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
In-Reply-To: <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 12:14:32 +0800
X-Gm-Features: AQROBzDMA30fJWTvgwWnvWVXSov1HJF2nrcMqAj-rcI0Dx_RnI-WKxTXLlei1no
Message-ID: <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_211446_320184_6D3F7889 
X-CRM114-Status: GOOD (  18.90  )
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

On Thu, Mar 26, 2026 at 12:55=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Mar 25, 2026 at 09:56:00AM +0100, Krzysztof Kozlowski wrote:
> > On Tue, Mar 24, 2026 at 01:30:28PM +0800, Chen-Yu Tsai wrote:
>
> > > +      pvdd4-supply:
> > > +        description: Supply for vbuck4
>
> > These all look per-regulator supplies, so I think they should be in eac=
h
> > regulator node (see also regulator.yaml).
>
> > Or in top-level, but not in "regulators" node. The regulators is only
> > wrapping node for children.
>
> > I wonder what should be our preference - have supplies per regulator or
> > in top-level node. @Mark, any preference from your side?
>
> The top level, so people can figure out where to describe supplies
> without having to read the bindings so much - the supplies go into the
> chip, even if they're distributed within it.

OK. What about the more complicated mfd PMICs? We already added
*-supplies for the regulator side of these PMICs in

  - regulator/mediatek,mt6358-regulator.yaml
  - regulator/mediatek,mt6363-regulator.yaml

And my other series for the MT6359 also adds them in this manner.


Thanks
ChenYu

