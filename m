Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7BCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zt4phFz/3P2PqerqklJwo/5GvFQqRqxISQIg84xRCAA=; b=u/StjkztKxufctiSL6+sLdFd/G
	xeH+dum4JmfOz3pUnn7Sd6JvYXz8O53YeEEzxEX/ey2MGMTw/d4Zh24eLfBKz0E4tgbBFClRW5rHR
	qP0h1sNwDIGWqP9mMCapaEHXcjiDLV0rliC/g08uEQRafQA1DPTIudvZBGfzSpg1ncRyApTHpnK60
	zWgPmGGNUXCZuVJXFRXGAORvGt3ZbEri01Jdf82FBja1zxgr97CM4L75vcK1GnixgvIKhlSGUUSva
	yhdGssGARgcdQnIrR0N0udHbkcUgi+9v/CfgdlV+/4YHUbaHJEYerjB5cNWJMJiZGRVTZftT1beiW
	l05KwPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFXP-00000009KEt-1kaj;
	Wed, 12 Nov 2025 18:25:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFXA-00000009Jse-0UD4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:34 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6BdZ5JZczJ46DR;
	Thu, 13 Nov 2025 02:24:50 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C3491402F1;
	Thu, 13 Nov 2025 02:25:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 12 Nov
 2025 18:25:22 +0000
Date: Wed, 12 Nov 2025 18:25:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
	<j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>, "Alexandru
 Elisei" <alexandru.elisei@arm.com>
Subject: Re: [PATCH v4 16/26] genirq: Allow per-cpu interrupt sharing for
 non-overlapping affinities
Message-ID: <20251112182521.000027ad@huawei.com>
In-Reply-To: <20251020122944.3074811-17-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
	<20251020122944.3074811-17-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102532_355293_A4344FF8 
X-CRM114-Status: GOOD (  12.94  )
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

On Mon, 20 Oct 2025 13:29:33 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Interrupt sharing for percpu-devid interrupts is forbidden, and
> for good reasons. These are interrupts generated *from* a CPU and
> handled by itself (timer, for example). Nobody in their right mind
> would put two devices on the same pin (and if they have, they get to
> keep the pieces...).
> 
> But this also prevents more benign cases, where devices are connected
> to groups of CPUs, and for which the affinities are not overlapping.
> Effectively, the only thing they share is the interrupt number, and
> nothing else.
> 
> Let's tweak the definition of IRQF_SHARED applied to percpu_devid
> interrupts to allow this particular case. This results in extra
> validation at the point of the interrupt being setup and freed,
> as well as a tiny bit of extra complexity for interrupts at handling
> time (to pick the correct irqaction).
> 
> Tested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

