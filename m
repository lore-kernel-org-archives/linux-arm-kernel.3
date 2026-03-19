Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F40F109022E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=; b=YOroOaR3h5hEOQmGFdFPrUTS92
	O3V9AQrHMJAeeZX9TWYbIJAsY//pBmGPd6WBRrQ1j/nz4VOaojCq9QH4ykar6uzwHWdWcslk75ull
	tZDsM5Aj0j0g8TIfeuEwpQgNk/X+xiB6TWcTR2gXuxKgIO8gIN9REiRTXm1UWdAqJu0gGJIfl1TZD
	j7QYKWiBRaOS9hOdm/oBmkqZz3tpzlKiDJ0hMz+WyY/goUC/2B+AfzRdwHunN3pAyjshf7gAkNOts
	GaBIzNHUehjWCUkBjbBuLSdpHW5nS/TorCdbz4QPJ6wt4FyUdTLO934RZuK7cA5wlJ/Ra+2bo/3sx
	qyFAi3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E97-0000000Al1V-0xNm;
	Thu, 19 Mar 2026 14:14:45 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E95-0000000Al0P-0wvC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:14:44 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-67baf20e8c2so370900eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 07:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929682; x=1774534482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=;
        b=gAcXCwc0sfPTUDMjD5KUKkuD/rlF8EIQj1hvWmLVYUa/9u1e3S4qrBxqcyHuO9v1dD
         zYwTM/fEAb495WimBZO7+lTYwJ2Io0wYCQ9uqUHMwuPh+xviXBDvRLL2fB34uGB+YSqD
         HjJZkoq27M3pgbg8hbMDpr+6oTtjJqQ38sImSM4rUam/AZvASSjivwRAWwYi0A+Se3CC
         vGRbi3NNBBXmOr8LAZHkve0chRnC/QxjDJ1wooMdUO9wf7lQRdFMip0YA4H3MTQcUWGR
         AetVsoteYG4JvwyYLWxnXy/gKKzneX7wGbCZpjvdoeQUg0afPjyAfEN81DY6ayrSaogX
         K01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929682; x=1774534482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=;
        b=dKrxM6r3L14qbnXGKdD/2IbQerQrSRI03LveK808AnUxK+5bQTmhUOu1xTIFVdX8hr
         1gzavV55Am9ZFchzls1Gvyhvm6Q2Ekdrhfh7VBPzoOqYYHx9GGG18GiS5m5rzLTP6jYC
         bxo6v5YLuKDKwQqKNaOkRDkmmiSOVwcNMDn8SPPwG0+NKJOdiJsymuFzfzE+0t/p4gCq
         Mzxqs/2KjYk91zUsbQ+B3eO3XPOK0vVCR/s8EZnoMJJQa+s7BVU3w4KH6PHBzEpM48k7
         z3HldfqAMGUQm5gEKvbL0f5zltpkEAEmkcbGD1S03MfKYVn5BwW38yXpq96nr75JiXR1
         h+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIwCVSu72tlQPM0WyYhPp5QEiay0VT+IRJvfke01bsBz06/af8EatlsL9+ICs87hxlUNuxfDVs9qAznDlg33ud@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8YVn6Fd4zvO87yCUQ58UQQCbkSTg2wOxLlvTXBU5NlHKwDdNJ
	7Vag6xEH/BZ5daRc4U6+6+Dlkh9ynjHXFkh5bAFMP32/lNepZL0/Ldgq
X-Gm-Gg: ATEYQzyh04n8seFpV7MLtMiO5QyBu33iRguVA+G6ARHc6Jl/YqqkxGPcJr6i0E47yr7
	HqfWFkpECM7nE3d0mgfArMFnMxlXKjH549MU3rjzYfxGLkXBOWfEYTzQkOPkYGSfJxL6goTZRo1
	X4fiv7odIwP8iSnMhIGfiMpirFYAbd6JXj8K5fmPgZL5ImQUbAv8YdFdx4hwUNO4V6HtQ1bbKse
	TF2HPSdU5edQW4U5WdXeODJYiVMzHhC0b1LEnPebB7viBtrvUKdJBN7NC791IMp8w6AAe3PDTkz
	CIKK8PJOY3XDw7tw2jewqsLyT9eIwUV5QyngBk1ryOTtqy4fQ5vsmCT80/zGDlK9DoT5ra9NJZw
	6rKK+cqEFzBjIiGuARiM0XxOgW1mdScaGRKTF9zhZvC+CEhn24KzhOAjQeH1JdHcwhQ2tSvJknD
	A7WeYknV9i5l2MEazx3qKG
X-Received: by 2002:a05:6820:1518:b0:67c:c4e:4ca with SMTP id 006d021491bc7-67c0dab23c8mr4161966eaf.29.1773929681867;
        Thu, 19 Mar 2026 07:14:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd689e3cdsm5313808fac.6.2026.03.19.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:14:41 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Date: Thu, 19 Mar 2026 07:14:36 -0700
Message-ID: <20260319141439.218078-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_071443_269963_4A4194F3 
X-CRM114-Status: GOOD (  12.96  )
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

On Thu, 19 Mar 2026 09:19:40 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> 
> For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> CONFIG_CMA and CONFIG_COMPACTION already do).
> 
> We'll clean up CONFIG_MIGRATION next.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Hello David,

Looks good to me : -) Thank you for the patch, I hope you have a great day!

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

