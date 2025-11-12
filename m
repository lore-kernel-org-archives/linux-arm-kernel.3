Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D25ECD343C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRlnzRQ/cTEZKTb5MVyyc4kJvqAdIAv2UleZ/Owqvfw=; b=1M2GG5xmrX6TUmtvcJ6h3LAKHE
	Zvr7hbH43llg5TeHXRKYJ3UTf73ZwFPSqs5oN47QLY61f9kvR7Xh4XxDfG7r83MnSqxMZhmix2Xys
	9vkqjIIX1Dp9Mb20HassQ5Ts56kMEqbo3NWA59dbwvO4ssEjosuRoS4PYc2i9IIoy3/FqqbmOqJdC
	F6LHaTvVx1/1dEFi1F1wkRtaYkISIz4TFJE9th+fZrVlMMU0XfhVgPgVwpgmIHEvr2vE+Ww++DMEW
	U+LjjQV6VOiAN8hwf1NO7IwS5a/QMxHTga1CB6oPw0imUcBw1D4Ux7qPNnoadHnJcnGBWK9TFnE+T
	WevQ1CpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFHg-00000009IWV-1OjV;
	Wed, 12 Nov 2025 18:09:32 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFHd-00000009IVN-24A4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:09:31 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6BHP5PF7zHnGhy;
	Thu, 13 Nov 2025 02:09:05 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 413931402FB;
	Thu, 13 Nov 2025 02:09:25 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 12 Nov
 2025 18:09:24 +0000
Date: Wed, 12 Nov 2025 18:09:20 +0000
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
Subject: Re: [PATCH v4 12/26] genirq: Merge
 irqaction::{dev_id,percpu_dev_id}
Message-ID: <20251112180920.00005312@huawei.com>
In-Reply-To: <20251020122944.3074811-13-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
	<20251020122944.3074811-13-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_100929_678884_CE8B3DFB 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, 20 Oct 2025 13:29:29 +0100
Marc Zyngier <maz@kernel.org> wrote:

> When irqaction::percpu_dev_id was introduced, it was hoped that it
> could be part of an anonymous union with dev_id, as the two fields
> are mutually exclusive.
> 
> However, toolchains used at the time were often showing terrible
> support for anonymous unions, breaking the build on a number of
> architectures. It was therefore decided to keep the two fields separate
> and address this down the line.
> 
> 14 years later, the compiler dark age is over, and there is universal
> support for anonymous unions. Let's get a whole pointer back that can
> immediately be spent on something else.
> 
> Tested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
I'm glad I either never saw that anon union problem or have blanked it from
my mind.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

