Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAF7109446A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=; b=kFeAsDQ4Ou2rjQIooOqJ/L0p9t
	JkeQ5LR/yqkoXLA8mP0lHIz0QUaps8ZSPrzkRUQDma0iTF6skQr5C6Zq0YnR4aKlOirTJA4Nekg+T
	gzm3UVe81nXN1bIVLxe38YUvgKWxQX3+AYqzw4CffQCAZjtP53l56GTc0Q4fMwzOsdIzjA9sIJZ8I
	PpePdIPgP2k9uAXJu4JOT21kRjp398usxwjp702S6t5+TaLnL59fHMwaWz6JSZ4fOJVnhNraFeXjG
	rDSoZmM14sJr54eTndUx0lGBh2UqI4q1aiVPNkY5P3LmucSJemKC6fyntcUg+dg1CrY7N8Gw9gtWb
	TDQNLx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uYZ-0000000EPjU-2ILb;
	Sat, 21 Mar 2026 11:31:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uYX-0000000EPiq-2v12
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 11:31:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1744242b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774092709; x=1774697509; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=;
        b=cRjLXekGhgKf4ylv6J8ThWU91Lig7mE4SarINT8qng1ofZ4pGpUdt147y5tW0u0dfO
         svhCDZzC4XaTkOpn2Ey2fD43nTl/WvPf4hey2hGF/Za0bH1kG3H838y0f92fWUrIdcmr
         mZELT11Xz6WxJC0XIgzs8hendFyq17s7y0/JMq9RyTrvYMFRgBOT1yP+mEKSiwXMnUbC
         PtsbB1ERy1iUkv0N0wVAKj0zRRsKc3PooSE9BM5cHb1CVkMiy/MC00aB1vMYmwNp+4fk
         NuS8a+rlZq1/hzg5odUcZljykELcxmX4Tp3+xTglO2XXTbRUIN31rwLTFzCqrXzvZnch
         xLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774092709; x=1774697509;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYdBjs3g/NRwIzC77+RdwYjMCfy82DXerPQVEC+RqG4=;
        b=SlAKJBsE8SsOqNcO6RMsemMvKCgcrFxWDt4ndFIO/MfRj+Bdh61wlGsdiv73fhqK0y
         8QRTWmpDtByyE7MWp1IuQN1IHc1Z+72m/hkLRGgEyX4hj8IzSDu8rouKS8aNT6+TMP8g
         DH27Q+rx/q1X8FM3Pbgxnk39WCSxrV31O89qwjm7rx4QLGgw435BUGQ3et3jdu8R65Fo
         1qNPM5Pfuo82ZC/ooZkM/dJS4gDWsOLRkKLGPQ2rVnyX50M2kEyeLrhJc3u2uuT2/cQy
         QYEzKOC70EMtUasIVwzyOYSf3/MrbONqxCyfNhv3WcX3MmGsJeXJiz1Oi2gjibAfx2Co
         jzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvVpKznv9IM4L5jbynrl0wK+wlmuF7UojOCAMTcaa5sEvB/R58QrkJVkImztC5KuFpHOrKnp67imYVxYs5fuWb@lists.infradead.org
X-Gm-Message-State: AOJu0YwqVL9c37zW5oTNlmLTfcfeQwpN53egHAjipLpTVskxsLzD+JFd
	qwpFEiDniEumOrrlW2fw9ZT9+rCnDtdhJiZnLTnWVR3FLRSZT1BZTOFJ
X-Gm-Gg: ATEYQzyk98PeLEOQKMU814XXy+qiCLyI85z0oxAoXl2oHrNirl7IlM7+USrlPUc2jdb
	SRlQUjZyHmquUo98UCvEL4lObetys5RZljgacNeg7NL5OhEq/zxYldqL0V1D/z6HDkML24eNkjQ
	z6/iZdbR4MfOxFf8DGOGVcWTomxb5IoP6ksH8Vgro6GTQW2g5OBszx7sw9pelQaGPz/uElVFCAc
	surJxa7HOunEPmEYqUbTytdn7N15buI8J9J5W45AbObukTye3y3a90LYN4y1+eYHEaXUQ+9Wjq8
	pOFID+I8btIDIqSKVs50LUfQ6YTlfqqQrWJohnqvmCGNhgjsxolG+Kv3Dwf2RV7x5F74tPoQodn
	2Cvecu/NoyahmW7n2RykdrGjKX/w9w4qwfXpXRsgJRYalJjIX8aQfv2L9j6A4BXEOuNaoYIsqtX
	NuTJbSiFmzwnTKTsg3/g0guQ==
X-Received: by 2002:aa7:9e8b:0:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-82c21afa908mr2465482b3a.13.1774092708761;
        Sat, 21 Mar 2026 04:31:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm4159044b3a.60.2026.03.21.04.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 04:31:48 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] change young flag check functions to return bool
In-Reply-To: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 11:01:56 +0530
Message-ID: <bjghychf.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_043149_727029_C7549287 
X-CRM114-Status: UNSURE (   9.61  )
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

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> This is a cleanup patchset to change all young flag check functions to
> return bool, as discussed with David in the previous thread[1]. Since
> callers only care about whether the young flag was set, returning bool
> makes the intention clearer. No functional changes intended.
>
> Ran mm selftests on Arm64 and x86 machines, and no issues were found.
>
> Note that I only CC'd the arch mailing lists to avoid disturbing too
> many people.
>
> [1] https://lore.kernel.org/all/d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org/
>
> Baolin Wang (6):
>   mm: change to return bool for ptep_test_and_clear_young()
>   mm: change to return bool for
>     ptep_clear_flush_young()/clear_flush_young_ptes()
>   mm: change to return bool for pmdp_test_and_clear_young()
>   mm: change to return bool for pmdp_clear_flush_young()
>   mm: change to return bool for pudp_test_and_clear_young()
>   mm: change to return bool for the MMU notifier's young flag check
>
>  arch/arm64/include/asm/pgtable.h             | 29 ++++----
>  arch/arm64/mm/contpte.c                      |  8 +--
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  8 +--
>  arch/parisc/kernel/cache.c                   |  8 +--
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 26 +++----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>  arch/powerpc/include/asm/nohash/pgtable.h    |  4 +-
>  arch/powerpc/mm/book3s64/pgtable.c           |  8 +--

I did compile and boot test on powerpc with various configs and overall
it looks good.

-ritesh

