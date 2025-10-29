Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB043CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz02NyUjFvvwgxoacij+FT8GFgL/ftCgtOYuG6E4VVc=; b=xhJnTrniA/IC6/rXifPzrS0fZ6
	41RWuVUJqLxH0ZfSPXkiHc4uEd+tJeH22zd3tOF3QNuGF4zsBT26UjZ8JSdz8DNqgceP5aLkMehRo
	2rFgUlMCVvWMN5gB8f8RMq52qTtsz6at/X/ZRqZGhQ6A3SBLVmAK/S0Bsd1HSu/WJAE+WU+z0aoxM
	CdH3Hvg5CbkGhCV/0/iR1YBWsrZeZrAsg1InLsSMYGn0+RQ50ecLVGJ60kK94MxO6x+6gPfjfdsnm
	nZY+Hg1uH2D+/bdh0yVZlKqS9jZLZOHvx5Aifl3nPQE8yScTYSKx3HRPQD1uqcUeTnQnEyAE3evRO
	ifvI494w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6wD-00000001Wbb-0ovz;
	Wed, 29 Oct 2025 14:14:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6wA-00000001WaY-2O98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761747245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oz02NyUjFvvwgxoacij+FT8GFgL/ftCgtOYuG6E4VVc=;
	b=YddHdoZg7ox0ohcNCfZvnEneSyOoAHbZodJXNlZQmUQ4JfDaNsk1XwwHL0EidO6WXoXf6T
	jqw3h3nu3YnSfFFcaIdTpqcn+WqhP11UBWqPSZfPSXRevCK8X3QLp2d/9AV6v89Dc/j4ZB
	w4cAjoWy5tpl/FnqnOaD8ymnd8W8l+g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-ciBYt5AtPTOHB1QRzwOu6A-1; Wed, 29 Oct 2025 10:14:03 -0400
X-MC-Unique: ciBYt5AtPTOHB1QRzwOu6A-1
X-Mimecast-MFC-AGG-ID: ciBYt5AtPTOHB1QRzwOu6A_1761747242
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4298da9effcso5141167f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747242; x=1762352042;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYXy/T5OYgT19DHuKKWwDf9vfL9WSRPLsc+nPGT92ds=;
        b=VMH2kyT3VT08FjOS6C4v4uoa1hJ5e1M1L+6s31JY1AHCG1LkW0XvLAcv/Qvdlk7wGj
         sroGH6khbZ0bLx9UkLh6vWpu4JC2M/yJ5f3xMo5YT4Gu8oqiZllq8zHJy0F+59I8AQ9B
         MQ1wbODKuKFC00JPOIpbjfc9sEIeM0VlIYjTHsv3c7+PndVAvl22yUw99daknwQTntCH
         XkYvTxZFsHzTC4hGCRftzOVbm4KE1ouhLEo1/AqJT6SVCMRo/03Sd7nqZdxzzJDczF1R
         5xN1W/YAtBEUxvQHrpUoCrQd5rlboFwuGYlWR3OiU3scdrmpj9KuNYFuWzPajPIEJhds
         9WJg==
X-Forwarded-Encrypted: i=1; AJvYcCWwWgzlnDsT2JJ4HfXflu6/XEphg+wp6SlQP1rA0z/ksnBnuNC5kAnUIgyKWRgtD5J7BHTg1gv5iF0lLIIPvI/3@lists.infradead.org
X-Gm-Message-State: AOJu0YyRA4X83kAoVCzxKd/bqi+/5hAZImX9wjFOXTN95QDYA88jE2Ul
	3J0IKvj5mKrZOHEzDiRsMD5ixRpUkecPafa6u/XB30eewhWjc+8/2k+IgZUiKFlJNucbz7er4Lh
	L8l5plKTP5GM0gRBBt3WqmpXCYMqEwR5k4EMi+WutDD9FVsFDBZ57fxpGixvbJC6c8MOmoiYU5R
	Ve
X-Gm-Gg: ASbGncs/gsw+Ja7P+cHtRAFlxvWGlnx0cMe8zhxJjTnk8SdPlrZaQo4xWHAW6CKcXem
	QaQCs1ePF0PW679XFHMQq3kYl1j/Zxsx17ZSVRkiPwDtMTmcMZdQa0HYNIncyY3aSeuFAl9k5YY
	htaxu5juzTeJQS14aOiROBCsqKEjcpO9fli+Es/Orm9/v2w2CwT8uFlrlhdYTpE/mF6TVtCGzpD
	HR2GUmyoqSAZBTQip8Ac/pIRln3qyYLubpqcjtg+F/wVMmNXGg+HJ+pMbk46G92HmCVwY4uSGpI
	2Aa/DmK58hkDHtVu0ulLFw9O9oNQARuFAET++LPYWXHI4AI7KVSHpCHCF/q8j5qFAK89hY0VgQA
	zAjJzNuwSBRRXk9U9huHMZCqA5aVOWYOa3GL6afc6y+cmbTg4rznhQhxW1VOQ
X-Received: by 2002:a05:600c:b85:b0:476:57b4:72b6 with SMTP id 5b1f17b1804b1-4771e16e83emr30986005e9.8.1761747241996;
        Wed, 29 Oct 2025 07:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2ZXdnOISpERgBiJ9ZdxsqH+M706mFK4IVywCP8xRKb07Mt6iBAhayCrF0GEYoqONAFcNsMA==
X-Received: by 2002:a05:600c:b85:b0:476:57b4:72b6 with SMTP id 5b1f17b1804b1-4771e16e83emr30985385e9.8.1761747241429;
        Wed, 29 Oct 2025 07:14:01 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47719004d79sm45516125e9.5.2025.10.29.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:14:00 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, "David S. Miller" <davem@davemloft.net>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v6 27/29] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <aQHtBudA4aw4a3gT@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
 <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQHtBudA4aw4a3gT@localhost.localdomain>
Date: Wed, 29 Oct 2025 15:13:59 +0100
Message-ID: <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6nDIM7TEQwcEkWhhxN_kOE0ilvR2zHAUDhrFKreySQo_1761747242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_071406_704436_4BCD3F07 
X-CRM114-Status: GOOD (  23.12  )
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

On 29/10/25 11:31, Frederic Weisbecker wrote:
> Le Wed, Oct 29, 2025 at 11:16:23AM +0100, Valentin Schneider a =C3=A9crit=
 :
>> On 28/10/25 16:59, Frederic Weisbecker wrote:
>> > Le Fri, Oct 10, 2025 at 05:38:37PM +0200, Valentin Schneider a =C3=A9c=
rit :
>> >> @@ -171,8 +172,27 @@ For 32-bit we have the following conventions - k=
ernel is built with
>> >>      andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
>> >>  .endm
>> >>
>> >> -.macro COALESCE_TLBI
>> >> +.macro COALESCE_TLBI scratch_reg:req
>> >>  #ifdef CONFIG_COALESCE_TLBI
>> >> +=09/* No point in doing this for housekeeping CPUs */
>> >> +=09movslq  PER_CPU_VAR(cpu_number), \scratch_reg
>> >> +=09bt=09\scratch_reg, tick_nohz_full_mask(%rip)
>> >> +=09jnc=09.Lend_tlbi_\@
>> >
>> > I assume it's not possible to have a static call/branch to
>> > take care of all this ?
>> >
>>
>> I think technically yes, but that would have to be a per-cpu patchable
>> location, which would mean something like each CPU having its own copy o=
f
>> that text page... Unless there's some existing way to statically optimiz=
e
>>
>>   if (cpumask_test_cpu(smp_processor_id(), mask))
>>
>> where @mask is a boot-time constant (i.e. the nohz_full mask).
>
> Or just check housekeeping_overriden static key before everything. This o=
ne is
> enabled only if either nohz_full, isolcpus or cpuset isolated partition (=
well,
> it's on the way for the last one) are running, but those are all niche, w=
hich
> means you spare 99.999% kernel usecases.
>

Oh right, if NOHZ_FULL is actually in use.

Yeah that housekeeping key could do since, at least for the cmdline
approach, it's set during start_kernel(). I need to have a think about the
runtime cpuset case.

Given we have ALTERNATIVE's in there I assume something like a
boot-time-driven static key could do, but I haven't found out yet if and
how that can be shoved in an ASM file.

> Thanks.
>
>>
>> > Thanks.
>> >
>> > --
>> > Frederic Weisbecker
>> > SUSE Labs
>>
>>
>
> --
> Frederic Weisbecker
> SUSE Labs


