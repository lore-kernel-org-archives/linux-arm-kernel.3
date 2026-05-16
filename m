Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848F1CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhXCXkEaYWs8mLMuGd17HeyaaKTPfL/cVLd/ZsGcDd0=; b=i6BsI3BOg/hYSibxgKo665bChQ
	XYg9pvCQs0EubAZxlK7yD0jWBhOrmtoS2c3YUGRMP0hbKRXoQu1nMDvfTD5wS5y3Es94kAV2ewBVl
	I3kKA+j0qSIRe5vfGpPrzfM8rQzPNps/Hjs9556YjWhykKuV96uPiU0XdqCTQwykf3UUdDhEibY2f
	7PoT9qPPnOMJq+GrbMpRt2O2dSqU8ggEBnS/Dmt2FuNanq4hAy6mfswtRXlNCA7HlhKjv90PCbpxl
	188Gw0YwfnL28wpBW9DgCgck/LYIcsRzph4Y03YlUafwyo1hkYUsREc/AhBfUNWiP/eiDHgYU+5pp
	cilPeR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGX9-0000000AuFR-0LWt;
	Sat, 16 May 2026 15:02:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGX4-0000000AuF7-059k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 15:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F25443C28;
	Sat, 16 May 2026 15:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55381C19425;
	Sat, 16 May 2026 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778943745;
	bh=uc8pZ4p+HwdI9bwVDTtSCog/2rGBEMcyxeIJvxFLqKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=exSx/OhIyTzM9AqPgq7wewrwJhVB+w3pV+CxqRz0jsxhbIK6BF8G08y6vJsdpQfBs
	 4syRzHoi5Iqj/QlpaAUizegO248cw4Xf8ZE9Z7Cgudw+crIGv73BQuPZCoYsDryViZ
	 Wbc5iYvFKOqOSbxm8GQyLN0q7NvKEDnjMcc6oieQ0Ux8nkITOAhcpKkLDrSDTspOi2
	 uLoIzGQgFK7l4sMN3gVGS90Bc6xKbOHsnlrF0rPRT190nWEjetS6wk64kbSdUHM4h9
	 oG1oahV4q/EDroF+ns8oh7yWSpX3tUFDDRP1oz3AA3UfgZ0NvwKGGPzTduvl6jPI9X
	 WbCUNUpYMhGfA==
Date: Sat, 16 May 2026 16:02:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maksim
 Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Message-ID: <20260516160214.658b5543@jic23-huawei>
In-Reply-To: <20260516-sunxi-a523-gpadc-v3-2-a3a04cff2620@mmpsystems.pl>
References: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
	<20260516-sunxi-a523-gpadc-v3-2-a3a04cff2620@mmpsystems.pl>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_080226_085106_A44F948D 
X-CRM114-Status: UNSURE (   9.54  )
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

On Sat, 16 May 2026 07:34:15 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
> clock and module clock.
> 
> Change driver to enable all clocks.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Applied patches 1 and 2 to the testing branch of iio.git.

Given some other folk were involved in reviewing earlier versions I'm fine
adding tags for nor next few days (or dropping it if I missed anything!)

Thanks

Jonathan

