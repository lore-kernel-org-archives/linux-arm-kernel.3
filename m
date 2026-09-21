Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FABC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=; b=eJJJgwOIS3ZJ49u/YtyrMnvAwq
	IHw55M/eLcXhsAwSyxau5pd8Sp5MPY9XcEvEgTEVzicul9VzKzVMLkkiB/uVfWzbE9aV6MeVKBifZ
	zI7AcSsXA/W+f+bYsp1tQ/mcp7lOQUd6R1EpU9dBAoDn/I1wn/cahQMok2NAiqtwxf2GXwW8oo0A9
	EESHSmcY6VkD3Eo9MLeiE4bmihsKzOQbdtLQBoWkCve6CkfWG+Hr1S/xfaYhJnLLAqrylUmWZ5MHb
	Peuo0e7gKXvthAAYjpd1w7tNtYTUUVmm5fWDltzZlelWAjwUt/cCSFcFQ8u8bbl8f/CKJEjWzo/MK
	G4koUtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dH0-000000025TC-39Kj;
	Mon, 21 Sep 2026 12:37:30 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dGy-000000025RE-0yBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:37:29 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-52fb76906adso44278401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789994247; x=1790599047; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
        b=j3kPB6bN7xj2sLwPMSmAL7Vjk7X6+DK1TEbHQTPHCLMns0Zrp4fRZnzeB9q7vHtm3g
         pobt1DwUWzztmBoRCML5szm3Dv7I5cFT3M26G/9UoSE2VGGwJlljYfKP8h/Eojq3bqYk
         hwhjs2rFj4Aj45soGM0kGx/3lWB8dVbn1g+cfLJqeVCPHWM9SV4XdhoydH3BgAH4Kc2c
         tqv9g3FsIILnTXfbqznuUPJDTO4Lh2YREEQhbVCEqatHNL2GkrSgzmFFB72k7zrat4nQ
         dnOHeX9XOXsbSym1vBuknvZSQbnPGH9FVsZThB90qw0tLSOKgfkCuT2OxvLlN11UxEIV
         fCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994247; x=1790599047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Hm52DrFJhVzTImXmCJeMk9yT6JstqdY7Mr3vv4AxKw=;
        b=oEkUF45eq17Kv/QZvMeNJZQ+TAzmkAks33PJulcGWcvOmrM/a/0ogSi2U80SoxHG9c
         SNlKtI+tiqJvMUdW1alRgbbT//BmxZqDPYVAYfz4Fj8vS2Ttjm8I+BJPmDYD6/aWH9lh
         hE0V9LAAfggdgTZzjVv07dl8v3OhZwxxkUwIj2bEQC0yxXSJHiBFnsoMdRiv+KMrApVd
         8NnviUwatweqirBUbPazpmJK+IMqOzOIgnGlZh9LgNC9RdUq5FMDW7f8P6a9EH6MSceC
         EQE7voGctfBNigzP2t1Q3kecP3iJv9pJo7J7ayi6GWzWMg+Wo9RHswpptNxChtMJalk3
         9Eyw==
X-Forwarded-Encrypted: i=1; AKwUvBz/Q4X4pCv4GNVDn/mpUTrJJKbG2gz1PbinE8RwDRhOOux8LtlufCBIEZAyFPOSW5ZzTPNCPWCFop31GXfPtcQx@lists.infradead.org
X-Gm-Message-State: AFuF++mvNuvSZqGHfsirr2MdRwk2POt3j1iuM3ueuOeWxGP+tKFQt6Zi
	+mIrXbRhuOqwA7fBWqBGMr5SjcackDeopxzvMAdHCTqcnOm+ZysogggRpUE0FqfYNDg=
X-Gm-Gg: AYBFou2hJmKKcfJ9HrDj2r9JxeCvLLEZ7UiYVwY/Jnp3jZkH9q+wnFJ16caYCIerFdH
	E1Qjmt0kyb76jgN0rK+9UIejDxm/tAgpudT2TmSJA84aobEF8sL07Sj2BdH8vBQrRsequ5/DAic
	NrgcELS7Q8EqjDjUATKZkQ523vcScPSdQOjHmDnQ4rqlBkfPNP+C0zpg75VWYSK1Hk4u0Pqq2Kz
	GP+OqdF3n7oHAeok4o15SIwPFEf+xygWoXGfO7aqBFGt0hK5TlUPw+KDBY2YrKksUq2aSOQIE5G
	PZGL4uHMhrDd4++QAJYm7tsij4VO7k6mk4XQSMADP+eaBMXb9qOPKA6dQPv38v4DyzyOEuFEIS/
	aHWMU02B/ImP8tpYr2tA1vTR0mBfRVFsdgvRwGKfZ16wbY2YZfTyFrsEE4nbQa/A2hI12OoAZ6d
	FxJ3pUw21+wzY/HkFICkcMZEcvxOshw7y1eSoIHkhIutU+MdwjS1Vc5v6AtI6pGx8x7z2sXdj08
	yxc43XJfzcQ6qc9wbx0zgR2UlkzcPlRQimaFBQBmAlsRkfoAEoJ1eJ1/5WirDSQRdc=
X-Received: by 2002:a05:622a:1311:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-532d8cf35b1mr4406171cf.10.1789994247006;
        Mon, 21 Sep 2026 05:37:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae77acccsm63282941cf.30.2026.09.21.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:37:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8dGv-00000006HZy-3ljy;
	Mon, 21 Sep 2026 09:37:25 -0300
Date: Mon, 21 Sep 2026 09:37:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260921123725.GN11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
 <20260921121739.GM11599@ziepe.ca>
 <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_053728_274572_C5BC307B 
X-CRM114-Status: UNSURE (   8.59  )
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

On Mon, Sep 21, 2026 at 02:24:21PM +0200, Christian König wrote:

> I also don't see where mem_cc_shared_granule_size is added?

Patch 1:

https://lore.kernel.org/all/20260904103452.1197239-2-aneesh.kumar@kernel.org/

Aneesh, please be sure to use get_maintainers on series like this so
everyone gets cc'd.

Jason

