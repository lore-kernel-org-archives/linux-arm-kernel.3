Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD2DCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnQ5/Urqfr9YKuKs/IRps0KCWlkQB4EijjkAqCxsU7k=; b=YjaNaWDSDWRuOOLD72/3Gw4WrE
	BjKdf5lDmwQDDYPXqxICYJcPqcFAMhN2+Kj+gy+7TaLAnJgVQbZrp/UGu/D3otdOsWQpOfpEr8QZ3
	bCUdo7w5+xfhNuAUnloGPYdaMdkHwi7HiPbqqjxbCMgw+uJ44TEL+xRz9ThQHHPowUEfRluDE2hz7
	7tyPY8toNLPYWs/Hfj66xy2EOe/tJoERJkGq//zZpDbtpLA4AGhkxfQn8ToLaje68Fq7G/8tKwWvQ
	31YfkxdAJgaLByQk1XP3WNhc1XRDAxCwiXC6YtQbLCUQWWFzLSP+kZFs5fBvP8BGnJU2d73mv5GiY
	3iWt3qaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBnm-0000000DgBT-2n63;
	Tue, 06 Jan 2026 18:29:06 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBnj-0000000Dg8u-1hj8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:29:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QnQ5/Urqfr9YKuKs/IRps0KCWlkQB4EijjkAqCxsU7k=;
	b=xUjcjuxopIHH3KVTbsSAQv+fomn95qAr/mBFTYBubggILi/UpHWlowPAwKbCbMAMy1+nZj1v8
	7YxDa6W/TEV9Vuw7smgYaO6xqJvF7P3D7wA+zn7jTrDWCRZ/4LbIkwqu3uegLfGToxm3J+hq/3j
	GDOe7QOSu8Jqb6u2uVORjgQ=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dm04K4K35z1vnHl;
	Wed,  7 Jan 2026 02:26:41 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dm06g0FKrzHnH6Y;
	Wed,  7 Jan 2026 02:28:43 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A7D5D4056F;
	Wed,  7 Jan 2026 02:28:47 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 18:28:46 +0000
Date: Tue, 6 Jan 2026 18:28:43 +0000
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
Subject: Re: [PATCH v2 04/36] arm64/sysreg: Add remaining GICv5 ICC_ & ICH_
 sysregs for KVM support
Message-ID: <20260106182843.00001c67@huawei.com>
In-Reply-To: <20251219155222.1383109-5-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-5-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_102903_964752_9C544DA7 
X-CRM114-Status: UNSURE (   7.42  )
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

On Fri, 19 Dec 2025 15:52:37 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Add the GICv5 system registers required to support native GICv5 guests
> with KVM. Many of the GICv5 sysregs have already been added as part of
> the host GICv5 driver, keeping this set relatively small. The
> registers added in this change complete the set by adding those
> required by KVM either directly (ICH_) or indirectly (FGTs for the
> ICC_ sysregs).
> 
> The following system registers and their fields are added:
> 
> 	ICC_APR_EL1
> 	ICC_HPPIR_EL1
> 	ICC_IAFFIDR_EL1
> 	ICH_APR_EL2
> 	ICH_CONTEXTR_EL2
> 	ICH_PPI_ACTIVER<n>_EL2
> 	ICH_PPI_DVI<n>_EL2
> 	ICH_PPI_ENABLER<n>_EL2
> 	ICH_PPI_PENDR<n>_EL2
> 	ICH_PPI_PRIORITYR<n>_EL2
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Matches spec as far as I can spot.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

