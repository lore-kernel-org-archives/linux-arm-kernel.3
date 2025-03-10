Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C434C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/owprWp67u1/sbRahvguWlU5TGKcZvOGG/+uOM3zQE4=; b=X951FXINg50h6mRsOx+F3NmtS3
	nGiXjpbvlyxn+vaVsSq0T0MhcaWtDhe8tJ1KeJUNaPTel2TdZLN+Xx4D/YU74R2d2d1V6v4+l/TIO
	OOWreB7oQZnPAVe2OgNoOuOJsbt5ffP4e0IMF5dSpcsweDTX6LCa+V7cs+I0DwLiOYD4b8V8z6RJm
	IOOTNCO+gR2l/MWMOlDdzmGqtLDTayXXN0m9dTvwdbYiM46kUoUWTGIsXg9iGsuIIWAxc6B9lO+oV
	y/6JZHb+L4deRr+p1WV7Eu+iGD6g/h0L4+MuRxPk1Un6gy8OamTo3KBHP7GYmFXwzXjZE2Lbl9YIc
	/uTpe6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYzN-00000001zGS-3etL;
	Mon, 10 Mar 2025 08:59:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYx4-00000001yzg-45Yf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB391A451B8;
	Mon, 10 Mar 2025 08:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA1FC4CEE5;
	Mon, 10 Mar 2025 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741597054;
	bh=z3HdFE82Z/4RXvpeoyqLFCEFSfIoebqZu/6FnbCAKPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZJ4VUDAQQIR20H8jXi0mJDIV4ID0WB2CwAbFjl2aHinP/A02XERw7A32F808dODs
	 Ms6hnBnhEkluGmKGSr8CotjSnHmRNbh6spwMl0xPpc4m1ZbrJ5sMUMpM+G67mVGhNx
	 X35Ch+E+1og6Qz9xslNfPzGlCEzjGoqxovfOr6rpQ4l+iN4iH6KtKWOsR6iiWCpABE
	 7iCsRWsmE2MoCl4HDhknfBYhB3nQAsy5aKnVZIr8ZEmis/9NTWXTZiKwL+oDaCW0hn
	 HJoOTn/s2hUF4+PFutLzlgPuxCrTbs9/Iw3T32MkFrgUqH2fvnHex6a0zaVKKCS62R
	 EAYuC89BVv8Bg==
Date: Mon, 10 Mar 2025 14:27:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 02/10] optee: pass parent device to tee_device_alloc()
Message-ID: <Z86pdKQY440edHNx@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-3-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-3-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_015735_158905_B8918621 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, Mar 05, 2025 at 02:04:08PM +0100, Jens Wiklander wrote:
> During probing of the OP-TEE driver, pass the parent device to
> tee_device_alloc() so the dma_mask of the new devices can be updated
> accordingly.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/ffa_abi.c | 8 ++++----
>  drivers/tee/optee/smc_abi.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

-Sumit

> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..4ca1d5161b82 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
>  	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
>  		optee->in_kernel_rpmb_routing = true;
>  
> -	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
> -				  optee);
> +	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
> +				  optee->pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_free_pool;
>  	}
>  	optee->teedev = teedev;
>  
> -	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
> -				  optee);
> +	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
> +				  optee->pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_unreg_teedev;
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..165fadd9abc9 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
>  	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
>  		optee->in_kernel_rpmb_routing = true;
>  
> -	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
> +	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_free_optee;
>  	}
>  	optee->teedev = teedev;
>  
> -	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
> +	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_unreg_teedev;
> -- 
> 2.43.0
> 

