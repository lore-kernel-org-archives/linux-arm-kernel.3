Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07ACC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8dujvmgK4dl/NXr7CvP1EwjRXMje/JjztxTmi7ODS8=; b=QhkFDXXoO0ynkfvU/X05ainH4H
	D3jFfJX8LbTbgnKykSIf4LQHGSg899YEj/TOdNf7tBxbQTR9gtG2rWP6p+3fOAO9JHz8JPfkKgGpg
	yHgnk36ioqAZAthqc7uM5U5dCXXEm4tKvphxI6jc1HqfPJ2/BLCvumk+eaBwwuYA4lpSMa088CtmQ
	TTLDHWBnT6ErFyRxVLeCeuPsEi6Waxw/OFieVLqdo5zdfZyj140Nc1N6Qsf7aG4KbA03lCbbj8mez
	0MsxRTzzrxx2YPnBTsWxNy74n7tzzegCDUUPv5BETQpWZPE8vrKBOqyeVidQdVM5lOhu+34hLrRey
	raRvrDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL1R-00000000BRW-0UKP;
	Thu, 15 Oct 2026 12:57:25 +0000
Received: from out-243.mta0.migadu.com ([2001:41d0:1004:224b::f3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL1K-00000000BOa-0b6p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:57:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=j8dujvmgK4dl/NXr7CvP1EwjRXMje/JjztxTmi7ODS8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792069033; v=1; x=1792673833;
 b=mZnEnph1NsfCOOhywNX7fVSoWXX7Zi9nR8ALAzfN+DX+0lwGE1SYwShqIdMmQJ+zQohwArB4
 nfcQiLAw+Vwnqj4TKWKih+Zz22M5JQniKcsJKf1nhVzObd7eunB5XaVcmkf6MrWPXXOlBThBQ7q
 J+hp4KeHBfdGYwCQRMDAdnuI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5aeab5d2299b6ea8;
	Thu, 15 Oct 2026 12:57:13 +0000
X-Mizu-Trace-ID: 5aeab5d2299b6ea8
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 0/7] KVM: arm64: Fix cross-CPU vcpu pausing
Date: Thu, 15 Oct 2026 13:57:12 +0100
Message-Id: <20261015125712.2650518-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015100539.1011760-1-maz@kernel.org>
References: <20261015100539.1011760-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055718_902497_DBAE7CB1 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Marc,

On Thu, 15 Oct 2026 11:05:32 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> This series addresses these defects, and builds on top of it to:
>
> - add pausing to a single vcpu in addition to the full VM pausing
>
> - convert LPI disabling and the MOVALL command to vcpu pausing
>
> Patches on top of -rc6, most of them being Cc stable without any
> qualification (this has been broken for as long as I can remember).

I'll send a couple of nits on patches 2 and 5 as replies to those
patches.

For the series:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Tested on QEMU on top of -rc6: npVM and pVM boots in pKVM, npVM boots
with nVHE and VHE hosts, and vgic_irq and vgic_lpi_stress in all three
and with kvm-arm.mode=nested. My reproducer has vcpu 0 clear vcpu 1's
EnableLPIs while the LPI is in vcpu 1's LR: on -rc6 the LPI is still
pending on vcpu 1 afterwards, and with the series it isn't. With my
vgic-its v2 [1] on top, my MOVALL selftest and my shared LPI and DISCARD
reproducers pass, including with PROVE_LOCKING and with debug hooks
that force the DISCARD race.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

v2 of "Fix LPI double mapping and DISCARD" [1] applies on top of this
series as it is. Would you take it as it is, or would you like me to
respin it?

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261013081646.933312-1-fuad.tabba@linux.dev/

