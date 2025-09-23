Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0412ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v1QCYzDyy9ylkxjs8ymCgWYzEah0RxSutwmBJOt0XA=; b=yEOUSv5t18gopio2zrPpLbc/RN
	BVq7lpoFgPvC8NOkEC+xRE5Z/4P9W4tOodoXEAYzhgel7wA3oRAVK5R6xwgiqWVE2ER6tTgItrwTD
	4c3kCrkEw4zvJxuFj5oAak+IkL+a9bGaWVbkSo/SpIzWT6W2bQE0IvWNnhAQTvi351cw/fFLa1bom
	AyH8paeFqpJLRYNB3z4bFVmMrqM6xKn7aFG7sHHVXS4ScqlJOCezQYA+wxNwCoJWXnWLdr6nQeEyJ
	afhSLj2h/rQK8YQeLVKyr+jywhx0eOYIXYh07+eHR8dP5fBhn8QruSuyDVGolUTGduOa7L4npzOn0
	UrZz/glA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v111b-0000000D9Ab-2X5S;
	Tue, 23 Sep 2025 11:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v111Y-0000000D99g-20Br
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:17:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8576497;
	Tue, 23 Sep 2025 04:17:22 -0700 (PDT)
Received: from [10.57.6.128] (unknown [10.57.6.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59E223F66E;
	Tue, 23 Sep 2025 04:17:28 -0700 (PDT)
Message-ID: <0339c5cc-20e7-4bfd-829f-6fc91f2c1669@arm.com>
Date: Tue, 23 Sep 2025 12:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/26] coresight: trbe: Convert to new IRQ affinity
 retrieval API
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 James Clark <james.clark@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20250922082833.2038905-1-maz@kernel.org>
 <20250922082833.2038905-8-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250922082833.2038905-8-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_041732_565308_EE79D0D3 
X-CRM114-Status: UNSURE (   8.57  )
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

On 22/09/2025 09:28, Marc Zyngier wrote:
> Now that the relevant interrupt controllers are equipped with
> a callback returning the affinity of per-CPU interrupts, switch
> the TRBE driver over to this new method.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


