Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD54DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEMm9QuKYkuKATX8nQVckgqvQIGgEyMpKgrrFFvElyA=; b=V5nf33ApvoZfKsBcAPhIBKrofP
	CKTKsSpYaB6ub1qmd7KkaEwkyqTN6rhI5a7Tp9BgM/5Bpf6rQ6JMooRy4kbPQYder3I2uyhVKJGPf
	kmP9HVUuT/v06XRv3bkIDuh9fMGUYYTvcvE5Wi/i2IHHfJVHoi8A3OsCpTKmoMUcGM4waxi5rO/N6
	qUFS+aTmxvTS9Fic4iT8FavPI6t9Z920y268J2LhNDZvqYBnh66nT0jguwhIcTCNY0FMFQ1eSTkIe
	weGZXmImrDLfSiBXcat+khfmEF3G9onliuTVAXyuQWeD51cVHCdLoF4vWHQk08H/6elqzCJ1vIpry
	ZH4vFrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYAq-00000000Hew-1n1M;
	Wed, 08 Jul 2026 19:43:12 +0000
Received: from mail.johnrowley.me ([2a01:4f8:1c1a:a56f::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYAo-00000000Hdo-0O7r;
	Wed, 08 Jul 2026 19:43:11 +0000
Date: Wed, 8 Jul 2026 20:42:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
	s=2025; t=1783539781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEMm9QuKYkuKATX8nQVckgqvQIGgEyMpKgrrFFvElyA=;
	b=dmX8Aw/OrQnlYzC3ureeT1tIYh721plKtz8eFF7WRGH7ZbyMvweab19QSznZRAfH/YrlNp
	OQKG2iyeQSxllmf7jsVgFMj9tW+owZzTzUxe+x5F5qhPWFQjKNy8pkadp0xJZkcFs5Xwmx
	w3s9+7IwaE9zI+Gv8Qlu1f5GwBrOT9rL/u1sRXp5O4RBcEX8A296yeeSxkt30s/1Wv3/Xs
	Sfxx2+hqT9s7Eh1sEwY5m36MkEPStVAuBI9hjS/TK6yPWnlMtud17Dy4BEz3ocpRIcGb3L
	OyL0t6x6gezbH9i5YwW5PuVGz1g2PPhbU/Q5v2zRWMxlp3ZcQEs2w0MNuuNVTQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=user smtp.mailfrom=lkml@johnrowley.me
ARC-Seal: i=1; a=rsa-sha256; d=johnrowley.me; s=2025; cv=none; t=1783539781;
	b=fuoPR/5JafdmYWEprBKsuKz6KWNBEZoJbsbBMTbEQWbogkrpMjC/xp5zFTqYwvHzT0uhQW
	Y3ybpQwVn1EGDF5yUSgIgPS4BbsXYVI7qNwSe8uZWnaD7ReT1savA2SR6TXYdgFR+qKx/V
	Vq6oiZ3vFbpZV0GMxRaGZnxG4fF651bS0N4CsIaCZYeOZpSUiqj12Ko+vBxjnI3rMTKjaT
	jTRSJZDaPuyGZtwL6R1WY8/2TQJaTIXGIrzyv7JM5XTDEBawCBN1kxUHBp0TB615N2uUxY
	/G1M5gv4A4jUsS7zHfn1xxWDTTVKi/fIWYSAgO0omwKtLHVslqyb/BXXkvhGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
	s=2025; t=1783539781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEMm9QuKYkuKATX8nQVckgqvQIGgEyMpKgrrFFvElyA=;
	b=VgXPQetL6mK/JLHHsyDGhCW3x9nfu1NNEXjl9nqIsFR+ZdOjG6497ZMKgYZA7oxE9Rcb9V
	JOpkkJDQ8qn1AtVxgrJOhYDIjP55OjA385Hr/iWjCXvO6ftD+b2wCHrPUn+UAJ/Bl4tley
	ocWLUd5nJufm/GoG2J0Lu7kB4PiQzgsYZwzVBjIydFkPJIawMqKVQzSEc9KLwyhrHRn10g
	iz5KFdVZ0fi1F9M5X9JU9auPAaxXZFQBh8dYuhfVwv5DJkAFOj57wxRYNngsNxR+m3K/20
	bpncVlQ/zW31Nu6/vGx5lH6XNe2qBf8TIji2hDZ1ldnVZJAI1qxwfopP7wTd0w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=user smtp.mailfrom=lkml@johnrowley.me
From: John Rowley <lkml@johnrowley.me>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF
 pcie cards
Message-ID: <ak6notej5X7Oiyj8@localhost.localdomain>
References: <20260630210215.400379-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630210215.400379-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_124310_285735_606A08C8 
X-CRM114-Status: GOOD (  17.57  )
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

On Tue, Jun 30, 2026 at 02:02:15PM -0700, Rosen Penev wrote:
> If seems the check for err is wrong as the proper macaddr gets written
> to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> wrong as the proper macaddr has been written by this point.
> 
> Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Fixed, thanks.

Tested-by: John Rowley <lkml@johnrowley.me>

> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index b99d7452800f..afdb73661866 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (err) {
> +	if (!is_valid_ether_addr(phy->macaddr)) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> -- 
> 2.55.0
> 
> 

