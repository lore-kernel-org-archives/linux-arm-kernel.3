Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F027DCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=; b=jAGijvfbxlAXZdt7KUwHSnqugb
	7z5JSv4hB6yCWieGiYd//NL3njwmSyWP4vQIleeBEPVtJDPp+GElT4u3My2rjr5eSlexAXQ/iDdR2
	Vv4ecT0ChgrOfrxOa/BOrV47MzW6lSt49iS+Njukx1cTICz9Cbgt370x+S5ofXEcLLYkGC6oqJgHE
	9q+WBcE+tG+zcAPlhj+kGP8F6Brv9X0kJwVva1ner4ZSGojEdQZ9PkiYZ0mfCvl8el/iy8I5BDYoq
	9/qqkWmHPZwBsOZ4spdd2ZtCfmJoN5sD8qvmPjK2QIVUp5n0dGUF65uRNptNAUMfEP/mg5IBAzdhf
	lDtfP6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH13b-0000000FrxW-3RF5;
	Wed, 14 Oct 2026 15:38:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH13a-0000000Frwn-13QB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 15:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=; b=ed8EkyiRD69eY+5rsEXmlLGfIn
	IgCDrGyhLFKmhaSWXVRcB1dCtG74WLqFxwPAcT7UirAXv3BCinywoH/jp0i4nE/SJ+iFb3Yl6F2Bl
	48kxgF2ZlHhNdXouo5E690UdFy4x4Wf09GErv6Olpk5bWm1l09R81RpiLUiiHp2RKRi5j4eedDK36
	rZWDJcFUsafTUKdvUkkxWf1VIBcLRBA2MjjXAeaKcUSO9JYMcm2WX84IzOprEYwLHYYLftibeV2jn
	+fz1TBxMYygzlGySzFUOD+F9VaSIUbAM8P993dXvFWHG/8qsXM+5mm6xYkP76LvIqEAxReiN9dToS
	wmuP3eNw==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH13X-0000000Gx3P-2JHT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 15:38:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e60f9af6e6so9423165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791992293; x=1792597093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=MSU5g1oKVAKsG5i5s1vJRppmWLWYBnNSDMqdSIeXLxay5gaodtREF6ADMF5NwN/Sy/
         PhO3tYqSCEK6QIA7dJjBNi6Ufivv1eiOnKSQEs2owe+j/uASu7YkfHnAchOi/pvT9vsW
         67aX4UPMp5gq1nQeMcxdf1E44kv6KkjxC/h36/8FD+bOldvjq2vN34zLP7ZpZ5/jRYAE
         s6AhgqmmDnZ2YQg8UednsvogeiXaSkTXjgAEBnyHP5s+s42tm5T4MKGZSGTVoMl33lGO
         meCkW7OBaOhYh5fnbutX/lQoLNJu1b4qaiO3lL/e28MiwArXjjlF1fawwrYEpdQp6Xyg
         U5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992293; x=1792597093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=LIi13O5DtQzDguNwOH5Ag0npUEma0PdPDna+FrwrqxQvFWT2r77DXMpDbHoYDtIhco
         SWU7DpNWmXznMzFSlcVo+Oz4pQyY4XgEIyyCJaiiAdD58B7Xib+1cPYHVZCqOLsFuAQy
         hqD6CED0/RKEeSXk9/hR8ppC6M8SeKK1HHBlabiJS3HO2ddSgWBXJaPljdzJ/yrnK/a3
         tRTKuBN79iL5qCXYCFVpKSUjDlcjXDzbDY+jFXHdUHk/Y6u1a3qHG7lwqtrRpEJHcpdr
         D0oP1vQ4i4Ljn51fzTp2DdvlewpMFETGRURMACGTR/D77WUSA1QlXCc738+0edmW3z2m
         BhwA==
X-Forwarded-Encrypted: i=1; AKwUvBxgi+eHSm7GrdrZS87ovNgR64CoGfUb1YuksEx8iU0POKF+80O0t2T98PhhjOkOuOvAcxY+aFIU2fl5SEnQwBeV@lists.infradead.org
X-Gm-Message-State: AFq9FYIIIMmvFyCA7ertmF52my9AAYbl5E9GIgBI3h/82KVUVOTSc0Y7
	cR0i0a88xLunosOuQ9LVaxUo71E1knGW0logJyEGc032RFKqHN7cmAaLvAH7Y5Qkqj0=
X-Gm-Gg: AYBFou1z6Ztav0t8l6bb949uUeYkzdb9nAZx9D+7xZ3tY+w2W521yvUSOw39XX18NRi
	ywRWxJKB6nD1l1AYeN7sQV0tKJ+AkRekDiY6u/mdj7Ib61zQiKQEXN2IEKJc9h9bYpQhtYeUYjX
	PfjbnsOVW7W45/mjKz363yeQYyt48uRYkHzL/arOLPbuSuUMb/CZ2Vf/Xs52L/Ep/PchVdIOug1
	OnJbGcHtPSlY7BZyCRvrtZ8IqYuavkwchEKeCL+29pN0D01jW84iiyftusQdX2f32wdMUe3NG/I
	1fz5K48VsFKFqE2Og0yYlASBtDH5GYU71Ks+4TzmJ0POiYnRgfKDEWAotGnKrwpNRQmVYuXTdwF
	HFz1IA5qVUx83WIzf533i8Xv9tVyarJtkO8VQq50HA1LtTeg8eaH9NsITpFLCSRj9DHh8dLfhq6
	NFtwxpAG6slTwxWVIYP5+Jfd7Efzl+N00PJ9dYGYr16aKK9UWluhlv1SH9aaD+mPZ+2pWCFGzv1
	TqfY7W+WlZV
X-Received: by 2002:a17:902:74cc:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2e90cb4b71dmr35035725ad.55.1791992292750;
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d009:9564:b54e:1fa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16casm73740635ad.40.2026.10.14.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:38:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Message-ID: <as-h4Xg2KTvI7hiw@p14s>
References: <20261013074744.942560-1-thnkslprpt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013074744.942560-1-thnkslprpt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_163815_699334_95978E33 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, Oct 13, 2026 at 10:47:44AM +0300, Avi Weiss wrote:
> mtk_rpmsg_match_device_subnode() returns a referenced OF child
> node, which is stored in rpdev->dev.of_node.
> 
> mtk_rpmsg_release_device() later frees the containing allocation
> without dropping that ref.
> 
> Release the OF node when the RPMsg device is destroyed.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 1b670ed54cfa2..430a9b2aa7bb9 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
>  
> +	of_node_put(dev->of_node);
>  	kfree(mdev);
>  }

Applied.

Thanks,
Mathieu

>  
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.43.0
> 

