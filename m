Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD6CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU9QahE17CHcvOem5UsKxBBxUuQVPCMM9FqgoNv0fUs=; b=VkqLGVcWD4kSJtRCQjAIa13h8q
	0/epqBsxWzDjS1E6WKs4kkaaenaqa/9ZdaOLAY36WVIckOxI/NKVhch8wsIScbXRZQn7AXtmbh3ix
	1ETL3Ql7JtQxkkA+xZjifEPpaz6XZWD2wDdo4h7oWZxWxzM6WKCzytJi2NKT7pBF2JPd1+o7J/P0E
	FgOf7rK1G9at/iG07oDw9XTJ1wzaGHEbglq5tmfXc6ksRxXD3bhF9yARZHEmduvJ9e7Kxb8XtywF3
	BKisWOV/FOPs4+GaDvpZ2SWmZa/VHGnVDVmAjslhPZ+z+/ny5Apx3VQ+jPIHGhkyFV/kvErVoix99
	XfQMEEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYK7-00000008lO1-3Ge7;
	Thu, 11 Jun 2026 05:51:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYK6-00000008lNr-2Rqh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:51:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C5CE4039D;
	Thu, 11 Jun 2026 05:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AE61F0089A;
	Thu, 11 Jun 2026 05:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157086;
	bh=wU9QahE17CHcvOem5UsKxBBxUuQVPCMM9FqgoNv0fUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ltendcq+AAz8Kp/fDbsuB6K+OqKdl/kL2fMiTeZchbhNIhi8K6spbNhLwcnfHj+Gd
	 kxtiVtmL3YdkKr3dwsVJqJgoWQez95r6u8PymmfpHYkxniT/nmwlwf+feqDFXeDsqB
	 aCoW4wrYb+WmUfRIQcw3GeIYHLKw0eRXH2Lp68T++tsDOZSk1ho22cr62N+lYgBySL
	 l44GV9AlHGrn7+T1xASigUXew50l8EX9/F0Jj8cPUnIrSu6Zk4s/d+eeRsBPAY5Jrz
	 g1Zlv2lCGQOypJkhiLSb7kPCkAfkepx0GYqIvyHuGEWX5MesX0mc18xLJlgTDzZ2Hk
	 V5Ef0FcvGOpjg==
From: Vinod Koul <vkoul@kernel.org>
To: okaya@kernel.org, Hungyu Lin <dennylin0707@gmail.com>
Cc: Frank.Li@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260607163119.78717-1-dennylin0707@gmail.com>
References: <20260607163119.78717-1-dennylin0707@gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show
 callbacks
Message-Id: <178115708382.468137.8784208588482548501.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:23 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sun, 07 Jun 2026 16:31:19 +0000, Hungyu Lin wrote:
> Replace sprintf() and strlen() patterns in sysfs show callbacks
> with sysfs_emit().
> 
> sysfs_emit() is the preferred helper for formatting sysfs output
> and simplifies the implementation.
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show callbacks
      commit: 26f926b44dbfc035d5ba0ccfc4387a40aa9947c1

Best regards,
-- 
~Vinod



