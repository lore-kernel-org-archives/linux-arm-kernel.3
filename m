Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B767BC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEbw6WhBSc18ynBt4xgzrCfUhv3c5N66qTBBdIgunPU=; b=Omh5Dc+T84vHkyzW67RGiTlhUK
	tF5a8aDupZh/iiygbe6vu7ye9YkQZLVk8TrnnHjDkpYiIJ2WTsYtNXIEsVK+ZSl1Iy3YbAEBJMGGo
	49ZhH17LJD1z/VohzhXBIzGKqTAQFmfabtmPuydV+2rnhgmyJ4xlCGLa0nrbtqSIRiwRFEZNFLfMh
	RXKedu3RvFU4sbv7IcMl23LRF1Y1IzmUWEr3sSBLjydoEldU7dndr6nHDcqnPbnlgPBsld6v8ljt1
	h1dleuROX0D42LnbmWgBY+mKe6oVYal++PvfMr5pU9d2Uh06ydZQNC665ny6/ckyKbMSIwVFMhbse
	PFX2+8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OOC-00000001F8W-04fd;
	Fri, 04 Sep 2026 07:31:08 +0000
Received: from sphereful.davidgow.net ([2404:9400:4:0:216:3eff:fee2:5328])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OO8-00000001F7u-3vtL;
	Fri, 04 Sep 2026 07:31:06 +0000
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 21BDF200141; Fri,  4 Sep 2026 15:30:43 +0800 (AWST)
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 6205E2000F9;
	Fri,  4 Sep 2026 15:30:40 +0800 (AWST)
Message-ID: <bcf1ee9b-97e5-43f9-81eb-67ac6a0a98dc@davidgow.net>
Date: Fri, 4 Sep 2026 15:30:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in ACPI
 SAR init during probe
To: Devin Wittmayer <lucid_duck@justthetip.ca>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>,
 Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260825181712.28548-1-lucid_duck@justthetip.ca>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260825181712.28548-1-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_003105_277855_86622DE4 
X-CRM114-Status: GOOD (  26.75  )
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

Le 26/08/2026 à 02:17, Devin Wittmayer a écrit :
> Some laptops carry a MediaTek power table in their firmware, and the
> driver reads it to set a transmit limit for each frequency range. It
> only fills in the ranges themselves when it registers the device.
> 
> The startup step that does this existed already, but it never programmed
> anything. These two commits made it run a regulatory update instead,
> which sets the limits on the way through, long before registration. So on
> a machine that has the table the driver reads through an empty pointer
> and the interface never appears:
> 
>    BUG: kernel NULL pointer dereference, address: 0000000000000004
>    RIP: 0010:mt792x_init_acpi_sar_power
>    Call Trace:
>     mt7921_set_tx_sar_pwr
>     mt7921_mcu_regd_update
>     mt7921_regd_update
>     mt7921_run_firmware
>     mt7921e_mcu_init
>     mt7921_init_work
> 
> Skip it when the ranges are missing. They are applied again once the
> device is up, which is where they came from before.
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
> Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
> Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---

I can also confirm that this fixes the same NULL pointer dereference in 
7.3-rc1 here, also on a Framework 13 (Ryzen 7040):

BUG: kernel NULL pointer dereference, address: 0000000000000004
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 10 UID: 0 PID: 149 Comm: kworker/10:1 Tainted: G            E 
7.3.0-rc1-sulix+ #15 PREEMPT(full)  b7f05cce278af6607ac2dcae2fd785935bbe0dc6
Hardware name: Framework Laptop 13 (AMD Ryzen 7040Series)/FRANMDCP07, 
BIOS 03.05 03/29/2024
Workqueue: events mt7921_init_work [mt7921_common]
RIP: 0010:mt792x_init_acpi_sar_power+0x40/0x1ed [mt792x_lib]
(...)


Tested-by: David Gow <david@davidgow.net>

Thanks,
-- David


> 
> Reproduced on both chips before sending, an MT7922 and an MT7925, and the
> fix clears both. Neither machine here ships a vendor power table, so I
> supplied one through an ACPI override in the initrd. It also wants recent
> firmware. The June builds do not turn on self-managed regulatory and
> nothing happens; the builds now in linux-firmware do, and then it dies
> exactly as reported with no interface at all. Patched, both come up and
> scan normally, and the injected limits still show through in the power
> table afterwards, so the skip does not lose them.
> 
> With that table still in place and the fix absent, backing out the mt7921
> commit on its own also boots clean, so the table is not what causes this.
> 
>   drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> index 946dd7956e4a..b468051fbe68 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> @@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
>   	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
>   	int i;
>   
> -	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> +	if (!capa || !phy->acpisar ||
> +	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
>   		return 0;
>   
>   	/* When ACPI SAR enabled in HW, we should apply rules for .frp


