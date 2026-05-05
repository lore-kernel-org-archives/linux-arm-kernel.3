Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ECDCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=; b=VJ8xcMWBXWJHLHFU7PXhEUcib5
	QdfhN6mnCapvzfmLCDIHEufK6VXQ4/uIN1k544UzzYQOpElFNE44CjAE/4KDnHOHSVv++7Z5KXzlj
	QV4FYnJUJ81sMqz27NOOzH/FJ6+RQPVMbpTArk+Q9jr0mEKsLF9jzAFUOjgYVvv0ZaoG4ojHEmuv6
	4u72wDF4KgSPMAMuQ6WqQq/w87UVC8jiWCBRQErFVORx548kJ8YVKlXwAZU31xkmNpY8IbWxlSEC3
	gSrdCPR2rdtJgDuSSxBShzOhpaa67O7Q3Py9IlY28yYJ/scLva2Nn5WgdRtlsBnwjYR7+1qf+JUKq
	PKTPKJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZa-0000000GTOq-3dQR;
	Tue, 05 May 2026 14:16:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGZY-0000000GTM5-1IA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:16:29 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5847323e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990586; cv=none;
        d=google.com; s=arc-20240605;
        b=Ui1WPWqV3Ys2Kuk58mgyocL/vvwDdQxSemTT6Fe2d63smI4U0oBaaAqZtulG1B3BDe
         YUaTeUrn1nsMbz7BfXyJbGuAGhauPREKzomfWtctv9V7x85CSwEu/C5lqZYZzK/qIZpp
         YKNJmmprOsZEJc4xuDmIz7WRE4pizeckxlYAKquh2Vt6RkvcjJRBZvfv9uor2j2KjuU6
         ZoV5O1bbfgjzcBrHy40NY3y30jkVsWWYDNPtmmhhl1u81G//VC9AbAXejdMHEgUP2YdC
         prfbeLv5obINmvuZvmJrhfufizUUPlqdmzXS/HSUfbIsjFWNEb9GNB1aMeu9AmZ5T/d3
         7egA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=;
        fh=6OsrDE51/tH89cmB5qnCpnKP4LQ7kfK51lvivTwgToE=;
        b=SXiGYaNJta/opqLq0MqoOuA7FG9l+0EOBMTlELTMmIgdeK50QgLpqoGRes2eLn5d/A
         d8IiFP1rKebkxYBCTdZYj7a5e94gznLibbJHvCrqqMf/AhLEKNWDG/Dw3+aZOafzSOX2
         z3bWNX5fQH290h+RBAkPYjte3GIZYmpTHYO59J0S7Q1JU5bTrms71dfuBp+e5q94GwTL
         bjo5FvYEm8FUTn3PErQYkzAhAAFCVTZ8cH6e0PbT6uWoaGFHCb4ouFgUevmjM235W/YN
         Nsvu1TBFb7cJQRqlzWbfi85wO2OoLhXqmqieQsnHhcHdmQjfw3LJwYTheTIsdwRmnJbn
         y3IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777990586; x=1778595386; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=;
        b=MdR6bM9FjvAZrMWh/9NOmaSqNznKTHvL64uqNwuPbAjsPW9pa4aC033HOfqc38aJpt
         AKqqbe+m986Eh/scEKx+eL8pt1Sx5IpPLGLoXZxL8kqwMtZcS4OdMWzqpibQ3eiwvVx9
         lXVXduJB4C2TwbGof+Z6CjzmkfJFeUQG6T85nb+reI/j9X4rZJf00FBR/4+fI9Zs2zgP
         dXlEG63uvVvY1MIJN4tk3hSdXqCaFPeDzOb0CN0PvYK4715YFCQ6KAGr1xvXcn06o/yw
         6Vrdf3HkffeSmTYtNrgKrUXdFkx/XNtMXdutWcbxJWMT+JkMeSzWot4R0AOCpoEBaIGS
         aSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990586; x=1778595386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n1BHwbT6sLMZPQ5Ra5Z4Dc4Gq+q3b4+gKTchSYDuYg=;
        b=dN5wqDXU9yLtd95eLn4MooSzQjtouy6W+J27+pueDdR1ex/HTA3QeeyKr9S9DEgNN9
         21Sv721kuSJTFnCVlsd7Q5IYu0ozXA2Q2d3EksEw97D0hd3NOJpwLGTTvVrbpAtbycwT
         MkOVj193I7TA5wRiE1qvB557Pv4reDEMEJkwEVdx+zYE0ZjZmJyrSfS2NTqnhy0mBwRe
         pLwOmZV/K3faAJ10apfbdO3fKEipNKzZkOaHcjMn9igTtcHDqH8mCb++k0dp2d2lgnw5
         Jm+DDa5wIQaor65RUIcGkDZrlhBEeW6YLTcIHGQSX54EQg0WBlJf2hoi392LWcZHXkYc
         M+vQ==
X-Forwarded-Encrypted: i=1; AFNElJ9taOANmq/t8HkwyMP/KRW3ee9LJvZAxq1AEn+qFnnq4Iz+sRBZb1jiBSnMueIAKCzsV5G/JjMdyw3135aFaaod@lists.infradead.org
X-Gm-Message-State: AOJu0YxE3SoC1k/VAahcCUEfv1/osgQ55wJhapPxe+24vFhwxHbE/58q
	1jjC0mFx0TnTsN7MGHHkENQ9tL8io2LCtggXRgyLGwQyHsVLHVt821nujoRxPbyNm27XJfUX3Pk
	N9WxQCMy3dA9TcclwoXCqMUF4DeYguT7yi62Fo38xFQ==
X-Gm-Gg: AeBDiesdYrxSHspUvdqK5rqqvuxJ8TS27I1kDZ8d7N6fretdmogQRCxPG96pEsY0p3i
	WYOJ2yYe/gklKnCw9hlK0V8eqrG1EuVXOhQ8+1qRgFmto/5mpFPJ7laO/zFzkG6je96OYtfZOHG
	Ss1IH5VqWfVOO1DzNTxJIByxTzjpgWip+2i7SJ6Von8OX5/ex0g2RUvnLz8kv/8h9xaPV+8oYg5
	zJZsXTtdIodMwGzMyeSDb2k7KgoiYbxSo/jM61vNPxhnuNeuOnRs0SiJorRyIfioH8srl4s3gEu
	Ab7Ax9z0WurX0rHE7b4=
X-Received: by 2002:a05:6512:a8c:b0:5a2:bc5d:c675 with SMTP id
 2adb3069b0e04-5a8631c1104mr5144695e87.28.1777990585964; Tue, 05 May 2026
 07:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org> <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
 <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com>
 <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org> <CAPDyKFoKNpUexGrM0zcysKMKcdYT-cU0_Q_AHbgiGPk_gU-3nA@mail.gmail.com>
 <DIAR5LATLBNK.1CSW7AD5VRN77@kernel.org>
In-Reply-To: <DIAR5LATLBNK.1CSW7AD5VRN77@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2026 16:15:49 +0200
X-Gm-Features: AVHnY4JoQ9U8rU1C6LkDXLwkHY8Lk-vfHOOrZ84KcQURDPW5oqZb9k-nt-xLubU
Message-ID: <CAPDyKFqbdDHRj6ZTAs62K=T833Ko7Mu2Bna9D8pjhd=Niw1DbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_071628_517662_8ACE129F 
X-CRM114-Status: GOOD (  40.45  )
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

On Tue, 5 May 2026 at 14:46, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Tue May 5, 2026 at 1:12 PM CEST, Ulf Hansson wrote:
> > On Wed, 22 Apr 2026 at 12:59, Danilo Krummrich <dakr@kernel.org> wrote:
> >>
> >> On Wed Apr 22, 2026 at 12:07 PM CEST, Ulf Hansson wrote:
> >> > On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
> >> >> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> >> >> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
> >> >> >       if (dev->state_synced)
> >> >> >               return;
> >> >> >
> >> >> > +     if (dev->driver && dev->driver->queue_sync_state)
> >> >> > +             dev->driver->queue_sync_state(dev);
> >> >>
> >> >> This seems to be called without the device lock being held, which seems to allow
> >> >> the queue_sync_state() callback to execute concurrently with remove(). This
> >> >> opens the door for all kinds of UAF conditions in drivers.
> >> >
> >> > If that were the case, this whole function would be unsafe even before
> >> > this change. I assume this isn't because of how the function is being
> >> > called, but I may be wrong.
> >>
> >> This function does not issue any driver callbacks intentionally; the existing
> >> sync_state() callback is deferred to device_links_flush_sync_list(), which is
> >> called without the device_links_write_lock() held, but takes the device_lock()
> >> to protect against other concurrent driver callbacks, such as remove().
> >>
> >> I.e. we can't take the device_lock() when the device_links_write_lock() is held,
> >> as it would be prone to lock inversion.
> >
> > You are right, the device_lock() is needed in
> > device_links_flush_sync_list() to protect against concurrent driver
> > callbacks from being invoked, such as the ->remove().
> >
> > However, as part of the removal procedure in
> > __device_release_driver(), we also need to account for device links.
> > Hence we call device_links_busy() which takes the
> > device_links_write_lock().
>
> I don't think this is sufficient.
>
> I wrapped my head around this about three weeks ago and I think there were
> multiple cases where this falls apart. I think one case was:
>
>   1. Consumer binds, supplier is added to deferred_sync. Consumer unbinds,
>      link goes to AVAILABLE.
>
>   2. device_links_busy(supplier) takes and releases device_links_write_lock(),
>      finds no ACTIVE consumers, returns false -- drv->remove() starts without
>      device_links_write_lock() held.
>
>   3. device_links_supplier_sync_state_resume() takes device_links_write_lock(),
>      finds supplier still on deferred_sync -- device_links_driver_cleanup()
>      hasn't run yet, blocked on the lock. queue_sync_state() is called
>      concurrently with drv->remove().

Thanks for pointing this out! More problems seem to exist regarding the above.

What if drv->remove(supplier) completes before
device_links_supplier_sync_state_resume() is called and the removed
device is still in the deferred_sync list? Probably another
get|put_device() is needed to protect us from UAF.

>
> But again, I think that's what I concluded three weeks ago and this state
> machine is rather tricky.

Indeed it is.

>
> That said, *even if* we could prove that this works in all cases, it would be
> very subtle, pretty fragile and not by design.
>
> The whole state machine around sync state is already rather complicated. So, if
> we really want to make it an invariant that it is valid to call bus device
> callbacks without holding the device lock from
> __device_links_queue_sync_state(), I think this has to be carefully reflected by
> the overall design making it *very explicit* how this invariant holds up in all
> cases.

Right.

I experimented with adding the devices for ->queue_sync_state() into a
separate list and then flushing that list similarly to how the
sync_state list is flushed. It becomes messy, but I guess there is no
other way.

Perhaps Saravana has another suggestion for how to implement this?

>
> Otherwise, I'd be rather concerned that this becomes a source of subtle bugs.

Kind regards
Uffe

