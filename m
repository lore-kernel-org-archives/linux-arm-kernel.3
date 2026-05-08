Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4BBCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ5bx454+AlaQ01a5y1scMSehnDcv/4PtRpLfFlKr4Q=; b=SzaF70lDPDqHKIbLvfjpoUYCx+
	fvYiJhN+wanRi97mNzBTV0P2gYvA9EdQs3oZHAaiD4ezDtKhAH0fM8gEbBi/99B5FX8MAe7/l4Qfi
	VzR7AvZBiqedNgl0+jSkKi1sALZ23Xl17fLeMxyPcQo9gJAtITflr+CCpwGCKkvaFvLTF8mmNgoEP
	YTzV0NHg/gWkX/G+CGnc0Fm1efppUS6W985DnQOnVfUm8z1yuz/2rgPyZKNBZMdGU4Hx/H93IT0WB
	NdE8xds55KjTMzt8gfDUflQ1PC6PYG+aI1y/PC/q86Nhke9fRr4LiF4iwOVZn2QghuDe4OFYBU6Sh
	NnlrHIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLVT-00000006aUj-2MBe;
	Fri, 08 May 2026 13:44:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLVQ-00000006aUH-3GgW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:44:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E980326BC;
	Fri,  8 May 2026 06:44:33 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D20293F836;
	Fri,  8 May 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778247879; bh=sKvxQrZlnxkP3PVGyMsRfHU0bXPzYb1BLgQ8VEd5a3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iR0Ru+s2ENCD6wmO1QZZpd6dvtbHiaMhYuoLZ2OO+GUuhPfgZreucfHp1vDI5TEKC
	 dpvYmQProh3aspY/KAXE7orRxnHENq4Iu4h0LGh+lJ2N9YPQ4n8pxyaQIfByoyavMC
	 62AOEV6mnqa+0oM/bXn1eocs/0D06jktdDDIc8cM=
Date: Fri, 8 May 2026 14:44:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: fix missing error code when trace ID is
 invalid
Message-ID: <20260508134437.GH3778514@e132581.arm.com>
References: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_064440_856232_5490FE15 
X-CRM114-Status: UNSURE (   8.96  )
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

On Fri, May 08, 2026 at 01:45:35PM +0800, Jie Gan wrote:

[...]

>  	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
> +		ret = -EINVAL;
>  		goto err_path;
> +	}

On the top of this patch, could we do a further improvement?

Move IS_VALID_CS_TRACE_ID() into coresight_path_assign_trace_id() and
return 0 for success and < 0 for failures. As result, callers only
need to check the returned value.

For this patch:

Reviewed-by: Leo Yan <leo.yan@arm.com>

