Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D98C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=; b=ToqV5mOdFEtuJfkkXcqHjAS/IU
	Nl6JTow+fVWYZ2e2U5MYcO+NkF49BLGGThxDT/Sia5LdKNz5riPUDF1Ml4HFaGj64EJNe8buo49BZ
	Bn0J6dkOH84jS7mGo1rHLMlUm/Igpx0beIKZjgzYgTp+teOrnpnQ/Da/5euGttvuvQdWPAdHWuu6H
	o3ekHvm/pAUnm/9WB4foUBa4EOXAMezVVSHXm57yxxpzlNyIFBkGywB2P8HPrPuhOdhdexrUbzmju
	r4YgJNO1U86GMsyEZValrMR9WNC/GNqWALRBH5UlJJcdzCXAT0xWbZdIxRsvUdU0+jwjlJipxeNsa
	yw5D0mqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8bl-000000022sY-2l56;
	Wed, 26 Aug 2026 08:03:41 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8bj-000000022rh-11ua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:03:40 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-836c4474028so6600387b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731418; cv=none;
        d=google.com; s=arc-20260327;
        b=RJi6ZBKyyJQ0WKSvm21CYLJA9HG0X7SkhwDwBBqviEK+3a6Z+BTcjWBvV+XKk/8Eel
         RpwDUIZyKA+GofpQiOXLt481iJNxcAs/k8mKbkqjdqo6hUg88PwVi0oz2yFM18T3/EXG
         1u5KgEUW9lH1gdM2amPQiXuxoSH9ycKS79k5ckdXVbVAEvg0NFoWMW7u3EfTZhwEtrh6
         v6wLtpYG7ms+nAoQ8cqQFofKO28NY1+2obTBVhVdbD4t9FlWn0wwFmZYMRdK35HxteYd
         FV8DSzUK+oMw/Ydf6rANn3QR898XcS9g+W42sqA0czOAU1hweEEf0f2pYtoimosRxQim
         3N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        fh=0qQhmEu4a5PKYeT3WmaofKOsAdYl5fgnAcBN6sa/yIU=;
        b=oYVGvdlwk6Mb2hqtJ0sRvxJcecbl0EB4zKJTriapfEyX/GnkxM+JH++tR9SekhVMLH
         IujoKsIKR7F3tnBqXAbAw8A7N8N6B9eK3CT3+B8WacxdQFOVOcr36Ht4SAgsyjpZHTgj
         Sa29Ienglh0hOTp0Og/xipEUFRgiAQA5yzOIHpWXyIc0RMTKMh8NUdIVsCWb8AVWcbUK
         nUjHoPeTZdATfKpJ8zYh9W5w0rOGo4fWn60ROfgj5munhTx18fmomgi06k1sILPDYJUJ
         2kprYLqgRdCaIsaIUyg0/u49XjiRHvFbnqtj0sOR2C8gC5VBD/PjSC55adMmbTrNajZm
         JhDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731418; x=1788336218; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        b=S1p2YlQtnm/g6/VhBby3ZW5tIBr7F9YhCWHyqc1loobffjS0u36Cr2jth+VF098+7B
         JaEAue72X+IgkhRKei/MdwG+IBJcMkikBiJUekhEdSmdtS0qJ0utJI3Rqnu2TVULtduT
         Z2yOuupbIl2STtk0McjtAY0KcPgsGnlVn3X6HIB6l7KRn7Mu6Dtqfx62ZSrVhsErWh0o
         18jovFzKz6akUwg6dgDMHPk+ERyaUNX/LwtVtYfoGTjW91b6WDx5alaoLM83A06Nn0pB
         pbnRBvk/dK7PjXNwF59akti39d7Sp2m0BpVzsSsciikAOYrYuJoE7Pf85URyc4vmN5Sz
         9XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731418; x=1788336218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        b=UcW4IAzVjL0SMQSoHuKHa9bQaMWukVhwEVDmSoweuXc3rj98dliubv1sKfYGx+/U3x
         S1DKflyHSpHlMYNrdcx71T36yzbwXGqO0VEmhnDlQ6h1aBGrOxNMisr+SrOQ4hSGueKH
         rbTrjZtjOgQYrf9h+RGbspSi5BprE03IjJeEG7aTKB5pyiMb89iDgJQeWaPQwcxqnvjJ
         7qD1hErJu/mldVrqvV++Ri8dj6j/s6HcHgiXb7PFEC4wol+gzKnqVbfdxFOR01nZdwIg
         xQ9DW/NaWklT6Qzbp2MY+3JihRqO/M27XeHuEPqsnNcKJeIQ5UefFUe3s1wbW+uUVCMB
         lvsg==
X-Forwarded-Encrypted: i=1; AHgh+RpUIpFeXfGxg+JG6YGXrRHijHCUO4Mv44UIGAXnYOo+B0+tZ+Oa+ciag8mqxkrz8/hr8Jx0eibv+ZKneNLIZcri@lists.infradead.org
X-Gm-Message-State: AFuF++m8l4hcSGCBWVL4WqHxRgz15lnhU3OuLWdeMxynX8Q9OIuaS2SP
	1xzBssPgZU2x+/2Cl0d6j1yvcSK2zk1F7yx2OhMl5HVNr/FsptseOyqBpRQYCW4nzwcyVwQrJD+
	zC3ssOQTHW/4ZanQ4kuJ0YO6lkgyqWvI=
X-Gm-Gg: AR+sD13xEm1UjEMcqnwIVWFNJf+BBKCRJgjyttanWG4w0eXJJeAhlM3BaOwO+nInu90
	xn2fvXizaDLWSMVMCc+mw6PGCdCJzG7GRh59l2dNbB+C2A9AUw/kZmL9RIeXu3B+Z87RyTU6H1v
	f0McchEUZyUb19Kgxyl2L7c3aR7rBuDTy6iY6V5UOXwOCEUZARUWJ2oWLFGlS4fEV/o5FOoN5JP
	Xmfd+8xCiK7S0H1aVGVTJEM/Ho6Wdv36rlYg4tH0XEva2TquIxyhIj9eQduKB9dgs61Tm6EyHj5
	VyX4P+EEU56lMnsWKy3Op/wPx9Rl2tWXtpDCyO7BYi0kzuw=
X-Received: by 2002:a05:690e:1516:b0:66c:e3b9:f696 with SMTP id
 956f58d0204a3-66d257ea066mr1655899d50.48.1787731418010; Wed, 26 Aug 2026
 01:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260808112551.2786782-1-lgs201920130244@gmail.com> <578653c4-a7c7-498b-a283-f3b17f3d4191@kernel.org>
In-Reply-To: <578653c4-a7c7-498b-a283-f3b17f3d4191@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:03:25 +0800
X-Gm-Features: AcwNN1XeMS8Nn9F7_AMg2pV323zlKWTVjDvTMsgkH5LpvJ4tmdamIR4FLSMBfwI
Message-ID: <CANUHTR-xZpWYjsCAXCe+uRyJS5zuafsxpm7fNO09xRo-LK7jMQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_010339_295803_35390027 
X-CRM114-Status: GOOD (  18.11  )
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

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 13:25, Guangshuo Li wrote:
> > hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
> > failure path nor hidma_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> > probe failure and remove paths before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo

