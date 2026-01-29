Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DA5D61011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yO3/auPzmp7ReB1QnPMWLdhH/pZKTIU/CYkFbUdLmUE=; b=yH31D4HuaabyQTuXuaNUBcuLmh
	AH0I9ppudVytgVLXb6TPP2hn/UcdMjRFvAJRd3YFRnuKEI/xOenQWKLp1OGIT1QVY1GwKILEFJV4l
	0U4h+0o5b6+zMbj07L98RkGV04zdUJ7nB/moOTdk5s+a4QkO7SZgvx6llJmCfgFZyMSosPCRZ4qlE
	/uhFVAU0IWJ7TJz7MDRz+pfMzvJgIt6bx5FGWj+FiqnQ+RpmB+t7/+NlPh2zeUUiU8LUfmr+Wobw0
	OZjn4p4GKmfpFMy02wvbqZIMhXgxUZllHfty2ItrMcycN9lkB1VU3a3H6p0WB9mVVD5kn061vij9y
	v+6oYmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlR5d-000000006c9-0L0C;
	Thu, 29 Jan 2026 12:25:37 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlR5a-000000006bk-2FSr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:25:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yO3/auPzmp7ReB1QnPMWLdhH/pZKTIU/CYkFbUdLmUE=;
	b=ViHzBtXwU5EOIYFIkOPA05+owiF//mmrmP1BYmKw0DM1FLVapAJxlTqV9B0DkdISfFagDj95F
	7baaD+YkRydIaaRkvaXUImTJiABrjKe3zRC01Maqm2zoXeIip4yaSPVUwxcULRpLcWwmTU56Qs0
	x1JPdN9kjUzu1P+wSCN32iA=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f1yvw74DlzN0jj;
	Thu, 29 Jan 2026 20:22:52 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f1yxw0zsDzHnGgq;
	Thu, 29 Jan 2026 20:24:36 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 974D140572;
	Thu, 29 Jan 2026 20:25:25 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Jan
 2026 12:25:24 +0000
Date: Thu, 29 Jan 2026 12:25:23 +0000
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
Subject: Re: [PATCH v4 36/36] KVM: arm64: gic-v5: Communicate
 userspace-driveable PPIs via a UAPI
Message-ID: <20260129122523.00004bfd@huawei.com>
In-Reply-To: <20260128175919.3828384-37-sascha.bischoff@arm.com>
References: <20260128175919.3828384-1-sascha.bischoff@arm.com>
	<20260128175919.3828384-37-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_042534_780914_2152B85D 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, 28 Jan 2026 18:08:35 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> GICv5 systems will likely not support the full set of PPIs. The
> presence of any virtual PPI is tied to the presence of the physical
> PPI. Therefore, the available PPIs will be limited by the physical
> host. Userspace cannot drive any PPIs that are not implemented.
> 
> Moreover, it is not desirable to expose all PPIs to the guest in the
> first place, even if they are supported in hardware. Some devices,
> such as the arch timer, are implemented in KVM, and hence those PPIs
> shouldn't be driven by userspace, either.
> 
> Provided a new UAPI:
>   KVM_DEV_ARM_VGIC_GRP_CTRL => KVM_DEV_ARM_VGIC_USERPSPACE_PPIs
> 
> This allows userspace to query which PPIs it is able to drive via
> KVM_IRQ_LINE.
> 
> Additionally, introduce a check in kvm_vm_ioctl_irq_line() to reject
> any PPIs not in the userspace mask.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Seems fine to me, but it's new ABI, so needs some careful review from
others.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



