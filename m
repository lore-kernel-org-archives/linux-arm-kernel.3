Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9947C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTva8UzxxbQ8NujKh6DyVU6h5IoA86xjeQEiXl752lA=; b=H4gnhiz31NZizx4jg9mCDmZF3i
	Pr4gQrvuidqgK2tT4bxXzeeQ4Tu3TGUP45XEnDmURLuum6lFhbHRHCubLzz/SiqL9C3K4Yysk9Dcc
	KWYeMScO7Vg6z+t4BR11rEphBjg0z8aTpTRLZI1EPP2B0+J4+A5cnTmeOC8BLw294uPEC5/h5M2Ep
	UsFDnEery3Hh9qmgCfvoEKUdHLhgvHGDfWAbG2RZlQe7Tz3xZqwMVjANvG0nMPV+KpMD3oE8QJ3Pb
	HCu08Qq3cKnNYc5C8Xce89DwwAXDOHh1i5JBpuTdGscdKf8TdPTwgKBSWhs+AV+hJ1wlFFS3cxd3B
	jA90huEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqCO-00000006evz-0D08;
	Thu, 22 Jan 2026 08:37:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqCL-00000006evb-0PEt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72BB44405B;
	Thu, 22 Jan 2026 08:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE8FC19423;
	Thu, 22 Jan 2026 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769071068;
	bh=SfmvWqRZsDc45SxQJtfNXD/CqX0o2X+iPrylB7CAmNk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Ip8L3Q6roPH4UT/uSKbKbAbbRltqOIGkmay/HPfUl4xOxKE9pV5oLwcT6fPS/he35
	 +k5/K+5iCTmB2ygSQfiKco4SQ+kQn7NtnU19Rd7kt2W/1BoMaJMrqmBFKhJlUEXvO2
	 dU+DiANH90rxClaSjP9Od6bF5Pi6Mb6pul5ny/wd4YsKkijB75nRcyBihea4Pgb6LH
	 EAMVLPrL9UzLTZEdYYYEalM6t9Ob8NzK5T2oxYnUkzUVkffiQHWPE+Gkz4est3G90q
	 h/ZU833scwAHuAZp7qfgLt9wGdShw5XCq/R+7UHnK8W9594lTUDo4K8f9GQL7o/4Gk
	 Ny9lzyTKrzlZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 09:37:44 +0100
Message-Id: <DFUZCRCTYP67.358VJGW8MOFSH@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <robin.murphy@arm.com>, <robin.clark@oss.qualcomm.com>,
 <hanguidong02@gmail.com>, <quic_c_gdjako@quicinc.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
To: =?utf-8?q?J=C3=B6rg_R=C3=B6del?= <joro@8bytes.org>
References: <20260121141215.29658-1-dakr@kernel.org>
 <mo5v74ryxfwik4ggr56c2xha34sfwq2kq6suxi65pbqxrdppnj@oqkirr2kgrey>
In-Reply-To: <mo5v74ryxfwik4ggr56c2xha34sfwq2kq6suxi65pbqxrdppnj@oqkirr2kgrey>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_003749_177973_01A038A3 
X-CRM114-Status: UNSURE (   6.15  )
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

On Thu Jan 22, 2026 at 9:18 AM CET, J=C3=B6rg R=C3=B6del wrote:
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>
>
> This patch should go via the branch that contains
>
> 	dc23806a7c47 ("driver core: enforce device_lock for driver_match_device(=
)").

Yes, I will take it through the driver-core tree.

Thanks,
Danilo

