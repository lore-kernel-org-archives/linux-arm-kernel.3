Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F20C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 02:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpOlv1ZTtdy2ufgpFbyrTvo0t538XvobXfuNLeiCjfI=; b=GH5A1dAUXCY4IO3HsEhZnBNRrh
	oAW1KXXhwej1mJFql5K/M9MCMAdtjGfhdP3ah0ycxghmF2jxluF7tDsPn8FV3WHqR56ZGBTYN5wAV
	BgbcAN4+a5dGnMLPRnqYTDdndNPNSd3ks0n1r7Had9j1zfFoVP1DdXBzcAxMXqAnAqaw3mZHxo5g7
	bBBB2Ulqa64gfANCNFZSRtqTIAZAGiqgStFgpEsaaWTAatemshWg0Is3fPcP4/McoPwjn0vD6otNB
	4GVGXGLV3U/ZqIWmYYLnqIAmd5mUHILzUic4aCt1mK7O3d4P9VrP65ixWiAlw2kGYR+mcRlV25GfH
	eL3+OqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdKLi-000000084n1-43Uv;
	Thu, 30 Jan 2025 02:32:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdKKQ-000000084hw-0247;
	Thu, 30 Jan 2025 02:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AA2AA4157E;
	Thu, 30 Jan 2025 02:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50C2C4CED1;
	Thu, 30 Jan 2025 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738204247;
	bh=e4jbTg/JY2I7eJPj0aXC/9HSq2Ljb5HCCsZGm12Jwr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y2nGbi0T6W0Oi8KOuLylVn2xAg2yXpQ2n5IISfJfVxbHKfSqWlxGXS5zVm7Do/Gio
	 7bp8aPT5RgM3Wo4MacJLJlpnGqbmB6ttpLNLme1jLj2+I20HUBQECEvrVz6Pd36Yu3
	 L9yEuGCVz/cJPl3Fr/tvqGhi2vq9UIH7kgzlEodzDg06ftpHLiVS3qbBkS2D6mZI1/
	 OUAdyzBIDYiI6eKfFnpbmuI2UKzoPdbzDqDmvvdqOa6Sfub4EVNYBdlVElNLKqtVgw
	 cYRSYqP15TSYZsp6oSQQvYJgRCOMV9ByiCElgbFd4927X3VAag+HRpkxQ+4Mz2i0D9
	 esvKqqdHF/IlA==
Message-ID: <5d8d4fa6-66ef-48c1-b13a-607a70e476f4@kernel.org>
Date: Thu, 30 Jan 2025 11:30:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Niklas Cassel <cassel@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
 <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
 <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_183050_188760_79829B48 
X-CRM114-Status: GOOD (  19.01  )
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

On 1/27/25 22:45, Geert Uytterhoeven wrote:
> Hi Raphael,
> 
> On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> wrote:
>> Letting the compiler remove these functions when the kernel is built
>> without CONFIG_PM_SLEEP support is simpler and less error prone than the
>> use of #ifdef based kernel configuration guards.
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> 
> Thanks for your patch!
> 
> The subsystem prefix is "ata", not "ahci" (not all ATA-drivers are
> AHCI-drivers).

Yep. The convention is:

ata: driver_name: xxx

So it would be:

ata: sata_rcar: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

for this patch. And the same comment applies to all your other patches in the
series.

> 
>> --- a/drivers/ata/sata_rcar.c
>> +++ b/drivers/ata/sata_rcar.c
>> @@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *pdev)
>>         pm_runtime_disable(&pdev->dev);
>>  }
>>
>> -#ifdef CONFIG_PM_SLEEP
>>  static int sata_rcar_suspend(struct device *dev)
>>  {
>>         struct ata_host *host = dev_get_drvdata(dev);
>> @@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops = {
>>         .poweroff       = sata_rcar_suspend,
>>         .restore        = sata_rcar_restore,
>>  };
>> -#endif
> 
> If CONFIG_PM_SLEEP is disabled (e.g. m68k allyesconfig):
> 
>     drivers/ata/sata_rcar.c: In function ‘sata_rcar_suspend’:
>     drivers/ata/sata_rcar.c:936:9: error: implicit declaration of
> function ‘ata_host_suspend’; did you mean ‘sata_rcar_suspend’?
> [-Werror=implicit-function-declaration]
>       936 |         ata_host_suspend(host, PMSG_SUSPEND);
>           |         ^~~~~~~~~~~~~~~~
>           |         sata_rcar_suspend
>     drivers/ata/sata_rcar.c: In function ‘sata_rcar_resume’:
>     drivers/ata/sata_rcar.c:973:9: error: implicit declaration of
> function ‘ata_host_resume’; did you mean ‘sata_rcar_resume’?
> [-Werror=implicit-function-declaration]
>       973 |         ata_host_resume(host);
>           |         ^~~~~~~~~~~~~~~
>           |         sata_rcar_resume
> 
>>
>>  static struct platform_driver sata_rcar_driver = {
>>         .probe          = sata_rcar_probe,
>> @@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver = {
>>         .driver = {
>>                 .name           = DRV_NAME,
>>                 .of_match_table = sata_rcar_match,
>> -#ifdef CONFIG_PM_SLEEP
>> -               .pm             = &sata_rcar_pm_ops,
>> -#endif
>> +               .pm             = pm_sleep_ptr(&sata_rcar_pm_ops),
>>         },
>>  };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Damien Le Moal
Western Digital Research

