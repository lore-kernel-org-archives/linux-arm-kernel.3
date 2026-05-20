Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF50CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMvBUpEgXSeKRNncOVDBP9O0vPsscPTWuBykm2sSqXM=; b=JkLHxGAWXKfLK2hbnig/2Ls31x
	QzwnBqGOPujhYkol9zycrTmbYXCzyxCpTgPZddmg6FDAo3D3OKdC7mBT2VkOipu1bOEHq2bsYaRnj
	tZil0bphod0DcchY46j5bqNS045GznX7g9gl7iAnJpdzDge53RPO39PdDgn+PMtw0FXUm1FewTWgS
	TqbItHzOKLc/RtNBx0/Sz+2EfNH7ec5J4kshECJoOQpo+ULBZKFzO1Sd8I8JoToEND5n9TTZmelW3
	QhIiw/6GpWtWrrzN4ojaRHzZFo3B2F7LpZhrUoNvUEnV3ob7IwawUxdBizLQIlMiWpwmEBTbPqhPy
	C8457sPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb82-00000003lL7-04Gv;
	Wed, 20 May 2026 07:14:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb7w-00000003lKH-1wrP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3D314042B;
	Wed, 20 May 2026 07:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52111F000E9;
	Wed, 20 May 2026 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261239;
	bh=PMvBUpEgXSeKRNncOVDBP9O0vPsscPTWuBykm2sSqXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=baOEhpPlP87qch1i34tnXPikTwZ14iuIjurWtLg2BhEAknkpBqeLqLcvSJvQpGGuu
	 g2Qz9J1zlkP3vSrG0jmXKSHIkXcPa41Ui1v/TDuTNUqYYeXtfYU9jgECrA+2LkwIpM
	 nR+CAQZ9ryEnYdOIqYPfyfRSdO0Q3eA8j/5gW4PAxWWMs0ylUubPZbQtQ25thAyZhE
	 SNPMYzmk/M+tbBR9JuGqTtEJsMOZJlP65RBV7RxKrvBGT5DJbnZ8ROONzc7myuuHtj
	 l5gDaTAkWWX5z8+bnP+d7xMRgFdHsg2Occ84BR3zs1NEawb/qczW4hVaZ5n0+n5gBW
	 SLCpAzAr8DygQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPb7t-00000004FYd-3Ou3;
	Wed, 20 May 2026 07:13:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic-its: reject restored DTE with out-of-range num_eventid_bits
Date: Wed, 20 May 2026 08:17:09 +0100
Message-ID: <177926141814.52935.2813857161910568316.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519132519.2142458-1-michael.bommarito@gmail.com>
References: <20260517174955.273004-1-michael.bommarito@gmail.com> <20260519132519.2142458-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, michael.bommarito@gmail.com, yaoyuan@linux.alibaba.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_001400_948209_0EFA6577 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, 19 May 2026 09:25:19 -0400, Michael Bommarito wrote:
> Userspace can restore an ITS Device Table Entry whose Size field encodes
> more EventID bits than the virtual ITS supports.  The live MAPD path
> rejects that state, but vgic_its_restore_dte() accepts it and stores the
> out-of-range value in dev->num_eventid_bits.
> 
> Reject restored DTEs with num_eventid_bits > VITS_TYPER_IDBITS before
> allocating the device.  This mirrors the MAPD check and prevents the
> restored state from reaching vgic_its_restore_itt(), where the unchecked
> value can be converted into an oversized scan_its_table() range.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic-its: reject restored DTE with out-of-range num_eventid_bits
      commit: 9ce754ed8e7ab4e3999767ce1505f85c449ccb07

Cheers,

	M.
-- 
Jazz isn't dead. It just smells funny.



