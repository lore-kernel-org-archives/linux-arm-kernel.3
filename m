Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CA6CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Fv1Bp2bH1mORCinYwV3hInnIPR9k0Mc9kzlEvAuOko=; b=pUon548o5qJAN16sY9nUKF841r
	bPLBpQV9nMhNlOuXs9kwf7PcKvYGnj0lHiGJqW3AvgaCFDRuO4o9W744rlLG6x4Izo0YI8WH3kwN0
	s7sZUYEP/xSHikog2kZ/egNJN//Vd6Co4RnKgikcTLvCG80fHA+rSp439HDb1GBSUWj90I8tGajCO
	wv9fnx6gk6g/bPKQoZBAh+LSvmYt6DE2HLUmr5fcjXmbsYLgaDgczAcshWk9TJqrFEP2kRixmXosP
	/S4DbG6l9NB7BmXb8NUUfQpn83iQnI7TdgC+MB03fbbiFpvfrEQNrbEwSVa2tPwSI7qjJjcLLdyz1
	6HWQDS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn2G-00000004KbQ-1prm;
	Thu, 08 Oct 2026 12:15:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn2E-00000004Kam-2met
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 12:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EDC6601DB;
	Thu,  8 Oct 2026 12:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35D71C2BCC7;
	Thu,  8 Oct 2026 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791461741;
	bh=4ODUPMV03VdBemqJmmhvAVMXz/2NymhIvG+Z8fEazdk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WnIfY0MP30ldQmC7BEHmqnRO89oB7ldDTfgZZYxclJdeXEJtQHWpCEKPvNgT12cVQ
	 Cge24dhxgyo+EN2y1WJrzASc5+p0SzcoiMr36C6tp5MixvaybkKe09F8F00ZNxoIRE
	 GYb6fH+t2DG5tVoNhzWeu6KAnvTmkzsR4OLN0gbJXt3C1KSe5slhlYjR0qLPKaGNyi
	 b7MFrfef1aNOib7GtEVepNX241/YsJ4s/QIUV7AeMxfQH6c/7d0T9X8QUYF4+sSmtD
	 fLXJJQg12lHS36F1ZJGdZCeDqV9qSUpQvi4xdbtN4SKYBe1Pi13gYEf11YpCGeFs7x
	 6M+CfUR6biLOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F432CA600C;
	Thu,  8 Oct 2026 12:15:41 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: Add support for Apple M3 and M4 CPUs in KVM
Date: Thu, 08 Oct 2026 23:15:39 +1100
Message-Id: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGuJx2oC/yWMyw6DIBBFf8XMupMiGvv4laYLBsZKW5CANU2M/
 y7o8tzHWSBxtJzgXi0QebbJjj5DfapAD8q/GK3JDFLIrhbiiiqEL6Nr0LX4mR3ShW4kuWlJG8i
 vELm3/934eB6cfvRmPRVNWZBKjBSV10OJTFT9dD60uzDXsK4bk1jkupoAAAA=
X-Change-ID: 20261008-apple-m3-m4-kvm-b7b9b2e34bcd
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, 
 Yureka Lilian <yureka@cyberchaos.dev>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791461739; l=982;
 i=michael.reeves077@gmail.com; s=20261008-m3-m4-kvm;
 h=from:subject:message-id;
 bh=4ODUPMV03VdBemqJmmhvAVMXz/2NymhIvG+Z8fEazdk=;
 b=k9godCQ6k6IjLO6XtMj7BaWGkvsuz4j44cDDnNlgk3dwYIILYaqrFQ97KPhtRllK9LFE+rJd8
 0aEIs/00G9xCt0t6+sdBFeJJ0xjg+9U/gDMEq966ZXDfR7WTihdCdDr
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=oi7WuppQ1A+qFZp9DdfIwDnpC3WZ+XY6fJK1upV/CSY=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/20261008-m3-m4-kvm with auth_id=1131
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series enables KVM support on Apple Silicon M3 series and base M4
CPUs.

The first patch adds the part numbers and MIDR definitions for M3
(base, Pro and Max) and base M4 CPU cores.

The second patch adds these CPUs to the existing Apple CPU workarounds
list, which is required for KVM to function correctly.

This series was developed from testing on:
- Apple M3 and M3 Pro by Michael Reeves
- Apple M3 Max by Myria Sarvay and Yureka Lilian
- Apple M4 by Yureka Lilian

---
Michael Reeves (1):
      arm64: Apply existing Apple CPU workarounds to M3 and M4

Myria Sarvay (1):
      arm64: Add Apple M3 and M4 CPU part numbers

 arch/arm64/include/asm/cputype.h | 16 ++++++++++++++++
 arch/arm64/kernel/cpu_errata.c   |  8 ++++++++
 2 files changed, 24 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-apple-m3-m4-kvm-b7b9b2e34bcd

Best regards,
--  
Michael Reeves <michael.reeves077@gmail.com>



