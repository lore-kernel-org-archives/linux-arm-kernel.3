Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52B9CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKRu7HdNzVMsiadoCAYqAnivQppIsxxdbnjlkOxlUeM=; b=p1/6trZx3vKs/ZXzPtfwwxzbqH
	hfZWlYkF5MVTegkMO9nYW1AVnF+Qp77A3rr6TGIuYAJHyd4oa6Xbp4nEE9XkwHc6nGRnudkl2SXtt
	TgkB6FQL/dQgbJIE4D7SG0c/eurfANlgVWmq9QbV1Ak/UDVEpqPk9e2fER4osPDY1g5seyS955yTn
	VTxdRn+I/KNZUoLBOjKeuKHIvuU5rJ403GKZL8jYNL5Z/WmlglvFVV1JiLYE89AXav+Qq+gcLx4pZ
	B8SP5pD/2kmtaXOh7Xq5aOk/1sMl2EF5OjTUzgu6X+Du94GwFWEuDdEsogEn954Bd9oCG4HqKuL1Q
	9wyOjnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaxl-00000008Ksk-21Gw;
	Sat, 10 Oct 2026 17:34:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaxi-00000008Ks8-1WDb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:34:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a168355946so3351355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791653660; x=1792258460; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKRu7HdNzVMsiadoCAYqAnivQppIsxxdbnjlkOxlUeM=;
        b=UAchGmhSiox5Pos8QeF0ibEGPjHrIOMN9YZg1Xf8qA/1D4IDmH3sghT1q6z31RZAa6
         fMt1zuZkc1PrWYa/WZ9bUBEItqD3lWrQhrZKyahrZHqRHLotMlb6bmUZa0ID2+BemZbl
         lKNUsoGXk3ZZIlg90emkoPIBTFKGrNxiUYx+DKrf2qxFvpR4UVBRggWcBZmmJA1lfJJF
         Wbocnm33gHC2kXS/GNenvUg4DbtkoBEhkOil1xecEtzOilFjxcGTBXomA8zGYgPZUyBO
         ytJk1KHyXdullA0mD10klzeohxE4t48tUusgkhhD6Pa67roTOw9KO5s5nad+ahLEWn8x
         OVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791653660; x=1792258460;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKRu7HdNzVMsiadoCAYqAnivQppIsxxdbnjlkOxlUeM=;
        b=yDBfUC/gWwFoyNDgyg+rPnCQyWbJS/WlUh2uMPXPSG2r6MlIvMrPrkUJRCw658E5xv
         +d6NKHiCWhd8+TLjtbxs0oYkeoiTgmoY/Z/p2G9+6jCqunNSgugRebtGKmIJQwEUmS91
         JO3nXf+O7sEeRw1rSDi2i/l3V1iB+o6hEDV98EdZ/3s1PivA7cBKM81eSoI9M/b1BWgi
         svk5dYyXz8c1pQ9z94URgKzoT4DfXlNOoV7/l8WS+txyeMsA6JXTqKGWsw7fX1pcmSgw
         Gl/s2cUQa6HybgiJd+8lWLBI1t8DZFQE16N5KX0aLyfQ8RTXHPWU538twGYfw1UZvhI2
         0bdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxlCnQVRbzYs29VtjybwltbdL0tma6uTUIATavDZqMKfzs/g8KNADsarZ4dmR4kh71nQPGix/YIwap3d69pDOd@lists.infradead.org
X-Gm-Message-State: AFq9FYIq0nlQTO2LfPjIpMMUAlBENk///rMRva+erjp5Joppsci8M8L5
	tNpfI5UqXX/mLEkwym0ei9htxPkFS3UtHB5tujNAk0xM0pEmekHwRaYI
X-Gm-Gg: AYBFou3fZ7QIrDx+F9Jmk1uyCApWfLJ0hHmrGgYMvglWzBJRDeOnOKa4RhpW1v0HkTW
	TTmvMou/hRsDno9yXQDNcTky6Scrol4h+Sv+wZOq3VcSOXnyPEunmoLDhpXTB0Q+J86LZl+HhjV
	wHOHloN2uioQOAhzDKSpAo9Eh8yu0hhbrC2GCWdkTxi3Iyc2pFRwP9mG1nfeqOD77SpOR4LOp2H
	ui1uGSdcsx2caGKmqAKEBsUbW4Eu7l/A2OKESI0iO3R30Sqt+71gE8HgZLvqy/aRprrxJF2+93E
	DpkCCeXl4mawG/BD0qITQpLAcavo8umO0cq1+Y1qiY2n7wsxhOEBFp96AXCpvaExpgJ6aqNdl+5
	0n/7r6bnsiEKzgZEoypVI4d7HwvrGblivV1ZLVwqlaqL0ofPFUbi2H7zCA9UlH3Bx9OaBYUVR7n
	+KHPBQDeOXqaWprgqz8EvRzmLtb/7VmHVWwKwxgYRcAli3/VywdcFhgXT00HPC+/n338TZHuscz
	XuzJdHTwPGcbuXd0laB/r2A3J8defmaRqyvqo+F0pOxtmGne+Ef4wUQnyLuuQOx+KmA
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr95276415e9.24.1791653659818;
        Sat, 10 Oct 2026 10:34:19 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm225253335e9.9.2026.10.10.10.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:34:18 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Sat, 10 Oct 2026 19:34:13 +0200
Message-ID: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
In-Reply-To: <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-6-ghahramani.navid@gmail.com>
 <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartHDvldZc3SQG5Th3laDZZWQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_103422_441082_6FAD7D96 
X-CRM114-Status: GOOD (  15.49  )
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

--nextPartHDvldZc3SQG5Th3laDZZWQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Sat, 10 Oct 2026 19:34:13 +0200
Message-ID: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
In-Reply-To: <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
MIME-Version: 1.0

Hi Arnd, Navid,

Am Samstag, 10. Oktober 2026, 16:13:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Arnd Bergmann:
> Since this is really the same platform, I would expect to have a single
> maintainer or team of maintainers. Since Stefan is already established
> here, I would ask you to work with him first on reviewing the code and
> deciding how the two of you split the responsibilities going forward,
> but I don't think that having two separate platforms with separate
> maintainers is going to work.

I am open to co-maintainership of the ZTE zx platform, especially for thing=
s=20
where I don't have hardware access.

I am away from home in the next 3 weeks, but  I hope to have time to review=
=20
the submission this weekend.

Cheers,
Stefan

--nextPartHDvldZc3SQG5Th3laDZZWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrKdxUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi6kkP/RG6WnFV5gj1JCoG6Q9f
ICCEtnIljgeZva2tToM2fAt9qUZIRikEM9uAGBZPei7hdRw+ZXsS3fTqSO0FDUe/
/xfq7VVNyJsg+ZwPbVblrMT9sz2Bh0375uzmKLZjaCulV+X4iDBjRI53f5wZIRGT
2lVBkqRtLY878ohMFCLsz9xYeXabFk04pSTTrzs0mjBHx+54t+9otTeWZEGOrdL+
8P5GYr/5+GiUq9Jz42Ljf1FRSE144h5A+uUhmV8jK4TI/Xb35zOcePtrvPNqPlGn
UqdvU3zyTdwDiNCD65sWJY2aybvBnwqo5F8Lo/zOJLy0wQgk6prGH9F/T99jOfz5
UTuQZOd8i4QTvaTO+f6LJ83Tz8MYVJlPgU/FZ7I5JgwWqROjZNpFigxWMf52HKoY
qaMbAEy7IPpjQiwwkq1fONLG5aTsBzqcMF+Ag6uEDd909g/+0QF9pOZfuwn22R9q
yt2UwnehepuDAugH4WRvc3MU/80vtAEYvqFD7yNcD6bCRLqZ7swa3LRrTctsa2hd
Ued585nUL/8fBWoxUYMv5eHdZDaCXH9nzZTq7RnDihHpYXbBFu5yPJG1E52Qr7hX
HrnQ3xCxkyEsnUptAZDaYBELBgDqNSB01TsbwSSkhMZDuNEV4N1VWedM2BF8F8R3
uc0b/CW9PV6gQClt6S7P8ZwC
=xuKY
-----END PGP SIGNATURE-----

--nextPartHDvldZc3SQG5Th3laDZZWQ--




