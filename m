Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6DCD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWhcoZlGhBQ77sR0rQAV7Yrb9ZPYV0f4GyPuUgtX8O0=; b=vf5gwXl6pIu1xnfoEjo4svso+2
	PMS8bJM7GCSf1aG3evNgtZYY5NvLxWjUho2hDHiTKPxcWOqJojCV025Qya9KYigFGF/yfuErYlLUU
	TU7Gw6/efXphMxvSVQKk3xdyRx5WsOrRkF7ZiQzkc2vuMSmvDioZ9ZTjx5VJVzyJ3cysFjtGSgTEU
	kqFipek8xcs9YrT6gw8Chtz8xMPgaBNkCkx+8qlbOGTPeFoWXEqfc/ZtCVIyKz4QqFj9hW0l3leGe
	N7CuZofrpKNJMwS+qC6pSSKiPOwUCVrg8rSR8X689y/ofacchRcUMLwtEO5OT8AYr6yScbSj1yB56
	doIG3n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRnY-00000005WnY-08BQ;
	Tue, 02 Dec 2025 14:56:12 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRnV-00000005Wmo-2h3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:56:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-596a055b1b8so6223071e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764687367; x=1765292167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWhcoZlGhBQ77sR0rQAV7Yrb9ZPYV0f4GyPuUgtX8O0=;
        b=LL3W1XKm8bcEXv8bh1GErt7vqFSpN3oeMfYVVnr5HPXGae8cZSe4hn4jyPUKOIkevU
         Blb4fxNdFgPJRuyvM1NWHtTY2c33LZsdFkBLWFiP2x4vzW9RudDoKf3o4r5JphSqIl9R
         IkcXBPYpzezmGEQnTXxNlNGaieRzhsxxehXzfAz+nPr833/3SduVDT1lVHyAOxa2gw6H
         kAmjRzAZkXX2T2HB06/q32b8qUl0KSzqOAGPdj19K+eFDD/nd85T1lmeCP3lT6u1T2N+
         JxHrUMAxO/bliALhURyJm0r9w7vx79M2URiP44IN8fBxA47KJcgC6h9+/xFOIH58eMwB
         Rpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764687367; x=1765292167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWhcoZlGhBQ77sR0rQAV7Yrb9ZPYV0f4GyPuUgtX8O0=;
        b=Vn7Jq+gwXNAVemwBPf7mp4XkPpiVf8dyeCAqVnIErdy2PZp/Q9rKNWInvWZzP1krhD
         iPjjESDJVxcV+N42DF3eaSWLaZ3ZCZY5cdlJHYqwGKE5ZxASo3hafJPi3TIVUPNnbzhK
         lcfwg1kxOnN4SVewPVihUJfghfzShhkYz0X5QaCqV3UTvofj1XKBireQm1P+G3SHyQU1
         Frw1WssOxm6Ly+5TyPhBnyPxQrFG0YCauBEdN30WU1iySHzsWjyrSJq+oBS3frfPmd2W
         QMMXYLrdgvcer3otWdawRzuh4kyq50rCTl1THnKttyl7xfvIsj8QBGbKhzq+TT3X2aSZ
         uj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsjmGhCnQ8O5OYSdhhLhB1tBa8Ihe5J8Jeiua3gpYfRPmwt/BQ5xzcOR0sUckA43TBzT2QB4O94bcunkwx1JV+@lists.infradead.org
X-Gm-Message-State: AOJu0YwsEVzGjW9sgpxIQXNNk2e+xRgM3nx1ZAuOTyaG8YcOqY1/6OQg
	TDE8+B0jhLfRa+1f4Fs2sbbghjcdoc2pE/YViDWWojCqRtUUCZ8GQ/zTRq7jIUo8uDfHBnCkmUO
	1j8DBzvDulJpH3bAYEcE6wqeg7DPu4Usqfv8MdVqAPA==
X-Gm-Gg: ASbGnctcZUuE0CKPtKL0t37nSzx65jVwefq83LqLJL6rTY9HFts8fiS3l9kaGt8Dq+v
	pIYzxATNG2Yv/rCg28zomXW4SNsktepHmTWRSStTrOuGEYAyZm5XO6NN00EU87h3xLoKPK/cMMN
	vDGdoPwKCdt6ZeB24JBQ/Fjc4aYtfmYXnNVQhIGYSCarDdkiV1drUU73rYnwAzajzdT9/fJXoGq
	zbFLdjz929xsaxK1ok07n598LUApZL1sdlq8dhon/K88HbhbVxDWV6avLdP4X14fA3FYV2YsSyl
	2XFfdKl6JpTGagTIDwwLbvypDkLj
X-Google-Smtp-Source: AGHT+IH8nrVQF9KINoSka2LNLEfOBmlIMfwVLRSLO+LZJ0kiLaPlm5nn2o5FX2HuDj4aI4GtB5fbyQRaSI7Jh58fKvU=
X-Received: by 2002:a05:6512:10cb:b0:595:81ba:fb3 with SMTP id
 2adb3069b0e04-596a3ee787fmr16262065e87.37.1764687367533; Tue, 02 Dec 2025
 06:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20251104103942.96647-1-marco.crivellari@suse.com>
 <CAAofZF4-D3PT_eE8e4VRX7bCkUV0d9h99YypeYyPhCg+sCFBpw@mail.gmail.com> <19d32db7-5ec3-41cc-b0b0-5e90a4447fb4@amd.com>
In-Reply-To: <19d32db7-5ec3-41cc-b0b0-5e90a4447fb4@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 15:55:56 +0100
X-Gm-Features: AWmQ_bls2MuMFJSRxyf_ZtdMkKO-yHVcnSNndwpseBzrEbUp4_tfr_qVOLWuEKk
Message-ID: <CAAofZF62oEd0sXN5HNmXYBtwkkad9ppWg9RbMnu3WM9EQ9Gc2A@mail.gmail.com>
Subject: Re: [PATCH] soc/xilinx: replace use of system_unbound_wq with system_dfl_wq
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_065609_708247_8DF46101 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Dec 2, 2025 at 2:36=E2=80=AFPM Michal Simek <michal.simek@amd.com> =
wrote:
>
> Hi,
>
> On 12/2/25 14:25, Marco Crivellari wrote:
> > Hi,
> >
> > On Tue, Nov 4, 2025 at 11:39=E2=80=AFAM Marco Crivellari
> > <marco.crivellari@suse.com> wrote:
> >>   drivers/soc/xilinx/zynqmp_power.c | 6 +++---
> >
>
> I will queue it after rc1 tag.
>
> Thanks,
> Michal

Hi,

Sure, many thanks!
I've realized after I've sent the email that 6.18 was already out...

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

