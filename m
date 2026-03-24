Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967FFF54AD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EOCRA3uQBc4AWcGvtFcPMpcHJU/iNoWp5grdcgMgRg=; b=QBRrcoUHk0WH5UnTkjl1YW+8z6
	oobwPQp6AoNZovEeCWXfX0fvdJzhx8cT0TeZe7RItFh1EIBxqi44x6DjCKFcsqBonMh2DgH0abwEa
	6iCESJJON03HJbNcmvzKfJwM20XvyMF/NAZ60fmkSmvuzJd31L3VtFg8Ivl5RE6WdQK/uO5MRorA1
	xjAQedSQQCSCyri9DXblQ4i3A49f262ZvRO3BQgeii80zlKzhGPrsdsEnlUWic5OvPBn0Y7AvylIV
	OIJMokIcOxpxVI/PWq4TCw6PaMFUgsyKJ38JBaD7+4CC89lwWclPKbv3tQzpkoZHdmqzMHXZlYcqb
	/ds8kspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54ON-00000001rHN-1vfl;
	Tue, 24 Mar 2026 16:14:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54OK-00000001rGc-0a95
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:14:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48704db565eso32910375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368842; x=1774973642; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EOCRA3uQBc4AWcGvtFcPMpcHJU/iNoWp5grdcgMgRg=;
        b=Jal0vScbL4+7LNcMqrckOa8gKj7MyMXZRA3JGfyUeCPG9l6QokbIuPC9tpSTPC1sn9
         +58JEMq0TykN6YrfN2jmKEnTtRj5hxypZROIg9GxVIhRPUTI5bsj69k88Mf0gzDr2orp
         SGhjn8nQY2NwyPmqLPXubAtpMG5Zr5Dia9rex+Z+FESxO1l8cnj/KlDPlpIzi+O5j3l0
         vk8NiWkhlnBshTPfsSZASKlyR0lN4hwUSxyPmjUVQPu6oP7fdvoJW7i1dyR/8iM6ZfQV
         YJsOHNuwURaxHRa+RTpCg1/tTimhN3Ebj3LV7YK9POzmaLMEANEz5I3mkX3hH6FcxBkT
         mMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368842; x=1774973642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EOCRA3uQBc4AWcGvtFcPMpcHJU/iNoWp5grdcgMgRg=;
        b=gOZkJb08mT86au0pN3yFj16imikfA/ssb8TLVkwY7oQecjVoWlYaieaEbRsfC+N3Wp
         8UpcILGPn4P8iIcO/zXmvWxkzsjl24deRBOkS8Cy5Wv0b78mPgkcNmztBPgM0go089la
         VM1uye4W+TEKnNgbFXP5ceswY4xjhqTYc46FbCTJSPKDQpHOf5V/m1gSZU6X4tDf+ahw
         RH9ECCweEinLdstjENZQMRfE0IU4En+jZn3rx3XVssoskCPMjD2wE80BhaOScAIxiaw6
         aVqjMLfdohLZcaO+YI+7h6FyFsqscBlc3tPJ0B70jwkfhI89YGfD13o/NvrEQZ/zKx+9
         NklA==
X-Forwarded-Encrypted: i=1; AJvYcCUO+xd1eXDAiTmbrLB0VlXrwfFhbMAspB3P6IqN3OxrgMdvcqdIGSbCY2r/PXAdMBYWzqiID2WoZ5vmlZg4/Fx4@lists.infradead.org
X-Gm-Message-State: AOJu0YyFgniid7C04wfXDa7G8Sd3aDvadxSD78groRUjXCQdsFlR7z43
	2glm/Ww7KBhJW6Wwpvt0ll22krkw3CIc6B2qasG2Lco9c7Ohj9Ep0Uo/
X-Gm-Gg: ATEYQzyvnD/CPA0LxqXS+MKJ1KgQ+zAuHXz0EAgsNfD8RL/J+W5dkxyuQdDIJ/y1Ghk
	KoxmqEZEoFWAw8W8QjsYIu1AYhnE0lDnYifKYRjtO07uhO4MxX/3uNlRaMJFBJrMmiEethsA71N
	IiJaPd3L1utXbcZnhJmnUjSmRQ0pYX09ZemECEZkTyZ91lSo2qxWIVFp5iXcNimDXf/GO6D8unc
	jVEbwdiM7/unSCGn06yzZ5oUtaXzpzIlaWi/cEyPrmB2a7ivpjvXhr27sF+SnMZShXBllWrOWOD
	fTt5bnpw8BkUZWqtyd/f9dfZo0D1o6B2SMkER0EtVp891ro2XslM7Lm2Nhw6Blo9iNHEg0RkJXK
	Ab5dRZP+RDAPiC5egIeO90ZoI8/lGxHroEEVDPS6GJK2DEke2Quhp6en3s1dmCXCNNDXdtpcfOc
	1+BkKja6NV6MsyTdqJrgN6PID7PTJlJSfzAkRlab2F/gxHwJYd8UmxTw==
X-Received: by 2002:a05:600c:34ca:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-48715f0369fmr5614135e9.0.1774368841765;
        Tue, 24 Mar 2026 09:14:01 -0700 (PDT)
Received: from osama ([41.46.242.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871102369fsm35141365e9.6.2026.03.24.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:14:01 -0700 (PDT)
Date: Tue, 24 Mar 2026 17:13:57 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jeff Xu <jeffxu@chromium.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: vdso: fix AArch32 compat init allocation leaks
Message-ID: <acK4RbHmnxSHcTqY@osama>
References: <20260323214117.241216-1-osama.abdelkader@gmail.com>
 <acJgc9EVRJJOVM0S@willie-the-truck>
 <20260324110512-7a00b224-8c48-445b-93f3-dd9b7a07d3cd@linutronix.de>
 <acJkDv0AT_YqDIF9@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJkDv0AT_YqDIF9@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_091404_212643_216FBC72 
X-CRM114-Status: GOOD (  21.31  )
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

On Tue, Mar 24, 2026 at 10:14:38AM +0000, Will Deacon wrote:
> On Tue, Mar 24, 2026 at 11:09:12AM +0100, Thomas Weißschuh wrote:
> > On Tue, Mar 24, 2026 at 09:59:15AM +0000, Will Deacon wrote:
> > > On Mon, Mar 23, 2026 at 10:41:16PM +0100, Osama Abdelkader wrote:
> > > > aarch32_alloc_vdso_pages() allocates the AA32 vdso pagelist, the compat
> > > > sigpage, then the kuser vectors page. If aarch32_alloc_sigpage() or
> > > > aarch32_alloc_kuser_vdso_page() fails, earlier allocations were not freed.
> > > 
> > > But why should they be freed? The vectors, sigpage and vdso are
> > > independent from one another, so we can limp along with whatever we
> > > managed to allocate. I'm not sure how far we'll get, mind, if single
> > > page allocations are failing at initcall time...
> > 
> > In the core vDSO datastore we just panic() if the allocation fails.
> > (See tip/timers/vdso for the currentl implementation)
> > The same should work for the architecture-specific bits.
> 
> I think we should just leave the code as-is tbh unless there's an actual
> issue here.
> 
> Will

Thanks all for the review.

Regards,
Osama

