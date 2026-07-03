Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qcvh4i0WWPJkp55DJ+tIqTS9fa9h4Gv23nYwhry2ERU=; b=Cq8xB3AEwRzifzh3b0cd9WxBS1
	aIVcOL6rYVxOl53dAbXisivgNXWzq7oCWTQvig1CO7ulf6iv7fO267BQiM+hhqwVvy9a0XuyzJx/C
	eGn0bXUmrE2frFAL/THd5LIwWekuJYTDNVg1kr3fEuey0UYNit2jMLhG+h0GrospRkZ8TlKX5wRYr
	RttTg+Ytz8Oh+Q62PVrwpwjpvJq4J8qZ/FuS4Oay7YSnO780uij60kGGS1iIAa2IQZ5K7lquMgi97
	t8SDootG6+DjfapJWo/BDD0ApxEizuTdR//f5VD15JTbvat6h9O6effxwRBlQPXdC8hVGYe3nOfiy
	tNjlJBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXjK-00000006Ccm-1wrp;
	Fri, 03 Jul 2026 06:50:30 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXjG-00000006CbI-2gv9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:50:29 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowACXM8yqW0dqqpWABA--.2367S2;
	Fri, 03 Jul 2026 14:50:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: stm32-timers: depopulate child devices on populate failure
Date: Fri,  3 Jul 2026 14:50:16 +0800
Message-ID: <20260703065016.97181-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701214250.GD2108533@google.com>
References: <20260615063042.36397-1-pengpeng@iscas.ac.cn> <20260701214250.GD2108533@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXM8yqW0dqqpWABA--.2367S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyrCF17ur1kCF1rXr47Jwb_yoWDuFc_Wr
	n0vF9Fkw1xtwnrtrs5ta1SgrZrX3yUZr1UJrW8JwsFq34rWrsxuryDArnxCa48CanFgrs8
	GanFy3ya9398ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235027_054390_41224069 
X-CRM114-Status: UNSURE (   7.94  )
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

Hi Lee,

Thanks for taking a look.

I checked devm_of_platform_populate(), but I don't think it covers this
particular failure path on its own.

devm_of_platform_populate() only installs the devres cleanup after
of_platform_populate() has returned success.  If of_platform_populate()
returns an error after creating some earlier children, the helper just
frees its devres record and those partial children are not depopulated.

For stm32-timers, I think we still need the explicit ordering used by
remove: depopulate children before stm32_timers_dma_remove().  The child
drivers get the parent drvdata, and the PWM child can call the parent
stm32_timers_dma_burst_read() helper, so releasing the parent DMA
channels while partially-created children remain would keep the same
ordering problem the remove path avoids.

I agree the inline unwind is not the clearest form.  I can send a v2
using a normal goto unwind label and a short comment explaining the
partial-populate case, unless you prefer a different shape.

Thanks,
Pengpeng


