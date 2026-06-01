Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34417CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQdZFdRPMl5NqctlRONekKw7Ci+pCu3VSk8zafduNPg=; b=cH0FvBVs4OekOUc3WU+DfMfj1Q
	5bepS94Gz0larIi5a7HjljSPioqpNYAkzTgEzRrwZZUPJQLDN+4nPgl9rPdCnsSmu9RFr+FctrhQm
	QWj73Vad66airW+B4JVBCVc7deVVkdpw8ryCUq0EXGQfbAb1OuYOnwGRGaTqZz4RGVyru34kpr0J7
	Yc+FaJV2itvGACtllp7n2NmDSkAxcO0dUVFtp0pegOV3hisntOyrY7oL6FTtEcKgQFBxoMiUw6SXm
	5opuHgQ16FFuaFxO7DASJ/pywX6KMLoKHdK62GKxUCCc2zwWsvZBn0JZvfcuSv0f2ZRyDUH4KgpuB
	FJpG9r+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTqKZ-00000009zI9-3m8l;
	Mon, 01 Jun 2026 00:16:35 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTqKX-00000009zHo-2H3v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 00:16:34 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-43bf6230cffso4434410fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 17:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780272992; x=1780877792; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQdZFdRPMl5NqctlRONekKw7Ci+pCu3VSk8zafduNPg=;
        b=bjTZMoKjoYWk+gpox3vwJLPTn0JKhmKmJ7z58pCdruu98vQpEjDvId6DzpJwulQmXu
         5XW7ci3JA4wRL6niCmKq09MliPmGuYqv8j4ddFiY1UDBn/fKfbPjdl/31eaMpF8R3JZd
         +uw+FiCIJtEq4k40kfkJiSvteKrButH2vdxgoqdRxvavw3rhIO+JpsM5drfUHRQFDOKn
         V+UgexUTo6pPY/bnlVFJl9NfecRJ6ZNEWMRUC5C1kp4ftvAs25HkxkW+/f6xmhNXVO8z
         bnvgP1zZyRWKtsSf6TPXbg0xdICjFDtB5kYsqn/FbyLMQ3zJV+97MVIjq0u7XijHiebO
         neDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780272992; x=1780877792;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQdZFdRPMl5NqctlRONekKw7Ci+pCu3VSk8zafduNPg=;
        b=BJmIJ7NZNT2X9lIra/AoJGv4jiHYhQrCMy9YXCdd2KZzmfm3bSaf0FV6I2T2fVKBjp
         U6oJKfypmZHG92LUb19fjOS7rBlbJa+/GRlJYS+ZXgOQUOspfRuQDw8I+FieNKSFGx37
         N38JHvry31wp691EEbF8aVo1oOYjUlEqSDFKAjHC2ExOhC9t3DADiL2iku6wDP23mDc6
         Tmvz9Yzvbuf/C/RnEE848pdk9TE4ua4cuFvvpM6joPFQZETCiwpog/Dw0bDgMk5coVTq
         P8AHywoKA8W9SO7zwLijrsaSdtOK/vNfpo2fx359H47bUczLR0voNxpfKQQCjf7yCWj5
         tGhA==
X-Forwarded-Encrypted: i=1; AFNElJ9UzokkndgEUxEVFcJy1GJKwQ8x+rWFTczJSB+JFuCGT7eO8vECycKbORminMSobCFcg+ISw4NXlIXGPIdaC0rs@lists.infradead.org
X-Gm-Message-State: AOJu0YzC1jNSc3vB5B6rYybwMir79ZbVIMvzbc6Xq5La1nzhllaaWmQW
	jP2Z6PHwXeJliexnd+TZcCYnRUxP84dZQM2IuzIY199YCfmSHAfP74Lc
X-Gm-Gg: Acq92OEsKF4Cfw9qMM2lHUQTRFkPEZzN0Mty+Rp8ktmIFG86Ld9eYumFonTuk2R7AIC
	i7mrnzrDWwvcCRuYxi5Goq3TTG7NOza7G7vAV4O8ouKSML1nFyyyv1HnP5jSdquBQRP2PVVcyOp
	TB4qD6b5HttUrQ4HF7x+7L9+SXEksJJTCQYgpr1TBCnfX9FcZ5bbpDac192S/MyvVTYk3agTwsN
	qaXPtCM5QxnZRyCO2qw61pDZDYkjfeyfm6vEYeIVIGMZYvj+RbqsBv7UEVvrTds9iX7+7I8Uzx9
	E8B+PZb5W48OEsOGtlWzhJxod2XB9Lduyi0UXhhn83QK0xOkCS2GBYguMiEjqEs7H3ksGNVNnfF
	P5WLepCVfmrX6GSlu4Zgfx8L7NIZXxxLfK+Z+2xySr1OpXfY1hq4gAIv+hCbzgvkrHogw+F/ct7
	wmsWYxf3QO9a0c4dl04poyapdMhYwf52eklFyF7tolAfsE6PdsLjLMfuU0/vkZgJk9siErRRNB5
	8IGyETZAEOFdqcgszY33cfd
X-Received: by 2002:a05:6808:80c8:b0:47a:499:b616 with SMTP id 5614622812f47-485fb2aa4c8mr3766450b6e.16.1780272991503;
        Sun, 31 May 2026 17:16:31 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48605f6a576sm3396395b6e.4.2026.05.31.17.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 17:16:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 May 2026 17:16:27 -0700
Message-Id: <DIXA3RWL6XLD.1WZMXZRHBH1SD@gmail.com>
Cc: "David Vernet" <void@manifault.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Changwoo Min" <changwoo@igalia.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Peter Zijlstra" <peterz@infradead.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tejun Heo" <tj@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "David Hildenbrand" <david@kernel.org>
X-Mailer: aerc
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-3-tj@kernel.org>
 <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org>
 <DIUMP21RASZI.2VNQV45RIL209@gmail.com>
 <3901fe0537edee9d7acdfd91695ead28@kernel.org>
 <CAADnVQJ+CqAszS2sSVu7gSfA_g4oaTR+SWmLNMX3_8c=OdR7NQ@mail.gmail.com>
 <ahnedQ33ZH8ogjbC@slm.duckdns.org>
 <8cc56c7a4aa29628b7d17d85be7eadb9@kernel.org>
In-Reply-To: <8cc56c7a4aa29628b7d17d85be7eadb9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_171633_610594_54D98F4F 
X-CRM114-Status: GOOD (  12.12  )
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

On Sun May 31, 2026 at 10:47 AM PDT, Tejun Heo wrote:
> Hello,
>
> I posted the check removal [1], and Sashiko's review flagged a
> break-before-make problem with it [2] that I think is real.

ohh. interesting.

> So instead of just dropping the check, the install should route through a=
n
> invalid entry rather than overwrite in place:
>
> 	while (!ptep_try_set(pte, mk_pte(page, PAGE_KERNEL))) {
> 		old =3D ptep_get(pte);
> 		if (pte_none(old))
> 			continue;
> 		if (WARN_ON_ONCE(pte_page(old) !=3D arena->scratch_page))
> 			return -EBUSY;
> 		ptep_get_and_clear(&init_mm, addr, pte);
> 		broke_scratch =3D true;
> 	}
>
> ptep_try_set() only fills a none slot, so the slot goes scratch->none->pa=
ge
> and never valid->valid, and the loop copes with a concurrent fault
> re-scratching it. This also closes the set_pte_at()-vs-ptep_try_set() rac=
e
> I raised earlier, since both sides are now cmpxchg. A broken scratch entr=
y
> was live, so the caller flush_tlb_kernel_range()s those pages when
> broke_scratch is set, like arena_free_pages() already does after clearing=
.

Makes sense to me.

