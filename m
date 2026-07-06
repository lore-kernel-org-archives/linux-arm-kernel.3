Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50927C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=; b=GtzxA6MDpCTQ7rKEcRdXcGXHi1
	uMJDDQL5nXy9tag3ecwyO/zuOINkkhqnR5sIGhz7uQv4ceyk4psV1UrgYYHsXscaYq5W9BCDXRFib
	nUTy8R+mSPaxXQ75hPr1FkexEigx03V6qUaS+S3BBqmg7qwdBIiRT5bbgPKCyyNK7mrRiwvtqILLY
	pSjoOKY29/HotNbJNJCpeRmr5ujfL34Cf3rPFQ4kx+NbMr0vJD1b37KmlKJIBpMyHLwPkB8Kcr/v4
	7JAf4eDYwKnnUy6Zay65VDdTywJVuHnCjKf4jQCX0AbZOBJYxfUkSSYCWi5EPU/S/gFmeVgDTzC9T
	jmMNt6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkUc-0000000CmIi-2pt0;
	Mon, 06 Jul 2026 14:40:18 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkUZ-0000000CmHK-00SQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:40:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so2317571e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348812; x=1783953612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=;
        b=PC1kVWsjQj+GTGVOJkoWSqbXO2tKaGqMFhT9FBokStahqHGv8HQXNW1UygqdI8QIr7
         SprG/wFqifV5CNWPopvohhOwwVhgO+MT2i9GziIRqsCs5yULKLZdZ4/I4/jDzqT+05Lq
         lSrQ5rb6R0wazAQxhFJichyjgayZYDntCC6yEQq74ux8kWCL4vK2qU58PKXEWfGOQJJY
         q/AF7Pnkk1QEfboR6oJfZKynwVHwgsWC/dtbG0BZHX7iBHG6cbA2Li8pS4wJ11nc/Gy8
         tJ6QQjJOFLcl9FNy49exiY3x/LFoxjmkR2hONbrSMvLJgtCsYAxnLDVhyvBG1ME+waDu
         IpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348812; x=1783953612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=;
        b=HC/TcIUxyqZmje8ML8O32lZa9ffn1n4d+cpVUZC/ctHjAlKeNMGvy2BCPrujtsEaBm
         ujGCJzLr8jI1Pg+5vqY593UXkjwK7Rt9zaqON57jw44q3WfEPQ05lBsmZokT7+Gv35qJ
         QmPTw9hLqz8UQD+wIncrGoai3reYZb4ggLK9Fl9eWBiUfRqKNx4pjuxg2mxPybQZBI7x
         O7Q8Pvyxs/KpucF1B+hhe5Kl3HcPIgS2/iQeeNr7Rwgw938GGUXRrXCQGaOrIoQPjCpn
         keEbNnT35OxFwkYKQHtR6UloxJrcc7JYgKKIj99MqmoIo7lNkG5lzyUYcV1wln6wDaLu
         e8sA==
X-Forwarded-Encrypted: i=1; AHgh+RryookVFwI4NSM62unCPLZ3NOTWJ5jUuK+PDzVKAL5M3nxwoVf4rPzuf8UFiR7ohE1s/7YDs/hGRWCnPmnCKJYB@lists.infradead.org
X-Gm-Message-State: AOJu0YzJEF01VyXAm0n+R7zwC7CwGW5sM5vLGAOJTJl3t3YXS2ojiMxQ
	26US5gX4YeZVVnju0sxtQR2pgkdtcDVyFfETWCGeETrpEmr7GC4B2VJ8
X-Gm-Gg: AfdE7cmwSrNXT5QBXTpmqaTC0xhyug1B4fFhHuv4JFN7LTXRVwHHEPsgCKZT+uyhYkW
	0BsbHLIwe7xABRxvFCe3ULWDWCxV+KqX+asEDEsronW6YKv6TL75881/jEZhtNvecyYxlDFBFcf
	PRt4wgEvfWCBUiLk18ur+qfvYlgnBDFMUUY5LKpM4vvaRSm/Vg8Gr3bsq4x/lNn6mESiosqOkKx
	MU13jnQlSMiXQAsDNcxE0v91Tcz+YCted/Z09xsuZuMo1AKR1TfKjaN/KG2GPogROAtNf+MvlrE
	FU2lHfM7E6fiQnkPHG5SUjU6cbeBLLW5eSeknSid2WrZw5/drFy9+Us2/T69jyWFd1/6WqyZXBq
	gtrUzTTKvyX5uzJVnIoeZx6H3FCpEYOEJDgG5AP7BtpeaPC5HSXCtHZo+tYHRPP/do0b7P21a2C
	4wVIvnTLURWp+CvZhy7A/k9xsyl1o=
X-Received: by 2002:a05:6512:414d:b0:5ae:9de4:4907 with SMTP id 2adb3069b0e04-5b007bb9136mr132541e87.53.1783348811872;
        Mon, 06 Jul 2026 07:40:11 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm2947841e87.32.2026.07.06.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:40:11 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:40:10 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Tobias Klausmann <klausman@schwarzvogel.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF
 pcie cards
Message-ID: <aku9T5a__-8EqFM_@soda.int.kasm.eu>
References: <20260630210215.400379-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630210215.400379-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_074015_061537_8F51B31C 
X-CRM114-Status: GOOD (  18.82  )
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

On 2026-06-30 14:02:15 -0700, Rosen Penev wrote:
> If seems the check for err is wrong as the proper macaddr gets written
> to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> wrong as the proper macaddr has been written by this point.
> 
> Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Tested-by: Klara Modin <klarasmodin@gmail.com>

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

