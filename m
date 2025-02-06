Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35DEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8wiv1UFeF5daypgLNnkA8k+FKehfEILLSYFEtag8nQ=; b=eRKa1kq5diHgpglBgUHKad0RkC
	mkmiJEeOwEOtjwMEC+iPGh/mTMxQuQROmMYbSY113W15Sz0/sPb5NTHO11//50GOl4qmYUYnOROJ4
	4UPxRoObXvd1DxmoW9oLxoGecP4+3h3MqxZ4Vu7cV9fpuGcTArgd0TJjmjBAUADdWa8AbqAwzn1Sh
	Uz5UUBYeWYtqRD66yP8kiiHu6prj/JDXVhqlq390Gv9+61kXN9WnNSYma3D31pEZFETE63BBXvlAv
	15xz02rDaS7n0c+P5K/jXSO9ZQHpcMfCXvEC2PM66WpbC3r8gSo4IlyRrsdhx36c1D+tkZ0K9PZ6s
	LlZdWieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3nZ-00000006hvA-2rvB;
	Thu, 06 Feb 2025 15:28:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3iD-00000006hDv-33zK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738855359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8wiv1UFeF5daypgLNnkA8k+FKehfEILLSYFEtag8nQ=;
	b=cIePmnRcYf1vliWjGReTX6rdBvnOILhl11yCuxXuPZp3BKaHZmV65XpUAPe0tktp+wHsx3
	MQ+aoMgpJeHlIaq/kHE74+h6xR2ngMeJXHZAzecBsaHta2emmVslnULI8qnfIr4dVXeln8
	3jxZp5nKW91FDP+BYbL5MjtzdxUE3T0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-RcxHZ1MRMXyMuNUzvOKTYA-1; Thu, 06 Feb 2025 10:22:36 -0500
X-MC-Unique: RcxHZ1MRMXyMuNUzvOKTYA-1
X-Mimecast-MFC-AGG-ID: RcxHZ1MRMXyMuNUzvOKTYA
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e433680e07so21361346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 07:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855356; x=1739460156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NFq9H4xzFSAei+rLqp5nsYutfgP4NhNUe6F6I53Ixk=;
        b=S8HrHxa4MBzSnZVr44ZOMRbf8P0twZmCC/3++XGVUecx10sg2ynbzZr5j6IyW0g9VS
         fSTRTz8XqeTKa16gYJCFvhs0WqUBhSTeW19dytx38TCQd5bL9pu4ZIz3ksd+aZcLMLVF
         h2bYnCjFl2x/ZEwPlxd4p38tu4VJLjKoBRsy35IPbewsuusSl+RH9UJzsZGTQuqHr/9S
         P590IzhmxcznqyW8hDMoKJBoPO4xgwFjGsDQ+d5yAgmY+V2PuSd5BAnXDvLOkjG5asZ/
         3vMxUQZ3RSEf2xD96thRjdks7hmyFSKDtMReZXyd2lJX2b1eVRNhBpJyY2EFkYMNF0SP
         3xGQ==
X-Gm-Message-State: AOJu0YwMs9jIYa7+bhu84IVEtp4Tfusmjw95XSxBUgK4lHXCKfPi40K8
	LXxrtLH96TS2E6YyF2I0KCEeIb7jtyKhXO5bBE7hKsVimYHfrSkVtghR+hBXjhkxtaF3/mD6hVc
	QqriR7sZni+vFxbHZYzqjDgJzLL4ztRJ59iblCCpf0SydvwGjVvEYgmpvlPwYQytfQYGGd5+L
X-Gm-Gg: ASbGncso1cSsyaF56nfTxhUQOq2ZQHFDKZEX4z5bQ4kclGKGXyWe9UtKk3i1ssM+4tR
	qslRs2MFwLLIIjXfBsqva6EZzMeDx9imYHMR+1vBatRnTlVldMZ67h1iV/02gZg4CUuqIPx0Ug1
	sfRW5iFY7E+QFsv/OZvoeqRNCZtT2t881NUzjrvMEaZwxcE6gaheJUc+1s1ZO/qM2Syp3iP+beS
	Vo2UwTXsWgWF8usBrEb/ukEK7KWO5oULfqzrGBeIxzWxJY1EPyQFwZmSlug53DREYjQ4QuUQTgL
	hgdHQ59+5DsYmU7umF0ilVJ4GeFWP+TDjhZsypkfrcIuOvI8e2wPW/s72o2aTsYZ5IJcUDgB
X-Received: by 2002:ad4:5ba3:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6e42fc4596emr90050546d6.33.1738855355813;
        Thu, 06 Feb 2025 07:22:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZBomskQjXv/yjz790a4y8HP1KFNYr9pAPvFI1pJr69NYxgJJffFxrdg7+GOugUsAv1PyziA==
X-Received: by 2002:ad4:5ba3:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6e42fc4596emr90050286d6.33.1738855355535;
        Thu, 06 Feb 2025 07:22:35 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43ba2bfbasm6704836d6.1.2025.02.06.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 07:22:35 -0800 (PST)
Message-ID: <2106533f69de3e9d699317fffb7cafb6eecce0c9.camel@redhat.com>
Subject: Re: [PATCH] arm64: cacheinfo: Avoid out-of-bounds write to
 cacheinfo array
From: Radu Rendec <rrendec@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>
Date: Thu, 06 Feb 2025 10:22:33 -0500
In-Reply-To: <20250206130213.GA3204@willie-the-truck>
References: <20250123181159.1849346-1-rrendec@redhat.com>
	 <20250204123955.GD1063@willie-the-truck>
	 <bc37567a390a5ebe1fac2a196358ac139c751561.camel@redhat.com>
	 <20250206130213.GA3204@willie-the-truck>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gyp_Yf7mvR4k8sOqMSMmTa2vaFMJic78GA-lGQLASi0_1738855356
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_072241_842213_41DDF0AC 
X-CRM114-Status: GOOD (  23.54  )
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

On Thu, 2025-02-06 at 13:02 +0000, Will Deacon wrote:
> On Tue, Feb 04, 2025 at 10:55:53AM -0500, Radu Rendec wrote:
> > On Tue, 2025-02-04 at 12:39 +0000, Will Deacon wrote:
> > > On Thu, Jan 23, 2025 at 01:11:59PM -0500, Radu Rendec wrote:
> > > > diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cach=
einfo.c
> > > > index d9c9218fa1fdd..77ffda7284754 100644
> > > > --- a/arch/arm64/kernel/cacheinfo.c
> > > > +++ b/arch/arm64/kernel/cacheinfo.c
> > > > @@ -101,16 +101,18 @@ int populate_cache_leaves(unsigned int cpu)
> > > > =C2=A0=09unsigned int level, idx;
> > > > =C2=A0=09enum cache_type type;
> > > > =C2=A0=09struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cp=
u);
> > > > -=09struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
> > > > +=09struct cacheinfo *infos =3D this_cpu_ci->info_list;
> > > > =C2=A0
> > > > =C2=A0=09for (idx =3D 0, level =3D 1; level <=3D this_cpu_ci->num_l=
evels &&
> > > > -=09=C2=A0=C2=A0=C2=A0=C2=A0 idx < this_cpu_ci->num_leaves; idx++, =
level++) {
> > > > +=09=C2=A0=C2=A0=C2=A0=C2=A0 idx < this_cpu_ci->num_leaves; level++=
) {
> > > > =C2=A0=09=09type =3D get_cache_type(level);
> > > > =C2=A0=09=09if (type =3D=3D CACHE_TYPE_SEPARATE) {
> > > > -=09=09=09ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> > > > -=09=09=09ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> > > > +=09=09=09if (idx + 2 > this_cpu_ci->num_leaves)
> > > > +=09=09=09=09break;
> > >=20
> > > Why are you checking 'idx + 2' rather than 'idx + 1'?
> >=20
> > I don't like "magic constants", and I thought "idx + 2" would be more
> > suggestive since 2 elements were added.
> >=20
> > The check is correct though. For example, if this_cpu_ci->num_leaves =
=3D 3
> > (the array size is 3) and idx =3D 2, then 2 + 2 > 3 is true, so you can=
't
> > add two more elements. On the other hand, if idx =3D 1, then 1 + 2 > 3 =
is
> > false, so you can add the two elements (at indices 1 and 2).
> >=20
> > If there's a strong preference for "idx + 1", I can change it. But then
> > of course ">" will need to change to ">=3D" as well.
>=20
> Might just be me, but I'd personally find that clearer given that we're
> assigning to infos[idx] and infos[idx + 1].

Fair enough. I don't feel strongly about it, and since nobody else has
chimed in, I will make the change and post v2.

--=20
Thanks,
Radu


