Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E500CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5Wim2l7yHGi/WuR+a4P3f7TIA6US21JyW18qkpxH38=; b=XViB7GWlVIQ9iA
	BYOU+4MmTGvIkQPw7L57dwGTT4UMRhIqB7sFrI/tQ1yiB3sTAUyW1CbZvqMDSDYj9vvyZVlAMIUa3
	C66ZCOi70AuPqN3g1Z/koL3RBlc8xlbWROAyzuD8OXts1K4bAlxThmigis63SVs9yFjlnqoas9aQV
	81w/9H9to8niKF2AxlAPtMipcpUDLmBzlCqP4hqEujd96U3XCzybpPxZLqH+npcvq8ZmtJCEBmpT0
	xQJp8DUzpNAy/IWvQ56b2uu3VdE8tYr9mbe/TP0xKv4RF4hBDvhqpwqjSaQZbRH4lr15nWxY6/L6s
	x8zpaP4++HSsXtMxM+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6qW-0000000GEot-0HzB;
	Thu, 06 Nov 2025 20:44:40 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6qT-0000000GEoX-3TFK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 20:44:38 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8af121588d9so6155985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 12:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461876; x=1763066676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5Wim2l7yHGi/WuR+a4P3f7TIA6US21JyW18qkpxH38=;
        b=jsWxrYqB9vSXsF5IKpsZAT9zaQX8Yv/MhzdzxcTcMIidVGkFRLUGP7cXYbnSMnUJjz
         ts+WKEAi76LdBs8JBGGt4uG65+h77nKf0eWtkJjlwJFmYspNlFwgfMF7Or1S6IWfEh4w
         Hq86W0OlMJI3NYxzNdFQ0fZ0Nv+dQTgFIPWio0wqUPg9yOBANi8na+wl9hFezOMnM1nY
         Ap/etQRDynXT6XP0Bk6qhr2q2ubwV5zob7kwGxP+Y8XJTwucmp7fx5pbNWMM+uB3ukdx
         X8LJJEVpGchTf5MnxSg4TQomGg90WP0ZDyILz18TBcfkmVaLoWyZQvntKE8cwJwrGSCQ
         uMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461876; x=1763066676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5Wim2l7yHGi/WuR+a4P3f7TIA6US21JyW18qkpxH38=;
        b=a2J+cAIy6+eGY73Dc8HlSYQ0f6J/q2VvxaAR3Jrroq845HtqjYjjcLjYeFsmLpx6Ub
         6oJB3aP4CWAzQoMlzTSDX+ckEZJDj2fjJx023pEYy8YIVjYQuWPH3xHErSpasao0XlWO
         qP5VvVkiGQHdjd/pN3QGA+kqYDHlJEz0hYv9nrs1dvBwr95Wsux2lGfuCo/QlQWsuc0Q
         7/yYiHLgGVR7hjNmRjc6UDf06jEfWBH2RrtikE5jxDRxhj8t6QXYJXMe2pf9Zf2y+dT4
         LB6HzwXdwbvMjooEKGhZ8L6ZCy8W/wiOqRJozWsnokJF3o1O6vvS2dodOBfHMUKaT8++
         sRkg==
X-Forwarded-Encrypted: i=1; AJvYcCX3uUpWeDAdYF0FpyUCc8S80CaqbcLaVzHFEBtjNs+DViDpN94a3GK+VCmbDNVagItXhUpW0P8u/Zf3EgjUpxad@lists.infradead.org
X-Gm-Message-State: AOJu0YwTYX9nmpdG3pI79WjTTZu/Up4fm1mV7V0Kx3LuBLvbj+nvD+aF
	RIMF5eL+pbWuktsWNv2TRuD977Sx6TQaDtZsbog0sMeQenMdCu03t8zF2pr+4zYGTVTnth2bPms
	mlXJdAr75NmQrO2659gbvaIbCz0Q6vzI=
X-Gm-Gg: ASbGncst9AijrYUlYBeYX1398ea8GxzNgoJh7vC9HOxUzADg9mFCLVQT16jHxZI1GnX
	P6lzpVogKeXgvsd+1hJN1UbCwc0JNBZmWfMO/ZjY9ipxfPIErcU1TIxFwHzYg4ycWrRbCnVsNjT
	6JUjSF99n1QYWbvGNEiYwfvLwWcRL6KiKKXl7S7J/v0OBaOlBNqTLrheYGQJCZEyiKW16sPz1qb
	DFLkOI9zmcnR79G5D4XdnMFW2PBgcGzQOTr9BKAoJii61ih4j6LJY2ybP5xUVKNqJi/g9FC2ziU
	/YjwmkWdCNOPqb+xYNw4PgEVxZs4dl1hIFkjsw==
X-Google-Smtp-Source: AGHT+IGz8Y08GiIKkx5vY35Pamqy5/QXc0dcKCzhllhnUKHhV1vYYvBZag4ViRF1b6CAEtb+2wXa1fOPMaLoDa+5/MI=
X-Received: by 2002:a05:620a:4081:b0:7e8:3fbd:4190 with SMTP id
 af79cd13be357-8b245274f77mr136213385a.2.1762461876060; Thu, 06 Nov 2025
 12:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20251029023115.22809-1-21cnbao@gmail.com>
In-Reply-To: <20251029023115.22809-1-21cnbao@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 7 Nov 2025 04:44:24 +0800
X-Gm-Features: AWmQ_bn8KiJSqK3-zGdnXEadv5DAIhjUO-bmMe5yIKhizW75xMm4dJ2q8wKSyoI
Message-ID: <CAGsJ_4wy6ZPhCvMqODy6W6Why34Lfn5WXf1bUwJh+Qmd2X2rCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] dma-mapping: arm64: support batched cache sync
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_124437_878621_9ED693AF 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 29, 2025 at 10:31=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> Many embedded ARM64 SoCs still lack hardware cache coherency support, whi=
ch
> causes DMA mapping operations to appear as hotspots in on-CPU flame graph=
s.
>
> For an SG list with *nents* entries, the current dma_map/unmap_sg() and D=
MA
> sync APIs perform cache maintenance one entry at a time. After each entry=
,
> the implementation synchronously waits for the corresponding region=E2=80=
=99s
> D-cache operations to complete. On architectures like arm64, efficiency c=
an
> be improved by issuing all entries=E2=80=99 operations first and then per=
forming a
> single batched wait for completion.
>
> Tangquan's initial results show that batched synchronization can reduce
> dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
> phone platform (MediaTek Dimensity 9500). The tests were performed by
> pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
> running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
> sg entries per buffer) for 200 iterations and then averaging the
> results.
>
> Barry Song (5):
>   arm64: Provide dcache_by_myline_op_nosync helper
>   arm64: Provide dcache_clean_poc_nosync helper
>   arm64: Provide dcache_inval_poc_nosync helper
>   arm64: Provide arch_sync_dma_ batched helpers
>   dma-mapping: Allow batched DMA sync operations if supported by the
>     arch
>

Hi Catalin, Will, Marek, Robin, and all,
Do you have any feedback on this before I send the formal
patchset (dropping the RFC tag)?

Thanks
Barry

