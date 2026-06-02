Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985A7CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiRZYLqdYuU6SFpoVEk8+QM9CW1MlZECjVChvA6J5qk=; b=SNWCzBnYEQ4vJ6/RX1gcFIoJBi
	H0aGfLz7bh6LZ587K1xoWH193p7sqr1jmbJUyJwgY/4qmkm6rY+sLxsVsg3M6uvT5H4IDZpiq53tf
	ZYj+B6jOmCLZvDHpFHEFGsuY4XloNZbtOsjGCDJ6Fi4ZQYivux4hoNKwSVBehTfPlZSJ4LRwo5v5f
	z28tLp+qyDpb9H3fxHmToceZUiWYY9KrO0VAfRk1GGf42XAoEB+WW/pInXFxfVGeLQX6yeC/oZc/o
	xYaauyoX95CoND4Slmw7555jqHUINzXdNDfoxCu2nYUh0o7vVQDzn4IU5JOFRxs906bdttk4T3f0N
	EaflJFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKqw-0000000CbRi-1roi;
	Tue, 02 Jun 2026 08:52:02 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKqr-0000000CbRC-44kr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:52:00 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68c1653ea0cso5995030a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 01:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780390316; cv=none;
        d=google.com; s=arc-20240605;
        b=ZS/XdFrfFwiqNyU/Y1FoJIt5s41kQhQE2vZkjvHL+yYWQPxIS5hHe5zyWDeyKQKQIy
         EXQCNiQoNN+isS0aSd3fTMrLxNEHR4Ne7jlx+pIDsvWVnIldGNni5Vq5PUjHlccSlm53
         tFp5BpbxDfOuSTjx7iiNp1lSdnn0BfCaeoovEehSzTLx7L0TtN2iMAky2FLr/5HZ9F3r
         Ad2PcInOmzgPBSfRzZffk4Z8hZBIsobi16DkGPnyrdkczi1q4hJDax90Cvv1paN3fA51
         gPlBc3gwbxQoL3l8CanX9D5D5RAH/5a0WOgRLWX3YNs5Sl3B8U7MWK/5UaTYiHUPwuFv
         fZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NiRZYLqdYuU6SFpoVEk8+QM9CW1MlZECjVChvA6J5qk=;
        fh=h8FErJBnycs8ZBHamMHLCcoUkBq9A2OVhEG9psprKYY=;
        b=L9TGlwwxjsPUd/tULx58fXjHEz+ypsRlT6Le5iv5HBWeV2RUN6f/nQ/MaPIGhnNvOk
         ttM5P6LsiLLdki2GKz+tTnZPvlhXMSodL96TafmVLfO7fE19MxDLEttTmCrIf6lFFG5I
         63WWD1wbwpr6jCrLHFQfcOkT0djfZnxvcxvQgLWS/Zyw0xlto1vqCPy7A59lzuhPTuQE
         qgMgxsYcTyZoIowfhyXaiR3qHwHdIf/y1aS8McuuR7iOLHL/BxqHv9cfetli+DcZ/f/L
         JQkAVjlrLcOsg5X5SqQ99v7FQSQvKEG8wp6gwIj1l8Tm/QgfGjhqNpGyXei30EH2gHOt
         3YuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780390316; x=1780995116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiRZYLqdYuU6SFpoVEk8+QM9CW1MlZECjVChvA6J5qk=;
        b=BtopiBwRJmBFHEZF0gB7pAEoIPLM4+5nZ4opKPjuJeS7c86vpBRGNTfYlpzeysIvnA
         wcJMF7poEdeuHWPI0y6gkIyAKrVJWfFtMLl1K4tMVRD83Implib2YWedbYaLWr5CNopo
         ZkzwCqWGYtTKrquUl9sXiYvy8Ak+RVZmScXgvQ8fMu2ldR5hvSJsWzT1NJNKGjlV9AOh
         f4I/px/E1ga/Ut+VbzQ8pwOl5JxBxLjT4OkNu8BC5s8IKM6WS2cYYdBT00OR/ffG8DWi
         xdVCpVeCEYreWbacwoxI0NoVIlYokykcGZ/mQuyS6SSsdKfvkMQn8LPD8ryr+VcOD86h
         r5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780390316; x=1780995116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NiRZYLqdYuU6SFpoVEk8+QM9CW1MlZECjVChvA6J5qk=;
        b=A/A8lciELzWdt/OCFuUyd+3gyydKXaU0PuoQgRMG511grGoq4SR5HDBx0iNO8orkNX
         X+LN6LWEuJU9AdQXjawZC9xpFocz9Lk0/3hptrKxMEY9ICiR3A+V0wk/RNDNw2EgdyFc
         s4wNhYTTvfgEpYWt6W9tP37Ke4pIqE9vpfYgBGigbKpTJ0bztnWqlX8CLk5NzIQrCMBb
         8zLW6aTsQssLh/RrEtItLOWpCcWn4ek2B1MMXFa/cjmMotCz3n1MI8KzwkJpadkbln6Q
         jHQv8+YJNKWFmTMHV83BnWqT97g20UcuSn4kMT77H3HVtaJmmnYXULG3P885kt5IWNcO
         4Dog==
X-Forwarded-Encrypted: i=1; AFNElJ8uc6OyIuJfsGpSrqrQ3uVwD59Hp2ifpp6izGGbA5Ef30om7o3EA/kOkHSlarkPZ1hTj94lCBXnAu7pNMFKUoBF@lists.infradead.org
X-Gm-Message-State: AOJu0YxpDW63t2y4S0NtUM7C89agkjG2HnFl1+dVF3VYvGDzmiAdChJF
	u9+KMCRrTaQFrYl7yVFZf97KriktxIJ71J7NVNSDU09Awhqj6T+hgQYl3HN346NktK3cYNE4EBH
	ZGM8GY3oRoGomisccy6ge9QwbLmn5cN4=
X-Gm-Gg: Acq92OFoB5ZSAWX3GLJ4rW0zFLQ+3iI088LdDQf9tO6x+JGEsi6UQZGsVLMVOKLeJ35
	kYAim3X+yCuvSTxrfInV802YvlYJ/skYHfUueDmTWRTI0LCnznNzgmhyGaae9m9/1fz8lWA924j
	U/hlvcsaRka11EzF/SHXu9dvIL/FhH38aYVlP+iLnl/eopz3vMxHrnNunRAneOCL8MWnfNx0qmw
	QRil3JL/3CGxbzbTDdjqOnnpqceTIs8C04l1afWgqLrUfBM7Mh3YmbsF/b3VBcLDotL9SLL1Ugc
	SqFXWUNyZqfB2oU/GhO41TD7BdHOKGMcVdDKkocdS3Vhgi+RU6BOmq9oD9dPKlPOg06A/cJlwwb
	IaOCk9fO7UvRRI7jgXBetm7hwI0sdt0XbbYUTYmiBco4r2kYbx86B59+lLNgKPdBvh/U2
X-Received: by 2002:a05:6402:2b99:b0:68c:33e9:bf71 with SMTP id
 4fb4d7f45d1cf-68c8ae14309mr7505543a12.11.1780390315907; Tue, 02 Jun 2026
 01:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260602035907.623599-1-rosenp@gmail.com> <79ccbd62-9aa3-41a6-a8db-1737672a8aab@amd.com>
 <CAKxU2N-M+vDeDKtYa6=M-4kazOUrGTrwJfHoF6Z+od1OZ-VBpw@mail.gmail.com> <b9e06f81-2b18-4cc3-8974-6df9063b02cf@amd.com>
In-Reply-To: <b9e06f81-2b18-4cc3-8974-6df9063b02cf@amd.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 2 Jun 2026 01:51:43 -0700
X-Gm-Features: AVHnY4IFc2FGJF-yhzYHXra0k2OW5pWoFypg9qZSsndqoXXRhQu8ezFeHabdJu8
Message-ID: <CAKxU2N-PVmXw3ha-W1Gs9SLpfaJea3X2dPGQYhCwEBGNtYAwYA@mail.gmail.com>
Subject: Re: [PATCH] Input: xilinx_ps2 - replace in_be32/out_be32 with ioread32be/iowrite32be
To: Michal Simek <michal.simek@amd.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	chleroy@kernel.org, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_015158_093988_609ED4DB 
X-CRM114-Status: GOOD (  18.89  )
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

On Tue, Jun 2, 2026 at 1:34=E2=80=AFAM Michal Simek <michal.simek@amd.com> =
wrote:
>
>
>
> On 6/2/26 10:27, Rosen Penev wrote:
> > On Mon, Jun 1, 2026 at 11:23=E2=80=AFPM Michal Simek <michal.simek@amd.=
com> wrote:
> >>
> >>
> >>
> >> On 6/2/26 05:59, Rosen Penev wrote:
> >>> Mechanical conversion of the ppc4xx-specific accessors to the generic
> >>> portable helpers.
> >>>
> >>> Allows enabling COMPILE_TEST for extra compile coverage.
> >>>
> >>> Assisted-by: opencode:big-pickle
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>    drivers/input/serio/Kconfig      |  2 +-
> >>>    drivers/input/serio/xilinx_ps2.c | 24 ++++++++++++------------
> >>
> >> I don't think that anybody is really using this driver and would be be=
tter to
> >> just remove it.
> >> If not, no issue with that changes.
> > I have no problem with removing.
>
> Can you please send a patch for it?
Out of curiosity, I made a deep research AI prompt. Last known user it
gave me was from 2012. Github code search however gave me a user from
5 or 6 years ago.

https://github.com/danielkasza/9444/blob/master/firmware/xilinx-fpga/genesy=
s2.dts

Maybe someone knows more.
>
> Thanks,
> Michal

