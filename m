Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD3C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9TEetWpU/hApYqBOwZrSXIbyk3d0nWuyJATuurRhRY=; b=Vi0ljN6MM2e/qPeMESVFaYTRsK
	91HAStH7jG54760Y6mAZ/RVdDym+0uY8Vy/Uf7AA4H0YmfZJv1Xy5wu9fyw5GYj+JFbew/zOb0JsX
	Fs6dG+LfX0bqt/OKgRkdfTAVwLx1oLGeJFhxSrpeXAM9DY2aUjyhqacEmPy5vSTlb8nDI0r/l6buz
	ozZdt8WwOPp6MyrDT+mH2IN7CUgl7lmkcxyYcE8Ikj9bMZRa+SGzd8Awr0pbDD8jxyCrvOcfRYllq
	UGpkCiCxsMgnXUjkx3cjzV0WpNOXr3JORhmKVBMVzNDS7Ul8r7Q30SmsX5u4A8+0mx9duwwhftmP+
	yUwKA8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokD6-00000005kgr-3Awf;
	Tue, 28 Jul 2026 15:59:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokD5-00000005kgl-28sP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:59:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF7D4600FC;
	Tue, 28 Jul 2026 15:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EB91F00A3D;
	Tue, 28 Jul 2026 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254354;
	bh=w9TEetWpU/hApYqBOwZrSXIbyk3d0nWuyJATuurRhRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEBH5SYKbUcSowGXTXdFAb8c9Z1+mOUqv5tUlyHCFQ/K96HIbRID6vaBDb6ZBXORY
	 8JoIh9lGapcmZ+NWIUgRY3bhJGEtERHqFfNLaPw5EY5RE4ziTWCPiKw7oujVBrk9Ee
	 XL/AJBg1S0c/78pGeuT3ezOwY/oBcYi3N8Tm162/rJMHhoiTTK6+fFGYzSaVhFT0QH
	 /7Iw4E6chCYXExBKlHjN57epslQfE1KnLB3QBJlTlKYJKXcuQOLkRQeOLshx1tkN4X
	 BdC/8VYDRguZzel+az5mSyfQYZfwB7E8R6Wffoh6DfyIKwTCiPc8zyGO8/C8u4pq6a
	 PUiYlb7Wg1Dog==
Date: Tue, 28 Jul 2026 16:59:10 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, brgl@kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ACPI/IORT: use platform_device_set_fwnode()
Message-ID: <20260728-dramatic-famous-chihuahua-cce6a2@sudeepholla>
References: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
 <20260728-acpi-arm64-pdev-set-fwnode-v1-2-b5aff9b2235a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-acpi-arm64-pdev-set-fwnode-v1-2-b5aff9b2235a@oss.qualcomm.com>
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

On Tue, Jul 28, 2026 at 04:07:17PM +0200, Bartosz Golaszewski wrote:
> Platform devices using the split approach of calling
> platform_device_alloc() and platform_device_add() must not assign the
> firmware nodes manually but use the provided
> platform_device_set_fwnode() function which additionally makes sure we
> track the reference count of the firmware node correctly.
> 
> Replace the manual assignment of the firmware node with a call to
> platform_device_set_fwnode().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/acpi/arm64/iort.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 34412cd697d8bdc3654c40ca539ddc695a926a26..1020ac953e428797b5b90bd73c6c6ae35e6fd352 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1992,7 +1992,7 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
>  		goto dev_put;
>  	}
>  
> -	pdev->dev.fwnode = fwnode;
> +	platform_device_set_fwnode(pdev, fwnode);
>  

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

With the condition specified in 1/2. I assume you plan to take it via the
same tree that introduces platform_device_set_fwnode() ?

-- 
Regards,
Sudeep

