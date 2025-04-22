Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E4AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyEBcCR/6QHLUGIB+aQpEgJBKH3e+SwaGu0zl8J1ZWY=; b=owWZsZ/YeRmII3kN66sLOapNJw
	31MelJncZbCCyI7IxnJNPvi1mwRrBeYvJLKQ7MjtFxRn1ckiwj7S/TRvrJT46ZbET3u8yCk7+cVJb
	cMPdjKZt6VuHDtexJvO4kvZGNe/C7NdoEnu4/aLSac028h0aSOi5vnSfJqEby3Pz14voPThaVo8dg
	7yX59GxEKVSC9I699Hom/ch7xYv0iNIB1tfOHzlAf/+nGQRTm0O/M9psWzGQj03/k4PXeW8b730kd
	fmRfiHTyvBuS1PfFowftfxr31by3k4GDTWEcYw01q0n3EoxH0xfttCKGnwliRYZsgVZL2o3+Z4jbN
	ZIjpHZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Edd-00000007VBA-09xQ;
	Tue, 22 Apr 2025 14:30:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DUd-00000007GDr-3SRd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A7BC5C1663;
	Tue, 22 Apr 2025 13:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DA4C4CEE9;
	Tue, 22 Apr 2025 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745327814;
	bh=MaJ0KTg/lw0pHF0ohqvoSddCrFkNPCpBd88fRNl46XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAJea8G4oPFWYT8hcX0maNisJFXdrKSRypNi9ek8uiUpa+jQ1U1QUK9arCktKIWrK
	 wDybn5eV7MX/ZUOlyNyRBXV998KFToGVmsBRnZHhjaSnq6f5ZJrGZA9TxYNx8tEiAB
	 yGUV3IiuFvw9kF8AixCwDPoOFPtS8j7nccmXNc0o=
Date: Tue, 22 Apr 2025 15:16:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: zynqmp_nvmem: unbreak driver after cleanup
Message-ID: <2025042243-gladiator-sizable-a69e@gregkh>
References: <20250422130831.2309995-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422130831.2309995-1-peter@korsgaard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_061655_929404_3EAE9F87 
X-CRM114-Status: GOOD (  26.61  )
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

On Tue, Apr 22, 2025 at 03:08:31PM +0200, Peter Korsgaard wrote:
> Commit 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
> changed the driver to expect the device pointer to be passed as the
> "context", but in nvmem the context parameter comes from nvmem_config.priv
> which is never set - Leading to null pointer exceptions when the device is
> accessed.
> 
> Fixes: 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  drivers/nvmem/zynqmp_nvmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
> index 8682adaacd692..7da717d6c7faf 100644
> --- a/drivers/nvmem/zynqmp_nvmem.c
> +++ b/drivers/nvmem/zynqmp_nvmem.c
> @@ -213,6 +213,7 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
>  	econfig.word_size = 1;
>  	econfig.size = ZYNQMP_NVMEM_SIZE;
>  	econfig.dev = dev;
> +	econfig.priv = dev;
>  	econfig.add_legacy_fixed_of_cells = true;
>  	econfig.reg_read = zynqmp_nvmem_read;
>  	econfig.reg_write = zynqmp_nvmem_write;
> -- 
> 2.39.5
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

