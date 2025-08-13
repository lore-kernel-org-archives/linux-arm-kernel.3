Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B5C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BRD/FiSa0hIxPhbV2v5R9dmUKhZt4vQoKPKl+drGfw=; b=Z5xLO0lSJyi82E8wP0XKzeHU06
	G0gLcz+yIvleS+d4Oir0ArOgfjwqrBESG8gDm3MjsUVLFojApxoqjiCCKplqUw+xO7WOjKZk+Ezoc
	IU1sdeHYHu19OtIghFAD7mmGIsugRPpJ2wZ1sgn1hb0e1Z1u9dxIJkyVrlQH57PZ8vy/yBoiozFxZ
	nB0yRJw9o+uWDCXYxn69o6Tg8AiEi3sE8+5+xsCwv1G311qIzzJIxW6HzTgpaycAcNYyQ6OPdW19A
	ais1ze1eSN62t7mp3nvf05Q0H9liovgz4tq6x9iiY6+NTFLABAjVLMzB9VzXZqFo/RzRnbBKImRso
	wGEXtEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4b7-0000000Cjen-14C4;
	Wed, 13 Aug 2025 06:04:29 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4Sn-0000000Ci57-0L0r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:55:54 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23fe28867b7so84803625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755064552; x=1755669352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7BRD/FiSa0hIxPhbV2v5R9dmUKhZt4vQoKPKl+drGfw=;
        b=rHrSFaJWX7dTWM9ZSIGJYTgshr3LBfCrCETrrESDRqLgcyvYmd03eWpUqWtwAM2KD+
         eEe/swy7ma7uuW32IzO2wZGP/Y5kWv8mQxQG+7w3sCB9+aNyU5oCZGI3PQrOg8ajc3LY
         P98nuRjD8kGB70RgfGlaV2NQZ/R0icEb8DEMJejDrN32MBKaJhHi6IWNxTNhfNDc3cHM
         tE8HqMIr/vE/japnSqkMzavsrdSngQapdkJsMgmtlnu4rGMPToojrOX8GFjnq5OYlVDG
         L22YGAcxEuNKUn7QzbNhtBI1TfmJBMDHQjlbE2FNvx75Vr3K54zFrMHRt5WyC4kcqX5P
         qvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755064552; x=1755669352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BRD/FiSa0hIxPhbV2v5R9dmUKhZt4vQoKPKl+drGfw=;
        b=VsVN/FoX7DRG/ebLkqpIXfhpGjDLA05Q3Z6ASkcW3WLd7jJNjP22kCXaqJnd5T1Y9J
         EGZzr+/Twio+Hrbusf1jo8gjOGrG5zOk4R/fyU0p4ilWorlz1L6RPdfsJgjvmKDlOnjv
         nY9XeXWcXeBklud4HDrsCI+Eq6GNRfqsJqu21Jma/1x6iBvgwaeU56QgEnswHs34lMnw
         AYs0B5hHv1xRzb/PgESjsiQEO19zYjsybPZOkWT87Y9O0kD4uhNEqFRYl7psh17OGM6V
         CIrx+5viAIil0yI6KfWIm1oVSS7Hqs2pDJrFAhNPBYNG+Lvv+arGquowHvj2wS3fyyYa
         MClg==
X-Forwarded-Encrypted: i=1; AJvYcCUohdoWaMqHKMlXQQCDoYX7/Mpvi1BP0/tlcqerD2/ox95an4qXCFuSRYa+5N+Oe+J5BoAucF4rqZFSpOSzYBgI@lists.infradead.org
X-Gm-Message-State: AOJu0YwK5ASpNrxHmeu2nBwaarDXactc0dhQpCXP0Vkw9E/e8hNtCEZt
	HmVyRjEeFVSrMGpb00wM7mJSS9lpsqiHN8IaPM57DCj+uA1ccxeW5dof9wg6Xh+CHtQCfLfOXpk
	QIlnLyQ==
X-Google-Smtp-Source: AGHT+IFoxYNoLghmdpptP7tDhzLk87CD3oeZhiQZUU42sNUj217+eYJVUow5Fo+S87ldA3ZHGB6RAPq/1Sw=
X-Received: from pjbsq11.prod.google.com ([2002:a17:90b:530b:b0:321:c475:716e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e812:b0:23f:c760:fdf0
 with SMTP id d9443c01a7336-2430d1f71e5mr29923185ad.45.1755064551813; Tue, 12
 Aug 2025 22:55:51 -0700 (PDT)
Date: Wed, 13 Aug 2025 05:55:48 +0000
In-Reply-To: <20250813014819.262405-2-dqfext@gmail.com>
Mime-Version: 1.0
References: <20250813014819.262405-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250813055550.98488-1-kuniyu@google.com>
Subject: Re: [PATCH net v2 2/2] net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
From: Kuniyuki Iwashima <kuniyu@google.com>
To: dqfext@gmail.com
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, lorenzo@kernel.org, 
	matthias.bgg@gmail.com, nbd@nbd.name, netdev@vger.kernel.org, 
	pabeni@redhat.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_225553_117686_84445EE2 
X-CRM114-Status: GOOD (  13.41  )
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

From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 13 Aug 2025 09:48:18 +0800
> Ensure ndo_fill_forward_path() is called with RCU lock held.
> 
> Fixes: 2830e314778d ("net: ethernet: mtk-ppe: fix traffic offload with bridged wlan")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v2: New patch
> 
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index c855fb799ce1..e9bd32741983 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -101,7 +101,9 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
>  	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
>  		return -1;
>  
> +	rcu_read_lock();
>  	err = dev_fill_forward_path(dev, addr, &stack);
> +	rcu_read_unlock();

This should be squashed to patch 1 or reorded as patch 1.


>  	if (err)
>  		return err;
>  
> -- 
> 2.43.0
> 

