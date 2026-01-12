Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55732C9EC95
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0QhXSCaxvz44BA0HsV/IQ3kwCARdbhUj53s3V+cfH4=; b=oxW66uAG+F/XXWrsVh9y/ab0g1
	6k6SgKH6HtJkxcK15XIvi4WasbZqXH19FhHQ3TpwDkplAhqGQw5szWMvvsPObeNblK+rCrvkhhQqe
	R8hAerYawMT7xgfnZRSU4SyoIzLfMn7vMTALfTNQBjqYHhrD/fd2v64IGC5AfMoMqP57TNwfwoDhb
	wyrVlFR9HAmRNypGc+txpkRqvrS2umIeSnwlJuXQaaxy29Y6BqPsZ1Ph9CS0hdTovHojDdl3fR9LP
	YSyeEHR7fH08Rt3/DJj9hxBxbJAN5I8xum3BrNtOuy3C7VcqaDHqwrudZ77VKi642eB+upJO7c/LK
	xdf4CtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ2s-00000005XuE-0ntq;
	Mon, 12 Jan 2026 14:37:26 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ2p-00000005XtU-0t5F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:37:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=x0QhXSCaxvz44BA0HsV/IQ3kwCARdbhUj53s3V+cfH4=;
	b=ODq7LQDwD5asnR14b4xgrukojHgVeMiNcxUTB4BPmL2RlzuPp9D5X6Rf7FGsQEF+gLMeF8z8m
	bVcRrDpiuZBpgXFGH3NTi7+lxqlsgWvRk9eNwUTpy611wY4I9+4IuAOMiu5Zy0uRAJrADAFBGtM
	PxRAuOktYFOMPVg0JFaOxe8=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqZf041Xhz1P6jN;
	Mon, 12 Jan 2026 22:34:48 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqZhY11CmzJ467X;
	Mon, 12 Jan 2026 22:37:01 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A20F040086;
	Mon, 12 Jan 2026 22:37:12 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:37:11 +0000
Date: Mon, 12 Jan 2026 14:37:10 +0000
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
Subject: Re: [PATCH v3 06/36] KVM: arm64: gic: Set vgic_model before initing
 private IRQs
Message-ID: <20260112143710.00007f9d@huawei.com>
In-Reply-To: <20260109170400.1585048-7-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-7-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063724_011847_96894A64 
X-CRM114-Status: UNSURE (   8.97  )
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

On Fri, 9 Jan 2026 17:04:40 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Different GIC types require the private IRQs to be initialised
> differently. GICv5 is the culprit as it supports both a different
> number of private IRQs, and all of these are PPIs (there are no
> SGIs). Moreover, as GICv5 uses the top bits of the interrupt ID to
> encode the type, the intid also needs to computed differently.
> 
> Up until now, the GIC model has been set after initialising the
> private IRQs for a VCPU. Move this earlier to ensure that the GIC
> model is available when configuring the private IRQs. While we're at
> it, also move the setting of the in_kernel flag and implementation
> revision to keep them grouped together as before.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

