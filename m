Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DF4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqiG8RvlxgzJBzrABSolJSF9/xPm+qNQmSoqtGPZoHM=; b=SidVGU9KWI2goxnG9VuJpphs2O
	EkszBQlEYKojSmSoSlqqAijxfPRE65pByXzCjpD94O74T3J8of0sKJXiVtwTMjMe4E0+RPTPUoZlz
	fBypJSPVtIXj3uxCo9oSjvKCqL4C5FhBDC012kqlHuQDg7ggSjghdsTFFnATNzWrqOwnUgyDP7VMC
	9p3jH2XKqvBFsl6wIZ1ysDnt919EyvmjrwtS7zvS9gZvkUwhHPRtFCMeT8Ydx9kdLH0a4maV3c4O7
	9/aRYIbR/Hb0AK2fWogGQe6ePbeXUUR3PEBkXgkRZrBJL+FUotRhFFF0bNEA2BKAjrVtLTSOfhxr5
	Sdb4X6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxtX-00000006FxY-2xyz;
	Mon, 17 Aug 2026 14:00:55 +0000
Received: from out-147.mta1.migadu.com ([2001:41d0:203:375::93] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxtV-00000006Fx8-1SCk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:00:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=E052iV/UahZwZLqHPoeCbZVIwICG9funR37mcSBDpLA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786975251; v=1; x=1787580051;
 b=AASG8pCSgOFWhZbj8SiRj1SD92svnqN36kIsJGN3tfuuY+IuI42WFTEcHlsteGczxcNJTQUy
 1IuDDAAc9UlD2Iy72FQPqZOGIyYTqW2siJN3NegB3Q80ax49Kq7+Ws1zHf5cErWjlteR/1hdBmD
 /UzMPOEXvoBZJ7d6GGTl90jg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f47.google.com (209.85.167.47)
	by smtp.migadu.com with ESMTPS id 86fba02b2335dee2;
	Mon, 17 Aug 2026 14:00:51 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so18847e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 07:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RogmgPfElKjceyiANp7bs0TiRWhV+f4PbjjEmoQkSZiyFgyWIKg/yDml2abNWGMO9gUx63mwnDGMQBV5GxeQk7a@lists.infradead.org
X-Gm-Message-State: AOJu0YzejgbeciSrEbbDvPuxVaDoH1HAQsfkpMSN0dMQY/PKQpmIBeO5
	4ruRBiR5N+CuTLIAH3dzrivYr5xheF/1bd0erGMArcqXnuFwfKPVAPF+lNX1gPiqR3REakb4Yba
	Xm9rv//+aw9K13G39sDN6xwzY7q23FgNm0DF4wxTq
X-Received: by 2002:a05:6512:3b13:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b47085689amr10313e87.7.1786975246266; Mon, 17 Aug 2026
 07:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-17-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-17-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 17 Aug 2026 15:00:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxniWpQ4YXF58FiqvG2mdnKO+xvtqwSVU8CFiNMEfradQ@mail.gmail.com>
X-Gm-Features: AcwNN1W_AAsd7_VB-Kj-kfRzJQQpYdjSQX1n6UdwIFTBXMf5NarxswUq__9s38w
Message-ID: <CA+EHjTxniWpQ4YXF58FiqvG2mdnKO+xvtqwSVU8CFiNMEfradQ@mail.gmail.com>
Subject: Re: [PATCH v4 16/17] KVM: arm64: Reject hyp trace descriptors with
 fewer than 3 pages
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_070053_669958_8EF16AFF 
X-CRM114-Status: GOOD (  13.13  )
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

On Fri, 31 Jul 2026 at 15:36, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> A trace descriptor with 0 nr_page_va allocates a 0-size bpages
> backing region, which makes the ring buffer appear unloaded. Reject
> descriptors with nr_page_va < 3 in hyp_trace_desc_is_valid() as this is
> in any case the lower-limit for simple_ring_buffer.
>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


>
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index 6e716295247a..96afa3d6de2f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -189,6 +189,10 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
>                 if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
>                         return false;
>
> +               /* simple_ring_buffer_init_mm() expects at least 3 pages */
> +               if (rb_desc->nr_page_va < 3)
> +                       return false;
> +
>                 /* Overflow desc? */
>                 if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
>                         return false;
> --
> 2.55.0.508.g3f0d502094-goog
>

