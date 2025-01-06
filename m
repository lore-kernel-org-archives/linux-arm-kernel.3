Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90992E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmyr51wBaWMVsQf9Gd5l3648NBOuHaUG4V2slFrV+uY=; b=XOGlRUjXDNw2AfS3xev/wF46dF
	rLAibeNEGMnzKv4lc4k4Pn+E8rxCZT+KM0GR9OHsJLekJDozjIv2KR0GZebEtNqh+pZ5BPijjUxRb
	C901MM/5WhI1g5QzPCmfNWfmAUsDT5ban98iEFqOiXHhohhZW4Pt2rhY6LqBoYGweRqzCTegVB9aT
	/IB89bnnF4t6yww3MA03enAU0Dm6WwjGfF02Enclso+e/7CQj8qBm00zk1Abz0kwbIV3SrmPPosnU
	QOqAP+VBQMOWVfyP6TryfjkhZSKL+ouAWRtKhYwnEKiLtXmUB60PTkxOPlisempxLj8/zZvMFLNsE
	1g2h4MpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlDF-0000000128N-1GHt;
	Mon, 06 Jan 2025 11:24:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlBt-000000011nu-27Xi;
	Mon, 06 Jan 2025 11:22:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736162538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fd4GPL7WAp5LG34Vk++s+97YODkquIiSHLE8seNW2x5mg9HCDyEpxYvkBWWKVUtzHftMbUaMbUpYDkQTyGftpE///5AjmVCjAyKNZb69ayywWf783VnZKvhU8EBNprey2Idgqz//f1lOec9M4Rs32NP3B5qbfxX/VkJhjlBmjYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736162538; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tmyr51wBaWMVsQf9Gd5l3648NBOuHaUG4V2slFrV+uY=; 
	b=XoI4KlcZlFWaeYBZIN21DJfdtZTf58mh+VqV+aDjjfknaU0CBJAT3YYBz/KFUaKZ2Bw7E5BN9swbGR7nlPJWpV0iMrMLTv1U/q23AziYYc8b+bXJzKJs3KyuWYNEb5KvUjW/8QIUzvQbOfsjdKvCk/eblkwiwMtgyZcMfHjEKMs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736162538;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tmyr51wBaWMVsQf9Gd5l3648NBOuHaUG4V2slFrV+uY=;
	b=YGe46b57Y9XwcTg4kGMv9YEn4OWqmTlaA/ibgGfzK88oHWDHviao6wuX+jwHo0vr
	SaId5uLmSrnVIyWk447c8hmxAgnSuY/dUuztJIKk2x6/JJZfyev07jJII/xyhTWnI2m
	3BsV3pRwaj7QjL59CIdWlJGI0woiCNn9QqLRW7W8=
Received: by mx.zohomail.com with SMTPS id 1736162536761759.2420010727011;
	Mon, 6 Jan 2025 03:22:16 -0800 (PST)
Message-ID: <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
Date: Mon, 6 Jan 2025 14:22:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_032238_416148_2B939435 
X-CRM114-Status: UNSURE (   9.49  )
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

Hi,

On 1/6/25 03:16, Tim Surber wrote:
> I applied your patch to rockchip/next on an FriendlyElec CM3588 device with arm- 
> trusted-firmware 2.12. This is the same hardware/cable/sources I used previously
> Sadly I could not get it to work at all.
> 
> After connection to a HDMI source I get the following error with all devices and 
> resolutions I tested
> # dmesg
> snps_hdmirx fdee0000.hdmi_receiver: hdmirx_controller_init wait timer base lock 
> failed
> snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_write wait cr write done 
> failed (repeating multiple times)

Sounds like interrupt may be not working for you. Interrupt won't work
using downstream version of AT-F, though I assume you're using vanilla
version of the AT-F. Could you please show output of `cat
/proc/interrupts | grep rk_hdmirx` after plugging the HDMI cable.

-- 
Best regards,
Dmitry

