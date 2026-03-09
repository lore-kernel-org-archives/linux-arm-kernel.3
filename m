Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A07EF36F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9SdwsiF5Zpqq0iuV2twlDjhxgd+U054lQx1vHO6mZk=; b=pyguUfvG3HN8K/QQ9h7jmw7+TZ
	Fq1tKB6XjX6C45c5/tP7qlEsVU5py42tCpXK5/MCCsoL+81mEn0tXuR8yPv0tqYp55L7GwfEE/WoU
	sAvE8hVCEJcWZw99BK8eMXpcvMcW8vPjEMtVNvkzXSFnoItz297HWKsZ3LEVptSoAnTeRLBOcmnL+
	nOJpZU3eVZun3F4RSvOdP3L6edqivJ5y7bpU3otuPeZ8sO4lMTpmuFItIpVZKRjNOM/ADG6+YqCUd
	uNtZsy5LiglcSV9SxEuNw6R7NftryBZ2Nka5Gpn6T4NdeRfOxH0pkHsiNjxb8SdbG9HYkABJjlMno
	t3COhYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVK2-00000006pVO-3sy1;
	Mon, 09 Mar 2026 07:46:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVK0-00000006pTa-3xK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56AD7442C6;
	Mon,  9 Mar 2026 07:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09CDC19423;
	Mon,  9 Mar 2026 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042396;
	bh=m2SaN8A3RBM347mWSKYqqP47NQYZJFN9mp10kpsr5Wc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=T6u0Ja0LOm5BruFmSmhMWpl73E6wPIrs9hXGnngAVnXQjSMXDyQ44RvhwljprHLqS
	 cOp1qVK8cUtBdy4LH0YC7XANGzzQfkXL36QuNaRGhXgjNw+rma3pjqFrdQqVxHYE5y
	 Am6x8g4tOnhC7JlXZZ2AfV8pimTQGvVaJ0JWhhBJ6b4mtKr0uz3XLmeiLAGI1pOcpi
	 xNxyAV40QJJAhF8CwXJAK0x3yYJlQkCX28ylqVMuF8T2vS5PSi+5YwxzkECnLkbdYB
	 LMFv7jv7gx34CucrV65voQFmb0g3u2RpC7rrkTl24NMlpebu4t7nqR6taCsOTOe6js
	 d3C6qWtefwyUg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260301142158.90319-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260301142158.90319-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dmaengine: xilinx: Simplify with scoped for
 each OF child loop
Message-Id: <177304239444.87946.18235295282294405962.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:46:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_004637_006752_943D0F64 
X-CRM114-Status: UNSURE (   5.59  )
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


On Sun, 01 Mar 2026 15:21:59 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: Simplify with scoped for each OF child loop
      commit: fe8a56f098fb87dd489666d6e9d6498be73a92e6

Best regards,
-- 
~Vinod



