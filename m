Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC3BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O+WiXa9kFXuOeBJBft4ij8YSOCSBc3nf1MTWy21JB4=; b=WRcCx8z66kP5Iwb02K5fj/AV8J
	em43IRRH77kQpWTbRXY8A1TeA5+G7vwlt2BmaDwZoE/3uPR/wIEd1ta2RRN+cO38qw+ncko0OIk4u
	GRnt7dC1ll5rAKlHAgnGs5m88fplYl2/fb/gSEhO71yuD2fEELJ/yUVoHpXjlQ20wBJLszAQF0bCP
	i9Gl8jCBWd0b/Xl/ct6F+Xl01c5Sjyh0qFO2xY2FkXaQFcxBNWnZw4eC9UwFam2fvUVTqCofEAQ7l
	xaExqu1rizACkRt0XmAVBVeYHXeyFK8nj2hvlHY/mlH4As5nO6fWJt96q+CHhhZNK3cRhww4WX6IQ
	OlURfcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tif-00000006iHM-2QkR;
	Thu, 09 Oct 2025 16:42:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tib-00000006iFX-3xda
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:42:19 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cjFvg6BF6z6L4sv;
	Fri, 10 Oct 2025 00:39:27 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A69671402EA;
	Fri, 10 Oct 2025 00:42:02 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Oct
 2025 17:42:01 +0100
Date: Thu, 9 Oct 2025 17:42:00 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
	<j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>
Subject: Re: [PATCH v3 01/26] irqdomain: Add firmware info reporting
 interface
Message-ID: <20251009174200.0000281c@huawei.com>
In-Reply-To: <20250922082833.2038905-2-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
	<20250922082833.2038905-2-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_094218_128485_CAF8DDDD 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon, 22 Sep 2025 09:28:08 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Allow an irqdomain callback to report firmware-provided information
> that is otherwise not available in a generic way. This is reported
> using a new data structure (struct irq_fwspec_info).
> 
> This callback is optional and the only information that can be
> reported currently is the affinity of an interrupt. However, the
> containing structure is designed to be extensible, allowing other
> potentially relevant information to be reported in the future.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


