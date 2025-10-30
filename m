Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02255CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=; b=RUPakSe3Lxle4XeePQmFp1iuuA
	2jv28HZDeaRa1kV19vbVbJ467LAgm3fU0uoCsGSzxeIZ7wslSTjezXhU2bypJgOp+QNjwQflxEKdG
	j0m5/moOyO9pwal6Y0cv0E7enEXcSDVOaxS7ozdilNTVcZq0fINizY+vED82v3Op+4vRuF6xZRz2c
	rv6om2VvbrUCykHOqKaf7kGmFAC+9g5R8hf90rTZXXid8W7Z+DxT3qfXGwUGhW76c2xpR3wIsQinm
	YM9r7qbWk8ygfxSXMJZdlNaKfD29rHSOMmezy++ehiuBUoPOsUwGDoONp4shZh0AySl9KBUCdJXrt
	jesNTNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPqK-00000003ygb-11Kz;
	Thu, 30 Oct 2025 10:25:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPqH-00000003yeh-2LXa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:25:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b404a8be3f1so15861866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761819915; x=1762424715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=;
        b=HUAHUuoFux2zbNVWK5K8CNDgb39Yzl+w7F1AFPAmnuCB4blsRDkRMwLO1mtps+iFcK
         aGuwuTpfQVr2auXe7Zh1lnyEOr9UnNZ1stywHys2NCJsVxsAyVvFkEUWGX+Z5OxlEYzq
         evZGPBCrrQuBWyKvZkQ3nZc8nHo35X50WkF6KMaKMwwuxoALAxLTL0eoUcN36wg0WM8E
         2Q7A1Z/TnjBSZKnxRlTnLgYyJlElQLfR0yC1yY0GKZPKirjmCvZuzDbk15c80NzaHi5p
         o59RBw5r9Q9hRNlGY0uOMUPOeoRm7F7YdMj04T6bRCjOyTqjSv/jTJabiv6zYSJjaiWN
         l96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819915; x=1762424715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=;
        b=cXSObeBMu1Uh40/r6S+3eZK9jC+HTieCpB1poOGNdFWlGWV2kHhx6eS5l7IwJkZhWb
         XaodOH3yLMPqQAb2ZwrT6oMCaKU7Bgd/VeSeDkiRob5xSBfxJtSoPT7PBEWx/scHRZGR
         Ic/oMo1e2+CBHWI1AfLZdmwjMAH7Mwqc1WKhx4PCAEIcef0M0XPTJfZliAPOeEK9vbel
         gx8THVdX+sSnUcEM+0ZwrZVMChso90pScR1weSNqcqsuoAaGPvzA6/wtCtRNedxa1iWd
         SXTIUnh2bN9SsY0NIgT2iZhy72AEivt3yGleAICeUCnpawJcsAI01VgZeEoRbatcdd8l
         cBUw==
X-Forwarded-Encrypted: i=1; AJvYcCXfS5i9K83z6Tr6siDxW+mWwkE2/g4zFpYPHOKmdTAeyoOS0OBydL8a+m/mAuf1paklbHcrsCH4x/9xfMRoEz6g@lists.infradead.org
X-Gm-Message-State: AOJu0YxUuOOIMoamhpHcac2V1lki60CY0HHGAMjCdkAhP/MJYB4b19Uc
	DD+IMbQbopXD7+xsy9GmFnWCY4zteKE8ovgEalS/qDqBrtcnA9eU5W0DCq0lBk/jRW0=
X-Gm-Gg: ASbGncuuPbduphWv18chWhwvJU3jQdwXi8OwBCDgs0C9qFTi/R2mjZ4HYdCAC+9zH3b
	3vUaroqrV+rBksyJn4X9E6Z7vyLcmmJvgeaHllghDCmeLpgdaZwuBgwffN8Afu9oLIwukG4gFgH
	csSNHbpiqY4Aahgya8VkkH16mD9/f9aTR5CNDSdWl2TUNUGn0KgBNLNjZcaKmuf1liND5k3JPEl
	bBXoutB6Qh9jpRcqAMRbaPapEoZylAuOzvukx25Re1IQiW3jOurk3Prg24D6aRTRKzX9oqrmvqe
	/qimykkHb3OgN6nfk6HjFH+b4ZQ+byoJLOmUQJ0Gn2YaxcumXNqI39nuIu9FFH07NsY7Dz2r/f5
	LyRY6IJO5jGlGWc0jDpOEpT+oDnjkoxb7x+Z+SAffVraGlE09pYVhCfinOue6TCoEeD6JflHHhu
	huKtJJJdQpqVpr3J5v0T33o5D7XF2zsiFDCx4TCU9esHgaCNmdXE/q7RV1GpQ+vHPqLqOQjgi8b
	DTL
X-Google-Smtp-Source: AGHT+IEXsUOIqP3MBMqvuO3EOkZU6BKA34oP58piwLuVoouucxjytl3skX6Ka8nntE+ckkHO79CK6A==
X-Received: by 2002:a17:906:f586:b0:b6d:5439:e668 with SMTP id a640c23a62f3a-b703d55e454mr372826866b.8.1761819915166;
        Thu, 30 Oct 2025 03:25:15 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853c549fsm1728375066b.37.2025.10.30.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:25:14 -0700 (PDT)
Date: Thu, 30 Oct 2025 11:25:03 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Valentin Schneider <vschneid@redhat.com>
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
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov
 <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Clark Williams
 <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v6 06/29] static_call: Add read-only-after-init static
 calls
Message-ID: <20251030112251.5afcf9ed@mordecai>
In-Reply-To: <20251010153839.151763-7-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
	<20251010153839.151763-7-vschneid@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032517_619227_441F2DD8 
X-CRM114-Status: GOOD (  27.96  )
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

On Fri, 10 Oct 2025 17:38:16 +0200
Valentin Schneider <vschneid@redhat.com> wrote:

> From: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> Deferring a code patching IPI is unsafe if the patched code is in a
> noinstr region.  In that case the text poke code must trigger an
> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
> CPU running in userspace.
> 
> If a noinstr static call only needs to be patched during boot, its key
> can be made ro-after-init to ensure it will never be patched at runtime.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  include/linux/static_call.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
> index 78a77a4ae0ea8..ea6ca57e2a829 100644
> --- a/include/linux/static_call.h
> +++ b/include/linux/static_call.h
> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>  
> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> +		.func = _func,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> +
>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
>  	DECLARE_STATIC_CALL(name, _func);				\
>  	struct static_call_key STATIC_CALL_KEY(name) = {		\
> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>  
> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> +		.func = NULL,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> +

I think it would be a good idea to add a comment describing when these
macros are supposed to be used, similar to the explanation you wrote for
the _NOINSTR variants. Just to provide a clue for people adding a new
static key in the future, because the commit message may become a bit
hard to find if there are a few cleanup patches on top.

Just my two cents,
Petr T

