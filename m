Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0434F3D5EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 04:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JR9CUyvApmvn0yWA7JOocQfIYBlfpLLyGv3hbHiybeY=; b=kbgdlhRHiGiAo8QMFnsj9aU55Y
	SkDXCXy8Oyw8awt814YsBz2KR/Euak6E+pK+18/GWcxDnQ6CpdOUV3ySD0z0tdsR/vGPcmKloj45M
	oni7/UI8bxxo2A+xIM+oXHF4dbKlPbBwWLRBMvCt6brVq3I5buh8j11C0FpEynShYgq8aHmNM8mpq
	/lHYmyH5QF0VfpoLL/m0lL5I5PIYvT5flMpKxCV77/m+IiRERz20KsQ90zQnBO2PPSrgytIr3q4F9
	g8bcLpOEIXR/ZTLm6mrOIl8ot5RRQ5FtGiAFrSAPbkbeOzNeqISDL1owb7uiGiCHlpggmWpxw20JQ
	WIc6CFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6hu3-00000009ZVd-2dhv;
	Sun, 29 Mar 2026 04:37:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6hu2-00000009ZVI-0XYW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 04:37:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35c238f1063so1613877a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 21:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1774759052; x=1775363852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR9CUyvApmvn0yWA7JOocQfIYBlfpLLyGv3hbHiybeY=;
        b=e51A3hHS2NRZ4pYbMm/gsQQ4rgocvGA1V3bYRESwaW4ERPGxKJoUIAkQH9U4U/JEgT
         r9CcYmJFAjNgJwuo6P949ImITZ+qbSRn14bC9EcbpfaBdZL4/jo1447gxYxBMlf2JGiG
         bcKv06usBidGqB4WE5gz5+3FbedpykaWPJu/Slh01H37R98kMq3rVD04G6fiD/I9Vc1y
         lEuuWPmUYnQNjbSmJdN7y1PlYNiHnx3qalbAoWxr4KZ92btMNsBqY554b3Ywnnmqdtrq
         r4DT8djNpCS/kBFK4AraNjMKqBzoo9JzDoZFZSF4K38Q49c3TkQrc8nk2dB6pSayHxvS
         atNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759052; x=1775363852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JR9CUyvApmvn0yWA7JOocQfIYBlfpLLyGv3hbHiybeY=;
        b=ObRVN3fXqVtJD9qQm43JmW/N+Xjo+krd5uLovBZuAIAGG4Av5zdwRjx0Snuv7Pr1P/
         mA4LBIc4mLyeYcZmVi6Hww11jIGhRiHhAD0Qyb17qTTQ0QayElYnZpjJL+iw8v7mnFjM
         fTiqxniKvi92NallfZdwmUDU06LcLY30u3soWAPwIYaV2l8xdDgHqYJvfa4LgjgGK1nC
         GOU7S4w3GKRrIP6Q89TL8ukqwz2RWQ0z3tteiU4EEEgE7gvpMAMNX8Ihrc9GpyW7PqXc
         aNuCw7YZcuQEK5M2YMLIB9GHaTm82hKlJhsghp0sF/Xv0nuyDoh5j0K4ufjpexiKgL0Y
         cqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJtjW9yzKzz9CP6vEiK2kt6RNSqPQQLt1gXODM9+niO4Aw69CAY+Puk5z62AeurlbOHlmFhA9uFUipC7U7w5b3@lists.infradead.org
X-Gm-Message-State: AOJu0YyEhlLCEZmYkZ0qmqMTbbVCDcdAltXfxqoAmdIAMJ9EB7O8OYao
	5r2V0pYTj3NdIaclxz4JBHkKgxu6Af1vVJg4e/sm115Twn3Z8uzJ+jkOD3TBtOvRMQc=
X-Gm-Gg: ATEYQzyHEqexPT9TA8rhbeuTlW8t2y3o72uqo2P+ccWBYUKkpHNvl0CZZurA6gnkt4A
	2/4l877gtPJh20mGwLPuYUjH4RhpssXd+ge3CKCIYfKWfnOm0DKNUsCGrePYzypZKLEYdHu3daj
	xCNSsRJLaf32GR3MLVLwbWVi1pkH7hdAIlkcvsX3r+6WfCWuy5KmNOTPB9GjVmZXCudX2fSfIBV
	bSoUXey2UE0SyxTK8g6Rh1mXBuNj01ijacm8iNKB0ttIjdhYyxvH17N9MZlaTs8SY+AEXb8Y3ZO
	KML+wGJKrknW0NSHnAOkPwDjxEhLQYjgI+OUfptIwYnGA7SWQM/ErYd6rYoWOhQu/LkP7FZXPSb
	8oN7EHDzFe6Nv9NdsRnhO4QBQQajxVkp1QthIA7z3q2d22L1MqDBboVQH41lrXxuox8JLfXmzxQ
	wI
X-Received: by 2002:a17:90b:28c7:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-35c3007ed0amr7400264a91.23.1774759052247;
        Sat, 28 Mar 2026 21:37:32 -0700 (PDT)
Received: from gpc ([2400:8902:e002:ded5:78c1:8178:95c1:6ca3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d94d057bbsm3385004a91.1.2026.03.28.21.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:37:31 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: usama.arif@linux.dev
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	npache@redhat.com,
	pasha.tatashin@soleen.com,
	r@hev.cc,
	rmclure@linux.ibm.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	surenb@google.com,
	vbabka@kernel.org,
	viro@zeniv.linux.org.uk,
	willy@infradead.org
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE coalescing
Date: Sun, 29 Mar 2026 12:37:00 +0800
Message-ID: <20260329043700.19355-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0725ce97-b8a3-47c9-952f-7b512873cc35@linux.dev>
References: <0725ce97-b8a3-47c9-952f-7b512873cc35@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_213734_174257_F5D69428 
X-CRM114-Status: GOOD (  11.60  )
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

> mapping_max_folio_size() reflects what the page cache will actually
> allocate for a given filesystem, since readahead caps folio allocation
> at mapping_max_folio_order() (in page_cache_ra_order()). If btrfs
> reports PAGE_SIZE, readahead won't allocate large folios for it, so
> there are no large folios to coalesce PTEs for, aligning the binary
> beyond that would only reduce ASLR entropy for no benefit.
> 
> I don't think we should over-align binaries on filesystems that can't
> take advantage of it.

Ah, it looks like this might be overlooking another path that can create
huge page mappings for read-only code segments: even when the filesystem
(e.g. btrfs without experimental) didn't support large folios,
READ_ONLY_THP_FOR_FS still allowed read-only file-backed code segments
to be collapsed into huge page mappings via khugepaged.

As Wilcox pointed out, it may take quite some time for many filesystems
to gain full large folio support? So what I'm trying to clarify is that
using mapping_max_folio_size() on this path is not favorable for
khugepaged-based optimizations.

Thanks,
Rui

