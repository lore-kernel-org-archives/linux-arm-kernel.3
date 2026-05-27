Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACDFCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=; b=Xoa7thkTssErzvLCiGgLl6xcJD
	IznxA68VCNvunaZdPCL6PRZkbhYrYYUWqWY/L3JkPnxNHXYbmCLk4Y3Aaqg8xE6WjOUEtO9IIaTLr
	qKnbUh4WeqTnZC6I7UX6ThvgHqjxPE0Nv2UTGOTn15NXYkm2+HWGia8apbBtD9TjTxzGLMausPwyM
	SWkheTteh7fKZ/BdetBfpD7MGJD3P5iXc+yJ6ku/7inSf+EcWrPBiwbjHbouM2kRx+FPHqk6TkpMC
	XWgbsCfYTpjHNnTBW5Rv9K6o1JoeT5+Qm8w4ebrZ4JS/bLy/pSixHpR9tpnHDLqtqKqUtS4NKUrDW
	J9QjmdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFbC-00000004KN5-05gN;
	Wed, 27 May 2026 14:51:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFb9-00000004KMP-3HqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:51:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-367c26471f5so7640916a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779893466; x=1780498266; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=;
        b=vWAnHp/WnkDc9LrM5sN5E5TrK2JAF4Q7B0J+vyBoqnFxNQt32X3h2S4pvARkpMbJYr
         w6m2P8BsHTUMkrv4jRerXCgdWxk52PhKFkGHp6ETpcG1a6RMIigzIVkxZtgg8wiVo4i8
         2bCM40EsnHKVr+2W/JOlBN1fCwLx74EMpRiu+X277Trn4kzKKjTx3YrysQcAA/GaQ997
         QL/Y13xmMBymDlCeqigo8L46G8gMLdf6ohjg3D1lP6KYHMQBX1iaFZElkaIBx3rdYB2P
         HDyHr9cVTNULquIm1p/29HSTfr5SqP47YuJbsTq1Ay1k8keXuj94cvLXPH8ALosmpZXF
         0B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893466; x=1780498266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=;
        b=SV3fzu4oPzF06hBFbRBywFYCRcXtJ/dZnqCCdSbvAWHLhUWRFXqz+LBjeSrQLhNEKj
         YPMgrrdtc35RRFjmtQKxc1rwu7zQvp42nXOg5zSnphvcAK5vyaomS/Np9prVXCm0iU0m
         BgJJdZ7DxcnWMj74+UBn1ex9Z5XC9NBNSFZmORC+uG1zZpLfuIv9VeTLix1UtabhyTiP
         q3O1MToeepmB8LOO+XxpKKlN85qzPOWo0T+32oCPJN3fOoJnNgqyPRz/dwT64U19VlTb
         swsm/jka30SIg19SIRO1WzVusdJTymb9P+z3FohcZQzCTywT0AW0LQawHOBmKNPBvDHh
         0S2g==
X-Forwarded-Encrypted: i=1; AFNElJ8QEfp4Cb1PSZtJ6z9mylRyeW0x2Tyrp+HvWNVd/RqYV76taNNJW/wVbH84R3DkBba5SC13aPv9U0zWeiuGe0hP@lists.infradead.org
X-Gm-Message-State: AOJu0YylUAtsl+xD+UOIiFAn51sRDpbFxLqkc3dIVIoyt73ly+qfHVmC
	TTehUy5vOk+7ybj1YBfErCjQbHenmU1JCnfrG6930VQhzfsCaPiZb2qWzh3OZRLc4NQ=
X-Gm-Gg: Acq92OFYrGLJaGCG9EW2/kObySyY5V8zba6jY1pH3pGRqljIY3i8kttcW3Y0Ybb15OG
	ff3VptqJ+1TzgMf/7QDGAjn0jzBJkNpsPVsfWPoahG0er9ShxwUTIKpilDPVSTgIDn6xcCkbtw/
	aF844bR5GOn/fHks06armXeME8eOoHUupmG3OglNntC69j2cFvMBSU7nbu8sgkoi+PnON9lU4F4
	gQp3c0NPMz6Jmg0p36RNFior2GorakatZNbySn8RAExROYhWgrFNoONw+CFCiQ0r4fNKLgekeeY
	DH7ievU8SRiXOBmZOCA7juqgHrx/esYasvVwImuFl22AuPQqGcdP2fvL9a3Qf6JmtrpUmXZzCqN
	J3rcDqLU6w9ew1TOqQ7pIVHYNuVB5O/cUkBW4JsJsQVUiX/QmGFHhas8KUqi1OY+ubK7Z+ABB8K
	/V7Ncv6QwbQqSfgySv0uhq/0a0pChuMDt1aGT4EQ==
X-Received: by 2002:a17:90b:4e84:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-36a676ee27amr23018294a91.5.1779893466401;
        Wed, 27 May 2026 07:51:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b24d2feeasm1410665a91.1.2026.05.27.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:51:05 -0700 (PDT)
Date: Wed, 27 May 2026 08:51:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, tanmay.shah@amd.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/5] remoteproc: add common wc-ioremap carveout
 callbacks
Message-ID: <ahcE1ixlIXJ6wJ7B@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-2-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-2-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_075107_826676_C69C6082 
X-CRM114-Status: GOOD (  23.36  )
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

On Thu, May 14, 2026 at 09:21:25AM -0700, Ben Levinsky wrote:
> Several remoteproc drivers open-code the same ioremap_wc() and
> iounmap() callbacks for carveout mappings. Add subsystem-private
> helpers in remoteproc_internal.h so those drivers can share the same
> implementation.
> 
> Keep this change behavior-neutral. The helper now emits a common error
> message on ioremap_wc() failure, but leaves mem->is_iomem handling to a
> follow-on patch so that the behavioral change can be justified
> separately.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 28 +++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0a5e15744b1d..f5b34aabed5b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -12,8 +12,9 @@
>  #ifndef REMOTEPROC_INTERNAL_H
>  #define REMOTEPROC_INTERNAL_H
>  
> -#include <linux/irqreturn.h>
>  #include <linux/firmware.h>
> +#include <linux/io.h>
> +#include <linux/irqreturn.h>

Why was this header moved down here?

>  
>  struct rproc;
>  
> @@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>  void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  
> +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> +					     struct rproc_mem_entry *mem)
> +{
> +	void __iomem *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	mem->va = (__force void *)va;
> +
> +	return 0;
> +}
> +
> +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
> +					  struct rproc_mem_entry *mem)
> +{
> +	iounmap((__force __iomem void *)mem->va);
> +
> +	return 0;
> +}
> +
>  static inline int rproc_prepare_device(struct rproc *rproc)
>  {
>  	if (rproc->ops->prepare)
> -- 
> 2.34.1
> 

