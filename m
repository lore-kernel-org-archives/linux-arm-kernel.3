Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3722C44508
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfyxUe0AubAJFPIEICfIoiV88xma8/wDPcu4g6C27ww=; b=kLAr9XoVuT2zVhsFMpzL4/oYY+
	TmIONsEnx9fJa+PZcoNg1xkTmCibXAJyGWcbTGZB6vbZSTt85XuFiI1XiqeeE+faAAb7xcMG6SPbb
	2wdq9Ac1Fvtdo/W1IfbptIl0wMHRsaol696PlmIEBy+OVWLqTPOzsOhEVhR5NooLsGxuNwRo6pwxD
	BOKqnaJ+08PiW7LfYIlx9AAeDLpIi+g7jqSRnJBZw6emMkxyIgWBQOponPGgT1Zk3KKbW+xi+3NzR
	JfbiQ+wap48ilornICnWtKz8GWIivXYqFT4dC44zw+ugAl/+N+JiURa3pHMuQ1hM8RIDbz637jLzq
	9TpU9v7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi700-00000004VBF-1be3;
	Fri, 10 Jul 2026 08:54:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6zx-00000004V8r-33Se
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:54:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c7902f47so5571185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783673655; cv=none;
        d=google.com; s=arc-20260327;
        b=OAnsMuOUadrEMV+YhdowLduzWXbOx/gwJypo7xK+RAdDeVo9tm5KPbNOWMyCrjGgck
         lj6gCQgaXI+BK1m2d4CzJu7qV7+VWLMcKDTG5+WE8+9CYhRWqVkvUiUyVT8otAnVOdP4
         shxMubPIWLlaUy6QJv+3T+bu5m0EEbA9/sG/8oc4oaQWO46sXM6OZDn+CZImVLf6xlNW
         sQmq/AKRSapdd78J0dyqH+gxeKJaXGkofVBjjOvMRG+ruVtBzyB8TsiYwjbRJ6p2C7Rw
         MGsS5NfrvrR1HJr3akYOJCn4yPLsBw7HJWKovDrB0byaeLYDjFkOvBg+ma9maGuz3L4X
         D2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jfyxUe0AubAJFPIEICfIoiV88xma8/wDPcu4g6C27ww=;
        fh=dMgJSC6ve0Q5eVKpyrQqFu89jCQy+C5i/hY3n0FMlAg=;
        b=ol6NVsfwCF1ar3tHrMJiHD2/RmVx4ENmtieP0SNrNeWWjREEPMS+hIUbFJS3BGuEhO
         nwhXholckXdLtoqj+eRs+MMUZFllYJTEF0pV3jR40oZPPSusa+QiQ+Mr+lUqbo3ptMIY
         GvGjfWLT9Gc+x95PkYZUrV3MYZcCcBYILp9zXE3W21Egw4MiuREmxu61Vtg8zSk0JlrZ
         diTVTcOzVk4AgYrQpCGEItxPm6vtsh324fMjlqgZuuHgVjIrJxkgqlNua3Va+t3u5u8D
         jKnL4OjpSvVWBxA4FfTjzXaO7flGiLPRWx9aiRl3c85f0WfYmt89Pxg/HxPXG0ybrAxS
         K8sw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783673655; x=1784278455; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfyxUe0AubAJFPIEICfIoiV88xma8/wDPcu4g6C27ww=;
        b=p+upW901/Ic5unVBflob+J2GMbYnfxkhO3vkiyS81S6c5/q2E5RG5F40BqSRgFmFiS
         0zrn5Kqljo1lzJ75lFmAvduAu/yqZwBD+HgWJLCunbbPdTBDjq/gIeCayxNF+PfOi/Ow
         271Zy6YMdHcGgdFJNgFGCisReInK5B2j1fCpZ7KtjbkmzDReTcwkhhf4xXNPovL6An8w
         Zazsw/5K72GZvKw9FA3cWGuRA+Dh1Punch6WDudYhaCA7jiRS+L8CqAbKsQmVEQqnCvj
         wP1SKN56uNlH8NzHNw8WJQietn1+6qym8apL2AaR8sns7HRsSTEBZYBGR8wGnsEYlB8y
         h/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673655; x=1784278455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jfyxUe0AubAJFPIEICfIoiV88xma8/wDPcu4g6C27ww=;
        b=LmS3ejlN+jnFe4dgoLmya/9VPNnG0F/jyR13Gv1rsPTK2D2QIVs817lTupPJ9Ln5vm
         xhV1Hx2UiZfjsiGJnTF+7hIT6Gggne02oK0FnR31pEumXGCzQlqwkEKGqfuIYeMLVTtJ
         SKT7sEJmXrYahVVWyqWo54pIIhXQyN/bGrZEwwEh+pOHmBEl+wrDw6evAENL8MmTjNJT
         NrotEZOuCZOgxUencaPIxBZqxADGwrNNkQ43QQDXzCBY88N/dIJDAOXVTFpdYtw215D9
         tzoSjysqvmOToA/SHREcT60pdGBm17AFBHYauU8aJrDDr8W4z2yhj32tWy+ymQnds9Op
         mVig==
X-Forwarded-Encrypted: i=1; AHgh+RpO7rTD5cMlzPTg+Ary2a0gBZVj3C061jJyOe5PVLtno3o4ok0Ik/v7v3kwr+BT+Ap2T4WCHUtLVo8/gLNm5h17@lists.infradead.org
X-Gm-Message-State: AOJu0YzHq4Y9FV/Zym0hC9LF/J5UD53B5dympU6A+iId36YPuSyajTal
	SIs+AH9IWeuVW1lhEJbnV+qfPEhNxP2lXJS9j6BfMa7k7tf6c3WN5ZsQgn7Q+k3T5TlGSxblDKs
	lBkd5mYVAWxyADXiURzGyFLMsOL8myMQ=
X-Gm-Gg: AfdE7cmvO32MIYSJCLYWD0hcJeRTubndiGfugLrb3oGcRU4ql1Ds1f1vypyvZ7uIR4u
	oKphWexOVl6ZTde1bA5rvGcP1f0vGwoxPhHJpXjpkGTbNmwLAhgt0qQ2y5i0WzvqTuS7eNBjeig
	xCOziiuwM7BmpdpEuY8fVe+MtjM6zq0T8sdzaQZXneoMoeeoR/PknrSPkib9H/f45PaiL9wZ89e
	EZhfc25OZa38Pu3nBdYGGDxuoP4Tyav4oeE297LfrVn4Cwv54/mkf1UBGA3iiSp4wrM+6IMtQ3v
	m2aIdCI4
X-Received: by 2002:a05:600c:5299:b0:493:eccb:8cb2 with SMTP id
 5b1f17b1804b1-493eccb8e6cmr62025005e9.30.1783673655004; Fri, 10 Jul 2026
 01:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
In-Reply-To: <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 10 Jul 2026 16:54:03 +0800
X-Gm-Features: AUfX_mxhkgYSqJ8_goQZn75OlAX0v0UTx2TdJpHp7v9hd8vfeV3Nuoxebe3-rm4
Message-ID: <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, david@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, 
	Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015417_779879_7FFA87B0 
X-CRM114-Status: GOOD (  11.72  )
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

On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous.
>
> Thanks, I added this to mm.git's mm-new branch for wider testing.
>
> AI review asked some questions, and some of them are new since the v5
> series:
>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com

Hi Andrew,

I've gone through the Sashiko findings:

- Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
  is added. The extra sizes are only used by init_mm kernel mappings via.

- Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
    array of valid struct page pointers.

- Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing. This was
    already discussed in the V3 thread, and a separate fix was proposed
    there.

Thanks,
Wen

