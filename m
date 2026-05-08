Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33242CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qq0mwRm1GR2WoT47NIXkfrb/YNAXhmaBvFwfv7ZIxRg=; b=foLPyIgpJF+/xozpfDyn/g6Qk+
	7W18AIeC/IAY2R4oyqovytUDLdSas6lJcUFTPXvXIQyVWyBnhk9X6N6epxANi/i3iMAl3OoBDtQ9F
	Oyd4jwxVI0JVdFsuCYaULNJncSVno8xuuluNWDjDFeBWbMESlLsvy2AAz0qZoYzn4nJmT+2R6uDDQ
	vFxqg9Sl+lA9NNUazQxrS8iadsSvJqQgaBaP/QzRp91P164XtQhhI4mVo/4YKxUaUa9Nbz6pkFTKW
	wgina0Sf0VO31IXeJ22cOmagod1/izzYWIKQHNW7MsHWDTyYq8rgLNXIxil8eThcaAIGlEvIR+3Gs
	P9sgEgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXt-00000007DvZ-0KVg;
	Fri, 08 May 2026 18:03:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXr-00000007Dv4-3H5T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C5EE60582;
	Fri,  8 May 2026 18:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C58C2BCB0;
	Fri,  8 May 2026 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778263406;
	bh=gRptDwEx5Olggysp2cl05eC94pvp5bXMa6WQd1kwThw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGtIvjj6zgHryWrC2ks3Lhkbk4+4wiCSpEnJK2UiEuxERypT5ko9HdKjUQUgCW4vi
	 DBylH6WdUDGcD+oQygQG/RPKwg1O5exe35O0NeU7t+pT1p0CuqUvYTfwX7XfR9SMJk
	 3UsXtM/c8SNA7heOzR7s5oJkJOSQHroLN3DM4Zoa00zaxsMceEz/5ie0S3EghR7LDf
	 LZS5MCLEKf06jgvRxbBNc1455jDbWbucYAZ/KE5IAPAK+OknRZ7+ItgXg2JvIRFLeH
	 f2aGSUAABO8cE+coElw5mGoKN5gKbOVhQOPBXT+S+LQckVDlkiLWddTfKKnW6cQBa2
	 O/cT9ISfBIqzQ==
Date: Fri, 8 May 2026 19:03:20 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH v3 4/4] Revert "firmware: arm_ffa: Change initcall
 level of ffa_init() to rootfs_initcall"
Message-ID: <20260508-elite-macaw-of-success-efba21@sudeepholla>
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

I have made this part of [1] and intend to take it via arm-soc. I don't
see a strict dependency on 3/4 here and one can test the -next integration
branch. I don't believe IMA/TPM is in arm64 defconfig, so anyone testing
must be aware of all the details.

Please shout if you disagree. TPM revert can go independently IMO.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org/

