Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B448C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqdnzIjR0oX24eIpfJlWao42wwxz6KJgRk8C8nAv0p0=; b=VMv5H/5e+8aTSsfp99DgumwMEc
	9LVN3FegljRUj9GIE6hDAR/+EquZZ7x81T092gUrzpBXM8qM36FvZ+n3pV8f1dkgVWDSnP2fe68rZ
	O015u/AZRIbF+IeIFWsa7/IoxmGCMHw5tFxETrUvttRE6zPLf/0IeekH0sqwRE36dxEXOYpr1HK/q
	EoGie+vjbIsetY08dRgdUcQQ+4vvE+29JVQHSb2OnT+7JQtsLQAONtNDuvc0DPAfxFr3Zq+T85ZZR
	N3rBtxFfkoPFpmeTS5JgAu7X2f7DDLspNZBndC1++G+NPJIkumTyWiWEq2AHbf69DYvlKyYY2iMiZ
	1PPqNPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjli-00000008cDo-3cc4;
	Thu, 27 Feb 2025 19:42:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniJj-00000008HLg-1Puj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740679742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqdnzIjR0oX24eIpfJlWao42wwxz6KJgRk8C8nAv0p0=;
	b=FNi8PgLQdqcO2dWfkwx3W7xwgXVay6hP3gNFdaAcMF4v54FlBX6KlLX6Exoe070u+LTr3z
	uGCrCsCy8X+DIHdN71zKFgLAF461J+sFzrfIWT+KkQpYg1V4ed9+0r9raoJgjqzz7pP3ij
	GtzFK+zr2dSOzBu/Yyf8FebznRUW0sU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-6B26TwNKMM-XhoDyuant3g-1; Thu, 27 Feb 2025 13:09:00 -0500
X-MC-Unique: 6B26TwNKMM-XhoDyuant3g-1
X-Mimecast-MFC-AGG-ID: 6B26TwNKMM-XhoDyuant3g_1740679739
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f3bac2944so580253f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679739; x=1741284539;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqdnzIjR0oX24eIpfJlWao42wwxz6KJgRk8C8nAv0p0=;
        b=Au7mu6JsfYwnVCUMcIawHSLiqbRjyOYZNif/EFi2HftfWsU9Z3vH5JUhhFb4fTrPdM
         JJ/KDECBc2M9Bugi1wq02dO2/5lHBX+mSKj7ndQcLPHRGqoohxl3MvJ1IP0w/YzOcDGa
         r1UXX6t4m8CSPuR3raSjdDrGL8S41TiFAdwNVgK9KdlAWT/AC2AuDkQdpukUAJHJNN0p
         GsLJnOVSLlTroqoX/IWerj16kkl0HKqTAnhtM5MjWH6pgVgvcAATQMk6q55WAwmFaPXX
         rJ1+GWBK6SAvF+5B0jMztceRhZyD/MtQJQj8dZteA13iyvrQgOADHMTvaHqTlsHE0dAK
         qq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi1ChWfmNKwQTB1sDh5MZ0OKSoSkwbRNsk2sB5OM1A/HGtEyDlc/07vQZcRXQiSy1uPYKxsqvM4d+HchKA/XCU@lists.infradead.org
X-Gm-Message-State: AOJu0YydKgB4hJLiWwYn/axfrFjCKCsIwyM58e9GV/aos0Afv8m6Rw75
	qf8Vm2hCI7ZWs41anUEvpiRQpxErzdicrBRuaEoUhLTTs42cy+Pj0IEgq8WdXagu5KuiSmqlG/W
	ZaN01MNIWPjvFE7Y4TdCLf//3nHwo6RonACgLK5IG2WqiKeKvbrfgqr8ExDGHUTDcjDebM2HG
X-Gm-Gg: ASbGncv9BvJpOXTvsmKexATxJoewgK9qoEwYVvLm4Y8ewbAubS2RvrwpltgjvT8LmL/
	ho1rADxGO7KN3fVDpS3BtEgz4VLaHLGdNp8FhgQtnbgAyVt7YcZxFkDClM4zD/4CL2fBDmW2xKT
	KR3OIG0RGwI3GU4zI1Pke0aapadUS6IJ+bzpNdsLYeoQtSaj0Z0ZVWBwEcdXSy6h3HG87Cs+Y7s
	OzgafnYQ+D5467Ps36gBLe3k/WDtaHCdvAE6WWuXnGKuPwBnCTFsPzBUMh2eEMkQx8cxubC87+y
	gshli4YabjstMmpP6CjfMvENjzpJCaeGL2IaA2rFmuN7NkAjIcZuVsG0CGuwgh9GgGfhGx3sHJR
	g
X-Received: by 2002:a05:6000:2cd:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-390ec7cdc8fmr192634f8f.14.1740679738906;
        Thu, 27 Feb 2025 10:08:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELTtvIroCPM+cKclSTstunMw/NXRJEd4YL271a2yNntKT36ErIWah+cBEzTYK3tA0K8Gj2Wg==
X-Received: by 2002:a05:6000:2cd:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-390ec7cdc8fmr192599f8f.14.1740679738521;
        Thu, 27 Feb 2025 10:08:58 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d12sm2815690f8f.58.2025.02.27.10.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:08:58 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kees@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 samitolvanen@google.com, masahiroy@kernel.org, rppt@kernel.org,
 xur@google.com, paulmck@kernel.org, arnd@arndb.de, mark.rutland@arm.com,
 puranjay@kernel.org, broonie@kernel.org, mbenes@suse.cz,
 sudeep.holla@arm.com, guohanjun@huawei.com, prarit@redhat.com,
 liuwei09@cestc.cn, Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ptosi@google.com,
 thiago.bauermann@linaro.org, kevin.brodsky@arm.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH -next v6 8/8] arm64: entry: Switch to generic IRQ entry
In-Reply-To: <20250213130007.1418890-9-ruanjinjie@huawei.com>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
 <20250213130007.1418890-9-ruanjinjie@huawei.com>
Date: Thu, 27 Feb 2025 19:08:56 +0100
Message-ID: <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S0LIDU8jBrk4KlhuZCKEyzzu10bpm99kEth3lJUKvZk_1740679739
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_100903_450347_219C70AD 
X-CRM114-Status: GOOD (  16.40  )
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

On 13/02/25 21:00, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*.
> The generic entry makes maintainers' work easier and codes
> more elegant.
>
> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> LOC and make Lazy preemption on arm64 available by adding a
> _TIF_NEED_RESCHED_LAZY bit and enabling ARCH_HAS_PREEMPT_LAZY.

Just a drive-by comment as I'm interested in lazy preemption for arm64;
this series doesn't actually enable lazy preemption, is that for a
follow-up with the rest of the generic entry stuff?

From a quick glance, it looks like everything is in place for enabling it.

> The next
> patch serise will switch to generic entry completely later. Switch to
> generic entry in two steps according to Mark's suggestion will make it
> easier to review.
>
> The changes are below:
>  - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>    irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>    and wrap with generic enter_from/exit_to_user_mode() because they
>    are exactly the same so far.
>
>  - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
>    because they're exactly the same, so the temporary arm64 version
>    irqentry_state can also be removed.
>
>  - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>    if arm64 implement arch_irqentry_exit_need_resched().


