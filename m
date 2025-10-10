Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F73CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSzNGvN8Odca+vaIJOa7B+9E5YxraxYKgj1v2RlgWfo=; b=A0YO68cpKRQ7iR+8Ts7ol0fuoX
	fLFAE76HQ/nb2O+FKD42yqsQGyAlwoQWTYuJto8+uy7bFhhcWYuDTNOGpHEbE0weaJ4Q3i0261J1O
	90UYdtyLT+Oj61EGPh7JzzrGoOW9JNIdFGtl6icDS6sTzFzmBc93Q2bx6ZbHvELvGVc1LK6FvbBQp
	59iPD1ljY4Y2R5h+DLH1vzuhre0+rzTzs/KMaW7/3nhrJQ8GByWlOoNlN4jW0+Zm0WyafA1XvA8Bw
	8NVnj4rYl+cqLFPBQ5Rx7zdcUV0XoRCYLOiwwJeC0hPwlfw8sUva0mQ9/b2Os8dNq3TrrgWZHyy9+
	JtrBJnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EWF-00000008juC-3ON1;
	Fri, 10 Oct 2025 14:54:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EWC-00000008jsV-3pQt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:54:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e2e363118so18162205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760108091; x=1760712891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSzNGvN8Odca+vaIJOa7B+9E5YxraxYKgj1v2RlgWfo=;
        b=C0eJf1SjpsPPXSOnPWwEZ3RvYpTfUE6Dxv25+ynLVe0xub5sVlGhYdZfKocKSzUxM4
         ZLmnMU/m0PyOjPUv3DKUqD1cMR9wbWtQXwv9l5StUUJOyvhe8OYEu6HrdfLnMYCx0zr9
         txqUr61l/ThCqYXZa/sF71o8ErZuXa+6QC9VFEZOG3ejCAzRi0FrcqbtTDszwvHR3QTJ
         inV9ZV5tz1+hqxrjzeDHHtHJiS7yOoOLYMVvEIjVPGZk3z7YpT0DQ15zhzPm3JOU3FjU
         8V0OQw4dBvzoVPASVRK3bbZMD6F6mdZc0broEBlRUPr9IdjfHIq7AMT3OF3ZDtRoJZsT
         TctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108091; x=1760712891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSzNGvN8Odca+vaIJOa7B+9E5YxraxYKgj1v2RlgWfo=;
        b=PGKLzOf/hn0pf4I+O3QxBP8bghDSq8VOwHTXAh/3ZB37tQ+wGyzHGv49AVj8Vh4Vf7
         V0vUhKIOW7sV+mql/nKXq2+a+wRxMCVOY2HAjwt06xo//hfbrbMaHPHw537sHwBEI66Y
         vm1/TgUh1UHvHwtEtxLvnvD0KS/VMoKb7S9IAxVOTwlKPZk23IhjebTA0w1+dn9ABQIA
         8r2E1I+NnAPJp+GlrGc0A0nN3Zn7O/dwXydP4anGbRawxkvyRTPc9Pc8TDPei5Is+IX8
         xjUXNfhQ1k9IBTt0O7wgFiYypHQUFD7molu2MniYi6otIfuIbYSXG8wiEklAoHoiO49K
         imBw==
X-Forwarded-Encrypted: i=1; AJvYcCU1epI0DKA0SVAeB36aUlCW94P4Pc8YhmqV45m2ZN9lg1M9G6HsexKU8UPM1bEzzkhVB2e9oArN2EVV/XfV7+Hz@lists.infradead.org
X-Gm-Message-State: AOJu0YyCcQyOMnnXgOKBsjjJEhEXJBKfEtjTfaguCGhUTaEz4d/lZqqE
	vHhYlBwnfcJvx5ilPg8qwFJKapP7nT3E25eqd64FhnuZPaiyBd6NSPT5
X-Gm-Gg: ASbGncvo8pU6UpuOkGXdZJVh82dph+SYpNrZqllAz0kd6rwQWQhckk7l3a4JhASO/nW
	VNVkcKvdfVpMlhUfwXHutXbEHtB6qQMqyhIXRlBAJ9S/4tbiBPYY5Q23+sun2CUHtxGedSk42Lk
	PS9iMTW9GhwUgYpSpH1NBcj5qJFA6FrsQgkB7qdKzRCJ55/T3yhnHCO3Pew2l2ggSIxCddwcpNL
	Jsbw/UJ8WE+BAc29rM/NwRKkTefOSNPpp3oR6baZmd8HuADsTb3qXIp5gkFtZWI3KEd06lCpRqL
	+Vmkdj+8mSXlrpN44yst0zimUazxyNxD1oXlcf41Ld84oZJmCULsfW48JP+3AD/Ao4EhaNMbOoB
	9F9ytygbInMK3BCl4uV0kX/0RV2QVgC7JfOygehsd6T5KiHd/KmdxdZsOKpW5nfjz3sNxYKz2hC
	gLMHBGoF/qgM9HouC4/LDw3bkISUX7
X-Google-Smtp-Source: AGHT+IEXkrDyUy97suKtDlq7eFA2ZJryfwfSk6MT1wtjJwB/9DlAxb8oq4wEf+SbzWkvD8LgIsrrzQ==
X-Received: by 2002:a05:600c:3b0c:b0:46f:b42e:e391 with SMTP id 5b1f17b1804b1-46fb42ee4admr31215605e9.38.1760108090951;
        Fri, 10 Oct 2025 07:54:50 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b99fsm52826395e9.3.2025.10.10.07.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:54:49 -0700 (PDT)
Date: Fri, 10 Oct 2025 16:54:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <q2g5abyqniku2uxbjsndiwcidx5cqxbqaixcvdhkurupdnhu7q@pyhpxylwrtrs>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
 <c7bb79c1-c760-4b44-97c3-86e1c34fff40@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lamoghzxow5fsofh"
Content-Disposition: inline
In-Reply-To: <c7bb79c1-c760-4b44-97c3-86e1c34fff40@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_075452_969117_B8B2E786 
X-CRM114-Status: GOOD (  19.39  )
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


--lamoghzxow5fsofh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:38:59PM +0100, Jon Hunter wrote:
>=20
> On 10/10/2025 15:18, Marc Zyngier wrote:
>=20
> ...
>=20
> > CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> > this distribution mechanism (or the other way around). Another thing
> > is that if firmware isn't aware that 1:N interrupts can (or should)
> > wake-up a CPU from sleep, bad things will happen. Given that nobody
> > uses 1:N, you can bet that any bit of privileged SW (TF-A,
> > hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> > around this).
>=20
> Thierry, do we ever hotplug CPUs on this device? If not, I am wondering if
> something like this, for now, could only be enabled for devices that don't
> hotplug CPUs. Maybe tied to the kernel config (ie. CONFIG_HOTPLUG_CPU)? J=
ust
> a thought ...

I've only had limited exposure to this, so I don't know all of the use-
cases. People can buy these devices and do anything they want with it,
so I think we have to account for the general case.

Thierry

--lamoghzxow5fsofh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpHjQACgkQ3SOs138+
s6GxLBAAopBt0WNEut1yocnXx82oxmvWddArsqmrMJnBQ6mqe9JJGWc4O6e2pNR6
+732iu5IcFLfZFG4+XkkUD844lfy+hlvz60KQX+2/0jTZ76TS5S7bZAhD6Zu2lWp
wBoZnJdoWG9nfElAiVcXC6P7HKlxt9zlYDqFfJSi2+PV6cGTNnTu+OtQCzsO05Z6
ywktFlU5r2DFr8NWqaxcfPWOkvx2yAJhDAuJ2FbiSsmknSN/Ot4A3uw5jRMsWoZ9
VuPjsJGVo0FQTJxFkMaP2Cm+vNSciLe0UM9Bfe5yxV6epJz+NjgLuRxCRL/6Tr9S
SP5BUtsXwfHt1eIQjuiHD+q8rXOmrRZ7K+yQ58BicIATTTV6kQZkTFT2mWpp/5tN
ksNlZ4ylBuKM5hks00q8TtoHeazb+QHuAoq9SMuGC59fsYOgn0V93TN17PSQY2rP
tWuDZ9Ok+viij4T8PyNeAEZU4xK0Cff/maiIRtdtwtI//QLjl/gJN7Yw4JU4UuxB
4/8UG0usLACCbHGyq15eNa31zvUUbxLcHpJXIoHTqYTRuzKeVZ/+aeO23YBUNogz
SBwhWJijs3OpKnwsK31CfX+dHnJeI1RxvNpQXjpF2zDcHafaCdzrZAgpfOug6q5F
gWX/MeIEbRhEPD5iojBNQYYmLj9ey4BwZG4GlVTlMhJC7VTNz7A=
=EfpF
-----END PGP SIGNATURE-----

--lamoghzxow5fsofh--

