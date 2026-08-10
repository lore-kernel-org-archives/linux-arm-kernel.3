Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DDBC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=; b=H9ZOmG+u0VnR1MjLCoKAG0XjD7
	mFPIm/6MRwaKiA5X7b+0i0PyGBknJdvI3AcZdGH94qJ5xzPrIDzMHP4eMLdT6wznS5LOO41mgxOdy
	s6OgrKwq/7ByWb7c6W58yh+blB6KyfVlSTWwJcBgp53h29rZaYrcbDKdKWUkMfQJ4zItUhVWE6fhv
	0a2fT3ZJs4URXwY3SfbKXZMtepKq9+1jfcx2TRtW7m25xgH8q2ZPu8BZFmRoHqd0Mq626qF6Yqow1
	/h6AF6Sd0fMO6GFZQ7sWVRN1hCUt6jLt0B0ZUPqG50g8XlS8mN4bHWWpQMu6AeA0tQLCo5oGPJYPR
	tSj5N/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNJw-0000000BWFB-0I3l;
	Mon, 10 Aug 2026 10:33:28 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNJt-0000000BWEB-2oLC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:33:26 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6682259cb3dso3036228d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 03:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358004; cv=none;
        d=google.com; s=arc-20260327;
        b=OabcR2KQUYgUQry3h3e0/56V784yF4qk7oIdhaFbEMQPgqm+g4Ik9cOmMXNqjbERhA
         2V/Y5esyHtzg06SO+ktRWyf+fdw9kZ5kDPhsImUtmMbvOoyrMw4ziqMSWEqga8UaFw9n
         1Cm06KKkC/Su8VMYH5Hi4TuPTP9MCkq90WND/u60ulw0rmsb/srAwoGCxFVXYw3kV0dv
         WxZccwBJUBx9wC+swRUXqRDfuSRmh42Wd/g8fLkzwmoeqzsCnNImbRM8pHTeAf/eVVC/
         SysKkTCHzvJwKGrPoDfyRwyx+aWgf0C55aMTKPuL4jKwmTVmcSon73s/uio8BkmZknfl
         AZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        fh=6EB8DPa07+PSjD2kGTEBlqD14EtqBv5SM8Z3bBFq71o=;
        b=cf8ruBXAKnNrnyvZDuZOgfvI+FhlI3xwDQ+TaNGxkcvuZEzzd7F1c1BlHhZPdjb6vi
         SRx1zUbwuUkMHv6YzMGnqljIYOKB/PQ0DvahtyzVign5Qi0BWncD+mQ8HBQsOSY5wPEC
         a2OzPmhgLZlzmNjOYseN1hhn7Yx6xBWX1LxIJickJh9EA8xSZXLeur3u9NycrYckoPpu
         /WXO67CWvBUkx3tG7k8y0cRKmtY8Wfv5jveYaJN7BQ9p5gnxW3DaSuXMDwFLscIihhjc
         sGwDJnCuInAOCk6qs7CY8z1KjvldfM9Q/0/M8GUUODqlDiBx+jToy7BszEfxuGZIlQxZ
         vUTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786358004; x=1786962804; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        b=dmdHdV/iZFRsi/tCulajiCdcdjfBYOeKdlQg1esmuiRv0Y7XgZJhLgwm7TzVSRzsQ5
         FOHenhItgV9j/C9X7LRp8zIRicmYtXegddeema5n3jPVTtxf502qKpDSeiEumvb0TjqW
         Pk3v7XJ+uOKihSNXz68BGpJOxQQTEaytdpcRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358004; x=1786962804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        b=awqRC1Q/xa4muQuStWUnGyLJgTg//3EK7wiQCnyqfuCksGgiTwFP/CBn8Kl9iQqdUm
         CkkNfikRYTVIBpeDoxShs1cuNXmt4zdBgsVqlLSCbQelJFZOrEdxlEWLooXrkZL+pXFz
         miThFDeM8F9XDdUhMLTxqBVht5TQpCSMS03fOyK+U+kjjiVdcn26akFLqvJJjq2pPXKF
         QcC1j5jwVscl4vF9JhDgDOpyDJdFDan+LuSk53fTrhSneSoANyKfeyHhsLegH5P011ak
         p+iXv4XfRfhiUAcK0zBSARuh6FhNIrf6tSpdQW18ht7ZXgDK1hIoak0mYgx5K726JJtH
         NXSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUKGtGmLn1Z7SwGuwynrBH1GPpWwqu7C8W9XflMcaZs4ZkYGDKkRfv7YdujWR9LOJfwBx8q9IGfzaF+AJOkyQK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4/Mi46SdyCcefOtC/+Isalt9Wee65eE31A6dAdPXArUCEbHkZ
	wgIuMpYwawbjbgwO3TIld+nlL92YoGk7vCCneHG7r4wux9yh/TJ+10Tl5PhvQRMyZaXg94fA05O
	zBO1r9yJIScgIYxgy72c+sbLi2hDNI4S5zGw30vbb
X-Gm-Gg: AR+sD115voDmk2uwBdptJvh18j66BVMNayYJArLFhhfcX65iXOKdG60Mx7DSJJndQIx
	rivUkxGcMFEe/ACxAb8wjtyqkl3h03SzLI+J5SUG5+zupu0QlMAmRBxlA6YE64k59aLAts4VexK
	PGaXj5iqqccTc5DQJYLak0s8wYxTPlw9jIVxsypypwZjRZ2HQ7aHQGi5z5YbLwUEO5h62Tp1fg2
	hHCgf09MN5YNDdBK8Z1X8rOntmtHU3+HqY04a+llcKX89Dip65Nc7dyhz3OOO/gMMN2IB1kd82q
	VbSH6d0wE27Dcuw/8+YrXvbrdTZE6NY7wXIFJLfYxgW7WZxu8s9XbX6xK6bNizLZloIsYZcjZo4
	=
X-Received: by 2002:a05:690e:244b:b0:667:ef7f:c37e with SMTP id
 956f58d0204a3-66ada8434d8mr7210260d50.8.1786358003849; Mon, 10 Aug 2026
 03:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas>
In-Reply-To: <20260807152059.GA39821@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 10 Aug 2026 18:33:12 +0800
X-Gm-Features: AUfX_mxe5L1RZVyMRQ0Vt-LD7TRaHThgwqJqmmrQKlLCig1wrp3paWSMXqZXYyM
Message-ID: <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_033325_715252_0B9907E7 
X-CRM114-Status: GOOD (  30.46  )
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

On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@g=
mail.com> wrote:
> > > This small series introduce support for 2-lanes mode for Airoha AN758=
1
> >
> > Just a nitpick, but I would probably name this something else, like
> > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > has 2x lanes as a standard feature, so this naming is a bit confusing.
> > It's not like dual-LVDS display in which LVDS is only a single lane.
>
> I suggested the "2-lane" and "x2" terminology because I assumed the
> result is what the PCIe spec would describe as a "x2 Link" consisting
> of two Lanes.
>
> If that's not the case, maybe "cross-controller lane-bonding mode" or
> "lane stealing" would be more accurate, but I don't know what those
> mean, so if we use them I would also like to know what the result
> looks like in standard PCIe terms.

Benjamin pointed out later in the thread that it is just bifurcation.

I would assume "PCIe bifurcation" is a standard term, so maybe we could
call this "Support un-bifurcated 2-lane operation"?

On the implementation side, having to reach into the second PCIe controller
is a bit messy :(


ChenYu

> > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > normally attached to this SoC that require a 2-line PCIe card to
> > > correctly work (and give the proper performance)
> > >
> > > The first 2 patch address a limitation of the PCIe implementation
> > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > all at the same time (for all the 3 PCIe card) with PCIe
> > > enable and disable.
> > > The 2 patch address this and introduce correct reset to control
> > > reset line for the relevant PCIe line.
> > >
> > > The last 2 patch add additional logic and support to assert
> > > and deassert the PERSTOUT and also apply the required configuration
> > > for 2-lanes mode.
> > >
> > > 2-lanes mode is implemented in DT by adding the required property
> > > and by defining the "num-lanes" to 2.

