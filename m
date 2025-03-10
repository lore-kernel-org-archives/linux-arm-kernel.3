Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58563C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bwMEAH7Tb2p80rG5YQFDISiH+2UdxhzZVsTz2rTT24=; b=nKgdgR/d/ntVblp3hzpAPCOU9/
	8Y/UquwzOzTI2xnqC/EvzpEhfh+ypYlBRjoPJqqpl4nGDLFK0PUhVjnWrHGX0KIMKhj8slzVGymRL
	KHKBHojPIUOZlGJi2r/iDhGFCIbFnt//WQXeqzRDUgo8UKMZBQRo0cL8JZ8kkF3hLWKBQ514Mv8Qx
	tcrcGlD0kbFpF0uKwRT4liZzyxYYKCGq+Ft5GpF3nqXJqGCrrJhjM34jPPawj0odb9x3rlQ/SzWJk
	wwrPItlCi0MK/SaspuxnjDw+g+CM9kEYWGVFcRZY94EyKS1Cd0MolsbOivZdwIfU9atxeQJeshwdu
	uwM7IgsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treOH-00000002yjy-1Git;
	Mon, 10 Mar 2025 14:46:01 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trczQ-00000002l8w-3z9j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:16:18 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523f670ca99so743971e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612573; x=1742217373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bwMEAH7Tb2p80rG5YQFDISiH+2UdxhzZVsTz2rTT24=;
        b=bMXvZjTMxkpQZ7XH826GP1Z09V71r7NzjQH9u3qNn38pQRj85KpeVRp495MR7za5ks
         00ipU2ju7In/XguR1lU6fW8HH/Su8H14Q7JAVaz5S14i5Wg5+ZyRovGbN8HBKTVkhIua
         Q4PVCfxnJAd2qVxxUCAB8D6i5tv4zeGoAVPGe6TdmGJyseW/AMHckb2UtZuLMlkN3kzh
         e4D2vm4RhgsVYyeC8j7ofHM9wMoPwGspyCe9DlP9fxmNbSuYClyN8oWimHrTYBL78tNN
         I3h68oXpUFfbWVhdo1QkmVGcWkjvx/wTMQUDYMZomYo1Afl6hzojsv8NqAvrTC/drTqI
         zNHA==
X-Forwarded-Encrypted: i=1; AJvYcCUM2li30FK4bu/bfSG4zqXJCJ38YXzAVya/ALVOJbVg+ULfdLhusbcgpyquvnP5RmWkxfKihvKTVE1PnH0JRp+v@lists.infradead.org
X-Gm-Message-State: AOJu0YzHM6ElAjO37p/rHhpW+eWNm5HdzM7ztoAUG4Wmzvku8SQyjJQU
	BVD5K//t+1itfZHneJtac7bIp9lRiPrBQr7ePiCO3gT00pU3MGDwrID9/SEmzHQ=
X-Gm-Gg: ASbGncs4D5pmTD8B96YF7QSLbG83+AEtOSjAmkUOHn1M+CKtK2qHAVyFLGEpiCvTsLI
	oazqQcjS3QsOzwa3lkrFK3KiKn2boVfsn12EsMRFjt30oDWpRa/H+vg1eBsBPB3fFLXBH8ERtKz
	LnaB0O6IrBaAgGarUs2G3HI8COVfVvL/WMdqh0HOeSk0II5QxeRFcqgk8IwAHAU8TmQHepfUumU
	J9C8I3k36/cKZARfi4crqm2eLqAUWGIt5cXk86bWHaxCtSb/2vxUaXQD+EGnBIM5dhXDrGlqkjs
	djJoXmaHtpims9QPQvVJs9RNeK+sqLKFOqZ8ifyziZKxfxwhlzplB4ga1KpsDrso6EFkJxE2hol
	z25qAEUg=
X-Google-Smtp-Source: AGHT+IFb/Kb1R25mSc31siSxOr7QFafm24HXwvRdRn08HCTB/2oGJ9zNBUIiABqnSJDA+661unfPHw==
X-Received: by 2002:a05:6122:4584:b0:520:43e0:8ea0 with SMTP id 71dfb90a1353d-523e42b0e59mr6796140e0c.11.1741612572954;
        Mon, 10 Mar 2025 06:16:12 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5240fcbb071sm206014e0c.4.2025.03.10.06.16.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:16:12 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1771056241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAgN5wSfMWD9Jpr1wWakgk7kh18RaN0tReKbVdeBVW3AGDKGXYB4qfoZjv3C0Odnddk/JHKCHK121uVL6EIZ8M@lists.infradead.org
X-Received: by 2002:a05:6102:3583:b0:4c3:6c4:e174 with SMTP id
 ada2fe7eead31-4c30a65d92emr7228931137.16.1741612572135; Mon, 10 Mar 2025
 06:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250109-dt-type-warnings-v1-0-0150e32e716c@kernel.org>
 <20250109-dt-type-warnings-v1-2-0150e32e716c@kernel.org> <CAMuHMdU=QR-JLgEHKWpsr6SbaZRc-Hz9r91JfpP8c3n2G-OjqA@mail.gmail.com>
 <CAL_JsqJNgxLgvB502Bk=5aMeP2rY6KVL_FykeSyN1tsDRXi9cA@mail.gmail.com> <CAMuHMdWZsQ9UbwVub=36P_2DCPEN0aORz9FxCbivKkOyeWkuww@mail.gmail.com>
In-Reply-To: <CAMuHMdWZsQ9UbwVub=36P_2DCPEN0aORz9FxCbivKkOyeWkuww@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Mar 2025 14:15:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHsTYjamDkyoe_CwJhXbf7LpAPk+Dazd4wChEmfcuYPQ@mail.gmail.com>
X-Gm-Features: AQ5f1JraxfzSSZiwFZoSk4-gLUnOHP6AW4upV-5J6BIK6IbQAuD0VMWwpRICbuw
Message-ID: <CAMuHMdUHsTYjamDkyoe_CwJhXbf7LpAPk+Dazd4wChEmfcuYPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] of: Warn when of_property_read_bool() is used on
 non-boolean properties
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061616_988769_2A18B094 
X-CRM114-Status: GOOD (  33.96  )
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

On Wed, 15 Jan 2025 at 12:20, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Tue, Jan 14, 2025 at 8:19=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Tue, Jan 14, 2025 at 12:35=E2=80=AFPM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Thu, Jan 9, 2025 at 8:42=E2=80=AFPM Rob Herring (Arm) <robh@kernel=
.org> wrote:
> > > > The use of of_property_read_bool() for non-boolean properties is
> > > > deprecated. The primary use of it was to test property presence, bu=
t
> > > > that has been replaced in favor of of_property_present(). With thos=
e
> > > > uses now fixed, add a warning to discourage new ones.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > >
> > > Thanks for your patch, which is now commit c141ecc3cecd7647 ("of:
> > > Warn when of_property_read_bool() is used on non-boolean properties")
> > > in dt-rh/for-next.
> > >
> > > I have bisected a failure in secondary CPU bring-up on R-Car H1 (quad
> > > Cortex-A9 MPCore) to this commit:
> > >
> > >      Detected Renesas R-Car Gen1 r8a7779 ES1.0
> > >      smp: Bringing up secondary CPUs ...
> > >     -CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> > >     -CPU1: Spectre v2: using BPIALL workaround
> > >     -CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> > >     -CPU2: Spectre v2: using BPIALL workaround
> > >     -CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> > >     -CPU3: Spectre v2: using BPIALL workaround
> > >     -smp: Brought up 1 node, 4 CPUs
> > >     -SMP: Total of 4 processors activated (2000.00 BogoMIPS).
> > >     +CPU1: failed to come online
> > >     +CPU2: failed to come online
> > >     +CPU3: failed to come online
> > >     +smp: Brought up 1 node, 1 CPU
> > >     +SMP: Total of 1 processors activated (500.00 BogoMIPS).
> > >      CPU: All CPU(s) started in SVC mode.
> > >
> > > Reverting this commit on top of my work tree fixes the issue, too.
> > > However, I do not see how this commit could impact CPU bring-up?
> >
> > Strange. Perhaps the of_property_read_bool was inlined into some
> > special section before?
>
> I re-added the old inline of_property_read_bool(), but with a different
> name.  CPU bringup starts working again if I replace at least one call
> to of_property_read_bool() in arch/arm/mm/cache-l2x0.c:aurora_of_parse()
> by a call to the inline variant, or even if I just add
>
>     pr_info("xf_property_read_bool(np, \"wt-override\") =3D %d\n",
> xf_property_read_bool(np, "wt-override"));
>
> to that function. Note that that function is not called at all on my plat=
form.
>
> This small change causes quite some reordering in arch/arm/mm/cache-l2x0.=
s,
> so it looks like a layout issue. More analysis will follow...

The assembler SMP bring-up code for Renesas SoCs lacked an alignment
directive.  I have posted a fix:
https://lore.kernel.org/r/CAMuHMdU=3DQR-JLgEHKWpsr6SbaZRc-Hz9r91JfpP8c3n2G-=
OjqA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

