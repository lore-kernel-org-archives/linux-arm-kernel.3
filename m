Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F28C624D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx47gJqPCj9SCA0JB2cyQLIosoTWKzO+g7yTHtgtM6o=; b=YwXSKu8n+WSST6Rr8DjZHBwEvK
	MKUYe8jtpP/a3FEwxIz7Myir2SqUPiPiVxKwFWcMp/bEhTgb1Q1jMdQiqWdI5wuWo8xsUqRHVXTfG
	eUx+HRiw5HHYshDwKAWl+052L2xQ8d1hMYxMX+uxT5953Z462m5eTmUZ4qRpKejxIw/P7tjcBr186
	wr/SIZLZ+YUMHTtOJd/BM3Go+FND+HFzx/NFCaJys5qLj3D7nYY5udDKN1XQY6FKxvuKYCziWDmmT
	JS3oaPoRU1voBR9BeaxlRyBVTmu4jVIt9bye/YVSBt3dqdlzGsoAaHOwt//p5ejZDj7yceJbfckqR
	GUSm0Yuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaZ-0000000CXr3-3y3B;
	Tue, 01 Sep 2026 15:39:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaR-0000000CXSj-2eJB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:39:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 363EB43479;
	Tue,  1 Sep 2026 15:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E71F01567;
	Tue,  1 Sep 2026 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788277187;
	bh=fx47gJqPCj9SCA0JB2cyQLIosoTWKzO+g7yTHtgtM6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B+BMI8M2fCGxW62EK9NXrJh+RUMPMFvhnxkbKcFZEFDTCB6uEAi5yb03VP4tIHlB9
	 n00LKNqpN/R6pAJaaHK7XipYRi0k8knnrQzggr0K/hNCf73zyO+WIWQi87K5Voxgv0
	 jz+nfv7GsXZ3goTqKxm4XZSxV+ARG/LLnOylYpHEyY5bMs0clD59A+Djleo01MLTdQ
	 XQkvLOU51OPAThJn4dpjy3aJlNmyg3cwBQWYQqHdrQlXqnUUdSdvJsqRRsZVFoAjz8
	 HpJmyV83/JZKbV+Mrov4t5rGYFepO8eEzmkESGWH4d3rIfOg1eNqfw+HYBfMq2rzDq
	 5pZM0wZoGLxag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mmayer@broadcom.com, florian.fainelli@broadcom.com, 
 Danesh Petigara <danesh.petigara@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
Subject: Re: [PATCH 0/2] Harden DPFE driver against buggy/malicious DCPU
Message-Id: <178827718509.210805.1672029094153389566.b4-ty@b4>
Date: Tue, 01 Sep 2026 17:39:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Wed, 26 Aug 2026 13:14:57 -0700, Danesh Petigara wrote:
> This patch series hardens the Broadcom STB DPFE driver against potential
> exploitation through a buggy or compromised DCPU coprocessor.
> 
> The DPFE driver exchanges messages with the DCPU over shared memory-mapped
> regions and currently trusts DCPU supplied values without bounds checking
> them before use.
> 
> [...]

Applied, thanks!

[1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
      https://git.kernel.org/krzk/linux-mem-ctrl/c/7c0b82d087908765c6c7daeb06943e21b78d523e
[2/2] memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6b07f8c06caca015a0db69e3f323b5186469bc66

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


