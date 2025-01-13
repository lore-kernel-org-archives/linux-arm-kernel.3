Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01697C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo6S/NbiC36DkS7Kap9xyJe9NBN1Xps0or4tNn+/IDo=; b=ghxT0gXXnNMy4H1HCxI1xYkO73
	B0cumkmbXHrPiJGadMXBEAkrXhRY2/zD763hRhd01CPOQMGvDaAQzRc+t2FcdiNzNmzwkoI4gASh/
	qcR8+2A15/cS8KE73JgTMCKHGB5YcFrXFNxYTwxo11ilSskI27B3wBtIb5EZuzbmxIEZnDv4BMMo5
	hqU0I3GeqiFYOiLlZwqWXlfB2cEEAk6r7SbLBVkZRcbtfGkU43r125R0YNYzG/qdAsdDpv2dMaAtC
	OHoGAh3fL1kMBwGFjROiLQwNZWZbVC+NyyhOPPXWb0m659YXgRWARDgbpPNDL4Z3St+BIqprCpsQ4
	Z022I6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR7H-00000006ZKr-2PQQ;
	Mon, 13 Jan 2025 20:32:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR62-00000006Yr9-2vqO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 20:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4050C5C57DD;
	Mon, 13 Jan 2025 20:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8053DC4CEE1;
	Mon, 13 Jan 2025 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736800297;
	bh=Up9r2sF9a7ds9s6HK6Cfz2WXo56DasNauR2Pfzo2u2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSJcAYi42WHeJopVXG2d4MstJhfedjBfC2USIrP0nvBv8QEYaT9cYrmwkM57tIUb1
	 w6kkoH5b6qF05D1LSj9GA3his4Tuei4M3TaD3qhtttIYCs5tihJEclBlAnUrMG2tFl
	 djLQ4YKvvFWaTlU9vKbqoBGu2L7G0hQCrBpj3+LM0AbIoeSt/tnHouzZnfWCgd/Fms
	 whfJzQN9T4TvrZNNDtZCE1cdaBWz/sa3zwTyq+aaBotUBM49Srf6T/yaZdvFcfoPaQ
	 FZRNrtsPZFsH8h+0dEpGnd2YVZUsjBbh/LZ0IPlaGw5RlqtOX6Xh65zhY0y6nqh56l
	 tCeWqclB7sUvA==
Date: Mon, 13 Jan 2025 20:31:36 +0000
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
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
Message-ID: <20250113203136.GB1800842@google.com>
References: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
 <20250113192235.GA1800842@google.com>
 <c4129ea9da39badb3a686f7f93c334ecbc6d83f6.camel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4129ea9da39badb3a686f7f93c334ecbc6d83f6.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_123138_835403_DA28CE0E 
X-CRM114-Status: GOOD (  38.35  )
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

On Mon, Jan 13, 2025 at 07:28:00PM +0000, André Draszik wrote:
> On Mon, 2025-01-13 at 19:22 +0000, Eric Biggers wrote:
> > On Mon, Jan 13, 2025 at 07:13:45PM +0000, André Draszik wrote:
> > > devm_blk_crypto_profile_init() registers a cleanup handler to run when
> > > the associated (platform-) device is being released. For UFS, the
> > > crypto private data and pointers are stored as part of the ufs_hba's
> > > data structure 'struct ufs_hba::crypto_profile'. This structure is
> > > allocated as part of the underlying ufshd allocation.
> > > 
> > > During driver release or during error handling in ufshcd_pltfrm_init(),
> > > this structure is released as part of ufshcd_dealloc_host() before the
> > > (platform-) device associated with the crypto call above is released.
> > > Once this device is released, the crypto cleanup code will run, using
> > > the just-released 'struct ufs_hba::crypto_profile'. This causes a
> > > use-after-free situation:
> > > 
> > >     exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed -11
> > >     exynos-ufshc 14700000.ufs: probe with driver exynos-ufshc failed with error -11
> > >     Unable to handle kernel paging request at virtual address 01adafad6dadad88
> > >     Mem abort info:
> > >       ESR = 0x0000000096000004
> > >       EC = 0x25: DABT (current EL), IL = 32 bits
> > >       SET = 0, FnV = 0
> > >       EA = 0, S1PTW = 0
> > >       FSC = 0x04: level 0 translation fault
> > >     Data abort info:
> > >       ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > >       CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > >       GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > >     [01adafad6dadad88] address between user and kernel address ranges
> > >     Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > >     Modules linked in:
> > >     CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.13.0-rc5-next-20250106+ #70
> > >     Tainted: [W]=WARN
> > >     Hardware name: Oriole (DT)
> > >     pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >     pc : kfree+0x60/0x2d8
> > >     lr : kvfree+0x44/0x60
> > >     sp : ffff80008009ba80
> > >     x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffbcc6591e0130
> > >     x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffbcc659539d80
> > >     x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffbcc65714b22c
> > >     x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 0000000000000000
> > >     x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffbcc657a027f4
> > >     x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffbcc6579fb194
> > >     x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffbcc65714b22c
> > >     x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff80008009b940
> > >     x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff22e006f54f40
> > >     x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc1ffc0000000
> > >     Call trace:
> > >      kfree+0x60/0x2d8 (P)
> > >      kvfree+0x44/0x60
> > >      blk_crypto_profile_destroy_callback+0x28/0x70
> > >      devm_action_release+0x1c/0x30
> > >      release_nodes+0x6c/0x108
> > >      devres_release_all+0x98/0x100
> > >      device_unbind_cleanup+0x20/0x70
> > >      really_probe+0x218/0x2d0
> > > 
> > > In other words, the initialisation code flow is:
> > > 
> > >   platform-device probe
> > >     ufshcd_pltfrm_init()
> > >       ufshcd_alloc_host()
> > >         scsi_host_alloc()
> > >           allocation of struct ufs_hba
> > >           creation of scsi-host devices
> > >     devm_blk_crypto_profile_init()
> > >       devm registration of cleanup handler using platform-device
> > > 
> > > and during error handling of ufshcd_pltfrm_init() or during driver
> > > removal:
> > > 
> > >   ufshcd_dealloc_host()
> > >     scsi_host_put()
> > >       put_device(scsi-host)
> > >         release of struct ufs_hba
> > >   put_device(platform-device)
> > >     crypto cleanup handler
> > > 
> > > To fix this use-after free, register the crypto cleanup handler against
> > > the scsi-host device instead, so that it runs before release of struct
> > > ufs_hba.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > ---
> > > In my case, as per above trace I initially encountered an error in
> > > ufshcd_verify_dev_init(), which made me notice this problem. For
> > > reproducing, it'd be possible to change that function to just return an
> > > error.
> > > 
> > > Other approaches for solving this issue I see are the following, but I
> > > believe this one here is the cleanest:
> > > 
> > > * turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
> > >   pointer, in which case it doesn't matter if cleanup runs after
> > >   scsi_host_put()
> > > * add an explicit devm_blk_crypto_profile_deinit() to be called by API
> > >   users when necessary, e.g. before ufshcd_dealloc_host() in this case
> > 
> > Thanks for catching this.
> > 
> > There's also the option of using blk_crypto_profile_init() instead of
> > devm_blk_crypto_profile_init(), and calling blk_crypto_profile_destroy()
> > explicitly.  Would that be any easier here?
> 
> Ah, yes, that was actually my initial fix for testing, but I dismissed
> that due to needing more changes and potentially not knowing in all
> situation if it needs to be called or not.
> 
> TBH, my preferred fix would actually be the alternative 1 outlined
> above (dynamic allocation). This way future drivers can not make this
> same mistake.
> 
> Any thoughts?
> 

I assume you mean replacing devm_blk_crypto_profile_init() with a new function
devm_blk_crypto_profile_new() that dynamically allocates a struct
blk_crypto_profile, and making struct ufs_hba store a pointer to struct
blk_crypto_profile instead of embed it.  And likewise for struct mmc_host.

I think that would avoid this bug, but it seems suboptimal to introduce the
extra level of indirection.  The blk_crypto_profile is not really an independent
object from struct ufs_hba; all its methods need to cast the blk_crypto_profile
to the struct ufs_hba that contains it.  We could replace the container_of()
with a back-pointer, so technically it would work.  But the fact that both would
be pointing to each other suggests that they really should be in the same
struct.

If it's possible, it would be nice to just make the destruction of the crypto
profile happen at the right time, when the other resources owned by the ufs_hba
are destroyed.

- Eric

