Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCA6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkpApLmuMSuoEXBLQRnWWTTZmdzVTlEP/UbOXT6BIvI=; b=IvK97vUZwz7YQ3akhkuaQ0cv9Q
	euPlJRbcSqC632qlaWuKaG6MQ/tPEIxXkEeg5cg4RObTtKo/5Ltr6ho9A2BaH4ube/vky9+nLlbvJ
	3IgkqXVexD1Q3DEcypLoAU1PFVfgXtP6AMp60cOQkomVQDcteaui0zDOoNHcZ4+BaEtUEJm0HTzXn
	jFyGO70gCwqYmtc2BWDauLCra6YdAOdLpYsD46OdtOhXf6sNO6uEgDUWblaUoq6fapd06SLL0IsE9
	/cOqp7QafoBUC+8fJF5FEx7U917PxB66fkUfAvqqK636ajJ3YJZz3nbJpGjtACaxVG/iqpwEL63Zf
	NaPbUAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7BP-00000006UDR-49kS;
	Wed, 12 Feb 2025 07:29:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti79y-00000006Twg-3TCB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 07:27:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-545039b6a67so3882116e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 23:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1739345268; x=1739950068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkpApLmuMSuoEXBLQRnWWTTZmdzVTlEP/UbOXT6BIvI=;
        b=WKtu3tYKMzgvGGfMLl91oe3aTSz6umtZ8cDTFacsrlUptSmdll3zAs4czPc4Y3twf9
         f7RR4HrQaM6BYo/l6grg5eLCwZnOzT8+XdeaLRSLU5Gl3c4gA+mZxby/WvyQppVM1nzJ
         P8JC0UvrwSvpooivN4qnZM2vdGSK86LOugH3R0BFWMvUp8AYC98iQvhGSPL0ZfCy8lQl
         XhmQSa904GWqBdxULB7iXxeMhQ69CP6tzdkw1ob1FUAhIgdkggUT4eSFOvYk0qcPpEhM
         KhkyXkXufK3UWNzSFvE8BDz8jszE0EUSt28B1+iCcZVMmGKFYZLP97diqzdKQ12/Xh3s
         YsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345268; x=1739950068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkpApLmuMSuoEXBLQRnWWTTZmdzVTlEP/UbOXT6BIvI=;
        b=GkB/eGNMWx8cXbMzFcv3LDZPhrHZqHRsfCGle0VkoYXBfOVAEiBKOK1Jj1dV/L0anz
         LYQqprzPwB//uWAs3w0JRWMskUG3xsaHvQG+77t28EVn0BMDznFkH1ppJW0gFU1m6DIN
         wvY2eNT805mOt4k4p7ptmVR6eYaiqQVo9oimXiF+5Izq/R2nmmxmnCnAMiNYGMhguC6Z
         n+CLFLH0JvvI5rVP7qqqpxRSdP8LDLI4C1Oceocm7eFuYuyjFVZdqdF9pPGzJDO7adVB
         8fCcYxJnElPenhisdaaa4SI1JJlLYUlWLfViALBBgX+LCcVHdstIkBTe4W1BAPw39ApP
         BQXg==
X-Forwarded-Encrypted: i=1; AJvYcCXub630WPYTnQw7PxM0farVh9o6zYUdF545000ylvZg+LnyC+d+6T8wrrkUimALoQhhBcnXoTr9RpvWcxfdE347@lists.infradead.org
X-Gm-Message-State: AOJu0YwfMbCWZurkE8Y8kQrazFoClFyM/FJnD+aoRoQAgKH78TK6egFL
	Ch1iwZYbftVvkJ7JFpu/3sNewD+Ed6DlFwQPKR+U66njjVEds6pNyDE3TdejPOO7mpg0lD0bZkg
	Z0mmTAy0rzRkqmx4wztdM6D3bVcYgE9NY7h8lpw==
X-Gm-Gg: ASbGncv66jMRRMMirYSCdJreuSt0mHeIDJGz0qM2xVOv6BQVJkx8dDN1FbTIIufAcXg
	F24ve9aNQpERk9wjlCPRraiAFdUVCyaQTrsNxAgyFdMt6SsjIOwIh9iJjDTQR22lnGGdROUEn9j
	pD9jro3cw4efmWS/y6KwCPoQ4M//M=
X-Google-Smtp-Source: AGHT+IHBuOV1u76P+sliG1ZLyRYbTKiqx9yn/XwZRRCZd7FDQnrrgDlhR9/jciNljT0bWlE6m70c+Cc75Sta0/soFRE=
X-Received: by 2002:a05:6512:3a8a:b0:545:c7d:178d with SMTP id
 2adb3069b0e04-5451810906emr456277e87.12.1739345267946; Tue, 11 Feb 2025
 23:27:47 -0800 (PST)
MIME-Version: 1.0
References: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com> <20250212064002.55598-1-zhengqi.arch@bytedance.com>
In-Reply-To: <20250212064002.55598-1-zhengqi.arch@bytedance.com>
From: Ezra Buehler <ezra@easyb.ch>
Date: Wed, 12 Feb 2025 08:27:11 +0100
X-Gm-Features: AWEUYZmZw_dR7xZ0V1G7gpsQgXY4quV-0zHZqZHrTMP56-HGWMQZHyZg-iRxnUM
Message-ID: <CAM1KZSnWFivV-7nc55MBAEtdP1LXfW4eLKa-94HPZaTP0AOPrg@mail.gmail.com>
Subject: Re: [PATCH] arm: pgtable: fix NULL pointer dereference issue
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux@armlinux.org.uk, david@redhat.com, hughd@google.com, 
	ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_232751_155543_1090084E 
X-CRM114-Status: GOOD (  13.60  )
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

Hi Qi,

Thanks for the fix. I will test it as well as I can.

On Wed, Feb 12, 2025 at 7:41=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.co=
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
> Reported-by: Ezra Buehler <ezra@easyb.ch>

Perhaps a detail but, maybe better use "Ezra Buehler
<ezra.buehler@husqvarnagroup.com>" here.

Cheers,
Ezra.

