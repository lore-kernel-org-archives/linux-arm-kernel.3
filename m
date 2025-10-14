Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE9CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=; b=vEchc5AC77qBOBE18tnOXbxhym
	l8ovYJpVqHfKdgjsjCuQUWtJrbszjQG9Y/UTQXctMlsi96CPFjEjJ0vYqHrzVP7lcu4pyHiSn6dSP
	kE+F6xLsf9pYkOAMWZA4eRfK/uDN28NPIb3DpUMgfF/MsncccPCTjlxldmmtfJr0Gc3j0SetAVHcx
	ZUrO9w58IXm5M+qf/PoGjeOrMKx1seQrrItFqikqryyQhC9fOWoHOfhv/xZvwpnPVbfEi0EBxTIuh
	4rZ+w/mlxUg/dwGe5+6mubM4KTrQ80z4wGiOxJvo8CkLYJ4Vp4Ct/PcqzzNNN8b4RqPcsmpFaMbND
	aDxoA3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8d4i-0000000G4OR-3zuu;
	Tue, 14 Oct 2025 11:20:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8d4f-0000000G4Mo-0BhT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760440811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=;
	b=JLtaCswHk/AW7ow1AFK8jpTTCTDmRdtWf4uRPQp+yJ+Cxgn9K2tK3EJ3EGx3Yxyuv5VOvW
	8MeIBKkAvdUbrmjYWsS33vur/yPGKfntdccd+N0/n4Jaz5s7kZS2eR6PLLvt3t0j3RlMxC
	JICyHnc66knRbsr4oO8lRpKs7rDX7So=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-q-klgq1RMU26zKgxGJQl0A-1; Tue, 14 Oct 2025 07:20:09 -0400
X-MC-Unique: q-klgq1RMU26zKgxGJQl0A-1
X-Mimecast-MFC-AGG-ID: q-klgq1RMU26zKgxGJQl0A_1760440808
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso29915105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440808; x=1761045608;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=;
        b=h36LDiPxXtfloOiQozYwB93WYYkTzn1CvJlo6zJI1bbet8kE8cD/Tk74LsRKDYHlff
         u0g9RWOHOamcZ2cCyxvxjrXQgfim1rAGUJ7plZhE0BFCT0X8JOXg/n6hlf3q1T10lJFg
         b8KPrGlLwHPKOvW/oxxtYo0qNMxQe2O+ZKQCU89ekClQfkGp79Q/kQgRF67JEvjucy//
         50v5rifs8CsyX8EQz5VVfWBV6Cm3Ck8l7BsogxccfhdYJqvgy/edfxPbPH3BJtGWlCCq
         18wMu8JxpHmrP1YjRp15zfrQCWYyEu1hQxtl5ZgvaxXx2OZxZxInsx4xlnqRN/maIGXx
         YSvg==
X-Forwarded-Encrypted: i=1; AJvYcCVFrrp5glxhUL5kZOTV7G0daPPjWlclLB6amBNpaiGYIOFLRumNizOxrCOZ1ga5KyoZuRprrsMwBtH8Gn3fJywz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/rxxzLER4mq8sCkKk0tV2X7Rb1IRJ+/LxGNi27fezZb7W5RZr
	TBVNjAB1Vz4jl51iC0jtKLXtShet9FPiILgw0XbtXQuSm38v4pAcDqwNRdMKorgv4sG+64KqkLe
	LA0CIyNku1BTMucpqtXxWDxGmePrw8LBID78Q17wsXBVSUwZSGh+Pu0es2gD8WOuP8KiX6oS6ZY
	Rd
X-Gm-Gg: ASbGncvFojA3kJi3HB2dNU5jtoEsoRQ8/OlkStienJRyZuZK7NaWIDoWUuNkvdgpOx0
	bbb3zOa2jfu+0yv7aUAv7YxeAhxzW8G7sLCeeucFLkraNmNS9NyB6zTpoJN+75N5320apdau+ei
	OqmNTfASWq9GDPNwpVCJ+wLGdWf2Yz3oE+/yHxzG8eo817rVpozZERuwYMJl1exLNp3k4qDOyYp
	KI0gW3VJFuO8tean9tFt/hedW5fgENQOyn03r2/FQxmOzQ+EqgL984I3PrsK0BbTqlo4UVPA9o2
	1bdGVjQ8AQYC5DgRZz0QoTsrJi1i6t6tdDLPfCSjzcpfLbeFtoTvy+VFs831Lrg8enhvYPdrGct
	bLGLViKgjzJkysOP6Lr+OeVDb6Q==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46fa9b1b18emr175576745e9.36.1760440808242;
        Tue, 14 Oct 2025 04:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPNHhJVacE21hOu+c1s40cKBm99NOdKTbqBsl6lzaW/V++U98Y1cwp6CoRkBLGlZny7BSyXQ==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46fa9b1b18emr175576075e9.36.1760440807708;
        Tue, 14 Oct 2025 04:20:07 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265506695e9.0.2025.10.14.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:20:07 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
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
Subject: Re: [PATCH v6 16/29] KVM: VMX: Mark __kvm_is_using_evmcs static key
 as __ro_after_init
In-Reply-To: <aO2TKOY5JV9OoRUg@google.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-17-vschneid@redhat.com>
 <aO2TKOY5JV9OoRUg@google.com>
Date: Tue, 14 Oct 2025 13:20:05 +0200
Message-ID: <xhsmhtt01pw62.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ngntmaJhFyzAAA4iKcHS9L6r07Pv3a1rTT9aPmywg0_1760440808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_042013_160443_CCC87FFA 
X-CRM114-Status: GOOD (  14.13  )
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

On 13/10/25 17:02, Sean Christopherson wrote:
> On Fri, Oct 10, 2025, Valentin Schneider wrote:
>> The static key is only ever enabled in
>>
>>   __init hv_init_evmcs()
>>
>> so mark it appropriately as __ro_after_init.
>>
>> Reported-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>> ---
>
> Acked-by: Sean Christopherson <seanjc@google.com>
>
> Holler if you want me to grab this for 6.19.  I assume the plan is to try and
> take the whole series through tip?

Thanks! At the very least getting all the __ro_after_init patches in would
be good since they're standalone, I'll wait a bit to see how this goes :)


