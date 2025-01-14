Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F92C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 01:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlD+TguZ+7mTnmUDE7lFh9pEk2fL6Nyhw5XbglJqNV0=; b=DhqksQ1X+PV7R6fDqAN8nPhNsc
	DXjs/DqSFB0j0urJIMZb1lD7fy2jrDr68xbyga8cxmBAWjcNqKQdnPHmwWT3i4avAhlmur8GVRHNB
	NDA2hSHzXPxYEsYgmxke8+H6TuiKOjAF6AJzNavB0V9e+QqHS7/ygbqu6qK287qocofIISp0IB3Pi
	PEN8itWmNA6uT8obgEGbzWjFdsyq48EwgTlWvVs9GFqHkC5/lMXBXtgkf8PCI8yUxn1CV92qfHKz7
	xd4yF+RcMvaSDJR76UPVbz+JbZzg4bxKDlc6HQJLWOtGT7I3fyE31ypK8P24mHwM5IGdsQCZvq+UJ
	ivfdUZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVIB-000000075vL-3rfI;
	Tue, 14 Jan 2025 01:00:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVGx-000000075pS-1XE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 00:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5CA6A40167;
	Tue, 14 Jan 2025 00:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAE1C4CED6;
	Tue, 14 Jan 2025 00:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736816349;
	bh=DhGIJngef3/RTbGhguWBSYVMUpaxs79saEaYmS+Hb4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k0vwox6Fc6mkl0zblXsR/sHbNRMxhVMdNpcWdzh6WTLi2zyJr6E2/xOpiBs6QKbap
	 SfdfiMk93wSPUvcv1iW6S3LLTOlEPtnGF29Bs2e2LqMZsQn++8VEBZTBft093K3w+o
	 sWm/5zMFkHXsyFeYr/v86dcLddlthTSZXgpcMGPgO56DbJTeuAR5leSgEiqkNxOhB1
	 mrP5wiurfLcGkqIofJEeY4vEfz1P2bAcCUnP0GSaaMsNzC+etx43B5yPUJfbkozXvv
	 tuA812nGzcPJ0f4y3KSQbSXb/zvx8LSe+Sal4qnExVt6YK9Jx/6ieJE6nFsCup2TSJ
	 pwPOVf6kblp8A==
Message-ID: <88fb7ad5-e2b3-498d-82d0-cdba8cf50c1b@kernel.org>
Date: Tue, 14 Jan 2025 09:59:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 Niklas Cassel <cassel@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109175427.64384-1-rgallaispou@gmail.com>
 <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
 <Z4EDKUb+hO0ovV2i@x1-carbon>
 <cfecaa65-f6bc-48c1-9295-9bfe18f13db3@kernel.org>
 <261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_165911_467308_14E192F3 
X-CRM114-Status: UNSURE (   6.19  )
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

On 1/14/25 05:28, Raphaël Gallais-Pou wrote:
>> Do you want us to do that cleanup ? (fine with me).
> 
> Regarding the other ata drivers, if you have the patience I can do this 
> in a few weeks.  There is other things on the stove I would like to do.

OK. We will work on this.


-- 
Damien Le Moal
Western Digital Research

