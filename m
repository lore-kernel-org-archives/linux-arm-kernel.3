Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F511093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 05:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=; b=uwCKzZEDxfhRhFgY0/8VHafxtF
	3ebNrnOMlcATuWzIKGlGVIwP14xUky5bU2kZp6Lj6JXZ/iLs2QNTPEtdwEwKyZB8w/rCkXd+gipcx
	B9tgJRviP+/5AoSwFmpINSG23X/KAOpXtodZAdcVNcGMyIZXmP09GOCm1HYKGSpL4VvAk5x6Fgwb9
	xTktLW1BnRI91TYSJpVLO259SVhBi2Xt7WDLYIdQ0qWf31Co7ZTvL5dxw6071fjDcozghp9TwgGDQ
	bA5D4oSsHwlYtXmUkkVlYM0/d1znUhsXK50geOSqf+3fOl8gI+uU0/zISpVujIHm3mz7LVaK4plsh
	yNjVqOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oqs-0000000E5fa-44nT;
	Sat, 21 Mar 2026 05:26:23 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oqj-0000000E5et-2zQR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 05:26:19 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so1827826a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 22:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070773; x=1774675573; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=;
        b=Oc4XFMr3+RGPyKJD+xlTwWOTPt4mvL8Rovr/bawnECX8+x7+U1hcJGKtMDeBF1FVte
         GsW+PbGYO4IgZBpuCp8RHO6sKvDuqxqC1qmdbouF2xytfZGh2MyQM+XNhex72GxyRX4Y
         jDHwZZDsfJzxedK10QTaHnkRSXXBRR/b6pVcAaZgq2jEZUn10epdhiramruuoSjkaSPm
         HIxEUYdcBhYZ4QzXh4da50s9tseyV72D/dB704iSKQm18XBEovZoTxHWO2krb7Zp6tYt
         DpPfHXVpMqQ7imZmhFOGLnFYUsnq2No8sZo2TkDWvmhdFEnnxz7pKsq0tqu5KDcqAEMc
         A0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070773; x=1774675573;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=;
        b=BG63peAPqn8O+Chlq5YkpReBbtj/DJzmCr3mkKxD9DfUFeU5aOZsmJemnMaWrkBc2f
         RifsH1UwzEbasr4IotqmgC7c2bShQR1rzwrCOzQIPRaaH1tKLY4IwQxbMpu17sYq4+Vc
         PW4HeI37j/OBzMp1+/iCmHQkNPIAEgQgW9qsJKwxD/KPCqN7xmFq8tP3TdyPbBxttz3/
         8nm9Uw6jr2nqA1eQGwssmdP0aMjv7vTANWXHS6/XGeqpcqic2ecHvj1r1hm1N9+T+YOH
         oGa/UeiDZhezp53FVvSo76pQg6oW9xHHX+rsD5fa6y4rbePfOCdntG4jwfRfyJm7IVse
         tZhg==
X-Forwarded-Encrypted: i=1; AJvYcCV1BgOM7F3pyMoUQqTiWKidSXLCV8a9P3zzDk4K9TFhqpeOzhgWcfwTCng/C95f7BPQpfWhDfq+mGho+DRGrZyH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6IyWHWcjBSUn654egdNB9sXC20s66paJnoNKbrjezd4Y4/88+
	Uv2d1LmDcWWh4XRYU+vmd5yC7Y+by0Nt7lxpBT21Tqd4412NTpKKfV6j
X-Gm-Gg: ATEYQzxUANwpPlkEKy21dB87bgCkg+gu0wbzlcn+5m0EQjjCMksvGL88qSt/YAFHPjH
	t/Kms2hdu4risvgqVWAp3bf8VuYe6Y8OSaeqLWVLK3uRDHZxtSSeJaWvZ4lJ8gtYA4pM3HQUO0p
	/+rtSIUecBd5Hj31UE5OzdwbW1ABFubR+fHf9m2QEm676517YU6fVP/BD1iDrDl0ksTfFcot76n
	ojWt9fPUt+ko03t8Iof8Hai6glBbrWfUUWgKL2OCQ/TNzvSPAERH2ai8zZgZSEYvuWOeFAo8z2B
	qIG8OHtVD+MhRg9kU50JOqcLL5YT49QAY/6kwoOatOAts+Kqq/Dp/Nv+/eL5hGfeOyZ4DIO/CfH
	Aj2byNoTOdx3wvRbMUACQL3XLFie8SKpiJZNxS/XSxzBMjP5yFam+xgmhBzWYkv/meKzRrShGQb
	QikQFqng8qQdwX7HLSMoW8Mw==
X-Received: by 2002:a17:90b:510a:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35bd2bd5ceamr4620697a91.1.1774070772650;
        Fri, 20 Mar 2026 22:26:12 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd41347f0sm3299371a91.17.2026.03.20.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:26:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] mm: change to return bool for pmdp_test_and_clear_young()
In-Reply-To: <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 10:54:05 +0530
Message-ID: <ecldycui.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_222618_275381_BE86CBB5 
X-CRM114-Status: GOOD (  10.26  )
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

> Callers use pmdp_test_and_clear_young() to clear the young flag and check
> whether it was set for this PMD entry. Change the return type to bool to
> make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  6 +++---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  2 +-
>  arch/s390/include/asm/pgtable.h              |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  include/linux/pgtable.h                      | 19 +++++++++----------
>  8 files changed, 27 insertions(+), 28 deletions(-)
>

LGTM. Please feel free to add:
(assuming you will anyway kill the unwanted externs)

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

