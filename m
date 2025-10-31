Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B312FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTUIS93GUZsQyg4tbyddEkDWsI2/kBv/P3HZONFfij8=; b=StD1LDcMDT4te15ZwG0UV3CTcU
	e0vFUmoVGAu6vShH08bKeUgmgOwUzDd9KQftzZHkAWCjAXZKx0/DfYRL+D6aDVYHsCxAUbPGmUFlK
	aZySq98ihpgWhX0iGVT5UNi43iOfHwaPrYhUT+6guvrKbM5t/bwcfcItmZ3whlWaPRznspTCiUuqe
	ZcG4zY7v50DqwmZjF0kbwHh0ib0yAIjaidznVwCrcu3yDMbb7ICm7+Eass5OrJs8zSXs3p3I3bm6S
	hAYXvTKviFF057ZZ+3I3WqRF4UsVy5npH6fp4CX6HBYiteyUlHoBAjBnH9Ug9vgJGfC1HFqQeaIdN
	I990n0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEngq-000000062Oy-1p1D;
	Fri, 31 Oct 2025 11:53:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEngl-000000062OB-4ApB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761911582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTUIS93GUZsQyg4tbyddEkDWsI2/kBv/P3HZONFfij8=;
	b=Uav5HVf7UCx/oBrDF2yqnnBGSHXipT54/jpP8p0hSuRg+iR7gEc5HsOO/lvI0T7YYj65Bc
	S2aU0jgbQxI1imxXcTxYU3G9GkWcL6UkvqKygsEtntYGCPrbTYp4G0WuouKSd8cpu/UgP2
	vrhcjhbY6ToEykxryrnRWoV7cljJTAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-Exs_XxZpO_Wb2DLett-gmg-1; Fri, 31 Oct 2025 07:53:00 -0400
X-MC-Unique: Exs_XxZpO_Wb2DLett-gmg-1
X-Mimecast-MFC-AGG-ID: Exs_XxZpO_Wb2DLett-gmg_1761911579
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426feed0016so1245277f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911579; x=1762516379;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTUIS93GUZsQyg4tbyddEkDWsI2/kBv/P3HZONFfij8=;
        b=hz0AZwFcb3rRk6AIJoads7LEtNG0o7bZL3ySsQ+nthePojbMCY0slkNwegHDNcLi4y
         GQPxetQ7ttGw/jzHs0E9c2YnnsFPQRVFgfaNp7ZRdMvuXgAQYtlPqLuyBhzhiS2ftBaC
         4YQ4uKK5K/WR1MaJn+7pvUKU1jZRFQD75dGIo6VJHe2d534lIR9JlDJ9vhf8nrqzhCat
         KZu7IAm/Uvo+U0Lf93/24UeukFu2gQvESwWa6uEoIW+jix0NaQBzZoUIumJSQitDZJfc
         KRQDaZijrYRK418V3Y1EMpgPOz9fTYgRpv/mYZ8zB8IMYIkTghAibGev1RkTKsfinKN2
         iG0w==
X-Forwarded-Encrypted: i=1; AJvYcCUDJruz+9vqa7GkzJir8kWMbHp0Q1nAe6YiH1uIJEav+gkip16J5EAi1Gd42M8fTof83GH5QOQhbknndeRImXfS@lists.infradead.org
X-Gm-Message-State: AOJu0YzOHRRJUcXoFyXwJ+C9R+JKjwPSEwNv245xpCHGrHn4sq7Q8Coj
	OKfLjX9nUiMgPiAmPGbQQ3hUw1pIwbvPkUViPFAn0gkRjbAsTBXYjWKxeZd6YiLnrFa3Yuoc0O0
	TYarqNTvj1Xal8eriCXbm0Q9YvOaYqCpvr683XTdNOoQl5tLUMQ1PgCGDJD1efc+WPDaLaIy3Ex
	FL
X-Gm-Gg: ASbGnct8ytvaPFXwMF6te47Fsfx/TJ42tkxc6HlLmvREW9PaYt+oceyIusYfN8KWXE2
	ppefmMy3zQd8dGRlKFIu7Z2uleizWXJu4eyq2RXC/6eqBMLr8xv65NnbsuIWeQLVqPbbhC/HcXN
	5VlRTwQYsA7i74WlRm9fDDwewWIgYbFtl17BmMxKaP4x3eorUakSzqwpcZcuafd5ueTsYJpm6qq
	AB/vMhQ/r+GngkeuPuuXZ1RvbvrAcu+/3EA4bAaDy+E9ozF8RsCf5xTRtEJufpaT4QZMAXnlqrX
	228nPvOnEco/iLqkMVOLCW0mJVO/EJz7UlIcody5/1Rlg8GImFT9lsVFNgX3tQuD5DDW+yV51Mo
	V17m7RddPN6MFKW0zOkAfVOGrgDXrbK/Fg1FDR5hg9IpL3OAxrUuQWT32UOgY
X-Received: by 2002:a5d:5888:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429bd676a88mr2912807f8f.10.1761911579309;
        Fri, 31 Oct 2025 04:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1wuetlLZ34asXy13r1bfmujThSOSUu3cZmMHhgfxqrER8G1YsbbHDsXHGv7ziQ36i83pqkg==
X-Received: by 2002:a5d:5888:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429bd676a88mr2912761f8f.10.1761911578857;
        Fri, 31 Oct 2025 04:52:58 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1142e7dsm3186896f8f.17.2025.10.31.04.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:52:58 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Petr Tesarik <ptesarik@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg
 Nesterov <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Clark
 Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v6 06/29] static_call: Add read-only-after-init static
 calls
In-Reply-To: <20251030112251.5afcf9ed@mordecai>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-7-vschneid@redhat.com>
 <20251030112251.5afcf9ed@mordecai>
Date: Fri, 31 Oct 2025 12:52:56 +0100
Message-ID: <xhsmhqzujp9t3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MGK3aFgcOt9xnpnrh33WuhS9oPpCk1gboDPWlDaWUW0_1761911579
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_045304_132070_A73D4E8F 
X-CRM114-Status: GOOD (  29.21  )
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

On 30/10/25 11:25, Petr Tesarik wrote:
> On Fri, 10 Oct 2025 17:38:16 +0200
> Valentin Schneider <vschneid@redhat.com> wrote:
>
>> From: Josh Poimboeuf <jpoimboe@kernel.org>
>>
>> Deferring a code patching IPI is unsafe if the patched code is in a
>> noinstr region.  In that case the text poke code must trigger an
>> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
>> CPU running in userspace.
>>
>> If a noinstr static call only needs to be patched during boot, its key
>> can be made ro-after-init to ensure it will never be patched at runtime.
>>
>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>> ---
>>  include/linux/static_call.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
>> index 78a77a4ae0ea8..ea6ca57e2a829 100644
>> --- a/include/linux/static_call.h
>> +++ b/include/linux/static_call.h
>> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
>>      };								\
>>      ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>>
>> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
>> +	DECLARE_STATIC_CALL(name, _func);				\
>> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
>> +		.func = _func,						\
>> +		.type = 1,						\
>> +	};								\
>> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>> +
>>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
>>      DECLARE_STATIC_CALL(name, _func);				\
>>      struct static_call_key STATIC_CALL_KEY(name) = {		\
>> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
>>      };								\
>>      ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>>
>> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
>> +	DECLARE_STATIC_CALL(name, _func);				\
>> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
>> +		.func = NULL,						\
>> +		.type = 1,						\
>> +	};								\
>> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>> +
>
> I think it would be a good idea to add a comment describing when these
> macros are supposed to be used, similar to the explanation you wrote for
> the _NOINSTR variants. Just to provide a clue for people adding a new
> static key in the future, because the commit message may become a bit
> hard to find if there are a few cleanup patches on top.
>

I was about to write such a comment but I had another take; The _NOINSTR
static key helpers are special and only relevant to IPI deferral; whereas
the _RO helpers actually change the backing storage for the keys and as a
bonus are used by the IPI deferral instrumentation.

IMO it's the same here for the static calls, it makes sense to mark the
relevant ones as _RO regardless of IPI deferral.

I could however add a comment to ANNOTATE_NOINSTR_ALLOWED() itself,
something like:

```
/*
 * This is used to tell objtool that a given static key is safe to be used
 * within .noinstr code, and it doesn't need to generate a warning about it.
 *
 * For more information, see tools/objtool/Documentation/objtool.txt,
 * "non-RO static key usage in noinstr code"
 */
#define ANNOTATE_NOINSTR_ALLOWED(key) __ANNOTATE_NOINSTR_ALLOWED(key)
```

> Just my two cents,
> Petr T


