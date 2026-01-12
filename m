Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73ABCF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbXnMIQGDSMe3CUzyP4d/D+XKUJ3dpEcTHwGfhwklso=; b=CVmhCPnVJ558G3WCn2qYAEiG8y
	5B0ZiSnNlAAc+Df3OmoXgtQeaqXOZpHilEXWjCAsyRJrZCPrhivryb6xgkVMy1imRdgOo9Klr2/DR
	zUwuw1WCq1Om2VbK0ZMfu2hZiLTnxr2XZrmwdbKBU6LYo03xq41bG4NM5YCXQ8dTEO9QQelePoV7o
	+KW3cI2P8L/x3EXz3JdERioveaAFH3Cg8FxayBC+h1xVVEBzaip8gb69MeiPH+4WzU8zVrv9dl0Ed
	Y02YFXTwxQ4WXN37KmRx8Si2CPrEuRrXIAawc3CmdASOP0CLJsgitG13Q6/30vRkEic6GFtbBh8Mc
	cXfAryvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKwN-00000005jle-35ww;
	Mon, 12 Jan 2026 16:38:51 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKwK-00000005jku-1BtA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:38:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IbXnMIQGDSMe3CUzyP4d/D+XKUJ3dpEcTHwGfhwklso=;
	b=gLxAo69jl4k+gFuf0Q2WQdDDe9i2IvGBM3ZzAKN3P7RvuWtwEKi4mYM9STxEN7VRrVLJBqDjB
	+jmAYoy99cnZ2c0gji1n/XiNnn13PJzIDpBgp0zDuiXquRbAsZUtjInpl1TAqCr/Al3zSojdVYX
	u6SXNzYSrFBPHKgdqtHcPn8=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqdL54GfPz1P7hd;
	Tue, 13 Jan 2026 00:36:13 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqdNd6zt7zJ46BR;
	Tue, 13 Jan 2026 00:38:25 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B01B40086;
	Tue, 13 Jan 2026 00:38:37 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 16:38:36 +0000
Date: Mon, 12 Jan 2026 16:38:35 +0000
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
Subject: Re: [PATCH v3 35/36] KVM: arm64: selftests: Introduce a minimal
 GICv5 PPI selftest
Message-ID: <20260112163835.00004b2d@huawei.com>
In-Reply-To: <20260109170400.1585048-36-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-36-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_083848_535167_CAA1777D 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, 9 Jan 2026 17:04:50 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> This basic selftest creates a vgic_v5 device (if supported), and tests
> that one of the PPI interrupts works as expected with a basic
> single-vCPU guest.
> 
> Upon starting, the guest enables interrupts. That means that it is
> initialising all PPIs to have reasonable priorities, but marking them
> as disabled. Then the priority mask in the ICC_PCR_EL1 is set, and
> interrupts are enable in ICC_CR0_EL1. At this stage the guest is able
> to receive interrupts. The architected SW_PPI (64) is enabled and
> KVM_IRQ_LINE ioctl is used to inject the state into the guest.
> 
> The guest's interrupt handler has an explicit WFI in order to ensure
> that the guest skips WFI when there are pending and enabled PPI
> interrupts.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Seems fine to me, but I'm not that familiar with the self test elements, so
hopefully someone who is will review as well.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

