Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468B6D41C2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb7w4dEkS/WJYKdR+lnZ5LKlEUSJP7zUGNH1/GVMobE=; b=FBh4QJu5UA/2qmoCf8aPWsJXzi
	ta9Z1A8fa2UiBCfnjhK94oNGrqK3pC5Fe+ivrdtsDmQ0ECryfdE8TlyCKl6O8bW+QgGR+4HQGTEm2
	8d5LBcasluP0y3tQsdq1Z4i3ye1C7zi3GQYoUyZjhhWcQZYyzQWGm83YEmWtNhO16AwKc0BBRZSOc
	JuvEw60Exs5jpoFGLZ5PzXIBSgLOTMWd8snaGZ5f1Xvq/Bm2jlZV3oSOcMNWaxz49rusl6aPHcWRW
	8SXE3u3kezpI6BxiZxj6bf9Z3/DLkf1/pgR+nbUtzCgVTf+9p//OHpeVCTY1kQbFvoc/I7IPud4T/
	Ah/bljTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTfuv-0000000Gb5s-3kDf;
	Thu, 11 Dec 2025 12:37:09 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTfut-0000000Gb5T-2JZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 12:37:08 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso9214241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765456625; x=1766061425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb7w4dEkS/WJYKdR+lnZ5LKlEUSJP7zUGNH1/GVMobE=;
        b=jt9Y4qrLfKh1xwtIlCUs6/80TY2IxftALg1T/HKxfxlm9FBBLGGJx2mzhVagyaLouj
         Clj3IBC+g4trq9NwLLo+i5xt4nV7ALYVpiw2YagS5WUcI1byHbuEmGUVTOtlTDncCsZw
         BcCDwYo1kWpseCeyJEAU9LWaxxzjjb1ctLcUCm0xrdiV2hPD6ZPdiur8oNtwRby/uN8A
         Mr6Y/PrU8ZQeKnuVHFhZnBDXfWPwlQDr2B79F0NuppU5WaFSTqdNRKsY6vv5B7bj+y83
         1s5KHRBtaZ5PEoTaXW52JNqAJWcg6IaWtiJjmXIoL6xns7FjoThAzmz0w6ndwJpu2FVL
         caaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765456625; x=1766061425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qb7w4dEkS/WJYKdR+lnZ5LKlEUSJP7zUGNH1/GVMobE=;
        b=c0wORzPmdEo32FCROmSl8U4/XeLgQt9zrcDdC0cXJe1cD6vKi0IWvRI/be8MATGBuw
         AbhaMRgWXhO2ay7+foIS/kiz0F4kr2npzzGvG6RXGgTzDKBqvrekwkwoWhgd+mvviPeC
         KH5TxK0EErHvvorLv4+1Sr8cWxV+fXOhiI+KrebC54zuUSswhZ+egWd6MHtBZH6wVCIe
         i/E03EBhLcwWE5H+RzdyQUYLMnQnkZsQ2qgy9XzeB5D/M9CtWvXv0fn2LoZTjUKqoXRq
         JyyUCDFgH0mLHgzqiP3+QY1TqahIYYuO/BIiS/n4BuEPxh4LOjxkffMqOcHFjsXXkuMo
         tU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzQkNbRmcbqkz+nN8b/9N5PZJBV9EUzdfBvShOGT6uMddLWccMGEB5JlepJB4U8WZEHVeoKOttYRhbFIhamE1E@lists.infradead.org
X-Gm-Message-State: AOJu0YxgHG1CjOc0JpsG5vnGd1wRjoNCYZv/LVgQIlQND9nwIdfhBCvg
	N4GxIYGe62Lt3wDDxvhxdqqM7kyKtylo3kWFRLLMJbeiysIIPcP9bzO89oEcrZGvNzZ86a1WI93
	SAm+mkrVR0ag2Qy8OzfslSwmkbdbQlXk=
X-Gm-Gg: AY/fxX7ALCnh/tPotX/vG/im2AH0FbYYswXzwTsKheCRMesYj25SM4yChwe8SLmK3kx
	fr9el+3xDi2x94D6b+E9iwvCygNRP4w0Qu0QVsxtrEnH6e1ltkK0Wf9zuABg1w1Xd5yYzAlGGv5
	uXcgrz78FQDuErcLwDblcI20twrYKQqL1LvXiVs6YlfsAXMiFN8Y1GCaR6VOy1GW2NQdwOqNCty
	cxbll01e1WoB+RU9MJYTG4fb+eeDsOG4z15emeV1Rk5yI3/+NtoNJWHN83U4prbpa6P5COdYsDc
	VsZBU8Dk
X-Google-Smtp-Source: AGHT+IH6QD73T3CQ2JBAUzE15s0jML3qHw16C343Rh4nwXrF61qHiGoVQrgUOlxSDKVLaFHRU4/Fj1pnToTM924tNUc=
X-Received: by 2002:a05:6102:50a6:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-5e571eed9b4mr1779282137.29.1765456625268; Thu, 11 Dec 2025
 04:37:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com> <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 11 Dec 2025 20:36:51 +0800
X-Gm-Features: AQt7F2o2oQ9UqEmkEwhl5rOFyhajnuLd2K2hl-pbOyh5rDa7buD-_5Vc_9Xr_KQ
Message-ID: <CAGsJ_4yVCbP9EJ2KZu-83PL-LViB+zn3NPC5E61LKf+nWWNsWw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_043707_612714_AF701475 
X-CRM114-Status: UNSURE (   9.09  )
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

On Thu, Dec 11, 2025 at 4:17=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Similar to folio_referenced_one(), we can apply batched unmapping for fil=
e
> large folios to optimize the performance of file folios reclamation.
>
> Performance testing:
> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and t=
ry to
> reclaim 8G file-backed folios via the memory.reclaim interface. I can obs=
erve
> 75% performance improvement on my Arm64 32-core server.
>
> W/o patch:
> real    0m1.018s
> user    0m0.000s
> sys     0m1.018s
>
> W/ patch:
> real    0m0.249s
> user    0m0.000s
> sys     0m0.249s
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

It appears quite straightforward to introduce file folios support based on =
the
current lazyfree implementation.

Acked-by: Barry Song <baohua@kernel.org>

