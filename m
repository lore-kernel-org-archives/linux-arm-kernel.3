Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4A6F9B612
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SNLfa4K/uJiNwTlY4z2Bc+7POJ0dVXka0GD7AEYWco=; b=ZsPe1Csqw3g9ToGpZLBQz3WO8o
	hI8L/F3e88B/a5XtnFmjVerY7I/v02wQFB22GC6NktD3TrwAMbT8geX8B27QpK45izXqjfJznnK9F
	npO715uCtb4gilGCWMKaFFsAoYxYIq9zm34iXWmZQLBJbVczj3Z2wFFV6oRIFX4qfQZFSFip8l5X5
	jgPoQKpt+SELtWbJbpJlHZcLAcmnw52K0zs0yqOr4+faysSTALoTpmd59viUakTKNmAtK5PIqx4/g
	h4nXFm76NQAdxDYkIzdlPAPdM3eznYdQ5BvDNxtd6SFzt/90eJGhDp1vDipvddxVPwCqD35u/JmJp
	AZ7yqF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVJI-00000009yLY-0WyI;
	Wed, 22 Apr 2026 11:00:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVJF-00000009yL9-3qHI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9232C41A31;
	Wed, 22 Apr 2026 10:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0BEC2BCB4;
	Wed, 22 Apr 2026 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776855596;
	bh=//4P/Sn26KXkVxYjuyHGjNLQZAH/u/OsyriEY0/4JAc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=k3No9sWzlLT2r4ZMl9+SBaXKDt4bu1LA4TAhpAyGDknf+FGRUaW9Ne1wpqXRTdvTL
	 6h5kikyJIMu7OTw9cIpccxhnb+U91HZsVGo1F/Y+hDvRk8The/76e16RHWUcy3BSR4
	 gHvIr3t89F8Iazm0vUqbrMTKcK2oPLLspqHPAU0FHiXkitUOsGc9XadLludz1TCA0b
	 IaLs7qm90LRhD6HYw1i4Du919AZoIdW6pH7XWI5DGFYAv11QlPBs3krYgdhvxEtxd1
	 Ih883vxjz/kV9whvNannzUqNvd6AjAquij7/HkZGyGBkBFPuKOuPZSjie77mATg4YZ
	 nqhKF6weetQ/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 12:59:50 +0200
Message-Id: <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-pm@vger.kernel.org>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Peng
 Fan" <peng.fan@oss.nxp.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 <driver-core@lists.linux.dev>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org>
 <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
 <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com>
In-Reply-To: <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_035958_030220_B9645798 
X-CRM114-Status: GOOD (  16.03  )
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

On Wed Apr 22, 2026 at 12:07 PM CEST, Ulf Hansson wrote:
> On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
>> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
>> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(stru=
ct device *dev,
>> >       if (dev->state_synced)
>> >               return;
>> >
>> > +     if (dev->driver && dev->driver->queue_sync_state)
>> > +             dev->driver->queue_sync_state(dev);
>>
>> This seems to be called without the device lock being held, which seems =
to allow
>> the queue_sync_state() callback to execute concurrently with remove(). T=
his
>> opens the door for all kinds of UAF conditions in drivers.
>
> If that were the case, this whole function would be unsafe even before
> this change. I assume this isn't because of how the function is being
> called, but I may be wrong.

This function does not issue any driver callbacks intentionally; the existi=
ng
sync_state() callback is deferred to device_links_flush_sync_list(), which =
is
called without the device_links_write_lock() held, but takes the device_loc=
k()
to protect against other concurrent driver callbacks, such as remove().

I.e. we can't take the device_lock() when the device_links_write_lock() is =
held,
as it would be prone to lock inversion.

The documentation of __device_links_queue_sync_state() actually slightly hi=
nts
at this, but focuses more on the other reason for the deferred semantics --=
 the
sync_state() callback may want to call device link APIs.

> Anyway, let me add a get/put_device() here somewhere, to ensure we
> prevent this from happening. I assume that is what you are proposing?

No, an additional device reference count won't protect against other concur=
rent
driver callbacks, such as remove().

