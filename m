Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5F606EE89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VPTriuff;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=F8tPpaJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bONyyJpUFgPkylO2P2hlNIFwAOFn1eJYoMX8uFPSfJY=; b=VPTriuff2dEok8
	M3bnMRDv1xRi/Ptci7n1ncdsjDi0xHwgibc21VOq4SACRSpwnt9cS15e8mZpqi5YW5fXf2RwluejC
	c+Y50XJvaPWOw3BxG/eusCB+FiKpu9bYWXOtcYZuKRknOLVjzlOjCq6qi+0CO9xSNv2oKgZZh+Qk1
	V3F8Hevo2rrsy3C5vc5/rH0qVu7HUoSIJvfEFgHFDgmtw+RIA9OhVaVyLzh9mB2RzJbykbQhS7yqv
	LtvL0XIbcCmg+ZzbHIlfU7XrvEKVF26vhNrYOYIgpMhwtoq3OO5mXf8NLgJs7e0DY3Bg69vJ7jKKU
	jghFguHlJeh9QMdasfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCsw-00000002El8-485O;
	Tue, 03 Nov 2026 11:41:02 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCsu-00000002Ejg-3HZB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:41:01 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D670C240107
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 12:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793706058;
	bh=bONyyJpUFgPkylO2P2hlNIFwAOFn1eJYoMX8uFPSfJY=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=F8tPpaJS4TIjDIm/1jgb2/3l0fXCVTUv0pEjmumjtHsfgTktbO2bMYo7o8sLZDrJL
	 47dbZqnPLFKkWC8bw2EteT1SHnkVnPF/BIVtviwQ3YZVdZHrBKWK+KloqS7yOk9kX3
	 B6ttjBysSbKNwWznwbD9VvkRG8MpMnpe3Ti+G+9FCq7pD7Kg7yI+1l2968Zw7TmOtF
	 lkbOnmHUwpPN6ePvPJunhq+SlEdxIvlUgic+F5swtoDO6oykjXgx/P+U2RB/0Et1P1
	 1P9/1v6aAtIEoPAuLqOXLGdqaiHKrwOKcmBYbpyzOvVc3BdRegzWK+wumzpDrsxzmK
	 OHwqZtB9Grgiw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jJmqF4Rj7z9rxB;
	Tue,  3 Nov 2026 12:40:57 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 11:40:58 +0000
From: mateusz.nowicki@posteo.net
To: Christophe KERELLO <christophe.kerello@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>, Yann Gautier
 <yann.gautier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 3/3] mmc: mmci: stm32: lock the STM32MP25 delay block
 again before tuning
In-Reply-To: <6d138e10-343f-4fa4-8886-0480e95fe96b@foss.st.com>
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net>
 <20261031120700.42576-4-mateusz.nowicki@posteo.net>
 <6d138e10-343f-4fa4-8886-0480e95fe96b@foss.st.com>
Message-ID: <21a6bcb074c46fbad82d9d913150bdf1@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034100_977595_9FAF0B21 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Christophe,

> This patch is similar with the one that we have on ST downstream.
> mmc: mmci: stm32: release the delay block before enabling it (Commit 
> 01d3cac)
> 
> If it is the case and if you are going to upstream ST downstream source 
> code,
> do not forget to keep ST signed-off author, please.

You're right, it's the same fix, I just hadn't seen your commit. v2 will
use yours instead of mine, with your authorship and Signed-off-by kept.
I only added a Fixes tag and Cc stable.

Regards,
Mateusz

