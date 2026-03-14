Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A0B10706DC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9SJbFKMpbzs7B6VOWhaTri+Xq3nFt1bJvXiz8PE5MY=; b=NitZGLcY+KvTsprT26fsFPlLlW
	lWgO5dG3z7KSkhJ92Tfvti17f5JkoKQEdpyW/2EKRYwgpmoJ+ObBDs72ndAPF8rsiw6gDHFOw2C+h
	Ply/EPhkiMUly5YyX26uZzk/XP87xBOZk+5c+u1C+8e2mZmo8YMbp5ftZci2McC4ktcReGZwEeoRK
	wG19m7ELxT81V/YJotaHBaE1+AnR848LoEdTK79JTxL4i8z6Yr+Yfhhmp+4xpI+ZmNovFAOMPKn/b
	SgAUVi+txsNv4smjCnSxAM7JZ2kTaTMIJIZO1jLLP/+hXIUTZHCgodj1l6koPjNiN0stOCvGzXH09
	aEHBLIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1QJZ-00000001wF1-3qAn;
	Sat, 14 Mar 2026 14:50:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1QJY-00000001wEv-2g7H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 14:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8697B60008;
	Sat, 14 Mar 2026 14:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D90C19424;
	Sat, 14 Mar 2026 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773499803;
	bh=Y9SJbFKMpbzs7B6VOWhaTri+Xq3nFt1bJvXiz8PE5MY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GKml0RGTR9tCldMZmdbury57WLv0v52M7T0Ixx6L3NAfflTpVcKNL/Q8MiwxLDqYS
	 GREyJZGoldU8c/KT1xu5M22yNp4cN9NhV+4cIkflJLDU6l21myeLFKJuaBVjxH81t/
	 +Me6yQyvqClusDHyznyqdj8742o8fK8NbFGWuXpKvq9AEUi5qQ3x3KSgFLYHXCbgg4
	 XTdXHaYhfVCGg3WHZiV+kHRK28m9KsxzECkwZz/n0z62FlVB5DNbTPqbcsobX/lsJx
	 5sk+YHrWvsMa7FHnvQLRkgu3nKW1pIad+kgHDYF+IgG5yAVpH66ZNj+hpxy4iSBshd
	 TYfy/bD/x1wgw==
Date: Sat, 14 Mar 2026 07:50:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: MD Danish Anwar <danishanwar@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Meghana
 Malladi <m-malladi@ti.com>, Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add HSR multicast
 FDB port membership management
Message-ID: <20260314075001.2bdb31d6@kernel.org>
In-Reply-To: <20260313133115.GY461701@kernel.org>
References: <20260311082923.2962937-1-danishanwar@ti.com>
	<20260313133115.GY461701@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 13 Mar 2026 13:31:15 +0000 Simon Horman wrote:
> It is unclear to me why this is marked as Not Applicable in patchwork.

=F0=9F=A4=B7=EF=B8=8F. Revived.

