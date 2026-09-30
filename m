Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD92ACA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGRPZRz2qsm3tuIDtA+8pDXAURoo45DF4vA0Hjc0ty8=; b=UaWbgXwXwtzn7t34wx8UfQh2PB
	KF8eoQowXGGyz83sBVddrfjAc9P+MK2rfuSKfs2RpQ3KWGnRmsJ/M7ILaFGmo0lbW5CZM3jmSKHzp
	CNZMZ+NzYKoi21Qf2812oj9CpM6W/uh/u+tFM+aPapqpa+WJ7b6ARbSHm7ydyMcnzcjN092O5uLRn
	IPrxePPDrQANH8Y4ylj0wrmIY6IIPgWdgr7lJRVx5u+IhkjhIjjsevqxzHSUEMrFJ6yljvu18jEoe
	03EY2oHINXryURddxvTQWFkDo1eAX4kQ4HeCzTMqDKiDPXE3/L47FLxJKMGM0SKI9RK4luEsiROwy
	sr8mjQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvUu-00000006LkH-04A8;
	Wed, 30 Sep 2026 14:41:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvUq-00000006LjC-09d5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:41:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 588461A1088;
	Wed, 30 Sep 2026 14:41:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CCA560749;
	Wed, 30 Sep 2026 14:41:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D218010329695;
	Wed, 30 Sep 2026 16:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790779275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LGRPZRz2qsm3tuIDtA+8pDXAURoo45DF4vA0Hjc0ty8=;
	b=ChSwMplbOA0jh3gZRg4sJXIc8pzoN66mFNZ0kTsmkGRvNO/y6gvWRNwa9PPGfzNghnossC
	pHKvP+x5xNBkKWdpIszb8m75hgWfXzOeKfDPDyliKrKbAyHVacH9CX5ltVwmW8d7ht6PQ3
	UzoHbe6ezxJV1E70LqTwBFYKmA2uV+vAQ8iAXmaIk19DZgavzQ111pgluC4by43U1bfCsu
	UF/jZ4l75Jtja7QIvaHUx+5GCl2PgIk/vXvp7LajrB/bpUu+LOWEF/Zt5Cme+Gf+DMYoUc
	CYbfpGgWM3veDFYJHrsDbSELrtmt25eg5PnvPIfKZzQ4n2yJo1PHiJX77s4zFQ==
Date: Wed, 30 Sep 2026 16:41:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/2] rtc: mt6397: expose the RTC's spare bytes as nvmem
Message-ID: <179077924632.411665.17496276815862670542.b4-ty@b4>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074124_265835_E6A0B54B 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, 17 Sep 2026 23:57:45 -0500, Ryan Brue wrote:
> Four of the MT6397 RTC's alarm registers use only their low bits. Each alarm
> field lives in the low byte of its own register and the driver masks its
> writes accordingly, so the high byte of four of them is storage the clock and
> the alarm never touch. MediaTek's documentation names them RTC_NEW_SPARE0 to
> RTC_NEW_SPARE3 and assigns the first to a fuel gauge, which is how its PMIC
> battery drivers carry a state of charge across a reboot.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's nvmem layout
      https://git.kernel.org/abelloni/c/8423c476ab2a
[2/2] rtc: mt6397: expose the spare bytes of the alarm registers as nvmem
      https://git.kernel.org/abelloni/c/1aaaf94a61ee

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

