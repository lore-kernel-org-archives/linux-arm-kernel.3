Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B34C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KO0NUFOW6hutGwnzAVn7ya4TyZ82iwbITVwQMJFOlU=; b=oRuDkoOjaQVef6a1WMlHcQ+Nzj
	rtUnSeeCLUQQ18/woDNjHifFVGJH3fkoMuAOuT0vVgUkf2Hedflx9jc4t5E/VlZERseUtGc7NY/Ms
	J58Jl+hQbWlGzQdLFzvPAGEgjN9MOGpZO31LlVdXaYXi03jEyTgNJqJjtRedQGxmrPrJsjCxCrSe/
	ps7OtoD6kv70c7fLotd1ttdPZGkNZ4e7Cgg/YiqIftBzRw5knsiOJDut1gwVEBF8rsBSsOKKCASpt
	DxnHrt49YBvgr9+TLoIJENZVZItiBivRQlpT743dWYkRjGhBXMRXkSuYd8V05UVNWntnHti1qh9RD
	uGVlJceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRQg-00000000FVG-30xT;
	Thu, 13 Aug 2026 09:08:50 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRQe-00000000FUT-3aat
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:08:49 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8f186025973so4948216d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786612127; cv=none;
        d=google.com; s=arc-20260327;
        b=bwENX3Zlo+dODGODVXHir8JVGBONF3xA1zJnJpscs+vZt12DghwLziwE7866XKdLn1
         4Fyo24PRI49xFdKe5VfdxqjkayKY7JNLH0FYBAOVOsDcYdQ/jRhaYBMQhxDBriu6zd8R
         G+sFR9b2qojQBcojCWvHhjQ41HAKlahqgAKxV3/wLLHIX6/dAxpZwWCOHQrPyY9qWpPZ
         YKunTJa1dkfflkPkaJcO4FPvMofjVkXvHrHCI++MpKvKXvevxIIwLujYgfA/mmZlrP/0
         xAsrMrBRPT+LX5L1eCsaqwYY+WPd1uAiIdwqlSeH3ejBreqhk0GubGOLsI6eGP+0uutl
         BsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4KO0NUFOW6hutGwnzAVn7ya4TyZ82iwbITVwQMJFOlU=;
        fh=J83KnTjt20FXvdnW3KAkmEg3OU3q+9vX/j+ykBNfmYA=;
        b=IRP88ER/xFMZYzg85IRZxDDmnQQdHpVg8yXLg8wQVyG8hpUd1OgDFSeAv8Q102GmwU
         z+HuqPrxv5/3O2ukSDJPz0XTOapaGy57VkJ0ToSGUyB3SSUjvB7Ks0FsjcxwXDjW6KQu
         faqOihBmebt2bCuB4FWl4wAEjC6mr+jlOZJWf4nqEHrOEyrHit0GjOyX03Ftkkbtun8a
         dUgjvr7iV+bbmDL5MLFz8/jkZJQ907v/QVqR5L2iXbdawS9nvNN+QOct9RhRqOQrX2nY
         yH4UrCYBSREk8wSNqEvho7pSBMwX0X7FDInn/IUeVaz3nJmTpZWzFd5gdItH3xSEegPg
         ZoMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786612127; x=1787216927; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KO0NUFOW6hutGwnzAVn7ya4TyZ82iwbITVwQMJFOlU=;
        b=hdYdMKi7NgSwMZulk1yylKpYWc3lATneu94+QZcx52mtZM40k/iBZ+qUZywj9SClFE
         JHcHcwdSSnZZZC2bifUYBJ5Q+RPSIMEH/jRv41wBfEBq1ZNGLgmiYOAsetnewkR9Mymd
         42StZ17NNYrTOUI/A7OlfNK7N2QSvsK4fbYA8xc0bNDGAVuP7MefGPUJCb9GZyjtv0t9
         hZf0vvYLwzR28f57RleAnB6ev0ew2Nu0Xi9/auHxWwQ7V76bC/KcZ0Mrpqv5oOc8Faev
         G5QaTPbsea+WusEver1O12NLEIfhy9zRKJUBgEf5Ox/g1Pfl1Wds1Uox2xu318iNhpD1
         Gm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786612127; x=1787216927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4KO0NUFOW6hutGwnzAVn7ya4TyZ82iwbITVwQMJFOlU=;
        b=TmWwfSmF76YJy59H4DBCn4Icwgjo5a0bfGoMdbGEzdDyGIaQ3YDc6xLGcMPVTTpT0L
         9IcC4wmcynLkDN86NhB1qf7CZKiHqK76FyhqUIK0xq36mIJhUTMjbZdoZEIbqoWUdcjm
         062ojPNGDgdVLqr6V92RbWU4bzWVohbHBg92zPJtjRvppyRVUyDn1JCgSk7ovtWQXRP8
         La51Qm4dBojHbOSXCFlcOERPND4du3XQvMMgEl7p7q0UICDmHYxbIpR3X/UYz/1XWN2I
         kXXjdHV0lZnwMyVSIEVZ1gLNY0554rPGWtIyhli5GGT+ony+WFy7qXg2jCeZNRtpuq/p
         qcGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpfb2vu4SPp+qvrzkQulRvbNSb4UhUbSGASLEfBCCkZm9L7Eo8WbP/NsCR0dgr1vrq1dEt61O9XpOBN3BzUnpEQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzmSqFVMQ1/HXDuNh+shnVpl2Qxz4CCx00nAOy+LviT1pCOpnxW
	zvwA0lHBklEoHV9J1bYRbXZnyGnApJ+Bv69K5eV0NE5Q+oUSJXtsMAUJAI1/1lnjRivlxXyvQka
	LPCuJDgPWuqFGwJrhTRIMu5FB8b4I7+Q=
X-Gm-Gg: AR+sD12fkK447P+CN/CyBzv/HLZ3Vv2s1qu5gYWWItCvgCY0F4fwjMYo4RBLW0DRXkL
	zlUajNNZBe1Mz/ZtrsCADg6uCXb1sS5XnOoDqtqMc+VBpMP2+hivEhcmhzqeuZNd2417jIib423
	WKvPTfth7x7KNEzp16GELhz7ytCV9CudtdM9UQKlHqns13LZbGz3Y6f/PT2FpB0T5de32+chKmo
	BmsLohzksatf6HnoRYsJLbIdUeftv07bnwHvJIdpg2xSwVvjTiPtev7qxXNrQU1iXqDNyk02070
	fIsp7DC8651YM9Z/QHpTZubYM7zkyVP06p9Kz9Sd3CWnC0y0Vb0Qkm0vORiU6YU2XgUPxLJIN1U
	lu76TnJmcrfoVDdDzPM33IaLR3czFEot+0LdpliCertSgojiSiTibW69fDigPGKVRh17+oz0NGC
	8coGLo+zYWL4tOgMHrWlf5mKCeEOGUNTYhy6bgpVk=
X-Received: by 2002:a05:6214:27c3:b0:907:88ec:6002 with SMTP id
 6a1803df08f44-90a80b5d571mr35846786d6.12.1786612127007; Thu, 13 Aug 2026
 02:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com> <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
In-Reply-To: <anwuYYxLFbtDmmHx@willie-the-truck>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 13 Aug 2026 10:08:33 +0100
X-Gm-Features: AUfX_mzk7-Fr80oSZcS7JCXx3W7IuSj6GBQng9PwetDjVwwKleRLeaF00AEqVZw
Message-ID: <CALeDE9P1xZonVnZDExR_hMafd4mxahkjBVTDLJenQ6DKW5MSHA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: Will Deacon <will@kernel.org>
Cc: Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com, 
	u.kleine-koenig@baylibre.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_020848_891869_2C9442AC 
X-CRM114-Status: GOOD (  14.65  )
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

On Wed, 12 Aug 2026 at 09:28, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> > This patch series adds an uncore Performance Monitoring Unit (PMU) driver
> > for Broadcom AXI system and VideoCore VPU performance monitors found on
> > Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).
>
> Why are you sending four versions of this patch series, at -rc7, each in
> reply to the previous one? Nobody is going to review that.

I'm also wondering why this is called rpi_axi_pmu where it very much
looks like Broadcom IP, and is possibly used in other Broadcom SoCs,
Florian can you confirm what this driver should be called?

Peter

