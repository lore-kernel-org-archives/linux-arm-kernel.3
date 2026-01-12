Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE589C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9V8kCKH2+7bOq4qa+Cu4KZLBlKGxSHMNWwq6JKqvl4=; b=1/5gsKu5siMO9uS2tiQI0RGBnZ
	NWgWkbxoaOLk2DBhmoROvnSTbb0uyR3780dD14q+I7IVH/MO4lwdz/ZZDjNRMJwD91Z4QUf8l9JSD
	Wl1vvITTgCeaFp+NJaY5JwFDR/jrGRl5B85d0S9ii1YJDvWLGNSDmvjEP65TJfU33HWYdLkO+nNfx
	h7gG8ihwinVEJqTOoPl7ibTxPMPc6kcYtBxgvyylEyQ1yJ4P4t9E2uwd3MvUg0rUj+/WqLyeig+ow
	tBThzIutuPnlAOmy3N5DV7i7Qf2WuvT3gDRz3udWfRC5KHUE9hBhtiNRmXhGEjH6Udnvims34Bd/J
	jbv052VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJCt-00000005ZAy-3T1a;
	Mon, 12 Jan 2026 14:47:47 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJCq-00000005ZAA-1IVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:47:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X9V8kCKH2+7bOq4qa+Cu4KZLBlKGxSHMNWwq6JKqvl4=;
	b=QAiceJv/y+TLuULGewcjmkmVZDv/mEnaE5VwjchiLEVU95VFGbof6QW5mcZ30DEXQHpBloDBZ
	UGz+M8tnMzfI/2kN8OXPhzFmnCngOa7F2Bi0ByOeiqZGDWYKbIzNchXKqJ8exm4v/Uz4ioQk/xN
	X/sYGtRtnU+beWvPfX6bqIQ=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dqZtC4WvTz1vnJM;
	Mon, 12 Jan 2026 22:45:23 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqZwW6qQNzJ467g;
	Mon, 12 Jan 2026 22:47:23 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A3E240086;
	Mon, 12 Jan 2026 22:47:35 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:47:34 +0000
Date: Mon, 12 Jan 2026 14:47:33 +0000
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
Subject: Re: [PATCH v3 11/36] KVM: arm64: gic-v5: Sanitize
 ID_AA64PFR2_EL1.GCIE
Message-ID: <20260112144733.000015a5@huawei.com>
In-Reply-To: <20260109170400.1585048-12-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-12-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_064744_968106_59734BA3 
X-CRM114-Status: GOOD (  11.40  )
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

On Fri, 9 Jan 2026 17:04:42 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Set the guest's view of the GCIE field to IMP when running a GICv5 VM,
> NI otherwise. Reject any writes to the register that try to do
> anything but set GCIE to IMP when running a GICv5 VM.
> 
> As part of this change, we also introduce vgic_is_v5(kvm), in order to
> check if the guest is a GICv5-native VM. We're also required to extend
> vgic_is_v3_compat to check for the actual vgic_model. This has one
> potential issue - if any of the vgic_is_v* checks are used prior to
> setting the vgic_model (that is, before kvm_vgic_create) then
> vgic_model will be set to 0, which can result in a false-positive.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

