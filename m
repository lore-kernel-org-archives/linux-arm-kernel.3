Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB418C83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=; b=rkQ21iEo2XB1jA7H7lVWofSKSA
	3iyk+OKfMTwoPgg19Z0ZHt+Iet/eD4UOzsyqv5ytwTvZyMHYQlvrKCW0wOwXTLxqfN4GHe4wfcakX
	hGbzO/27lSTmmIOCz/RFniYcGzsuXC3aS7kLFJefdy5nBMjWm2XreGDAuOuITZDOcTR7hAx0rFRIb
	YCkQD8TS3vErudyWNNzgEtPdOCwlahnG+2q73z1xBUFxEl6rn6qixYSIqn+9Gt2pDIaOBTHq1Fu0D
	ji1fCnMLLg0oypJEezGvX1DmG3Cyh5u/XV64g85E7Y8AbGvDgcRjd1IR8OkuMs15pFsJatP+Hk5/4
	RZwuwAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeRV-0000000EBHP-1F0K;
	Fri, 04 Jul 2025 11:18:57 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdRT-0000000E18T-2rTK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 10:14:52 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso820235a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751624090; x=1752228890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=;
        b=P2WG3TnVcGeIrdbJtab1NHXUWdf8r/TarPVvVleN7Tpj7FT9HpSq5prOtO7vGhcLLx
         QRHrvbvCKVrkJ4wAH1ZZYqvKHdgVwo3sa6EaivzYlSd+b/TVWXigcCUcTFK4EJhsvWx7
         LzWzPU+tHSeVaf3ZJK+GAe9s2D7KN97IxL6ATv03APxnQXdpqjwoIgDo4Ee/9CRsP0pX
         ljngOalqDTQIggxdQr6vWOPy+Y/wPeel8uolbcKTReP1RBzdEDaDDvkkLKgmkdzwgg9M
         Nqekyzotb35j6CsOU9W6E9tpPOmLvlBQ0n8ezXuLDdTJ8NJ9J0DQxLeu7kDF0fmVenxn
         4smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624090; x=1752228890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=;
        b=aIkdSY8zhJKAoq2/5rpFpISlQzD5a0qLt1VSFrYbhXPiKnDA+pJZM+NgcQkvo60/72
         lavVE4Hhd0xhY2CzLQzo2GfBVIHBkUFvPgQ8l7okMkwmrP0eK/kR4TjSU8ZQa/CKUMzz
         iGpOHxS4RQ8ekiPFaG9Em0sR99Jcw4UCcenJNo1+OIiyHr2GWpxU4EFkxEHk1/FBQUGX
         8faMOrGmVCG1oN0RLQl/eQHc9+wxfkImy8mfRU3tdIem8Pdf8zJiF+8tPjj/Dmeaen0j
         4gKavhPiohu+LWPUzYSfC2Bsj1SNkc5UH21bUC9BJfCGgWEiwRR4iARaPdwTcWh/2Fk9
         WNcg==
X-Forwarded-Encrypted: i=1; AJvYcCVsPoWjhmcgWBnVMxSJFC1NcW2KwuhnUAJrIp9vzwV31foG3tQlL4X3enZlPihRH4WLICapnhsPh84d17sOP/bK@lists.infradead.org
X-Gm-Message-State: AOJu0YwvqimF6KYDSni5JquZhXdAuqc2jTTaOfCe9nZTquP1KBDGJ1yX
	HxtBZwMYqv2gcp5aFaVkPlG0ehcbshD+CuzA6gQ3GL8Wa6SqOll8VZWU1Qa/wZ6geSDNc49RWW6
	7WFL25e7zlSjE22RMt2cCfAs6VmOicTtjtilIrKPlcA==
X-Gm-Gg: ASbGncu6fDMNjbREXcOwqwFHueVmkbC4Y7yH/rd1z1/zSknkcPUxkQgJtTObhEyRJZb
	ZzXLlyIVLKWVSUGmek/MxfySt8GAX3oXUqQXsCZmRhTJ3jBSX1omw7uZZ0AduL24lBY5bpY9TRp
	HND66Fly6Jcgpo2xPzi8wwqLnGtyJQr7N5rLI9a8oAjynLK96kmoFOCuFA65izDGPr234W73rSd
	3hf
X-Google-Smtp-Source: AGHT+IFjwg/psNUtt35b9Gmob0BLVqWk1GkmmuqjzaAL0gJFNIEsazYmsIVCo4iVpxvsNBxNzV3/0MwU6x9tzdeiXKA=
X-Received: by 2002:a17:90b:1fc3:b0:313:23ed:6ff with SMTP id
 98e67ed59e1d1-31aadcf4979mr1915406a91.1.1751624090581; Fri, 04 Jul 2025
 03:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-12-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-12-ulf.hansson@linaro.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 4 Jul 2025 15:44:14 +0530
X-Gm-Features: Ac12FXyDa0B0X6sfvOQzisE8yH6dk2kS-j3Pq5vg4WlBzfStBdZqCfBVav2JDDs
Message-ID: <CA+Oz1=ZnwUX2_s0rvY28um8eMDqqWKkJ5KRc+hqgL_7ghQf8Wg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common
 ->sync_state() support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_031451_716900_D3722379 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, Jul 1, 2025 at 5:20=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> The riscv-sbi-domain implements its own specific ->sync_state() callback.
> Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.
>
> Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
> power off unused PM domains.
>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xi=
linx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>

LGTM

Reviewed-by: Rahul Pathak <rpathak@ventanamicro.com>

