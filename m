Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF2FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 23:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=; b=3pTnxvY2oTQyiNYL8gtQHABxH2
	yK5IkUm6d+7KScMSM2K8uc9naTn8FMYic+Q6SAC/IlBDd00kOnGCd/yn638ZYYsc4W5rFXK355PmO
	ln0i6I/BJDebbAaQUdd17WSgBtH8yDi6HimKlkotrbVtnybGdiu7mXwVljKbgyVkYJZZ8o5SiiEB0
	NlZcmkhNAaXWCovcyP6YRsIrlpz2jo1voSxJ1RlBNv04yTVIhaq06omxl+5dT09YhlBL52GS79oPR
	azm6d+0jJt8eBO8WxG65HWripPBkz4r0YcLoBpA3h8QKu698qcBE6pFsGZqCDfF5EVEZu6WAJ2eog
	eN4/85lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn392-0000000FGty-0Cc4;
	Thu, 23 Jul 2026 23:48:04 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn38z-0000000FGtD-461P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 23:48:03 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-660a40aac63so223458d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 16:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784850480; cv=none;
        d=google.com; s=arc-20260327;
        b=XU+AuCd8wJhOycGM0ndGkYq3peyfUWMBIo36qEBSuxU6nlMZlPerzkAp77Hfl2AKl6
         yJNiGWrJQ6AqtXI1W3bsWQoMom2kK+XyBtKdOTooB5d4hrV1qKFQF1+FM2h+wvCiMOCU
         Hmf1VcjN375X19H/w/XLY013C87xcR2cyjCa7wiie1DDwCJ2i/wOk9xmH1xfXcL0n7ou
         2ed7nK2so+WABX+BCNR8gZEuVQgdwqVJR2Pf7Kvl7oH7m75qqlx46NqkKXdOB8A8LYL8
         35WlwPCenbft2AXgkACBmtCaIE/E/E/LuB5NxWFlKyCVPneyqO7/DZwRteLTAjschtTd
         L/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=;
        fh=X3Y2enI0vT7CzonsirZH4fe+R2aQKEKXq7LPEjX3VoI=;
        b=LvbwbZnkQ8tK5edTIQabQl3PMsUgfW3E7+2MCTYq58JNpmFuHd4AmFh0beFC6oHneo
         ywl/XJLioaQmIiySqVTQDv+tV8KhKAWv/+GBoJYxdStS/WzcRXkLbJ3XH5yGbmrmT+Kj
         IJ7HcdPMaJuE4gmSjMcKx3LxQqgfJ8SXqMbCYYBOFIM9AqtQFoiyWGmQnYRJi3VpIoXb
         ZlxJN8KMP0EA7GT9CQmLfJT2S8xSms9rVRCqNDsqTeVBx92l01QoH0qYBDfn0dEVmhYj
         oxhp5Er/KnEPMLctou9dZUPr0RO/P+vJV1YnqipAqQPZ9zQ8wHcRFRxgwlKcNMyr25IX
         kDNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784850480; x=1785455280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=;
        b=c00vXz41+Sbfb3rGG84X2N2UI7l7WNYhVwKCz5xv6LaIaftkIkMTFNbi3Bh3sPdUOm
         WAQiQLJ6qkqha3KDnnnTpx3TMVkQuSMwje9JO2SgLZYEvsj+ajLrFsed7Nu3n22Bdvd7
         RE40tMQmge7tTtZnaBEnOZeOfWzMiGXlRlsuSI/+x0FJ682jQUaSWI2BHZb3OuSjezId
         eCA3XIRk+iLQI6eQTGVvImAkNFfGmEEWsmYyVDeOaaEwegyZm3J4z3vZzx+lw1EuzZI+
         TOtIhIhBoQlPgQFNYhr1ebwm8JWJxYJomlvG/u8G9DUBha+Oh8elaYbWDaY+6fIsD0AX
         C5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784850480; x=1785455280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=;
        b=ZuuMtjkZIIJd59wC8mT4P7Q5tiiJYXo5Nk3dOy4AFpiJhj2u7FRwFJJXgfgRTzoYNe
         EgctEyMU/7uGiRdM9L6VQIaRSlEhyPxdSvN+7SE7ZdqFXMqYLdpuXaSl2/Kh2CIZQOxR
         qSWy5ZSna1p8DiTXC+jr1+B4XdPchXhtQtuxOdmYyM0jG2WS/7a+YTCJWr7LQ4mGq6jj
         6w22uq1ObWyZasVjPvNz3foq4gY69B3T0cUjG3iRy4NoW4wc8K6F8mJ/YQ+HzPspUqKY
         l+wbvayvekfhPg/k0j6hvgPZbA2uYZPBwDL3ppJSQ2fLTERje3hlAytrcvFRwijihJaR
         hojg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb3Ool9StH+MRr9v7odj+nsdNaBIbrWde5Gq6pPbeCnGsl/yOuBfZBYj1XSHdfXjQldXMcPco7b+btVi+fovhz@lists.infradead.org
X-Gm-Message-State: AOJu0YzXocXmFlZidX4bFZAA5pnPqNaVv3vo/S20N1qG2E/hUJbcW3/c
	ISEtol7YNfyQCuCFKqxKgkKACPmCwovTxmuR2joeSMIjhjP4EJK6qlvAEi9JQHRaB+lJZUiUqRK
	3Pfeazc2giXJYvaK+snKoI79q/3/vAas=
X-Gm-Gg: AR+sD10lY0AfXcDf/Kwgcn5+jxmSYScNCY94WdruirqWsGmOpEWJ70j5OuEFSjQCIvy
	61JIN0t4EhFDw6Yxyly/ms4SBC44MdlAcuPexA0HkMpCsi0WwcQxHEl6d3CMEf/aIVxJlGY/SYb
	vpyGIbnLY5DDrjH9bpz80/SiPOC+VJSVviS1BlsjsPyVhymTsvLrfSDwDppssBhiULWCwlq0kz+
	HFNUGbjE2xNLieQPH1I7OdYR6PiI1UQBAR9jtokJE45tPFOOA+385fnY0Nq9qD2U3g/zDDVPdmq
	YzZXu76Kyn01/GuWnQw0
X-Received: by 2002:a05:690c:6609:b0:7ec:58dc:f23 with SMTP id
 00721157ae682-81f5856ba5bmr8261157b3.5.1784850480115; Thu, 23 Jul 2026
 16:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com> <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
 <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com>
In-Reply-To: <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Fri, 24 Jul 2026 01:47:48 +0200
X-Gm-Features: AUfX_mwQpQY6ms6Ddg9sVvPaEi1tUNBsASXfULkmbLix8kQzlJ5kEVuWDGHKcXY
Message-ID: <CAEWPSH4aB4KZsrLx2TESjPvUG0+A_Z_7uuO=5Rd-VidKU9U3eg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_164802_070390_81EC5F99 
X-CRM114-Status: GOOD (  39.95  )
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

Hi Dmitry,

Thank you -- and thank you for reviewing the whole series and testing
2/4. It went through a lot of back-and-forth since the RFC, so having
it land with your Tested-by means a lot.

I'll prepare the follow-ups as separate patches once this series is in:

- The video_device lifetime issue on the V4L2 side (the devm-allocated
  struct with video_device_release_empty that the automated review
  flagged) -- as a standalone fix for the existing driver, since it's
  independent of the audio support.
- An atomicity fix for the GLOBAL_SWENABLE read-modify-write, now that
  the audio path adds a second writer to that register alongside the
  CEC code.

The repeated-suspend wedge I mentioned in the cover letter I'd rather
send only once I have a clean, reproducible trigger for it -- it's
still under investigation and I don't want to send a fix ahead of a
solid repro.

The dynamic codec registration you suggested (bind on the plug event,
read the actual wire sample rate and restrict the codec's rate) is the
direction I'd like to explore after these, once I've looked at what it
needs from hdmi_codec_ops.

Thanks again,
Igor


On Thu, Jul 23, 2026 at 10:56=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/21/26 08:31, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> >> Re-arming will be best option if it works properly.
> >
> > Went back to it and made it work properly -- with one honest caveat
> > at the end.
> >
> > Plain cancel/re-arm could not have been enough as previously
> > written: hdmirx_resume() fully resets the controller via
> > reset_control_bulk_assert/deassert in hdmirx_enable(), wiping the
> > audio configuration (I2S_EN, AUDIO_ENABLE, FIFO thresholds), and
> > the worker's error path never re-programs those -- it only resyncs
> > the clock rate and reinits the FIFO. So v4 does:
> >
> > - suspend: cancel_delayed_work_sync() on the audio worker before
> > the clocks are gated (audio_streaming stays set);
> > - resume: if a capture stream is active, re-program the whole
> > audio path (clock from the last known sample rate, FIFO
> > thresholds, I2S_EN, AUDIO_ENABLE) and re-arm the worker.
> >
> > The programming is factored out of hw_params() into a shared
> > hdmirx_audio_setup() helper so resume and hw_params cannot drift.
> > I also checked that nothing in the post-resume hotplug re-init path
> > (plugout/plugin/submodule_init/controller_init) touches the audio
> > bits, so the restore survives the replug dance resume triggers.
> >
> > Measured on the Orange Pi 5 Plus (pm_test=3Ddevices, i.e. full device
> > suspend/resume callbacks, active capture stream with live audio
> > through the whole cycle): on resume the capture simply continues --
> > audio was flowing again the moment the display came back, no
> > userspace intervention, clean dmesg, no oops in any of the ~6
> > cycles exercised tonight.
> >
> > The caveat: a *second* suspend/resume cycle in the same boot leaves
> > the audio datapath silent (the I2S slave sees no bit clock, so
> > capture reads time out) even though the resume restore re-programs
> > everything, and a fresh stream open does not recover it -- only a
> > reboot does. Notably this happens with plain no-stream suspend
> > cycles as well, so it is not caused by (and would not be prevented
> > by) either the re-arm or the -EBUSY approach -- it looks like more
> > controller state lost on repeated reset that neither hw_params nor
> > resume currently covers, likely the same warm-up state machine I
> > described in the v3 testing note (audio needing a video STREAMON
> > after a replug). I am instrumenting the register state next to
> > root-cause it; I'd treat it as a follow-up rather than a v4
> > blocker, but happy to hear if you see it differently -- and curious
> > whether the 5B shows the same second-cycle behavior.
> >
> > v4 follows with the re-arm plus the dts and binding changes already
> > mentioned.
> >
> > One more small thing the audio bit exposes, for a possible
> > follow-up: hdmirx_cec_update_bits() is a non-atomic RMW (the read
> > and the write each take rst_lock separately), and with audio added
> > there are now two writers of GLOBAL_SWENABLE, so a CEC adapter
> > enable racing an audio enable/disable could in theory lose the
> > other side's bit. Mainline today has a single writer, so it is not
> > a bug there. Can send a small patch making it atomic if you think
> > it is worth it.
>
> Feel free to send the follow ups.
>
> --
> Best regards,
> Dmitry

