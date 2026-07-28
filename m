Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DCDC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPcnTH8SGUY2hLYw9g0ZMAYWVqJRrTlT+jvwj9dxDqg=; b=jbXTBmkPnA6NLC7OebnPldFdfY
	bGzWAWLFQ8KfezE5sZyYzWaOR7VPOS4I1+YmBf1fnGjeX2I+WJQGNjlWhm8TMBOUxaxsOYNhZF6DE
	FVUH6KxKq7wsjQKH4m6D1G9C3odD5gvu12YOCTtrFAlKaYiUJL8KdAcPv5+c4j6Pfy1p7OvfkQMHO
	7/ZfkxLQILDajnRDJ9X9IgNekKPb15o2E0PgFsJdLLQQmjsubERIqaC3J7/IaUfFJudp6iCO99j7U
	hEZP6CAcBqgp4Obvfa8fPUNyPfUZGEwBpKKAfoaOfMLKiLh9ZxbyesbkcarO4Yd7O2/Koy/bzYLDK
	2bdB9+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokAm-00000005k3J-2sDJ;
	Tue, 28 Jul 2026 15:56:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokAk-00000005k36-2WKv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:56:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C0D660A5E;
	Tue, 28 Jul 2026 15:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0061F000E9;
	Tue, 28 Jul 2026 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254207;
	bh=wPcnTH8SGUY2hLYw9g0ZMAYWVqJRrTlT+jvwj9dxDqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=og/cvWzHCS8+zZkz21i2RAu7IPk0zZvRO5S9pOtFEp+zCd0tLlZKt4sELAeCtRznQ
	 O/NrTf5cAri4GxoKUKmDpOMPT+wUWCSqdur/f2l4xBPQru6xZS/ke/V52fizZq6thI
	 U2LGFhcPB+GL3/beWadFaQs++be0KKNRoczu8ToQDe8QqHj+TSOBeZKwXr1bkl1GkP
	 e9COWVNErpN13xTTeXcCwaOfWnQL+UHWVH6pV7BElc+S9H/zEegARBVHUDmHpExU/i
	 GKVtlF/2MLKERoPBs5FPqzyiqo2ySQF5WTZMKHTDut8596lvD38QKD5EOsyNx96IzI
	 BrmdADRg+1z4w==
Date: Tue, 28 Jul 2026 16:56:43 +0100
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
Subject: Re: [PATCH 1/2] ACPI/APMT: use platform_device_set_fwnode()
Message-ID: <20260728-energetic-mayfly-of-chivalry-4e89d8@sudeepholla>
References: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
 <20260728-acpi-arm64-pdev-set-fwnode-v1-1-b5aff9b2235a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-acpi-arm64-pdev-set-fwnode-v1-1-b5aff9b2235a@oss.qualcomm.com>
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

On Tue, Jul 28, 2026 at 04:07:16PM +0200, Bartosz Golaszewski wrote:
> Platform devices using the split approach of calling
> platform_device_alloc() and platform_device_add() must not assign the
> firmware nodes manually but use the provided
> platform_device_set_fwnode() function which additionally makes sure we
> track the reference count of the firmware node correctly.
> 
> Replace the manual assignment of the firmware node with a call to
> platform_device_set_fwnode().
> 

I don't see platform_device_set_fwnode() in the upstream tree, is it in
-next ? I didn't see -next tag as well.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/acpi/arm64/apmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
> index bb010f6164e528acd802f65afd80d65a57f5844f..c927e4f08ec2c98137d4e3c64ec1709d672ad9a2 100644
> --- a/drivers/acpi/arm64/apmt.c
> +++ b/drivers/acpi/arm64/apmt.c
> @@ -99,7 +99,7 @@ static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
>  	if (ret)
>  		goto dev_put;
>  
> -	pdev->dev.fwnode = fwnode;
> +	platform_device_set_fwnode(pdev, fwnode);
>  

Assuming platform_device_set_fwnode() does what is needed,

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

