Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F5FCFD65D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKC2PIbTfL1+/Lg5YBUCPNE5yOZPBHZcI8KCohpPjBA=; b=amwl2ZbEweqlSYAlKvn5Axeweb
	nfcO0ZD2OfWWhN7A26egxAhaloNja5hckpAw07z7dlI4wHUgWB6E4hbdpVZCdPGQVXUKYdvToKO+e
	qn5XogP/BbdfftO+/1Cu+NVEIjhygVS1Va6rFbVk0mLZNPG50tAz3L0ZbQ2oHASVekfSMEI1m5muz
	NdShCcnwE/utuHRcr7pt1B9ctoFJ34jj/7wnbA/G7JZZ9ioZCtag8787YR1NG/TOdOtbrnl+wMOuD
	GKbf6ofr/IeCKsC2vFjnh6qnHdAp7RTrHtoxvqWXbad8SYNsHqQEjLpMgbsmos2sP0Ekuu0d8U1uI
	W6KZUWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWMB-0000000FHTO-3PCy;
	Wed, 07 Jan 2026 16:25:59 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWM8-0000000FHRz-2WqE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:25:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GKC2PIbTfL1+/Lg5YBUCPNE5yOZPBHZcI8KCohpPjBA=;
	b=0ja7sbtclUUDZpJAn5WFnmGFr5ZxWTYf8tWulGeNZmLrMssydcJFHCy9cAUclNP9vYLEov6zU
	3dyCHiEH+MNQ4Yw35iKlGoehL0BTl9xCAZ6YQ+vKSjrotsfCBsFyb26CBUsYXv6tSMy6iTittIe
	vq9z7b9BF9OYa0sk/lkDUgU=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmYHL34fYz1P7MX;
	Thu,  8 Jan 2026 00:23:10 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmYKy3sb8zHnGd2;
	Thu,  8 Jan 2026 00:25:26 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 00C5140569;
	Thu,  8 Jan 2026 00:25:33 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 16:25:32 +0000
Date: Wed, 7 Jan 2026 16:25:30 +0000
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
Subject: Re: [PATCH v2 33/36] KVM: arm64: gic-v5: Probe for GICv5 device
Message-ID: <20260107162530.0000263d@huawei.com>
In-Reply-To: <20251219155222.1383109-34-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-34-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082557_538283_41872A15 
X-CRM114-Status: GOOD (  13.90  )
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

On Fri, 19 Dec 2025 15:52:47 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> The basic GICv5 PPI support is now complete. Allow probing for a
> native GICv5 rather than just the legacy support.
> 
> The implementation doesn't support protected VMs with GICv5 at this
> time. Therefore, if KVM has protected mode enabled the native GICv5
> init is skipped, but legacy VMs are allowed if the hardware supports
> it.
> 
> At this stage the GICv5 KVM implementation only supports PPIs, and
> doesn't interact with the host IRS at all. This means that there is no
> need to check how many concurrent VMs or vCPUs per VM are supported by
> the IRS - the PPI support only requires the CPUIF. The support is
> artificially limited to VGIC_V5_MAX_CPUS, i.e. 512, vCPUs per VM.
> 
> With this change it becomes possible to run basic GICv5-based VMs,
> provided that they only use PPIs.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

