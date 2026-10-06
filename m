Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0B2CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALpN1Maj9EHVWlBdbWojDECYyuYPzFGmL3crn6hvyc8=; b=fpVT0Vn6J796GUL5XUAYFqUs7K
	j2fYRIvc9UONHk+S/ZQHWcQBjNp9xdl4pBBI7byQ+dLyqOpHplPjqZaiw46uE1JkuAz/gfQg+k+uj
	5JdvRB8cbO6K0zp7T7sFVcB3daTInCzZzaa3Sz+Xo6TrRlJa5cpKvWbW4oxRBhGJXn0Tqzx5aFhCt
	9l4exAPz86rgovgzR5d2fhpFet87KfUDe3y+cyIDA9dL6GzhRIUrVTqw2XWTvJpHTiOprP4zB6kmf
	HTMO4XqdomgVMrdNupGScagKexuvnlU80tZaO+yaz3DgNJaq2LSzeJ+pL9cBRd61JXb+k1gaW7t8l
	VrTiKQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2S8-00000000W2e-2oz7;
	Tue, 06 Oct 2026 10:31:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2S7-00000000W2H-14rn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:31:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D59604091E;
	Tue,  6 Oct 2026 10:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAE81F00898;
	Tue,  6 Oct 2026 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791282678;
	bh=ALpN1Maj9EHVWlBdbWojDECYyuYPzFGmL3crn6hvyc8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ol9YmwxOTJV2ajvh2DQPaO3GJQHwWDfoIdhumtwFIh8TDephvBCPYF1tSs7t3SjHR
	 Ii8NiCuW1gEl25wbUbJ99mlc83gMbENr90LDiabLWhKEfvMFuHdVT8PAG9s5ea2ho5
	 Gum2fnt+KjmkyvLDcuf0IFWGHFZ1tqcEJENca2U1Zou8MVRHRQI4EZs1RFUIkYKvl2
	 MFjOfamExjIGEmzfIpQMNe/tju3QMf4lXsf7BP9BWrpCL2CTuM99JCEGV4T73Kq2yv
	 B86sw3xuvK0dCtoSaSDDLyTScs7mQqHlsFEYqNxSEUkQomWJQR5WM9aNfZtkoOukxH
	 rsehSQWb4+HhQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 2EA9D198003A;
	Tue,  6 Oct 2026 06:31:15 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 06 Oct 2026 06:31:15 -0400
X-ME-Sender: <xms:7c3EairCLg3yVpK4hsQL87XbeTZz0qqK97feUdhHMqKUPUmwE4Fm4Q>
    <xme:7c3Earc7oeXbL0vktWcCiT2vaJMzHxsdvDMlL2q5uHMMDi07cSffHdlWGNmKiBZVU
    e6B1nVgh8R7i0FLJkqrVwrkkuJxqggTGfHNhNNupIBDkcrG8gRDC67z>
X-ME-Proxy-Cause: dmFkZTEsDdnX9Y3ZJDxPCrw6tc0zS1iA5aGPrVX9TtkSIvacA0aBhZUTjX4nyhSQkLvqa9
    DmJLo+mkZ/vcnM5+2ypJbQSA4I/Zc7oR4UPvExYMwwU2Q2tCsRwj9uTpKEr0bxWC0yYLrv
    iL5LvHBWucAIdDDcbC36/9xav+t2BKAPGcEG75hTocgUXNYq/e0RIvYO2ZoXMtdy+N3HvC
    P4aWLEQuWh0xp/TA7hWqQ26F0CXYHIj6GFdluDUGAoLo7BEpfXsmQJvf1R8DibG2s5wmMY
    TA3tFKFlaArn15B2GKsPRs21f5EkS9yXuUJVRRTftwuKKQ14eC/W9mR+f592ITAwQ7n6rd
    XjT/kFbXnLkqTzP9mLuMg4R0k8rLkof2AATMIgV7+nGkDz78hszK3q7e8cR0iNEN+trEeS
    9e9FOcKP3HcDFO2p+Z0Qmsa264H0yYnADcEov1bOQzpqtbe/QAiZoCj6+RWWVibb6EG0C0
    dg7PjFuLMRjF655zY2vHRbJHQn5NAg0Lk+RrzeAJh+kqksBLvrg25ryG/d4z8DpeEy0LUJ
    AyhzcTfVdtP9OGgfo+CQJHj2NAaf0o0efQU365eZQvV2guAOiNdgJDdtkSbNBXxZR6Wsss
    7Kmth4q4tbSlqPSgErGW0Ggiey8t1VNVdsrlXHkVMQlunYj4q/J82Coh9vDQ
X-ME-Proxy: <xmx:883EaqbFk9J2X19clUCTNwkmExxeL5YEvgYu31KiMlF8dKt9qaCIqg>
    <xmx:883Ear1oFzNmKL3xeFUQJFaGlcHKcECrpQv-WRHnUA-pFXIQwJw7HA>
    <xmx:883EankWHW2yqE2pSkoiiyJTOV2rVpwiZXRBhMh0Z_SOVAZSfD5_mA>
    <xmx:883Ean9dlEcmspj88ogYncv1tKmRElqHzdWkjU4bmkfVugVRkdwtXg>
    <xmx:883EauHQsLeXiDNeaMO4hBD7vplWFRkth1sWFg3wIZ3_y74Vm5hMEY0g>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 91AB0F80090; Tue,  6 Oct 2026 06:31:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 12:30:47 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Arnd Bergmann" <arnd@arndb.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "David Sterba" <dsterba@suse.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 "Mark Rutland" <mark.rutland@arm.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <pjw@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Simon Glass" <sjg@chromium.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Nick Terrell" <terrelln@fb.com>, "Will Deacon" <will@kernel.org>
Cc: "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
 linux-integrity@vger.kernel.org, "Palmer Dabbelt" <palmer@rivosinc.com>,
 patches@lists.linux.dev, =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
 "Ross Philipson" <ross.philipson@gmail.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Song Shuai" <songshuaishuai@tinylab.org>
Message-Id: <4c482b32-390c-4fc7-9cb1-002eb88bfe58@app.fastmail.com>
In-Reply-To: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Subject: Re: [PATCH v2 00/15] arm64: DRTM, boot portion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Jason,

On Sat, 3 Oct 2026, at 01:31, Jason Gunthorpe wrote:
> This is the first series for an implementation of ARM's DEN 0113
> v1.4b Dynamic Root of Trust for Measurement (DRTM) launch protocol.
> It is built on some generic changes to the EFI stubs that provide for
> a simple, direct DRTM launch directly into vmlinux.
>
...
>
> Jason Gunthorpe (15):
>   efi/libstub: Fix error unwind freeing fdt in
>     allocate_new_fdt_and_exit_boot()
>   efi/riscv: libstub: Don't set image_size in handle_kernel_image()
>   efi/libstub: Free cmdline_ptr in efi_pe_entry

I've picked up these fixes for v7.4. I'll need some more time to go through
the rest.


