Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE95CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 05:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dHu+qfF+j3DIMFKc9HeoPvreOucdAuO+Jk5woaNYdI=; b=mfrJXZ97WNCVEpm0nheF7Nh6JY
	TSNcIma3dPM6eteeoTiKchrQpFptqoL1HYIYjUgM8I21MpLyxdAUxfwXEcgi1lfs+lMwCTGgUwruO
	cuqkfG+QKxN4bOgX55JGQjgBP/xX9BNUIeaBPijj6llf6ZFEdRa/MIk5S5VwgOwFuT4hSrRw55B/l
	PIUKMl4kA5Jn1muOij+tFqshPniDdeScDcOFBMCTGODGlulxY2dY18DoupeCMvQvdMlMTWVxznHeh
	5DIMRilemQIgGsFAbdQ7Li6uI9X1RMuYc+jY8dpFNdeDOuvtQL3HAtuaHPobTrHazviQDUa3GcQ6m
	piRrv/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ePx-00000005pih-0Vbx;
	Thu, 25 Sep 2025 05:21:21 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ePu-00000005phz-2IXR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 05:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1758777678; x=1790313678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1dHu+qfF+j3DIMFKc9HeoPvreOucdAuO+Jk5woaNYdI=;
  b=BrxJ6dZQKzhZ8zrM93yqzUflfUYm7lutPUgAfQvgw963DjZMjvNcJxY2
   wE2rKGUTyiOL+MKx3ehJEKJaw+uFUYCcgftzNy8Z6NCBSJy4L4wDmqde+
   eOrDl6qIo6bo9JAlrNdQp3ygmpaUtRkb6XlxUS3l82UZxYgz/4noO463O
   1PIuU+8Qlge/dSfajF97Hp57ZAYCxzhtQtc4cuCIOvsY6gOdT6xnPCicN
   4oBgby82BNJonk2+Pge0hxnFFlqa38G4YpcrvNtB2JwvDk4k33G70+00/
   J53LZvRiFyRrONZzGYz9wUdJuhe9E+RO27RdX+t5S6UTNcj/fzUJ5V53w
   w==;
X-CSE-ConnectionGUID: 2sgSshe0QCCvvjHAJKOFKA==
X-CSE-MsgGUID: iZZgazSASsCExdr9yR06Mg==
X-IronPort-AV: E=Sophos;i="6.18,291,1751241600"; 
   d="scan'208";a="3510852"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 05:21:16 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:54803]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.48.62:2525] with esmtp (Farcaster)
 id e01fb47c-faf6-4c81-a5a5-f369ea6453b8; Thu, 25 Sep 2025 05:21:16 +0000 (UTC)
X-Farcaster-Flow-ID: e01fb47c-faf6-4c81-a5a5-f369ea6453b8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Thu, 25 Sep 2025 05:21:15 +0000
Received: from c889f3b3a561.amazon.com (10.106.101.18) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Thu, 25 Sep 2025 05:21:15 +0000
From: Priscilla Lam <prl@amazon.com>
To: <maz@kernel.org>
CC: <christoffer.dall@arm.com>, <dwmw@amazon.co.uk>, <graf@amazon.com>,
	<gurugubs@amazon.com>, <jgrall@amazon.co.uk>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <oliver.upton@linux.dev>, <prl@amazon.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Implement KVM_TRANSLATE ioctl for arm64
Date: Wed, 24 Sep 2025 22:21:08 -0700
Message-ID: <20250925052108.27351-1-prl@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: 86ecrx1px2.wl-maz@kernel.org
References: <86ecrx1px2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.101.18]
X-ClientProxiedBy: EX19D046UWB004.ant.amazon.com (10.13.139.164) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_222118_646567_F1457907 
X-CRM114-Status: UNSURE (   9.83  )
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

On 9/23/25, 2:26 AM, "Marc Zyngier" <maz@kernel.org> wrote:
> A guest doing this is a sure indication that it is completely broken,
> and will fail on actual HW, because it clearly ignores small
> insignificant details such as *ordering*.
> 
> My other question still remains: why can't you perform this page table
> walk in userspace? It is actually much safer to do so because you can
> stop other vcpus while inspecting the PTs, and avoid a vcpu playing
> tricks behind your back -- something the in-kernel PTW doesn't try to
> avoid.

In our case, this comes from the Windows TPM driver using ldp32 to read
static adjacent CRB fields where ordering doesn't matter, but I agree 
that a guest relying on this kind of translation is problematic. We'll
drop this KVM_TRANSLATE implementation and pursue a different approach
instead.

Thanks,
Priscilla

