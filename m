Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631B7FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9+cpf2hIVNQ91WB+2aQTJNZFQ7FKHfQncQ4man53Jg=; b=SQydgOGTnW3mqQUrGkmqwp646R
	i1VTKsRtNJmYfZ5JMXQAGHqtkf6xaaYg/gUe8k6i0fBdjZdznbbVZR1DrFHkMMnpO7SFdL7PNvQBW
	V+FPouL9WKXkBed64mZKIag7qBQY2nQ+3KPEzxZxw44DsihTAZc53fQyKUDBUq0Xq0tdynzKGGu1S
	Ls1PEyhp34u3uFL7rvou7RpbiY9xez8YhVbk5h7UUhiFbJcnkktgWaPN7HqgNgNnlEFRCMOQx5AY+
	Wen1+FjtQX0uvw6Z9bWZ/Cr8uho7xZURnGRojeFMwL+FTX3l/P2MhXu7O9M3lIxEdSeTAZ4t2+i+G
	nMOHVKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdqy-0000000EVYo-01IZ;
	Sat, 25 Apr 2026 14:19:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdqw-0000000EVYd-28XA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 14:19:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7303A60055;
	Sat, 25 Apr 2026 14:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F1FC2BCB0;
	Sat, 25 Apr 2026 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777126765;
	bh=ZmsK2POVH2Z4YyUaXKtECdBvyDUFXk5uggawnQxeVQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqaFM3DB8C2ytMYZMb6+p2eO6CaGG597R8Sg00ja0PzZg8Luxl5fdzHGkl88YEqyg
	 Fu6mM8hP/Biv7Y7x8iGJ9BbRZpKGvBs4bBPUcTOr7xaFUS5OabJVGGJLu/OdHcfhGP
	 5qdY/BWhPScC73EtTA1KRYufLM47XwG/zgxhCOVXhuoAsoeH5fVkdIE7Pa2ALYpMYY
	 mibvG6F9/7bvZK5lix1eSetpkwF4d+L95aow4kkxbP6F5uy1sT33e7HLAIX9LvoPk5
	 nXbMzt+VMCaGYgILGP5NZG+/knO+BJ88WDWYV8LxFG9zrxOwf4/Xnncv4FZWWeCGXp
	 XWoSF8dlq4Y/Q==
Date: Sat, 25 Apr 2026 17:19:21 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH v3 4/4] Revert "firmware: arm_ffa: Change initcall
 level of ffa_init() to rootfs_initcall"
Message-ID: <aezNaZEcXlEklNoj@kernel.org>
References: <cover.1777036497.git.noodles@meta.com>
 <2e7b4dc552b45ddf14cc43bc449cbebb4ade0027.1777036497.git.noodles@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e7b4dc552b45ddf14cc43bc449cbebb4ade0027.1777036497.git.noodles@meta.com>
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

On Fri, Apr 24, 2026 at 02:24:42PM +0100, Jonathan McDowell wrote:
> From: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> This reverts commit 0e0546eabcd6c19765a8dbf5b5db3723e7b0ea75, which was
> added to address ordering issues with the IMA LSM initialisation where
> the TPM would not be fully ready by the time IMA wanted it. This has
> been resolved within IMA by retrying setup during late_initcall_sync if
> the TPM is not available at first.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Jonathan McDowell <noodles@meta.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index f2f94d4d533e..01547c5c0e38 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2106,7 +2106,7 @@ static int __init ffa_init(void)
>  	kfree(drv_info);
>  	return ret;
>  }
> -rootfs_initcall(ffa_init);
> +module_init(ffa_init);
>  
>  static void __exit ffa_exit(void)
>  {
> -- 
> 2.53.0
> 

LGTM (for both tpm patches).

However, I'll hold on any further comments/tags up until I've sorted 7.1 PRs
(just so that I have full focus).

BR, Jarkko

