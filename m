Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FB5CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 05:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=; b=nESbICdCy2ZPSHiaVttP0aO4/h
	k/MiX7cSVcIIgB2NJ10opLNdUpLG/5/cNGdV0Q3VfoEp/HxRrb4K8Z6tk5eeokKNQQm8bev2Do142
	+YqD5kPsN4SViHjanNZ7V5eVLxqXeBKhMoo6oT6prZCXpHR1yijjjGue1CSQ3piixvO46OFLC0Dgl
	eqiDpbc71DkszmRZCukv9vAlpAr+xxNkrBtqMhlee8am9SXfL2itP9dMO3XKfX14a2zaUMUZJEHeg
	6r9hKW2mqNBCJ1cdqRV+eqoA4l6Te7KzQmMqcLsg2F3tj/ppV8MgYzHovncwT1HPZvHaJnRMp2EzR
	j6LeWmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXuj3-0000000ANk3-2cXX;
	Fri, 12 Jun 2026 05:46:41 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXuj1-0000000ANjK-0hUP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 05:46:40 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7f015f87fddso7080117b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 22:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781243197; cv=none;
        d=google.com; s=arc-20240605;
        b=E5b7/jnOrjJkufrfRkDpkQCZWmJU4En+eGcloHTIsK4YytvcpWLpVSv5i9NcYIlb6X
         umAwH5bALRoCEGMhgJLT29J3uwCVGQVKcDcFtgZrOlS5yI51TIoi+If78AeY+NcE1RiE
         uKM6UaUDHWorLJYjux4r9CeXKBYhyC1EhQUj9SRzImhy1kBE/sFpu6qgEkDlRGpvBZHQ
         /ydi1uOB3Vocg4OjcPMbuU5uzDdXKbrwt5Nqob8gkC0bK0+7/dpevITR4J8bYVA380kF
         8Giy7DPFRERbMiVExFIzqdB1nidqQXsPKoqGIPdUi0PPmt9Qvp1If2xxbhQQRtH3B4+G
         RpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        fh=+zoto8HwMe4PvRjoER6Cas2dNp3SGqtW+2ZWDZSocuY=;
        b=djBxKz9G0+/qAhmXWxTqa8VoATquiwWm1pT8taDOC5rAwSdoWehnZ5Q8H3kZ5edWrE
         tAk4sPn07G2+QiWoRZfk0aO4ALAkoP9O/C7eombM8VIIym46xZsNZFfRE7DPIOH5WLz2
         XaiJJCLTX/uWA6atj2fLMkIbMdBO+QHMMvb8YYKX99j1WIIembfRhqyxIYKMfDacGP+O
         im22+JvyZY1QkK1OYwdbbCBe2CCyk4qZxW6Iky60r04E6o6XJxyxqo0HDEroYOSdZLUQ
         +9PCBhU1iEzjhY4rQiTMMO1gnVnmeLT0dP01bjMF9UKbuZ2fPYTF5smbcN1EqXByUw9v
         bxQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781243197; x=1781847997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        b=h4eVGq7T7g2blRW9fRERQY1PoiYgGDm2MreR0SferTFEORQKaeRbt5X+1yiZa7+KNR
         sVeB7U8SHDLfewrTxBqkOQx4lKnhrH2aaB1LShVg+TiqHDFm6DoNfYU1fUGbl37QrwIj
         A1L3MMOZL4gXfja0VuvyKVZ4x+OrD6fVnKmHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243197; x=1781847997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHHVj+Zx0+/vBQAJBv7r1n57GCFzoErkyz4ZsU3+esc=;
        b=Po8E6bPIG2sL6wol1p+EIVPaqovO0EPmO88zNv+BwQaKPii066EvnmtwfqrSIso5lQ
         6eq8HZtPj16v9K+iRjaKZJPKw0kd7oxKXe8iFELKjwnXciB+GQ+8TIW2Ni8UgGep7Tiw
         vlPfOvAwv/21WIp/t1CrVtTuOXK6zuxozmDMiDnkLGVoyOcsRSRuv5AwCcOvDE9TYNOK
         lxxSEJrS2Hy/Q2LGenDFWhb46WIvpn40AZQAzaeFQrHRt0Oz/Tndj+aLHAZudaKpSqsC
         uJe0NylKuQjywZMWNL6BxDlY0ul97hZD3SV/XlPosi4zOB0lJzZVHnIJf9zZvRg9Rae7
         Fl4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8rG5hzZtJPT9zI5HyKGtnHbndvYtK1lLCnXuMz3J8L2vGrsXuyj2XnySP4sjI5eY/GHEMCvxaNfk7TIVHhgOll@lists.infradead.org
X-Gm-Message-State: AOJu0YznvXHvoEfEcBVRt5/bm3Of3Lf1R9nEvWAFxM+eNXbFEd4qfvDR
	GbcewS7BJ+fd5PyfuIZZ8N/nk+eu9QOdFgb2A/jyZm2gQ0I4Ry8E8QKgZiB8qEYkyyFLSBOWkbv
	v/y+dyqg3YipXwzmX5HYCFgOBc5a3qfxrFmcaVSB0
X-Gm-Gg: Acq92OGLfcgUd7lJAEdVTmOSCfhxu41ZPytBnNMAwP26zAEhJGZusYqhPLT5BJ1NH6+
	3jUrevGkAcEzJBBed8HYU3mcPt0jOBju4Y8AZpubhML6HKkbcy6Ywi/F/4y1mufg+YXFZmN8SIE
	ggNst8tPlDmmTjtMKbSya78wNUOLyj0umbJGBAgaYK6NMAXLUz5srMM/RAc8pcHEH5QGPTBAWUn
	g019K9oNs8TJgHlM+IL6umpYSzoBoZLPuKtw89ag2vMeqCzoeR4eqxViOmr9YndqSdbMJi/eVZc
	EaUasNq+
X-Received: by 2002:a05:690c:4441:b0:7cb:93d1:d804 with SMTP id
 00721157ae682-7f7cc52611amr7898237b3.7.1781243197392; Thu, 11 Jun 2026
 22:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local> <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local> <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
 <airY6IMz2KFz_z9j@kuha> <aisEccAOm3qoXjxd@ashevche-desk.local>
In-Reply-To: <aisEccAOm3qoXjxd@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 14:46:26 +0900
X-Gm-Features: AVVi8CcqLILhEQ5p8_o0FiDM5Wwe_hy_cZp3NZb3BqN3lFzIwdQDiPu3OCyJS60
Message-ID: <CAGXv+5Hf_V4=mkAc3pN8_K9i+FfH2Wv7HVJBq71-f8sMFYL3fA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_224639_253491_CDA53C3D 
X-CRM114-Status: GOOD (  36.18  )
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

On Fri, Jun 12, 2026 at 3:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 06:48:56PM +0300, Heikki Krogerus wrote:
> > On Thu, Jun 11, 2026 at 11:35:13AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jun 11, 2026 at 10:37=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote=
:
> > > > > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> > > > > >> When a USB hub port is connected to a connector in a firmware =
node
> > > > > >> graph, the port itself has a node in the graph.
> > > > > >>
> > > > > >> Associate the port's firmware node with the USB port's device,
> > > > > >> usb_port::dev. This is used in later changes for the M.2 slot =
power
> > > > > >> sequencing provider to match against the requesting port.
> > > > > >
> > > > > > Okay, would this affect ACPI-based systems? if so, how?
> > > > > > Can you elaborate on that, please?
> > > > >
> > > > > Is it possible that there's an ACPI device node associated with t=
he port like
> > > > > on some DT systems? I don't think so and there should be no impac=
t IMO but I
> > > > > also don't know enough about ACPI.
> >
> > There are device nodes for the USB ports in ACPI, and I think they get
> > always assigned in drivers/usb/core/usb-acpi.c.
> >
> > > > The API is agnostic. There is a possibility to have software nodes =
associated
> > > > with the port. I think the best is to be sure that ACPI-aware peopl=
e who are
> > > > experts in USB will check this (Heikki?).
> >
> > I can't say what's the impact from this patch - I'm not an expert with
> > this side of USB. Is there a danger that we end up overwriting the
> > ACPI node for the port, or something else?
>
> Exactly this one is my worrying, but I haven't checked the actual flow.

Looking through ACPI code, ACPI_COMPANION_SET() is used, which boils
down to

    set_primary_fwnode(dev, acpi_fwnode_handle(acpi_dev))

This is called through

usb_hub_create_port_device()
  device_register()
    device_add()
      device_platform_notify()
        acpi_device_notify()
          usb_acpi_find_companion()
            usb_acpi_find_companion_for_port()
          acpi_bind_one()
            ACPI_COMPANION_SET()
              set_primary_fwnode()

Looking at device_add_software_node(), all swnodes are secondary.

set_primary_fwnode() seems to be able to make the ACPI handle / fwnode
the primary, keeping any existing fwnode as the secondary. However
if we do end up assigning a primary fwnode to the device using
device_set_node() as in this patch, set_primary_fwnode() is going
to complain loudly.

On another front, the ACPI representation of the USB ports looks nothing
like the OF graphs, at least on my X1 Carbon:

For a usb port device on the root hub such as

  /sys/bus/usb/devices/4-0:1.0/usb4-port1/firmware_node/path

looks like

  \_SB_.PC00.XHCI.RHUB.SS01

while a usb port's firmware node link

  /sys/bus/usb/devices/4-0:1.0/usb4-port1//firmware_node

resolves to

  /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:19/device:1a/devic=
e:29

Neither looks anything like the graph "port" / "endpoint" node names.
So maybe we're in the clear here.

Besides the loud warning from set_primary_fwnode(), the major issue stemmin=
g
from a wrong node is that power management (through ACPI) is likely to fail=
.

If we're still concerned, I think we can skip the assignment if the fwnode
is an ACPI node, i.e. check it with is_acpi_node().


I've never worked on ACPI systems, so this is just me checking the code.


Thanks
ChenYu

