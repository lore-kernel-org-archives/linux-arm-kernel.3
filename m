Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2771EC531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jlz4RirT2ApEMmnQX3AOsLAbmiz2q30wOmfHPI3CAeM=; b=1A47l9ZawC53clgoy6gAa2/+0y
	vn4hM3OzMIAVRsPXLvD9837KZ8LjOkvBPwcbcx6vv+d34DHrDoTKcGGxBZvMJeFDjKjeyHhxnchLO
	okJMu0otfCTlOTgeVkyp6kiprtTj8iSn0GcZ8GRMSrlRIXxmShiwn9gCN7QbrT/SK0q7fYiQh1iEA
	na72PTpJdKEoUSteVxD5zufWuUU1nnd7nXpFEh8rl6SnMv3XKoAuw+QrpoTNgtowOrDhIojfWTZJw
	4KpAl6pGv7ZZK046AFgUTYaYY7pRZMYPFijZArXr7ZIIc+bDE9pkn3G6CA0cFK4bXIx3upIQHPgwy
	Yus1naoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtL9-0000000EMTW-0J5o;
	Thu, 23 Jul 2026 13:19:55 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtL6-0000000EMSf-3UlH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:19:53 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c01c79467so258681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784812791; cv=none;
        d=google.com; s=arc-20260327;
        b=FABI+8OAb/ulSz8BOhIo0jxTnFjPW/JVGwjaM23RCtrkjPMlAVkmEM7ePxdWGAfzDv
         ER+dOemvDYl+0PkAhzjsHSxebFIatdLtb5bZe+bRnXU8jHzSVSv2ZuIjeEK9pvJvUhka
         ymnfdlys6gD8jeb8gARe4b8WJr4yYFy2lXbxPQxzdD+FxPeNI6wX6iknsMUbzXQSWXND
         VMUSec1rZ6nS5A972zzQhJ9kP8lehrdLcN2FwW7Ir+zpjUGZEol6zfgmwOzZxOGrjHHA
         RqjBZe4hU4KGDtnOsuoVk/5l+WiGoJ2zZsslMySi1KZKAmDBaFJx0QcKfbIn1y0E+9LQ
         IHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jlz4RirT2ApEMmnQX3AOsLAbmiz2q30wOmfHPI3CAeM=;
        fh=FqB+mGAdj1Xv0iM0WJmgiZuLeYfqtqrNoQISUMAeC3U=;
        b=R2h/mb46Gj3tbWtr/iKKbWA4QgKxLC11qs4+L20cLwxE1vjNVSsJicaZPsTjBNGPxA
         f5zlEM7W4/Ydt30HNWNiaNAuOI92U55+QSEqf0j8w7o4gGwrKWo/cXBZxDwjPMLRl+TV
         1hWOb/s0ULnBI6wbLa9koyNN/22t64o8Kd6IR2ZCj6z5szSRSi1xRO1+hxQZq8KqHwyr
         2Sed5bCTiYlCv4o53S+kwawnveqdRYVKmwxoZOMe+PLffPsgkNFKGPGqjrzSgYrcj61R
         KlR/KVWVyd5yfi4+tU22Aplj0K8VHVrt+JbLyAYK9R5y9XmcfVuADFW3mM41a32XuMvc
         un1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784812791; x=1785417591; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jlz4RirT2ApEMmnQX3AOsLAbmiz2q30wOmfHPI3CAeM=;
        b=B0abJ0gN+BokwryNiA6SFYha7O/2c80NOcgCpGcxWq00fuKCiQCdvBi4JUoCExf5vH
         olBYmW8182vs7eVL1qOoc6IXAo06Nb9SVudE/lziRfLFjVXYEqmJFVg8vqz9srIxYrx/
         EuVoJa6KTFfadwUgLGOeDDSzw7fbxRxtZubxdyV510MrgxhltSJAkbVP1fTMVI8LPA6O
         bgW2/M1THt6EJizOdornR5xnkddCzB1l1y87hY2C4fDNg4Ao8BhHd/8gbfxw8iqc+qrX
         eLbQ6egok/vkWu7GJ/T6LfzTsw7fBe8GCe/PHBn/PcKDPZJvrVbE7ifOYz+b+PUNx+ee
         xH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812791; x=1785417591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jlz4RirT2ApEMmnQX3AOsLAbmiz2q30wOmfHPI3CAeM=;
        b=iIkXZvU95w3X9LJ/FrNJmshQ1J/jJtUUEmjkoT0t1BRfwsM2lndq4OaIPdpcDzCrNa
         5lIdP/m6S1TS9AQ8bKn51TxbugjPjrAIe/7z2ydoQNelfLQ0uBn/tB2phnh6FF5iQwHv
         6aT0hmVVLC/7QG7KCFkJwgE6fxXuY+zLFZonxl6rFIcdsKHc6JeogPeQrqX7EXlOrwe6
         FzPlprUt1qktBeuQ9Ds4MvQmWs4sSJrRH5Lg+O7xJRQ1Sy5uzkfWCwpdPS42MubgoxcU
         FHF1TBEFLb5iJm2BiIzoCinBdjHY33Rpg/iUKbmjSJbztOEWGLOcn8KZN+8XxcWOo3US
         RE5w==
X-Forwarded-Encrypted: i=1; AHgh+RqOOlzy7X9fsABOSWHeE2wkDsj/oXAErZfYIrXCOsaN6NCF7XoFs4nDl7h2Tiq2DxS3r80xWkNr5/jMNIteyFTa@lists.infradead.org
X-Gm-Message-State: AOJu0YwPieyVzweqQbvbENiT3zba030RAQhz4dcGOMnuDoYWH+q17rhg
	qPgPW91oGQamPsJLvY2eH53Yec9GvjXcLOs29QoCSKRkYk5C30pAchiIJpETXmXvJ2BNdSjJvxx
	E4gzO1m90O3K7mpjbayxBmcpeObYIKf+Zq/y6FIrB
X-Gm-Gg: AR+sD116r3ANF5fyIXNyu/Qc0c8Kudnti2O/l/0eha24+eS9BSdZJQbf2kwFqt/2n4r
	Ok+F78gtzacaJM0b4K5btFkpJImBGqUGoVyvSpiPlrHZIrB5VaiKnKDngMKppIGt3ABMYQaAoYX
	U5/6PNHqVCaSMQZExJWnbBU5VOGocaGOs2ZKVntSXfyOUkg4RjYZfNhIJQipGv+wRIGEWZhr8Gb
	TTLbJ20FW8PALN/Yeul1xhCxeb+lI9ow3iH4rwlkJofkEvqwpJuDO8UEB5OYg==
X-Received: by 2002:a05:622a:aa4d:20b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-5283bb02792mr9778161cf.14.1784812790765; Thu, 23 Jul 2026
 06:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com> <20260720171513.1415357-5-vdonnefort@google.com>
In-Reply-To: <20260720171513.1415357-5-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jul 2026 14:19:00 +0100
X-Gm-Features: AUfX_mzXDP5kjyl7adkMau_slK5ytHRPwGWiWf56fyQqQaMq0ZgmYKXic-0afsY
Message-ID: <CA+EHjTwZftoD=D2G_1S271CPTdYhCcRwQGHYzwVS4OMLzAx-HA@mail.gmail.com>
Subject: Re: [PATCH v3 04/17] KVM: arm64: Add a heap allocator for the pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_061952_907471_17CFE700 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi Vincent,

On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:

> +static unsigned long hyp_allocator_reclaimable(struct hyp_allocator *allocator)
> +{
> +       unsigned long reclaimable = 0;
> +       struct chunk_hdr *chunk;
> +
> +       guard(hyp_spinlock)(&allocator->lock);
> +
> +       chunk = allocator->head;
> +       while (chunk) {
> +               reclaimable += hyp_allocator_chunk_reclaimable(allocator, chunk, NULL, NULL);
> +               chunk = chunk_get_next(chunk);
> +       }

Sashiko raised this, again, confusingly in a different patch.
hyp_allocator_reclaimable() counts only the per-chunk reclaimable
pages, but hyp_allocator_reclaim() drains allocator->mc first, so the
memcache pages are reclaimable yet not counted here. When mc holds the
only free pages and there are no reclaimable chunks, this returns 0,
pkvm_shrinker_count() reports SHRINK_EMPTY, and scan() is never called
to free them. Should you add allocator->mc.nr_pages to the total?

Cheers,
/fuad

