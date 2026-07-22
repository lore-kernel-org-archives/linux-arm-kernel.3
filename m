Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD3C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl/qyjtpoDPvZZ7vR3XW5Kx6nHmzENWCtL5AfFrlddk=; b=dy33MGxCIR6rCNlLBefFf6wmir
	TTdMi9j+o9DqblUqa+Euw+s+6cBgY8TfqIUWrDsIF17oZ+OUm+Iqg/IPJa2Z3/Jq9tuHBQGRyXhkD
	sDIRxhxxXyU0E+rhZGIz7zvfFgpfCEQ0edKwlZtlfI2WIPrnLScKxmFaSX+G8i275P72g/JR/PnzN
	phZhCejsccr8hbucIZ1KJmbuUFfapSD/cnp2dT6e+licz1U7RaA1B2yeXi9dArVk8KQGOpWj+Bm3i
	9cw+5NvTlhRhgxUSVnB8l3moIdUz/0sQm7M+JOQEfzXpmP+CJXA7nJ4zr7QOAzaTqCQ1Cm58K4eKr
	vOannlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ2o-0000000CD0d-2YMn;
	Wed, 22 Jul 2026 15:39:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ2m-0000000CD0R-3P0r;
	Wed, 22 Jul 2026 15:39:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEA83600AB;
	Wed, 22 Jul 2026 15:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD81D1F000E9;
	Wed, 22 Jul 2026 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734775;
	bh=Rl/qyjtpoDPvZZ7vR3XW5Kx6nHmzENWCtL5AfFrlddk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nbCqvnm7WWI990ltCojzPfsJ9SJnj1XQwt34BOUTKkTEAUkUiINCK1FjN/06tzDF8
	 IQMk0crDNrZ20W5a9JINuWLdJborGRQ+jwdVMvGUhbyw4SYcwv7y328LLLPYcDtHe2
	 Da3yYuH9FJkvW6/YSlkElWCRH3WH8WKaE3sdr2wW4IIHoDPCJP7X4LYK6g1I8z3z7k
	 ooPLru5R81auH8uQmg418zVjTpHVdum/aolAhfL1Gs0WlFG4q6KRgC9w1NvyEIeypH
	 PUl2WRBsD9P0XcyFI800/MGprCuGEXWLanf+ktboAYEVF3q7+YpQ2Lk2HSw87rVixa
	 A9L5135aclhew==
From: Vinod Koul <vkoul@kernel.org>
To: tomi.valkeinen@ideasonboard.com, michal.simek@amd.com, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
References: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
Subject: Re: [RESEND PATCH 0/3] phy: zynqmp: fix SERDES scrambler register
 handling and enable for USB
Message-Id: <178473477346.290624.4095554027815775020.b4-ty@kernel.org>
Date: Wed, 22 Jul 2026 21:09:33 +0530
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


On Sat, 27 Jun 2026 21:22:26 +0530, Radhey Shyam Pandey wrote:
> This series fixes three related issues in the ZynqMP SERDES PHY
> scrambler/encoder bypass path:
> 
> 1. The L0_TM_DISABLE_SCRAMBLE_ENCODER mask incorrectly included bit 2
>    of L0_TX_DIG_61, which is a reserved read-only field. Correct the
>    mask to (BIT(3) | GENMASK(1, 0)).
> 
> [...]

Applied, thanks!

[1/3] phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
      commit: 6cb22477929489a412df8d153e550e77a012e701
[2/3] phy: zynqmp: use read-modify-write for SERDES scrambler bypass
      commit: 21e0749f931702765b9d52d05740092bc87fcd8d
[3/3] phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
      commit: 7eb61caf45607e1e1270f51f8f93f0ded53146da

Best regards,
-- 
~Vinod



