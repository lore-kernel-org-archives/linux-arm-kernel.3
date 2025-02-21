Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9079C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69nmCdc2otyVDSs2X7eNNkVOyeJLkyJqYKyGIdpaGM4=; b=aBIBFLM4g/M64LdRwEKmWyDiSI
	S3viVAtGa1n0VwM/JcYdZRg81kAAWZ4GB6nQeGAJgqXdmWTFv9T5NQGeA3lrtfD/InzsTMGKUDhsk
	oGpVmylal23dKGWHMHczn9+K/hCcDUb8mOzdKaOMzzPlqjaFokbbIlp2HNMxF9lymsPk//57HA/5b
	o5czaF+J2jXTGbTRu7oqv0Tak1MhWIIwJoXvqEaHNXad7zHhDoHOUAyhWh3kC+3CJiVVOSYTcsgVd
	Cd7uuUaCOzo5gMh/bLEHEzHDoxxwSf0Cxi388Ll6Tct+aUPNlrHi2Zkrxlczy+7qo2OU10+yeJIAl
	mdbrReKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR0b-00000005J1D-2vY4;
	Fri, 21 Feb 2025 11:15:53 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQsT-00000005HTW-39dZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:07:31 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D0A7843239;
	Fri, 21 Feb 2025 12:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1740136045;
	bh=OrLEWszAt2g2+uaXn+6b7I4pNNFvvjaXQB2Xr3LTA2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2M5E8KCTzPNGrxqs18aAYCoIl9eUVImV5UHpfOg207LBMzwJYHq1CoQ+EYEvq/9rO
	 dpQSRoMk/9zo7qNj8B4FNOZQJNsqmeHj9AWt43J7ZExMLvvPAEQxoKyGzs+K8z9DEx
	 Ir+VvoMd8L3YLXlACO0Y9QrbmM1CDMUDLzjcp10d18ABnhXJNaqwbabuCruA4iuBJS
	 X//lPVrj7j8NvfhEOAHJZ367reL5bJfnWXqK19e1vAuErHMMZbkOtyelvTSbJFdyk1
	 R/Lpd8AvFuDFWxE1g5kxqJ/tXLRBTFoyLqVlGDNlaciO+07SKvzk3FD8T1TTmdDCa7
	 F/IjpeYoedklA==
Date: Fri, 21 Feb 2025 12:07:23 +0100
From: Joerg Roedel <joro@8bytes.org>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Hector Martin <marcan@marcan.st>, Rob Herring <robh@kernel.org>,
	Janne Grunau <j@jannau.net>, Joerg Roedel <jroedel@suse.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH] iommu/io-pgtable-dart: Only set subpage protection
 disable for DART 1
Message-ID: <Z7hea_LY7u_7_jTw@8bytes.org>
References: <20250219-dart2-no-sp-disable-v1-1-9f324cfa4e70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-dart2-no-sp-disable-v1-1-9f324cfa4e70@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_030730_020487_0B0BA20C 
X-CRM114-Status: GOOD (  11.53  )
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

On Wed, Feb 19, 2025 at 10:13:53AM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> Subpage protection can't be disabled on t6000-style darts,
> as such the disable flag no longer applies, and probably
> even affects something else.
> 
> Fixes: dc09fe1c5edd ("iommu/io-pgtable-dart: Add DART PTE support for t6000")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/iommu/io-pgtable-dart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

