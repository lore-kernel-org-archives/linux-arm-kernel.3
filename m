Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A62C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StHA9XnRit36bUaZJzdb2+ZWDgs+b+/TBkIl4atoWKo=; b=n+JlH2EJd+90iPbdtahGJ3LkzH
	EJHTM6c9CUU4l2LHRh004PpexqGCNqU/hZ1Ms2r6Mgmrsec8DO73+Uh/2OsIPCpx8Q90T46WyFyXs
	rFhXne3tAJmgJAarCvK8j72NtX8PUphGq6i9MtLfV2uwey2YEOAT3zWi6gYv9p16ubN8YP9cXDePE
	+ohB+gkmwU4Ne0ZheHxykcZ3YQ0AQc9WPj7NyYhDKpt3ENF+Xw3Bkpn+x8ZMdDVUD6tIsupTwEy6x
	70Lqy3W0uB+t/mZCOVorQwK7/t701gylsSULDQHRtvai7Pg323u86Bg8Ct3T1CF3zEyc3k3MXwnJu
	uD6foTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB6L-0000000F4cL-1GE6;
	Wed, 14 May 2025 12:20:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQV-0000000EuSs-2xmX;
	Wed, 14 May 2025 11:37:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A4F64A681;
	Wed, 14 May 2025 11:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3D0C4CEF0;
	Wed, 14 May 2025 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222650;
	bh=BYLy4VG9xOVs94mC7wIDlxr88txhDai/COmTvrqUImI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QpCARnYHBCnmD9i8RUKRToT+x6HCADCEoMOlwLouPPWWEpr7kxNvnbuHOlV2pF4pN
	 Ey2SdjumPQLi3i4i5GUlSMU011+0l5LdTNc3LGslQkdfAFTBL/TWUgJbCISZV3teLC
	 LDCQBdHtj4pYur5raesDHyI8qrcneC5P9fd6ew9mc4gRbMjw/LNi++8hDWadBo6mPw
	 8T8UcyOmA2dSArMY0jV5jK7B47DYVVQH23bTtVeBHUrRCPYex80k6pgxElqbIwE7CV
	 ib+oB1MbDgFAtTSbB9hsovWsIfRQztKDU9GNfnkxzMY3BNVUaW2783HcgGGgcx7QdU
	 adTWIRyQ1o7kw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Mike Looijmans <mike.looijmans@topic.nl>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428063648.22034-1-mike.looijmans@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.298e943d-5a80-491d-b36f-77b3b9a86df9@emailsignatures365.codetwo.com>
 <20250428063648.22034-1-mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] phy-zynqmp: Postpone getting clock rate until
 actually needed
Message-Id: <174722264836.85510.7340097492825315236.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_043731_767356_0CDC543C 
X-CRM114-Status: UNSURE (   6.98  )
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


On Mon, 28 Apr 2025 08:35:47 +0200, Mike Looijmans wrote:
> At probe time the driver would display the following error and abort:
>   xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
> 
> At probe time, the associated GTR driver (e.g. SATA or PCIe) hasn't
> initialized the clock yet, so clk_get_rate() likely returns 0 if the clock
> is programmable. So this driver only works if the clock is fixed.
> 
> [...]

Applied, thanks!

[1/1] phy-zynqmp: Postpone getting clock rate until actually needed
      commit: 065d5885f6180c534b7b176847b3e008f4e11850

Best regards,
-- 
~Vinod



