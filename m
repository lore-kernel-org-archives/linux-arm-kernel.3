Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC90EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=; b=e2f4UkxJJ+5XL8NRxWx8WuFp5q
	G1SGYN6rXxI2vOBOeA6+jzRPvu295QRPf+ia46gN2jNvNS1EWaQmw3Qhu0nvul6vUyWM2oe7qlRR4
	mgcgpK96oW/GFMX7GtH3RdQMldli9/MNi14XWaGfd7TSh3ClJNd8+s0yFzKbhcKdjuA4Wjif3z6x2
	Qi3suxHlKG+XTg5Z7e29q3NUI84v4DQBqdFrZAmKXQMsRL/UkrpPgMoEkYF/DY/BswpAac/03O7WP
	01U+bFr+BWvgPje9UIQxK1ocvqTDknEAEgbmF08fJOxAWqCLYbRx78z5dyxeqKXhZ95sHj6eQ2VlR
	4dNZGgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2I1-00000006BxE-3QTp;
	Tue, 07 Apr 2026 09:00:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Hz-00000006Bx7-4AsR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 09:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=; b=dE2zz4DaxZHfYSbSKKRFWI+NHE
	ih1eYtlOo8co6LwZbXtYUuGuDT9pzdiio1AipF4O8skR+Vi+85fM29ILo4IjQ+whOhRxgwDiNjw+a
	5i+Ioqvoi+esH5hsZBvhRo7AAeV9FyOkX96Dgw1rhVZQYPfAlvzdOnpm+sT6LmJbTLey4+f1KHicj
	pkG/2WrTPpj11vOjvy4E1fk2H0A1KaU5baqNntAxxoZoZDy06o+GpKgKEiPD+lRYSKI6fl5L9W06G
	UBsXQRGmO69dKGFcJ9D8Yu4/xenLzVw+MK1Wx+qp9GWqXLBgKLRgIwqfTfXq99ZYQc4S97R+bbMim
	9yDfT04g==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Hw-00000007tJA-2eJY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:00:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82cf83bf375so1940830b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 01:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775552398; cv=none;
        d=google.com; s=arc-20240605;
        b=f2lKqV9UBFYKp+57eidBus1AteEGENCEHiltQT3FCy6MdG5g8dYQrPshWdepXuCFQz
         hyAk0l+QQ7eGYVl0OElOvYPYe0PYLrt9yfr3E7ociGJubDktDpiNV/HF2hEEmhzeL+fS
         wyhc00Avy/JvyaGL8ouNwnioScJExxnZWtJ/4XZaSVTrfICgo+uxtjdGUAYzbXtQYHEM
         7GWLawVibhqYpTGDikJWoSQaPEz9wtnkfW7YR13E6ZKuvNf31PNS1Y5JbBc8VWAnE9Hv
         pxWslQ1PidJTnloPIdOLH+BkcZq4iIMFkzKS8ANl3dntm5+ljbGNoBAVEJEghy0PTg0r
         6aXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=;
        fh=FgpzMPrT1VEt6Jbo4pQvqzPf+x/+GEPCzBo8dCI8uTg=;
        b=J7lHNnSqnHuTM3ZLjHzst9ZLqjXV4JhxTwliTFvCwhthRkd5tLySAdoU+Zjv/FM/4t
         VN7fRpTQNqy5RA7iGu5fMwBYB6pZ5DDjxG866KUQibcZGPegFt/rdMAsXvo6u/ldRSP5
         xMQGBKhfFrZm8rWfTcxbkwOAfEpOgDxYNNEb6UR9EGJvan6jt3NDeRUJRsWylTFeJdBB
         NGvdmHNzADCUoFx4l00K/odzmjJD+cpJ2Re4dPNkB7NiApcQtfdq+MzLqBNXtDTpUw4c
         tJzQKRTVGjOYf8ABKzDXkocWRBlubcX/vNEO+XlbD1Aw2+FAW1IJQTrvxNpHOx9IZQ3K
         Yngg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775552398; x=1776157198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=;
        b=kSbK6Vw5G0i362ehpZCqUquB664kFO2qPLGHm95c6LTSBcS/BT8eAAhwMbcuFK15nX
         bCSGB3GfQDVRRRMzDUwsFRl8rtQWp7rMu7jfFOsnaRcbMl8Fh/BI/3WA+zPsdjFdaodu
         cB9xRV1PnsGR1dyL8isPTPfeKwq3OKnfA9s4UDQ3ahONBuslDLvNPjuHZmERzpRjRaXR
         /X8jUql/FPRw9yghxeACxTEWpEBqnYqsgjitEatAP/4sc/3veuOf1cakwtNyHfuQuEQT
         /jbVeydX2ceXslj/V23w31WTHoE2okBWUOWedWuKS07I4fAmFGRLhwx+ZDp3CnnfSXTz
         SmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552398; x=1776157198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=;
        b=W3s1sKc3OWhYk2xRgDFzJ+4NuIQ4uPhX/U8mxO6uikFvXvLzE31wS8utxnAL2Qi4Vl
         KdS5JreUYJpyC0blJFsSoCtR/YyQiCfbaI4BfUfo+pujtpngBgMvrS8H0O/1zzu5fR8A
         9V9SuOFSwMAnxDyQ/UHJWg2iQNJA2eYuABehg/K168UbONKrexstElS8YHuf0kRBeAEl
         jChusYF0d/3DIrd0eah09H5HI6vymJboivUG3zLAfTXgI/2JIOfyeNi0adnttj99N93i
         CabG0YK1IVlTs0527wNBoe9FpcT20OWRui1Mx+YFHkRK4KKgcV5l7vWSBlJdNSejH7X/
         HnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcxleU/o3NnjCo5CoAfUdf652NEbalB8cJyRw1gQlSwsOuS8xmEkVGDBYh0VlhzAXMg+LA5dTuvq0luZLba6B8@lists.infradead.org
X-Gm-Message-State: AOJu0YxqUCVRguOkhrw/nPvS68JvsHTsP8z7x6r791p0/d5EUuqWyef1
	066GiETD2LeQ+UuM90k3iwxKz3PQShgn3VQiAN1riNYhF2FWPp65B6DuyyNtAIyJDuBvx+NSNB4
	8cbEp5IHZmWoUq1gfHrKdUY6I8tV5hFg=
X-Gm-Gg: AeBDietzN91d5CobsyYRnM6oOHmR4fEyvc/ZjXZGRYd3nUAON2BBq/vFesgnBDZZyL9
	yr7AADPXW+g3oDy+CIr3Ox91qaeOAiwtNyblmmK9cIehBAtWQ60jiK8Fs9TF+m3HX6emHk/8P1h
	CYxjQjyJiMecjVIOxrXCdL5B/HEHnzXxOv9hHclWf4P0/oB2TMuM1A3tRw+OTnguATQRVhTr/mb
	JSOgGFko1BYkO4CkwL6NiRptTnJ60VZZPf4uqncpkV5m1E1/0aojJLi9KXzk5WTWGpYLjn5FReG
	/2iYLYM=
X-Received: by 2002:a05:6a20:7d9c:b0:39b:f750:a6f5 with SMTP id
 adf61e73a8af0-39f2f096af1mr16119897637.51.1775552398252; Tue, 07 Apr 2026
 01:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260407032755.2758049-1-shengjiu.wang@nxp.com> <6r7ih7wz7xn44c7c2ukohy3fgp3tpo222jh7ocxacccrvywz3i@mddoznil6way>
In-Reply-To: <6r7ih7wz7xn44c7c2ukohy3fgp3tpo222jh7ocxacccrvywz3i@mddoznil6way>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Apr 2026 16:59:46 +0800
X-Gm-Features: AQROBzBBoCuAnujBQ031UhhobhyiC_USVqwzk7ad0Ee4NBRI7paALb3klLHUGi8
Message-ID: <CAA+D8AONNCbbH_GLgc80+ac_ozbLUpYv5HWG3VsOYaYeSoEh8w@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: imx-sdma: Refine spba bus searching in probe
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, Frank.Li@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_100000_775876_008E359C 
X-CRM114-Status: GOOD (  30.89  )
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

On Tue, Apr 7, 2026 at 4:31=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-04-07, Shengjiu Wang wrote:
> > There are multi spba-busses for i.MX8M* platforms, if only search for
> > the first spba-bus in DT, the found spba-bus may not the real bus of
> > audio devices, which cause issue for sdma p2p case, as the sdma p2p
> > script presently does not deal with the transactions involving two devi=
ces
> > connected to the AIPS bus.
> >
> > Search the SDMA parent node first, which should be the AIPS bus, then
> > search the child node whose compatible string is spba-bus under that AI=
PS
> > bus for the above multi spba-busses case.
>
> Sorry but I've to NACK this, I already fixed it in a more robust way by
> checking the consumer sdma node.
>

I think you refer to this one:
https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/10618=
24.html

I tested it,  but there is an issue. I replied to that thread, not
sure you received my message.

> +static int sdma_config_spba_slave(struct dma_chan *chan)
> +{
> +       struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> +       struct device_node *spba_bus;
> +       struct resource spba_res;
> +       int ret;
> +
> +       spba_bus =3D of_get_parent(chan->slave->of_node);
With asrc p2p case, the chan is requested by __dma_request_channel(),
that the chan->slave =3D NULL, Then there will be a kernel dump here.

That's the reason I sent this fix.  But if you can fix the above
issue, I am ok to drop
my fix.  or could you review my fix?, which is simpler.

Best regards
Shengjiu Wang

> Regards,
>   Marco
>
>
> > Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support=
")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - add fixes tag
> > - use __free(device_node) for auto release.
> >
> >  drivers/dma/imx-sdma.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index 3d527883776b..36368835a845 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2364,7 +2364,9 @@ static int sdma_probe(struct platform_device *pde=
v)
> >                       return dev_err_probe(&pdev->dev, ret,
> >                                            "failed to register controll=
er\n");
> >
> > -             spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl,spb=
a-bus");
> > +             struct device_node *sdma_parent_np __free(device_node) =
=3D of_get_parent(np);
> > +
> > +             spba_bus =3D of_get_compatible_child(sdma_parent_np, "fsl=
,spba-bus");
> >               ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> >               if (!ret) {
> >                       sdma->spba_start_addr =3D spba_res.start;
> > --
> > 2.34.1
> >
> >
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    =
|
>

