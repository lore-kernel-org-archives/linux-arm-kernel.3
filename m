Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE9107BCF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 03:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV0t/dqzSE156GqkAAZgS45ZhHgnhgFYawmC6jkXx0o=; b=XeTvAA7n13HKl/MRM5CUMHFoTS
	gR7y3J8wbW7WuKC5uAG0ObpRAixIl9FBhpgmuvfkZ0SMoSW1xBGwPOn9/w+aCXmXGlI07kvfx/6h+
	AwxW8a5lwORbWYVYjafMqUk9XrX74mqSyfPawhT4It322irpypV9jhCh7TMu+70lpW/lMlzz9zrLg
	GHSv01JxRRn7JvHltX5jwcX3V/wlCsVeHtDNzmQ02HKGj66Zuw6U2Y4O3UZWh3ao+XRg62BiRb/5K
	zzDOXPgN7kSee9RkZ8yAksCrfUGkppAuIPNPimqU0JUxi1KC2paBI0mV755XW6XiZas1ul95sErZD
	n1gk9a7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Fz3-00000001Sa0-28kM;
	Sat, 14 Mar 2026 03:48:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Fyz-00000001SZe-1VOB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 03:48:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so34758255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 20:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773460088; x=1774064888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV0t/dqzSE156GqkAAZgS45ZhHgnhgFYawmC6jkXx0o=;
        b=lC6TKrH/40iCEttf+a3i8P8/84V3OYIckkowlby9VYCKCnPCWZqNousFunc7mdUwcA
         OCehHUG0mqUWQ7e4+icMz0/7yk5WQ7Pnf7MVOPB8J51PEKelSJuKQtW9LVQhJAChL+v4
         FDTjxqRUZVNq2Y35wVxnLwDH2b0ggzdq41ita491sfUgzJbhFzVGZVOx8Hv/q9sA3Ey5
         +M79R9VYGb9+c0EMdxNrcEFWV647wgLBQsQALfzTZrorNW2DpN9IGRrxB0ejIWmfPNh9
         KoWG8eHxeWFck4ZnT/Qpvw1U7hdXkrbb3OzNbIrsdhJTNAovEQgstQVXBqCdmPceHRJF
         2GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773460088; x=1774064888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DV0t/dqzSE156GqkAAZgS45ZhHgnhgFYawmC6jkXx0o=;
        b=TkXlniU4G9mYgyaayDDrlCoCINuI5/bbFNZCK9zqq5OE741PozNdeKSQlx/KIlCRlo
         vYzmotNC5bWm685rWVkcAcGKrOa9Xms3UTSHwqtdvkb99ZwzpxXl5k8+bq9kReR9G+HV
         ZsdTkffQvqS6dL9n15LH+Mv48a42P8P3SglpGuIMYlv7WdnnlXkjKWxCt5lXAvTd5fwN
         R2ac7D5nt1Z/Fr8HbLRuCNxvhjh49tJE4rXKarIpmZreuGyJ+Bzy+DeUsvaQLOQ5iQPF
         R6fvpBKp4UM5xfAw0NtjOeAmQfjSulHskrotkFGaybxr2DqnhHLnPlzTTkvXXA0jkXeZ
         oIlA==
X-Forwarded-Encrypted: i=1; AJvYcCUzqkxTAedVRJ1BrsSDAw+bkIwrml223BsBOHKlr6/8hpSDXtUMv4eTy7w8tXmcWaqPJQNSc/FryHK4+oo398cw@lists.infradead.org
X-Gm-Message-State: AOJu0YwN2AF8vdDNheOmzR9MBszt1M/B0Smcho49KLvPpAD7xeHJIOrD
	C/jmnr3Grrre01R9Fp2o7PSou7sEOx1tPK3EaBmIVMEO4rCCjibdSOmFwlb0D0HqU3E=
X-Gm-Gg: ATEYQzwV/ynPVHhpQPWleYd7nUl71cLFKuUxAaAXKWRmCcFORpjBjTo+PNXBTX0P+jf
	2A/qrmBdTByZeuwzROUWyJP4gP5u53QMILfNmZuN72jPfyxr9b7tKrIcmXhpTORuuLkDexKOtvI
	H+CkXYnmWdVUZXzy9sI223hISoIpWqHHDYCqDSLtmoI/N+bEFhFzAhAkVmc5NV1/JUiMyxOCuqP
	bgz9wj2PvqGVlBQCtO8Avp4xZLQJSM+0D1j86DkuFP6UJTEwXIxS4WXZQBH1Xsx9Q1t0qnwPm0S
	ze+mqlLjMx0tgBjnfAqlmJPQzoY8MZC+e8X6wjoOF2NGN1nGh8ya/fPiWQ20FOYrBIIWw57R8eT
	jID4Tf/tPgCc3VSkJA5zEgbSNGVGY7Jn9/oTQopWN+Es/TMGrjrOUSKNYKHghQLOWGJ4dZ+7eqn
	7+
X-Received: by 2002:a17:902:e74a:b0:2ae:cefd:18d6 with SMTP id d9443c01a7336-2aecefd216bmr50709525ad.2.1773460088122;
        Fri, 13 Mar 2026 20:48:08 -0700 (PDT)
Received: from gpc ([2400:8902:e002:de08:5754:7dac:85df:935a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece838d3fsm50446025ad.77.2026.03.13.20.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:48:07 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: usama.arif@linux.dev
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	jack@suse.cz,
	kas@kernel.org,
	kees@kernel.org,
	kernel-team@meta.com,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	viro@zeniv.linux.org.uk,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	WANG Rui <r@hev.cc>
Subject: Re: [PATCH 4/4] mm: align file-backed mmap to exec folio order in thp_get_unmapped_area
Date: Sat, 14 Mar 2026 11:47:44 +0800
Message-ID: <20260314034745.168715-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310145406.3073394-5-usama.arif@linux.dev>
References: <20260310145406.3073394-5-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_204809_653751_91F393BB 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

> +	if (exec_folio_order()) {
> +		unsigned long folio_size = PAGE_SIZE << exec_folio_order();
> +
> +		ret = __thp_get_unmapped_area(filp, addr, len, off, flags,
> +					      folio_size, vm_flags);
> +		if (ret)
> +			return ret;
> +	}
> +

I noticed that even when the code segment of a user-space shared library
satisfies PMD_SIZE (32MB), it still doesn’t end up at a PMD-aligned virtual
address. This might be the fallback you mentioned. Adjusting p_align in the
ld.so ELF loader does work, though it also avoids extremely large PMD_SIZE
values (capped at ≤32M).

It would probably be better to skip the PMD_SIZE == folio_sz case here,
so we don’t end up calling __thp_get_unmapped_area() twice with the same
parameters.

Thanks,
Rui

