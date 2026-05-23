Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE9CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIHtSod+ud/i1BaxCd3bU1q+Iaraa0atqJHPQ1kK6FA=; b=PTdDSxj2PUc2AicocEycC9berS
	klo9yHrPdryKiQ8HpWg6jjqj2z3tck0reyvtNM/aEPQS7fwUbk90KrrlZxvay+dIyXCXHl2C+F594
	+z5ajFyE/BWYuuP4wqx4H9a0u5nEzmZlHUYsDlc6mJVTG1FbI+BFaWOgMS+svmT1DyVaFPd9C9WAH
	1IVIvg6E36xeqNDnN2O//Mi/VBHYct3sHWrpDUxifXjPQ0IK0s3zOqQGSAUgERBnJu2N9CKE99XEd
	M8VFruu54NwHSHim8QnNXY/HSgsW5hTSRTX8h2vvz4ne7n5IPeZObGnKBtz4UiuH7fHCjUnvDwz4J
	5i80pD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhh7-0000000CwFq-24il;
	Sat, 23 May 2026 08:26:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhh4-0000000CwFF-1MD5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 08:26:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so51216945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 01:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779524808; cv=none;
        d=google.com; s=arc-20240605;
        b=jMC1j56ezmbYYFF/NHHGZsAKUwFUQsThuMUH/NzSJsGeIU31ObsNCx3Fq1NuZJttnW
         1EPDTlFdv7E7Em1nz6StIW4zBGyWgep3Xp/71DVfI4xy09ygnCXyzaYdo0Gacju/Efwn
         kJbCHWqxK6IeViyVBE50Ow4lGTuhh6jB9Kytk+lnvAHklPbySMcqqJApl9zN34gDqPrR
         gVHtb5KE6o+AJc+GcEJWxz59kRtdhiv1AJZJiOq8oq1SK/VAbZ9XZpGvDdszkltqGyof
         SkfHQYFuVKU84y/pcXu/lRRm/A/yAVuZaE3TeX4E4ibb5Q3AmPE0JEXvG3Lv/v9cEI7h
         8BZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SIHtSod+ud/i1BaxCd3bU1q+Iaraa0atqJHPQ1kK6FA=;
        fh=mcN+mWdAwtI80xcQpXnfDOgYI8iQSPHtRbR2awW6yWo=;
        b=AsK3yNx31L/ds5xxfsbRrTJBoYwO9JXUsIHRCjlU9XG5m96LG+ns5ekeN2kRi+jAFT
         4AGA+nBF2UBg0AO9OY+NSSf90Z+gcSDY7fb/qm8br0rzmmKDwazMkDWjrAEOB5GSlnJK
         3/yF6AzegVhCY62b4/VwZV1Zomjc+pgjUarNGa7ujBPGD27MUDvjyhcKb51xXlVE0GWQ
         X2b7NF0HDcs4rdi/wsRdOOyLsaoDhJlnOsKhDobDuvKhqy+v8vQgPtMry1y/22KY0UTB
         ga9Te28gMgodiMnOuNfYeDlkuBUndT8UGsoRmxnjFqpKNVKWoU32ERwB3EoPPnYV40hU
         h01A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779524808; x=1780129608; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SIHtSod+ud/i1BaxCd3bU1q+Iaraa0atqJHPQ1kK6FA=;
        b=EL5jC1oSfJPl10GD7XnVql0E8dE1pARYufVFN4kIz3Jcxdczi2lKhIiCy/oT0DtAPx
         r1I5332fp5gtEjVfcZyV7xJiT0+m75flG9hF8nvC0KBUG9jPLY3jiDWHH451S1y4U8A6
         uO1xi5ilDIU9KUrINN3r0x52HAYafXM1Dqyqz5dRmhYBuUOE4Bpv3KP9Zi5VmYZR4OzF
         XNR2ay74+41dFAFfidy1R5bScfCiShOsEIMfCOmrOrqsyXvdS2TYQO6djP4kt5j7tb4R
         Q69DdK+qRTs9f5jhNOn5XURaZRUr/h2xUIdEptUW0zvtaQABkPHp3SRFILHbI4VQF8/y
         PfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779524808; x=1780129608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIHtSod+ud/i1BaxCd3bU1q+Iaraa0atqJHPQ1kK6FA=;
        b=gfutE6QGy4IATQXXh1sO0b7pB08B9Zw8iou2TfGoZ8BBBYFOlIvp3MMVJxw3bMkP1E
         GRTKFFDZGE8RRU/ub9GjKm3njxv+OupxackHwdKw/QB/hnfyZx3QBX+MgT+dV1kaRRYq
         Tr6AevzqmaYt017xHhBs8RDF725NTP7hTY6w9bPGwQoTtzqPatcBtzapADo4q17ZTiqe
         d8Z6D/Rv1mD/t/uJ7Apviszz+dCfn8pW0qEulWRw+uU9txc5Eb8orFOcknOmMvmLmfhw
         pqSi895j1oiuCLG/ki4PmygSGoxLFpxWl9u/8Cx4RB5WKaiU9MF/JBeKmerLg28q1w6W
         WmdA==
X-Forwarded-Encrypted: i=1; AFNElJ/ptZ9IAnXA0Jg2tN1e8Ahwm3CYrMmeV+XwidKiEheXmb3WcKO97K3uGJzjz8MceNiydTjbuLNvJMbGiLGxd9YQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwhuS9Oy+RzN+d1TdZ7q+yknfVI+0sVyDp9a0QKODoLzfgey3xB
	TO9rDEW8nMtgtaGMJKrgCDhc/diZ/CPpk4zCVBze2n+9HvuCNvuIjHUcpORTkkh57dvxsSf8key
	fz/9GHgYQNK1umgyRpsFzP0xBU6qk8Zg=
X-Gm-Gg: Acq92OHSk1c/BurRaDNsRIDm6qxY2KmL0YLISVXgCEsKF+owNq7Kwdf4SQOYqiFxR68
	G1P5WFdkVlSqlBFdAZpoAiJz/k8ZU/pZo83awjgZsJU37yeYG8OjCjn2GFtdDWDlVC22Wcu9kC9
	yk/yuEKixChSO9830qLJpkXnt914V5juCLawhNagqzrCdadJu3QVJZ12sg/y9KiaEeVGk67279C
	OIQb/zlK1Et6hqefsrGB+4WYOxMw0LQ6lVzRX7rVrk506HJnYXsL6b0kEHXhFntNblCfM12xodm
	MypzTIE6
X-Received: by 2002:a05:600c:5488:b0:490:47e0:e13f with SMTP id
 5b1f17b1804b1-49047e0e21bmr83896865e9.3.1779524807627; Sat, 23 May 2026
 01:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com> <20260522110727.fc7dccf90bc8513abd1fdbf1@linux-foundation.org>
In-Reply-To: <20260522110727.fc7dccf90bc8513abd1fdbf1@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Sat, 23 May 2026 16:26:36 +0800
X-Gm-Features: AVHnY4IuNlS6vXd5l_7DzxfQJADSEXY9onGk8AY8EdDPIdYUeZEc3Hk2NgVH_yg
Message-ID: <CAHKocdErBXQLs0izMaEJg8fLgjPahY0fGR3jfCQ2onS49TWiog@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com, baohua@kernel.org, 
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, rppt@kernel.org, david@kernel.org, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com, 
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_012650_409533_58533429 
X-CRM114-Status: GOOD (  10.41  )
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

On Sat, 23 May 2026 at 02:07, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri, 22 May 2026 13:31:40 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous.
>
> Thanks.  AI review asked a few things and might have found an existing
> 32-bit bug in vmap():
>
>         https://sashiko.dev/#/patchset/20260522053146.83209-1-jiangwenxiaomi@gmail.com

Hi Andrew,

I've gone through the Sashiko findings:

- Patch 5 (arch_vmap_pte_supported_shift on x86): Over-interpretation.
  This targets ARM64 CONT_PTE. x86 falls through with PAGE_SHIFT
  same as before.

- Patch 5 (1 << order overflow at order=31): Over-interpretation.
  Reaching order=31 requires 8TB contiguous in a single vmap()
  not a realistic usage pattern.

- Patch 6 (GFP_KERNEL triggering purge): The purge only triggers
  when vmalloc space is already under pressure, and benefits the
  subsequent PAGE_SIZE fallback as well, not wasted work.

- Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing.
  Will send a separate fix.

- Patch 6 (unconditional alignment without checking contiguity):
  The main vmap() users typically pass contiguous pages
  (e.g. system_heap order 8 -> 4 -> 0).

Thanks,
Wen

