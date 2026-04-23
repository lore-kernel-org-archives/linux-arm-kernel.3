Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4F6F9935B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3xd2XqiBxNlbreU/VuLrCZtGlsYoukedwroR313zK0=; b=uzqFHiMk1e6la/cTH4oZ1/jQ0K
	JJVBaqNHUNkFCAvdQXS5nm+haqQpwSeDHw20/ln8zmDGRrIhETCqHfLjWV18euYzw7SsYBMPv0xmX
	CYQZ+sktrXqcAPdHLB0jmWB1kPN6sEN5iDp9HzdNxc0PaOeCgk8Bf9uaeNpKqM5sXyZp9S8Ov/ba3
	bwKWJVc7oxi6pXXgZo1SUB16cQ2yjTHlg3dQq9imGu2i0h2rkRg14wkUUnhepDFcSmVyfAlfum+D0
	ADnvARnEaGUuMJZA+ZmauRZBpR8N0zrixK8F2/EDEQFdWFE2lBbtYRWITXmLbaLmZBazF3hEZF4hO
	av3gn6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq7V-0000000BJlc-3to9;
	Thu, 23 Apr 2026 09:13:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq7T-0000000BJl3-45PF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F03E6001A;
	Thu, 23 Apr 2026 09:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E36FC2BCAF;
	Thu, 23 Apr 2026 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935590;
	bh=I8yq6oDEe4IHbD8yPEv7ivQ6TWif+Z1YOjsoLQles1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQOMP5f0VjHvc+YmGVPGeaieUSfRjE7tm5+nujJeHLGpAPi157n1VwdkekO4Lvu53
	 gnjOw9zdf6fYt2M40uSV7CvZfaQ/weaTj5RGyTKeXgRQDOS+XrYP44ckrZVJHv9hNK
	 0RI/prRi3lzYNFJ8YFTTkjW1c/KknZBLGdFaoJG5Xx655MRuXf6iJEcO1O9bi7ur1/
	 P/Z/VlmG1RtNZChbqrg1DE09zSdKfta2WGH3UjbCBxFYyWbxRVmyTJxIqngTQ8CeGR
	 6N4dHCFtLOGvfo8qfYJMfbn/EAIrcyXsF9IOxNHp/g/7c6nE6lojb0qA8+B6TXdLAc
	 iBDH32pN6SkaQ==
Date: Thu, 23 Apr 2026 10:13:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [RFC PATCH v2 3/4] firmware: arm_ffa: revert ffa_init() initcall
 level to device_initcall
Message-ID: <20260423-rich-caped-seal-b00d07@sudeepholla>
References: <20260422162449.1814615-1-yeoreum.yun@arm.com>
 <20260422162449.1814615-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422162449.1814615-4-yeoreum.yun@arm.com>
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

On Wed, Apr 22, 2026 at 05:24:48PM +0100, Yeoreum Yun wrote:
> commit 0e0546eabcd6 ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall")
> changed the initcall level of ffa_init() to rootfs_initcall to address
> an issue where IMA could not properly recognize the TPM device.
> 
> However, this introduces a problem: pKVM fails to handle any FF-A calls
> because it cannot trap the FFA_VERSION call invoked by ffa_init().
> 
> Since the IMA init function level has been changed to late_initcall_sync,
> there is no longer a need to keep ffa_init() at rootfs_initcall.
> Revert it back to device_initcall.
> 

I prefer you do actual git revert on the original commit for this as well
as the TPM CRM FFA driver explaining how the original idea fails in certain
conditions. Don't add it as separate commit and add fixes tag to the
original commits.

-- 
Regards,
Sudeep

