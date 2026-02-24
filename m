Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36C6EFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDh1X58CGtHIEhOJ5O4lzeYx8yT2192S5lE07B7Mlx4=; b=PEWCgyPPmlzkgrF566ADuMVUBX
	NOaV7XaQFcv5TF52LYb61iVRUX4HZZynXpA7GOvJJf8HqKsJYCeqQ42REO73pKEB2EposMfpgGRRo
	xADzCVcSHDVcEieuh3QjWAr7H/Pt8Srf96/TTTQ4mDRJmDrGeZCUBdrCUQxX4Gy0NOnK/KXVvAJd/
	0kqwYqU+JrQg8qI+6+PeOGbnr0GciZImzXgkDI5iKC+Cu2VXPVhjdbF7cNmdN53Id7jFgH5AQucHn
	MCePPiGCxyU0mXtSHIUm+XInl4WaIh8IVmLv6pjM58u2hoLXOqOqBgVsbUERIuXbAayEZHVwRI0Pa
	Vw2AvulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumYi-00000001Yx1-1Kca;
	Tue, 24 Feb 2026 07:10:16 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumYf-00000001Yw7-1byT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 07:10:14 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8954c9daaeaso66576676d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 23:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771917011; cv=none;
        d=google.com; s=arc-20240605;
        b=iGVpGtSVVqVuzlAnhFrgdfdbDb18Gx5s9kG+JWgYAJ1jUtZv0tj8h5tZnhgaek2Xga
         zrIOyg17qioTHu6kTw+9wo8WkR02giPEVhlycfQ34+7lbhuynGqZl0ubLALTr7D547rI
         bI/UEyM3YC5/DMwGPuOygVF67fPwCqo9F0NEjPJvrKz+GjsB3teh/+7z2+dD0nRUkpls
         UwKjWK/0/TIG8x9RyHm1P9V3pFIDgxVwBWMm9s9Acg5l5WjoGi/oflKMUUgJkYGSRWH8
         5FI4K7GphAaIf1S96y6UYEw3wK5dr6gOAhccuhwJcS2f/nf3kqwKWzgg04zi+fon989J
         zqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDh1X58CGtHIEhOJ5O4lzeYx8yT2192S5lE07B7Mlx4=;
        fh=cGUawJk04sQgtVXD+51uTby66kUtyvehmYN8FzgRP4Q=;
        b=J0RL9ApvGKEbs6NoKIYphl+6w/1OIEUTv4DBh4mab9JKpodTG0jDS+23+pL1KoqhQI
         docmaJcH7cj+WWWc+ghWA+8CIF64KWXjJzsQS2XuSt68NgyiI3Uw8GquO00ilaU4sVDd
         itZ4lR42S3xqGIo2ldQ0DYGgsb7YQ80159B3kDzSV3Yk6GqRnvNQ6NyP3rrtHWqgc5Uj
         27bTDNb83Emnks0oHNZhTE9+cbW9/szJ9AVldQaN3k2AcyWZT1ECZc1/HaaR22D/diV2
         WkcFRFJnxstOsRg3S6onnI3dcJAcaypTNicAWKwM0h34SHd3Zsoyw6VzOA9JVV1KCavx
         vaCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771917011; x=1772521811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDh1X58CGtHIEhOJ5O4lzeYx8yT2192S5lE07B7Mlx4=;
        b=lEvfO/+BIHYqIfDVHnxi4EyIlmvJBuSSRlwZit1sM6liaMp/D7vLKE+15zC0T0ipPp
         AZiH+c4mA+u2HF4EK2Q1r7A2ttUcMwxjsGRgc63JFLO9rHcjES2xSHGy/JIAJISaNWBP
         W1zMJ+LZvsQnhygLrZvwIrVLwimln530vaT72fyuMIWLTnqNHrkG+skWbTdXhr7onJc5
         ngzhNsCudXQFpN4DbEG1ABR1hxAU8mtRZwalgYWkK5jYt3F51zZBMj+1nvG8RmJgBt0C
         0p2mxI4PvgVNWUTY6ohy9zV2KGrvKRqrVlQ+O4r4IpqyL823GpcFKKgqrlmWXA2Daqt1
         d76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771917011; x=1772521811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDh1X58CGtHIEhOJ5O4lzeYx8yT2192S5lE07B7Mlx4=;
        b=SIMLy2GczClYjQAVmgyOHmdG2V5PKf7nXrJUDjO1K4pjsP7ktvyF30FKLgFsfOCzxb
         oYznBGkxTIxv8sCd+i0Oj0kqC70n839JTXwx5fGD7dmbmi9hkZuhyaSDa2x65CP51rsh
         kj2/ZKjpdUncn+M/HNhrmn5IcuTMvN2ZURNsaqVvi/48hl8YcvjwWQwNe9h1iKVESYhT
         FabimrTJK5nG/yk9i/nxLIZrXK2uqTNxNDFLXAEOSnrTd9V06fkCYWbPCbBIBYCpq4mK
         jjT2dfEspP9Ks0Rpm0DmGNWJ/DmzVcP8LZNbfJxm7UbZ+s0IrtzIn62n9Yq28TpYrvYN
         CPTg==
X-Forwarded-Encrypted: i=1; AJvYcCWXIfyzmWbHQQZGjGkLzlZMdcdW28YqoweJmlOPARMaqr9D7/z8/Hsq7U98vdN19H/72OTHc2TdK/T3itmVZg/i@lists.infradead.org
X-Gm-Message-State: AOJu0YzVK4XkZaSVm1Vt/1o43HP5dAP2SaH4UXdN/61+8pFYWxqZ87Ay
	eYoTZI1uQEVHbA0MOR9vjt9k3J50d5g3vHktPLiq7iBBRnOd4HXY4trGj9JguZ6g2LnGAg9LTiN
	axZAnq7KBH93YSDh5+h2enleeDWfBgkA=
X-Gm-Gg: AZuq6aICB4J3l1bosiazpOBRFN397Wn/r7tAPY9uWYGKtT+4MBFozeVhS+T758Cmlgb
	J5yDduF/JJEZkcfYm5fLnqlLu94Ij8B+VBPlIEGtk6cdUBXQcusa+3jeuaSGtZKq/e04z/IkTjR
	pr3myaO+s7m5mSjX3r2YCwzCaAHywedzHeOIRnsbEmlRWlcyDl0PZB4l/m+etD/vsuH2VFSxJKC
	re8KKGFa84H6RORgsQJTT7ufS2tBM6kdnjk4Vnb9GQ3twsaGIcCdavI3fy/PBEcaokAaIu3EePs
	fFZLTQ==
X-Received: by 2002:a05:620a:4542:b0:8cb:49e8:d465 with SMTP id
 af79cd13be357-8cb8c9cdf1amr1435936685a.1.1771917010858; Mon, 23 Feb 2026
 23:10:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com> <dc94552605926f9ce84f9fc2ddfe5f7d1319e41c.1771897150.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <dc94552605926f9ce84f9fc2ddfe5f7d1319e41c.1771897150.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 24 Feb 2026 15:09:59 +0800
X-Gm-Features: AaiRm50gV_sbQYWqKJT2FRdoGoyzbrwY32xyRnOfje3kmZ02Y2IDouBJLsb2AOI
Message-ID: <CAGsJ_4y2wR3wgJbx-kTSzrEYaWXJv=oSVdy0SE2VzSzoyMX=Gw@mail.gmail.com>
Subject: Re: [PATCH 1/5] mm: use inline helper functions instead of ugly macros
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_231013_433463_9DBA480F 
X-CRM114-Status: GOOD (  10.46  )
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

On Tue, Feb 24, 2026 at 10:02=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> People have already complained that these *_clear_young_notify() related
> macros are very ugly, so let's use inline helpers to make them more reada=
ble.
>
> In addition, I cannot implement these inline helper functions in the
> mmu_notifier.h file, because some arch-specific files will include the
> mmu_notifier.h, which introduces header compilation dependencies and caus=
es
> build errors (e.g., arch/arm64/include/asm/tlbflush.h). Moreover, since
> these functions are only used in the mm, implementing these inline helper=
s
> in the mm/internal.h header seems reasonable.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Barry Song <baohua@kernel.org>

Thanks
Barry

