Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37167CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oi5CZpumOfRO5UxrA3d1k5hJRdlXZM8E6FYaZHFNcA=; b=p/TPi+IHbCkgA8yITrPjEcOMM3
	AglN7Ea597ank4GMRL6tmQeoj8B/KioqupOz++a7H9uZXmn66OZ6zkRXCM3MvzFuNIwTPZ6WoovBd
	+FfNbs0CHV/HxSLc1tPL3aDlUSg8oFYJUI7UjMWGEdOlyXnM9sZt+dtBu1Od20l670gu2ntHra0Hf
	5kZyBWNTl9nbnE/2EHnkEsoS+k5AdGUyLXblGQlmg8HYmvztMwfkZxcdBEYQo0u3DaiLfNJWQ2y87
	EHqjk/hCV+/Bd5BO7UvjjEDRd8mjOxtzj5DqapFm2ZdaneSrSFgoCkHIHzJsFd35CLBh3YypegFBB
	jqwz/KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cbq-0000000FxPv-31pk;
	Tue, 14 Oct 2025 10:50:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cbo-0000000FxPY-2jJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:50:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so55862545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760439022; x=1761043822; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oi5CZpumOfRO5UxrA3d1k5hJRdlXZM8E6FYaZHFNcA=;
        b=KYYm+WXCeX8V3Wg5NYNSltp+zpkmWh2KcScQjvbXsZqV0tNo92wQiacc834ePIbPfY
         FJzo0Vusf0IVVqQMh9KEWwIrZOaIF8rbMvnLMrT2NEpXp+V+iAwG/pn2zFaMzl1hM9GL
         Mc/6hN1dX/IpKinybYOv1af62efdPUqA+X2w0P6azuzJe+OXKq0YoORY7+Iff/YSL6j2
         lJKuSVVw+pqKraolUCx7VFRceValhP2dbj/cIFfGrHUSj+ouek/D3BYMR3Sz6MY4yIbN
         +QIVDk2u6tjdOwLqTCe4ZcIPelQHaPZNDhO4LQhMzqB/NQtohuF2X1J1+7aTPzg0J7kP
         lXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439022; x=1761043822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oi5CZpumOfRO5UxrA3d1k5hJRdlXZM8E6FYaZHFNcA=;
        b=J0tcXirwrybiAiBipETHB2AKLgG9rdDNnnQ1ZmZWE5ebBOkXPXwSeKio5dM4IlE1C6
         80MjiNCl43MrdaRvPn2CCSh7cx1Sa58QLgvvZpvGn607p41zW3iwOUa3jVHBP2b8gHg0
         3LXjASsaGm1tZnR5Jx8EYW72I9K6Pn01QsTSAOUCnaNZuhvAvWkAHjW2rcm0X27dbkxC
         F0LNdJhLLCgK9CVisWFPnEML5XmaAuPzYjkZIlRVtFeXwiH2F2T572rSWk6I1p1ZXYbR
         DRlw65vaDDRDoY5y6FrVbljIoDbU2JqF2IdcEERxOzEb1xYXcBlz56GUcJBN26Sai5eR
         CxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkEB5PjFuho/kQrUopQU7eNN79WJF1ZnYDbswydY6/CeI0Ak7JrfbZDw8w0K57/TlcFKubhxoc+ZXDvv3QNdyC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn2hJCwg4s+z66Kkx7a9r53ARTni52w1DtuFs+fTCZPJ6SJ947
	MWrBMS6V94WYPWv9bp8elsP2Tn7EAOPIrUYTlayMJOoOrl8ol8aSeeDp7J7zYg==
X-Gm-Gg: ASbGncse68A45OBn4WwYNP+yjtdAAAuBkZ1fah8uErWKCTA8GuxqUYCOntmLZnft91Q
	ymb9pXK9w6IMxkPNQZ721tsaiRg6rHge+ZSd06Mgw2/ccprM4HIQcRgvf/1VXhh2ZPyRAFUoHJ2
	JC+v9BHI4ZLR6bK7nq3W5UtRnGTFeEsKt8scO3hxvfDEu0G5N/WFlcX6LthCeZtjkNpk9ZpJHpY
	exOHOr7AGzQDPaK2lx9XSdumTEP5u9vsEtC3eqO68iElc652VnVamdzQfQMl8O5HQ/gWgpN0FV8
	5mE/+KDY/II5/NZeVG2+l3BCCof32dXQtSOTVu9VuNyuXftrzTtdQL4nVvA7a31FLkR+fHM9VAM
	GV6CFJtWsZP15A25YWWVfgBmEM0X8/nqmPyem18K4ZICaxeffJWw6buNkQ85BsGPBYuec8raR1y
	2RFWrTt43WH4GhvT/WhK3LAxCkGBIcUZ/Qq1muSyg=
X-Google-Smtp-Source: AGHT+IHvthsh5d4gJ2f4pjbU+SaIy+7Qg5DdE7atHEiRKh31T49BVgFbO+XVGKpTwhTDtvlqb5L5oQ==
X-Received: by 2002:a05:600c:4e01:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-46fa9b090d0mr198199315e9.30.1760439021936;
        Tue, 14 Oct 2025 03:50:21 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49be017sm230015965e9.13.2025.10.14.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:50:20 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:50:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <6hb5vyl5xxsxfcwk4v3xpq277wusj5jq4tubdpjocpjc5smj3w@wx574kluhedj>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
 <graeplkpsgbolpnnq2pndpdb7fymyy7zvm37osbdtre347tns2@mjbgzwterefv>
 <87sefpoj10.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2s53ukplucxdxja3"
Content-Disposition: inline
In-Reply-To: <87sefpoj10.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_035024_735503_5AD74C10 
X-CRM114-Status: GOOD (  30.01  )
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


--2s53ukplucxdxja3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Sat, Oct 11, 2025 at 11:00:11AM +0100, Marc Zyngier wrote:
> On Fri, 10 Oct 2025 16:03:01 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > On Fri, Oct 10, 2025 at 03:18:13PM +0100, Marc Zyngier wrote:
> > >=20
> > > CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> > > this distribution mechanism (or the other way around). Another thing
> > > is that if firmware isn't aware that 1:N interrupts can (or should)
> > > wake-up a CPU from sleep, bad things will happen. Given that nobody
> > > uses 1:N, you can bet that any bit of privileged SW (TF-A,
> > > hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> > > around this).
> >=20
> > Okay, I can find out if CPU hotplug is a common use-case on these
> > devices, or if we can run some tests with that.
>=20
> It's not so much whether CPU hotplug is of any use to your particular
> box, but whether this has any detrimental impact on *any* machine
> doing CPU hotplug.
>=20
> To be clear, this stuff doesn't go in if something breaks, no matter
> how small.

Of course. I do want to find a way to move forward with this, so I'm
trying to find ways to check what impact this would have in conjunction
with CPU hotplug.

I've done some minimal testing on a Tegra264 device where we have less
CPUs. With your patch applied, I see that most interrupts are nicely
distributed across CPUs. I'm going to use the serial interrupt as an
example since it reliably triggers when I test on a system. Here's an
extract after boot:

	# cat /proc/interrupts
	           CPU0       CPU1       CPU2       CPU3       CPU4       CPU5    =
   CPU6       CPU7
	 25:         42         44         41         29         37         36    =
     39         36    GICv3 547 Level     c4e0000.serial

I then took CPU 1 offline:

	# echo 0 > /sys/devices/system/cpu/cpu1/online

After that it looks like the GIC automatically reverts to using the
first CPU, since after a little while:

	# cat /proc/interrupts
	           CPU0       CPU2       CPU3       CPU4       CPU5       CPU6    =
   CPU7
	 25:        186         66         52         64         58         67    =
     62    GICv3 547 Level     c4e0000.serial

The interrupt count for CPUs 2-7 no longer increments after taking CPU 1
offline. Interestingly, bringing CPU 1 back online doesn't have an
impact, so it doesn't go back to enabling 1:N mode.

Nothing did seem to break. Obviously this doesn't show anything about
the performance yet, but it looks like at least things don't crash and
burn.

Anything else that you think I can test? Do we have a way of restoring
1:N when all CPUs are back online?

Thierry

--2s53ukplucxdxja3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjuKuYACgkQ3SOs138+
s6GjZxAAh0EtrqoNH2ELSK/goEd24inBc3Eoe37rgmkFvxq4QmjXZaEktcd2MVKQ
PpYu00CutOwfzM202AXfZRem5KI2hg8pOLu9ZE/Y0GLaZsMyY9KmefuYNbRpuFFY
ls/pYtncY0xRPfzF1KpSg/y3UhIt9l67KXjrTLcIgem/RXFhhIVGBbuabbcA0b8N
+3SD9lEqdVWByEB0skf4okYqSZK0aXN4gxBrm8G03fYDuuVtM/w5nvYLJTUMgTJh
qMS0kNvVX3JOjaXvYt4HGZIcIi6cHLgK3PHAydGQ0A+rBdSRbSycXBF6hGpOViuY
Cna1CRTsu1X/CPwmKyVRyxx+jfWMV25WEs4wr+LKMePNvcQswJep6jc3eTUEBGCV
bD10EcJUNKz7jUs+Du7fc5zMY5NNzYmI7PGFGpfOIRr/Fjzwq3KbWIQNfBca5QBr
aixPjI57v4Z9y58nPt1IDY4mk6jlMzB9p6FfhzRY5VyBChrjS8gnukhs7Heq7l5H
uwhfVeYjB74NRns+V0Pcb3fKtt8xd6vx3w5U0oZQmhezfs9TITmJc7U3JQkgRNp2
wApK8ECbCcA56N07U1jB5ihAsS3u/bbqWONgIAg6ldIBOYmBjuGvkNF02E9xNEu/
SVcGFetyr9+PkcKbDfpVaKfxZPMtUxune9hno2u3QO9bylAQw/0=
=QFps
-----END PGP SIGNATURE-----

--2s53ukplucxdxja3--

