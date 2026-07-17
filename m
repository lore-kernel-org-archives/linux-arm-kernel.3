Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6748FC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW8pWm8rsdK9m5Q0HotqdfGr5xc15Rx6xUUgGdCCdJQ=; b=zV6wP1UuFG/s/rTsJsPWqZAhs2
	0KX0+01G/7frUiYDwvVc/9nAAVJ+U8gnhtcYvGxO2PyPn98WjgwqvjwCiFsL2C9PmY/kCWU7l8KFi
	w+ii3gxXEqFVt94mS1evi/YnmTQZBPtF703/pTDHGwmtTdQYfe+qKfF7nTAT3VvqA4hvQrfik++O+
	q2tXMahQwgg+extJMAiiOcXeEPuq9gBz3/08zWnb2hKo9xPqKGg0Zqom96W1mcV++Fj6A4OKTCxSv
	7HvRH6iFRdwKBCoz3UU2Ya9wpCVVEu+Ng/cryw98EWDHwqDEnA1rt6BSZG1lEB7Un7tEdoO2VD6wT
	PWuSEcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhnE-00000002Iey-0kbU;
	Fri, 17 Jul 2026 12:35:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhnD-00000002Ier-33r8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E7CA40ABD;
	Fri, 17 Jul 2026 12:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995F31F00A3F;
	Fri, 17 Jul 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291751;
	bh=vW8pWm8rsdK9m5Q0HotqdfGr5xc15Rx6xUUgGdCCdJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GCJAeN3usxOsQR1vVrty384kmMqGCBnPsuNew07uH5FHKnERjy4JwrlUR2XVV4ZO5
	 QbtidVqVs0OVOgQEz0hUZdC0A/mc/1Do6N+jDt+nzq5k/LarE3d7SaBp/k6XTxNEix
	 W1jdXKT51c1n1BY1qjjhk250vIRPi4zg3iQBNY5hNVXeemWigzwAQPi7zB52OyB4Va
	 y6Laq7Vddnmb9FvLOtVuIKkPT/uNjl+L0WKqRfjGjeMPQCxOTr6MyCVGnBIiG7KMYx
	 iUZZ94hpnRpNUksVVTJpMjaqY7wGfjf94l3NMDoUzj9SMPOlgH0jGKhqcoAJCxxzMa
	 /sHZ4FOzm99CQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
References: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] dmaengine: Constify struct dma_descriptor_metadata_ops
Message-Id: <178429174814.1176696.13776361509358729486.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:48 +0530
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


On Tue, 14 Jul 2026 16:06:33 +0200, Christophe JAILLET wrote:
> 'struct dma_descriptor_metadata_ops' in not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>  120635	  21584	     64	 142283	  22bcb	drivers/dma/xilinx/xilinx_dma.o
> 
> [...]

Applied, thanks!

[1/1] dmaengine: Constify struct dma_descriptor_metadata_ops
      commit: 338c853b7c3b422fefda195b9b8010e40611c96f

Best regards,
-- 
~Vinod



