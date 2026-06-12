Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDA0CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=; b=vbXlbAPT9YmgLB9rpB8r83n6UG
	VNi89B13E/p9BmvdWhLl3UJ6yguFvhI0JvldlEA6EWUfLq5xC7k8YikRjhCNLEETuWAphX9SEig9X
	FpC8xmlCNMa9IoDLKJ1Vu87xEokBqQK09AB9VRVC6p2umjvVkPwCxPKsUg+l+1QFNRmWlVbTPkNpl
	45fniZ4A5MIIg6U8VWbVBTEmQHrNwasuERnP323ZF5yXEWYC+msKCpW7NzFD1E2vEqDgilf8gxSyE
	MLHXodevvo59Dffkb+IRnUEOxBd0PWO1/sd6FB1OFCT2APmkvG3RhGvmkyI1y/BWuVp/1rJ/kaOnd
	VylOZEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwBt-0000000ASoC-44VC;
	Fri, 12 Jun 2026 07:20:33 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwBr-0000000ASnG-1I0R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:20:33 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7dfceeaf168so7279117b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248830; cv=none;
        d=google.com; s=arc-20240605;
        b=AW682sKXkeShRTEzyhXwOsEU62S6JFpsLR+dHZ/TeWuFCsO6HbljTear/6W6lOD+DJ
         AA9By2udq8NHpDUBwojF6Wl76GiH7I53LJSPAV7BJQQPPGlPq6EK9VksLrGCCpq4MoaD
         BYW8QgGjnCiE+5qusr92NN61CtYokSIFmL+sup3VUlJIOsTtW4XoEa028zoo7dzuiGYM
         1CtCfEGgygMoYqCrZ+TP2MxfVu7rD8nGtQBF+ZEoaItPsVyzgi5tKpfwBaOr1AcvkdCh
         sj88MFOrVfZUEXCXQK+pEs5SoLKZdxhuRbYP4CIW1V9FF58QZHzwUnlubrtbyiI3DT6x
         j6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        fh=JVRD4jmtBykUlXFMIWD2c9UQKavpLlDC8MlqYeWN350=;
        b=YaJfvit69w/t2ZaFCQU+Dqa21ozQHTgRunVHsxT6sFk24xfwQzwJj0w75EjxqxBOOp
         NE70J312NiukE93l85H6egCVwCPbNOhEGhPCbIBlyUOTc7yKVZyGyZBwrjlEOyjEIBRS
         ni1HeuyDVsFhcTBrUEvbsaK4pXMYOVkQtqXuV4ElQkMfKSjWAFG/h7abhWPit2xuHslY
         UZ6rg5USzNyWA2vRTqhEHEFKaFEevMON68YC0ETECM2Hi2Hsssqq3Y78kHWlFfbgbmht
         hc5tHzgREEbU9U6YJNQ8RnjuH/Ye9TIzEx5MO+zgYwVqKxkMoXbthJ+qKm1ahTk9IeZC
         c2sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248830; x=1781853630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=J7ADuSC+g2eYlfBQtkOd+1zwPOXJmZTlllVqUcwc55FB2/hd1uUB4kzJHiqhLtWkmd
         xqM8ga/Mgd+knML9G5/+8utiWAnUB2ehM/VYnfpbNMaqexPJYuWifITGBIKpmX4Q9C7e
         njLnsA3tWGm7MOJHXnVFvf/1WMcvdQm3qsXGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248830; x=1781853630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=UY3i2UDcqtDBRsfl32XhY2FnhtZRXF9GQ8WIV2Av6ZEsPjl+VFb7c6Cl6oPuY6Myxm
         O76azluZJY5LXLOVOSiCvHU7INwHgkVd7LNxCIU+YRHh8mlTnYC/GY1Cb3nVZEvPELgu
         8vsHUY0OSH+SqGrxHDLqSBGdiX2sm6mlTT3dm5dkv8me5wz0cdFuf1HZyZXw+XdrjsTf
         aGk0biNWm4SNilVrhXPs+WeEMiZdXaCKNhqj3cO04/vzXUatytfoXXAB7iSyHjwskOTq
         ZDgX52j/ri6SMFhgNCeAz7j+M1XFmCuO64NUfflDF8yKaiqOzAQDwN+GCzwpBmC9p9d7
         BFpw==
X-Forwarded-Encrypted: i=1; AFNElJ8PjiSlNCEx8u4hqbnvjKxA5qgoy8J2gjjUvf6dOT/MP+2PB/Oo8uU3wQfoMeWRgDRsmwvYs/+4DnQDj/WsD3X4@lists.infradead.org
X-Gm-Message-State: AOJu0YwRFugf1br5tEWF959vCfy1jrKZyoQMdW5XRnZDGtq+QgIrr+ex
	Nh/bPiUpnR9kJgUd2Du4VWaALE0nr9gwYmmJR6sZPB1/na+WNhK9zB3I0n7kN5i+UvJr8F/AvL7
	cIZD6KLvZ0JrErqG/egxEqI4GECaJk346nreh/2kO
X-Gm-Gg: Acq92OGYlqkJrygsaJEztnf6UWTNhZ/cHC48hha9ZcMTz7FrfUNqnN0uuDSrrNXl1oa
	raRxdN7fKhXJ0Pw/DilBwGXVKWh5uBYLknF7qxyWROAMUbc57bASQ+Ug3eX05hHO47jvQVt5rZ3
	KPiwNMA5aaSttjxNRMKSOOfxFqKwH4ze+epUc+yK542KHJ+7RS6aEzWbqiSn2roaWey+gmlp9Ak
	26fvZqkDW+eg36Hcj3doJdzDepDBBx5l2suFaeFAhUYiacRuOe1BD791M9D2rg3WAOsylknPZGt
	ONECse4h
X-Received: by 2002:a05:690c:c4ce:b0:7ef:81dc:c0e7 with SMTP id
 00721157ae682-7f7b6242881mr15277067b3.19.1781248829675; Fri, 12 Jun 2026
 00:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
In-Reply-To: <ailv8HpnrCH3Zb8C@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:20:18 +0900
X-Gm-Features: AVVi8Cfix6rlRxpmlL_G61si3smqjEz2qk3oIH1X9DTqc3HutmT3uL6lEMZg0_I
Message-ID: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20260612_002031_400018_0E4D430D 
X-CRM114-Status: GOOD (  28.42  )
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

On Wed, Jun 10, 2026 at 11:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> > Due to design constraints of the power sequencing API, the consumer
> > must first be sure that the other side is actually a provider, or it
> > will continually get -EPROBE_DEFER when requesting the power
> > sequencing descriptor.
> >
> > In the upcoming USB power sequencing integration, the USB hub driver
> > first needs to check whether a graph connection exists, and whether
> > the other side of the connection is a supported connector type. The
> > USB port is tied to a "port" firmware node, and this new helper will
> > be used to get the endpoint under the known "port" firmware node.
>
> ...
>
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
>
> Yeah, you see, even here is inconsistency with previously added kernel-do=
c.
>
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     struct fwnode_handle *ep;
>
> Unused?
>
> > +     while (1) {
>
> This is usually harder to read and follow. It's like "pay much attention =
on
> the code", but here no rocket science, no code to really pay attention to=
.
>
> > +             prev =3D fwnode_get_next_child_node(port, prev);
> > +             if (!prev)
> > +                     break;
> > +
> > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > +                      "non endpoint node is used (%pfw)", prev))
> > +                     continue;
> > +
> > +             break;
> > +     }
> > +
> > +     return prev;
> > +}
>
> So, this can be rewritten as
>
>         ep =3D prev;
>         do {
>                 ep =3D fwnode_get_next_child_node(port, ep);
>                 if (fwnode_name_eq(ep, "endpoint"))
>                         break;
>
>                 WARN_ON(ep, ...);
>         } while (ep);
>
>         return ep;
>
> But also big question why? to WARN*(). There is no use in the entire
> property.c.

Will drop. This function was lifted from drivers/of/property.c then
adapted to the fwnode APIs, so it still has the structure of its
origin. With the WARN() gone, rewriting it as do {} while() becomes:

do {
        prev =3D fwnode_get_next_child_node(port, prev);
        if (prev && fwnode_name_eq(prev, "endpoint"))
                break;
} while (prev);

return prev;


Thanks
ChenYu

