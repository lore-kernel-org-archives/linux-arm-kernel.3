Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423BAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DVFERyKVYzGqRIwk1nNK8rInd+bsr9STtiP5gkT5Fs=; b=xQVcEabv/mVzuBS4H6ImiSfUHV
	ckuMOk8Sr84etTE1vxZbVIIjEM3I8e1xuTInIVByPVWURzfZVZjqqAnMLfIUd4vQ0w8wZClfFLZwH
	jya1746HDhXn7f0tnOVxWOzJLtJvj4zDurKgbwZj4q9PeSMh8SD1ugzCe8y8cGiR9kXrwd8VgdcaY
	QIT3nMHJZBilP5yt1DoMxYSNjQgOvcPtvXk0sHW+Wos076arPDfYhsJgoeEge/K4rsr9V4s0fN+OU
	6SA9Xoceq46DnB6guny80QucKmA/mYjxj7GIsX538AaEL4XVuTgdoQbDa1S9ElY44ecklGfUaiVDC
	q4GKQVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwnX-0000000DBco-3Hkv;
	Fri, 27 Jun 2025 00:18:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvO7-0000000Cys5-1NVT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D3E8A5202C;
	Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8ECC4CEF3;
	Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750978090;
	bh=nUQQ+LnpVtcSiEKYNyLJQYQ3qpwW8j9at1ttj37bRoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AZrsg3vdrJ0h/iRGea67V1Kjd16l35Zwmo76Qa+vj2q6zwKi6v1Ah9wl5WBNB2lWA
	 462gKoTgs4izGfLnhp01Ost894ecgtMAompg3rOGHh9oemcMIwy0PMbxuwbusSQVKY
	 fw6S23NxOWG9YyYiQzNL+cZtIgSPGh1ng98fu7XWyg8Lv2s/5/8WvWaCQsFMyrs57q
	 u4h98kx8k8VqrMM4LWU1NznJl/nfN3t9HfmaPB7MUNbSpaSI78hvBQHfpx4j1oqp17
	 Q1mIL9Fqi48UYRj4WZN9oDtSMDX/U6NaI3pfNJqSRaB2pESV6QiMM6OYGOb3NP/7/E
	 oSYMevKyeDRGQ==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250618-restricted-pointers-dma-v2-1-bc39dafc201d@linutronix.de>
References: <20250618-restricted-pointers-dma-v2-1-bc39dafc201d@linutronix.de>
Subject: Re: [PATCH v2] dmaengine: stm32: Don't use %pK through printk
Message-Id: <175097809000.79884.3200943794194377896.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:48:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_154811_428497_7798F1B3 
X-CRM114-Status: UNSURE (   7.37  )
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


On Wed, 18 Jun 2025 09:43:34 +0200, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32: Don't use %pK through printk
      commit: 6e6d3c6f0ef235a95c25385b2dad98e8ad6223eb

Best regards,
-- 
~Vinod



