Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6CEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmwvad3sP5KH1M9EHRnWoRE2uH0qjs9wsa6Y2AYYoH4=; b=1ZPjzo8A8qPeuMc7pMS0Rgy5Br
	/NPT+FKB7OMLd00hudxhJaAznKZQxYogaxhttp09DTPh/POLw6l0YK26IsaSCXfljFgPiNiCTZ4sX
	Y2Qn00SikPQRDYXEX43eAOLf0AKY/8+1hbisirwGDhQwFKsI4ABulJ+FyTKH/WPSEGA1paN9JlLe5
	M7wqpBeTqbDSH8WBdU7Bn6dPUXO1PDzj8rDJgsjHMbItkQMx37nrkjd4KA5WO2v8h+Sb/MDzFy3mQ
	yoLY0tUwwCeh+7VL1txaHDtHgvdmYcKbvamm2I2GOY9xv9kClWd+C+wCUabOmK1saudjsgkwQJ+BB
	Ni8TorRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLJh-00000000tu6-0dr2;
	Tue, 04 Feb 2025 15:58:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLHM-00000000tTA-42Wp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738684558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmwvad3sP5KH1M9EHRnWoRE2uH0qjs9wsa6Y2AYYoH4=;
	b=CeC+NI/fgJYftQTNbtr7Yb+qgD+HU26fBCYbePxGQL+cOMIvxeLdeRHKoOq10S/xM6/1Tk
	rO4NaCSuxpcf4Tv6D7n++emTafllEQRLI8ZbajZW2t1KlLvt4Snj53jF+qW7tIPO2JNTT0
	gx1r1ksiBxLrzTLyEU9K91FwcEHCuEg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-sqkfSFqZNhmIFaQ0YFZQsA-1; Tue, 04 Feb 2025 10:55:57 -0500
X-MC-Unique: sqkfSFqZNhmIFaQ0YFZQsA-1
X-Mimecast-MFC-AGG-ID: sqkfSFqZNhmIFaQ0YFZQsA
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166e907b5eso106117155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 07:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684556; x=1739289356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHA5n+S/iTeDuepKilTvz6ND30zMbXENAZtKc27qXbg=;
        b=vilcDTAD2qcoEAIDfEj67B9b+98dopmhNW2Rbz0ptJwQnWglk3gzIZPG+AFFpnz3Po
         EGk0P9hMIzdld2hnPJa3Y1ov/tpMkEUl7/uyGh7OeczjQ0YBWgcGLOI7AaeVfTcJ4mCw
         awIvJnaE/6/cj1KBKBgmVuPJB8yI7SXKy33S6OE9nmv5dBz1Xn5UTjkq7SQ7C3zE64Nl
         Yyr1zUbjuRI41lcQLaCFq9PYtW8QuzTJ/QMuh9um9sVs6DLKGoOtlOerfrUkPW9Dt7Ia
         g6/jStbCgeiVhlqRaqz12U1sWavSjbLlyKBUZ0n5oZQIm9XuE2UMPRbiZPy2ddKfPy2O
         BH9g==
X-Gm-Message-State: AOJu0Yw334gDfDZBV2/7Uf7SdP+u74knNL6z7oc25vDUqfnimJ6MfXE1
	tZxOdpk5er43468a1ZDlSGOdVqtCUy82IcuK+Qpg7pzmv4lfcPk1eCnOl3xjKYSN62hvQiyAJaZ
	rquKjBgaUrGA3OuUp19kZ89WRS5RRkewkjvfhB1nwMxH62Xwck0pmOW8OvTsJ6r7XV5FOHpaT
X-Gm-Gg: ASbGncttISfVF+DsqQLpeOFO+oAXA1aY+R9bQwAq5oZknHPUDmNCo+UPLOCy/hYJehi
	L7sT66VZHEWdp6hImZ0A3vxvBAz7qDuSiG5azt7wPcFcf6spIZz9BQTcaTb3PECaQ6/qS1ed/Px
	SvIMB3SR7UZa4qmpvMiwHHzdrUEPqyDHdaNMPSx0FOKRENnk+KSARnp5LDZldmB08vAE/dLed7v
	mudNnbkZ7zH1kI3rs6eLWtCe7HIzgEV+B4qACgpaWM5Ef44Sk80OsaHfYnCfzzfD7DZOhF7rTLS
	9BDL0hQd8pENKN+eDm6gIBXz93Te8HphUoraEHQnQtsP3JkaJ4Babr7UhIkDBLHvZxoVIpxe
X-Received: by 2002:a17:902:e891:b0:21e:fe8e:b571 with SMTP id d9443c01a7336-21efe8eb95dmr68075545ad.36.1738684556125;
        Tue, 04 Feb 2025 07:55:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrFmtjODSpXGmHzJtrdvBB+cmU1ZpLxOpVrvP25PwdzCgheFKm04SuuMTr6U4h3/RZpOaQAg==
X-Received: by 2002:a17:902:e891:b0:21e:fe8e:b571 with SMTP id d9443c01a7336-21efe8eb95dmr68075225ad.36.1738684555797;
        Tue, 04 Feb 2025 07:55:55 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f0dcab345sm7396375ad.72.2025.02.04.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:55:55 -0800 (PST)
Message-ID: <bc37567a390a5ebe1fac2a196358ac139c751561.camel@redhat.com>
Subject: Re: [PATCH] arm64: cacheinfo: Avoid out-of-bounds write to
 cacheinfo array
From: Radu Rendec <rrendec@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>
Date: Tue, 04 Feb 2025 10:55:53 -0500
In-Reply-To: <20250204123955.GD1063@willie-the-truck>
References: <20250123181159.1849346-1-rrendec@redhat.com>
	 <20250204123955.GD1063@willie-the-truck>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: et2XzvdIH6wfC8ybrktE_eR8XUwWnMqYq3fDsSS7058_1738684556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_075601_067515_D12DD699 
X-CRM114-Status: GOOD (  15.46  )
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

On Tue, 2025-02-04 at 12:39 +0000, Will Deacon wrote:
> On Thu, Jan 23, 2025 at 01:11:59PM -0500, Radu Rendec wrote:
> > diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinf=
o.c
> > index d9c9218fa1fdd..77ffda7284754 100644
> > --- a/arch/arm64/kernel/cacheinfo.c
> > +++ b/arch/arm64/kernel/cacheinfo.c
> > @@ -101,16 +101,18 @@ int populate_cache_leaves(unsigned int cpu)
> > =C2=A0=09unsigned int level, idx;
> > =C2=A0=09enum cache_type type;
> > =C2=A0=09struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
> > -=09struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
> > +=09struct cacheinfo *infos =3D this_cpu_ci->info_list;
> > =C2=A0
> > =C2=A0=09for (idx =3D 0, level =3D 1; level <=3D this_cpu_ci->num_level=
s &&
> > -=09=C2=A0=C2=A0=C2=A0=C2=A0 idx < this_cpu_ci->num_leaves; idx++, leve=
l++) {
> > +=09=C2=A0=C2=A0=C2=A0=C2=A0 idx < this_cpu_ci->num_leaves; level++) {
> > =C2=A0=09=09type =3D get_cache_type(level);
> > =C2=A0=09=09if (type =3D=3D CACHE_TYPE_SEPARATE) {
> > -=09=09=09ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> > -=09=09=09ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > +=09=09=09if (idx + 2 > this_cpu_ci->num_leaves)
> > +=09=09=09=09break;
>=20
> Why are you checking 'idx + 2' rather than 'idx + 1'?

I don't like "magic constants", and I thought "idx + 2" would be more
suggestive since 2 elements were added.

The check is correct though. For example, if this_cpu_ci->num_leaves =3D 3
(the array size is 3) and idx =3D 2, then 2 + 2 > 3 is true, so you can't
add two more elements. On the other hand, if idx =3D 1, then 1 + 2 > 3 is
false, so you can add the two elements (at indices 1 and 2).

If there's a strong preference for "idx + 1", I can change it. But then
of course ">" will need to change to ">=3D" as well.

--=20
Thanks,
Radu


