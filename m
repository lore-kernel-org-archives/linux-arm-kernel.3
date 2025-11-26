Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A979DD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHB4vkGDrnm9OzS2/bZ2/A9766F6Ye2SzUIQSag52ws=; b=G61YsA+cwyqlUKspuejxcXVoay
	sxYzr51rnVQkdPOXggSqM/KK15hMhHStkydBDFVN1mul0LY4i7+VJEJqL8F8s3YoRnEhUC+Oww8Zy
	TGgX+swpqiQGsh0WKICU5Vz7ST+rTbPw1AXuAzpqrrylZZmsA8Swt6cZ1LSiBzk8MfoqUCfrLh3Rz
	3oP6NRFOzFsPLClfCRbVNiXMdWqrdVQenEQta64GO9mrhEtLh8U+d4dpqBx0mWQHeYDWlKkdDtD02
	E+nDDdC56rL7YZpzyKRTDRVxW16VAdOSBhhkkOf+E7zs0Scn7jg/2bUV6p6CZUyz8qK0tW0MC1Ky8
	Il7R5MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEKp-0000000ExNd-07Gr;
	Wed, 26 Nov 2025 12:09:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEKl-0000000ExNI-3kSB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:09:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DDB1168F;
	Wed, 26 Nov 2025 04:09:09 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10E83F73B;
	Wed, 26 Nov 2025 04:09:16 -0800 (PST)
Date: Wed, 26 Nov 2025 12:09:14 +0000
From: Leo Yan <leo.yan@arm.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <20251126120914.GH724103@e132581.arm.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121002350.1166758-1-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_040920_410626_EF371CDF 
X-CRM114-Status: GOOD (  12.46  )
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

On Fri, Nov 21, 2025 at 12:23:50AM +0000, Kuan-Wei Chiu wrote:

[...]

> I noticed this issue while browsing the coresight code after attending
> a technical talk on the subject. This code dates back to the initial
> driver submission over 10 years ago, so I was surprised it hadn't been
> caught earlier. Although I cannot perform runtime testing, the logic
> error seems obvious to me, so I still decided to submit this patch.

I have a question for maintainers.

The ETMv4 architecture specification shows that ETMv4 was released as
a non-confidential module in May 2013 (with the confidential release
even a year earlier). So ETMv4 has been a public IP for more than 12+
years, and ETMv3 has been gradually retired since then.

This fix can still be applied to older kernels, but seems to me that
now might be an appropriate time to consider removing the ETMv3 driver
from the mainline kernel?

Thanks,
Leo

