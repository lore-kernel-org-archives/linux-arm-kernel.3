Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38610CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA8ToaN2ec5XOHTlGwPSdrVYzEewX+q+dK/4ilZO5fw=; b=r0gekTbXT3Xp5p3SC9XYgvZRGc
	aUePAq8bYq8r8gWr4BNZvSuRwA1SH6s1/SFJxBxZTsMSUqJOb64UHDnQCgq7T85fqS3h3bkStpu3N
	yrh4fTQFu6l/FGI7EmayAVy48d/FY0OROy82se9KQ+RPHGa6z/L9/HoneBXn7iplQzz3a63z1XNMU
	Xo3R+kx//scUyA4KJFmhFi7dQoublxtYrmg+7ukGrfW8JY8wM9Ye2mCyuv0368YfDMRd9wmKWXofO
	891skU5oK4dQsQZ+U799hEFVysO3VvkGGctoTp+j44SVgriAskeOLthBUbyL7KEOTGYtsN3r3Szcq
	K57RR/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27UL-000000017jL-3hYe;
	Fri, 26 Sep 2025 12:23:49 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27UI-000000017hT-2Iv6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 12:23:48 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-72ce9790aceso20265877b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758889425; x=1759494225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA8ToaN2ec5XOHTlGwPSdrVYzEewX+q+dK/4ilZO5fw=;
        b=rhVenC1WIX0SObOZXtKih0WvvfCLlac7jITiQxTcHwcqnov9ltqpV+K7qpbkRhT+Pk
         hwDxnJlzHzzmuZYhfCfPKRhWK1eDcNVIb+SK29NpXNGdneED1LDOd9Hm8eaJCTmuA4KO
         LRnI4AE+UXsDM8pdwWgz1ndKaiNLE92trXzn5APiZDaj6Tx8eLaDPAIfEvVyLykD4zwt
         SUFjBWFmz9A2pfmQbkrisiV2Y0zNkk7/veYPPzTcuOcyxSXCsM6pEjknHKUt7455KoeI
         hjYpjs39OHJjWzjPbqLCWwRILKsaq7ApTMJ0AX9kTdHnUU3nDf965baJalVXr8NHsbdO
         1bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758889425; x=1759494225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA8ToaN2ec5XOHTlGwPSdrVYzEewX+q+dK/4ilZO5fw=;
        b=J11p5/CDh67n2z6orj/18djuJrwxB6bitmkb1G0Mgsr9VgVSS6WJ1mRn+nmWkN9Uos
         6jnB1lCFG54pk9/28Wb2uq8YNWYr3l7of1r7ceGUB4wJ8E3+eHX3AwbU3LTri6iPcm7W
         yhRWR0bNszCfad0hjY2r/o6RZz0s/GzlUS8gwq6zmEb50zoMItRpmADufL7x11MyTPuS
         xJxyEq+PFsSqKDa6jjiCZZ1OHIxKMUJkB2UuG/b4hIOoLSGZiBvJQQhzZn33xKvyPnr4
         eOoCb/q7LQFJihmVdF5O6AIzYORc4E9WPaZOaS0AkIAm8KNUdrF2vmc5zNx0zdDZ8fvF
         clkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/MhAkiaeZOdgli4g0+nTTqvtztIAdBA1+99OaWebnXHR3WRVtkl53zS+9JaCDiwPQOvqxl+KD4+M2nTWYszUX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ET9H6lWP/+4GwWH9HZVOvx7SHQrTroqatPYTOL9rilIRS2T6
	WA2TSck86ypB1erU6oAWqwsbvg71irWZW1r7GgHJidoTlF0QZhqGF+t8x1HX3HVvNXmZ6PjW1Nv
	9OVXPLP1vhcaBKHMye6vXUHPDKVnCcW/BqHLWzdTo3Q==
X-Gm-Gg: ASbGncu822/Y0CSP2p13JU0pzX/ljcKLkNTl2/jGxoxL+h870IC5ZJYITag1yjuJTsG
	ifUNo9/TQkPWvm4gPl/0moAHx3knwTYWzxyidMMfSvxKBVmovrGB8NRAR4mYA0oGzObGo5MN7HM
	xvHaDZxiWU/tE9FNUoBpb3mp9AhQPIxvf5HK9R8qdLu52SsZfBy13tH5sasrKXIqjZ8i0xg7F87
	0R9/44e
X-Google-Smtp-Source: AGHT+IFJfK2kUvEQyP3qdusE32Bwrz6NChuV5uHdpq7CNKn6u5E7zONMkQB12h0of7GT99uFXskvFX7pQWW6Gu7R1Rg=
X-Received: by 2002:a05:690c:6087:b0:734:e6d4:acce with SMTP id
 00721157ae682-763f9e75c51mr63338287b3.3.1758889425304; Fri, 26 Sep 2025
 05:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com> <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Sep 2025 14:23:09 +0200
X-Gm-Features: AS18NWAxOQyvszuo2I51LVHpZP8o6Fd_G7IyAwpQbmXUa2S83iiTdpG_DODSHHM
Message-ID: <CAPDyKFr4t7KjV+bSB2_4wRM0tsSNB7fosoJHAN+yDgc1g=7FgA@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_052346_608892_5BCFBE86 
X-CRM114-Status: GOOD (  44.13  )
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

On Fri, 26 Sept 2025 at 08:57, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> Hi Saravana,
>
> On Fri, 26 Sept 2025 at 00:41, Saravana Kannan <saravanak@google.com> wro=
te:
> > On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wr=
ote:
> > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > >
> > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e602000=
0.watchdog
> > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pend=
ing
> > > > > due to e6020000.watchdog
> > > > >
> > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > clock-controller for PM_CLK handling.
> > >
> > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > these bogus pending states, and no PM Domain is powered off.
> >
> > Can you explain why you call these as bogus? Sorry if you already
> > explained it. But the reason I'm asking is to see if you can set a
> > flag for the watchdog device so fw_devlink will completely ignore it.
>
> "bogus" refers to "1." below.
>
> Furthermore, devices that are located in an alway-on domain should
> not block the sync state.
>
> > It looks like there's a driver for this watchdog node? Why is it not
> > probing then?
>
> Because this particular revision of the SoC has a hardware bug that
> prevents the watchdog timer from rebooting the system, and the driver
> detects that.
>
> Anyway, if the driver is not available, unused power domains should
> still be powered down, like before.
>
> > > If I remove the "sync_state =3D false" above, genpd_provider_sync_sta=
te()
> > > considers all domains, and does power down all unused domains (even
> > > multiple times, as expected).
> > >
> > > Upon closer look, all "pending due to" messages I see claim that the
> > > first (index 0) PM Domain is pending on some devices, while all of
> > > these devices are part of a different domain (usually the always-on
> > > domain, which is always the last (32 or 64) on R-Car).
> > >
> > > So I think there are two issues:
> > >   1. Devices are not attributed to the correct PM Domain using
> > >      fw_devlink sync_state,
> >
> > Is it a fw_devlink issue? Or is this a multi-domain controller?
>
> This is a multi-domain controller.
>
> > >   2. One PM Domain of a multi-domain controller being blocked should
> > >      not block all other domains handled by the same controller.
> >
> > This is going to take a while to sort out. But the current behavior is
> > the safest. How grumpy will you be if we don't fix this :)
>
> Depending on your definition of "safe".  Keeping all power domains on
> increases power consumption and heat generation, and may cause e.g. CPU
> frequency throttling to kick in, slowing down operation of the system.

FYI, I agree that we need to address these problems, in one way or the
other. I am trying to summarize them and have also proposed a CFP for
LPC (power/thermal MC) to discuss and try to solve them.

Now, as I also proposed in the other thread [1] just now. How about
changing the default behaviour from FW_DEVLINK_SYNC_STATE_STRICT to
FW_DEVLINK_SYNC_STATE_TIMEOUT? I think that would solve a lot of
problems for us, as it would provide a more similar behaviour to what
we had in genpd originally, hence it would be a smoother transition.

I think this would be true when trying to add ->sync_state() support
for other subsystems too, like clocks and regulators.

In the end, when platforms are ready to move to the "strict" mode,
they can do that via the command-line parameter, for example.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20250925115924.188257-1-ulf.hansson@linaro.org/

