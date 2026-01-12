Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5EEC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvao/Mc/KX8gqqLCEFSct91Cw25CNVSIk9+88TFlij0=; b=nzno2Jtv3Gfv7ULG8/NsCHDVuF
	sVkntfeVLfo7nvQb/6hWL/ITkByD1l1EaXk9NYotpayU2g3yuDFGTLTrcXOWPacffFTI2LNpmxX0p
	ILVYE9Gk+M2Ku4SvmDYyO7nw6/AhYOEeR7526jZFixkwq+NCCwnpPZGqu3XSdmWB3epPwk4cKmOtK
	+YXwx0DHP84p6b03MPNkt/7q+GXx7nNsUOYOuCHlRhuTweBU6gbQVr+B2Z3f5SkrQz++3Z1G19/+O
	qkQd8V7T1tueWQLL2nEyIJRDeJdmxLfmSYEgwIa7JFk5A5KC7VWrXKGhqNOz2hfpw9QIrC3Qnd46L
	1yRDA16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKbB-00000005i3e-2ZLs;
	Mon, 12 Jan 2026 16:17:00 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKb9-00000005i2R-27Pb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:16:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hvao/Mc/KX8gqqLCEFSct91Cw25CNVSIk9+88TFlij0=;
	b=rBoRs0VNcKTLbi6JCEHjAPC0JZfyoiQ6rBbq0IC1CqiFp1R47Z702FYMa8D5cijAq+qTYnJYg
	l/tXQAhlLYdd0MXC0It4WhzkcY92FTc5ew2pmxTExnPXH+8K3mlDWql2GNQlxP72oVHoK17CIXU
	Jt8+S92JW8zN3W8khA6kvNM=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqcrv1PK2z1P7cV;
	Tue, 13 Jan 2026 00:14:23 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqcvR4gvPzJ46Dm;
	Tue, 13 Jan 2026 00:16:35 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4600240569;
	Tue, 13 Jan 2026 00:16:47 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 16:16:46 +0000
Date: Mon, 12 Jan 2026 16:16:45 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v3 22/36] KVM: arm64: gic-v5: Trap and mask guest
 ICC_PPI_ENABLERx_EL1 writes
Message-ID: <20260112161645.00001c17@huawei.com>
In-Reply-To: <20260109170400.1585048-23-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-23-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_081655_751668_266EED01 
X-CRM114-Status: GOOD (  14.32  )
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

On Fri, 9 Jan 2026 17:04:46 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> A guest should not be able to detect if a PPI that is not exposed to
> the guest is implemented or not. Avoid the guest enabling any PPIs
> that are not implemented as far as the guest is concerned by trapping
> and masking writes to the two ICC_PPI_ENABLERx_EL1 regisers.

registers

> 
> When a guest writes these registers, the write is masked with the set
> of PPIs actually exposed to the guest, and the state is written back
> to KVM's shadow state. As there is now no way for the guest to change
> the PPI enable state without it being trapped, saving of the PPI
> Enable state is dropped from guest exit.
> 
> Reads for the above registers are not masked. When the guest is
> running and reads from the above registers, it is presented with what
> KVM provides in the ICH_PPI_ENABLERx_EL2 registers, which is the
> masked version of what the guest last wrote.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Seems fine to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



