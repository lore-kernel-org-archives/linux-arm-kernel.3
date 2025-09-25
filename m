Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C84CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LhZxcsJZzaCUdS7ADQM0Q3KkktpPY/v0HizTocx5hA=; b=W3+Fp7tE86zSl2dpdf1NH7mRtG
	wXUmd/KOijNhJ6cKCw82KEKia5GQ0FeTP9GXexx1FlPsyKdBZEdnXULf1PDDFVAI6I7KYE+bRAGHr
	uUkHnXs9uhjRLiTYd1E45D1UyOTbYX4ck1dnoh6zjjeuwBnSE0Dwi7LkMLKDwHcsaU1LuCw8B4hrw
	gQkJGSrYPeQTnrVJrVZOiyvO11lQk4vwUvUI63kD/Tk/J1GhFUAIcmOo1gPfXKnqnpe5cVKsfMh0o
	f+HAJTgS/ais8QCg0Ls76cG8H8zHdlJSEl9MWO71zrRk5LNDcOkCkmFrJ/0BmolbWqraO6sh0yLC+
	8Z4UF+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mKu-00000009b4S-0awJ;
	Thu, 25 Sep 2025 13:48:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mKt-00000009b3d-0qzV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A089C605AC;
	Thu, 25 Sep 2025 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE95EC4CEF0;
	Thu, 25 Sep 2025 13:48:36 +0000 (UTC)
Date: Thu, 25 Sep 2025 14:48:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: shechenglong <shechenglong@xfusion.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stone.xulei@xfusion.com,
	chenjialong@xfusion.com, yuxiating@xfusion.com,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] cpu: fix hard lockup triggered by printk calls within
 scheduling context
Message-ID: <aNVIMhQKlBp43iHs@arm.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20250924123247.807-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924123247.807-1-shechenglong@xfusion.com>
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

On Wed, Sep 24, 2025 at 08:32:47PM +0800, shechenglong wrote:
> relocate the printk() calls from spectre_v4_mitigations_off() and
> spectre_v2_mitigations_off() into setup_system_capabilities() function,
> preventing hard lockups that occur when printk() is invoked from scheduler context.
> 
> Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250918064907.1832-1-shechenglong@xfusion.com/
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: shechenglong <shechenglong@xfusion.com>

It looks fine to me. Thanks.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Will, do you want to take this for 6.18? It might be worth a cc stable.
In general it's unlikely to happen unless you keep writing to
/sys/kernel/debug/clear_warn_once.

-- 
Catalin

