Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DCBC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K40ZyQM9+usg8Y0FdFcajeZUMCknmbywY/glNwoMErQ=; b=C+6VkxXXb6uuhX6MiZgjbs/YwE
	VZL1a1EGuAXqV7rYmD8oQ1hmhLzQrWAO0LFXEQfvE0xu+8v8PGGTIp0GFHELo2DpWg4ediCOkJfF7
	nuBxPUmVrK9ccpEreGxbHJEIJtQwPzEcFDiCthnb76hxGJhitrsF+K1R303hMoD1MZQr39West/Ph
	xA2DSGvswX0LG9jXY/xRugvEizIYCUS6Hv/epHLTXE3XnCk542ZXPULwQObuVlwjiv/mMir4ca4kQ
	l+tSz+JuF7aGXKSubKL49nWS3m1e3YyrWzKeBQNssfbdhlUKnCJOF5/0r1IfZlsShmXKPcEwBgOqe
	RNdT8WwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2JF-00000007YGc-2PhU;
	Tue, 10 Jun 2025 16:58:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzUo-000000073ky-3Sfq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39EAF4A7E8;
	Tue, 10 Jun 2025 13:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA625C4CEED;
	Tue, 10 Jun 2025 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749563914;
	bh=DcjHkaAwZrvC9iqm3h/N+EYehYOf07x5o+lB32uAnwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rL4KmZZvWURDpVuaJDuWrMYU7W0dL4ezE5NK6t6+XoRJvPhXKvlkkmuwfMn8AxVmG
	 N66sduGzBqDsDBEsZptl603MIFdS/2uK3tFa+orLcmZM5sEtnF5NTwsvG3ZcEo4n7V
	 RPJu2kIodXLsf04s8mBYFUj4JAETnxVHueckrkzZxEZsyaRvLLOqKUJf5xEtT/F4yP
	 SqOLfIai9IKYWzr3RMTAZEYwmAV1eXgHUGF3xunvyuNavwRM3L7Y2cxaDUvUMhw1aY
	 8hQN8lzQwW8Gqc/B0tSjL6AEZby8DW+5yV2TE3sgdj5HPk1F0/QoM++UeHMqLpZoBM
	 pYL8NrGuf+whg==
Date: Tue, 10 Jun 2025 16:58:30 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Message-ID: <aEg6Bgh8TqzK5nSu@kernel.org>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
 <aEgmhwu1RP27yBpw@kernel.org>
 <aEgwpXXftXW6JNRy@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEgwpXXftXW6JNRy@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_065834_889733_F00528AC 
X-CRM114-Status: GOOD (  19.61  )
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

On Tue, Jun 10, 2025 at 02:18:29PM +0100, Yeoreum Yun wrote:
>   module_ffa_driver(tpm_crb_ffa_driver);

Oops, I missed this statement. Sorry, my bad.

> 
> >
> > >   0000000000000a9c l  .initcall6.init>  ffa_init
> > >
> > > In this situation, the IMA subsystem fails to integrate with the TPM device
> > > because the TPM was not available at the time ima_init() was called.
> > > As a result, you may see the following message in the kernel log:
> > >
> > >   | ima: No TPM chip found, activating TPM-bypass!
> >
> > TPM initializes before IMA, so there should not be a problem.
> 
> If you see my commit message it describes the situation why this happen.
> when crb_acpi_driver_init() is called but before tpm_crb_ffa_init() is
> called, the secure partition doesn't probe. so crb_acpi_driver_init()
> would be failed wiith -EPROBE.

What is "secure partition" and why it doesn't probe at the time of
crb_acpi_driver_init()?

> 
> In this situation, init_ima() which call ima_init() can be called first.
> NOTE, init_ima() is deployed in late_initcall and
> the "deferred_probe device" is tried again in
> deferred_probe late initcall.
> However, even the deferred_probe can be call later then init_ima().
> 
> 000000000000012c l       .initcall7.init>-------0000000000000000 init_ima
> 000000000000016c l       .initcall7.init>-------0000000000000000 deferred_probe_initcall7
> 
> That's why init_ima() is failed to init with TPM when It is deffered.
> 
> Would you let me know why you said it's not a problem?

What has deferred_probe_initcall has to do with this? Not actually
asking just pointing out stuff that you should open up.

> 
> --
> Sincerely,
> Yeoreum Yun

BR, Jarkko

