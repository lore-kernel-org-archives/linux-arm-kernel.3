Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0B3C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=; b=bRjoy2589Vjlh9EF5mBAx7lqNu
	yyBH2W7WYt/FCM9/HIcJp+eKAyJ7Lq1CQu4qAb4oDdRmGLp2AmE3PYTGe55Vh8NUnLe78L7KOedSr
	aBbMNgbqjLCqHx8ZG3wd87BDIkDxtu3VLFiyKZFEPbMu4LQYxXVvARPjRmVYeG7ifzM1v8XKgG+3+
	MNZ+NnvF9VlNmdfLTr+i9fjRF8o/K+MygjAaKsW2O7wiK+qQqp7lFj/bvcQNT8ojuT8f18LtA2jYQ
	P58kweBKq8b2HdLXe7DLM+1foTkSkZaQgeiZvIzc6IjUM6IEMmk7piR7KmJxSNRgwUTNWZmzO0ID6
	nkDCp9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wln8t-00000006hNd-2xZF;
	Mon, 20 Jul 2026 12:30:43 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wln8r-00000006hMK-1r2V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:30:42 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-66787b93a0aso1118552d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 05:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784550640; cv=none;
        d=google.com; s=arc-20260327;
        b=Mt2G+UaccVVFs5g6ksL6nrX+hlcJvyIUSDy6BIttSPP5qhdLtKeo6Y1MgFg9xZ8mxR
         gQ5gMCgOIIaOAcXotFejTO+j2uj/telUBiPCLkxv+GsOb5pxlNLNs38Y7MusbwOyDz+m
         lzivZqTpZ2IRCHxON8U4TYcsvPCkJG0JjmnvYDpiVLZpxSZ4jquBfnqzMEymMX0Wfhmm
         QX4TtncF5ldMrQdxccshF7GVagcLvIIMPjx9Q7oQQL2X/xAzYa7aYIH9klVATQ+lV6bk
         YxkFnqop1DkgkhL7oCZ0i43TRUfUb6A7aVN8HefxP7ojl0j/rG8rzUKsGe/tEozEWTOJ
         ZyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=;
        fh=kBQ4JqYxKTuq8iMq60IJfmWeFfo5VZ8rJtgyTIKpJ6o=;
        b=MSwD3AnJugygEkT813tu53Xv8S+pwSMpmPYXUy7XoFL7MZyDbImylbcZJ/QqnH2W7j
         LCPudqT1EJKHSkEbQUBpefuRAuRtemuzKwVcazltzLcBfHZxNUj/zUbhB+YLMRi2hgj6
         DxCMHOGB4FaWG8rWXrHIHXb9AAdgomU1IEAgHp2Xg/CTzvIyTEfRKEXPV0sL+wRDOlpR
         J01bpSemPeznNE0QQWqGKc+kqzZKcLOUZHVIf1YcTfcrzQU8EQS59oZ2P0BzygguBDFI
         ze1LQFwevQ6VWWh40NzGQrYvpaxyzKD73iGOum/3Inw//RbNJmb7Wxjpsthcw3VwzZXD
         qhcQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784550640; x=1785155440; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=;
        b=lfueju9bymihNYWS7f+FnnxrN6HCRUDsXa+r/lQ8NvCC7hHlutPuZdBTwn+FXcWBC1
         UDx8to2RaI71hojCIG8tvdYN8rFTXhMwAAb5AJPeX04jV4QsDNTxgwV7MKt/nSk6Bli7
         PrDnoDUyzGnM5bRurUfidQ/qV0gfkoZjs7fQWaU4e7D3Tsg0sf/vichPojVhbeLi2udd
         katikwf59CoxlOD9Ppb7Y21flcfb7mt9+bSeYZJIbRQ5h3OaOMmTDN5BnS6RzydJurv5
         gQl78UMWuxDqmELo8L+cufBo6FJ2dAMMFdKItu0xvcDXy1Niv4E6H4YMz3dwLN+slLdM
         Pm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550640; x=1785155440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RK3orBipLvBxv9OpAnJ3z8fX6ifrA1MYoB2RBjJvzSM=;
        b=aP8+029EVShO+j/p3BjZ5io0xTMRXOAsT/Y0e5BgH5iWnLQYD4+Aj2a9oQYbIbcN3Q
         +DozkSGxsAH4Lsz637KDf86sDpjzBfiDH8E7zDhHZLjQKpztUknQOxk2sFuC3B2OkUkL
         kKc1vlMbfGdePV1Tf4hM81zETh7DSFQrA+dZexOfX+JXJmbHxx/3hvYJhsVeJ/Cjfm3T
         KlL7xhIRLThGFNnE6hDntDZMkw49+1m5jIJuwO7+OvwfaHEN4EGOYzYTuWPxA8kmlDlI
         TpBsJivdVWc21oK7sIfz4VQNt6Cw/LuA5Gs7756WYxTfgjh+s1Fi6EV/JNmTUevrCuvl
         qQcw==
X-Forwarded-Encrypted: i=1; AHgh+RqgdQXQmcs9DO2DcMf5X/yXm7yvE+Y5LBEZIhVRi7VqIhn1umK+t9kxx+MVWh3KAKsdUtELeM3wvEVz4EeqWP7D@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8TtvkLKCt9XHSHqW9VulqGnc6ZUeY/7CgqX7jn+5eeCJ31PQ9
	cplyQldtqdfSE16pzXfckqWVPsnPzLzLeso7NB3CGe32BA/wufai4d/+0c+nYjagTL5QY8bANIf
	p8i3HxFwXJOL77CrwlndVj+FpdAWUgxw=
X-Gm-Gg: AR+sD12re9WRko8aOVjtEhuId/4b5JjPaYWFkD4wUJ5921MOjoJmHWVxJsNMk4CkIsV
	4i6AwiklKRH73rQFVuF/ypSbkUgRWhMUf3IXtfxhBdrH38vE1Ag7yGDSG0hD34xVO3zkKKZu9Wl
	Neraw7hRQ34EeuctaW5toWLBO5PONVA+nPJwZdfbmvDEyHjy9Za/oAOqj8Z4luyscnsxYvJfAil
	MdGGwUEUSFLTc+bx4nqggJeUVjowwdhwPKETxk1CWWATyACqUOy54GIyXo+oFCoYSwjqLFEYVGw
	F6QdFyuXCydi+OyYylf3cxDpcxGzn+k=
X-Received: by 2002:a53:b185:0:b0:664:afd7:e41d with SMTP id
 956f58d0204a3-6683bd3225fmr3054006d50.6.1784550639803; Mon, 20 Jul 2026
 05:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
In-Reply-To: <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 20 Jul 2026 14:30:26 +0200
X-Gm-Features: AUfX_mxl6V0Fcqr3p7PwGpYbAibraD_hti9tBU-fCmVXnkE6AMcEpLARKs3E8NU
Message-ID: <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260720_053041_492808_A31C1011 
X-CRM114-Status: GOOD (  28.70  )
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

Great to hear it works on the 5B -- thanks for testing!

Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
It also supersedes the suspend cancel/re-arm I had queued from the
bot review: with suspend refused while audio_streaming is set, the
worker can never be armed at suspend time, so those hunks are
dropped.

v4 follows shortly with this plus Sebastian's dts restructuring
(shared disabled-by-default card in rk3588-extra.dtsi, renamed to
"RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
reference + unevaluatedProperties).

Igor

On Mon, Jul 20, 2026 at 3:43=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/18/26 11:57, Igor Paunovic wrote:
> > The Synopsys DesignWare HDMI RX controller extracts the audio stream
> > embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> > controller. Expose it as an ALSA capture device by registering the
> > generic hdmi-codec as a child of the controller, so that a
> > simple-audio-card in the device tree can bind the HDMI RX audio DAI.
> >
> > The sample rate is recovered from the ACR N/CTS values together with th=
e
> > measured TMDS character rate. A periodic worker keeps the local audio
> > reference clock locked to the source by nudging it in small ppm steps t=
o
> > hold the audio FIFO fill level near its target, which avoids FIFO
> > under/overflow and the resulting dropped samples.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > ---
> > Changes in v3:
> > - restore the v1 audio teardown in remove(): audio_shutdown() already
> >   stops the worker when the stream closes, so the extra flag clear
> >   and trailing cancel added in v2 were redundant (Dmitry Osipenko)
> > - rename the ACR read locals and add a comment documenting the
> >   register byte packing
> > - drop the get_dai_id stub so OF-graph cards resolve the DAI index
> >   from the reg property
> >
> > Changes in v2:
> > - register the S/PDIF DAI so the indexes match the binding and reject
> >   it with -EOPNOTSUPP until wired up (Sebastian Reichel)
> > - use platform_device_register_data() and drop the fixed 32-bit DMA
> >   mask (Dmitry Osipenko)
> > - don't leave an ERR_PTR in audio_pdev on registration failure
> > - fix teardown ordering in remove()
> > - stop the worker before reprogramming shared state in hw_params()
> > - look up the "audio" clock by name instead of indexing clks[1]
> > - keep the worker on system_unbound_wq when re-arming
> >
> >  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
> >  .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
> >  2 files changed, 279 insertions(+)
>
> Works well on 5b, thanks. Only one additional review comment:
>
> Please update hdmirx_suspend() to return -EBUSY if audio_streaming=3Dtrue=
.
>
> ```
> static __maybe_unused int hdmirx_suspend(struct device *dev)
> {
>         struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
>
>         if (READ_ONCE((hdmirx_dev->audio_streaming)))
>                 return -EBUSY;
> ```
>
> --
> Best regards,
> Dmitry

