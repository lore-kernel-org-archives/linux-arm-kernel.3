Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE356C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukbvHzZfhwx6533qERNgaNRmfc+1+i0ljL79gEDoL88=; b=a8h5MC9HxlPEfwRhjMb91KI5qJ
	XtONlaABHYXnqo5Dh6ljDAlxCw+5re5Wo7irLWGgwFbSYrp5i2SgriJsLbj1uj8KMhH6726lVUQ8y
	M720DQDYAXzboZ9zvRhQXCFuIyTr4ij34S8goyH348GpW7MO+F07jmvD9vaTqYLLKX0TwN259W4uF
	HoubS24RR70eJq2M9pmTQLDDSLnlN7bjsNlH88G4avVIDGXXz+j65HTXuvZadGqRnQ5m1EHQG5Y8H
	1gbZ7q3INCO6Zl1epCLkTCL0Bqiwemy9LTdz/+rnUzrjQ0tNsn911xnf0cL1jIFoYAhjuStNyudIC
	MJl0i0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYozu-000000033XW-4BbR;
	Mon, 07 Jul 2025 16:47:19 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoOo-00000002ypa-0K4U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:08:59 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae3a604b43bso511563366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904536; x=1752509336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukbvHzZfhwx6533qERNgaNRmfc+1+i0ljL79gEDoL88=;
        b=TyBM/UMhEBf1R26fdk7Y89rTFJ598EMKmOvyjqtZVliq/TfiM/GdN8Pg7XwWrdFccD
         8nZk0jMMiLODonCfModbpCwyd0LTAzWdSh2XGJo8Tswm33wN9imsiItqMGcz4XKA4c1+
         4sB7Y7mLd010z5BVEB8zg1lKtXT/rcGqHiGwctBrtoa00ij9003jwX+djCMFvVTrQXnd
         fjGgMgafPQc8xpcSICGyJnimX0JOZpX6a3OzUVGgWzc4uovKcx+qvHrZDMkimdXDO5m1
         jOkNCpOYyt07uhqTp5cIF9ivFMb4GzXbKuw4CpSjXVpUjo19NF7YhTVHSfDMysu5uXPD
         zKMw==
X-Forwarded-Encrypted: i=1; AJvYcCUu4AuWdr5kzbIgFCRuKbJ4S9cyzR36XaVOEqWLl3gvG2CRnYcPB/Oi/AlraKOsocojSHxnwqxAlr98MhsyHDWi@lists.infradead.org
X-Gm-Message-State: AOJu0YwGoJAznWfWzBA9T/4y69xcUYcTgsAoCSlmM2Py0F3NNsY72z9r
	g6UPPIgXoohr1kJzIx3meXT+7UbJGtbJqKyLPCde87G8MJ4GhOybZu/O
X-Gm-Gg: ASbGncsWD8O5bAocC4IzG8m6fh0Qarb+gmAzx7BusN2R8UvSTmdGZEq4bxzl7CjWLnX
	vOQR7zFzs16fLrhyassBeD5yM41fn7AQD5a3iHI+97hWbEkgWnJGvt/3MEnxKRE0oqIKqpGg9mE
	3yOPLLWFuerMYhR4WiS2dt8qiqt2NbLaCocK8VUNSR8iWwNtf0i+Oxm0Dw8o+cG9e+FmtE6yGvq
	1p9d2ypscCX9oqe19iOygU+nKKhQps6gP1V6VbVDVu904lN7xdo/aF+iOie/0kfSZ607GGsCPLN
	rZvijdsHKE03uwQ6OwQgay/m71jP8otnliVUBgzxbMOunUgOrwTUgg==
X-Google-Smtp-Source: AGHT+IFRCwe+M2LN1raXwbrfTy1qnj/eKSyDlwd2ZulMHGxXV5lbkUCyxCU9OUDf418Cp2+/qD3ZbQ==
X-Received: by 2002:a17:906:2412:b0:ae0:bdc2:9957 with SMTP id a640c23a62f3a-ae3fbdea236mr1001311166b.61.1751904536006;
        Mon, 07 Jul 2025 09:08:56 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6abfadbsm729371066b.80.2025.07.07.09.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:08:55 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:08:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, usamaarif642@gmail.com,
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
Message-ID: <aGvxEYDP8pVlalaz@gmail.com>
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
 <aGaxZHLnDQc_kSur@arm.com>
 <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
 <aGfK2N6po39zyVIp@gmail.com>
 <aGfYL8eXjTA9puQr@willie-the-truck>
 <aGfZwTCNO_10Ceng@J2N7QTR9R3>
 <aGsYkFnHEkn0dBsW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGsYkFnHEkn0dBsW@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090858_113591_EC6F381B 
X-CRM114-Status: GOOD (  21.05  )
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


On Sun, Jul 06, 2025 at 07:45:04PM -0500, Catalin Marinas wrote:
> On Fri, Jul 04, 2025 at 02:40:17PM +0100, Mark Rutland wrote:
> > On Fri, Jul 04, 2025 at 02:33:35PM +0100, Will Deacon wrote:
> > > I would actually like to select VMAP_STACK unconditionally for arm64.
> > > Historically, we were held back waiting for all the various KASAN modes
> > > to support vmalloc properly, but I _think_ that's fixed now...
> > > 
> > > The VMAP_STACK dependency is:
> > > 
> > > 	depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC
> > > 
> > > and in arm64 we have:
> > > 
> > > 	select KASAN_VMALLOC if KASAN
> > > 
> > > so it should be fine to select it afaict.
> > > 
> > > Any reason not to do that?
> > 
> > Not that I am aware of.
> > 
> > I'm also in favour of unconditionally selecting VMAP_STACK.
> 
> So am I.

Thanks. I've played a bit with it, and did some mechanical work, and
send a v1.

https://lore.kernel.org/all/20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org/

