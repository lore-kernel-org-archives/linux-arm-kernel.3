Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8490CEFCEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ul/5td8H1T0x+QBQqzJlZ3+F27WPL+8FDqm/WVZypV8=; b=EkjM6ocIXIFJGnjhmr/+Ft4xhi
	9Zhc8g85uM4cNCNpZmP2S66lmYilvk74Rki0CMzefyGbwbk5aw/fAQypaIN4STmMTI3+D6s3ADML0
	kcB8FgnGnREFsEMOMmUSNjW8J5shfm4uLGiHo5OJi2UbxunwyB5qBSgc1yeW/aVKAZ3CBt3IaTdPU
	W4owxu1r8Z8rWU8CjDp+WvJV3l9AwqecMMOVHH4saR0F5Uog7zrFA8lLqoZgLOl46riUgPyRiGJNW
	gRz9WLuxOenTbfsAvQQr12oVxJ7+E1Xp3j9vF2sDYyAwNAFanudGk7Si0rNpKtcaSsJJaOWzJU8Nv
	avN8dm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBtA-0000000DgpY-2DSA;
	Tue, 06 Jan 2026 18:34:40 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBt7-0000000Dgoo-0isq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:34:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ul/5td8H1T0x+QBQqzJlZ3+F27WPL+8FDqm/WVZypV8=;
	b=2KSl/TJPDX29+8svmEC66f04S29aghk7Uv7DbwFp8cwfR1wWv1La8ecfxy0KA/dO5BYh3JBMr
	nZKZufxv6O+oKUdlwZOeVW0uNjHALJCwMYXspV6xhQHSJtfyxDv6gdVagjz2YrtQERtIb/Rm45Q
	lpH3EQ7YXW3xaD+rIuOiN3k=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dm0Bw1ty3z1vnHR;
	Wed,  7 Jan 2026 02:32:24 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dm0FJ3m2PzJ46bL;
	Wed,  7 Jan 2026 02:34:28 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 758FA40565;
	Wed,  7 Jan 2026 02:34:30 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 18:34:29 +0000
Date: Tue, 6 Jan 2026 18:34:28 +0000
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
Subject: Re: [PATCH v2 09/36] KVM: arm64: gic-v5: Detect implemented PPIs on
 boot
Message-ID: <20260106183428.0000346b@huawei.com>
In-Reply-To: <20251219155222.1383109-10-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-10-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_103437_437918_B77B2E81 
X-CRM114-Status: GOOD (  10.41  )
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

On Fri, 19 Dec 2025 15:52:38 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> It is expected that most GICv5 implementations will only implement a
> subset of the PPIs. GICv5 supports up to 128 PPIs in total, where the
> first 64 are architecturally defined, and the second 64 are
> implementation defined. This limitation applies to both physical and
> virtual PPIs as the same set is implemented in each case, and
> therefore KVM needs to determine a mask of implemented PPIs during
> early KVM init.
> 
> The check involves writing all of the ICH_PPI_ENABLERx_EL2 bits and
> reading those back again to determine which are stateful. If the bits
> are stateful, the PPIs are implemented. Else, they are not.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


