Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2044D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LObrxn3R4XtlprnERAFFhmw2ApkNAoiNEB3fkoJZITE=; b=PDed0KV9tuIRfpsyBRYLND9QpC
	sh3v7RF9i1MMcR1uPR2vd/X/YoUNpqzb41nePsGqnQTLa4KG0w186wyl49VqDLQDMa4R/cO6NCOef
	DQ7lD8Xadn4ec2FWjikug7jsorEkR9Wo+2tQnhFLtNMFnj1rVr5b8euFigFCZ0vxwPCX+3w2V14yC
	xyHIDBxlRTWoBRsAU7D7bhCrgUEAmhsXgdAvjwUl/dHI/CigjvBZNRq9DOalrgB7G8CsdwldGkPU3
	7aMbtZnX0GjRWdWE1c33kPaZbtDs968pr56MApbtTZidPW1BtNHmKshUOCgWxTMFTySp325FqOGh8
	tCsZWK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbjf-00000001Ll3-2bQ2;
	Mon, 11 Nov 2024 21:14:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbac-00000001IbV-3ekY;
	Mon, 11 Nov 2024 21:04:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBEDFF807;
	Mon, 11 Nov 2024 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731359088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LObrxn3R4XtlprnERAFFhmw2ApkNAoiNEB3fkoJZITE=;
	b=MAVkRchXggZBxDxPHd6AZX2qiAifA7ijtIEZo1438VSGrVZamdo414JKLILgKBS/E/GudL
	K7eJdXQd1BSX/kXpLhu1oVKxXHBbkvOgEoz/kbVdeotMDe4m8cF5zmI6vGXN0p6bgGZJLq
	bd4f8CJKP9ALVDp7JfHogGIhiVdXK7sTK58s0XJMRqgUnRkAcxaGzoLe3EF4rj8dCSmHu3
	JF/WmZq+GxWgyj08XEoGRTnZHBaGYeZmv4qvAkYslCF4qKufG5VBQC6HFSUhFjf4t3cylk
	xRsBYTHFsNO17OAdY17sdmGz6dpSn66m3NsZTyNJV9/BR6Lmzr/pBPLTm5jHyQ==
Date: Mon, 11 Nov 2024 22:04:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: lee@kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, sen.chu@mediatek.com,
	macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH v1 0/3] rtc: mt6359: Cleanup and support
 start-year property
Message-ID: <173135898216.3303301.4242491728556386052.b4-ty@bootlin.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_130451_070930_53CB40EE 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, 23 Sep 2024 12:00:07 +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for the start-year property and removes the
> custom handling of the RTC_MIN_YEAR_OFFSET (which is, effectively, doing
> the exact same).
> 
> The start_secs timestamp was set to match the previous one from the
> custom behavior so that there is no time drift on any device after
> applying this.
> 
> [...]

Applied, thanks!

[2/3] rtc: mt6359: Add RTC hardware range and add support for start-year
      https://git.kernel.org/abelloni/c/34bbdc12d04e
[3/3] rtc: mt6359: Use RTC_TC_DOW hardware register for wday
      https://git.kernel.org/abelloni/c/d6f471a74790

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

