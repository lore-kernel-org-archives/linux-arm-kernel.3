Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F521CD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWkI+seuy8dRvV6vNKEAhdpJWsV6CidEWgpPet8p6QY=; b=o57/1snYS9r025DnIIgu+ezLWK
	ob1gv7CWLzFA0WSNnkBmjXA+u9zgMAoXeEPVUhi4Zh/GjwaTScGArWBciqHNyEkUwEtTFMI08IB/d
	REmbaF98qELXRf4hJdLSQ+jYFLitOhGXH0GDFjYQET1YvkLBxkwlutr8AgaEQhv3pg/wPzMo4h4P0
	1Odw1KbCGaZC8ISovyfoN5W3EYtQ13byKelOTziEAKlE2M2KogWV0MCTB/e1A5wd2OQqG0OdZjYMr
	Pse7NsX49rmUGMJ1xhv1rXGv6TvgpUrm0oQisJAalrP1Y9TSYRkj00kVvR73/1Vs6VVO9zKy2gAGB
	jF3e6iFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFcf-00000009M21-1HnW;
	Wed, 12 Nov 2025 18:31:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFcZ-00000009M12-0iRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:31:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6Bm726nbzJ469q;
	Thu, 13 Nov 2025 02:30:31 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F6C61402F5;
	Thu, 13 Nov 2025 02:31:04 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 12 Nov
 2025 18:31:03 +0000
Date: Wed, 12 Nov 2025 18:31:02 +0000
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
Subject: Re: [PATCH v4 18/26] perf: arm_pmu: Request specific affinities for
 percpu NMI/IRQ
Message-ID: <20251112183102.000012bc@huawei.com>
In-Reply-To: <20251020122944.3074811-19-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
	<20251020122944.3074811-19-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_103107_355770_C4117A7C 
X-CRM114-Status: UNSURE (   6.28  )
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

On Mon, 20 Oct 2025 13:29:35 +0100
Marc Zyngier <maz@kernel.org> wrote:

> From: Will Deacon <will@kernel.org>
> 
> Let the PMU driver request both NMI and normal IRQs with an affinity
> mask matching the PMU affinity.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


