Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C015DF54ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6DylKeCYm3VDED+c7LS4O9E/kdD6gkIBVVmWVWmR3I=; b=ppZVJRVu7wO3FzDvyj9p6zbmeX
	OWWfYX3ONCzc/237MbUQKz8a4iAskFmuHKSVmy/hcAH55Li8/Uu3wYzmF+sJKWeGXtC6Zs9jMU0YH
	ALxEJIcd+zrTJgu9o0m+3F314lNvLUGt2wotylxM2bF0tfTdB8UKuWzif6WBKqfE3j/Ybv++f8ibq
	IllLZiU/AeavNiaDxx2PagKDPs3ys+ZzU5nz6tAVd4As95dYrXijL7yRbqNXd29CtUCvig1pHskNT
	Kwt2OorZC7eno5UnZQ4xPVU/xSw3OumtBkdcTGOTp9H5CSgjtmwYPdFy2cTqU0YpX2O8SPIFeBLF4
	7+jhGv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w526D-00000001Zi2-0Ij4;
	Tue, 24 Mar 2026 13:47:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w526C-00000001ZhZ-0K7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 416D26012A;
	Tue, 24 Mar 2026 13:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E28DC2BC87;
	Tue, 24 Mar 2026 13:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360031;
	bh=P7hdlk9agELe0A1qr6nFer12udYaXk1PPxLMDqx39ZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YTPWewIy2XjmxYlPmx78726H6Q3b3o2/K/XUTePzsvwm3uznu6RxSQ9VVOI3XlzOG
	 HsrbKbDCx3m9YmyaD3qdFsMmBHphI8gV8cNWgVIhnQPUqzkVJcCVavloxupaiM3Bm6
	 gr3e0Px4RcxCPcL83D1wX9JJc6dId3W2C4QqzltZ/kcXDNKp3m5fD4ExEn6LR+XdUP
	 PelNtyhfO1qewjmDgvfR6vVAiq3X/L5HZs831H4nzB/UTtvqLpliKm4Brg2uWgVMzM
	 9xAQxVjmsfR7x8Rkzygwl+RYpr/4lCFYaT1TqD0D9iSWCxDdCbIPG8WQDVTWpttBID
	 43LOH87Q4rQ6Q==
Message-ID: <780c1ba3-6639-478e-896f-e35ec059b58c@kernel.org>
Date: Tue, 24 Mar 2026 14:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: Fix potential NULL pointer dereference
 inqe_reset()
To: =?UTF-8?B?5pyq5ZCb?= <1742789905@qq.com>, "qiang.zhao"
 <qiang.zhao@nxp.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
References: <tencent_770FE404794D670E2ACDFA144EFDA35AC305@qq.com>
 <7e0425c2-debe-448a-a5f9-26039de71db5@kernel.org>
 <tencent_89405091B7744EA070AC53E11A3FFA355609@qq.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <tencent_89405091B7744EA070AC53E11A3FFA355609@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

Le 16/03/2026 à 04:28, 未君 a écrit :
> 	
> Vous n’obtenez pas souvent d’e-mail à partir de 1742789905@qq.com. 
> Pourquoi c’est important <https://aka.ms/LearnAboutSenderIdentification>
> 	
> 
> Hi,
> 
> Thank you for the detailed review. You are completely right.
> 
> My commit message was confusing, and returning early in qe_reset() just 
> shifts the NULL pointer dereference to the dependent drivers later on, 
> without actually fixing the root cause.
> 
> To achieve what you suggested ("if qe_immr remap fails, all drivers 
> depending on it don't get probed"), I plan to do the following in the v2 
> patch:
> 
> 1. Change the return type of qe_reset() from `void` to `int`.
> 2. Return `-ENOMEM` if the ioremap() fails.
> 3. Update the callers of qe_reset() (e.g., qe_probe() and other board- 
> specific setup functions) to check this return value. If qe_reset() 
> fails, the callers will abort their initialization/probing, which will 
> properly prevent the child devices from being probed.
> 
> Does this approach sound correct to you? If so, I will prepare and 
> submit the v2 patch accordingly.

Well, it would probably work but is it worth it ?

If the board is already unable to get a few bytes of memory that early 
in the boot process it is unlikely that it will be able to do much more 
work.

Wouldn't it be good enough to just panic() when ioremap() fails, similar 
to what happens when qe_sdma_init() fails, see 
https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/soc/fsl/qe/qe.c#L101

Christophe


