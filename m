Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSbP/XItnE8Eu8etTuS9l9QrebV4lnCgmZKR5M55TVw=; b=yhM9CdzEzeVkpd5D8mcF2fzJKE
	HZbaO5lbByNjHzG/1jqOm6u4+ha7yEqhPguYqJAIN0uJDH0mPBo1nBaO9TFug/jFrN1K7A7q+OV18
	kGeSQ8vTMSY71uc5QpeJeXYs3Nj4gW/JWPXcjFcItwknSJt9/Mdgvj+9H2k/0vuepA5cOQwL2JD98
	VKdctoA9wfOHVB5flJy/AhvEdv87K0WzRfvyOFxFluy80NiE+pwR5xOmCkMWKD1S/JfPneqB/VPB3
	J3bDOhVYcs+c2F4g3AoCwiKFF17WwIlKNHobaa9v45j5jdrjWiEVSvORnehtqstWKYA5abIY+vxcS
	lK6XR9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3EJ-00000000gLa-1XfY;
	Wed, 29 Oct 2025 10:16:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3EH-00000000gKB-0IxN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761732991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSbP/XItnE8Eu8etTuS9l9QrebV4lnCgmZKR5M55TVw=;
	b=SkhR3chuB6HrEVPPMD12Z9ZgQnxJUCY66dveA4EaLEw6RVBfXb1Rs5eJmtsNYg3LMIrsNz
	Up4s1uc4q1kbBBsFhTo5apIWlEK9Ck7b+ZH3RNw14S2Tm1AD1SLzGPV+c2WdGBCSSyBTnQ
	i95QoPked/2iW3Mv0rdDjy2sJom24q0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-QwI_g71_N7-8PiB7IqzClw-1; Wed, 29 Oct 2025 06:16:27 -0400
X-MC-Unique: QwI_g71_N7-8PiB7IqzClw-1
X-Mimecast-MFC-AGG-ID: QwI_g71_N7-8PiB7IqzClw_1761732986
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477113a50fcso28835155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 03:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732986; x=1762337786;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/btFKEFxhLEeC8J1xdXSDjZgEcY68zMIb5ZfPzXsUAI=;
        b=OVSlb7D9IgoyRpyBdp6+Dxlh50gHUPCEroMug0YcsK2Bep+zQHnrvICj6eVkkzVISy
         LEoqjKuamdJNiz4+RVvBMamfR9u8tfKc+Ldm6SV7EEOLh4tTuED1uSdpmeZrp83Lqz74
         U2RebW9zIvxhwnbxdGP22zZ6BPwI/zb4Z1bS+8WBQCtqOF0ZFpJxtV/Ln+O1fCTzmgA2
         wBrH9N46nGW2qT4OM95HNJw2dyeizM30aDVrZnQPUvqdCDg/hCBsX3le7SMdMXL6NhmM
         HLgX8wzYBLmD+u694JBnOxbnIAXMqMowrbNQNU1Yu31NfTCkIDJbN+MQ3bNbd+fAw0tD
         Q1JA==
X-Forwarded-Encrypted: i=1; AJvYcCUjnbB6fbxeOOnKS4MpSYUpbT5giWJMbUf0dpoyBQLVV4pb3vyo/QjCGgfloMHVnu8dS6OTTkzzPktPZ5l455Af@lists.infradead.org
X-Gm-Message-State: AOJu0YwHTeRI1SJbTMwnIuxHOUudpF6LHZwhn2olZ009L0Wt9wshyBlP
	2ceQmQUCgnnxxlzQsnuh+ja7SLjQTpeK7QDVPWn48V6fmfYz4OZy+LJJvdRpVifwB4RTNyzKjyh
	9WI9DSzuBYCXdv8ITfIqJGWWK8nyLojA00owwl5LNuXItbjHQrGbsgxCAwsmIYwEqlPPjN6WjwW
	Pb
X-Gm-Gg: ASbGncv957dRNYpH+MnIeI5YQSmmZpTWs4XDU9NIRat+WE7RRIV4VEqsIscN243Vjto
	EQo4c0E9GLrXI64dC9wTm4YIPCYcQgYB7ET+dKnt6DMdodUHMNHR4twMyjAfIietFujxWbn0Dom
	AW6OTvxy6tP9Cxe90sczy6S/sPQPmCB237rDyBHnfXsCGR3uZcAwUBTUMcqoO1vfmnvNigQvHR/
	7YW8gTvnIhWRTnXtkI2Xd09/DZbAU1Ivs5hKtu/GHYenMkxyagpxgCsDrZXRUL1sJ+5bBpr8uf9
	V1JvgVK6qBM0yvu+67ES5bVBcxTANMqmMD66pydrbIcNkXrSZwxSBTueyrAR/Q4PWQ7CyasyI3Z
	zgjY3P4SdwzU6HAPIr/ikXb1Mu54vUPVfmA0vAuZnGyzDoD34qQsWlmy1OqYz
X-Received: by 2002:a05:600d:4398:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4771e85156emr13218675e9.23.1761732986082;
        Wed, 29 Oct 2025 03:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENaoAuowDmNKRs2e7mInj3dgyeHZe08An/EQmhaeEKImjMyXA9vgcPYVOhC1MZ8t+wInccTA==
X-Received: by 2002:a05:600d:4398:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-4771e85156emr13218175e9.23.1761732985564;
        Wed, 29 Oct 2025 03:16:25 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm25828786f8f.6.2025.10.29.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:16:25 -0700 (PDT)
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
In-Reply-To: <aQDoVAs5UZwQo-ds@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:16:23 +0100
Message-ID: <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -sNZGimhpAjf6i9XJyZ1d6-BALIGbJ2C15lf2PAY4GQ_1761732986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_031633_180529_571EAF2D 
X-CRM114-Status: GOOD (  14.43  )
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

On 28/10/25 16:59, Frederic Weisbecker wrote:
> Le Fri, Oct 10, 2025 at 05:38:37PM +0200, Valentin Schneider a =C3=A9crit=
 :
>> @@ -171,8 +172,27 @@ For 32-bit we have the following conventions - kern=
el is built with
>>      andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
>>  .endm
>>
>> -.macro COALESCE_TLBI
>> +.macro COALESCE_TLBI scratch_reg:req
>>  #ifdef CONFIG_COALESCE_TLBI
>> +=09/* No point in doing this for housekeeping CPUs */
>> +=09movslq  PER_CPU_VAR(cpu_number), \scratch_reg
>> +=09bt=09\scratch_reg, tick_nohz_full_mask(%rip)
>> +=09jnc=09.Lend_tlbi_\@
>
> I assume it's not possible to have a static call/branch to
> take care of all this ?
>

I think technically yes, but that would have to be a per-cpu patchable
location, which would mean something like each CPU having its own copy of
that text page... Unless there's some existing way to statically optimize

  if (cpumask_test_cpu(smp_processor_id(), mask))

where @mask is a boot-time constant (i.e. the nohz_full mask).

> Thanks.
>
> --
> Frederic Weisbecker
> SUSE Labs


