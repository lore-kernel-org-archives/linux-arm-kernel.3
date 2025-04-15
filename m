Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9552C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5hzw3UWlyBWtKaqUctLttnh3UnjKuRPZkqWKkRDgxc=; b=xpOmbr6CiwGL3m2R8WZPOyzt99
	MsWrmV1m7xFmd+OH+izSuZXsWxAL4ct8e6Kdr1Op52DAGJzAjaUiDVBw+aZfKPvf9HGqV4sQJY5Z3
	L4JS01Im333Xb9ojtZBcwn0xrLdiYDkjjLVV7sfbq3JhAY1UTZOOlt0sUIdorVl7xJi3Fg5VJ2/W7
	ACtBbFHzQHlwdXylmRiRFgwa5VSU9KXARxE5N6WSpmQzAA/ub0feU1BRAzCz62rm9bjkn8nBHcW5E
	y3r7grjgsgssAVZHspiqLqYZNvxX0V8C2uIAwrS8/uQyg20wwQOISH8aRNFZTaxQN8yvKLeLshHPL
	1KBFFTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fkz-00000005oqF-32qi;
	Tue, 15 Apr 2025 12:51:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fio-00000005oVi-1oXA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744721341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h5hzw3UWlyBWtKaqUctLttnh3UnjKuRPZkqWKkRDgxc=;
	b=YjbuC5Dl5+qOruDEfVDqS/yGAUUJpU3gopYsRq15LoVOGl5nFO+raedG1RR2zJ7TLtuAL4
	bpD+yqoZ0bSjYmcQkGh/bCtYqkH5FN0IoOrrfpsDuwEs9jYgsNhsKmef9G30j33MJNxCov
	Nt55w+QOKEau7g5KWrGB3b3cxuhouAI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-YoXrO60wPNaJMwjumiX3Sg-1; Tue, 15 Apr 2025 08:47:25 -0400
X-MC-Unique: YoXrO60wPNaJMwjumiX3Sg-1
X-Mimecast-MFC-AGG-ID: YoXrO60wPNaJMwjumiX3Sg_1744721244
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c30f26e31so3700228f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721244; x=1745326044;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnvL/RzrZbvMsU8LLxk8J6aVRTg+wYgjgOPs3GeZ1OI=;
        b=QIo4sVdZ04E9K4b/X0jx5Yj4J5VGfwrGJHLBASCzodViYFGmxpDmL5nJeo7PK+u3C+
         UBcfQAizxp0IxWXyZennxWWYOairk3egtoqt1Th6RtX9GbN2EoPB/PU/pOPrt7dSCytL
         +j9c9xr/NnIK9ZnEde3bex1vU7m2Afb/JDaDvc69NtCQV8SPVcQBNG0bbppWXJst1FnN
         RpfGgAf3kbUDDE3OO5QUAspWQ6ZxC7BdCU9f7Oq9LW8d3DfKAxn1r1ThhovhpGoBeAgo
         KGXl9M+u4G87vYMa25oP33xL9JhFTmv+IVHjxogHPQRDlI5/1alPsOpnsrlUO4fg5O8I
         EnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1YeHS4ZCx9GV+ks5xRJabi45Qz42diyR4CC9jwuI93wnCBW/XtEw8mYUAK7w8d/ORfPSM2V3fQmOSRmCFqaog@lists.infradead.org
X-Gm-Message-State: AOJu0YwuCtVLrzkX8aRTMii1eXucLAPamcCx+nCnwQcGIR+8js8gBh4G
	pq86MNisQGiprkAYTPYMF04DAn3XlCLi7sRx4TXEqbciEuwvTe7/jjyNhCHjGNwC6k4hChbzlr2
	bBl/SPA7NFrvIgccX76wnDbHVEmi3ML96LdwvJGdTHAzGcaKUdrfLXygGFCW7EWrpW/S5fm+8
X-Gm-Gg: ASbGnctQPxS27h5KH84QEROS0mtAYmEy2A/OLgb/E7W7MBRoS8ORTUuQ3bjHlLax2ha
	gf4rUoJEpokq9K2ZSUHNJYFyn+a4V5TfQY9S1f+hijE2jYV6nGvrSW+lxtupJUEpgcpN6nHBUUN
	8lDkdGzA9B02vjRuxiwzpiZ8dJaTuFpDj9JbwJ0qY2DtQeWRm9q+h25wTmEmap3JZKlIWNgsruD
	nX5QnEV4ZsoZbPDxrXE3yIbjRC8zv2/rcvuKysL0XRIuLDnXlwuBpKTwchv2oEiuIKecGnv+x4s
	6bPxeuxokwJzT2ILCP1q5gsx6xda8WSYvnuMjI4=
X-Received: by 2002:a05:6000:40cb:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39edbecab22mr2873530f8f.58.1744721244531;
        Tue, 15 Apr 2025 05:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXUPk+FI5lntzdi59X0ntV/dg2Dh/FHAzlX7wLgVi/RsI8JfnVsjgzuQyhk0RPvQ5MlNQflQ==
X-Received: by 2002:a05:6000:40cb:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39edbecab22mr2873509f8f.58.1744721244204;
        Tue, 15 Apr 2025 05:47:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm14314316f8f.68.2025.04.15.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:47:23 -0700 (PDT)
Message-ID: <241fb4fa91f8e57d2bcc992b6a4fb3fffc9c87fc.camel@redhat.com>
Subject: Re: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Thomas Gleixner	 <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov	 <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"	
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra	
 <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 15 Apr 2025 14:47:21 +0200
In-Reply-To: <20250415123807.2MahJd60@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
	 <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
	 <20250415123807.2MahJd60@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rl8pJxiZaFGV_TrTYNeGF-7wTObFzwFwOYusLG5wGXo_1744721244
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_054902_548149_F7D3DB46 
X-CRM114-Status: GOOD (  20.00  )
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



On Tue, 2025-04-15 at 14:38 +0200, Nam Cao wrote:
> On Tue, Apr 15, 2025 at 02:31:43PM +0200, Gabriele Monaco wrote:
> > On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> > > +static int __init register_pagefault(void)
> > > +{
> > > +=09rv_register_monitor(&rv_pagefault, &rv_rtapp);
> > > +=09return 0;
> >=20
> > Any reason why you aren't returning the error value from the
> > monitor
> > registration?
>=20
> Copy-paste from dot2k :P

Mmh, you're right! All other monitors are broken in this sense..

>=20
> > Other than that, the monitor seems neat and reasonably easy to
> > generate.
> >=20
> > May not be necessary in this series, but try to keep compatibility
> > with
> > the userspace RV tool as well, you need to have some special case
> > in
> > its tracing components because fields are not matching:
> > =C2=A0# rv mon sleep -t
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcuc/11-108=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [011] event <CANT FIND FIELD
> > final_state>=C2=A0=C2=A0=20
> > (null) x (null)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> (null)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Y
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcuc/11-108=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [011] event <CANT FIND FIELD
> > final_state>=C2=A0=C2=A0=20
> > (null) x (null)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> (null)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Y
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktimers/11-109=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 [011] event <CANT FIND FIELD
> > final_state>=C2=A0=C2=A0=20
> > (null) x (null)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> (null)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Y
>=20
> I have this userspace RV tool in my "later" TODO list, if that's
> okay.
>=20
> Honestly, I haven't looked at what it does yet. perf already does
> what I
> need.

Yeah, no rush, the tool is mostly for enabling the monitor and reactors
in a single command, the rest (tracing) you can already do with perf,
trace-cmd and friends, after enabling the monitor manually, of course.

We may even consider integrating RV in other tools instead of
maintaining a separate one, but that's for another day.

Thanks,
Gabriele


