Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B6AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYN2Bke3VREHxmieFqP1r5nOcD97yErLgzUz8SxXVYo=; b=lbnxPBRA7k9rzxKbzoaGP0odb0
	0ozqY6DYwF0OPf3VpVTa7h2t8y7id04fW2u39hn1epNUVtnLBpbyMhCbVCFUa6sWlcEnaa0RzG1Rz
	3+Wl51igROQgPv2o+jCt1jFwwAbqYan6l3VxRbzHEkc+aWAw58R1iyRFdDlJJsHr7THu3Umqumziw
	+SJk0CLrWEe9jgR3L00k1v3nhrCZ5bh11zc2Fot6AM6lJs3h3sAfyqzTIHR07QrdbOcjt2A478M/Z
	kocYWsdQaVAn1Hfp3n9vXhQ+/ar+RkM4GtfnIJJWS9UVJd/OxVqsSq5MtlXhdkviA9W89SjvU+WkU
	/nHK0FRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rpj-0000000Ami4-2O4h;
	Tue, 29 Apr 2025 20:45:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYw-0000000AkWj-0g3O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFF5BA4B4E2;
	Tue, 29 Apr 2025 20:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B92CC4CEE3;
	Tue, 29 Apr 2025 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958497;
	bh=j6cRsnJcuJGGzquyyvJ5hVFHCEDkziQIJdUywXnkqdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EklBAx+Sk8O4MDypA+nM92eodqBUZf0kdoLrsXb+d2WOK1BU58bLd3a5sXIc62A6X
	 er/oXBPQw2TWvWNyWIuXZt2mK82LBRX+7xXyQV17jPEGkuPJXDuyK0O2f//Bd3hdNV
	 ZeJg1YvouKFQoecBZHnExac9vvKbsKVZ8ko3mnofvs6yPuAOUta+8QqrzqmMENxPAn
	 /SdsjlE/DGEhU1XKnrIsGv0KgIVzpdYBhbrMxrItAEjSoS57ga4wqh0KHUhFhJxLG+
	 eTzpLa6MbPkGYk1NoTQ3X+kKHz9gq0wM2S1HG4QOUGPl0Df0PCP8J488BT+AfNblFF
	 L3WmnVM6fUT2g==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miaoqian Lin <linmq006@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
Date: Tue, 29 Apr 2025 21:27:50 +0100
Message-Id: <174592994212.427921.17461621351639066667.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250318151712.28763-1-linmq006@gmail.com>
References: <20250318151712.28763-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132818_259730_FF347021 
X-CRM114-Status: UNSURE (   6.78  )
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

On Tue, 18 Mar 2025 23:17:12 +0800, Miaoqian Lin wrote:
> Fix a reference counter leak in psci_dt_init() where of_node_put(np) was
> missing after of_find_matching_node_and_match() when np is unavailable.
> 
> 

Applied to arm64 (for-next/psci), thanks!

[1/1] firmware: psci: Fix refcount leak in psci_dt_init
      https://git.kernel.org/arm64/c/7ff37d29fd5c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

