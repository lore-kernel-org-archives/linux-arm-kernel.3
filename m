Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67DCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pRDkw3OiFwhnb76GBtLAGbxTsylSIgAC6rXytdCdKE=; b=tVqpItxvlS1PUA1VO/PZkHVLtv
	QrALTTlUwd0TeT5JQIPei76x3JkXGputFVGSTT0D3c5FYvDfKfrEtAe3v7TDCKxddzHcH80nGKeN5
	zPuqbCUV1YcEmvnh38ffX5zZZtlRCf23X0ESy6wPdAWXpDl5wtEx15bKU0/9NyhQmcK7/556lwvDG
	skC7eYKtJE6VQal9IjTQ62R2wSuEH8D+UfOt7enxQ1RH4+ZFSfDRnpELXTU20EVGkXDevt+CWWekc
	iMksBuyzkFJ41TkchE8QkffpzEq75eXpMehqdog9R1t6O8pE7ky4r16TGh/YC5L3Gbo5gImRJpIj/
	PbEd67cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgJP-0000000E3tq-33se;
	Wed, 05 Nov 2025 16:24:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgJK-0000000E3rw-333d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762359876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pRDkw3OiFwhnb76GBtLAGbxTsylSIgAC6rXytdCdKE=;
	b=Mjodf7t2o7jJO1Ys2SsyIEOq7w47WEVUh7jtSZNCQ/cypa66PSHMh174T9rj9XiUoz+4Hf
	jKi7xTxZchaKvhWJmDcWZvdd/Mymt3yFLjCDOJSzMGeYW9dVzfPeUcNTCEebIyCHdkZraG
	4I6xJo3MTyT8Js+ogH/nyx9gb2CtI7w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-Ja_VVbsmNyCB5R9gSIYo6g-1; Wed, 05 Nov 2025 11:24:34 -0500
X-MC-Unique: Ja_VVbsmNyCB5R9gSIYo6g-1
X-Mimecast-MFC-AGG-ID: Ja_VVbsmNyCB5R9gSIYo6g_1762359873
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso41544525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359873; x=1762964673;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPk6YcBuruLXQ/o+Uci3gsoXIOQlnGdWukNwLQbwsoc=;
        b=mgmi70POROo3ZXMwtqiT9lsmHWcL7sT4MBVbMTyTazDwkhKY9LlcIwoOEQnVjIRGe+
         Ejg1OUC2nHFCHftwB4xO0Cz1xxH+ea5v+4DWlGCg4tIJHnMbjH4we3klQau3IrD6Q2R4
         Ss3Ywip3EjyRVJYeWiPXE+Wiq+L8OXlOCtAmKIh+89asakA06o12pIfpmKeB+xgmybJ1
         w0Eh/YMyoxTHw8vTtcNTv5DfJot8UAtHSjWb2o58AqYn49qXoRs07KSvWQLrZhl83zcc
         VoGnCBrUYV4v97iEPiW8Q2KJF3Yxm/3FxXlontm6cmAryI8Cr9jkrkv0OjUQJ+amrmUC
         McfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXRJtB3z+3/DqAefR7DCs/mL47rgpWxe//9oPNtnx950nUB471jjHWgtI6DlA14KZehiUAQV9JrBojEaoNiV7D@lists.infradead.org
X-Gm-Message-State: AOJu0YyT7mmiC4sGmJUM4ImAqX6+yfKFVAB3bwJguJ7N2FpQj6qGGEZf
	8Jyxxjk0G9m9h0pmmjCCsb4pEExjSykHgRhWxU689SRb6dck4BH++/WZupW1CRtKRJA5w/Ihguf
	/XaurTvieHrz6QoGBtjSiuUF9IgkEaHQXBa3jdumkMvxPgNJ3VkQ4DlKbCbLXSjsR+GCeyXWIjl
	9N
X-Gm-Gg: ASbGncvWvdHlevMkFHZgIowo/0QCwcVN3c1OfBKrZpcTwj2ToBctNS2cLGlLsNbD3Qb
	HOwxxRdCTBCHODVlNtSJHS06jwGu1i1MzG+wYKOdPtcZG5KL8nMnnmgLppaaRzpH4JeejpAZRCs
	I9jjcf/VsJWouYldwAcyuby1eaVcNQosDfdd/H74Y1x2h1al5BKL9NRtGTemJjfltz2kMXXatAD
	gIfk0Lvmuq9PdJ5EY/WBxmMOjjxG+Yk07HDydHXyq1CI1kBy2wG4zQsJzAiNISxYzQNRoY9KzaZ
	41ASWyCtkkZ9gY5la8Qs8I8BzzvAPmlIISrSMSGKPOeqvr05U9amKlf+raWT59CRjCTSg2j2Bb3
	g2lv4nh0GcU/fPr/iGeRfnyiHUHOO3RWTGoIyfDDDXOPM5rvq8RfUcfMfoAsB
X-Received: by 2002:a05:6000:2907:b0:429:d4c2:cadb with SMTP id ffacd0b85a97d-429e3311ac6mr3563208f8f.58.1762359873184;
        Wed, 05 Nov 2025 08:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL75fsQ0H2l1YahgWByyszuFW6670iMBa0il80FwPsU0pgmLcV2khMdpXTiSamLH801kgv9g==
X-Received: by 2002:a05:6000:2907:b0:429:d4c2:cadb with SMTP id ffacd0b85a97d-429e3311ac6mr3563132f8f.58.1762359872637;
        Wed, 05 Nov 2025 08:24:32 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fd2a7sm11003113f8f.39.2025.11.05.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:24:31 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
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
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQJLpSYz3jdazzdb@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
Date: Wed, 05 Nov 2025 17:24:29 +0100
Message-ID: <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WwBtBEWgwUkz36-ncqXAsBM4QHg8RpOV4Gs6o-KsXDU_1762359873
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_082438_836582_930DDE38 
X-CRM114-Status: GOOD (  19.41  )
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

On 29/10/25 18:15, Frederic Weisbecker wrote:
> Le Wed, Oct 29, 2025 at 11:32:58AM +0100, Valentin Schneider a =C3=A9crit=
 :
>> I need to have a think about that one; one pain point I see is the conte=
xt
>> tracking work has to be NMI safe since e.g. an NMI can take us out of
>> userspace. Another is that NOHZ-full CPUs need to be special cased in th=
e
>> stop machine queueing / completion.
>>
>> /me goes fetch a new notebook
>
> Something like the below (untested) ?
>

Some minor nits below but otherwise that looks promising.

One problem I'm having however is reasoning about the danger zone; what
forbidden actions could a NO_HZ_FULL CPU take when entering the kernel
while take_cpu_down() is happening?

I'm actually not familiar with why we actually use stop_machine() for CPU
hotplug; I see things like CPUHP_AP_SMPCFD_DYING::smpcfd_dying_cpu() or
CPUHP_AP_TICK_DYING::tick_cpu_dying() expect other CPUs to be patiently
spinning in multi_cpu_stop(), and I *think* nothing in the entry code up to
context_tracking entry would disrupt that, but it's not a small thing to
reason about.

AFAICT we need to reason about every .teardown callback from
CPUHP_TEARDOWN_CPU to CPUHP_AP_OFFLINE and their explicit & implicit
dependencies on other CPUs being STOP'd.

> @@ -176,6 +177,68 @@ struct multi_stop_data {
>       atomic_t=09=09thread_ack;
>  };
>
> +static DEFINE_PER_CPU(int, stop_machine_poll);
> +
> +void stop_machine_poll_wait(void)

That needs to be noinstr, and AFAICT there's no problem with doing just tha=
t.

> +{
> +=09int *poll =3D this_cpu_ptr(&stop_machine_poll);
> +
> +=09while (*poll)
> +=09=09cpu_relax();
> +=09/* Enforce the work in stop machine to be visible */
> +=09smp_mb();
> +}
> +
> +static void stop_machine_poll_start(struct multi_stop_data *msdata)
> +{
> +=09int cpu;
> +
> +=09if (housekeeping_enabled(HK_TYPE_KERNEL_NOISE))

I think that wants a negation

> +=09=09return;
> +
> +=09/* Random target can't be known in advance */
> +=09if (!msdata->active_cpus)
> +=09=09return;


