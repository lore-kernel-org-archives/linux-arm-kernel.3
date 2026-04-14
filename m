Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE58F531EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=; b=vDz7Mmo4KfQeCnZjq0B1xeTrtH
	aNIhGRV13cxBjOoB5LJP2RmHBJgsC6zlurjYChX+wVNKe+atWmVg+L1hIVMoJ4KxGQxrtMwow8cEN
	wDTBKmPgTkU0c7IElpJGALTU+bVLV651Hm6CG2d8Z2qQv/b+3AuDEcqFrEYMq+3AZ80xmoGMKVKsj
	ZsqhjFl7cWUakHjL2LEaJtKbplIy/RvLuoMD0g+C6P0RKCrFlUfFW2K49q3Bw7sGvsUHxq4g4+YzM
	3ivctYiN+5jA8YwX5qjxivULWJih1veVMlUhI6TWYJRgtZd3grl1Xle+JFUsU2FbNtChzF3eXNLAx
	mtm1Ol+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXMl-0000000GqnS-3a1z;
	Tue, 14 Apr 2026 06:35:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXMj-0000000Gqn3-3ZMy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 06:35:19 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38df1889fb9so55629881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 23:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776148515; cv=none;
        d=google.com; s=arc-20240605;
        b=QO5brQ2HuXjly3JyAbuVLjd76MdXO6SB3JrvSWquOvOUpcF0O18BNVIiBnmnn+FhQb
         0e8c/VHrrQpa6b2+TptEz0ppDW4lXYWjeEQ0cOSS0mDCsGGo5rvHdtJN19BvszMw2oN4
         4Ir8hmkPm5m1kK8F0zcGMutP4RwDYHx39AEgum6fDJ+n8cavKKcaNKGKljYe2v/SQr41
         9EaedB6b9hvIq+d/mld6iGZP6ueAvSJiOvN3cnV7t0j/q+NbdIXN8HdkN796YH+uDahT
         7Y54S8ZCWM2oosOBIUGkNLNQdZWcKtQJHyf/YG/xuA1TRt/COBBgZ5/FpoHUiziSs/aL
         kIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
        fh=DVi36u4U08wVB4OlLisMuFSmeNXlUMsWOxBhQe7jbio=;
        b=bvucjHCrlqndwQngGEkiAzPEnaiRdqWxQaA+COA5MYzvTdMGRwZ1AV+tWX0FQG+exb
         OhcFAV8n8Je02kQDVihKnlAYPg4dX6Gxh7EMyfBjMjrLmBrS0FEot3XIw1GLioKcDcoI
         hgqaC3ariiFg6gsZBEUjP1srRiU5GxKOSbqRSr//FfXx6oDrbo2ekFvKsE6h7LaQ6bdG
         JS5IPJPtkWkwf0kz0HSpn/VPHcweGgVNjUcObudQKQEY5199TOg6B66+riCRz+qc/4D9
         wbF76d1Er95n6NO4X5fx+pbaBxJcZ/KAydLP4jG4hJAPXxYvc9xP1A5TTxdMvTfcVvpM
         iMLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems-com.20251104.gappssmtp.com; s=20251104; t=1776148515; x=1776753315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
        b=tHz8gFCTK0FiQrxouHsRuV2OP1NcN5EFoL1O5NcpSFnuz6JBoxiY3eBA/+3h2U87qu
         y30gQhrPuJCqCmDWfq94dO9Kam751StAObJhKWkUBKTcH6zdCnidwqqPsTEjjclAmJVa
         gwJtB9th3TxcmMGpOqpPkKBrFm0mG3+j3Po4+BtFs8jYDayKnEv9g13HXP8QnVOv/HaV
         hNJxjMqtxod6G9F/b2JPSUIt+WBC/oveBWfiCkqIAvClotR4IwQkRGKY4o7Km5bOGN6V
         dQVVZ0wnUO8eQCSklw8/BYeS1/YGXsn8ie+/UNHEkrHXPm7+BmOkYHBM9hnhvN97uHEf
         k2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148515; x=1776753315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7O5b4cGVPKsvcNPmXRaJvLz/LMUgaIpEgEY1d8OANag=;
        b=UFwCgprfGBdz91vGj3Y0Lr12e5VPH4f4nnTxdCJVtG0s3KINr1zDHWBhpCfTIW08+4
         whGR1z3zIxDQq6MGAQC8qzPV/E7En60Oqix3vjNj9K1Xt0CEZ/QxZhi9+bug1JO3W6O1
         wNDrnCPMTjJlAJ8CvyXg5fO/YS7vg1ZtqWgwXSfOKKny4gvgUF2vGZ18j09/oeFZhjGy
         OWsCOOLz9o9QsTW3kHWQecrMaOqh1Q9Y9ZlQkmj5vcH92RKtGcq4fcqKwb7EKeJEMOKV
         QLm839pqx4M3O6osL/wbkjB/QrnHrGG/NqswdgKqTL7ecUcdmlbx/dWBlRhSN/sIB+jc
         vmZw==
X-Forwarded-Encrypted: i=1; AFNElJ+JzV+H5IEM4ifz7rIlRr0i/PmNqVjKjmnFhMaOpO3PqffVfeWtGQPSi+oltnnSAflAIbBkb/k9VPwVg2u/K6C1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Rwii7UzHAnB6/ubkeyl0Vr45ZuBxoBgrCC47ch5IXuI41vyf
	hjcMiGodIbrAkwHI2+X61HJZb56N2kxr16IiXbmL1rj+uowl6w7Tz94e8gtZfb7GnVhrmk/3iM8
	J2J2wvkWM4NFzYnje5vgWNMgtPcdNZkv4ybH7HwOtyg==
X-Gm-Gg: AeBDieuSfZwLq86BfhJ4yzWTJ0KrcB8Ze4e/SF3Wa+bAYy/WR50tMUp6eOlSt+9GBGO
	je8tuzlpmPbTvvJX2scmskk2h8l9ja07rUlf7UNQhGYBh+IHUg96JnvPcXnwRFbZ0genREHnPGs
	GSBI7s2fzyPLndufJSjdn4hfBqFJkE80x8BsDprbKSD4uQ8y2OI0o+p9MP6ndVChwvZMr0rPxD4
	LUptSccH6CWh/EWyCxvANF1uVWu8nOi/XsBgOskiCy/xO7lgpWJKOBDMAFJ6kyP8PBmB3bV8y4g
	CAoHMliIuqhUzGgf41Nwy6L2SPVrnfdG3RlINcxE
X-Received: by 2002:a2e:8a88:0:b0:38e:7b10:fdca with SMTP id
 38308e7fff4ca-38e7b11028amr23413361fa.18.1776148515199; Mon, 13 Apr 2026
 23:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260413114456.173485-1-advaitd@mechasystems.com> <99fdddde59e1b0fe13d5014182b1c97de4fbec86.camel@pengutronix.de>
In-Reply-To: <99fdddde59e1b0fe13d5014182b1c97de4fbec86.camel@pengutronix.de>
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Tue, 14 Apr 2026 12:05:02 +0530
X-Gm-Features: AQROBzASMMowUHpiQY8V3AZzIF8UFIDuQygsDzeqZIIv6U3TInzAp3bBuMtO9xM
Message-ID: <CAAPs2HRQ12Y18y1JGRE+8htegjUiKN9S5JP14rkAye=pdoxt-A@mail.gmail.com>
Subject: Re: [PATCH] drm: mxsfb: lcdif: enforce 64-byte pitch alignment for scanout
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: marex@denx.de, simona@ffwll.ch, imx@lists.linux.dev, festevam@gmail.com, 
	kernel@pengutronix.de, dri-devel@lists.freedesktop.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, 
	linux-kernel@vger.kernel.org, mripard@kernel.org, stefan@agner.ch, 
	tzimmermann@suse.de, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_233518_186646_43177133 
X-CRM114-Status: GOOD (  19.80  )
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

Hello Philipp,

> I wonder if setting 4320 bytes stride works if you reduce the burst
> size, for example by reverting commit 2215cb3be5c2 ("drm: lcdif: change
> burst size to 256B") to test.

Unfortunately, reverting the commit doesn't seem to fix the issue.
I tested with the reduced/default burst size as well as explicitly
setting it to 128 bytes, but a pitch of 4320 bytes still results in a
corrupted output(stretched and choppy display).

However, using a 64 byte aligned pitch works in all cases without having
to alter the burst size.

Best regards,
Advait

On Mon, Apr 13, 2026 at 7:16=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Hi,
>
> On Mo, 2026-04-13 at 17:14 +0530, Advait Dhamorikar wrote:
> > The LCDIF controller expects framebuffer pitch to be aligned to a
> > 64 byte boundary for reliable scanout.
> >
> > While byte-granular pitches are
> > supported by the interface, the i.MX8MP reference manual
> > recommends 64-byte alignment for optimal operation.
> >
> > Corrupted output was observed with XR24 framebuffers where a pitch of
> > 4320 bytes caused visible corruption and choppy display, while an align=
ed
> > pitch of 4352 bytes worked correctly.
>
> This happens to be divisible by 256, which is is the burst size
> currently set in the undocumented CTRLDESCL0_3 register fields,
> according to the comment in lcdif_set_mode().
>
> I wonder if setting 4320 bytes stride works if you reduce the burst
> size, for example by reverting commit 2215cb3be5c2 ("drm: lcdif: change
> burst size to 256B") to test.
>
> If that is the case, it might be better to allow unaligned pitches but
> configure the burst size depending on pitch alignment.
>
> regards
> Philipp

