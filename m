Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9296CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=; b=r4C66jUGlzYES+bgRWnndgnL46
	E7xEBFJAWLo3H55nGbDC1ceUlGNpLxK9NnVGKQQEEMwYHjb6xxECVwqdJyxOZRXRv7OSrJfbBlsRN
	Q186SImfj7HbJtbRWk5Qoh+u1xILezWZ69YZshpqNjcKoAiKgQElV+ro9q5ctRvXlnXnvhoGaNFJi
	sKdw/2rMm3zDTKuLQpaugWNKhkJejvJfndpoE2vb7qNnaqtfOcwdWu5gLIyRg1HoShWbyI/a/ejhF
	jSg4ehrZfC+NcjfjSbq8/VZvfCBfja1Ktekoj9q8b0Bq9EG4Ot4XcK8v0WEUTNRsHNd3NXvaFstx8
	ZUMQCHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC9X-0000000BpIn-1p0L;
	Sat, 13 Jun 2026 00:23:11 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC9V-0000000BpIR-2MXL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:23:10 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1336742714fso2021c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310188; x=1781914988; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=;
        b=bQmiXMG/ITVWnvys8fR+212UCbvSGzTXsC3eqYKkva3UY4k2WG3yVSE3+ndziA4FR+
         0GppNUD1RN09ZXQirum64YYYXfbI2J150C8++0mo9rGgtAwZqboniPXe4xA1+XkUoamB
         5dMKk9mWcp+sI6341S04o+FTBNkdfeiBNA0hnBixcIVZDCEZwwj3qTIWhQIJ3nRgBYmF
         zL2j8d8GJYQCUFI5D6QkvKKiSR8BFp1MKg8fftp3AAhuje3zAbjGUWsuG0YEe2lxAPwA
         sKc+tgpo2nQ2pYs0fXMHyS2WZixxHXNQze8rG0qovF7l9+eCy9za4FjfQdF1du63Peg1
         OboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310189; x=1781914989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=;
        b=GMC4W32eeDtsgTDkQz5HcotzJHV4fMs+QM/yqn5VXK+KUqkzoNf1UDm1DuyaUnqE1E
         eFDjGIBhCa/RAIbStwiCSoHbNvKOWzbbEq8QfOKGm0uJ/QKdk73WuDMI66zjmAAiv5E2
         n/OMnVB45gLbsBe+FW64tq/76orydf4rNI8pcSjetRMu5wtmYRZUAzNs6gXO+r6r1a93
         z/f2RyVF1UhH/ZmAn/hy5zr6ppzPhNfqbS/jDM3QBJA/e8OFFMQymhwrvdpznfChJyTH
         n/kwURRKunMkfmhoy5B/eZsNh+xTRh7HO4/voro7wP3C0RvclRvqBG+i5fKqIvGqmNEw
         ikDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WDOmVYYitV1DCZwMKLMHgN4RxGAowbeUfqPtJeSzGLF/ZbE5mk05HwjxyM369i5MRlswAlaUvnDNkOtATUjCo@lists.infradead.org
X-Gm-Message-State: AOJu0YxzqUkzOq5XmL9eJkBkTRUNnXGrY+yCEQx1ksPWb/qcqFqKeEA4
	33jsm75p6lhi1cpieNn95tvx9647+9QigBRopQDdFb7FeibpfVO5QQW5SE5nUQBz5w==
X-Gm-Gg: Acq92OGbtWMyyrEkndp0apTaU+A7VA0Q5iRHRZtMN300wBsoTixJaEUqBGHbys2izrY
	mIMaYIEiT6lmfcAOtaS+tJrlEeBH7qEPlgTSdMO9WHPxDwFKrzSIZzNW4nKs9yHvUhmE7yT6SYK
	UWWYUi2+Ytv7dHlupF88c0QJM1jRZRxOQ762lnYdUqyj8feJavYmI1M868uQnJFv8MJdReBQLpT
	ZXexwu7h201gaG7hTiP6iuHVD4WWrg3kl34VsF+LbW66LNELEr8HfudkoREUbe1tKyuGL63LYYB
	noofv5jppY57rHE76dmxJVDEprFCo09Gzrs2SGOiV5Z1OxTn25vq5KVbFMOwd13giAvnQX++qaG
	sU237wUmIznlY05FgUWgZkQy3AJFSJpWRkDqKxbKRF9kRWQ24Sb2efuSNDpQDHXVV3vjkqZMvjG
	nX3bBMbUCrIQvcsvTG+h/6IH67FhNbMKkE14o91mr3szJqpTQ+y/vadGMpZn+z6r2h
X-Received: by 2002:a05:7022:98f:b0:136:fcda:bd43 with SMTP id a92af1059eb24-138f3b6d806mr40653c88.5.1781310187835;
        Fri, 12 Jun 2026 17:23:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:e362:1a25:b90f:e3ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm5610188eec.6.2026.06.12.17.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:23:07 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:23:01 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Dev Jain <dev.jain@arm.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
	will@kernel.org, catalin.marinas@arm.com
Subject: Re: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free
 time poisoning
Message-ID: <aiyi5flNkNNm0pSR@google.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260612044425.763060-3-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612044425.763060-3-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172309_604277_3F83F68A 
X-CRM114-Status: GOOD (  16.52  )
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

On Fri, Jun 12, 2026 at 04:44:24AM +0000, Dev Jain wrote:
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index fc9169a547662..4fa8abb312faa 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
>  #ifdef CONFIG_KASAN_GENERIC
> @@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
>  
>  static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>  {
> +	if (kasan_tag_only_on_alloc_enabled()) {
> +		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
> +			if (init)
> +				memset((void *)kasan_reset_tag(addr), 0, size);
> +			return;
> +		}
> +	}
> +
> +	value |= 0xF0;
> +

I wonder if it would make more sense to have this as:

if (kasan_tag_only_on_alloc_enabled() && (value == KASAN_SLAB_FREE ||
    value == KASAN_PAGE_FREE)) {
	if (init)
		memset((void *)kasan_reset_tag(addr), 0, size);
	return;
}

That seems a bit clearer to me as to what it is that you're doing, and
also makes it so that you don't have to do any bit manipulation
on the value when you're filling in the redzones.

Thanks,
Isaac

