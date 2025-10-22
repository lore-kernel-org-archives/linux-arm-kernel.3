Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AE5CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bl1UgPMkhwEaYICybWoUa7TNyskUxfyc/bfkXkJcmPs=; b=QgzVaXAAGnngpGPxpF11sRkAlO
	DYqp1huyoE6lM021LrPNz1j7GI0CNwtUXubjzmSoxUvyDyRk33vLhJ4bGRvJ2ybwc3X+M3is8S6So
	lVyoCP30DvO1mPGOJ63bKWIEa7F+G6J9NhWKV7G5x5U9HQ1yy7hsQ7/CydLU7GXhqSCmSROkwWVlt
	MtC3qVBYb6dWY8xT+4IwfWoctxJLilUi8hxK8Ke1OUFb4aqhRkyNAIp+wzGty9KT0V94PLvCJMd7E
	YiIjskz+on1xdikvnvCr3WKIFC2PHnAc1LbYxVbroxz7CkEpp9tJqVsTGWXDTErjLo/F3+GVAWIRR
	tdJLrgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUBV-000000025H4-1vXV;
	Wed, 22 Oct 2025 08:27:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUBQ-000000025FT-02BV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:27:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40D51063;
	Wed, 22 Oct 2025 01:26:49 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93E693F63F;
	Wed, 22 Oct 2025 01:26:56 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:26:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
Message-ID: <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
References: <20251021165212.749372-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021165212.749372-1-a.shimko.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_012700_161830_C5E2F917 
X-CRM114-Status: GOOD (  12.51  )
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

On Tue, Oct 21, 2025 at 07:52:11PM +0300, Artem Shimko wrote:
> Add support for two new sensor unit types introduced in Arm SCMI
> - STATE_BINARY (0x5E): Binary state (1: enabled/on, 0: disabled/off)
> - BYTES_SEC (0x5F): Bytes per second
> 
> These unit types are used for sensors that report binary state information
> and data transfer rate measurements respectively.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> Hello,
> 
> This patch adds definitions for two new sensor unit types that were
> introduced in the Arm System Control and Management Interface (SCMI)
> Specification version 4.0:
>

It is still alpha, we don't add anything into the kernel unless it is
of beta quality. Do you have a use or you are just adding to match the
spec ?

-- 
Regards,
Sudeep

