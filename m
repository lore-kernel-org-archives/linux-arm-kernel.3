Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A3DD1BDFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unZdatKDfaPl4fyNDfiMrsCGtVnCfg5aUkCrWXueqsc=; b=EV/EOTeb/+eyQwAXxd766IuDeV
	pvxMy+gNYfwEbMEPhmKrkhNgasmpsoW++DYqmb4OGuBU9I4RVAgTEbwIbs1C3CNmY+aBNZxSHUc6F
	jZmH+voanSCwVEioBAi6D9dO87s5k15iuXLx37u97PJ0HgQ3RbtWpJ/U9n1GyH/O8YnasRDzK6Iii
	oOistmePBUF3hg+Oxhg9bFW07zjaP4plnk/ydAONAZab8cqqMsofp6bwj4KaVGfYv084ZrfNE5QFv
	A4Dx9x1pAUT4bIr/3TzWj5DA0xPr9F7GHcBoVdB2DaHR+alhJZCH76RJm0PeRmylHI+lI++QpNfFB
	h6omcXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQug6-00000007BGa-2xvg;
	Wed, 03 Dec 2025 21:46:26 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQug4-00000007BGB-1X0L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:46:25 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso303940b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764798383; x=1765403183; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unZdatKDfaPl4fyNDfiMrsCGtVnCfg5aUkCrWXueqsc=;
        b=athsdjwAE3RrDuL0+0+duzqV8hXE+Cnllfwy31L8arSPy804ra4noeB7DQLHLU0EKZ
         QV63Z7tO+YEQkSB2adj26bDFiM/VIeA0riWYERgX6DAJYRGwCOwDK7WoGqhLh3Sc+3jE
         BZRZcHOEPW+4ZTvqn8G7k026F95GxOD1aNtbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798383; x=1765403183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unZdatKDfaPl4fyNDfiMrsCGtVnCfg5aUkCrWXueqsc=;
        b=Vcq8FWAHXCbgChqoyL8PPGODELIAR6445HobZWfLJFXz++mHjIxOtBLZBKfCc7bux1
         BUIWYEfzXUUVNWQWIyQWb5puNJ6XJ7wT/KbEG4zE4uSIoS0SfHfNphdQmnOFig1vT3EA
         cagq6n6wCHAGimSP/kbeZ3iOljxrNAPL4xdq6EHbqEFamK1Ohf5ysDI/skLU/gLD/e+q
         fbIoYjNRxwVKgVY9apt9uIz3vzED2Nmx/MkRYkgCvCXRSFUDo4GwbmYppHuT2xGQMNa6
         nHG3QzlNtNJtLAAwN6eMMy6AWssnos62QBycMcIAZvM776feODRkXxeFRQjDVpIcOeEz
         5iWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcSgUB1P2/ATWHIT8eQPLdpmXH6fkJa1A8M9kEqCUUoQP/cOgnJJqU5ImDlzIpdFWucLBD8/xkZHF5c+NhZcIf@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxBq5WeiXzyZzTh73inS6Zie8VXqrKhDla7MnqiAWC9jCtyoB
	NENUTIHCesgJ+svWFzFUsM1brm8n14bShDg43C7pC+aeCJxdHehrj0xQ73wQwSLIdQ==
X-Gm-Gg: ASbGnctROU9nWDfUN3OZTFRrtT0HIwJlzprh+o0iou0BD4v9v/U4HNqfCqj+loZwsZe
	N4mKUHx0fYNgn8EOfA3Gwds47QNelr95IL6DuWMivXOqIFifdD9dffuGyyjwsmsV46jZuzVSISs
	r435A3ZNMj9iKGr2IAF65FizrbyH01rQcpGOVuQUizBGs7fJ0MNA0WZASBJX6bSaHIW1AeBZ886
	T/InUX2/3mRj75AACFBxLz2fm7D2oeUb4NVC1MOJC1gDEK9uw2RQ0tZOVKEwYl/vsO6p9d+OQC6
	WZWTKxSnrCAUo2ATta3FQoSlVvGQJs3h4WXmdDRyIxLlcXm4NF59EfhnIdO7TUELYZkegXY+TdQ
	oTJjj3pOXzDwEIEjJssuBsWMdydlM0ZhDDt7+KHvIcVFg03m3/76HhTvZpq0LABeODOmAB2C5b0
	UFe8Zvysc5IXkOx/OxEHP/BZlncXjx3nLzeO3eytagR4gGhWm8BWoi7W4GaIfY
X-Google-Smtp-Source: AGHT+IFvUUHgZfAcVFFc7DhCqAynkqIltRjiHfqkI2ovYfWjzTG4w6qTFCGmfN82OTdFMGVzSXBqQw==
X-Received: by 2002:a05:7022:6387:b0:11b:9386:7ed3 with SMTP id a92af1059eb24-11df64bf8fcmr539452c88.48.1764798382704;
        Wed, 03 Dec 2025 13:46:22 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:e953:f750:77d0:7f01])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11dcb067088sm61855605c88.10.2025.12.03.13.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:46:21 -0800 (PST)
Date: Wed, 3 Dec 2025 13:46:19 -0800
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 3/4] DONOTMERGE: net: mwifiex: fix
 timeouts with the SD8777 chip
Message-ID: <aTCvq7aN_WMts6hm@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <20251026182602.26464-4-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026182602.26464-4-balejk@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_134624_461704_3806630D 
X-CRM114-Status: GOOD (  29.97  )
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

On Sun, Oct 26, 2025 at 07:20:40PM +0100, Karel Balej wrote:
> 	[ 2101.211178] mwifiex_sdio mmc2:0001:1: info: MWIFIEX VERSION: mwifiex 1.0 (14.75.33.p119)
... 
> Afterwards, a bisect was
> performed which first indicated the commit 808bbebcc8fc ("mwifiex: add
> Tx status support for EAPOL packets") introduced in the v3.18-v3.19
> cycle.
> 
> Reverting this commit (and the following one, commit 18ca43823f3c
> ("mwifiex: add Tx status support for ACTION frames"), to facilitate a
> clean revert) fixed the timeouts for v3.19, but during the next cycle,
> v3.19-v4.0, another breakage was introduced via commit 84b313b35f81
> ("mwifiex: make tx packet 64 byte DMA aligned").
> 
> Reverting all three commits fixed the timeouts on the current mainline
> kernel also. This patch contains the minimal changes needed to achieve
> that derived from the full revert commits.
...

(Trimmed the commit message down to the breaking commits, and the
version info)

From the looks of it, you're dealing with incompatible changes made in
the Marvell firmware API. It seems that you have a "version 14"
firmware, and the timeline of these mwifiex changes (~2014) is approx
when linux-firmware started seeing v15 and v16 firmware. It *might* be
OK to try add some versioning to these structs and padding changes, and
make a choice based on adapter->fw_release_number or
adapter->fw_cap_info. It might be ugly and error-prone, but possible...

Or if the FW versioning doesn't work out, it's possible we could
specifically flag these quirks for SD8777 somehow.

> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
>  drivers/net/wireless/marvell/mwifiex/fw.h     |  4 +---
>  drivers/net/wireless/marvell/mwifiex/sta_tx.c | 10 ++--------
>  2 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/fw.h b/drivers/net/wireless/marvell/mwifiex/fw.h
> index e9e896606912..5c4c3363c7de 100644
> --- a/drivers/net/wireless/marvell/mwifiex/fw.h
> +++ b/drivers/net/wireless/marvell/mwifiex/fw.h
> @@ -690,9 +690,7 @@ struct txpd {
>  	u8 priority;
>  	u8 flags;
>  	u8 pkt_delay_2ms;
> -	u8 reserved1[2];
> -	u8 tx_token_id;
> -	u8 reserved[2];
> +	u8 reserved1;

I'm inferring that 'sizeof(struct txpd)' (also spelled
'sizeof(*local_tx_pd)' below) is relevant, and that this struct probably
should retain the smaller size for FW version 14.

Maybe you need a new 'struct txpd_v14' layout, and embed that inside
'struct txpd'.

>  } __packed;
>  
>  struct rxpd {
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_tx.c b/drivers/net/wireless/marvell/mwifiex/sta_tx.c
> index 9d0ef04ebe02..857eb22f4c24 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_tx.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_tx.c
> @@ -41,8 +41,8 @@ void mwifiex_process_sta_txpd(struct mwifiex_private *priv,
>  
>  	pkt_type = mwifiex_is_skb_mgmt_frame(skb) ? PKT_TYPE_MGMT : 0;
>  
> -	pad = ((uintptr_t)skb->data - (sizeof(*local_tx_pd) + hroom)) &
> -	       (MWIFIEX_DMA_ALIGN_SZ - 1);
> +	pad = (4 - (((void *)skb->data - NULL) & 0x3)) % 4;

It's not clear to me whether your v14 FW doesn't like the 64-byte
alignment, or if it didn't like the new txpd header size/layout, or
both. But obviously this line won't fly, with magic numbers and all. It
will need to be expressed in terms of macros (MWIFIEX_DMA_ALIGN_SZ, or a
"V14" version of that; and sizeof(...)).

> +
>  	skb_push(skb, sizeof(*local_tx_pd) + pad);
>  
>  	local_tx_pd = (struct txpd *) skb->data;
> @@ -58,12 +58,6 @@ void mwifiex_process_sta_txpd(struct mwifiex_private *priv,
>  	local_tx_pd->pkt_delay_2ms =
>  				mwifiex_wmm_compute_drv_pkt_delay(priv, skb);
>  
> -	if (tx_info->flags & MWIFIEX_BUF_FLAG_EAPOL_TX_STATUS ||
> -	    tx_info->flags & MWIFIEX_BUF_FLAG_ACTION_TX_STATUS) {
> -		local_tx_pd->tx_token_id = tx_info->ack_frame_id;
> -		local_tx_pd->flags |= MWIFIEX_TXPD_FLAGS_REQ_TX_STATUS;
> -	}

Rather than dropping this block, would it work to also check:

	adapter->fw_api_ver >= MWIFIEX_FW_V15

?

Brian

> -
>  	if (local_tx_pd->priority <
>  	    ARRAY_SIZE(priv->wmm.user_pri_pkt_tx_ctrl))
>  		/*
> -- 
> 2.51.1
> 

