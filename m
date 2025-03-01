Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A15C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gbI6Lx1SwHUo016RUwsEL/Zpp8Wju2RW9C01nQ37/k=; b=w9gshfbx1wbYjGjci4THIut5ab
	YP4B+w9AlECkrS4bZ2hRmVR4UoTcGPjkEn3Lc0mVfBJBp9kV52XBwcyrulDHZFnwSEeYNeYWYSyeI
	5+S2r/Nxhv0iKcu+3fURJ8t+Ww4C5ZO+tkSmRI6rjoDTOMvh+v37bUsGbM7+RjB1Fo1IajWC70U9X
	Qg8e0Yf9I0ZqY5P61DUvYxH5Z9nH+4xfzFgTgd7lJuM3/4QS5l7ZKOpmJ26D86p26rC3CfMoC4G7T
	03VApPDBlL0JHOkXPo9q8jsX0Y1bRlBpXYPO2Y8W4q69MO/JvwPmsrnhE5nEKAp3riAIsPAdX5emU
	Trwp5aeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toGVW-0000000DWBk-2SlB;
	Sat, 01 Mar 2025 06:39:30 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGTx-0000000DW7M-2Ewd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 06:37:54 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2feb91a2492so2849711a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 22:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740811072; x=1741415872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gbI6Lx1SwHUo016RUwsEL/Zpp8Wju2RW9C01nQ37/k=;
        b=jRCZHdEvSLBRtNbtMzTHGu6ETHgemXfi0P/5Osg5uh88XIMljd1c/NJWxGcJ+EzlGo
         bZTSYhFYCEDCGi4zUCNAXUxPeB/Zv1vFG/DzS3EMPzvMRKpckgiaNll3tb3fIaAbIRD3
         7RUeYwpiQ5uDf/iA3gBtZBTfGtoCMxu9nv42PgDpf8sWEeD3ZTA1KSd9OsKVGL1Mawbh
         1QNbtkoR3qhQJcqOzsJ7YCxiiJlgWa3zBxc17OdDVwOvajfEAvxnfTdWJq/6EQDk73rA
         IhQBA6E/zb3n4WBQ7SN9GkKirYH+ryvCnoAe3wnxb81j1sNKtTrCYGBIAPQo+yDxZdjc
         N5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740811072; x=1741415872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gbI6Lx1SwHUo016RUwsEL/Zpp8Wju2RW9C01nQ37/k=;
        b=paVsrMSFdrrGtxo26cNOpPTIkDyj28XTOkZn9SKc/YNe39Ab2eiDmwyYDc+7tAV+fT
         B7bDFGsnV/YtDySg5ufqxC+HxrZBustm9HP4HAR2tB0Hp8EB2Y9ZgWqJ3sh4gQK+3AsK
         Hg85mJe2sM8/MwSzQ1O5In/8xMi5KCMqD+gjQJyfW/E4uksXzfEMwb9uC21nAKpNbkXZ
         U6UJXRwkPvlOVKFE1BBdXoH/VqHuJYcxP+0qUOX1p2C8MAjQ77eHZFR+JC4pn+gXiTl0
         /n+mdOTOgqtB3V/pIsWadsuamjj7VilPw3bRBBdFXAt5Sa291Gr/Jx3GdaoozObYbmZS
         XCyg==
X-Forwarded-Encrypted: i=1; AJvYcCUPETIe4JAHKa2rVEkcKBqKIpqJzhqei5Ba94Mc5CzEF6ZMNGAZ6+08oRaxY69+oRJlF87v19nDSk3H9biZ1vGq@lists.infradead.org
X-Gm-Message-State: AOJu0YxPoE0v9NnZ3UAaNs/THvVtsAN//InKix4+gTcHuAXIGAgNm4xH
	WSacZHZqtE7WKF1C2RElt6gchql0uX9YfdLbgoZjqeY3ZXLw9ml3OxNO3JCX2qmNttcY7yyXhCd
	u9iBMgtbZm7nYrAmSKSzDngUDTZo=
X-Gm-Gg: ASbGncsf+Bcz0D5QSWcnkmn+XE/h6ovyTGcKx0NqrsyLIXf8M1rIB2X73pwTbb6sf6j
	K1rdzPT4QJWwahDMUaGPZmD/03hv1ovbgXxAt6RjQ3gWnaJPth++Xx7QnKkgNs276RIFUzCfZfA
	y6DCJu4sf2oDo9+UrrGdwn+iy+xg==
X-Google-Smtp-Source: AGHT+IFe0JmXdmCI+lvsXXlYr7ZEtGT1XLaPZczWDqoXge/PaGceZFxsFgT1DV1FgHz/TlL2p/n7Cz1UWpNfyIleyjQ=
X-Received: by 2002:a17:90b:3d4e:b0:2fe:b9a2:fd3b with SMTP id
 98e67ed59e1d1-2febabf8336mr10223520a91.30.1740811072227; Fri, 28 Feb 2025
 22:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20250224062111.66528-1-kpark3469@gmail.com> <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
 <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com>
 <CA+KhAHYDui3VkebjxZLnN_ijMUzJf2BRMqtPqqos+rCbf8J7Ww@mail.gmail.com>
 <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com> <20250301043948.GA27296@willie-the-truck>
In-Reply-To: <20250301043948.GA27296@willie-the-truck>
From: Keun-O Park <kpark3469@gmail.com>
Date: Sat, 1 Mar 2025 10:37:40 +0400
X-Gm-Features: AQ5f1JpXv5NUIffsINAwSjLUyU7sJARB6pcCqCs1GLV50mEcwA1SDJXzdVAxsr8
Message-ID: <CA+KhAHaXHUYs0aXcD9uJQWfwDMFngEE03wapeVwS35OgZO82JA@mail.gmail.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, 
	Keuno Park <keun-o.park@katim.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_223753_573317_E545E8DF 
X-CRM114-Status: GOOD (  28.49  )
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

On Sat, Mar 1, 2025 at 8:39=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Feb 28, 2025 at 02:11:41PM +0100, Ard Biesheuvel wrote:
> > On Fri, 28 Feb 2025 at 06:55, Keun-O Park <kpark3469@gmail.com> wrote:
> > >
> > > How about adding a warning message in case of linear region
> > > randomization failure?
> > > And, there might be two options in my mind by now to consider hotplug=
 memory.
> > > Either giving an option for users to override "parange" as kernel
> > > param or providing the legacy way((memblock_end_of_DRAM() -
> > > memblock_start_of_DRAM()) when CONFIG_MEMORY_HOTPLUG is off.
> > > Users believe KASLR will work fine by enabling CONFIG_RANDOMIZE_BASE.
> > > In case of linear region randomization failure, I think at least user=
s
> > > need to know about this failure.
> > > Can you share your thoughts on this please?
> > >
> >
> > Randomization of the linear map has always been a best effort thing,
> > so I don't think this is a big deal.
> >
> > I wouldn't object to the new behavior being conditional on
> > CONFIG_MEMORY_HOTPLUG, and fallback to the old behavior otherwise. But
> > ultimately, it will be up to the maintainers.
>
> Personally, given the confusion that linear map randomization seems to
> cause, I'd rather reduce the number of variables on which it depends.
>
> I also wonder whether it's actually useful at all...
>
> Will

I have thought of reducing parange until it fits into linear_region_size th=
ough.
+               if (range < 0) {
+                       pr_warn("parange(%d) does not fit into linear
region size\n", \
+                               id_aa64mmfr0_parange_to_phys_shift(parange)=
);
+                       if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
+                               while (range < 0 && parange > 0) {
+                                       range =3D linear_region_size -
+
BIT(id_aa64mmfr0_parange_to_phys_shift(--parange));
+                               }
+                               pr_warn("smaller parange(%d) is chosen
for linear region randomization\n",
+
id_aa64mmfr0_parange_to_phys_shift(parange));
+                       } else {
+                               pr_warn("falling back to the range
considering on-boot DRAM size\n");
+                               range =3D linear_region_size -
+                                       (memblock_end_of_DRAM() -
+                                        memblock_start_of_DRAM());
+                       }
+               }

But, in a certain case, hotplug memory may get an address out of the
linear region at some point, as still SoC's parange can cover more
memory(ex. in this case, 1TiB).
So I think leaving a warning message for users might be the best
option. Then users feel it's time to move to a bigger address space to
resolve the issue.

               if (range < 0) {
+                       if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
+                               WARN(true, "linear region is not
randomized due to bigger parange\n");
+                       } else {
+                               range =3D linear_region_size -
+                                       (memblock_end_of_DRAM() -
+                                        memblock_start_of_DRAM());
+                       }
+               }

