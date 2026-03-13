Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D25105F785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=; b=bMb+wJlB5PrpH1e+qFH01akHzW
	zTXhPc5PLZ43GrzBVanLN3wjQTctoGRx/dHePRk6eTR/dJjWRJY7KZhdpg9V0uXT7L8xeWSGPauu8
	TDurOuxrXHgYDnU378JbEBwOfwF3/o8GMYl4bs6cAg8hEFz5z4gj7CJqL8rgZDdXdskHFoOB9QiQE
	H9kM1RIuJVZ931NOG4fcnH+Zdvme2YScvSJ2cz3QtL3o0bPLG165gDzEvR6dHshy7+NcU5x3jOv2x
	ALBOgay7T3s+EIO8CyVQWAz4MK8CzqfJFRODKhBehHpwGxnhWO0BOg4LM46FygDOI4wB+sWxXciiL
	gmwZ1NLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ymA-0000000HNjj-0TPV;
	Fri, 13 Mar 2026 09:25:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ym7-0000000HNi3-1Q9x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:25:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b942a41c5fcso262198766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773393941; cv=none;
        d=google.com; s=arc-20240605;
        b=SxvlknKSWlGdjdLvuKN/HqkAWSmCqnd1cB7QPR/rm6DYyCThL9j1MagQ2Q+LGLgYjq
         0AGa168UUme6BPB+xl50vTxB3DpecHL4+oh2NSieMz13cemmRcPuZmrOEzWeIKcFMxfJ
         eQRwSATGV+jtvkXAUSwK7eWMQaPR22JA+SH6zDgLhFOsmaLUKJ2rsVIid85kvYU39c8p
         86SIsplkNF0nbChO2XAjY8Y1OCBUk1g2hYSym7R7+YSXGtI0Uyo3omaE5k9+Kf9Od+IQ
         gn76aztbuu1KZi9LrB71y5iaNHHYUhxV/BQVCfe97rnq3BlcuIkzMcXauMAXedGlK1+k
         WMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=;
        fh=tuI6+2TggX9rqRfVBON5kh+iX1DYTpznA6rKRKVSZzI=;
        b=NQgVd7r0TOwOhuOQkkUabFeUIL4w1IhEJPEP1soQFYrYyP8oMxR2tblCEjAr1txoI7
         iK7zxnzVTkFHFc7FYmWHQrev79SmioErApKjL+wpXKDH0TsTqKPiNbukwUpScRXHzQhw
         EyQSVlcithNiYr7Aw5iIvZWtyR0wC5aMHUiff09WA5O674FWqgCnvdMUCKB/JJHQUdSi
         BjvRdxQUy3wh6Zz/Mr9BJZm7ckpzMZOy4mBwy1BPLHwa7IKLywD2oLE5QrRaaEqxu0Kt
         HutNi6R8XQ0Ol9e9H0ofimB9hWM9gjPXaxBO4FR7DjqfRfHth06I+xOVrrxIvW6eQ3N0
         XULA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773393941; x=1773998741; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=;
        b=jo8NdGdFCcGXvUhhADGwm8DfAUzZrdmswwV7GGDsVqRgJBlhBz5YVv+CSE0IgDbIJj
         ObOmJxDQU65o4uukEIoBWTXONtaCZhAkeIcFkQKPOp1IekcWD4h0YMI+N5Va8KEu4akU
         73fPIrcHBAGaey0/t9xlRITBbuP4IMyKbAuGx59JVh/tD84eqlrAEKXRW9thR0IWZU8c
         FQW8RcKfPhyoE7FM/5Iv/XF7CvHfaOhH4nrbmjPL+Qjpuf1azFrv5u6lZoShKb8jNcmH
         LvZyAuJoJhohTHKA/nwtbHVK1dQGY0M/ZOj7dzHPPZdtxgBe7P3cNmHD2H7e28caS+9E
         c3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773393941; x=1773998741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skapIsZV+2WP9UcczRrFkVT7zb1t6DskdiJBKEA1lOE=;
        b=YHUlYaepufYFEl82gum8E/mb0IZVP8Jwlsa5+LU3wy4zlORMHa/8wzSmDQXbylz/FT
         b1xPpBuqRoCtArjDSsrjrmQuDfvkeA9IXQxb28hHDZfne7TQU/DkDFui5EamoB7xJFx8
         8vbv8Ee+UTtTvVZP933Ybcnqem3O4b8S52cLICecvdYqFPl66tstVU95rKVJYaH7W3G+
         hfcYziMCVD/xlEzpUWDIYzwljodID935ArT6SXuSkxcs8RZb9sCTTK2k3DaXLTO41RGU
         Upg44jTtMTSSIWzYfDusUzg/mz0senf4YS6UrU3uSjqA7OvemUSc7xVEYJKPEnYFxW/7
         0Stw==
X-Forwarded-Encrypted: i=1; AJvYcCWnaC6UB1uwOTQTrmlZSNV8hjBCxfZI6UiAu+mCLE4TKp44v7H+M3gkezUK5BULNElW466PXf8Hqp+Z/gHOAZt8@lists.infradead.org
X-Gm-Message-State: AOJu0YxZNpez71p/ajwOzoUu6ppDPdUi3xGigcOzcxJMMrIkAafxRimp
	iG3CPTcJ3OLCekYgW8aNQg81N8JUc+d+Dd3kUVCrOtgHUmOJHxfayITjhG7e2rmRiX8OJICts05
	0Ym8WFEvK2pd9fUWAyemkQ9IcLYuu7ME=
X-Gm-Gg: ATEYQzy+XoN+9ptK44fCxNRcYILn3MHbyaMH8Vu8qyyItjaROr4yozmVJfHNFc7uhFw
	BCa2/RMqBkKRJk+LWC8ONbyjpqaLFQBQUrm262vOZCdvZ95KWuNFuTJEHUl9H/eLPGpr9qNPA2h
	2CUmrtUsA8GWynbmZMURgKkzc9ftA62wsswJOdqVLfBQZQ+fmRZKgPK3cRFTgzFTvwuUlKHKg5x
	n1ORiGNjyYwe3uuan4Qdct37hvyNZ9i5DljxuN/l0E4/PvmOAEMDXq3+GAdt8ho+gqKv75CyJzg
	kVSkIw==
X-Received: by 2002:a17:907:8dcd:b0:b93:81e7:845a with SMTP id
 a640c23a62f3a-b976507ad70mr126077666b.9.1773393940274; Fri, 13 Mar 2026
 02:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
In-Reply-To: <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 14:55:23 +0530
X-Gm-Features: AaiRm52hlbsJk0-LJBm1qE_mVZnVv4Bhkj1fxNTd0yyF5TYOEj4LUpGTe5M1isE
Message-ID: <CANAwSgTxsDB0t1vj--uvYCCxf4NhnjhBEDLqdevLnGAiuU6_pw@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Robin Murphy <robin.murphy@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022543_424656_2C2B3391 
X-CRM114-Status: GOOD (  43.96  )
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

Hi Robin,

On Thu, 12 Mar 2026 at 18:18, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> >> On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> >>> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> >>>> I have a contrary view here. If just a single driver or lib doesn't handle async
> >>>> probe, it cannot just force other drivers to not take the advantage of async
> >>>> probe. As I said above, enabling async probe easily saves a few hunderd ms or
> >>>> even more if there are more than one Root Port or Root Complex in an SoC.
> >>>
> >>> Then the driver or lib has to be fixed / improved first or the driver core has
> >>> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> >>> from an async path, etc.
> >>>
> >>> In any case, applying the patch and breaking things (knowingly?) doesn't seem
> >>> like the correct approach.
> >>>
> >>>> I strongly agree with you here that the underlying issue should be fixed. But
> >>>> the real impact to end users is not this splat, but not having the boot time
> >>>> optimization that this patch brings in. As an end user, one would want their
> >>>> systems to boot quickly and they wouldn't bother much about a harmless warning
> >>>> splat appearing in the dmesg log.
> >>>
> >>> You mean quickly booting into a "harmless" potential deadlock condition the
> >>> warning splat tries to make people aware of? :)
> >>>
> >>
> >> Hmm, I overlooked the built-as-module part where the deadlock could be possible
> >> as indicated by the comment about the WARN_ON_ONCE().
> >>
> >> But what is the path forward here? Do you want the phylib to fix the
> >> request_module() call or fix the driver core instead?
> >
> > Here are a few thoughts.
> >
> > In general, I think the best would be to get rid of the (affected)
> > PROBE_FORCE_SYNCHRONOUS cases.
> >
> > Now, I guess this can be pretty hard for a PCI controller driver, as you can't
> > really predict what ends up being probed from you async context, i.e. it could
> > even be some other bus controller and things could even propagate further.
> >
> > Not sure how big of a deal it is in practice though, there are not a lot of
> > PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neither
> > PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results in
> > synchronous by default.
> >
> > (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYNCHRONOUS
> > and apparently got lucky with it.)
> >
> >  From a driver-core perspective I think we're rather limited on what we can do;
> > we are already in async context at this point and can't magically go back to
> > initcall context.
> >
> > So, the only thing I can think of is to kick off work on a workqueue, which in
> > the end would be the same as the deferred probe handling.
>
> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> appropriate? A suitable calling context isn't the most obvious "resource
> provider" to wait for, but ultimately it's still a case of "we don't
> have everything we need right now, but it's worth trying again soon".
> I may have missed some subtleties, but my instinct is that it could
> perhaps be as simple as something like this (completely untested).
>
> Cheers,
> Robin.
>
> ----->8-----
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index bea8da5f8a3a..3c4a0207ae3f 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -954,6 +954,16 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
>         if (data->check_async && async_allowed != data->want_async)
>                 return 0;
>
> +       /*
> +        * Bus drivers may probe asynchronously, but be adding a child device
> +        * whose driver still wants a synchronous probe. In this case, just
> +        * defer it, to be triggered by the parent driver probe succeeding.
> +        */
> +       if (!async_allowed && current_is_async()) {
> +               driver_deferred_probe_add(dev);
> +               return 0;
> +       }
> +
>         /*
>          * Ignore errors returned by ->probe so that the next driver can try
>          * its luck.
>

Thanks, these changes help fix the warning.
Please add my
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

