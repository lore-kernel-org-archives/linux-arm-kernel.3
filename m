Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF3CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQo85MG3wyU15nJBOnccgwY1g6/b71wSOeHZX0glVCQ=; b=nnbkzNSWOirrUg3X3SjY20Pkz3
	0McV2at1k9E2mTSZWD+yEfRJp98hv4UiBmw3cCBahX7UCj2yYGXYgeZgSgFkrndfiHZ+pj8lLChp2
	HLYosiYEKGLibbx3keVO8nca1Nyp6UrbXDoeBAIsNuzq3zn8ZlE8+0E2nNDv5SHSfEh+qsNPp47OP
	qImr7nIwsPgkCyfwdeOgolK/AFT7/bTRovn85xUi9xhnV8+9uRakV2y4RPV4hrllRLBB/LITXy95a
	xbaiisN96Fh25W3JVAw9GYAvT18+0Hee1HUGdpWy1u9aJm+ftUR7HwdIpOdCCD7bi/Cc0CmlwOfBy
	ZqN4/B7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDgd-00000000x64-0dJg;
	Mon, 28 Sep 2026 15:54:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDgb-00000000x5Z-33UG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:54:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2103C407DA;
	Mon, 28 Sep 2026 15:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93281F00899;
	Mon, 28 Sep 2026 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790610877;
	bh=sQo85MG3wyU15nJBOnccgwY1g6/b71wSOeHZX0glVCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EUzQVflNxx2xlAMFvK9LtMnYf1JF6PHS0LxGgnNYv71HTDC912f5UeQTlMnHcfXm9
	 PIhsaN3KsOHCYuewbTYdbEwssXqESYM9dpZrbbFpJP6DQfW0CiTCqDbbt6Z0PNoQAG
	 8A+B+zmUb+9DOgbOi/0NFEh926QoQfEtMFWISDOeXvGgjvZ6J80VSIcAUtHGFzLlsU
	 EwjCeWs9Qrwrylo1O/AofcPiFLz8rRcmLjHEMLmP50TfQRi3I3NZuyxa7D9yrSGOrR
	 67SiLU5pvKHj0iTiSgAWbyUfMxQ3OwN2wp5yy5PMnFXgbYvMV6zguU2bWz3RGs1eU5
	 ZxvEgUzI/S3+w==
Date: Mon, 28 Sep 2026 08:54:35 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/10] KVM: arm64: Don't WARN on SMCCC filter reserved
 range allocation failure
Message-ID: <arqNu0rSxIz4-Mue@kernel.org>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928152507.2116110-2-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Sep 28, 2026 at 04:24:58PM +0100, Fuad Tabba wrote:
> The first time userspace sets an SMCCC filter, kvm_smccc_set_filter()
> inserts the reserved architecture ranges into the maple tree and WARNs
> if that fails. The tree is empty and config_lock is held, so the only
> way it can fail is -ENOMEM. The allocation is GFP_KERNEL_ACCOUNT, so a
> memory cgroup limit is enough to hit the WARN from userspace.
> 
> The WARN goes back to when the ranges were inserted at VM creation and
> the error was dropped. Since commit d34b76489ea0c ("KVM: arm64: Only
> insert reserved ranges when SMCCC filter is used") the tree is emptied
> on failure and the error reaches userspace. Drop the WARN.

Eh, the warn is still useful. You could potentially add a check for
-ENOMEM but any other return value is a sign of something wrong in
KVM.

Thanks,
Oliver

