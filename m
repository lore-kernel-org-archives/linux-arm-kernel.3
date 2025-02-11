Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9E8C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxKXnlOOBqsBwwrNI1x2D/yzjPQCMqMA1f8yAIfnnZg=; b=iDAkm+173XB4746ARo8f6XPDmJ
	5RhObfAtYQhpFRYYvMjrOYqX4vxesKj0zfqSqPtw6bcl9p4R2EV2lkhmLLEC3jlPJjSsGe4fvML3v
	fCshrrVqeE11Zeu9hIsMog8n4CX7MKbeYpWZAwdnrKvrwL9cgQrn7CV7vGwJrwCXv8LLZG/lWhWGm
	j0CyM9W+wkI/aGjWC5ZZEY+Kio8zXlm3Md2/peFrhdr2oQsLJhlTIIS0o/2t5mZn7IxUGLFEWYOVN
	qE9QVUZ3JYvHP54LeVKEJC2uNFmfJ3Wxe27i0igLzbRWHpBSDkxKFG0UXlflyTS7rwZgbQI5WOQww
	pgeU4zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmUf-000000039TW-3pwa;
	Tue, 11 Feb 2025 09:23:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmTG-000000039HH-34Kt;
	Tue, 11 Feb 2025 09:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hxKXnlOOBqsBwwrNI1x2D/yzjPQCMqMA1f8yAIfnnZg=; b=SMpZUil7Q2UxCxPokTtCPmiMxM
	ElYFvgDSVUh6Gls4/r/jdJKA47pgtDA0Wg1c5MYR94KJXpyjb0UHYlrocp3KDJ4XrNRpKgXNliQE9
	F9xBVGn0Xzo89d8BZ4X6kB1Ygy4vrt6Rgo4fQ/pfa1kWVeb01mS7og1TWT919BGcCnApXqOkCCdVF
	G3zPfMQc2loplSCQmfW91BANbPdAPdYwrX45fwfFCrAPCeuOWwFTPEMTIbMeRA9wCdH5JGmm12Nv5
	RvwmZoLYgtuCh8etuRNO10a4ag9T0TbkXa1E+aZfKWqs555ii7tX5wAZX6ApBP4E+AcdbjzGCNTRA
	5sk+c0iQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmTD-00000000XYk-1AMq;
	Tue, 11 Feb 2025 09:22:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1748501f8f.0;
        Tue, 11 Feb 2025 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739265736; x=1739870536; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hxKXnlOOBqsBwwrNI1x2D/yzjPQCMqMA1f8yAIfnnZg=;
        b=mPpWv6jQS5RDyVvKM2q+hVD/tBeZ/WJQwbNaTHkxaEOMXNip6i9yXYZ3dXoCfvzmw+
         yHKirMfrWe3Pf4Cm3vfO/1TpsL3U0teO/Tu6gGxlkmVgbmHrlVj+CnHx3/1iH19HjX/o
         3Mh723yqCFFv1m9Q7T9bmBp9K2A4neMAOpskCTbsvq4rexCBL4PiDBnKqn+oea9X20+g
         uw8hx54XoXVCg3JZLn+avzxJygFkd/pJrlih+geD9DLixVczx94L/Yu2yR1KACCAnwYf
         rp0glgAkCTjyU6I5aY66Hkz5zX4pzD/M+zsP/2GeywXcgTxrKW8PGDKbwOSjIYWDR+2Z
         bDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265736; x=1739870536;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxKXnlOOBqsBwwrNI1x2D/yzjPQCMqMA1f8yAIfnnZg=;
        b=DcE/aGuiixaHjjZOwE/M87oKnEP+qL08HC98h1bUOnLft14jDVY37qYhNCPKOvbnuE
         tLaCubmi07C2F8T2lAf6wyQj6mcF/dn4Xncar+z8dQmqjsW27MHNXN3zIfWhfHVkPipM
         QLNDw4HUSV5CDVhzPRiEMgibmq7GC+RIEw4S1sH8zcJB+W0zLLEk7MUPmdR/nkQTiRZO
         nIor/BozTJOoeqgnvsTx/Sqi1qZcoo34JA6HMtwE3KQ9yLZ3Bh/wZHPi5NJPSjqVVCKc
         zIXG+xharXzUX2zYZ2S8qJeExcWktWIExWM7rt4TofqUNReCRJIYv8m8u94xDltuLfF+
         /eGA==
X-Forwarded-Encrypted: i=1; AJvYcCUHEMvi5E24tzvdmSqraG6kmVVAcQyzTZOgVVbHEN/bOLk6Fgnm/jar9mZWC1dK6Piq7tMYuHQP1d+LzuE=@lists.infradead.org, AJvYcCXQ+Bar1iUrMD5Zl70cegVSEHyEKhtM/D3b8AHFIAEIYUdjzgL7qFZ6b0B+crzEYAeDJnf7B+Xll1yKa2g7FG6/@lists.infradead.org
X-Gm-Message-State: AOJu0YxoxrLuYDrWzxXi8Hm+H29ac4KPdXRR8DXPFXmOl08zaCPanjtB
	BoLLyK2S0IzlfktHuguVbQHNbyuewEaSmz2qqbUDC1w+jk3VERFp
X-Gm-Gg: ASbGncvHz21oDw0N0AlHScLyO3/Xy69IQ3hIiDK/NWC8EYCKFFjDsMAIVdAef2s7pWs
	F7iWHusdFNIVavg+U8DeTRQzLaWkqlSQoKcQMhJngfAcqgEskWHDezbFPBIlfhBgcLvSO4+gyWm
	GTMR75Px0csDyn8Q4KGYAV3qCwBuOPaf1oV0CSnv3CfY+HHpdV/FnEWT3t5Mm4ZdRWMQFlkpSR0
	qdCe/1RplYMj5Ozo6haUhARMDjeR4UM7lKP8Ov7NAtMg6hsSP2hZPxcK8KeLTBQ7exgTO/vwUZj
	yxigslQTc/MBdxbpUMNgGgleiEkOk1p+
X-Google-Smtp-Source: AGHT+IFinbmenD29Rw/0Uw611+rQ/E82ABxvNPKgQBCneBqnOXKQlDtW2JU9WvLJiNHkyHeRBhYRgA==
X-Received: by 2002:a5d:5f54:0:b0:38d:dffc:c144 with SMTP id ffacd0b85a97d-38ddffcc651mr5300952f8f.55.1739265736486;
        Tue, 11 Feb 2025 01:22:16 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394f3b8846sm8075945e9.1.2025.02.11.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:22:16 -0800 (PST)
Message-ID: <6b3cbd15b62a45b44cae2013fec11eb2c5504fa3.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Tue, 11 Feb 2025 10:22:13 +0100
In-Reply-To: <bf8f3ea1-6fb5-40d1-a823-b3bc272a2257@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
	 <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
	 <bf8f3ea1-6fb5-40d1-a823-b3bc272a2257@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092219_513691_B0622C5A 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Krzysztof!

On Tue, 2025-02-11 at 09:07 +0100, Krzysztof Kozlowski wrote:
> > > > +&clk {
> > > > +	compatible =3D "sophgo,sg2000-clk";
> > >=20
> > >=20
> > > That's discouraged practice. If you need to define compatible, it mea=
ns
> > > the block is not shared between designs and must not be in common DTS=
I.
> >=20
> > That doesn't come from my series, that's how original cv18xx.dtsi has b=
een
>=20
> You can change the other file to match real hardware. But if original
> cv18xx.dtsi has incorrect or imprecise compatible, I wonder how does it
> work....

cv18xx.dtsi doesn't have any "compatible". They define it for every SoC ind=
ividually.
So it's same MMIO window, different compatible. Looking into the driver I c=
an tell
that even the register map is the same, but they expose (and pre-enable) di=
fferent
subsets on different SoCs.

--=20
Alexander Sverdlin.


