Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E836CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+DMpe7t/dGxE3sBJyyEWhe+11Lj4NA7Gz+f3SNlCqM=; b=VXQkUkEKmKtB4sX9DeMZRltlwb
	D5zBxI6pRjy3OhInaGzWN5Gglut+ZwMqOiHyEeQRuY0XckGzC5f4z4til1GDjjsv69Oi5UmTu+EOv
	h0ni+QIdVDDdbo42px/Az3QyZRpMUX/jpQqo3mQKleZHW3XPZBTcEuFdWwlUI7sKJYsSuzw8h1tjc
	snKOwoGQgq6QbKHHPE7LSSUCZimqVYtRKg7zSs7zqLvzyJU5kuXw72pUrzRKDSXON/GtPJRmERt/R
	F7GNEPZkmG11W3/D4mKbwZFxGGqetKnxiuqr77AIGoQ5gyNs9TO9sZOjntqqyvbFrYAqcfgvwPCFF
	MPagchGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGytw-0000000FZLE-0x1U;
	Wed, 14 Oct 2026 13:20:12 +0000
Received: from out-44.mta0.migadu.com ([2001:41d0:1004:224b::2c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGytt-0000000FZJB-2kxZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:20:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=E+DMpe7t/dGxE3sBJyyEWhe+11Lj4NA7Gz+f3SNlCqM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791984004; v=1; x=1792588804;
 b=xddCQ+8BCoBtZRCnXQwEP1Ue4TZ0IwH7+JOME7anrkf504BD32qbuGm/AcVBonXPXu1PesI7
 c3ILzNum4dsY7RK2MKTqCD42uDbwwnHHPeP1fiyAOcQem+Ns4mN/ptTYunF6C8gyGMoJDJzpjFj
 qp6zJKsxZiKT3zZNRy4pYJGc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 696025c3047c1017;
	Wed, 14 Oct 2026 13:20:04 +0000
X-Mizu-Trace-ID: 696025c3047c1017
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so31734e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:20:03 -0700 (PDT)
X-Gm-Message-State: AFq9FYJHodNLkRIJcIDI/A3u8XwYpI3vbAxOLdiV79b2CFq1H17ax9pS
	0xbSxdH1xTy1e2aeJPolFoOd+LMvDsDUY2/e6T/o4TznesIsPugqunoCxnk/Ms32Tu8rak0zfKn
	IE6dHqYm0IhNfIj7UNjxMKfFMhnYb/TXjfXXgVi5c
X-Received: by 2002:a05:6512:39d1:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5be35cbd990mr74741e87.14.1791984002197; Wed, 14 Oct 2026
 06:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260605153248.2412064-1-weilin.chang@arm.com> <20260605153248.2412064-3-weilin.chang@arm.com>
In-Reply-To: <20260605153248.2412064-3-weilin.chang@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 14 Oct 2026 14:19:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw=vMvvmoQ==6pGDZb9Y3rgZN6Bg29cOoYAjhmK-eTQwA@mail.gmail.com>
X-Gm-Features: AclHuK-2zxxhToktFj1rc-j8CjjTBanqw9vP7b14CdsYAEhgF95q11O9e8ZWNkE
Message-ID: <CA+EHjTw=vMvvmoQ==6pGDZb9Y3rgZN6Bg29cOoYAjhmK-eTQwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Remove superfluous aligning of gfn for
 dirty logging
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_062009_831978_75087221 
X-CRM114-Status: UNSURE (   7.03  )
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

On Fri, 05 Jun 2026 16:32:48 +0100, Wei-Lin Chang <weilin.chang@arm.com> wrote:
> Stage-2 mapping size is forced to PAGE_SIZE when dirty logging is
> enabled for a memslot, therefore we don't need to align it down to
> a possibly larger vma size or THP adjusted size, they won't happen.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

