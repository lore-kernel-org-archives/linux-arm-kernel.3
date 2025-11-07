Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FB9CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oti9k/rI+KGLcQxuCIfcss3xzD2lfgiBuduDCF6Yx6A=; b=jwPL3xdmPsryoNI7NQBjLhrUMy
	NPuhR+ZSbxKs+DFnAvNg3c/RyXAjOjte2I6FIZUI9uynzZj7f8IMc0Wig/aCKSGt5tNox79DF6fw0
	xexxCUeOIsm7NzcXYbLjb3nk+4+5A61Fc4JsaxI1dPMyXvaZjBL1TqaycCWirK+VBLkHOZKVkDhon
	gOzZ+MwH9gMb8RpQvp/hF/jabZRSZXyOKuL9XNVPZKKoVzm+5Ov9tdKBOz6Daz08P0UHu/yJGllpf
	+ZsZU+Br+eUhK0kFisoMUcEgSrL7i+/5rrpOmwlAadsFJY4xwZEEnj8Aam5aUC7ut7SGqaYDcJaP6
	S0up7Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRep-00000000bPo-1aah;
	Fri, 07 Nov 2025 18:57:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRem-00000000bP9-3tP5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 18:57:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 938B043B17;
	Fri,  7 Nov 2025 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F21C4CEF7;
	Fri,  7 Nov 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762541876;
	bh=awyUGs0rpGKlK7qoN/xReG7QUF+ghsD5p1upAxbLLfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niFj0L834blAvhm55fQPakks8soCRt7CHIzJIc542uN43IJeRL454mVe5C+CZJepI
	 7tAN/u4arc4YprsEUil1ybJGs99xRtr/syqXiAzuw/0l34OTTHWOATCNtQghR2djAN
	 CDZNx/ByneMMyxPcAN1s2vKIn+A1x0ToQ6DlGmP8PYJnlQ/TjSvGJ6MWkQTqAME3eS
	 LvJqFIHS4aDvw79At5RlkbtzdnXBBIVjzz2wYtro3LSSTADp/084X4ys+0cJFjds5u
	 t7DwcSBllmJ4tLjrav9C5vU8iyx+Yw9lE0N5FTTeIf4C8sgnWu0pKWRhAtwD8joFLW
	 tdQowzW7c58Tg==
Date: Fri, 7 Nov 2025 10:57:54 -0800
From: Oliver Upton <oupton@kernel.org>
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	yangyccccc@gmail.com, prime.zeng@hisilicon.com, xuwei5@huawei.com
Subject: Re: [PATCH v7 0/7] Add support for FEAT_{LS64, LS64_V} and related
 tests
Message-ID: <aQ5BMo8FuQQGEM43@kernel.org>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107072127.448953-1-wangzhou1@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_105757_191014_45D35E06 
X-CRM114-Status: GOOD (  14.00  )
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

On Fri, Nov 07, 2025 at 03:21:20PM +0800, Zhou Wang wrote:
> Armv8.7 introduces single-copy atomic 64-byte loads and stores
> instructions and its variants named under FEAT_{LS64, LS64_V}.
> Add support for Armv8.7 FEAT_{LS64, LS64_V}:
> - Add identifying and enabling in the cpufeature list
> - Expose the support of these features to userspace through HWCAP3 and cpuinfo
> - Add related hwcap test
> - Handle the trap of unsupported memory (normal/uncacheable) access in a VM
> 
> A real scenario for this feature is that the userspace driver can make use of
> this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
> directly into the hardware.
> 
> Picked Marc's 2 patches form [1] for handling the LS64 trap in a VM on emulated
> MMIO and the introduce of KVM_EXIT_ARM_LDST64B.

Besides the ordering issue the KVM bits of this look fine to me. If
these patches go through the kvmarm tree then I'd be happy to fix that
up when applying.

Will / Catalin, any preferences on which tree this goes in? If you guys
take it:

Acked-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver 

