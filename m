Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17230C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4ZZC9QkLLMc4yoAk839Oo2ar7Abh68ilvR2z5N1Q9M=; b=UvWUjdAo57K04AA2x+YZSY+hvs
	ocQFJvQ3mnoCyLxvLfrFbSIuTg3fgraEKK7kZAYf/Of7ZkGpXvD2W9PQF3OEI22ZxqoKzVdzh9sEp
	i4vE//IMJziuUS9F4vJQLXxlTm2/3Dv36B6oKrDLYRrI62RTrXph8sdAHTxFDAP8bWshYZh8dGJ5c
	Vi8LdzmSrgMtksCCFm81gaepldsMqdS1jfpH7/GOD0/SeYVZ/oBzzAhri+G9R6xzVxH3sF0pOP+iR
	hSMsMs0W34mxw13QkCa2AnbM6yzMo6baLx4u/GzxLx+G9ZlLuXftOFM2PrOq/ov9C4JCh9yUP+TaP
	nxYkPzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz6z-00000006OO6-49js;
	Mon, 17 Aug 2026 15:18:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz6y-00000006OMr-1tvM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D1BE601DE;
	Mon, 17 Aug 2026 15:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104741F00A3A;
	Mon, 17 Aug 2026 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786979931;
	bh=v4ZZC9QkLLMc4yoAk839Oo2ar7Abh68ilvR2z5N1Q9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jKJiRM+xzo66KAr5FzFbz9OqiIgInoYEgHmig2TZmpoB8ebwI81yaPOcy+O3JBOUO
	 LE7QFRnhnOCLfEWXCNf9wty596FIrWpwcU6ezy6tp4gb5qVNPFmQBUDGGGv5Zd0m/o
	 4J1Hf/GYdwwXfMPi/Umnz6ObKGOh7GbO9rIFCxcQk582HMpFiIWwvdwk9n6S51is6J
	 Q//GxhSYEVG0PlPKiqYfnQZDKRZ5oXYifTV9iUk4qegZ8eUA4S76uHcl/m0046Be23
	 j8MaRKtU22EIlTbVIWhWtWSdPnVvCdSsIpXr9YXUfEhWyAQqsOXw1zuLhxQjdLkaN0
	 KJz9rP/EnoJpA==
Date: Mon, 17 Aug 2026 16:18:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Shen Yongchao <grayhat@foxmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Fix life cycle of the nested_mmus
 array
Message-ID: <aoMmLrIjlykQJ3BP@gremlin>
References: <20260814103230.858578-1-maz@kernel.org>
 <20260814103230.858578-2-maz@kernel.org>
 <aoMhRtpohuNHcEzw@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoMhRtpohuNHcEzw@gremlin>
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

On Mon, Aug 17, 2026 at 04:17:51PM +0100, Lorenzo Stoakes (ARM) wrote:
> One issue with a typo'd type below (the compiler is ok with it because it's
> expressed as a sizeof(ptr) but it should be fixed) and a small nit, and
> also Wei Lin had a comment re: the commit message.

(oops - Wei Lin commented on 2/2 commit msg, disregard that bit for this
patch :)

--
Cheers, Lorenzo

