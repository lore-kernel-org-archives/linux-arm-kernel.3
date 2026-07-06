Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/jYNfg3vyt46I8puRvbOfRgp2aWwOG7z/TVgYkci+s=; b=DWGrnEj0brxZGvZn4KzEXGt6De
	OGDZyMzbHB2d3xlUFYFvSoFzEwb8rlrjkTGFrE/mwtdSOqpQHPjcqhwJkvmeyeS3RRaBY1bvdMfD1
	8ojYbHxDBwhbhzDEgXCuulFqLQ6vm/vpFvwEubyZtld5PWZW+c4CqS0eVenVXgsvC/n7UmDzmH28y
	HLTY0mKoBb6vRPJb/+eI/wXmUf47+tuF0i6ANWPRxFhB0dYGPaVYuKmuf7/qQztlnoBgazlctbskd
	EW5IEqAu2KpkRCE9blX0k+fUaLAjM911E8aYgazkj1uj9T/2AHBpGbkaoUJbR7IvifdKwJKfmV4R6
	FIsD/0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdf4-0000000Bii4-2M9d;
	Mon, 06 Jul 2026 07:22:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdf1-0000000Bigm-39Dd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 07:22:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so26932995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 00:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783322553; cv=none;
        d=google.com; s=arc-20260327;
        b=MNJC3wLNDUhaFoIgGC+RTuWCsaYjmLv4TrpdgQTW7h1cMGBxYVOBSgvLtX3DnKbEST
         GneXmvNtA0h5tbgp/38NIPULZzGLnGkLRuHNgD9zWlfjyQr6NvYd5CQH12xhwBZTCVPa
         fmdSrYwFT7RTst5fbKy8kKykadvqtuFYeZ48W2jsKvVgk6NRTGL3YMtJAcrldCIpr9OH
         8+V1mtdxKOWBOdQT1v8LuAPV3UPp2J/j8VGiQeEA1jwh2Qa1N6Rctoypo7lkfGAjYy1x
         8X7JtVqF3RNIZNMEp7A0/M6hG2n2CkdYzvWD/oJfJwBQtz3Yk3RcrOe+CbCHbJL3LRay
         2L0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q/jYNfg3vyt46I8puRvbOfRgp2aWwOG7z/TVgYkci+s=;
        fh=iLYay0HNGCxItOqp94fIyakvLhER7Btv6lyKu2slBAE=;
        b=iZ8owhbtnI7yEzwoDX16R44zeCq14gnUaYvG2du77yhT9nxUDkYM3PM6bXzlKV0+gC
         lR1aMYhtpPJjBTAkeCOUYfMW37qGhBlTIaAj7nE9gpKkPuaE23EPeogkTC8HtBTMZ73u
         E9cNlTPOIg8ZK2hNtpnC0cl12U5H3NvWb87Uv+7FIocE8sTuYBw8IZ4Mut6pCFSbkk21
         RmGNRZizQM6j//OfYAlIL/NqbuOzxg5PiZ9kd5PENy0Gcw9Ks+C5LfrHxEA6p++kwrje
         LAe3oG//KWT+U91p32QLIYZJxLgIr5Wou7TtCJyCD6tGVJg0FtJbqATRoe235POTO4gu
         gZAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783322553; x=1783927353; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/jYNfg3vyt46I8puRvbOfRgp2aWwOG7z/TVgYkci+s=;
        b=SYE72/F3OvvV4UhKm0kTur4o1wJPQq40VZU77dyQqJ+KHABHDfYAqwuKYpuj3x7sEl
         rQGFxKzFO7n/vBBA3wR3fRPKJWwc/dACYE6P8oJiGuloE9Mgv0uTEg4XSIp3L2ee8g7d
         s2C4UzRzJ6zorg285Pm3Vgn0NzPA/DrO3E5c9QwiMy7ggtCv9O8xH8blyspZJfnjIExt
         44AkZyKAFoOa+e42qdQy5ARX5BQTKtGq+mEVl+8f/BX46z4oHyQ2iQzhY7FCUZWEOwjx
         JWKTk1PXkMxxOmUV/rrK3C8QkUnYmg65wBvy1Z6X1FRFDttFEnfFaqFmcLcH6GJ+XQEu
         0MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322553; x=1783927353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/jYNfg3vyt46I8puRvbOfRgp2aWwOG7z/TVgYkci+s=;
        b=m791iq0XNrFAH7A/JTVb9fYKP6DOQQ6+2UVYG0H/K/ZzL3DXaS9wDAtfESQ81LXAOm
         D9lZNoHP/gFYnUnVCLxoY7wJ7gFWDMG7Bp2ltJqyHBHeYmNTjtRjnzUOA8LhdUMDRbuU
         VVaiAx/U0EWfdGrdt/kV76COElwQxGemrvLLTRPegq2dfspLp84cg0Y3y0pTWEMVMiY4
         2PjynMAlaAwoTWMv8xV2AizXETH6TItuSvIr3ItvPEdk6PRf6CAGVHnGFl46Hht8h4As
         OsML/0zRPB+3mMKsDTEefVSkJZVdnKoRccuU0Y4W8SRt3fhGKMVdqzJql1dsQXbu9S8M
         Ru/g==
X-Forwarded-Encrypted: i=1; AHgh+RpkdTzUAsytXFrNkiPViEoQYSd8/rhFoASOCzolQK4IIDkj/eP3oeCoc1LDG9YvRXtWr5O1RUWLxop8sERB/1Xq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1oz2+9dC9HtITR1h3vq1sTBilXyvpEgWj79BnNazD8k5tAeQ0
	cvw4TOjGMIrE5YL3RUtCbf+v5aAtf5HcqHF7wKungmrE0fiGrCD6yC94cafvG+o0qDgbF0MSF4M
	iqyfqAYW33Yxacg+272L4WUTPMLRup44=
X-Gm-Gg: AfdE7clZqTOYEmDOKpEPSIewfkvZZ0gMzp+aeAWL9+L5SBkSzkFUcR6u/o8NMQWIVg9
	F88RSP7rQ+ZURYDl27nqlnPkgOM9xAbuDr9/KDB018RyMMdf+2BtLyMewT6FE6jUat5MhZmBakJ
	jDFVg6UOKb4T1fK9dkiz2jMpDH310arf6YOBAzlH71cautgdJbJmqzZtigsWWRoaEWRtms/Cxtp
	/rvZFB4AnBBaCOJyWh2qcSoiocu/GmbByMHW4max7WbxJE/AJqX9nW/CuUzFFDrM+8npurmNQ==
X-Received: by 2002:a05:600d:8445:10b0:493:c2cc:aecb with SMTP id
 5b1f17b1804b1-493d11fb9f5mr76134965e9.38.1783322553198; Mon, 06 Jul 2026
 00:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-6-jiangwen6@xiaomi.com> <akPKkOt_GNbAbyN5@milan>
 <CAHKocdGiK0ij7FopLi6b_rQ3CDyVr=ARbC4cCwNG=pY=iTME5Q@mail.gmail.com> <20260705133535.3f4e484e298a52122c6d4721@linux-foundation.org>
In-Reply-To: <20260705133535.3f4e484e298a52122c6d4721@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 6 Jul 2026 15:22:21 +0800
X-Gm-Features: AVVi8CfvekeoxozF62FEZtQaptgp89Nv6sXnw13jNmCNRR8vOyi1QTHiK4hlCbs
Message-ID: <CAHKocdF1-aCh7XODFLYHUxqxv=cybik0Mb76JweBdSxQt7bZbg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_002235_807435_B275C1EE 
X-CRM114-Status: UNSURE (   8.11  )
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

On Mon, 6 Jul 2026 at 04:35, Andrew Morton <akpm@linux-foundation.org> wrote:

> Also I added
>         https://lore.kernel.org/20260630184129.4B62B1F00A3A@smtp.kernel.org

Hi Andrew,

For the unused "start" variable, v5 will keep "addr" unchanged and use a
"batch_end" as the batching cursor. Then flush_cache_vmap() can use the
original "addr" directly.

Thanks,
Wen

