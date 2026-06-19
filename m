Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E024CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbcGH9ITMmOI3YSas2gsikCqBTKnvtgdWwDyBNbyusg=; b=wpjRsNXKDk1Bd5SVFzm8vL7SAh
	lilVvTwXL/StVkhNMHDGexiRnPKaNM5bwfsgPf3uu8vR9Ez6jdKafiCFHtnpFGsbrOG/Y/Cj0eBbV
	gAZ+EgWfIQSbWF8k2yqYrQeChyAfFTFitAkcka4qwHcs1qk44s+f+ndBq27pjZszDJTTimdWhbos/
	TDUOm2Z3FZDG1lWCvtkmC2ZUIcjvGotM0E4d8y7aPmdIcuv088d6t5XG+9wF62EoPw0s1pABaTlp6
	AnrA7CiMMHklHNANbDgbcaQQ8WjOfgbAjpmLs1AiRt0Xxz3KC7jLCr1EIZQrn+hw611/LfxbYJgne
	VsSHAVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waa5L-00000002ZMi-2V9V;
	Fri, 19 Jun 2026 14:20:43 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waa5J-00000002ZLy-2rsV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:20:42 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-519defad0d9so13125011cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781878840; x=1782483640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbcGH9ITMmOI3YSas2gsikCqBTKnvtgdWwDyBNbyusg=;
        b=F9TQyuJOLI01hE1MVO3wbBsIdCx6fkXi0TplQKymOqIdHRblfr9lSViRXLckQoP6Hv
         rFbv8y5mxBi/agAHapds4Osl5oIapjNSQ2RMglKXLpQBBFh0qH2RMPYiUeAE9lh0p3SI
         cxjGO/RB+GwMMB4fFk72BJfrpeGRGUB5OUGNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878840; x=1782483640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbcGH9ITMmOI3YSas2gsikCqBTKnvtgdWwDyBNbyusg=;
        b=G9eDZVW5hxvSkWeAexIasZI0jqM2G/6PfgDcLrdPHrjDq+f3Ic2eG++FE3zNAKALzV
         VZalF+ALEJVUWbbVI6F7SCexawq7dBwQtidV+3Saz1WVDstkNKEi/VmrK6jxCwVng2lD
         cyvfcrq0z+Vdgq++qLlkbiPgsbjCCbFIjCuCXzr1pDlE2NHgzZnautpCCFRrMnnpnQa1
         WVpJWecOI45W8CRkFXoeYf0nMYAGGXWYe+bi2Pjx4CR0JS889Oc9HNdx7jS2N4Kxs/MR
         zXNBsxwPGwGgTKLwDZyBgpedQYFOc5bXcTm0EppmxTx9Y3jd97+0WZVLIh9rKI2k/10v
         fmeg==
X-Forwarded-Encrypted: i=1; AFNElJ/nuZnljJVF2Z8EtHd3C14Az1EJS+2NH/i4/mwCZe4zJJN4LJ1/sHcJFZegK1pqjSEqs4rW1UIDKu1r7pjZT3gw@lists.infradead.org
X-Gm-Message-State: AOJu0YyMh/O4m/g0dAqB1UhOvKT+OCwKUKWFAsnbmV/2wTubwDDJ6yon
	M0efsnmg/mv5Si8ePXkVMXKhIM9Wn1Fg8CM+7hCo9fpKTcwobimzYKTCHd4k/zsQ+O93qOuEKip
	vqQ049A==
X-Gm-Gg: AfdE7clC8NDjdik93tgc97f5SxHVI5LpRGpeNBo5j+154kGBLXxMxRwDHgJT73opp7p
	osGpAZ88Hykvs2NtwryMedu5NRNjmXzNeEhO8tGqFgXzxIx0Bqy5MzMcFBMpOBdMIzm1/bOp/wX
	rP0yobAIRrPk/rjkZQWOWLqG9KsAeiC5Ptz9S+f60Wx0dPcMO+a4A8/cC8w6b3klxe2EoSnvxdc
	No2PAenDCUsWhkARRif3McBSpks6fKuBrqDtwJ8p+RyNPjibJIGPFg50b/07r9M/lEnlmxuKaco
	6+/fPd2FxA2YGdnWnABhahc4MHP1tAjOlLnDHkpOP/hQ46i3XrU39h02qa0IkE6+0yGW2T5jnzY
	RweHLrqE1KhyGcIjWouJVacTw1qXoPN/F8wXYcKaCAHw3p9yNpd8U+DkXsxVdTivzrSZAK1DOu2
	N8C9r+P0SP2t0QXqdDr02IOYyHjAX9LdQz6WWbAvq2ZAv3SsRSr5M/z/nq810jnA==
X-Received: by 2002:a05:622a:3d0:b0:519:8953:ddc9 with SMTP id d75a77b69052e-519e4917301mr51957061cf.6.1781878840379;
        Fri, 19 Jun 2026 07:20:40 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-519e6127858sm20461181cf.27.2026.06.19.07.20.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:20:39 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-519ed52bcc6so186231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:20:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/G0qTibmt/ViWP7SEZHWy/B4oFdkVuhOzi7O32tmWFWR4rsZ3u6IQg+CImMveU514I0BwQaJQNZhp5dM9gi+68@lists.infradead.org
X-Received: by 2002:ac8:7d8e:0:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-519e8d1f14dmr7406931cf.17.1781878838041; Fri, 19 Jun 2026
 07:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
 <CAGp9LzpBUReZtrTEKgUr-+yvB+3tcs5hw7ziC4WaMRFNa2AYpg@mail.gmail.com> <87tsqyirsn.wl-tiwai@suse.de>
In-Reply-To: <87tsqyirsn.wl-tiwai@suse.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 19 Jun 2026 23:20:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BtO7vL_A2i84CoF1Dk7Bmp_DZQJgoNAB-HyGA89=XDUQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfvj7Tldb-rRHpdw6zA1vefldpMM6jJzOD0R18t-VmMpCoygqlJxAYuFRA
Message-ID: <CAAFQd5BtO7vL_A2i84CoF1Dk7Bmp_DZQJgoNAB-HyGA89=XDUQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
To: Takashi Iwai <tiwai@suse.de>
Cc: Sean Wang <sean.wang@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_072041_747711_BEF166FC 
X-CRM114-Status: GOOD (  33.34  )
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

[Resending without HTML... Damn Gmail]

On Fri, Jun 19, 2026 at 10:27=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Wed, 10 Jun 2026 08:52:31 +0200,
> Sean Wang wrote:
> >
> > Hi,
> >
> > On Tue, Jun 9, 2026 at 7:19=E2=80=AFAM Sergey Senozhatsky
> > <senozhatsky@chromium.org> wrote:
> > >
> > > Every once in a while we see a hung btmtksdio_flush() task:
> > >
> > >  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
> > >  __cancel_work_timer+0x3f4/0x460
> > >  cancel_work_sync+0x1c/0x2c
> > >  btmtksdio_flush+0x2c/0x40
> > >  hci_dev_open_sync+0x10c4/0x2190
> > >  [..]
> > >
> > > It all boils down to incorrect time_is_before_jiffies() usage in
> > > btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
> > > to be terminated if running for longer than 5*HZ.  However the
> > > timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
> > > evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
> > > timeout has occurred.  Using OR with time_is_before_jiffies(txrx_time=
out)
> > > means that:
> > > - before the 5-second timeout: the condition is `int_status || false`=
,
> > >   so it loops as long as there are pending interrupts.
> > > - after the 5-second timeout: the condition becomes `int_status || tr=
ue`,
> > >   which is always true.
> > >
> > > When the loop becomes infinite btmtksdio_txrx_work() loop never
> > > terminates and never releases the SDIO host.
> > >
> > > Fix loop termination condition to actually enforce a 5*HZ timeout.
> > >
> > > Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service t=
o work")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > ---
> > >  drivers/bluetooth/btmtksdio.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtks=
dio.c
> > > index 5b0fab7b89b5..c6f80c419e90 100644
> > > --- a/drivers/bluetooth/btmtksdio.c
> > > +++ b/drivers/bluetooth/btmtksdio.c
> > > @@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struc=
t *work)
> > >                         if (btmtksdio_rx_packet(bdev, rx_size) < 0)
> > >                                 bdev->hdev->stat.err_rx++;
> > >                 }
> > > -       } while (int_status || time_is_before_jiffies(txrx_timeout));
> > > +       } while (int_status && time_is_after_jiffies(txrx_timeout));
> >
> > yes, loop continues only while there is interrupt work and the timeout
> > deadline is still in the future
>
> I stumbled on this while backporting to distro kernels, and I wonder
> whether this change is correct.
>
> IIUC, this essentially makes the loop exiting right after the first
> cycle; the patch changed from time_is_before_jiffies() to *_after_*(),
> not only the logical OR to AND, and *_after_*() returns false, so the
> whole condition becomes false, too.

The intention is for the loop to keep running as long as there is
still an interrupt left to handle (int_status !=3D 0) and the timeout
has not elapsed (jiffies < txrx_timeout).

Note that time_is_after_jiffies(x) returns true if x > jiffies (or jiffies =
< x):

/**
 * time_is_after_jiffies - return true if a is after jiffies
 * @a: time (unsigned long) to compare to jiffies
 *
 * Return: %true is time a is after jiffies, otherwise %false.
 */
#define time_is_after_jiffies(a) time_before(jiffies, a)

Or am I missing something?

Best,
Tomasz

