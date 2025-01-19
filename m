Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8E5C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 01:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuZ5zwiixBLUBOdkaV2voEo3Uvmifp61w4fBs1tmlt4=; b=b22ocq4S51y0IDHkm88EmtAciC
	Y68FkR3ULJwpBDQsVUH/UDT3Ux8MJzgu9OCI/gifzqCG5zusl+zXp6dTvO8yUi1+XkJmNpABEGcPY
	Y7aOLfwvKZVL304z7XHPhNcEfyEG1wSGUDAZRWxAzRrzq1Le1rUjqYZr8hcJHzPFjRuXLAksFW/8m
	+yUQ+QwMJol2Hhwz1twsY1NlYqxQ2WP+fENetGx4lIxM4/F9ZksR1OdHnE+b1dVh3aD8mJ9ya1An8
	6Z1IqHyVN2i9L47B3GkGWAmlUXdm1DX7QpajE5CXCT0y4iIf2o4/559LTg8hGdAy32UJ9P5c/k2JX
	8q5psUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZK06-00000003ATC-1aEG;
	Sun, 19 Jan 2025 01:21:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJyV-00000003AAg-06FP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 01:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9E775C0777;
	Sun, 19 Jan 2025 01:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968EFC4CED1;
	Sun, 19 Jan 2025 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737249578;
	bh=zuZ5zwiixBLUBOdkaV2voEo3Uvmifp61w4fBs1tmlt4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ncye3MpVSvdthtZ+cEXLDaJwbvuk73NKy7yFEiQwrK0YE9op5uImyWgTg0w3IDvlJ
	 oy3bMvyxRpkY4uL8PuGSmCvGqbWcYqT+P3OcZ8bINXlRVrm90sBYTQtit0Wrcgl+8a
	 YHfBPI46JwJVSjAana8O1riKwpra4kC3i3eg6XyKbV+yxvHrWiSfSXjMrSJwOSR1jl
	 O5WQWLNZcxs1fHq4pwsaxkCCg2DZwTKMksrvlJlIrwv66tWZHNm+rvsOS4FrgY0x1b
	 Na0NUVbrSnqEaqJItNIZhimp4kbizW2AjdH6ZC2tRu5AliC8yxR8U3zBXz6S2v+NO9
	 qgwdqslQFEmEA==
Date: Sat, 18 Jan 2025 17:19:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, netdev@vger.kernel.org, Michal Simek
 <michal.simek@amd.com>, linux-kernel@vger.kernel.org, Shannon Nelson
 <shannon.nelson@amd.com>, linux-arm-kernel@lists.infradead.org, Heng Qi
 <hengqi@linux.alibaba.com>
Subject: Re: [PATCH net-next v4 0/6] net: xilinx: axienet: Enable adaptive
 IRQ coalescing with DIM
Message-ID: <20250118171936.703c0a27@kernel.org>
In-Reply-To: <20250116232954.2696930-1-sean.anderson@linux.dev>
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_171939_169537_B0C118E1 
X-CRM114-Status: UNSURE (   5.35  )
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

On Thu, 16 Jan 2025 18:29:48 -0500 Sean Anderson wrote:
> - Fix incorrect function name in doc comment for axienet_coalesce_params

Huh, I wonder if you sent the wrong version..

