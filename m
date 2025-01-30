Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB0C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 01:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grXZNDUd86yKt3RSRZJhIgchfB4dH9qDkPhhvJ1+ujw=; b=I7c/e08CLTi7+dlPcztBS0IRub
	BV6ybxEovdQUQB/JE2ZbGvqcE8ikQ6nVMMW0xM22JxrwPYHJlwjOln9hU+qAmjj/hiE6aPI9tXQ8V
	M1g0Sqw16aZXpDCS77nX36e/qdmp/mZ88J00z0ATLsQnzoEkSHTlX1uYQbHF4VsZ4ccbWuchDIudH
	QvpHuwrzmku7m8r0otNv4Pj1WGvfmStD1JqgOyA3cFr1aISUtaHtu8w5LWtsrKTl0LY2l59IW1LCC
	2mr8nTmebcWASauqjpZKY90TxExVWN+QVCRC5tt5TVktbMFiaHnJ6YGhtP3UEpkdBKOGFlbjFXbZZ
	Jok2m53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdJKd-000000082PY-3b6t;
	Thu, 30 Jan 2025 01:26:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdJJJ-000000082LT-0LhE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 01:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7E52A409E8;
	Thu, 30 Jan 2025 01:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AECC4CED1;
	Thu, 30 Jan 2025 01:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738200335;
	bh=a9EQGLaLQ63V8C1g4jacKCgE1IBr1sG4RVQZ6PHSF4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzZqnHIyUkdd9j4YPjb7ti9EY012tiiYl4bzdy8COzBwzCvPYAQHccVgM+YI27XQX
	 Fwi8b5P8qgCVZ3LmzBOzCbxcM8MecOF1WaHP9p814TKLgL8zoLZNaNxbhcJV+JenAD
	 Dj0XFfhbQ/Pa0cpRju1wxolpv1PypDJuEiN8DiuVcNwUE5+4GXK/iwFHriIqd0uYYe
	 bJYnzrQBdH3OV0kqaGD2wLUFgQGL0k4EWKwGTJ/yA6T/DHzmCOS1Jk4f2Zis2OhcGU
	 Nxj0eKP1T6mMZ9ISe8feNeFEIltjv4YJQ+ARXdBe5jp2iV+VC+NkPHULttSTEQ5Bw/
	 OLuLMJDeMh7Ow==
Date: Wed, 29 Jan 2025 17:25:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Satya Tangirala <satyat@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and
 remove paths
Message-ID: <20250130012532.GB66821@sol.localdomain>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_172537_270642_5187A92F 
X-CRM114-Status: GOOD (  18.05  )
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

On Fri, Jan 24, 2025 at 03:09:00PM +0000, André Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshcd and therefore Scsi_host
> allocation.
> 
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
> 
>   Call trace:
>    kfree+0x60/0x2d8 (P)
>    kvfree+0x44/0x60
>    blk_crypto_profile_destroy_callback+0x28/0x70
>    devm_action_release+0x1c/0x30
>    release_nodes+0x6c/0x108
>    devres_release_all+0x98/0x100
>    device_unbind_cleanup+0x20/0x70
>    really_probe+0x218/0x2d0
> 
> In other words, the initialisation code flow is:
> 
>   platform-device probe
>     ufshcd_pltfrm_init()
>       ufshcd_alloc_host()
>         scsi_host_alloc()
>           allocation of struct ufs_hba
>           creation of scsi-host devices
>     devm_blk_crypto_profile_init()
>       devm registration of cleanup handler using platform-device
> 
> and during error handling of ufshcd_pltfrm_init() or during driver
> removal:
> 
>   ufshcd_dealloc_host()
>     scsi_host_put()
>       put_device(scsi-host)
>         release of struct ufs_hba
>   put_device(platform-device)
>     crypto cleanup handler
> 
> To fix this use-after free, change ufshcd_alloc_host() to register a
> devres action to automatically cleanup the underlying SCSI device on
> ufshcd destruction, without requiring explicit calls to
> ufshcd_dealloc_host(). This way:
> 
>     * the crypto profile and all other ufs_hba-owned resources are
>       destroyed before SCSI (as they've been registered after)
>     * a memleak is plugged in tc-dwc-g210-pci.c remove() as a
>       side-effect
>     * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be removed fully as
>       it's not needed anymore
>     * no future drivers using ufshcd_alloc_host() could ever forget
>       adding the cleanup
> 
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypto_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Acked-by: Eric Biggers <ebiggers@kernel.org>

- Eric

