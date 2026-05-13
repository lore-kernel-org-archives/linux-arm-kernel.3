Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43103CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=; b=FGnPShGcigItN6jIshjkOUwhnG
	Ru3uv7/Zc9u0vhUPD+9oGeaUdFoXlBGoIz3hkdyxg9nXsidi6fZboISst8oXwuk6QitvsAKvkgpot
	HfERuclPERxw/lZgBHqX2B4PWWzftpwPcLzOIb/3bTfwEEtYbS3rd3IvBArfcmQ+E0kE+KlgfbiV8
	xQ0P0XYlOhCpfFOTacLzE+6xRr87wsuj9dYuAVH1eN0Fx1uWF19H5gVGs1VLd/JyqKKB32KXf97jT
	BxxLUGe6rOyiiiP98WkiIxV8l9nKrq80SAFyIN4fbsGAcSf5exc4IskVWlf7obIpwvynOHYdmNXZb
	MV5hGmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Wi-00000001q9y-03uu;
	Wed, 13 May 2026 09:05:12 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Wc-00000001q88-1xMv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:05:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a8d648466bso4067745e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778663104; cv=none;
        d=google.com; s=arc-20240605;
        b=NNqGQC7/YPlOTPX9Wluiq+Thf1xATm/UXFWHRmTxc068r15yUdmDqWCEPllscpzgLO
         j4mO1JroXOxa51seoQa8qrbgysfZ/K2+kszAkaLqPZIVQddm+Hv3iqI9aBXFZ9ZjNtqm
         ts8Q/uKkvCOi/LvN332lwxJTBhlVcHukOki/hsthOogk8dTWZEtF59Dl/mWyt0MW/Psa
         bpc24GudtN8cbvQzL5+JAAHg/41oVfFWORjudyulvR3oodfdk4C9vrgeZ+Ie8Vq7RTIo
         CcRQsOjzKfakcbZTpAcrxxbl3aiomZrqgucXzDczbRoS22nOcxnZavf7el0WEUoK5+3A
         QyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=;
        fh=og/NMkBqyZlChvimB3D0rT8IWAFKGEpAjOluNUj2XjY=;
        b=HyjN1KxnScbwKBUmsfq5a7p7Xqy6p26PBC441pZ3lcPuqZKT3gxESbttJsYnndwxW9
         IvxDQ3waREB4EwxWxnI4uIpxiwolTXmWagfzigp4nadmgChRxrEb8df6lTbsOSDVmptS
         MrdWyMWUImhHq2AeviUiw/R14cXcxasfVLvSMER/+s062/WjIzM4Bi96gzXmSY2/t+MM
         /mBJRPwgKZw4Gnp6XwzoTkwxOCTgd6clAPabbKiKtMZ+jBG6Lr1/0/X+dnAYYdmcdhwy
         7QMC6mg8q0IuZ892Yfh3E4btgBLYBal5zEMEU+GfbkCidtmTMIOaQyPJRGxOFRzf9H8B
         9Blg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778663104; x=1779267904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=;
        b=fjgbu6g4797ihORhiwHQhvVa2EkvVPJq79u58gqQ8sQuH5hLxwLO7njrs4agmOrWRV
         /ROusXdBa83phisjNpzqoPd34lg+nQqjgdMSB+PvplAZgJU+JuXfJGFKSd2OiEEgc7CT
         tfHD0Rs46SoWMRKEElOUJrdzGst9IHMmC9H4m/dINkrkGGPNVhYmdnepbuGicJqjUIl3
         ohFoqtd+/nN2e4EEBNFc2rUZAMYBng0PYagaOTvFl98EaIZFhNXrvsetZG2NljmgpKBZ
         jX7bJL6Fo6tp2wbWiPu4QCDIFI7Z6K1lKMy6lLgRNWQGHh4Uf+rAe5jqG8eKEIvNZzev
         4mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663104; x=1779267904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vnSmxQtTUWEiFFU6qH7Iz8bWADJPw/bCswxBgGjsIdY=;
        b=MZC+vE2i7VUtkbkCIVtaqCkxJiObc1Bs+uexvj8aIaYTRnpocZiVxmpMZFWE2Xf+OF
         nZ3bOSXoCN+eRBGKslE1ZWSq5oC1NnOq7LKnmircIBLVlcO81wfPE0ip9E/3wdf7Omv0
         iePqP+zvM/s5OVm37kAGwOKmKJq0/ogCjFSYxF9Acx5WdfmlNxZVSMpO67xoV7bUx/XV
         phpCApkzPJNS+ps9wRzU+F/Isct+UK4mkLAnMrOWlaKYomWAiih5jx6B0o+GZ83TEmzO
         pnxZFCSPeXRAJlubaqme8fR0w8N7RvNHaJ4qhxO1cfMg8Q0ZvIrdK/TsIXVTNK0ftFDZ
         8/yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oHDVXrdcJPsYw5AyUYXSMH5lPS7Q0Q0Cy+Hzriisz4hSLwxQDaNAQgUjm9NvWVhveg+Qk0M2VM0K812YXjRJP@lists.infradead.org
X-Gm-Message-State: AOJu0YypHx9NX1vE/R1tx+X+Jg1g105ioDyd3kzHyRb05poTf9Psir4O
	ryCLahZjDMw+LWB0xVqSQudCkkLBoPuATvJkwUqasda2Qs4r5VJqgqaGDo2YteJ/2ibafdBlEC0
	nw8ydjj+ceQc2c5Or+Lt9ul8U+fy8AsuBaZLZFjB9Mg==
X-Gm-Gg: Acq92OGPz7UZmEYfJob9KS39JFTtcpZMF24dBJrgorZXtQexJ0TT6A/ixRubVzsiwzU
	r2Uai2VQyOPjEiUwAEWqiqlX+gQ/9Z2ppFGDeFVt4/HiwR/a1v8oIBPfea/0c9BBTwCy0uvOlxP
	VwOocFsp/p4SGYhOm/f8w+4C30YFiBZh3irollRBfDIIjR+2VV+/FJQ9B4CgqkPrDRHly0SfKaU
	gfNTVE0rhYepIV6Ob+xyOtMbQkp/ixFgRIq3mIlZ7g5dSbfkZgR8FIjNeYP/46YRNxGG1MbHd7+
	/Len9rdFmzmudIBMy8or7JfcHV+2Csfp9Edebr1Q
X-Received: by 2002:a05:6512:3c8b:b0:5a8:d648:4601 with SMTP id
 2adb3069b0e04-5a8ef99cc5amr878284e87.38.1778663103512; Wed, 13 May 2026
 02:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-3-ulf.hansson@linaro.org> <CACRMN=fseD6-ODYnOEE42S9VKAb2F33kRv_VPYBGyPsitG2how@mail.gmail.com>
 <CAPDyKFq+F=zn_Coicb9LzyMtQ=b2Lrd+3Czx6r4ReY-DNyb9eg@mail.gmail.com> <CACRMN=dZFvbXjZGqTvFdNVyXfyvS6YtWNKQnej9A1jihGJHcqA@mail.gmail.com>
In-Reply-To: <CACRMN=dZFvbXjZGqTvFdNVyXfyvS6YtWNKQnej9A1jihGJHcqA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 May 2026 11:04:25 +0200
X-Gm-Features: AVHnY4IY1Hl3PHqVdEbwrzR1kYI3x6GJYuzpslvlmUfAwZ9a3eA_KZCjdMuftMI
Message-ID: <CAPDyKFpYkzmmx+d2-x0YskO0H2UD2v1LmZLMRqMmDoLSfPk8Xg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Saravana Kannan <saravanak@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_020508_954878_DEBE6A56 
X-CRM114-Status: GOOD (  45.81  )
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

On Wed, 13 May 2026 at 07:01, Saravana Kannan <saravanak@kernel.org> wrote:
>
> On Mon, May 11, 2026 at 2:43=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Mon, 11 May 2026 at 07:09, Saravana Kannan <saravanak@kernel.org> wr=
ote:
> > >
> > > On Fri, May 8, 2026 at 5:39=E2=80=AFAM Ulf Hansson <ulf.hansson@linar=
o.org> wrote:
> > > >
> > > > The common sync_state support isn't fine grained enough for some ty=
pes of
> > > > suppliers, like power domains for example. Especially when a suppli=
er
> > > > provides multiple independent power domains, each with their own se=
t of
> > > > consumers. In these cases we need to wait for all consumers for all=
 the
> > > > provided power domains before invoking the supplier's ->sync_state(=
).
> > > >
> > > > To allow a more fine grained sync_state support to be implemented o=
n per
> > > > supplier's driver basis, let's add a new optional callback. As soon=
 as
> > > > there is an update worth to consider in regards to managing sync_st=
ate for
> > > > a supplier device, __device_links_queue_sync_state() queues the dev=
ice in a
> > > > list, allowing the new callback to be invoked when flushing the lis=
t in
> > > > device_links_flush_sync_list().
> > > >
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > >         - Re-worked the approach to use a list to queue/flush devic=
es for
> > > >         ->queue_sync_state(). This should make sure the device lock=
 is being
> > > >         held when it's needed, as pointed out by Danilo.
> > > >
> > >
> > > Hi Ulf,
> > >
> > > Thanks for working on this!
> > >
> > > And please bear with my slow replies.
> >
> > I will try, but taking more than 2 months to reply isn't sustainable,
> > I think. Let's hope you can get some more bandwidth for reviews when
> > moving forward.
> >
> > >
> > > > ---
> > > >  drivers/base/base.h           | 18 ++++++++
> > > >  drivers/base/core.c           | 77 ++++++++++++++++++++++++++-----=
----
> > > >  drivers/base/driver.c         |  7 ++++
> > > >  include/linux/device.h        |  2 +
> > > >  include/linux/device/driver.h |  7 ++++
> > > >  5 files changed, 91 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > > > index 30b416588617..c8be24af92c3 100644
> > > > --- a/drivers/base/base.h
> > > > +++ b/drivers/base/base.h
> > > > @@ -196,6 +196,24 @@ static inline void dev_sync_state(struct devic=
e *dev)
> > > >                 dev->driver->sync_state(dev);
> > > >  }
> > > >
> > > > +static inline bool dev_has_queue_sync_state(struct device *dev)
> > >
> > > Let's please pick a better name. This is too similar to the actual
> > > queue function you call __device_links_queue_sync_state() and is very
> > > confusing. Maybe something that has a meaning along the lines of
> > > "another consumer probed". So, maybe:
> > > * consumer_probed()
> > > * change_of_active_consumers()
> >
> > The whole point of naming it "queue_sync_state" was exactly to refer
> > to __device_links_queue_sync_state(). The point is, the callback can't
> > be invoked unless __device_links_queue_sync_state() has been called
> > for the device first.
> >
> > Not sure why you think that is confusing? To me, that is rather the
> > opposite. :-)
>
>
> sync_state() is a callback telling the driver that it's okay to sync
> the state of the hardware with the software.
>
> queue_sync_state() means nothing to the driver. It's just leaking an
> internal implementation detail (name of the internal function) to the
> driver that's not really relevant. What you are really telling the
> driver is that some additional consumers have probed.
>
> > Before deciding on another name, note also that
> > __device_links_queue_sync_state() is called when resuming sync_state
> > from device_links_supplier_sync_state_resume() and from
> > device_links_driver_bound(). I am not sure "consumer_probed" a good
> > name that covers both of these cases; what do you think?
>
> Yes, I'm well aware of that :) The contract of sync_state() is that
> it'll come after a point where it's safe to sync the state. Not "as
> soon as it's safe" -- meaning no timing guarantee. Really, this is
> just to make sure sync_state() doesn't come before late initcalls
> (because a lot of frameworks make assumptions around it) are done and
> before all the top level devices are added.
>
> So, even today, sync_state() can come a bit late. In general, the
> driver framework doesn't guarantee immediate action. There is no
> guarantee that a drive probe will be called as soon as it's registered
> (if there is a device) and vice versa. The same will be true for a
> "consumer_probed()" callback too.
>
> Also, your implementation is literally trying to check which consumers
> have probed and which ones haven't. So something like
> "consumer_probed()" or "consumer_change()" should work well and is
> actually meaningful for a driver developer.

I have no strong opinion on the name, so if you prefer
"consumer_probed|changed", let me just pick one of them then.

[...]

Kind regards
Uffe

