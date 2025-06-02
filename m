Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0885FC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 05:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnWLtTNpBdzbZLIVmUL1zq7dlaJMpU//9y4P59FbSIc=; b=1ISleDNptt8vgELuQL354LvRHb
	D6r0brtZAnLzBKOtoGFqDi0QFsgtEgKqevhLy5aj08AHLTox903zGzqG6xf3Zj10jc6gALT/LSBqs
	kVDWQcWB1lFPJuLn8H5wwAZG/QJ99d1Kfy4Ey48+xoMbVFv7Nd7VlFSDa+sbph1FSbCq/DPSZXaFe
	1Q/bgiqzyiq0RA68MGJKX1DILodXaUe0OwY+jzQOi6zXZuuVd/ipv6LdNRN0mYp+ioXNOv8xcC7S2
	xvSDsT+Z7ar5RHCc6DNfyATwZbXn8oNnTcHWVBxWYjEWijIZwSiG0sVYTryq8fluIcdhqFAKYcgXD
	w1fByw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxnp-00000006khT-0WLy;
	Mon, 02 Jun 2025 05:33:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxlb-00000006kZh-2hpk;
	Mon, 02 Jun 2025 05:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88A1F444DD;
	Mon,  2 Jun 2025 05:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB996C4CEEB;
	Mon,  2 Jun 2025 05:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748842282;
	bh=htmy+IjUpSNIPz1gu7az+7dIDslLsgMksI5QpgRTWMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1CpqV/YCZGbD2mb0xnDolaakWCo40GeeaZKc3TU44PLnRq3UwxEamArfybPHO8Cq
	 OdWIZxumNk0N7f8r3Aycu6ziAGjbGQd71Uz9YJQ1+h8FRXyGszY104AfDJE03V3hWU
	 Eyj649v0TJI9iCSf+46GVyJqBZX9QgCXfA7nVzsI=
Date: Mon, 2 Jun 2025 07:31:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.15 052/110] media: rkvdec: h264: Use
 bytesperline and buffer height as virstride
Message-ID: <2025060258-properly-pristine-f112@gregkh>
References: <20250601232435.3507697-1-sashal@kernel.org>
 <20250601232435.3507697-52-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601232435.3507697-52-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223123_731175_26D39108 
X-CRM114-Status: GOOD (  12.43  )
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

On Sun, Jun 01, 2025 at 07:23:34PM -0400, Sasha Levin wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> [ Upstream commit d5e0aa61470c48ddc04d433a00e79cef8716377a ]
> 
> Use bytesperline and buffer height to calculate the strides configured.
> 
> This does not really change anything other than ensuring the
> bytesperline that is signaled to userspace matches what is configured
> in HW.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> 
> ### Key Reasons for NO Backport: 1. **Not a Bug Fix**: The commit
> message explicitly states "This does not really change anything other
> than ensuring the bytesperline that is signaled to userspace matches
> what is configured in HW." This is not fixing a functional bug but
> rather improving consistency between userspace and hardware
> configuration.

As the bot said "NO", why was this picked up?

thanks,

greg k-h

