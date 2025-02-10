Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02842C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bMwBf8DI2ybdmv+zq4GM7AQDZt1piNTaqNHdDDz1ME=; b=GevQt5yWvciEd22bdqBQnfnfDu
	lqZ8wCB3i/fAz9jHn4E03JazOAQs27k9q4R3YX3RRnqim34LnLybSG+nbDn0DU51fZPulUaQd/vUK
	4HvNUQZgsqLbmr70UKdOYAqw28NTI2tzO9B2/gS/iyjMtODcdQjfo4qqNNc4oUZZ3z4KJcV8BluxX
	FFHPdRU4Z1pHh84QqT0kY2pUrLdMwwhho9aJ1JiUtLWoIRzCm0Ohpx9Jx137kBaW6w9DSm/i+D+AU
	wgiFtUvWbBAEj1Hr1kd13SXCAbr32aKvKTt0qpCO8UqlB9NV7wdpPhZ4QgLheO8DFo2O5d15Ss/44
	wx8aD0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUMC-000000003Ve-0OyJ;
	Mon, 10 Feb 2025 14:01:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUKn-000000003KW-27XX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:00:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739196014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n94BGAh9My2h/aIZWWxJTF7Xf8ZAygB0BAhnATh5n/eiYCUlnUDVfueAT8aiHTfiUBhOCK/6EENwBQg6xkow0doOMQ5A3lzU3pKDNfYyyIosv2mrQpVPi+xHT+8AREo4UDL19/fKM66UDx7f0WpwgKgeDEFm+inR/KwR5Ed+Qug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739196014; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8bMwBf8DI2ybdmv+zq4GM7AQDZt1piNTaqNHdDDz1ME=; 
	b=hW8bsrmGxTwraNzvJNWIAYYddF7FyCL8cGsCf+xdSvB+muN8KkTOUvPKLrMG/DViAnrqCHEz84ztxVam1YCNwPiORCng3puwZsVgJ7zUVSFDyXI1PQ7PLfBuEo2ii4v9CBRJIS0vn8Dv2HRcT6NJWDKmv76JtkRLvN/ASPzFu+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739196014;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8bMwBf8DI2ybdmv+zq4GM7AQDZt1piNTaqNHdDDz1ME=;
	b=KYQPe4yXqLt1VWy5tKYKQ/dqp8k84LFPN5v6PYewWKV7qLEGIHlZ/dMoTW6YMTfc
	dQ+zrqyouDNPiqBlOGh68qgMFJkKi20pwP5dLOPYoIuYVCLNE1jgUyXQSWQx9bldi5b
	y/LpU+ssyLEOWHymUjwT6YS1jE6/slPJ1Ej9v48A=
Received: by mx.zohomail.com with SMTPS id 1739196012032335.813176114179;
	Mon, 10 Feb 2025 06:00:12 -0800 (PST)
Date: Mon, 10 Feb 2025 15:00:02 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH 2/8] media: v4l2-common: Add YUV24 format info
Message-ID: <20250210140002.rhhxn3z4l3dbyege@basti-TUXEDO-Book-XA1510>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-3-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-3-nas.chung@chipsnmedia.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_060025_610833_B313476C 
X-CRM114-Status: UNSURE (   9.75  )
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

Hey Nas,

On 10.02.2025 18:07, Nas Chung wrote:
>The YUV24 format is missing an entry in the v4l2_format_info().
>The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
>per component.
>

That means that 0376a51fbe5e1 was incomplete, I think you should add a
fixes tag to this commit, to highlight that you basically complete the
previous commit.

Regards,
Sebastian

>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>---
> drivers/media/v4l2-core/v4l2-common.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>index 0a2f4f0d0a07..de3636f1cdf1 100644
>--- a/drivers/media/v4l2-core/v4l2-common.c
>+++ b/drivers/media/v4l2-core/v4l2-common.c
>@@ -269,6 +269,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
> 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
> 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
>-- 
>2.31.1
>

