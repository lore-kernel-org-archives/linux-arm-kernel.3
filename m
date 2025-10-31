Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89464CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tkSelHNNZtYzi5EY8XsAlaXp+ewc844ITqqtJnf0nc=; b=hELUgFjtukU9qbTXjE9xIErbLJ
	Ww3DrxUxnl3tePHROm2pxiVn4BOJVNYHPI+AY7glKnmbZItAk86wlqqEcgjct7TYS1v7SvxU6adEk
	p/S8F6bkgUEIygxMZIMbu6kt/2DxxJp1PAmqFoPXcfcaGijG4QUSL3YvuVHZIN+ENb69aBtf10gQD
	FOTDcYaWtvcfRq/yr+4cQs47ogokIHoWwW8dLp3GjuSmUuYL1gUNJYysqKEDbyG2wPcaawqukKthD
	EP/9RS11nXZL5+zzMb7QONNGg73d7hwreJPHMLrLlFwpAbAkNKqGLl7Qn3n8zHD2mm85xLLI0SXSR
	JJcaW0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElrJ-00000005q8k-2De2;
	Fri, 31 Oct 2025 09:55:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElrG-00000005q7x-1LVj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761904542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3tkSelHNNZtYzi5EY8XsAlaXp+ewc844ITqqtJnf0nc=;
	b=CeugEqmChg06nf8lEYpsg4xGenJPg5zkuVRjpnaaVxUULE4dpEO14f0dplP+ecVeaaPtrg
	8jsA20yRqcs7GqQYgH88gVxL3ztMaQLuuX1N9fawcsK1HQ2eNG+6WeSaXEekcAVCMXdGXx
	S38+nqYv36CyU64TF1FlGwe5utQ/pCM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-jhR1MXdSPmW8cSX2-HCJ6g-1; Fri, 31 Oct 2025 05:55:40 -0400
X-MC-Unique: jhR1MXdSPmW8cSX2-HCJ6g-1
X-Mimecast-MFC-AGG-ID: jhR1MXdSPmW8cSX2-HCJ6g_1761904540
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-427015f63faso1209255f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 02:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904539; x=1762509339;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTCg+N3NYwBLqF+pIITZOoHrF01dYEOCOu0+H1nRDT0=;
        b=TgN+iZlQdcWkZyZifMr35BC8WEn1WbTTUwLMEWawshmj/TI/Yez3BX8gmqHMKuHgIB
         noMGs0wzAXZW2nQoReR6H8qqIQDTW+0mOKH/y1SYkZoQJWE3ymZiLeUTxLrhPIyDkGqY
         03hmjF0jR1YSqJMGmNB8X1MUVrw/QX4shJtbu2KcTk0flPbMupzNWoalqirfqiMvsKTR
         thkgb+Xyuua0fJoafz8DENJuILMUQk7Qio9VoDxIdasnZ5mm3RG5yN0hpBi4kgw1CBwl
         m3pgUc7/6C0Cdyf6F1HZoY1mvZJz3LAnHR5DOvR7ImfafNoY66Ek0es0MZsIwyRnwFj/
         mVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNzv8A7I04X7yNNv2PApnxoCzIouQy7yIWxLTYkE61mFjN0aLF3FkFGF2jCtqJlA+QP49zf+7XnjluOUYzYROt@lists.infradead.org
X-Gm-Message-State: AOJu0YxcTd/y0GggHKT1fCKDbVXuXLJCMsd2WICbLreLah3WTO7IUSgS
	0iREMoJdfev1ByGNThZxPXe3qQwyfO3Yc6q2e7qTq3eBwlKzo3VXEHVJjEgGPDTX7PH7sK9DwH1
	MhH/yXEq6FZEPGuZIRTSSMbOv5x6PqEq1SeK065iRnLPMoP23Hkfp4Q6oTaH4q/FzqcK2Eo3OE8
	R7
X-Gm-Gg: ASbGncvqglJAtlN+ac2VeXz9gmyfNBdDlFZuyeumMM47bPR8ygmSM1UeMUgi0og1BTY
	iO9poIBtOECuyJHXalkjRDb1xWi/qcm7h6aGwDwEFChWzIqcGjGYyhRa+y9oQSYfR38NLcfX3KO
	atZTdFWjPW48f16bxqZCCuIuXATcVDNPe5bFJ1hrRQUuYJioIh1G8i/M2EMRWY9ZazGz9P/TZ9w
	9pdyg2BBYjIa8DTMvmTGbDRn3UzT7T1Tg4ZNPHcRAUNhLeAQXW3zZidU/Lff0bqz06VQyljWVFR
	Ci4XLzB26O4gSbj476hptEXvYjG6FycBYDdFmyVjytgxJ6nXlZHn9OEcFy1MrBiGRcw4dVGDp+v
	MZrLC//avmdH+wuWtFjTkLO6NxnCy0LxDEZOVQ7NQD70DmqK4Brja6HEuKGoN
X-Received: by 2002:a05:6000:310f:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429bd68869amr2437855f8f.12.1761904539542;
        Fri, 31 Oct 2025 02:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbUxApmJAOYlrcJigfNqaTRZ7Pz52J94NiUAhMgZ/Qwj+7BmCVMNCnPqwOLJ11D9kpjdgFWQ==
X-Received: by 2002:a05:6000:310f:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429bd68869amr2437793f8f.12.1761904539055;
        Fri, 31 Oct 2025 02:55:39 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1406a45sm2624895f8f.47.2025.10.31.02.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:55:38 -0700 (PDT)
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
In-Reply-To: <aQIpXyX-z8ltB1i5@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
 <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQHtBudA4aw4a3gT@localhost.localdomain>
 <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQIpXyX-z8ltB1i5@localhost.localdomain>
Date: Fri, 31 Oct 2025 10:55:36 +0100
Message-ID: <xhsmhtszfpf8n.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j6imh3EkIkD-Czpy4EgZeZXjLXs301EZY5juxEDhi-g_1761904540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_025546_434329_25FCCB14 
X-CRM114-Status: GOOD (  14.15  )
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

On 29/10/25 15:49, Frederic Weisbecker wrote:
> Le Wed, Oct 29, 2025 at 03:13:59PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> Given we have ALTERNATIVE's in there I assume something like a
>> boot-time-driven static key could do, but I haven't found out yet if and
>> how that can be shoved in an ASM file.
>
> Right, I thought I had seen static keys in ASM already but I can't find i=
t
> anymore. arch/x86/include/asm/jump_label.h is full of reusable magic
> though.
>

I got something ugly that /seems/ to work, now to spend twice the time to
clean it up :-)

> Thanks.
>
> --
> Frederic Weisbecker
> SUSE Labs


