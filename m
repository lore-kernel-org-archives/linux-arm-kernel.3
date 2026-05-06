Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F861CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/8HlxCQO1jMW2sqXnUOp/xlKxHnm8r051Vt5gv1hKQ=; b=pzGvxhf5aZc7F22dXmhSXADxc9
	C1GT+k4ftd61UuVGBn9q8HRD/lhG0Wt+OmnLsIew7QBJWOsHxh53PF62QBDsnGhLSliYcRBmqRSL0
	C0VpnohWcN3Aciollha2YEykCJ1KX/aOuRmFLj2cusDW33jlKq5f5npJPE+wm3234aUDgZgjyDYcg
	k5lqEHNdwDW1KlazU6GMp5uSHvw/qmtnVF258RNLKV7JgaJcpxemjdZrCfepRgI3S5jIdw8Qyl3Zt
	3SenCsVhVZcFPmDsFfJEOc97ryWRG5o7UqXz5UXefgK2Lt2VmnyQHYv1BvDHI+x+Nkyn4LUf7Y/pF
	T+lS6E7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXP0-0000000088l-0lVI;
	Wed, 06 May 2026 08:14:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXOy-00000000887-49I2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F48143595;
	Wed,  6 May 2026 08:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94822C2BCC9;
	Wed,  6 May 2026 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778055280;
	bh=7Lic6fZQegZG6YVItAhYwyATUQXw9Th9iYZShZ0NxE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jUZL+oxg1qJnVnVjPspD+OANvkZ+akUJ6dnyw/wLGEU7Rm440h74KG4YelYCITc8p
	 cSe1j2cKSwzfRi4FBy4LVwxX26E18nh4QdcJFVPoej00IaD37gZOIKsccwTvr9+vRv
	 TpTdIs/V0VtWfS77nIgZDR8FYSkRCaYhqte1Dy8xPwb8PLKM3RIMp25dKN+wMsAeo1
	 EQGTh9RAzvBlTOa1GT3UmX9WgTPLMFnmK3XHVlfY6Zoy0zoHnvOlGNFo+0b1XKQRZ6
	 KwKwM33YvXtajHtLFjzpCGKjcMV55pCh4fRz7/+EGPfj5v9s1KT0FImJMEJ/P5XvEw
	 Q2zP9L1hASzVQ==
Date: Wed, 6 May 2026 09:14:34 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 2/3] firmware: arm_ffa: initialise ff-a after
 finalising pKVM initialisation
Message-ID: <20260506-colossal-bee-of-discussion-08ac76@sudeepholla>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-3-yeoreum.yun@arm.com>
 <20260505-super-gecko-of-argument-655030@sudeepholla>
 <afoHizU8NgFWzvYW@e129823.arm.com>
 <20260505-adaptable-mussel-of-virtuosity-2751db@sudeepholla>
 <afohuFhVBIyUFEMT@e129823.arm.com>
 <20260506-warm-deer-of-energy-522bfa@sudeepholla>
 <afrygFx4OoCbbr+a@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afrygFx4OoCbbr+a@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_011441_046975_93A11DFE 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 06, 2026 at 08:49:20AM +0100, Yeoreum Yun wrote:
> Hi,
> 
> I mean like DT node, it seems to add some "FF-A" device for this.
> Anyway, right now as your suggestion, let me respin with platform device
> again.
> 

Please check my branch ffa_plat_dev [1] as I noted in the last email.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/l/ffa_plat_dev

