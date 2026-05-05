Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C99CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEhGr/q0Jz6/qKY3p81j00T5eIEi073Uzt+v4E8D1Bc=; b=thw1SzBQWrhBNRLwu7GcFCW/hY
	S547X0OG7rCmBld/Z34bEI5ANbwq4QweGjc5hCVHuCgewpKxFQ9G0VWNjgSS6FJ9UlEx0mZ0tvgCo
	d96cwo0BpTCKDHyvzsJdQTh+NWXhY4RKvS3Zgxzl6fCWxXFJRGsfzijLxvok+X2m1DDUn+XvdfmnJ
	AxgjFQEK1Yr3FTroEJ5FyOWEb2qi/XB5r4gGMa9dJLeqIbs4/l8jZKyie/FLfNlcjx8SPCaZ+ZlBA
	oXTu5d+tRitr5BeOKEo9aXVvdqfEC1z2jUMAB4ZMsc0R70odIHK1XKEwqx5Y54On2gBGvr8kL8bR9
	3RUtztYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFAx-0000000GDtJ-0LY3;
	Tue, 05 May 2026 12:46:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFAu-0000000GDsC-22yJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 827AA43C80;
	Tue,  5 May 2026 12:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EF2C2BCC7;
	Tue,  5 May 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985215;
	bh=596sMWZzO6rtiPjU1JWkqiiSWIQcxiR85HlwQ2gSnXg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=ZbU9ITGb91UZX09/qUN7UK+C66NqfMP+rt4z3zVV5PRWg6VyC3VUNmo/QH2vkf6E3
	 1CJJFrw42Vj/Nn57WBhZHnqrkCLhUKKYMVqUSa/LGx3QPS40ZWxm+8LUe2/G/j31aI
	 /LnN2J0G5PMTtqnIX2rDri3L4/NDxcLPAxCokN/Fh9PMxN1L5btTgH+oKRxvG6Q/H6
	 goaafdhFwuzeNXSfCPPW9CqFWJFUb+BINS/qdXA1pi6pWqZiyH1fv7/uldf9S4joKq
	 Mll2fB6ZEFBIGARw0FzIlqEafFI3HJLPjoF5gjN3waJKaDUX2ADsdA5NKnhR8Fqtpy
	 du+oNQMpcmAfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 14:46:49 +0200
Message-Id: <DIAR5LATLBNK.1CSW7AD5VRN77@kernel.org>
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
 <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org>
 <CAPDyKFoKNpUexGrM0zcysKMKcdYT-cU0_Q_AHbgiGPk_gU-3nA@mail.gmail.com>
In-Reply-To: <CAPDyKFoKNpUexGrM0zcysKMKcdYT-cU0_Q_AHbgiGPk_gU-3nA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_054656_569168_6F14651D 
X-CRM114-Status: GOOD (  25.08  )
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

On Tue May 5, 2026 at 1:12 PM CEST, Ulf Hansson wrote:
> On Wed, 22 Apr 2026 at 12:59, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Wed Apr 22, 2026 at 12:07 PM CEST, Ulf Hansson wrote:
>> > On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote=
:
>> >> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
>> >> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(s=
truct device *dev,
>> >> >       if (dev->state_synced)
>> >> >               return;
>> >> >
>> >> > +     if (dev->driver && dev->driver->queue_sync_state)
>> >> > +             dev->driver->queue_sync_state(dev);
>> >>
>> >> This seems to be called without the device lock being held, which see=
ms to allow
>> >> the queue_sync_state() callback to execute concurrently with remove()=
. This
>> >> opens the door for all kinds of UAF conditions in drivers.
>> >
>> > If that were the case, this whole function would be unsafe even before
>> > this change. I assume this isn't because of how the function is being
>> > called, but I may be wrong.
>>
>> This function does not issue any driver callbacks intentionally; the exi=
sting
>> sync_state() callback is deferred to device_links_flush_sync_list(), whi=
ch is
>> called without the device_links_write_lock() held, but takes the device_=
lock()
>> to protect against other concurrent driver callbacks, such as remove().
>>
>> I.e. we can't take the device_lock() when the device_links_write_lock() =
is held,
>> as it would be prone to lock inversion.
>
> You are right, the device_lock() is needed in
> device_links_flush_sync_list() to protect against concurrent driver
> callbacks from being invoked, such as the ->remove().
>
> However, as part of the removal procedure in
> __device_release_driver(), we also need to account for device links.
> Hence we call device_links_busy() which takes the
> device_links_write_lock().

I don't think this is sufficient.

I wrapped my head around this about three weeks ago and I think there were
multiple cases where this falls apart. I think one case was:

  1. Consumer binds, supplier is added to deferred_sync. Consumer unbinds,
     link goes to AVAILABLE.

  2. device_links_busy(supplier) takes and releases device_links_write_lock=
(),
     finds no ACTIVE consumers, returns false -- drv->remove() starts witho=
ut
     device_links_write_lock() held.

  3. device_links_supplier_sync_state_resume() takes device_links_write_loc=
k(),
     finds supplier still on deferred_sync -- device_links_driver_cleanup()
     hasn't run yet, blocked on the lock. queue_sync_state() is called
     concurrently with drv->remove().

But again, I think that's what I concluded three weeks ago and this state
machine is rather tricky.

That said, *even if* we could prove that this works in all cases, it would =
be
very subtle, pretty fragile and not by design.

The whole state machine around sync state is already rather complicated. So=
, if
we really want to make it an invariant that it is valid to call bus device
callbacks without holding the device lock from
__device_links_queue_sync_state(), I think this has to be carefully reflect=
ed by
the overall design making it *very explicit* how this invariant holds up in=
 all
cases.

Otherwise, I'd be rather concerned that this becomes a source of subtle bug=
s.

