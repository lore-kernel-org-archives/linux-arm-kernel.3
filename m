Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64348C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha9LLQG1ctYaUnh+KJBwsvLh8iHyjbB8c3vr8YZ9ipY=; b=uGgR7M6JP5la0XR9rbSZDEPdGZ
	pJgngSdO2qzYSab4b2ial+Lz+FVgNFj0whkTaHJNTWY05C2LzzSKWoLD69pIl9lM+Fs4OedCXQHXd
	XH5vLhD5y4w7maiTyNcg+UAtd8bW7zx5Db1QLYM4DanUrZjyS8bh0QcouaKx55GmKJbbO2W+fsWt0
	f5ALIhM8so0WXMkokJ1yYLN12qIkBE/6DlPzWNV/KifDlCehURGm9WSU0OJzfFRCPq7axl2o8/fO8
	Lxr/pxK35aCouv3YvdmDHrTjNlcAMF6rCHqYJlP8/P7ANrkszlFeBKGWNaCPRdujjYlx0fNQ41m7w
	2ZUDNB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwfX-00000005h2Q-2UFn;
	Thu, 06 Aug 2026 11:53:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwfW-00000005h23-2Ul3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:53:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EF0340739;
	Thu,  6 Aug 2026 11:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D211F000E9;
	Thu,  6 Aug 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786017229;
	bh=Ha9LLQG1ctYaUnh+KJBwsvLh8iHyjbB8c3vr8YZ9ipY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNkfoXMZcZHCu2ZfT6ItuDYzqtpkX8eie7e5teFukbHUWm3LLo7KnuwGS2cRytXQp
	 wJcwXIYRevuo9dlvME3LVxYFlVu0GysdkHvjYU5DZ/JOmn/8kLD6g/ej6vXMQCT313
	 V9IakhR+Wrbue9AdLR8PeIL3k9PrbI5nVhq8cS8Xy8lXviNVMPz45a8d4MSDvy7fXU
	 nOlp0bTKjcnBf7TsGfsHkstxHkTvsQaLgsDHFqCSRJIMfI6XSnczkKn0ncLYZieKBf
	 7X2vGsn+wtPnzLlscpTsz5jHklLp78zmLuUzlI2DzjlIHEYKM4Edw0m2Q/K79FdLls
	 O2/TnQ9Iid+vQ==
Date: Thu, 6 Aug 2026 12:53:41 +0100
From: Will Deacon <will@kernel.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 2/6] firmware: arm_rmm: Add wrappers for direct RMI calls
Message-ID: <anR1xZrKkrsJhrGe@willie-the-truck>
References: <20260715142739.80398-1-steven.price@arm.com>
 <20260715142739.80398-3-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715142739.80398-3-steven.price@arm.com>
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

On Wed, Jul 15, 2026 at 03:27:33PM +0100, Steven Price wrote:
> The wrappers make the call sites easier to read and deal with the
> boilerplate of handling the error codes from the RMM.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v14:
>  * Update to RMM v2.0-bet2 spec.
>  * Move SRO related wrappers to a later patch due to dependencies.
>  * Common wrappers are split into include/linux/arm-rmi-cmds.h.
> Changes from v13:
>  * Update to RMM v2.0-bet1 spec including some SRO support (there still
>    some FIXMEs where SRO support is incomplete).
> Changes from v12:
>  * Update to RMM v2.0 specification
> Changes from v8:
>  * Switch from arm_smccc_1_2_smc() to arm_smccc_1_2_invoke() in
>    rmi_rtt_read_entry() for consistency.
> Changes from v7:
>  * Minor renaming of parameters and updated comments
> Changes from v5:
>  * Further improve comments
> Changes from v4:
>  * Improve comments
> Changes from v2:
>  * Make output arguments optional.
>  * Mask RIPAS value rmi_rtt_read_entry()
>  * Drop unused rmi_rtt_get_phys()
> ---
>  arch/arm64/include/asm/rmi_cmds.h | 67 +++++++++++++++++++++++

This doesn't need to be in the arch code. Please work with Aneesh to put
this somewhere else.

Will

