Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB942CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFA23XaRUYTvjaED/Oey0IjLZr5jn1jKfrl93jCACf8=; b=W0FBui+b/e69Ac
	JUjWm7lUwbTMX2Bxo9aN00+vEFcgGuTd9Fly23AbmyT8vdXCuRoSot6GNeFtDhyCQS/6zELooplaO
	HVPrKaxUhhHMRpuBOyUOyp7SQVbgFX+p+A1zjDNIQIW6XEf8Q2iZ7zW92NLNd8crlakUZCEqXjwzN
	34A+9te//MeMm5uU9C10pdurw+OiCHWL/4lS6QwTCUHeHVIOwWhCSzC3TXZxKeMUJAdkai/y1le5R
	jfleMKosWj6iIOEK+rP8V8AF+kmhVSP1fk8Bpa8rkvgHyCIG3C/OYQ8M1SU4Qdh0iSGm1RoZMoJ3O
	lO84fWEiP0ZN4oFJcbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHeK-0000000GeHx-3dek;
	Tue, 05 May 2026 15:25:28 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHeH-0000000GeHF-2xeS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:25:27 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38def541b0bso52248521fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 08:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777994723; cv=none;
        d=google.com; s=arc-20240605;
        b=gbK9rpptSGi23UYbyyD6ywuglsgjMS3O9t5h1Nd1P0EtSA6sT1DTAqDN1M5Jvu7lj6
         XrYOd/YYQRuz6EY8KLZpbqM/+vHsKLzI7UXb1Yi9otS2n9dM5tF6i73tKgclpkFwicIu
         +Xpm97acf2RbdtTOJckw+VxB6ybsQC/REHdQqyNq3IiFuhXeFNgVFqBttn3rx0UQWB1z
         fzNz86/MGc5Gy2y8apF+oB0V6kM8ZwQFdLlqMy0wwd6K6QSn/amWOE/KFoDiqRK8HdOd
         PEUoGxa2ArGroE17ZP5CbLTrraeR45RIVrhqY70KKLh+BC6ApIgDeBfF9cApEs+OiLpn
         dz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=LFA23XaRUYTvjaED/Oey0IjLZr5jn1jKfrl93jCACf8=;
        fh=CTq/2XtpA7ZqI1PcFuiAIpGOlUzUsXKdeKRrSr7e1UM=;
        b=LFxnBUb6ekg6g0v10kYkC5f/mCmXZ9q/ZZaEjtefbg+PNmD2PIyTK23YMiQHSET+Jo
         kSziAj4W04sC68Zndh9Sit0UpPNnvzxCKPIT34qEEULzctBYos4ki8ay3wCrcg0Tsnqx
         p+5Hal0dSLA6JFXDMlPFHYtkrdydoKhgPqIh64mree37sFPZMgkG4kHHDNnkQ9bdJcnD
         QzAHsjzyq1udGmmNfskmzaOXxcdSs0iDY7xdSwrlOATvBzXHwleyOmvzSqurQcRo+lBo
         1SXlKZQuAgI85WWWaJX9n/VJTCkQiM5kXcr1VqIDZeqHEbK6soduEixvp8RJgTG81qRj
         q3Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777994723; x=1778599523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LFA23XaRUYTvjaED/Oey0IjLZr5jn1jKfrl93jCACf8=;
        b=iSrFaB7IcPs2dCkAJdZXxaTMjM78iNWToPVa/lhHt2K5OUA10tvwZmx4JHfqMiRHSb
         r/+QtgkI7CjGI6koLfUpU+7pxWdrzoGLZI9pCsgv2DDhJpi1BiX1Opqnyl0uBBNvC4A0
         yfjHQDcKXVnxV1sEMEjy5ahMN+HQ706GKjwaDYSz3kGRDw7GxQmySn+AboJm/nOWxuVv
         hSBLKkO2ya6qOCMgOMamNDyncKfIQN27HDGTPAdFR6u/5lFHq6W0IFptqqeaKnqOdJiw
         85Ppv0cyUdBYP7/jtNG+iFaKXhpv8OZe8ndWY65j/wjjCHfb4F7D2ZP7wo5Bd57L3HFC
         Jc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777994723; x=1778599523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFA23XaRUYTvjaED/Oey0IjLZr5jn1jKfrl93jCACf8=;
        b=oHDKvtDe3bTeYQVBW064me8d9uT/5NL8hT5C7zI399BcrRL/25e7FPVnoVIslWkcib
         eEZvS3KfB7PFZ7dWiJ2xzcyBLHI7vm2ilU8LuubrLx9CkQiHmKGP8mxXjzC0EYvdc21L
         s28nY/GoYqQzIauJ9LWZnN1djK+ebX3KoHmLap7rXYHD4s/ahZQXaQXeMVXsRUnHdwij
         Y968jiJ0al3ZRBQe+z+u9Drk5J8pwxdty6japLsqbCVHmd6+EZCcCUXlWPDyRhBuVXoI
         EUvIJyN71BB8CtpYturgFpPnfhP/aOAc75OrIwWzFevfuukCNyef6ierxNlkCQootilz
         aoYw==
X-Forwarded-Encrypted: i=1; AFNElJ8LmrIXUvWflQYqCOYoOX4Ux/kfXu2rzdrd/ozST0jRo17vJ4jPRl80izzSWYQnniuoZb/zf6Um/1z5VnGMd/mV@lists.infradead.org
X-Gm-Message-State: AOJu0YwcBKPyh069IB4mjmqfZ+VUP/DR3AfOJ6wVO/k7SBvey9sGSp9K
	d27EgwAVd7ks4qgNvYoaqGNtkpe8a1+zMwrlNIEXTpQrXLLAv2yju43+2e9QntPms5owGZT8QBs
	MVvwkt+T+gAy8cHX6Su8LDwSuaWzE0nM=
X-Gm-Gg: AeBDietUEx0v8+AhDYQ34GYZtq64TZr/bnWqrRNCCkHoiela/7AH5GMBqJSjjKv42zU
	aK/ahNPimxVH81766OF99CB9VGos+JECdeN7ggOuMmnBknfyARFqSsQu6KnVljOIgltF2f37P1m
	tgzvL9Az7WkN/E86Pd26OU+ulHrje3D3McOr3FRi54WAxAq68GVFqhi02BS0vUvlgMM2Jnnb0UV
	FX8XgM/yElJCJyKl3fUp+tdklOpXQHyFCkxjUleuMYX6G17cUecwqzCJcGPXXU1gADEpdIuwVLW
	w+29w5PF/e3T5mynfne3N/dDMIF3zdysOzE3+hV7NNEykAoKhLPx4AlpGS0NkCXx2I1IZv0tM2Y
	4/JQtOFfxkAVoNBk=
X-Received: by 2002:a2e:b8d6:0:b0:38a:6537:6f51 with SMTP id
 38308e7fff4ca-393b492c293mr16805791fa.5.1777994722861; Tue, 05 May 2026
 08:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260414081730.3864372-1-rkannoth@marvell.com>
 <20260504224955.GA669929@bhelgaas> <MN0PR18MB5847809DF7EB9A3ECA4A4159D33E2@MN0PR18MB5847.namprd18.prod.outlook.com>
In-Reply-To: <MN0PR18MB5847809DF7EB9A3ECA4A4159D33E2@MN0PR18MB5847.namprd18.prod.outlook.com>
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Tue, 5 May 2026 10:25:11 -0500
X-Gm-Features: AVHnY4K-DyAHKMwAD4q2TyCQMOsJNwWJaGHim2wRQ-H-SZM8qBkBVZjAEwGD_qs
Message-ID: <CABhMZUW5Y3g86_ki8MfcqX9Qj63TxqQR=m74c8sBm-puZGEvUg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] PCI: host-common: Request bus reassignment when
 not probe-only
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"will@kernel.org" <will@kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "vidyas@nvidia.com" <vidyas@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_082525_830051_53F238B3 
X-CRM114-Status: GOOD (  17.59  )
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
Reply-To: bjorn@helgaas.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, May 4, 2026 at 9:49=E2=80=AFPM Ratheesh Kannoth <rkannoth@marvell.c=
om> wrote:
>
> ZjQcmQRYFpfptBannerEnd
>
> On Tue, Apr 14, 2026 at 01:47:30PM +0530, Ratheesh Kannoth wrote:
>
> > pci_host_common_init() is used by several generic ECAM host drivers.
>
> > After PCI core changes around pci_flags and preserve_config, these host=
s
>
> > no longer opted into full bus number reassignment the way they did
>
> > before.
>
> >
>
> > When PCI_PROBE_ONLY is not set, add PCI_REASSIGN_ALL_BUS so
>
> > pci_scan_bridge_extend() takes the reassignment path: bus numbers can b=
e
>
> > assigned from firmware EA data (e.g. pci_ea_fixed_busnrs()). Skip the
>
> > flag in probe-only mode so existing assignments are not overridden.
>
> >
>
> > CC: Bjorn Helgaas <helgaas@kernel.org>
>
> > CC: Vidya Sagar <vidyas@nvidia.com>
>
> > CC: Manivannan Sadhasivam <mani@kernel.org>
>
> > Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
>
> > Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kerne=
l.org_netdev_adcXzcz2wWJFw4d7-40rkannoth-2DOptiPlex-2D7090_&d=3DDwIBAg&c=3D=
nKjWec2b6R0mOyPaz7xtfQ&r=3DaekcsyBCH00_LewrEDcQBzsRw8KCpUR0vZb_auTHk4M&m=3D=
01Ocq--c6MApFtcfadw2NVeNuCaGZBUwjA3VpG_9uhWaoPultvNor45uL_Eiijk8&s=3Db9P4fx=
av0nsyokGf8a2Tm_XrNqunGO4YOS6RJ29_iuk&e=3D
>
> > Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>
>
>
>
> > Was there a bug report associated with this?
>
> Please find Bug https://bugzilla.kernel.org/show_bug.cgi?id=3D221219 repo=
rted by me.

I don't have access to that bug report.  If there's nothing secret in
it, can you make it public?

I assume this is the same issue you mentioned at
https://lore.kernel.org/all/abkqm_LCd9zAM8cW@rkannoth-OptiPlex-7090/?

Your email response was HTML, so the mailing lists rejected it, which
is why your response doesn't appear here:
https://lore.kernel.org/all/20260414081730.3864372-1-rkannoth@marvell.com/t=
/#u

If you can send plain-text emails, that will work better in the Linux
ecosystem.  More details at
https://people.kernel.org/tglx/notes-about-netiquette

Bjorn

