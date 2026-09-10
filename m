Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A523C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBqu5VqU+X7aB+8c5EeB4WIxVldGwxAwHMHbFNnCBOI=; b=XUF/zdr8N9OzVJZJlRYdrfybV+
	abjIg/TX59PGLsmXdIFHflceSoJdYEcxMve7HA5oydckNHqqbADcMzIntm9bDP5dWAA6TUXhCZRqL
	9URtiRxt/FaczJfXH6wqj5Srb61ycui9687EdgCa+cs3LEKWiepmN1GVV07BXJ2WXnimmcMUB5WuR
	An7tN881X/NtqsNGHnMat5blkpjEBhI7PS2QQX9AOKr5x0AjN8T4lqKyoVK/95TO5zJd3Q9KdYIRC
	mGjls+lAgOlsMnjlVrU3sRgwk9FjQK6oYjL8CMyoi1ic9gG91L6N1yO3uJJBhzgI18sxn/XVdcta2
	o9quOTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQV-0000000EZOW-0tvs;
	Thu, 10 Sep 2026 14:06:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQS-0000000EZM3-05xM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:06:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C35B940102;
	Thu, 10 Sep 2026 14:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724A81F000FF;
	Thu, 10 Sep 2026 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049211;
	bh=CBqu5VqU+X7aB+8c5EeB4WIxVldGwxAwHMHbFNnCBOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k+OhKHMjvkpwfk9wSOyKmv6Z+oyVQipOnoqJhhShlmbZqLluZUAa19j0d/WXM+Xhx
	 Bg9zv76j7tpgWZfTX/LVpjMbWEAFG74APsmo3Aoc+3D6aCEMepvoXgajNX/qmeXIpz
	 nbfRhJx8z7nySUq2weHJVtF5FLVlW6PnPVfxXybMzroCQfPtQsNrsSDUiM1SOKjTY5
	 KaZ2e+jzxCYDMH1PBDVP9kg2X9Bq895+fVDrGLbO92Yon4RKmoZudD363uT73XzHaZ
	 /M9zMXs0VxgsgRbTupQwqtq1k2IqaumkRuH549jPJKL/laolSC0FdqyjRHh/e5S5nW
	 /1bzpuWEFo8Ww==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>, 
 Alex Bereza <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
Message-Id: <178904920902.109109.8238525405953023415.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:49 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 17 Aug 2026 11:23:55 +0200, Alex Bereza wrote:
> xilinx_dma_alloc_chan_resources() builds a static ring of hardware
> buffer descriptors once and the driver uses this ring throughout the
> lifetime of a channel. This requires the allocation order of hardware
> buffer descriptors from chan->free_seg_list to stay in sync with the
> hardware buffer descriptor ring built at channel allocation time by
> returning oldest descriptors to chan->free_seg_list first.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
      commit: cee9c863ee68cb27d66745eb03f60e357f4f8ad2

Best regards,
-- 
~Vinod



