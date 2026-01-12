Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC86C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMnk2nrwaBQSLtVwuvjNTQsDRNVJoNxtkl+t1xXaVJg=; b=Yzrmb1DZ1jmnrV8pwNC1ERhBAW
	7PR+Ax7r1JCsTPHLwr7dnd5aDmooNkHRodIIyY7/xvVW1St2c88YLeM1NLEsLJSm6J8khYcYn7grO
	fSucPEezY1eY9B07hWFI+Wy4Iq/3cyKq1+0qy8xExbUPM8Ya5TjnuNh7KQhDKRLOih3LyjAE98Ebe
	IpnMAooEfiQzXeOT9lBSTjLMMvl388AsVA/1b4ZkOyt5Ox7RJmY5NpDGSiDZHBWD9FE37oJYG0KZd
	8ifv6bjNGdQiPsflhUNNn9AJ00t/WKDWC9bEOA4o9d/M/0yHQSc6+5TmecjiepFZFx6oAPFaTK8DK
	35QxDjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJAJ-00000005YoP-0U1w;
	Mon, 12 Jan 2026 14:45:07 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJAG-00000005YnQ-04c5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:45:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vMnk2nrwaBQSLtVwuvjNTQsDRNVJoNxtkl+t1xXaVJg=;
	b=jiHuwV+SzxDsOQWNeyZNje1+9aHNrJNLTQJEJ4mqXMshZ+h7XxymWNC4kgMjpTG985x00TI89
	HTA5KX9uLSTmZ+E8iLFye8iQ5NOjaEQM83Fv1Kxm0EwBpDCL3tVtOHizYfu8u1OAUz14/hcuYil
	XovRTzfDuACht55m71ScaHw=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dqZpz5HTZz1vny8;
	Mon, 12 Jan 2026 22:42:35 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqZsJ4XlxzJ467H;
	Mon, 12 Jan 2026 22:44:36 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2884D40539;
	Mon, 12 Jan 2026 22:44:48 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:44:47 +0000
Date: Mon, 12 Jan 2026 14:44:46 +0000
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
Subject: Re: [PATCH v3 08/36] KVM: arm64: gic: Introduce interrupt type
 helpers
Message-ID: <20260112144446.000064d1@huawei.com>
In-Reply-To: <20260109170400.1585048-9-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-9-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_064504_325998_B2C60AB3 
X-CRM114-Status: GOOD (  12.70  )
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

On Fri, 9 Jan 2026 17:04:41 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> GICv5 has moved from using interrupt ranges for different interrupt
> types to using some of the upper bits of the interrupt ID to denote
> the interrupt type. This is not compatible with older GICs (which rely
> on ranges of interrupts to determine the type), and hence a set of
> helpers is introduced. These helpers take a struct kvm*, and use the
> vgic model to determine how to interpret the interrupt ID.
> 
> Helpers are introduced for PPIs, SPIs, and LPIs. Additionally, a
> helper is introduced to determine if an interrupt is private - SGIs
> and PPIs for older GICs, and PPIs only for GICv5.
> 
> The helpers are plumbed into the core vgic code, as well as the Arch
> Timer and PMU code.
> 
> There should be no functional changes as part of this change.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



