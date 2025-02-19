Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A96C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvUqBXo7pX3OGufaHCVvGrqItUXzyJoYQX0buW7FGwM=; b=eMZGuUIdcx73o5rmhG8oqR+QBG
	AdvBg6yxLfh64HFw3wpJyt6aXA+cYKepd9uakGMcGw3o+lfuplHT37LXzWV4eKqzQrhC7XUjgjeXP
	3El5UpdntFwHkHY6gtf9FurG+ahwnrb8AgfwdAMz4DbpDtZCOEZnrUVpqIicqZ1KUZ6dkBQcSQiQr
	y/5LgudLwS2+ykkZdDb11UNI+783UPHFdW6KFZZqg1puyqYt5tGTe+/ObLqyotxSm+TvoAbwpcSoL
	3elFRm7q0rA5+lj6BVhfQ+dPtSyqmkmtXTL5AByKiWr6xHDMeVpWuWkeEbf1sqC9uSE3Sza3x0CxL
	dc6ZH0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhop-0000000CI89-1vNr;
	Wed, 19 Feb 2025 11:00:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhnK-0000000CHm6-2AbQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 10:59:12 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5452c1daabeso4239015e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 02:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1739962748; x=1740567548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvUqBXo7pX3OGufaHCVvGrqItUXzyJoYQX0buW7FGwM=;
        b=eh5+Aul21KN0hENohEB9ebtGubTAZtjJEhviKZpHOjfvyWmE3VsPlfNTAkj/MO1HpP
         eZRON4ESiVsvTN2F3QrhZq74QHCHQu1GPyyOvdpKRRuNEveuAh/R944evUm97tDX2HtI
         Jq3CSsCQZMnbEdyFHck33qf2IJx8stmBnwfGBMyt96NL2RfI4YMQ39I7f6yDjsQ0a2Yn
         fdYrHXN3vhvbujUbLTcqs3mB9Q+Yn42wVKKM+4MerbzunPHDjVR/RnyVJYxhq8iujfiP
         mv9EtmszWkhqsdhtNrNqKDQm2nTb/nflUcehsvHV3eis2tXV38+RLrNEstc6V3xfEE4a
         mWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739962748; x=1740567548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvUqBXo7pX3OGufaHCVvGrqItUXzyJoYQX0buW7FGwM=;
        b=akAlfMxE0O9iiADNKklqGvkbNenuYlDG/1aRoUkjj6+MkhNh0ghczj5uSqrKguDoZN
         ZCyAIZR6+MaZO7ZH3FqVWakKMabfH1eaybhrPqhvKPW7afKSeLlmXTlMj3UzN+7ewEZ0
         CcZuT0MLUFomZwlJQekKPSRhTvc+99iCWJV0LwkVfMYthmmtxHrbv1X3y0+t5EF7uPTs
         LxgnPiRkIhAhEUiFyhbR1aquGZAQjATUFmZ4k+y/2x2xXmQYjFyE3BO41Z6mjETUJNy9
         hqbCHqcfgc5dmH3f8hovhjuTnR3dw8IUCTi6MDFJyf99omRBJKdv1vr5apkrxHa/e/b5
         Pkng==
X-Forwarded-Encrypted: i=1; AJvYcCWqc9ttCVpoHh48KyVq/w6tQS2Hg5uchQfo7loQzphboY9l5HRCJDd8ntas+ID3evtefwqCYUsJ7Nvugd9F1WYV@lists.infradead.org
X-Gm-Message-State: AOJu0YxGY0YNrXmHYUw8qlJGQ09eCszq2w1lHgiqAgiwL0bdh8F+OEBI
	0V1XdVfnSHBRtBvfXHx0rXFl6fqPKdi7/9VBK3FNq2DG7oj8ucc88cmDJJcoQu2Bqy6HeUD9joj
	xHg4lVl/pD2ZNsi/HQrePlveEjeI/CjSAI50BkA==
X-Gm-Gg: ASbGncvfolEfqTPRqXUf3W54P/gs1t0JGbYGzLhmc9vPxZROL/HhI2U9P2YclfRU7PF
	CLKneEf+dGIoZovvZh1KwwpEEJoMLFJ/r6a92l3yEMlF0lHcpeYITk8BItL/KIpR2uMknnmVMTL
	XZk2b6OfaoJoJWD11RvsaRjKSvfQ==
X-Google-Smtp-Source: AGHT+IFDf2xMI1aCLfZeNkHbqTc1fxdjKU8LMLIa3hxyXKQN16RxmxbrXD8qMf75n+E2fkiXk1K0zktwSDgaBlo61MM=
X-Received: by 2002:a05:6512:158b:b0:545:2cb6:af31 with SMTP id
 2adb3069b0e04-5452fe426cdmr6409842e87.15.1739962747645; Wed, 19 Feb 2025
 02:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20250217024924.57996-1-zhengqi.arch@bytedance.com>
In-Reply-To: <20250217024924.57996-1-zhengqi.arch@bytedance.com>
From: Ezra Buehler <ezra@easyb.ch>
Date: Wed, 19 Feb 2025 11:58:31 +0100
X-Gm-Features: AWEUYZlJLxDsFiFpyrhpbMagLjwKnctzA_YuuA29jDCzt3ZkPaZaHYpVKVWkXxU
Message-ID: <CAM1KZSnM-imYwM5Gf4gw8yXr1+6PXyLvbpKbBu_KJmPR0WS7cA@mail.gmail.com>
Subject: Re: [PATCH v3] arm: pgtable: fix NULL pointer dereference issue
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux@armlinux.org.uk, david@redhat.com, hughd@google.com, 
	ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ezra Buehler <ezra.buehler@husqvarnagroup.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_025910_808601_F4133FC3 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, Feb 17, 2025 at 3:49=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.co=
m> wrote:
>
> When update_mmu_cache_range() is called by update_mmu_cache(), the vmf
> parameter is NULL, which will cause a NULL pointer dereference issue in
> adjust_pte():
>
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
030 when read
> Hardware name: Atmel AT91SAM9
> PC is at update_mmu_cache_range+0x1e0/0x278
> LR is at pte_offset_map_rw_nolock+0x18/0x2c
> Call trace:
>  update_mmu_cache_range from remove_migration_pte+0x29c/0x2ec
>  remove_migration_pte from rmap_walk_file+0xcc/0x130
>  rmap_walk_file from remove_migration_ptes+0x90/0xa4
>  remove_migration_ptes from migrate_pages_batch+0x6d4/0x858
>  migrate_pages_batch from migrate_pages+0x188/0x488
>  migrate_pages from compact_zone+0x56c/0x954
>  compact_zone from compact_node+0x90/0xf0
>  compact_node from kcompactd+0x1d4/0x204
>  kcompactd from kthread+0x120/0x12c
>  kthread from ret_from_fork+0x14/0x38
> Exception stack(0xc0d8bfb0 to 0xc0d8bff8)
>
> To fix it, do not rely on whether 'ptl' is equal to decide whether to hol=
d
> the pte lock, but decide it by whether CONFIG_SPLIT_PTE_PTLOCKS is
> enabled. In addition, if two vmas map to the same PTE page, there is no
> need to hold the pte lock again, otherwise a deadlock will occur. Just ad=
d
> the need_lock parameter to let adjust_pte() know this information.
>
> Reported-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> Closes: https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFT=
zVVEQ1BO0cLkHEQ@mail.gmail.com/
> Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Acked-by: David Hildenbrand <david@redhat.com>

Tested-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

I confirm that this fixes our issue on the AT91SAM9G25-based GARDENA
smart Gateway.

However, unfortunately, I do not have a 4-core ARMv5 board at hand to
test the CONFIG_SPLIT_PTE_PTLOCKS case.

Cheers,
Ezra.

