Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BFBCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 04:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFt2IpXUg9M7EHTiaTAuIpLxz1CM0xDyLCXngfe7LW4=; b=hgBYAeiXkz5lm5Lr6NoBbKVF8p
	lvZKxv6R6tF1RpMohWkVZMIP4OKIDKfooz85e8Hx+dJrwvwvXGo+0uf6zr7SreWjNrkGDJBTnJqsx
	uj4AEfW5zDKVdePUR8dROAWfXXlHKLIBuNLJ+mfS1ar4BCFJnAhTBjIIQdc9AoVc7hoHDifHV719X
	KSi7Be6EwaZNVywX4IYbtOYaF2hlp3ggmPycNLcMZJgJB+Acl6zdt9EGpUbZbKFrhQOlJK3Pm1F22
	Vr8o9Nbklpx0M7i9Vs4TeZWFmZ4Vh2ety7uol95JojGPF07eDuZP5HuIqmCn4DKb9HhmwLePzlT0e
	ItPGh2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74l7-00000007f6B-42LZ;
	Fri, 10 Oct 2025 04:29:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74l5-00000007f5b-1Qyy;
	Fri, 10 Oct 2025 04:29:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD1824482B;
	Fri, 10 Oct 2025 04:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C23C4CEF1;
	Fri, 10 Oct 2025 04:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760070572;
	bh=xs+V22aaSxwBl1Gu7cjT/YDEQtN0yA74iezrgRksE30=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gFy3OkaDZutiIoe1wLgghY2Ep/u+17daSkEK7ut7IZIaPHBTCDnYlWeoahUVNN/pa
	 KhGaumlpDNrS0U8eYxgUL60Pa7wH7DXV8EiNTr97qJSpPs6O+bLX4PmMqTtAmV40nK
	 bj8/W3E+L0WyuS4uy663GAqaBdZtd7eaCvUb0OkhGGBo+NYJAbTqDIbtd4dsoRdKU3
	 rBI9KM2YEUspKqkxlAzOE1/EmV6A7LcOZrmybzEhcQXx95oQwc4Sjkog3zG1rfx0tv
	 h1aQBdTGXDHzbd2/Ey0Eed6tSuYBEFDti1YZnh4ro2QD1GisJM6evA0scuLXn22VsI
	 U/BABgIDUr3/A==
Date: Thu, 9 Oct 2025 22:29:27 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
cc: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    Himanshu Chauhan <hchauhan@ventanamicro.com>, 
    Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
    Atish Patra <atishp@atishpatra.org>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
Message-ID: <57486d42-f736-5e2c-552c-fa7f2c273179@kernel.org>
References: <20250908181717.1997461-1-cleger@rivosinc.com> <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_212935_397692_AA25F678 
X-CRM114-Status: UNSURE (   7.63  )
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

On Thu, 9 Oct 2025, Paul Walmsley wrote:

> I updated these to apply on Linus' current master, commit 5472d60c129f, 
> cleaned up the checkpatch.pl --strict issues, applied Anup's pr_info() 
> suggestion, and pushed them up here to make it convenient for folks to 
> integrate and test:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/?h=riscv-experimental-for-v6.18

Sorry, wrong link - here's the correct one:

   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/log/?h=experimental/sse-v7


- Paul

