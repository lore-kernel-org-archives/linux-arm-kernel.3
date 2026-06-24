Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A90CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gqBIwPaeWmL5XMuFIlmntneXFCjftj2s6pIOw2Q4So=; b=Hp7n1PmIobP94kGFng4+UfP0AI
	prWNHDwfmKH9Mku0Yuwtkwpx/rriiSbvTM3QgLnHeFZBuLH+4XSbUQamdQPUVi/Vo8QFGuN56uOw9
	63c0K11RPV/2Vz49hd+VjRDmloWR+mFEYwK16ullIfigfeItpDDUx13mgELgxprHvVxcM3OruvLWU
	l4uY4KjQJRZXWzp3El6V52eNBjKtYgZM2cVfdV5VxggxsbPB2ciY6DDR/mhcQp3adWhf/fsLJT2tJ
	BAdkflOX2vUKUiHwQJm3vHOmDRUg5XYOSrmd9zpN8tYFxg8YkuioWKRxXXVgReiLdiOpPSSyLlmFc
	0U6fNkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOvi-00000007wRn-2RPB;
	Wed, 24 Jun 2026 14:50:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOvf-00000007wRQ-3fLy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 14:50:17 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84237a0fd84so165738b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782312614; x=1782917414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2gqBIwPaeWmL5XMuFIlmntneXFCjftj2s6pIOw2Q4So=;
        b=oT2+dwG0ub3QEZ6aZCw+ORqc3FP64GYv5GlOZBxOtDMBgC7NyBFWUBfE2CZgXb5b1+
         CBKKbiNpRhHxccKP/klwjo+NqurA4/pXEPmDhkiFSKPCZRGvV60zGRmN7rUQ7Ihy+GCA
         jCvIyXn22km3IF4LafBEWdvzKz9PWli9/LN4Sda6pslnCfFhvu0gcgii00L8cmMax4J1
         MGX4cKPQA/O83NCegG9OMGkIcr5QHJElvcVFPyyEhA76fV0Lv1L8xBU668IFMR9aZluO
         xLX8y7w7FtksqrogbqQuLuDYDT76ggucN9HV/ymawPSXsXXybgSS9uT7xo8Ckz5BNCLc
         eHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312614; x=1782917414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gqBIwPaeWmL5XMuFIlmntneXFCjftj2s6pIOw2Q4So=;
        b=Ice5+BnwIDfhjsnCNrEqq9CCdmBsXh2doZMWyHx+XN0l/R+VucBYYJ5rn0v7fblodp
         agcjv45jWH2Z0RlekB+v+LYvuP+BbCT34bnYNEnmm/yorpNOHBCSVyOWQbVn8ASH5rxZ
         SpMQ3tRfBIOO0JQ9KyUzWKZRDraJ+PGe6by3qacoc1Fv3d0wNqeMYsXStUi94nB7oAgb
         +Uu+nnqnsr2791kyUgpxHoUtIKOAoxGVQvzF2J5218EeHMzejHcArPE8QfGfYar4tfos
         Esy+/q/fAj2qUVzCEcRjgfkvi5Hzxd305FWD+g0ADxGpSYX7dTZNzTNJ8S3TSFPrqJ95
         wqnw==
X-Forwarded-Encrypted: i=1; AFNElJ+IscSSsbJU4K4DjRLzFTkXsvsMEZ2xqNQkrpDxl8Non9moPzs7pbfrQPzuMTCRcbUCHX2grAbEX3vPvlfU/65g@lists.infradead.org
X-Gm-Message-State: AOJu0YwBtzEA7lMOzhSGmzIBB3TtQmAi5070VzR98cPE2QtZBotK/HG6
	4yoHSwYfBgrl8jIGA0OYERO+/RZDpRaCgqXXETZ9HoZCeKOLb2Ub5Xws
X-Gm-Gg: AfdE7clSix29we4/gvrjHXWGZIGuOyxoBoiJaD7THLwy0AS6pNDbu8NTYfwle+pxody
	oYM5+4zoOEoMMlvlhXbS1EaiTVl8vNslbov6ZRdCJzqZdSWzVV91rubt0pWzYAheG9IZfdUrTk6
	5z5C0DHIvHrNdp7AGvOPG2kmhcTElHYyaDugpjA1gYboFrr0dWHHkD6TImVfPve6F6juUN7IvYR
	O/5upgSK2rbutNqy6U5zVNaYPTtjZ5oVJI9XfwPeZUaZ7yNolVJt61WZN6aYgULoPEoxCVzphUN
	BH123hf8vZQXVPIrL+OsfEWvxk4KYxVf946L3x6Z2NVYGIy5IbLK2osvOXCrKefoKZiYprxtf9q
	MvTT/9x+eaw8wdHwSsS8rr+wdwTWjwAhmmkZPG2XcEsrYVnL5lhlFy9zhARGvI8tznZK8eEygCL
	CrewbMpdGXek0RqvKRTd+3DpgCPsE6ijgdYuNAVQYr/WqOlyUM2lTkFgviduEGs5mxv0vKHAs5Z
	iYmV+zY
X-Received: by 2002:a05:6a21:329b:b0:3a3:1814:20a2 with SMTP id adf61e73a8af0-3bc0be10a82mr10975133637.5.1782312614215;
        Wed, 24 Jun 2026 07:50:14 -0700 (PDT)
Received: from debian.lan ([158.247.195.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4002bf0sm2374238b3a.25.2026.06.24.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:50:13 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: david@kernel.org
Cc: xueyuan.chen21@gmail.com,
	dave.hansen@intel.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Wed, 24 Jun 2026 22:49:41 +0800
Message-ID: <20260624144941.703172-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <f679fc68-5ff6-4715-9a07-9eb3074b2d1e@kernel.org>
References: <f679fc68-5ff6-4715-9a07-9eb3074b2d1e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_075015_925305_9D6F8568 
X-CRM114-Status: GOOD (  11.63  )
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


On Fri, Jun 19, 2026 at 01:09:09PM +0200, David Hildenbrand (Arm) wrote:

Hi, David

[...]

>Having a new direct-map specific function with clear semantics might indeed
>avoid even messing with that.
>
>So, yeah, given that we have
>
>	set_direct_map_invalid_noflush
>	set_direct_map_default_noflush
>	set_direct_map_valid_noflush
>
>Let's add a
>
>	set_direct_map_ro()
>
>Or (my preference)
>
>	change_direct_map_ro()
>
>But given the existing naming scheme ... maybe just set_direct_map_ro() and
>we'll clean this up another day.
>
>
>Now, should there also be a "_noflush" in there, or who is supposed to flush the
>TLB (or don't we flush at all, because it's used early during boot so far)?
>
>In any case, for this function we should add excessive documentation and define
>clear semantics.
>

After talking with Lance, we're leaning toward a direct-map helper:

  set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)

Contract should be pretty explicit: direct/linear map only, no alias
handling, no TLB flush. If a caller needs stale entries gone, it has
to flush itself.

Huge zero folio only uses this early during boot so far, so noflush
should be OK. Will document that.

Thanks,
Xueyuan

