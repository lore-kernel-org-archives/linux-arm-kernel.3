Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A50FD5B158
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzKMMOiYz+t4fL3FqCrSRgCEZ8AU86AJ+y2q5X06rvw=; b=G8YBvMWcTy9zfhJ8dU4fHvnp3C
	O0bMmOAn0jwHd2OxEcKz+K1SSFQR/X6ppRWUPThzuXQ8Azcz/rjgntHYSUXvWP0hYlw8MQmulbP7t
	rCkOB16iTM+6aIdksOyKpBrqBuBdd33bfMRgUq+2hXt3rJWdnOVozrjWH2n7FDuNWt0Zrg3JumTR8
	m/Vy3ucDnTwYoD67qL/TSnJizCRb9Ku1LLMxRXvY/sDLE3DXJyBkF8R+c6xNf+7DaDwpC+KL0ADqH
	DHfuqNirGY+KpF0f8f0UY9RZ2qo1H9a+IOpI2UTQ5LzDkeGvSInsBUDIdbK3FaYz/4cN5mqpPJphg
	4CZ8zGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XZn-0000000CNxc-1fTv;
	Mon, 28 Oct 2024 21:47:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X9G-0000000CJu5-0LCA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:19:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso732724466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730150376; x=1730755176; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LzKMMOiYz+t4fL3FqCrSRgCEZ8AU86AJ+y2q5X06rvw=;
        b=ByRWw5DmqhV6q9aDK7MjwG/A+xg+2zL6ITMTNafy+p6XiNCxUdUXrBUrtFtA3xXXKQ
         OORd9im6RrXDxumwA2c/+JPzO3dMXi/3Un+TkUUcrNzaNL7Lry1Jfkm7zWts+7EJz3Ik
         hxMPsirBYVoHfNP9/OxTQK/J6O3llmtnChNe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150376; x=1730755176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzKMMOiYz+t4fL3FqCrSRgCEZ8AU86AJ+y2q5X06rvw=;
        b=sTgddKPt5f/MiSFyFJ60Jdav9lGT/oF4rIybNEU2iACDydTFlMtt3UQkuJtF5ONu40
         de3X06t/2zKrcx9AephCbAlBL8mxltVg0jenetH6cjEBc1634NiQPhYL7V4sTFRF9w+B
         gCYU3miC8VNoLcsPRnnhxrLfjT3mbqs8bgfYBuEHS7VwLO+ybWV5LJ7jkKpJW0Gy+cyy
         ybbW2zAElpGqswyqvOWAg+jqUavHKkFvHKTWfX87COf0IgYIx3mjEvBMlvM9/DhCWR7t
         Zzdz8PA6HNqwGcOyVglwPMf4rTR9G+W3HG8T+GQjSz+l2eBjGJSA6YwzlHw7iANN5CTP
         vafw==
X-Forwarded-Encrypted: i=1; AJvYcCVQUDPlGygV16yvSesJXzTENADMp4qg9Dulyaea3iAUc90ISMwnJRdSii5be7edbKy4UCuPHCw/+XICKNZA7x9n@lists.infradead.org
X-Gm-Message-State: AOJu0YxLwDpULzyU3E8+Rkh3G4S/tmqdSC1vZYBafw357kBhRzF6iA+E
	/FT8BzXoS+jXqmD8/BfGFLRpGaYuUXmrqEiOGGXfF4qB4KSuAWnwExzHzNJOHqEa9kBhzlU+Xz8
	GKfojXQ==
X-Google-Smtp-Source: AGHT+IELcow67W74dEKRIlauArTHGHa8Rt+1skgJUmQUcOCRN7k19sPpctdti4WdyDmIAhTRL243Zg==
X-Received: by 2002:a17:906:c10d:b0:a9a:37fe:e7d0 with SMTP id a640c23a62f3a-a9de6199186mr907606366b.64.1730150375954;
        Mon, 28 Oct 2024 14:19:35 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0887besm409133266b.207.2024.10.28.14.19.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 14:19:34 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so6088415a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXojM4d+sRhg+Ei1eTPfUV7g02vUGuB4HwV/i+F4eGE0Lkw22cGXBOfUiN2ZTWU1M2dtfXQhed9zqqaIoQ0xrpo@lists.infradead.org
X-Received: by 2002:a17:907:d2a:b0:a99:87ea:de57 with SMTP id
 a640c23a62f3a-a9de5ca5ec8mr765253066b.2.1730150373413; Mon, 28 Oct 2024
 14:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729715266.git.lorenzo.stoakes@oracle.com>
 <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
 <61461dcc-e455-450d-9c01-5465003fc31c@sirena.org.uk> <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
 <CAHk-=whD9MrPwPMBgVG16T_u+my8xYtZg2tUGz932HeodVX7Bg@mail.gmail.com>
 <438f50c5-8b8c-444f-ae85-10e5151f3f24@lucifer.local> <57mgmdx7wgfwci3yo3ggkmcnm3ujamgkwcccm77ypvmer5tegn@opiq3ceh2uvy>
 <ykzmur56ms7fm4midi6tbncjvcvf7ue4lp7e4orblrmwnefw3e@oa3enlpdrcrr>
 <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local> <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
 <0b64edb9-491e-4dcd-8dc1-d3c8a336a49b@suse.cz>
In-Reply-To: <0b64edb9-491e-4dcd-8dc1-d3c8a336a49b@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Oct 2024 11:19:16 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgE8410gu3EabjNEHhOYh1dyYwt23J62S4a9SYcwZUFhw@mail.gmail.com>
Message-ID: <CAHk-=wgE8410gu3EabjNEHhOYh1dyYwt23J62S4a9SYcwZUFhw@mail.gmail.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region() error
 path behaviour
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Peter Xu <peterx@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141938_154103_F33F6E6D 
X-CRM114-Status: UNSURE (   9.04  )
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

On Mon, 28 Oct 2024 at 11:00, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> VM_MTE_ALLOWED is also set by arm64's arch_calc_vm_flag_bits():
>
>         if (system_supports_mte() && (flags & MAP_ANONYMOUS))
>                 return VM_MTE_ALLOWED;

Yeah, but that should just move into arch_validate_flags() too.
There's no reason why that's done in a separate place.

                     Linus

