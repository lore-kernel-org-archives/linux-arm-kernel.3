Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD23CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+TY+JgbSpWQVNN243kcn21onjVjPUaQqWkII/NhjJ4=; b=TSO9Q6nQID4OukQ0ydDXXzSzmC
	FacuXtcX5kKqBwV2+SO1XiiwynP9khmxbj7KvQY+Y34w6QHTVING6zJmZKyJvmMl6atgQMTfW1hfp
	h4EAICVd8eLuxqvvY3rNLnU2ni1dcbIdQz310zWMH9qHXSot6nNvzAi9CzqbASq68cUa4qoC0bjjJ
	0CPy0YuaFJ3wog4fO+La6TT6lukY+5UPduNALe1OevePJULP9wsyc8gC95FBDD4191yVy/eBwq2V8
	tZa5trxsg2ElJRWURA0xNyY1TNkQTUYNlewyrcVnzR0Gfm5qbYzMxyMSx+6byUKil1UORXwcqzCus
	+qxznZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLAV-00000001mHl-0w62;
	Tue, 19 May 2026 14:11:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLAS-00000001mGN-3Ck0;
	Tue, 19 May 2026 14:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E769A4452D;
	Tue, 19 May 2026 14:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9502C2BCB8;
	Tue, 19 May 2026 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779199891;
	bh=CML8wQQQnEYiEBpZ7VT51bfzANNXcuhqHggg1/opl0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yla8ZKAy4zzcpnSGQk4VI/SvwGSxc8EoNamnxjgyMswf06h7muZppi2F+I7f+A5jl
	 I5S5vZswyqAQL98lhfRR0pL8wTYrqCsDQ7uzzzGiH/ksCiwwzPW2UnW/OJtmIAF03Q
	 Og4v8bfHCXvXtwHMbJsUsVLXfzgJypUMje3g14nqQBbZ8nZCVyEbJ1FvweumVa+QMW
	 qmnXTav1k5vLg0iDReocAMa1S+vclaeWeH0XwMLuDL9icmkVUXpi4akDznn/K1zQnF
	 I4LsLzibfXQMuELQmmbdrK7iOOvLrMzr/V7Mzu7OlTJIh/ND3oo76OIAT9psIWd5i1
	 YtawsGl/SNO4w==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-rockchip@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260408230153.20726-1-rosenp@gmail.com>
References: <20260408230153.20726-1-rosenp@gmail.com>
Subject: Re: [PATCH] nvmem: rockchip-otp: alloc clks with main struct
Message-Id: <177919989065.21890.1676967854888899743.b4-ty@kernel.org>
Date: Tue, 19 May 2026 15:11:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_071132_854821_AC0CB59B 
X-CRM114-Status: UNSURE (   5.34  )
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


On Wed, 08 Apr 2026 16:01:53 -0700, Rosen Penev wrote:
> Use a flexible array member to simplify allocation slightly. No need for
> a separate calloc.
> 
> 

Applied, thanks!

[1/1] nvmem: rockchip-otp: alloc clks with main struct
      commit: 44cf48f1f7c5061e65c48c782b79df6e7f8e0668

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


