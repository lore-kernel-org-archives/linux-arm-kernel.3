Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9524EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX7D/nHqjvADGjMie4fjxlziA0J8uk/7y2iQte4HpdQ=; b=qS+5i4wcMnGDgo6U9z0ZMFn+VN
	31xOAd8rXLE0pG9vRmd6zxlg5eP51U6smjpO0bvNzsp8iKdJFnpIBDXUVwxJ959yVBBkp5SO1l5rc
	MJz68MLCLvKWFixGSJBbX1h8NDiXzodezvXgDCXb72T3TtkYj0zw/ylai2jgEwU91xrcAkBBtFSVj
	Hyu5UfBcB4BpEfVTxK1wpHVzs91tpJkmsHWk2w0DyYzKBxeDrx5muL+iYLpWSCi4u8dsH9OHPWrlD
	Ce8CU5aawVgguI6hZfYa7RxLhojUgbrSxfQUwh8598/js+ZzPcGw9ZBdDF62nK4fe37zyCxebX5aQ
	Az68alow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqds-0000000DlMi-2cU2;
	Wed, 04 Jun 2025 16:07:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqbY-0000000Dl9q-164v;
	Wed, 04 Jun 2025 16:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aX7D/nHqjvADGjMie4fjxlziA0J8uk/7y2iQte4HpdQ=; b=GopEpRFjfbxlPA8FYTjL6s1Ryg
	vqJb82tDPgzwnXXrowEJMAl9XN0wQdRD0hrQTBXe9gPfIHQ6QlKxU6j1bILR6F4l56YaYFARpT+TC
	8VV5v3fwMlRCM4Y5Kq9J1jL2jGClWVYzu6ViG+mtL3ThEsJkpA1Daq3XyWSBf9ENE1lCziTF8fpf3
	85NC0CEBBdT1PEouMkKGSEKgLkvTIx25Z16vWVxdeg4wvZwlAPah4wcOHoaia7yEptcjqoOh9hV9M
	H0NhLQ6eYGE7UfTM3aEo/WTIMHp0oLiu3P8d5VsXLqquejPspLhswv1M+GW+XBPA7LcRU9t7lHXNh
	B0I5itqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqbV-00000000ulB-1MGc;
	Wed, 04 Jun 2025 16:04:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A756330057C; Wed,  4 Jun 2025 18:04:36 +0200 (CEST)
Date: Wed, 4 Jun 2025 18:04:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] stop_machine: Fix migrate_swap() vs. balance_push()
 racing
Message-ID: <20250604160436.GL39944@noisy.programming.kicks-ass.net>
References: <20250529084614.885184-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529084614.885184-1-kuyo.chang@mediatek.com>
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



This and your other patch about migrate_swap() are two distinct
problems, right?

