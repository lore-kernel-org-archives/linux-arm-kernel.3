Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA010C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACLy9JQGzhl/GMps6fo5KltoaCZlNAHZRTVge/MqaRI=; b=U/BsdoWAGxszeohYtUSvZvJXsK
	HV2ytYvDCwa5HxKbx6IDoXFWlLju1hceeHALHcPtfWwgzdZN1m9enAFFOXWie1DoBWT81lW9mzPbO
	JNvUNjplfeYRAbh5W7gBZk9+apRciDHol09YnZ0RcHjrOc8FJW1dcH+4L/wkR8GsnBRhYoym6XRYL
	oIBrJP38e6e75a3NTLCOmca8Fcds4PMTp8Re6CuQRzd1XOrdU6UDQf7LpLnlHDeAzUg6ww2xx1KmB
	TgTSUlrYW+Uy6hiLCKdtxtAjLN4ltSO1wzCobp64J4lOd9P64284m9h15hW+G/9dXpK13omjaJtVX
	EFdqzvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb45-00000002c7U-0Mi8;
	Wed, 05 Feb 2025 08:47:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb0w-00000002bbe-0Gfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43CFEA43245;
	Wed,  5 Feb 2025 08:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15857C4CED1;
	Wed,  5 Feb 2025 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745045;
	bh=DVZfcrbv7vSC0Qw/vD+hsLybGCwDpGP5oB9YoF6ZEYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mA2aBluE+Ucem9uUonit6rVkY9Wjgqbez75BUeNNZp3nNPUA4hTj9vi6Y82qMlXju
	 JiQKGjN5bubglCBaMd/jkn0BlNwVk/2QjtZs3UERW1hXfi8zAaWUxfmjIZ5yoz8kr6
	 3NBNW1/Pj1l1qRrMhp7jO4DwszNo0/EOJCIhu6S7edJlml1XiKOunInPK/DgKlGtsO
	 BZ2FuSE81E21lHMSetvGXbhqBFY7rB4kGfdfusnG3cTLMAm1GzQrSN/35RiSMDP1gA
	 3Taew7BzQvpCE43q8GRIISTFS+SAmcghSY1oqnt4ZBMTrwZfKoeV8FNg5LJ8vNF1qF
	 1Vc5lfO8xR3pg==
Date: Wed, 5 Feb 2025 09:44:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] tty: serial: samsung: add support for exynos7870
Message-ID: <20250205-artichoke-gibbon-of-management-e9c5fc@krzk-bin>
References: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
 <20250204-exynos7870-uart-v1-2-06be6aa96284@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-uart-v1-2-06be6aa96284@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_004406_166496_9AB547FA 
X-CRM114-Status: GOOD (  17.96  )
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

On Tue, Feb 04, 2025 at 02:08:46AM +0530, Kaustabh Chakraborty wrote:
> Add serial UART support for Exynos7870. The FIFO sizes are not defined
> in the driver, and they must be provided in the devicetree with the
> samsung,uart-fifosize property.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 210fff7164c138e315d20ccaa4a29ce6a7bb2dfe..c8607633fea40df2ec221cfd3653c726094127cb 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2493,6 +2493,12 @@ static const struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
>  	.fifosize = { 64, 256, 16, 256 },
>  };
>  
> +static const struct s3c24xx_serial_drv_data exynos7870_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA,
> +	/* samsung,uart-fifosize must be specified in the device tree. */
> +	.fifosize = { 0 },
> +};

I don't see any difference against Exynos8895, so they look compatible.
Use Exynos8895 as fallback compatible, even though it is a bit reversed.

Best regards,
Krzysztof


