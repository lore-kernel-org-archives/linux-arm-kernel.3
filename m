Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28671C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=; b=oBwSJYijBA+5NqtN5OEg1EgSYA
	su0HVfH4J6ec0c6UqarNR6Dl1DcW9bkfQWkn7/p1CPPlZQMouWWsFGVUF9Bk18qDCZKhszmu3rZ0g
	nRz9aQuE89TNlX4dgYf8w3Dt4OyETzrtI4+8zYSg3Hwa7yZBpCshgCxr0EpPRJd51NcKkt9FxE8DO
	rNi2775UI/jqs5jXr46latRdMIBKh7KHEB27/RRaoInyRmOFoUNhxFo1pmvWRv5kR12t5ZJe6Vh4V
	FeRGJBnFxoZwE2Dz1/uC85sqk2ngTpyDOoFmxVoC93M2zwQqjtdtR3BekDUauBvadz39wjJt6Gn1x
	1LAeI12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclfU-0000000Ckky-1kTL;
	Fri, 18 Jul 2025 14:02:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclT5-0000000CjLh-1YFD;
	Fri, 18 Jul 2025 13:49:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45611a6a706so10910765e9.1;
        Fri, 18 Jul 2025 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752846581; x=1753451381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
        b=LMOvCSlMR+xVAmI60GhW1j0Vk7ImGEWjc9q5ulxeSvbhmdr0lQOcQ9vqG9YOxZjhxB
         a1IKkUWfD4xFuHLNS8fPqWPIbG6vPO+afTwPIeY2IlqkbI2Y8XcuOqxuCIeBnjDG2jFH
         1FLVCgQ122yUn/L4MTRPnVKZG5i1EaPcTrLe2NLOHHQqJAlzFZQpxBHcuGcK6ZX3tdMr
         9/o0hcrqZU/mSBDsPsSqXPRMd4nnSyp7N8QYdAnfbvzdEdz9dk5uJyYojlgYc198TsTz
         0bEfoSlNRcl2bOnSHlFdKvfQX+z34KFG++WGASwkTnQQsFYou2R0mWQCw5/oWkWgzn3t
         br2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846581; x=1753451381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
        b=sqg9QgKNm6sNe/z2yTSKCX0+MI/yGT3qar5XXf4PFxOD+Uf8/a/8Pj4rxXEzvpz344
         +/Po6Hk/Esvd63gDUTGtT6ZKdH5tVA+1acVccQXjRmnBOK3cJ8tg6/EjB2LyN3pKxzoB
         7tfXPF2y8zD0tPo0GADUXX5+HawWxiMXXG+WZOzQpFOChpmx7kTeeNE/YAIEG4cyGYF8
         BGdeBzu3Ga4DuBdlXi30CT2ZLPmLEBrWfMn9AqA9/F3HInXGcCQI8LqIOfqnichGqpTl
         nfz+KrlXjRm82i1h5TMVSjHNwZ3fyWurhrQKxzv/feMh4uRCTHw5hzEDs1NiQuJlBQF5
         dDNA==
X-Forwarded-Encrypted: i=1; AJvYcCUth8kqrEM9O7RAy1r+WWb63TksjqrYjfhRhDJoO84fqrH2lDuc4y5pZCBfmRzoQMMGMtg16A+b8jhP4dg=@lists.infradead.org, AJvYcCXNiVLEhZFmIWbfQhK669D6NuI9lGsLZ/EjudOe6kGkwvd4964Z+GLKeqoqwiqrwSEWUNJa5adyPcxTIWnqBZgU@lists.infradead.org
X-Gm-Message-State: AOJu0YyuNzPhnlFW/RZ6kMU1PkU5cQg8f6RkN1v7mx5F1OTI0r88gmb9
	FCgPqKSR4fPDYSK4QOA1eav4P0HSEndL3tgxdarEzV0kZrIUaae9nheT
X-Gm-Gg: ASbGncs30y/jWI1PiNQ9ahP8GnCrBz13kUtP5cJFcUXnDH8eTNweXUvc4xfJAsPY7Xl
	hBlMkmBNL9uuCLCUZgigPb55I8vPn/ctFKK6ya5xsfPeH1KpeT+3VqqL9qpW3zxj/jn3dRhMyHh
	NkDiizbdQf5oWA8IfdXEukYzdvmXySFNO3s1kD2OPA5da4wX6GQYmGwDrBiSonKyolC7fegiKz4
	AqPbD8RbIcNQcP9feMwK25tprFr+thrfEbJ7YUfFowqe4lHqRKGIPosybRwRbL/fOG6E34YkbHt
	/Vdq0vMUTtr37ALDgfMEkX6H0TNyeGscCZNOpo6iwcX3kdKUS2G9zgSo8T9wze1S+dgcoLCKbOl
	RPbx5IQX8+Y7bdGFTXzkYSQDoW4566zNrGJfw3jLbG1IiC4m9dWGt9u7N9Cr0t1fzGNiRHby+fh
	4dj341WXnT
X-Google-Smtp-Source: AGHT+IHffGdFSHvYOR3y1R1hMWHllBX1SeAON/ZoD7Ch8x5l+0sSh2Ktls2hMGgkwYE+UWSbANbmhg==
X-Received: by 2002:a05:600c:4e02:b0:456:201a:99f with SMTP id 5b1f17b1804b1-4562e373d4fmr108407665e9.18.1752846581084;
        Fri, 18 Jul 2025 06:49:41 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45626cde7aasm62335145e9.1.2025.07.18.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:49:39 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:49:37 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzuw4l5ej7k2fa3p"
Content-Disposition: inline
In-Reply-To: <2025071716-phoney-object-1648@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_064943_416777_C63AB43D 
X-CRM114-Status: GOOD (  38.65  )
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


--xzuw4l5ej7k2fa3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > Something that's been bugging me over the years is how some drivers have
> > had to adopt file-scoped variables to pass data into something like the
> > syscore operations. This is often harmless, but usually leads to drivers
> > not being able to deal with multiple instances, or additional frameworks
> > or data structures needing to be created to handle multiple instances.
> >=20
> > This series proposes to "objectify" struct syscore_ops by passing a
> > pointer to struct syscore_ops to the syscore callbacks. Implementations
> > of these callbacks can then make use of container_of() to get access to
> > contextual data that struct syscore_ops was embedded in. This elegantly
> > avoids the need for file-scoped, singleton variables, by tying syscore
> > to individual instances.
> >=20
> > Patch 1 contains the bulk of these changes. It's fairly intrusive
> > because it does the conversion of the function signature all in one
> > patch. An alternative would've been to introduce new callbacks such that
> > these changes could be staged in. However, the amount of changes here
> > are not quite numerous enough to justify that, in my opinion, and
> > syscore isn't very frequently used, so the risk of another user getting
> > added while this is merged is rather small. All in all I think merging
> > this in one go is the simplest way.
>=20
> All at once is good, I like the idea, but:
>=20
> > Patches 2-7 are conversions of some existing drivers to take advantage
> > of this new parameter and tie the code to per-instance data.
>=20
> That's great, but none of these conversions actually get rid of the
> global structure, so what actually was helped here other than the churn
> of this "potentially" allowing the global data variables from being
> removed in the future?
>=20
> So how does this actually help?

Thanks for pointing this out and letting me look at it again. Most of
these actually do get rid of the global data variables. The MIPS patch
doesn't because I forgot, but the __alchemy_pci_ctx is no longer used
after the patch (except where it's initialized to the ctx variable, but
that's no longer needed now). I've updated that patch.

The Ingenic TCU patch gets rid of it, and so do the clk/mvebu and
irq-imx-gpcv2 patches. The two exceptions where it wasn't possible to
get rid of the global data variables are mvebu-mbus and Tegra PMC, in
both cases because there is other functionality that relies on the
global variable. The bits that make it very difficult to remove these
entirely is that they export functions that are called without context
=66rom other parts of code.

I have a fairly large series on top of this that converts the Tegra PMC
driver to move away from this as much as possible. It's not possible to
do on 32-bit ARM because there is some low-level CPU code that needs to
call into this function. However, the goal is to at least make the PMC
driver data completely instance-specific on 64-bit ARM so that we can
support multiple instances eventually.

Maybe something similar could be done for mvebu-bus, but I'm not sure
it's worth it. Typically for these cases you need some form of context
in order to replace the global data. On Tegra we do have that in many
cases (via DT phandle references), but I'm not familiar enough with
mvebu to know if something similar exists.

My goal with this series is to get this a bit more established so that
people don't use the lack of context in syscore as an excuse for not
properly encapsulating things. These usually tend to go hand in hand,
where people end up using a global data variable for syscore and since
they can't get around that one, they keep using it for a bunch of other
shortcuts.

> Also, small nit, make the function pointers const please :)

I originally tried that. Unfortunately, the struct syscore_ops contains
a struct list_head to add it to the global list of structures. I suppose
I could move the function pointers into a different structure and make
pointers to that const, something like this:

	struct syscore;

	struct syscore_ops {
		int (*suspend)(struct syscore *syscore);
		void (*resume)(struct syscore *syscore);
		void (*shutdown)(struct syscore *syscore);
	};

	struct syscore {
		const struct syscore_ops *ops;
		struct list_head node;
	};

Is that what you had in mind?

Thanks,
Thierry

--xzuw4l5ej7k2fa3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh6UO0ACgkQ3SOs138+
s6HHnQ//RJDy7HyKY3QGC3LCcmt2Vfyic7ACiUP72YYAnBKVHsFoF36OZi9Jv5iG
Bq9Go0qFfluWgOrOlsjmhHE2BEj6shRzh/+yjZWu4MpCdM2CpxnUz/bwHQryuDKL
3TMs47m/NEVQ0IqPBmMmqHjLoSZ8q1c5URJv8kzhGFUZPif5CfeDwU5Myq7IDMd9
yqc25SLzHS8bhHyFXDVzGc06uTrdwRbopvwS+VEFtupMNrGD/bmVo2f7HE38Vrgx
aoX6xxuDqTeRRonB9OxU0Upm0Kv/JGXetysgOLLHml2TvQudYg1sG/xbIQqymU2K
YopxcFWmObA5qAPRadidJChbWyaKpZXfr2rqsgvM28cnRmCjKIDRpmVzCsLpQHBb
fJ7tbGWQBz4ZFczYLM9Z6cjZPJFFuwHjzm9dRNH/ppJKWmtr23eSYuWX44kG19CM
644Z1OYxg9GBp5mZ7mGLu3HF8ycXWFKDoApp62SLm7TyHRTP/W0Kn90MqgHuAd4U
0RhHg1+7MlFBE9jC/X1Ac+RsZNaZUd+biEy6QvAkOHL5VtPxlR9OCKhftZcsPRuM
YdQVi9IgteKqzq0ul2dQbTD1LaqzrEYmFXJ1So3dTTSbOUqrb+VDt9Bqtfm7oGdG
O1NPiukTbLVBWb9QXt5vvJ6QXxC7wn5jdhgby0kUROvSnCkM+8U=
=McxE
-----END PGP SIGNATURE-----

--xzuw4l5ej7k2fa3p--

