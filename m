Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6E1CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8VL8F1BbEiYOKI5l4LcZTZfjaaIUn5rioPCVGdYu3M=; b=2bx1whS4UeQG9J0PqfdneYj59C
	6v1w7yUCGlH2T0oZfVTrl7MnjRS3h/dbULqCr1ZnljWyZdHVT3lXDfZI03lm6/tqFUNMJqgra8Thg
	tMHpetmzuqIUG8UGW+e4Xf+eeRDVPMncKvi90XnJh1o5UOkeMwYvPPSFsxYhz6c8CmqbEiV77jRek
	cGl3GeqlB12p4tiea5tHdZp/j6XnP5btQUJ+izu+6sj5UiZon41qdI1XvBio1aNFxn1V9YerPl/nP
	a9YnroBXaeRWef35AaezFyK90oUIqWT3T3xrXwqzY4EDd4QuRFNShUpD+9hsgcoCCA4mjspXCifRg
	zr5YCd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE382-00000000dp1-3h2i;
	Wed, 29 Oct 2025 10:10:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE37v-00000000djN-3CCU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761732597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8VL8F1BbEiYOKI5l4LcZTZfjaaIUn5rioPCVGdYu3M=;
	b=H7s3W98/2qjA8nqf2vUL6eNZ/NMTCv93A4GGsLNlYyPE9THelNIWh3BFsLN8DTCQwyIhGy
	PDNs4z+N6q5qyHlVZXvEAFfFFLRa+P+CIYHv1fOOS5x9iFRVpzxpL1E4vHbeUw0qVr7xO8
	HIQamnIJt5/N7U1xlON9KL9bZlmtLlE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-4UNgmbuYNiW7watzVyRzLA-1; Wed, 29 Oct 2025 06:09:55 -0400
X-MC-Unique: 4UNgmbuYNiW7watzVyRzLA-1
X-Mimecast-MFC-AGG-ID: 4UNgmbuYNiW7watzVyRzLA_1761732594
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4270a273b6eso5370460f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 03:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732594; x=1762337394;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7va99Zg9nu4+XxtsT3y+i0Qg89ua4ByIHfysL3F+F4=;
        b=Ml9p6/Thgbo5i2ZZiv2ytsN9SPe7hDOY9nJcv1XbKXtWw0VaA7nuY9/ADzUy1DiNHI
         n8ylerROCpJqTHUguQXzkOxOyQbP8Ygi4W8eO7EC/S1KHFFWFTpe0v9mINBaHK72QqVm
         JO1UHZGcHGt+69psBM0Ee2rq2JklBjttx3KaDi1Fd6dh0EpuHdPeJUZNXYjUaxUDVovn
         OdRTcRvNeuIDXbcdHi0G7rIQTkHWCCyByK2j554CKuWn5TwjDTyoeGWL6E0gIBf3XzuY
         clg4X0uPyLPUftEirg+TZxyybfapJ5rXBOsTRMe+ylZBTXVTlKhL2mrgoRrGYsHj9i2d
         CpoA==
X-Forwarded-Encrypted: i=1; AJvYcCUay3bseE7daxhne3XqJzg9H/SagMfDHW6fgLlG2iWnrJ3DA7UDUZFlj3w1WoKpM4fHnij7HUKQyDfnfUmVKslk@lists.infradead.org
X-Gm-Message-State: AOJu0YyAMvR6m+jFcahZqU6CTNvKfOCvNI1sKXlGrLbe5+5gM6DDvbjA
	PPnosnzVosuKXLuxhz5VEGGI6RrHb3uiO3MV9WudNzNpxoK3kl/a2Rh2XfpA6ibkKSXRRfcl1Y2
	Cd9Xld+Yy+ZSg9jo5x1C+TyTFmJ9wvJR6NGWvXR9HqlAx0I8M8PhPxLXsTQI5P+GLAQfhxdJa9j
	ea
X-Gm-Gg: ASbGncufAwe6fh/dakprc9R54RmOa/XHJ2Ve2GYGx39owphjH4ZUcO90iK/Vpf466TL
	yXHADl8Vi0mj8e/r9DnKXGbH5PHI5cJ5LRM36raQsXhXvRVMP3wMMdlSBmFhexlzwriHThMz8vk
	wT/hcVZTQul8eXGAEoHOcxFP09nstuaXaW5JdXd4a3zygp+pi4RBXF3PnhdxscQ0t2tTJ4+WHp1
	I89g7NzB3akEIlNFx263DwdasnRbLyRMWceEYPLAl++2XbTfeEPk8goUoCOZKiylSZj/L/Bp014
	4Luvuwqubd/pnd2FUbBr6BvRtk5xjp2xml3GPfjsRhy99Um8jWvMRNhrEUnVAThBCX3jDDm0rNX
	3NeSx6+ggKfHarB2IPwjLS3+59cQws4DNa5XBuV6DdCN4jXi5s7KQlvpYZV8b
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1733941f8f.18.1761732594356;
        Wed, 29 Oct 2025 03:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMwZOd1Sm4LKIO70Dn8iCGAQm9z32hncQVtTx+dFITCY/jcrLahS/V2gOWr58H4oqqEmvh5w==
X-Received: by 2002:a05:6000:2089:b0:428:4354:aa43 with SMTP id ffacd0b85a97d-429aef83083mr1733872f8f.18.1761732593822;
        Wed, 29 Oct 2025 03:09:53 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm25467518f8f.47.2025.10.29.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:09:52 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Nicolas
 Saenz Julienne <nsaenzju@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 23/29] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <aQDMfu0tzecFzoGr@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-24-vschneid@redhat.com>
 <aQDMfu0tzecFzoGr@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:09:50 +0100
Message-ID: <xhsmh5xbyqas1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _gXJJgExueDPQ5tiwQeBqIguF0oSN_xvSwbMb7X7_t0_1761732594
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_030959_878886_E21E22B8 
X-CRM114-Status: GOOD (  20.71  )
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

On 28/10/25 15:00, Frederic Weisbecker wrote:
> Le Fri, Oct 10, 2025 at 05:38:33PM +0200, Valentin Schneider a =C3=A9crit=
 :
>> +=09old =3D atomic_read(&ct->state);
>> +
>> +=09/*
>> +=09 * The work bit must only be set if the target CPU is not executing
>> +=09 * in kernelspace.
>> +=09 * CT_RCU_WATCHING is used as a proxy for that - if the bit is set, =
we
>> +=09 * know for sure the CPU is executing in the kernel whether that be =
in
>> +=09 * NMI, IRQ or process context.
>> +=09 * Set CT_RCU_WATCHING here and let the cmpxchg do the check for us;
>> +=09 * the state could change between the atomic_read() and the cmpxchg(=
).
>> +=09 */
>> +=09old |=3D CT_RCU_WATCHING;
>
> Most of the time, the task should be either idle or in userspace. I'm sti=
ll not
> sure why you start with a bet that the CPU is in the kernel with RCU watc=
hing.
>

Right I think I got that the wrong way around when I switched to using
CT_RCU_WATCHING vs CT_STATE_KERNEL. That wants to be

  old &=3D ~CT_RCU_WATCHING;

i.e. bet the CPU is NOHZ-idle, if it's not the cmpxchg fails and we don't
store the work bit.

>> +=09/*
>> +=09 * Try setting the work until either
>> +=09 * - the target CPU has entered kernelspace
>> +=09 * - the work has been set
>> +=09 */
>> +=09do {
>> +=09=09ret =3D atomic_try_cmpxchg(&ct->state, &old, old | (work << CT_WO=
RK_START));
>> +=09} while (!ret && !(old & CT_RCU_WATCHING));
>
> So this applies blindly to idle as well, right? It should work but note t=
hat
> idle entry code before RCU watches is also fragile.
>

Yeah I remember losing some hair trying to grok the idle entry situation;
we could keep this purely NOHZ_FULL and have the deferral condition be:

  (ct->state & CT_STATE_USER) && !(ct->state & CT_RCU_WATCHING)


