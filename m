Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B239ED609A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oZqeCiNDi+VUMlqaFu0Cj3Hfsp6EOFS1u82qR+tNuM=; b=L7slJ5SHQDEa8Z0Jh6ji5spXDP
	QkumOztdQTqCGKm+D1ifW7SefCKqE8PuCb1Y4gW2UsESZmU3g9L7k3S7tKuimDFapi2KaVgBnj6ht
	RRrPS8z2VINhsrcdLMPtcPMzmMcjoWfW89ZFpIamPU06QzaUXwM5yMxTan0uSa8pO8RcCSAcrijPo
	yN+0FAqJSte0fIOwYpfzT1Bwcy9EAi5svnT/nW693zbphdhyPaa9QDACcqxHPbFYyHgXLrK5yR+22
	OQXErlU98mQWw+6pNZaosygZI8JeYUbujFRCsl1kPdlsgOqCNqUdE2cosr/o8kp0HswVmZCQPhFIK
	kZpwJnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCTt-0000000CROm-2Tnr;
	Wed, 27 Nov 2024 07:29:01 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCSv-0000000CREr-09D6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:28:02 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so46601321fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 23:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732692479; x=1733297279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oZqeCiNDi+VUMlqaFu0Cj3Hfsp6EOFS1u82qR+tNuM=;
        b=Vzb3qE8WQtVqQfFKYtuly3FzaSwBcWvgtdI66TMnVDWO1vDObVP+vfdP3Tvc8+PTwc
         TFrnaAGigQBA8fIqC0qDzXC2506iuZfZRIeyShS2pJb8hEYugtyNU5H9SLG3Lkro3cEJ
         e7Zqxzjrnp1HymO46SuWU/YewbH18klZRhhJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692479; x=1733297279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oZqeCiNDi+VUMlqaFu0Cj3Hfsp6EOFS1u82qR+tNuM=;
        b=rqxa7V35GBSIQ2o1Pev37e3Z+O3Vc6cdpH+kS974CC3KWbyuv2hIv+G1YoFQAcdT6J
         2eSRZ/05nsOtWYWhtyMiil3FMm+2vdXBP5movEd7zgWaDgNLCJ+NMrHndJAOT+V0IaWL
         VwbvEp4Fk+19fOHAROCgYnuhpP9RYKkze9FXN67Kujh9jkGhrF0k380SJ/KutCZz2cJz
         mW73Yw550cl9iKVgl8AuckkAzM/0PuKBBByO4GeOuyeTRXX0oryDpgZcC35L9sAK/kqu
         Urmf2GnWKaGq+WerPez/ouD23G9x4LyMzEULhYRn49iBnlfmlFHO624e71Q/6Qi4xBns
         OOiw==
X-Forwarded-Encrypted: i=1; AJvYcCXRiX90ZuIZ+qKD0XZ9zCMoRO6fUcIbZe/0eQvz8hUYNZBY/9lfM0pgLVr61ceGSnMyAtfyTbue/rdF5VvdFS31@lists.infradead.org
X-Gm-Message-State: AOJu0YyO2uvaL2a/qmKDZ1jF05npYpnPfwaSFD26dqlE52QIK9DOjUpT
	AImTHnvRjbCXIHkS02/hZpvMfbzLfinOV649+QNH/YrCykg/uoykX8nKmj7P9DP+41sw2BZwt3f
	EFpfu
X-Gm-Gg: ASbGnctM70iJMjo+jLpavPKzUQVXGI1rWGngSEl51L1+mygEIH59kU5HV5ONN+2clvv
	bTiC3uw/zSOXMwKzI5UAXapaHuZ+9a5e+OSxwPvMZp7DuYmWfvqLwvhs+dxfUdWsBbwhn0BQzxe
	dnchSjInG2bGHvpDtTpvKmWjlcYJ7ijAYnVdmk2EBHY9qT1n64D4xXAZwu1YtWDxs0VtbNpwZfw
	++k/LNGXMiZtluGl0d1V0MFDd/OahdGZUXhR2EAcyGrNYRrXHTYMBXlKLBUTVySMCfcxSGF0Ayu
	CoU2iccbgaLmwydk
X-Google-Smtp-Source: AGHT+IEZDSW0VjOPA+KVYlsanAWH6y9dfpRd+RebBVQHBpdwLBYJIzlMty+rZkqrYyY85G8rGG63uQ==
X-Received: by 2002:a2e:be24:0:b0:2ff:d36a:2b31 with SMTP id 38308e7fff4ca-2ffd5fcc124mr13174411fa.6.1732692474324;
        Tue, 26 Nov 2024 23:27:54 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fe94sm671026966b.96.2024.11.26.23.27.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 23:27:53 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so4730a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 23:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkAK55i+gtgolXL763eoG8wuZsU1m3gynbXPr40ZpNIRcvqQ9Gf/2P0opzXohxDqZvoW9veC27WygHn60RnSDj@lists.infradead.org
X-Received: by 2002:aa7:d80b:0:b0:5d0:3ddd:c773 with SMTP id
 4fb4d7f45d1cf-5d0819b8bf8mr48974a12.4.1732692472728; Tue, 26 Nov 2024
 23:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
 <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com> <f38e4283-7133-4865-b4fe-eafb6bd30534@notapiano>
In-Reply-To: <f38e4283-7133-4865-b4fe-eafb6bd30534@notapiano>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 27 Nov 2024 15:27:16 +0800
X-Gmail-Original-Message-ID: <CAHc4DN+S6mBy_VRTWEqp-uA13zUyadtqPoo+-WZTmwYHofpkcg@mail.gmail.com>
Message-ID: <CAHc4DN+S6mBy_VRTWEqp-uA13zUyadtqPoo+-WZTmwYHofpkcg@mail.gmail.com>
Subject: Re: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_232801_069855_0529B82A 
X-CRM114-Status: GOOD (  26.74  )
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

On Tue, Nov 26, 2024 at 9:37=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Tue, Nov 26, 2024 at 04:00:42PM +0800, Hsin-Te Yuan wrote:
> > On Tue, Nov 26, 2024 at 5:21=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > When configured in filtered mode, the LVTS thermal controller will
> > > monitor the temperature from the sensors and trigger an interrupt onc=
e a
> > > thermal threshold is crossed.
> > >
> > > Currently this is true even during suspend and resume. The problem wi=
th
> > > that is that when enabling the internal clock of the LVTS controller =
in
> > > lvts_ctrl_set_enable() during resume, the temperature reading can gli=
tch
> > > and appear much higher than the real one, resulting in a spurious
> > > interrupt getting generated.
> > >
> > This sounds weird to me. On my end, the symptom is that the device
> > sometimes cannot suspend.
> > To be more precise, `echo mem > /sys/power/state` returns almost
> > immediately. I think the irq is more
> > likely to be triggered during suspension.
>
> Hi Hsin-Te,
>
> please also check the first paragraph of the cover letter, and patch 2, t=
hat
> should clarify it. But anyway, I can explain it here too:
>
> The issue you observed is caused by two things combined:
> * When returning from resume with filtered mode enabled, the sensor tempe=
rature
>   reading can glitch, appearing much higher. (fixed by this patch)
> * Since the Stage 3 threshold is enabled and configured to take the maxim=
um
>   reading from the sensors, it will be triggered by that glitch and bring=
 the
>   system into a state where it can no longer suspend, it will just resume=
 right
>   away. (fixed by patch 2)
>
> So currently, every so often, during resume both these things will happen=
, and
> any future suspend will resume right away. That's why this was never obse=
rved by
> me when testing a single suspend/resume. It only breaks on resume, and on=
ly
> affects future suspends, so you need to test multiple suspend/resumes on =
the
> same run to observe this issue.
>
> And also since both things are needed to cause this issue, if you apply o=
nly
> patch 1 or only patch 2, it will already fix the issue.
>
> Hope this clarifies it.
>
> Thanks,
> N=C3=ADcolas

Thanks for the explanation!

Regards,
Hsin-Te

