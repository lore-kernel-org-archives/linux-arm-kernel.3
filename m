Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4183AFD065A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74frNfz8XAGXMLjhSg18ONfnDIXG90sTrffuzweZ1h8=; b=qVFDiwmWBBqenPxaeLQjF5B5jJ
	MyHYcF7TBd8WKueydkevLoh8lhvheqsyZAAV/bPjNej3vGkrxJDh26dIE252MR7dLE8KgDq7scusr
	lVPlqohS/98Lwza4PyBH9IXHUjCEcMOHkU5CH/5zEPbMMJIvxf/Zf5QXx8UIzIHp/jm8oQdvMtZ2l
	a2WCx/UQHFijr7OK4QJbNKKjTUsdKBWNjGUELRm6VtPx13SwbI0663daxpR94i99YIgE65hpX04NA
	t3NCBpgNj9xUKSlAb/+YblJ5QWiDywdznfXEyv7pQX84Zn30CHOyL3o9qZv35QNUtDIIJQaUBv1H1
	Meu6eaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FDC-0000000BCWC-0eil;
	Wed, 11 Mar 2026 08:46:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FD9-0000000BCVE-3rTC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D09D4428F;
	Wed, 11 Mar 2026 08:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A1BC2BC9E;
	Wed, 11 Mar 2026 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773218795;
	bh=u7/IbC7IcWUTG3l9ndShK51KTXXh/DZld3Pg29+wIFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KUWz26oJfH1NRVHxQR7FUVYs1xHh2bowtcyVPA3T+x4ye6NLWN5U0fzF04G753XTg
	 v+el/uEvzV3EgW6vgzMZ4SEfZmfvjTfwug0jBUaeH5c8NwmMpuZ6oeyRUaq8V6rclH
	 mL5u0p+ou7ToztyhoBs5QZzLzD40groKN/4gcSSDpxVRC1rGWG9hSZx5xLbtUYmdaK
	 InL1wZrGaG2Cxng+EDSTw5F8xhunNXGyUXPt07ciBKagdZWb6mpeL0Dz3g2RJcP8nu
	 eSt7rSSzRwnfP5bA/T0LJsvCKU19utZGjWHPvH4tVgDiLMJhu7YnIFZUYH2wXaVr3a
	 OSRnXf17tdyfg==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] irqchip: stm32-exti: use kzalloc_flex
In-Reply-To: <20260311054038.166293-1-rosenp@gmail.com>
References: <20260311054038.166293-1-rosenp@gmail.com>
Date: Wed, 11 Mar 2026 09:46:31 +0100
Message-ID: <87ms0erbx4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_014635_973332_9405CBFE 
X-CRM114-Status: UNSURE (   4.04  )
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

On Tue, Mar 10 2026 at 22:40, Rosen Penev wrote:
> Simplifies allocations by using a flexible array member in these structs.
> No need for a second kfree.

Nice, but please follow the guidelines in

 https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

regarding subject prefix and function notations in change logs.

Thanks,

        tglx

