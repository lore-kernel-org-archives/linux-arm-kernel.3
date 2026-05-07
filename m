Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5456BCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2nhovRvFw1+XQcDcRJ+2hvlsNXDoa4sYKL7qfbTHmc=; b=KoQe/2o8lMLpp8iNg4ro6OSqMx
	xEwgQ4PcmDhnAEAHzo+wZHdNKotKkRBV8DL6ZLWaTy7FZvecrdg0HhS137Wm4OaTGDlvFBZp/zh5D
	ARJxVTHWBaxHCJcNKvLV69Fobp9VB7FTO/LBKJczIBl4UsJzioKsDrPpDtfo42UIrHt6btgJRYK6w
	lkFpjWQlCiKf9RqD1OaShnWystq+grOy25SqfMNYw7pSuolXlg+TwO3+zuGYWMZWXK43QVKK+u0i7
	AA8onc2e+9xNmI9GWP/WHwIOagpFJgFjy7XdQCffz9RAzaW/zGoLBHbRLLvoIfX+38tNvuzt++plg
	volTjpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzPl-0000000414t-00G9;
	Thu, 07 May 2026 14:09:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzPh-0000000414F-3owr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778162955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2nhovRvFw1+XQcDcRJ+2hvlsNXDoa4sYKL7qfbTHmc=;
	b=VarPtgcR/4hZZBvtWihryBOw/MQnbb2wZtxDp7DhxPyMkrg08ogepgacE79GSCXoagGo5I
	S5bFMfz3Z3uEstJ3dcJWpy06LVaYIB6tdhDwR5dDxahePUF/jZ/2QWEOLZnNhGWIs9M/0g
	V7eFkfvwXYHXMC5/8IdbKNwqEEdOvzU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-0-HiHomXMK6pj_woUpzrDA-1; Thu, 07 May 2026 10:08:42 -0400
X-MC-Unique: 0-HiHomXMK6pj_woUpzrDA-1
X-Mimecast-MFC-AGG-ID: 0-HiHomXMK6pj_woUpzrDA_1778162919
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-44d83e45febso1692735f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162919; x=1778767719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2nhovRvFw1+XQcDcRJ+2hvlsNXDoa4sYKL7qfbTHmc=;
        b=lAF4fW3FOMEKcfF3f+90QgXmF10ty5yDiiBcO+4KBuG+u2qTIP90RwCGDrlG1mLsI4
         1IsvPtu33UZ/XUXmiVAyRCy0g1gDxruRx+PFxgrmONcVmDDHhuXrZQihHcC5yn4I+IrU
         bWG4JkDM3BsyEzoAwWeK6TNxoY+9W2RFE4/gn53NifC4UJ2SP/YroPofAkxyrIrAWJzT
         2ZQexO3/dT9Dd7dY/DQXx6uPFFhl0WXrWiFFXe2gS1yc9voh/jQxyryWj2UEVZL3FPmV
         vHvMo9ZLnTB70nHf5YbzmtEyuy6ntA7VPfMWmvhCBdcLVsg8RQag9lXCMq4kMapZvEvU
         kbyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aoC4oV5LPf5ZH2IdghTD1PtQLP+VNHcavB1lr1bbzMR3Teh3U9GenzevH9RWUWZirJxit7Bl/CvNw/m60BWj2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1NYXB87m5zA80h1BYO4v0d0/TiqGFG4j3qAkDPtPR7PayOp1K
	ZJ/bSNZX+zFhJuyx+XwUhZFFSJZ0Huszs3fe6F901ihB+s+KzlLL0YaOQzw/DSVmahlY1+XB6fW
	6xVwlS+G9elYkQjOvx45uGg8p/X1fGlpm6YmvN8grR4KAP3zGXWZtW4JR20re+fCiRKp0WDLgin
	6q
X-Gm-Gg: AeBDieulUipJadod/Kt0S18JhSioDyNHjJWFHPiNfRcfB3UeGnx2SdygUYR6pdfPtqO
	cJm999CF1itk1SfdNSxKOjnrdOdLgkOyTBt3Ym9D1SXWAyMN7Tp3vefc8TydjWSOy3sYKBhcYtF
	yQhxdhLUJTbyeEct7DmSroH9YiYTqY0hlgILdRBE7pUUJ8i1jKZprZ23thBSU6gPWrK30sjvBVn
	2tD2I72tEM173XLz7A9H4r7yvdJJgif6ICszMYBtb6Nbguo6MNpRAhHaEuSSoIYKR6bgwDqOGNw
	PRhcj8K5K8HmpSyNe+bwh/03/YLJ/35sEM3qF9M0kOPrx8N3/a6ldw413Sxur+UIkXYw/IBzEZe
	ZO4vDBG+bYbagc5+pocxOUv9N/n07zGpXejGhQKniicySp//egdA1VeupNa/mUiUlk//lBW+qNx
	8u
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr46917705e9.9.1778162918799;
        Thu, 07 May 2026 07:08:38 -0700 (PDT)
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr46917155e9.9.1778162918260;
        Thu, 07 May 2026 07:08:38 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530d8691sm91116195e9.2.2026.05.07.07.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:08:37 -0700 (PDT)
Message-ID: <dc0f052e-797e-4849-87c4-a98b8ede19d3@redhat.com>
Date: Thu, 7 May 2026 16:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/5] net: dsa: mt7530: fix FDB entries not aging out
 with short timeout
To: Daniel Golle <daniel@makrotopia.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1777986341.git.daniel@makrotopia.org>
 <f285707e09a0febffd1b987f204ff4eb71736489.1777986341.git.daniel@makrotopia.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f285707e09a0febffd1b987f204ff4eb71736489.1777986341.git.daniel@makrotopia.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7uyc-RzruJDaUFye06G-SqLG9D4p_i-meaB5gAwiljg_1778162919
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_070918_464514_97E13A60 
X-CRM114-Status: GOOD (  23.69  )
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

On 5/5/26 4:16 PM, Daniel Golle wrote:
> When setting a low ageing time such as 10 seconds, the algorithm in
> mt7530_set_ageing_time() finds AGE_CNT=0 and AGE_UNIT=9 as the first
> exact match (starting the search from tmp_age_count=0).
> 
> On the MT7530/MT7531 hardware, the per-entry aging counter is
> initialized to AGE_CNT when a MAC address is learned. With AGE_CNT=0,
> new entries start with a counter value of 0, which the hardware treats
> as "already aged" and never removes, effectively disabling aging.
> 
> Fix this by starting the search from tmp_age_count=1 to ensure entries
> always have a non-zero initial aging counter. For a 10-second ageing
> time this yields AGE_CNT=1 and AGE_UNIT=4 instead: the timer ticks
> every 5 seconds and entries are removed after 2 ticks.
> 
> Fixes: ea6d5c924e39 ("net: dsa: mt7530: support setting ageing time")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/dsa/mt7530.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 44d670904ad8..b1903da7d500 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1027,8 +1027,12 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
>  	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
>  		return -ERANGE;
>  
> -	/* iterate through all possible age_count to find the closest pair */
> -	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
> +	/* Iterate through all possible age_count values to find the closest
> +	 * pair. Start from 1 because the per-entry aging counter is
> +	 * initialized to AGE_CNT and a value of 0 means the entry will
> +	 * never be aged out.
> +	 */
> +	for (tmp_age_count = 1; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
>  		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
>  
>  		if (tmp_age_unit <= AGE_UNIT_MAX) {

Sashiko noted that the above will have problem with secs == 1:

What happens here if secs is 1?
Since the bounds check at the start of the function allows secs == 1,
tmp_age_unit would be calculated as 1 / (1 + 1) - 1, which evaluates to
0 - 1, resulting in an unsigned underflow to UINT_MAX.
>  		if (tmp_age_unit <= AGE_UNIT_MAX) {
Because UINT_MAX is greater than AGE_UNIT_MAX, this condition will fail for
all iterations of the loop.
[ ... ]
>  	mt7530_write(priv, MT7530_AAC, AGE_CNT(age_count) | AGE_UNIT(age_unit));
If the loop exits without ever finding a match and entering the if block,
age_count and age_unit will remain uninitialized. Could this result in
uninitialized stack variables being written to the MT7530_AAC hardware
register?

/P


