Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933C0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2CX73KxMkAUKZOG9scoWUnfOvZuB22cD+GXmj6Y0kA=; b=GvDF3vgVIJmIjoNdxlygnyS+qG
	gy+dN+uF5L9ZOZpdcgzEI30ht/Jqfk/0+ax13gdbQaRCO0i7CpE3ueyP2j+EaET6d6J91W7NNnu8T
	VFt+Cb6r3lqMQEs1p+iFtJKUnSRiomQ6Ysl1aASZi3ChcvVbp/ANAYfMs3nlaohwJLLe+muAJAoLF
	QieZHHoMCQY5+On9gm1qQ/THfV86Lw9ADtn9EKMkYLSnXmsH0p4zpsUc3J+ah4aSzO11J9p7jDwBE
	S52kf1b5Mj1pn1ChKVMDXq1kkmDzp4qnmRWMRHRS3qrGEJFpiEblFD36eHaydIfDKfVNEs7gLwQb9
	j9zK81xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtvl-00000000Gyw-15QH;
	Mon, 21 Jul 2025 17:04:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtBB-000000009bS-1FeU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 16:15:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFB2D153B;
	Mon, 21 Jul 2025 09:15:45 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351323F66E;
	Mon, 21 Jul 2025 09:15:49 -0700 (PDT)
Date: Mon, 21 Jul 2025 17:15:46 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, arnd@arndb.de,
	wei.liu@kernel.org, romank@linux.microsoft.com,
	mhklinux@outlook.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, maz@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, oliver.upton@linux.dev,
	kvmarm@lists.linux.dev, roypat@amazon.com,
	Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH] arm64: kvm, smccc: Fix vendor uuid
Message-ID: <20250721-proficient-carrot-cockatoo-393ae1@sudeepholla>
References: <20250721130558.50823-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721130558.50823-1-jackabt.amazon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_091553_379354_446692DB 
X-CRM114-Status: GOOD (  14.26  )
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

(I can't see this original patch in my mailbox, got only Marc's response)

On Mon, Jul 21, 2025 at 02:05:58PM +0100, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Commit 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for
> getting hypervisor UUID") replaced the explicit register constants
> with the UUID_INIT macro. However, there is an endian issue, meaning
> the UUID generated and used in the handshake didn't match UUID prior to
> the commit.
> 
> The change in UUID causes the SMCCC vendor handshake to fail with older
> guest kernels, meaning devices such as PTP were not available in the
> guest.
> 
> This patch updates the parameters to the macro to generate a UUID which
> matches the previous value, and re-establish backwards compatibility
> with older guest kernels.
> 

Nice catch. This is result of classic confusion with UUID and GUID especially
coming from Microsoft who tend to use GUID more.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

This also makes me wonder if the initialisation in arch/arm64/hyperv/mshyperv.c
is also wrong or may be that's correct only MS guys can confirm as I couldn't
find the UUID string for that.

-- 
Regards,
Sudeep

