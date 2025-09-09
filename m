Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A855CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSTU+fJf1O70Krquo94BQr87mP330EiEN0RcNsxUleY=; b=2SwgWRqUThZF4l8nBJLXy0z6sv
	9fl9u0DcFt82H/ZAR1/jHRxR89saQhaiM7/7meFKFDo8RAOGyDQHZxxGg8KtwDfYBhjmIM+D9fDYq
	7O9D1kGi+9w2fEGUcTV0d/PejKcpTwhwSsH7CanIN6GxnM/COd4x3/i5jQaF94ks7+46nSGPIKAwO
	zHDLWK8aKjwzJ7KqJkxDClzVxQEz3xSdow3HPh+W6I46LOiahOZ4FNXXfl55+QzlUDQf/bBkOIAB4
	N5K4cff9WEF6MY6xcsQ+odftqConAkfV3e0fb5aPriO5FkXodoxcNuUGq9kLr+jjdIGqphGl0Lko8
	Z6th6eCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxAl-00000006yVC-3DW7;
	Tue, 09 Sep 2025 12:10:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvunU-000000062FS-1cys
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:37:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757410674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSTU+fJf1O70Krquo94BQr87mP330EiEN0RcNsxUleY=;
	b=4RZcLOwSb0dmMv7B4YHDkIz+KhtTeqOpwNyLPsmp7bbSbNRkWVJYNJoMRj5EusMidYuTk6
	2Han6ZN0s63gFtEpHK5IyAeeoKpfIXuEenu6Cdi8gsNGnETzKEN5iSRBd+ujNmyMatrLlZ
	z0ofAPcjvu3B/zwbwZBjQRPLBZq0gr7k8IfnV5tOuCYSXDg9uZK+hui0GCmKM3F1gRZX7g
	zXY+kYp0OHaYDucktcGj37sTsWLpi/didas+BztC2AzTLIoXBEGcFxA+yDDOPWcjx2hB0E
	WpUdm4AS/TqIlzOpa0TtjaHzQxiWPKXNQrM1bmc8TVApWcPEymw7SSYFq0f3AA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757410674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSTU+fJf1O70Krquo94BQr87mP330EiEN0RcNsxUleY=;
	b=Bolmjk5CYkbrGuV/Whi0VUccKJmYKPo5FEZxsosf6RGKHWJnsi852ieh0QCDXtOFmCdIyh
	qXIzDCxFMzPrMYDw==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
 <james.clark@linaro.org>
Subject: Re: [PATCH 05/25] irqchip/gic-v3: Add FW info retrieval support
In-Reply-To: <20250908163127.2462948-6-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-6-maz@kernel.org>
Date: Tue, 09 Sep 2025 11:37:53 +0200
Message-ID: <87cy80vudq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_023756_565035_17E6BB39 
X-CRM114-Status: GOOD (  15.54  )
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

On Mon, Sep 08 2025 at 17:31, Marc Zyngier wrote:
> +static int gic_irq_get_info(struct irq_fwspec_info *info)
> +{
> +	struct irq_fwspec *fwspec = &info->fwspec;
> +	const struct cpumask *mask = NULL;
> +
> +	info->flags = 0;
> +	info->affinity = NULL;

:)

> +	/* ACPI is not capable of describing PPI affinity -- yet */
> +	if (!is_of_node(fwspec->fwnode))
> +		goto out;

'goto out' to return 0? Seriously?

> +	/* If the specifier provides an affinity, use it */
> +	if (fwspec->param_count == 4 && fwspec->param[3]) {
> +		struct fwnode_handle *fw;
> +
> +		switch (fwspec->param[0]) {
> +		case 1:			/* PPI */
> +		case 3:			/* EPPI */
> +			break;
> +		default:
> +			goto out;
> +		}
> +
> +		fw = of_node_to_fwnode(of_find_node_by_phandle(fwspec->param[3]));
> +		if (!fw)
> +			goto out;
> +
> +		for (int i = 0; i < gic_data.nr_parts; i++) {
> +			if (gic_data.parts[i].partition_id == fw) {
> +				mask = &gic_data.parts[i].mask;
> +				break;
> +			}
> +		}
> +
> +		if (!mask)
> +			goto out;
> +	} else {
> +		mask = cpu_possible_mask;
> +	}
> +
> +	info->affinity = mask;
> +	info->flags = (IRQ_FWSPEC_INFO_FWSPEC_VALID |
> +		       IRQ_FWSPEC_INFO_AFFINITY_VALID);

It's not really clear to me what the purpose
ofIRQ_FWSPEC_INFO_FWSPEC_VALID is. That firmware spec was handed in by
the caller, so it should be valid no matter what, no? 

Thanks,

        tglx

