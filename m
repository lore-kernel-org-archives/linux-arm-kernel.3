Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59590CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy4gkqe2RT9fQ7P2smtTj/nepgugYBkQhIdkpt1dzQQ=; b=T1ws4hee+RvecT+zSThui1U06h
	B4uucRo+OIH0waMR6fD5erPP5wtUaK83WYBrzroXIR6N8dHr2gC9y1TUgkgfebXvOe8xiiJRLY7Zm
	qGAv8tGFJ0rCOtO202Nmyzi7a8dSoVq9RQaw+Ci4yOBMfNjlxtFdLlCY1Pi/32oXbm3oio5rXeTkJ
	CgZFZzOrFeNyP6awFuq1rRRwVm7Xob9MIdrj3CQY0fQiUTlK8XaItOSHDVDPfn8N3qVPNVfEbA2Um
	wtSKspe6xs+fPwDFODTgin0a1FPjvGSMaXx1fOafR1yzm1vq7bYQgIAsG9DQo8Hqa4s/e1ZVj8y24
	UjlY1e2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEm9s-00000004Dnf-2jn9;
	Thu, 08 Oct 2026 11:19:32 +0000
Received: from out-229.mta0.migadu.com ([2001:41d0:1004:224b::e5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEm9q-00000004Dmz-42a6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:19:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Vy4gkqe2RT9fQ7P2smtTj/nepgugYBkQhIdkpt1dzQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458369; v=1; x=1792063169;
 b=BtiYGz4tJMkfwUwWgbOC353UyhehRLFmj0cpaLl9C1Jz816hGOQhdWgnyL5W6c4mboVOBftL
 zQ0MBnxLMd1jvTr2drBGT/+TXXMnyXhXPrIa4cxW/n4jXpSHdF/Zpvd91qQbbqDO7yJqhMqk3tF
 uBw/r085iAstgP3ENNtekssU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ef63d99f3771bcb2;
	Thu, 08 Oct 2026 11:19:29 +0000
X-Mizu-Trace-ID: ef63d99f3771bcb2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5945e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByN7Rw6LtVlkwR7gwZTNjTzuM9pKtLwXQN63+p/qV9R7Lp2EHref1838cN2FonlMKXQLJ/E6B7I8U2Y/rM4eXRu@lists.infradead.org
X-Gm-Message-State: AFq9FYL4B6EwVfIB3Xwu9HnBJ5MRuGqRf1aO5/UuZOaoAMyBrcr6ekCs
	AocTii0iFw81fSFkbwhgGwbX+oobhe+xuCbTcJUwTqHikFVgDx+k8ES8rCpJ2SvXerHioih03/Q
	swOxE9si2r1jr+MwBb0yFGVsrxDObilyLvojs+JbQ
X-Received: by 2002:a05:6512:3504:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcd5895443mr96775e87.13.1791458368094; Thu, 08 Oct 2026
 04:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-2-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-2-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:18:51 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyXg3ULW0XYkeA9P=zdXXMN7oszPiFHTYLPQ=GG3M_pig@mail.gmail.com>
X-Gm-Features: AclHuK9-1zLMDgd3KEIfnpqD4KGBnBg3Da2FUX2mIU2fGj8x9pVLP1_bf0_EVHw
Message-ID: <CA+EHjTyXg3ULW0XYkeA9P=zdXXMN7oszPiFHTYLPQ=GG3M_pig@mail.gmail.com>
Subject: Re: [PATCH 1/5] drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_041931_138064_764368C2 
X-CRM114-Status: UNSURE (   8.93  )
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

Hi Vincent,

On Wed, 07 Oct 2026 16:02:51 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> pkvm_init_hyp_services() is only called from kvm_init_hyp_services(),
> which is already marked __init. Mark pkvm_init_hyp_services() as __init
> too.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

I tested the series with a 4K protected guest under kvmtool in QEMU,
on a 4K host and on a 16K host. The 16K host also requires your "KVM:
arm64: Fix protected VM fault on system with pages larger than 4K"
[1]. That testing is same as patches 2 and 5 as well.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260915091606.2111217-1-vdonnefort@google.com/

