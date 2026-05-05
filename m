Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3175CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=; b=KAHtK4mLkDV4BTBYTLORfBZ6pH
	+dpxBDcETlwAEje5xWsvTKR3nGrboARgAFxmnwyGg9hllCDNp7YeNvHy5xPiRvYUxIsr6Td2nhMAF
	HNYxhnplmBGaPbKtQOzn5+odmuqHE1I8QQyuMpxj/LT6tJeM8JGydioA3d4KjfV/I7pWHmMIm6Eye
	uqQK7qyCOgNlJLd4XRoRbFoMM6XhFkf0X6cgZ8jDP8BubIiDVBzpyrwhkNDtw5iCn/kw1YsSnefCP
	wZxmCgSMColQCs/0TfvB6dZ8Iu1UhXH58XRYKi5vRk0epD9NDVZgIFvsgAgEg9o8OGgtpNgDigE1O
	Odz0u7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDiR-0000000G1PS-2kn6;
	Tue, 05 May 2026 11:13:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDiO-0000000G1Og-3QI8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:13:26 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so5887243e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 04:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777979602; cv=none;
        d=google.com; s=arc-20240605;
        b=T5nEyQkKzcOxgMdaw9i+8+1KVlSqHTr0+Hve2tr7bODXUg4kcjVjx2jzBBQR4e6WlI
         YAJ+97GJwQLxWnQd93+53n8aeQJDOBjHsqWpYMe7N0scZWSneHSItLE3uHHK3vp24NpT
         BbmyTM8onIjtB4v7ligE4vgDrLVttCziZCrYdBptMPBhIOYWEltDHNMimYuk3oOmcbL/
         yx2c5MTD4BKGbro7FhbU/bBYemcOLJBlR+C0uSxyd/ZYemVIIFdyrh8cJk8jDtskE/0r
         Kt59fydvsRGGB1DcQuoAjI092mAcl1zEh3XUmVRctd4mMinjQi1iBbx1dbHOI1/ww/b5
         0IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=;
        fh=LypBAla/DCXUZARKmxC23vKsIVSZnnYM+p9zMYcKMeQ=;
        b=SCkBQemtSo82gw10Mq2mSdDLtd/4foEOxKzsqVv6HARYDpkwX4hIf959+GX6m46PAw
         EJZ48jh2xbPLgsp2uNVstcchkOyuOEUcWxbtduWci3u8/MDT/M2jZk8r0PMlvA1F44vn
         Lo1SK0Mgfpb2HJ0h1utTr5mm8qpC0LZEfJmlg+eAo4Z10TRFrKmWqWEhgMQ7zj8RAkC1
         TB+vuPzJ70gk2xwwcYCNtOoucyBAYKqHZGMX1nG9YvmKh7daPmFM/VrICPkbMtKcP4dW
         LMhuJZvFlSV51dMMA2kNf6LszX38KjBKqP81L7VWuOlULDbea8s03kkUvP2MMTCYleme
         ATSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777979602; x=1778584402; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=;
        b=aSDdG7FKrOfbArq+oNg5IRR6g+9m7KjQUrnhe3LrqSBiTn5L8VepwMwZYWf/qZHliu
         N+5R+n0DbJnQaLmXwfMb/mc7jsHuJCd+jmxcloviXqXdGl/F9W3zUKa93zqd7zWht2Vh
         2jKTmNnzhk786DlporFNK6/p8Nsb5EcOR4rq6iOXuVFp+toa2fgut25ryxV1RFMbqmrT
         xou3d87lKuu1JxmlrwKfXpe5fp6oFmCEdznzK+fE+viqBrB4rMAOmaq7wYxs2AhoJ73c
         wXBMH9JZeCEvPp2US9uynb6K+6u7MH0AcC93MVA/0Qh1SYurIVxKXqZoa8Asv6A8RXYx
         zWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979602; x=1778584402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHtD1aX9zPxNRjWtqJ4oSWNxhaYMbBh5QHVWQYJquis=;
        b=HgkEybSRrtYFqDkY7Yeel0LSdmf2dYKDE2PMfQU1xNe8SutUxP2ax7H7/K9obuw4NT
         EmXaA0OxJdsFuzxoOd5LXV3nzwwAM3JFhPkY/XhmPqbWspG/z5Gk+IApoHBm7zSDiGKi
         yaWpg2RclP7nh3f5ylOfzO1ZLfyHXhwYtYp8+0O0icrxdDCaUV3Gf4KXYQt3rTaTORG/
         neW8gHgzEtOGHuXxMotNQtKzh4ZF0OxJ6Thj1x6Bet7orVrGI1ebBVv+JbOg9Kk5Yz/m
         f5CbraOS6S0ylxPXG6sak5hSm2vTbWfdM6BOTdEu/nfoS3ht1nMGlf94Qr9wTC9f+0b1
         nGuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Hels6mBp3adwMUTUS7B6sg8Lx9VUuLasQaf5MmlidXuhbdR87+3XMYKopDQVkgBGDlYBepWe4gc50waO04xvT@lists.infradead.org
X-Gm-Message-State: AOJu0YzKBc84fCUrhRb8tOCpmgIN3yF1EYhdNDlildi9lIdDxH4WIRut
	lPkNKZmL2KgfbvVBV4rI4KPYGjKhd2luO8r8n25A/04Ct6T0be7e2iKlFi9B9TttO4pWvlhtKq6
	0BojTXa5NBx249cxh1NhTwJ2bUKSexRTfhwCvWXcL4Q==
X-Gm-Gg: AeBDietRWwkKzfWARL4S+LeqGx9uv2ZNOHDU3YfBAYTsPlt0xT4Hh2jgPQQbKje9mH9
	lpF2IJWvW+OOcJxTSKUGPj5HPBKgSnUli9vfLfRI6TE+UOBmDn2EH1KcbcumltGyRLtGweYs2Y3
	giQgkfgXnits86+Uhe5B5ZWw4+GXb1BVcmnULHroVaz6LTyquAE7kCgt/j29WuesYS4qPdf/laM
	JW2/+H/JyE86QgksVo9XLazOgpLftok7iKP5O/8HwdAdLXozbhpU27uYbo36zX9ftZa1YY22D7i
	8Uj6UU7Yp0wbefuUnr8=
X-Received: by 2002:a05:6512:1255:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a86b8167c7mr5154556e87.30.1777979602140; Tue, 05 May 2026
 04:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org> <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
 <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com> <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org>
In-Reply-To: <DHZMQLCIRJIS.174HZR6DIAOMM@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2026 13:12:45 +0200
X-Gm-Features: AVHnY4LlCgMgAkU1pCqSb5NGsrhZtKGgNNx2kcRO5ejJAWo_ZbIw6N5C10vsCeg
Message-ID: <CAPDyKFoKNpUexGrM0zcysKMKcdYT-cU0_Q_AHbgiGPk_gU-3nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_041324_900634_95614695 
X-CRM114-Status: GOOD (  29.06  )
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

On Wed, 22 Apr 2026 at 12:59, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Apr 22, 2026 at 12:07 PM CEST, Ulf Hansson wrote:
> > On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
> >> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> >> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
> >> >       if (dev->state_synced)
> >> >               return;
> >> >
> >> > +     if (dev->driver && dev->driver->queue_sync_state)
> >> > +             dev->driver->queue_sync_state(dev);
> >>
> >> This seems to be called without the device lock being held, which seems to allow
> >> the queue_sync_state() callback to execute concurrently with remove(). This
> >> opens the door for all kinds of UAF conditions in drivers.
> >
> > If that were the case, this whole function would be unsafe even before
> > this change. I assume this isn't because of how the function is being
> > called, but I may be wrong.
>
> This function does not issue any driver callbacks intentionally; the existing
> sync_state() callback is deferred to device_links_flush_sync_list(), which is
> called without the device_links_write_lock() held, but takes the device_lock()
> to protect against other concurrent driver callbacks, such as remove().
>
> I.e. we can't take the device_lock() when the device_links_write_lock() is held,
> as it would be prone to lock inversion.

You are right, the device_lock() is needed in
device_links_flush_sync_list() to protect against concurrent driver
callbacks from being invoked, such as the ->remove().

However, as part of the removal procedure in
__device_release_driver(), we also need to account for device links.
Hence we call device_links_busy() which takes the
device_links_write_lock().

>
> The documentation of __device_links_queue_sync_state() actually slightly hints
> at this, but focuses more on the other reason for the deferred semantics -- the
> sync_state() callback may want to call device link APIs.
>
> > Anyway, let me add a get/put_device() here somewhere, to ensure we
> > prevent this from happening. I assume that is what you are proposing?
>
> No, an additional device reference count won't protect against other concurrent
> driver callbacks, such as remove().

Because _device_links_queue_sync_state() is always called while
holding the device_links_write_lock(), it I believe it should be
perfectly safe to invoke the driver callbacks from there.

Kind regards
Uffe

