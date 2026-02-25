Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527B5FD3779
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:CC:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRY5VNh5WJAQAaMILsab9VN7315yMrX1I852eDbxTtU=; b=DZdpP316HKN/HtAaZ4sXIrXys6
	bVZkZBJl9bBTXLVYQhP1eo9uhjoKoUi1rILuCJS4vCIosSe9CSr+evF5bMin8b34D6WE2R/fc6r7C
	uZOsHyAMNhvMFI0l7I4SZVoznt2aZidXFOgnn9RD3haDBtTkH3o3LcXCudqkOj7bmBMxkP+h7u2Ae
	BwCcsoF8WNLwCDCUddpZlnF8lF/0VL4BIeWreYHaqjkOhpQ04waOcGTEVce568K+1DJ2/ecCGQuBd
	q2jArjbWLN6d8BbnekMorOhnSaAe20vNA7CsYDLGyzIVbZneX93QYI0/PBPBG7ySr7t/IaC5CXv3F
	Dz4gCVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInx-00000004fWJ-4BZP;
	Wed, 25 Feb 2026 17:36:10 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInu-00000004fTr-3CW4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772040966; x=1803576966;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=YRY5VNh5WJAQAaMILsab9VN7315yMrX1I852eDbxTtU=;
  b=IdBsFvR0rGwa8YN2WuuCGEOvaU2FD0kq5G5AVPZhSQ+gcSvopkSY0tO8
   wRSpoP461zomP9jz4Lx/QjbvG/Pl4fG2TRpxVDY/NsIhVgFvzWN7gZYqr
   W/MrFIvRklrD3YdBhp7w5USbpqzv/BU5f/zbXBnip3OD3QfC0yqlN6QXA
   am74riEaX0Uij0W72E16eGHGWQoQYOJUuTV4NU6dUeKjc5oxE51czV8rn
   YQy3upQ2rQpclKmkP2UtJvnl2z8C2+1VXXxk7AV9ky4Ci2fcWAh6Afzaz
   Pz7+SlozTjcxva6ngzEzmTsnn9N8223bHENRZBlJHWc55ua6FHMVx4PdA
   w==;
X-CSE-ConnectionGUID: 8uhsIv4TQIe9EcUHkouJpQ==
X-CSE-MsgGUID: ba3PhwdMSXS3IlmTrBGnTQ==
X-IronPort-AV: E=Sophos;i="6.21,310,1763424000"; 
   d="scan'208";a="13593227"
Subject: RE: [PATCH 17/17] Add standalone crypto kernel module technical documentation
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 17:36:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:1793]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.86:2525] with esmtp (Farcaster)
 id 93693ec8-671a-42a3-87bc-f5a3c251f9ed; Wed, 25 Feb 2026 17:36:02 +0000 (UTC)
X-Farcaster-Flow-ID: 93693ec8-671a-42a3-87bc-f5a3c251f9ed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 25 Feb 2026 17:36:00 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 25 Feb 2026 17:35:59 +0000
From: Jay Wang <wanjay@amazon.com>
To: <ebiggers@kernel.org>
CC: <bp@alien8.de>, <catalin.marinas@arm.com>, <davem@davemloft.net>,
	<herbert@gondor.apana.org.au>, <ilya.okomin@oracle.com>,
	<jay.wang.upstream@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-modules@vger.kernel.org>, <mcgrof@kernel.org>, <mingo@redhat.com>,
	<nathan@kernel.org>, <nsc@kernel.org>, <nstange@suse.de>,
	<petr.pavlu@suse.com>, <tglx@kernel.org>, <vegard.nossum@oracle.com>,
	<wanjay@amazon.com>, <will@kernel.org>, <x86@kernel.org>
Date: Wed, 25 Feb 2026 17:35:45 +0000
Message-ID: <20260225173551.8704-1-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225015517.GA162634@quark>
References: <20260225015517.GA162634@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWA003.ant.amazon.com (10.13.139.37) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_093606_850754_532267C0 
X-CRM114-Status: GOOD (  10.83  )
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

Thanks to everyone who has taken the time to review and comment.

Based on the discussion so far, it seems the core question is whether this feature is appropriate for upstream at all, or whether it should remain entirely downstream.

We’ve discussed this with a few folks, and to help clarify the discussion, let me outline what is actually required to use this approach and what the community would gain from upstreaming it:

1. Maintaining a crypto snapshot (for example, a source code snapshot used for streamlined FIPS re-validation processes such as NSRL).
2. Maintaining the loadable crypto build infrastructure itself (i.e., this patch set).

For (1), since this requires maintaining a specific snapshot, we acknowledge that this is inherently a downstream responsibility. We are not expecting upstream to provide or guarantee a stable in-kernel API (to clarify, a stable ABI is not strictly required here, since the crypto module can be rebuilt against newer kernels and still benefit from FIPS through the shorter NSRL re-validation process of roughly 3 months, compared to the full 12–18 month certification cycle). The upstream crypto subsystem should continue evolving independently.

For (2), since this feature mainly serves as infrastructure and is of interest to multiple distributions, upstreaming it could help reduce the effort each distribution would otherwise spend maintaining similar infrastructure patches independently.

We’d love to hear more thoughts on this. If the general consensus is that the downsides outweigh the benefits of merging this into mainline, we are happy to maintain it in a separate repository tracking the latest mainline and stable releases in order to keep the work publicly available.

Thanks again for taking the time to read and discuss this.

Jay

