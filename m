Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB52C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUJ5ojOh2DQGZl4efmMHMaBqmtEVmQ/TmLAsz3AkV2Y=; b=zh6ZZCjjo1GiehCUCQXriOxv7u
	o7+7XqC60QkVK6Ylw/c0nzyShWxVuAlaTRtW+5bvv3rxcJwsnJANB0Ee5iqA/SazeKH8zTxy1nECI
	Nnm7juXqCsrP2ioFEqvdssExBWIoxFCUu4Cn/XgEQd9rNyzY0U61DjCEKWWcrmE5XHB09m3D+5ESv
	KRL8qkiMVgf4E8zCLsO/lAMx+fqyTQHqcSBa2x2SEh1iWUqmxiiciMXNeobe0Az9XJAkKJqQO+Jbn
	eFIwOSN76QfM9O9bzkqRU+eaHo4b/njKVRhsMWDI0fUCHcWvvp82PiEG6EcA6iXnBKsbygQr3ahC6
	b5bb9BRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6vF-0000000EYaS-3vDs;
	Fri, 14 Mar 2025 15:26:05 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6tY-0000000EYF1-412a;
	Fri, 14 Mar 2025 15:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741965855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PBE2WetXVXfy4uVLZSjdr0eFNtrxtlpdjHnGeSg3aogrmtfdXWpFAujCTGARAjPJUw5xRIP8VlFar80FxGLH7TRRimD+FCTkuRiFfOwR3r88KO+MjuLbY5CJKNzUEN/H9CvCyUt6Pp4ULo3CosWJ6D8vPjT/oLvPHDJac0MjJtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741965855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OUJ5ojOh2DQGZl4efmMHMaBqmtEVmQ/TmLAsz3AkV2Y=; 
	b=Mnn0MvNjXKZWo4n07bY4Fin+L6y0I+rPeF9EkCL3TbG+GpVb7xPgQs78dam1dTfChg49QINYwrMFmgYQ7CDEu6fhFdLGeliaeSaa0kJFP3LQafvgJp6D/06jmePAq+d8BcThHlWPIcGvfLM1n82q181eQh8k4er8RwGOxiRGh8w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741965854;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=OUJ5ojOh2DQGZl4efmMHMaBqmtEVmQ/TmLAsz3AkV2Y=;
	b=ZLkJGJCl43jXzQl9mtozrGOXCEtuICvdrhvG6NDLUMPz/yoa74a5k/6AXfxUDQYB
	yZueeCPWYtY+1u1WboxlhTXBn+PrPvYnzbFNULLQfzkWDkDNQckeN7EEr9XyEGgpOES
	Y9NsgBE0dyFjlsgz56BgV0/1vIcZyTbZdqb57gJE=
Received: by mx.zohomail.com with SMTPS id 1741965853063954.058894236911;
	Fri, 14 Mar 2025 08:24:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: joro@8bytes.org, will@kernel.org, linux-rockchip@lists.infradead.org
Cc: iommu@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/3] Rockchip IOMMU fixes
Date: Fri, 14 Mar 2025 16:24:08 +0100
Message-ID: <13295142.O9o76ZdvQC@workhorse>
In-Reply-To: <cover.1741886382.git.robin.murphy@arm.com>
References: <cover.1741886382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_082421_063015_5F0B7CBE 
X-CRM114-Status: GOOD (  13.70  )
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

On Thursday, 13 March 2025 18:31:03 Central European Standard Time Robin 
Murphy wrote:
> Hi all,
> 
> I was expecting my DT probing change to flush out issues, and it seems
> some weaknesses in rockchip-iommu were the first to show. The first two
> patches here get things working again for me on my RK3399 NanoPC-T4
> (with a console on HDMI exercising the VOP MMU), the 3rd patch just
> finishes the cleanup since I was there and could test it.
> 
> Thanks,
> Robin.
> 
> Robin Murphy (3):
>   iommu/rockchip: Allocate per-device data sensibly
>   iommu/rockchip: Register in a sensible order
>   iommu/rockchip: Retire global dma_dev workaround
> 
>  drivers/iommu/rockchip-iommu.c | 61 +++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 35 deletions(-)

Tested this series on an RK3576, which indeed fixes the boot panic I get with 
next-20250314. After looking at the patches with the full function context, I 
can't see any obvious issues.

For the whole series:

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli



