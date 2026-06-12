Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D88CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=; b=rKqhHtJTgylRSf3Tp82oveyrHs
	sk86N22wknu8VU3yfLB2FNPVcRRIRlXGUzNnB28go0V7/iDz+QUrXxRm+DF0ikNztjkg/gdo4Cmst
	jjfbNORA7N1e9/uBkf/ij6J3OjkQ22VF7Q584jai8SUmq+cpY6HXqeofWYQf+RYkouQo9X69KhbLx
	LjpArGApSKY6DDlaWewsJKmLBkPYRI6I9kT8qmNJ4C0YArVZo3jHv/Qke8WViWULmSyoaSdqQSmLq
	0ZE4ohBh4jGyyuH+IzixKOMxbczhr83FCAHNLAFhfK7qAkI3Z6ONROy9S5xAkvnQa3sJ1u2M9Ja53
	NbJ+MBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvz3-0000000ASH3-0Qo8;
	Fri, 12 Jun 2026 07:07:17 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvz0-0000000ASGK-1gpu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:07:15 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7e2f3646c10so6960537b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248033; cv=none;
        d=google.com; s=arc-20240605;
        b=YIinhjBMZI/5K445eg454Tg8wFCn1HRMRsuM8P5l6CxaGRK8MCe/WzjoEHIkAEehns
         2RB79H5jwhioeeO+lCrs/5QGL5nbIes+u0oYHHkDPjyjyk+VBxShdgVf22dpIc1E+zsa
         Qg2eI7738Bv1p1GI1tp5C2Qtq43VTvzqRGt7/s9I9Svj7f/FoqS187biKh7zb+WTCCOf
         a7DUt0bDY2D6t8S2l5hyRevT4u6EB/PIoJxaKHM9yodt1SrYaVGZlWM3tbOAS9uoGCuy
         dx8mYOaslTVEOU8uTUAdQ4f9KWJFoNERDYr9NBf7G+e+3+5/DXJ69jAnAzCsR23TdRo6
         kSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        fh=HsRrYrGBk1SduFj8z6Cqz731IUK8MPDCE9uT8zFg/88=;
        b=ewWDptWe1QrAfGKjQ5SpebEQ+pHF071E/uX3g8ZM/rsqssVLFjmtnTRM5I3STSi6e3
         cnOec7hjbHqGNksrtafpfbYbtz8cIFuKgsLQzkhvTLhU21x3zC3bbbkQy2JmqKNTnS/L
         jwJzUSLmIU6/UTKBDQG5n2h8jNHAoCbyPNixx2yeUXc6tynxmJoorsUawgUBGdGd90m8
         94oG68f20NcI3wUDuiuPhpT/odhPTTjXrDpnWn6ASLvzrgfRUYGHzNhggucY78XpkPSI
         yhlIOxUE9QpW1J4f+YfUFzjWxmRQhgOsrxUCeMuNgXoGuzxm+vGQzHieHZI0Jw9njmM5
         Rhqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248033; x=1781852833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=LfsvN5oNXJpNjEehIsrgjqj9hvM8V0z3ez6/6d3eFcGkF2EOhOsOCNNJypuxfBejwO
         OZU3kH2uQfoaRfLRZ8/l74gQ1Sk7i//hMqtL/r1H391EZTQ2uWCdqDaldDifhR5bo8Jz
         a+LPVGJ9hcSSmA3MN2V+EdmrR1I49NwRJ74hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248033; x=1781852833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=sB0ijsaxecO9tFc0pc4WGp0Y03bmQtt+py7SyJpmi4TLZPKuKorwIPCOqrUA7v72UN
         I/tQTAC/LziJ7h6GWv/iexVjQllOmzWB2QJMDWfi8TJaTSOydA+z0W0xgz7H+pbedWJv
         o4ucr/213qwNffUQyMP7Zs544Q2AR3y6gdh4x6H1gg1Uy9GO6Zlv1RRpeRC0X+sq218O
         3b0FeRErFbZBko1QBQ+P5N9q94j6zwlU4QQGM32OkCleBLwTOeDEAW3Zf5sb1X7eYHY8
         D9jD6IHvKXs3td+c3/o2Hj2HmHtMrRHisjR+WCa+M8F7URTbvNivSlxQalNpjcLqZQIh
         V5/g==
X-Forwarded-Encrypted: i=1; AFNElJ9J08pbSPeq1qfeK6FJuMruEW1fCNewBSaSsoPwiUYxsHqsB4uWq8PjETwIV3AW9QJkSC/6NfymMLatMrHgg/AX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cGV4HeWtIRXvUFv79d6Zfq1OX2d0Y9IkRN2rH3G+8LabkR2P
	GFQpUW8O8LyK75AixQmDgjc8gAk2APq/YmRos8VDF7Cf7HUXPBuVTMrxv98L01JHye53ZNXWwPC
	Rt0oz0TTs/CNtiL4L3esqEC0ejoif146Jv2qqdu5C
X-Gm-Gg: Acq92OHl5HMVVTPrXLRb4H9Dbp6SnLu4u5XIM8JQRzlLYsvoNS6TzOE5THyZIWK6tzc
	odaOalID4syseznB/uiGX2daKgPSR0sqWXzehuLReeCBoCTxZW9Wi7Y06ulCE9mVhlRcxDNotEP
	2vAfAZ5Flx9jk5+Ugij3lpLwCYrUTvAdq/32jiw0I7wdA7OpCWsh0GhxjcdWAM2QnGno0mdJSJd
	RDAaxo7rbGDqYleGIB4SZ+HiLUQcSDZBvd1/3ghU6TdPPrWNtxmWJKpD11nRFiYqIH4Bui8IMM2
	PcZijLeZ
X-Received: by 2002:a05:690c:e3d1:b0:7d2:6b8:6e4a with SMTP id
 00721157ae682-7f7b6448b2bmr14221767b3.18.1781248032935; Fri, 12 Jun 2026
 00:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
 <ailtMyYhbkOgaZWw@ashevche-desk.local>
In-Reply-To: <ailtMyYhbkOgaZWw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:07:02 +0900
X-Gm-Features: AVVi8Cewi0jX5G3AwANJfv_JfU8wtj5jI6ryJrZRjeBtUWWvLVEyokylnfzsf8o
Message-ID: <CAGXv+5EZp0KvTqMde9da9mUWJyg+6X6Eon9Sqxx0VbikfVr8fw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
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
X-CRM114-CacheID: sfid-20260612_000714_480481_9E4D50DD 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Jun 10, 2026 at 10:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:35PM +0800, Chen-Yu Tsai wrote:
> > In some cases the driver needs a reference to the port firmware node.
> > Once such case is the upcoming USB power sequencing integration. The
> > USB hub port is tied to the corresponding port firmware node if it
> > exists.
> >
> > Provide a helper for this.
>
> Okay, if it's really needed.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +/**
> > + * fwnode_graph_get_port_by_id - get the port matching a given id
> > + * @fwnode: parent fwnode_handle containing the graph
> > + * @id: id of the port
> > + *
> > + * Return: A 'port' firmware node pointer with refcount incremented.
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer.
>
> Note, the Return section must be last one in the kernel-doc. The last par=
agraph
> sounds to me as a better fit for main description. Basically check how ot=
her
> kernel-doc(s) in this file are organised and follow that pattern.

Will fix. I likely just copied it from the nearest function which happened
to not have a Return section. I did a quick look through and it seems many
of them are missing this.

ChenYu

