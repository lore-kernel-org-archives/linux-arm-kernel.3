Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ABDD6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s46UJ/fSZA41bC7jnvny8Q7zOEfqLogcJrNq4EgjrWQ=; b=vyL6WWxfoCHscQKj2eWCpqJVXm
	cnvce0lokkCzBXDtHJhNfcuZLpWRok7TJBQ7Se+FQPrFBdXV8r0XAFG73hQzre6Te/Ha5G9ZlSql/
	PJJTnI9ojwC/ulhgTunrSZqjKJEtKcdjPjya5IFTVrVCC1w/HGm1Zvu0f7CtRS52QxqQ7yX8hWBWV
	i2OfEMCRKyxgt0HBcFG+gkR+M3yrml9yvNj3vp5iu8H0p7MlUOJjb85HgeLsEM8X1DcmrG8lARDx/
	iSQpfk3MGJkf5VybA/CVxccBXKS2BmylF7TPCKVPRNniEF1S9527shJO11T1BXasBUiqWg8SkammS
	RrDZdv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6GR-00000007zYN-0ADp;
	Fri, 23 Jan 2026 01:47:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6GQ-00000007zY7-1Aww;
	Fri, 23 Jan 2026 01:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B548660018;
	Fri, 23 Jan 2026 01:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6006BC116C6;
	Fri, 23 Jan 2026 01:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132825;
	bh=s46UJ/fSZA41bC7jnvny8Q7zOEfqLogcJrNq4EgjrWQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y8UQqE2qVJnEdAJ6/LJ+q+0UPRQ32VuvF766nNR4ZrFDTmQVni3Nm5he+V9yLa7DK
	 Oc3EcA+sgUcLVja96H6KcSlWvnW0oEg/kB/DYI4vCZoYdgQiFoCgOHfS/L93q/Pg1i
	 rC8T8gGYyrSmEBJNLIA2nd2nIjLnYnijYe9yFVlJSqmg/t/0l+zhZGHlFyR2UA3HL/
	 mrtdGKztH05Q7fyCwChlHoesfEyWh4DVFQ1tEigz62m9UAB/+4nmsA4zyr3WgNmvtq
	 ZEtZoQyN8bRgUJ3qKdvcc/WEnBlXXwLQO2QpTGnqMUI4u/4buZIvUW8q1onEfOFcQp
	 oQZ3PXOkCdI1w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251123154315.1564-1-vulab@iscas.ac.cn>
References: <20251123154315.1564-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: mediatek: Fix error handling in runtime PM setup
From: Stephen Boyd <sboyd@kernel.org>
Cc: nfraprado@collabora.com, laura.nao@collabora.com, wenst@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Haotian Zhang <vulab@iscas.ac.cn>
To: Haotian Zhang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, mturquette@baylibre.com
Date: Thu, 22 Jan 2026 18:47:03 -0700
Message-ID: <176913282359.4027.16928737563389647276@lazor>
User-Agent: alot/0.11
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

Quoting Haotian Zhang (2025-11-23 08:43:15)
> devm_pm_runtime_enable() can fail due to memory allocation. The current
> code ignores its return value, and when pm_runtime_resume_and_get() fails,
> it returns directly without unmapping the shared_io region.
>=20
> Add error handling for devm_pm_runtime_enable(). Reorder cleanup labels
> to properly unmap shared_io on pm_runtime_resume_and_get() failure.
>=20
> Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers d=
uring probe")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Applied to clk-next

