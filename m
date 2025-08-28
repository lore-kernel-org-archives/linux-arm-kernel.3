Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B43CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xee6NKuNIkTbreHLQ12czC3T2u1dvCFe2tAbj30qkQs=; b=0iUc/KqkQKZgV/CX1WxS5nwkD8
	I4KKD18e3qq4lLw75ysvP2VFKlhkLbsLqdQOGaaZKjbuWyDaSJR8uXho3MDTpLqxIl8jzi5LgtMB1
	6xzz3Sr22e22ihng4a4Dwq2oRRyqDGDLFipjKADkcM7W62Glm5L1ah/pMQSYK7Uj2K/a2qHXlJIel
	h3DOBW6j77lxDEr6FTsVzmBf/YP3JIws0rX0wEf1iCWNqgoOmnKmgN5hZvWy8L+gbgbMzrGUBD79T
	eQaSY9/+hG7hdDWWInaU8LW6Acwl/wm1qN0f/6I6NN3ZoqsvwE5LN60QikNhuXKDgrhMH5UMOB5py
	i/pCpxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjXM-00000003Dqy-1dgl;
	Thu, 28 Aug 2025 20:48:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfrI-00000002Jwj-3Qlk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756399939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xee6NKuNIkTbreHLQ12czC3T2u1dvCFe2tAbj30qkQs=;
	b=Krc99uc1cpk9irdvRn6n8Dp8vLR74rbQ7EKi7nhcrnA6Y95L8GIgwjOSsZH7/X8p0x9nMe
	SYgRMd+YId3lZ37pjgzhAKEUPL51abY3rlwQqhsO9Nqy1y6gpH70RoK4kBqb/RWxblg0O+
	qfHkJTmiG94wJpi96tqCrCbyZTISVsI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-k4qsjuMgN_mMa0Gt5xJyTg-1; Thu, 28 Aug 2025 12:52:18 -0400
X-MC-Unique: k4qsjuMgN_mMa0Gt5xJyTg-1
X-Mimecast-MFC-AGG-ID: k4qsjuMgN_mMa0Gt5xJyTg_1756399938
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dfa7f8c84so10560476d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756399938; x=1757004738;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xee6NKuNIkTbreHLQ12czC3T2u1dvCFe2tAbj30qkQs=;
        b=Ieu7y+DeQAPvg2pXCYMxn+FGuKUKikEKbvpm9hmGhlyd0jjI/+V46B4sKMuM81hq0U
         6mU4GSJ0u/bSzn2ogNiWi4OiJ91M9JKwA9hLt7sYyQWdrNJuGodT+Mg8uCkHDsgYym/+
         32ZXd2EQUArf0Vrm8UQ7WDGLZhD560ABAv+8K35KOJmdH4YHyutQdRxEANhdxKELOyPT
         WgPSRdpXnCI0jeHlITzfP9p8Tz5O/Apm3oA6BSw02FvjxYbwyA7cv27SFfrzDnaHurKP
         cbLNVpkTeJ0VTajCmK63j6V8lBpB4jx3c1gnXWYFmzDW+amWHUp7yVp6STOCTh5nXqsR
         CSLw==
X-Forwarded-Encrypted: i=1; AJvYcCWY9Wo3MEB4SLQEtYl5lPQELn6CSDAEzVeXD5MbtenPOCdOy/hKakBkepkyRZnRAg2AnM5esgnHKEawv5xA8VSR@lists.infradead.org
X-Gm-Message-State: AOJu0YwCloTeP4SJdKHhJu6JIedEQD94ApgYSSvgNiWwuBtQC11Ah/PL
	GPBwsuJlNzWPORwtxhZbUa8PJB9bUmNXXhG8b8CIRh2rfVThMypjiVVZFKjpAZLJsBTDkQ9ThNe
	dMWS1NpeCmQHdOnFLgQucapEpOdY/yhXz+nxtdvJzZfuaTxf/ZhL3ceRblFqmGJ2WZjNfFUb6q9
	94
X-Gm-Gg: ASbGnctMHGl6xGwyJ8ZbD5vH8tf2QYacibTBSSZgYR27nXDnSJp+sIWf8xJcpXIzCLY
	pRLpizaB32ZGb0RwP95EAzjndisTyJpx5Vrv1gc0iopZx/3hN5jjGgtJcZL48LfVwRV01S9DQ2V
	CbXDDc0Ex6O9AmaY2vna37+LsV4YB0T+uMvtnd7C/zCaBUu94s00KbxK1k8dU9Qx5z1FGcjf1Wp
	OP6gW1uw4HENjHUS65Z17j7ztcDxxg2Am1OL2Zu/cOhFBRe2xyJTFKkMlYwo0vomCj+ohEaEsDk
	/9tcKlBtjv4nAs7X5/2p0B7iR1B2aRDNFPRwcBSdinm/d+H4Gb0/abYfdSYmYQzMhhh+q6S+skX
	QwmQ54f7MEhXWlo0VZVg=
X-Received: by 2002:a05:6214:4004:b0:70d:91e8:6cb7 with SMTP id 6a1803df08f44-70d9725f3e3mr251186746d6.66.1756399937791;
        Thu, 28 Aug 2025 09:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpZ4ICMlbvyyFxhlVpeB0jL0VatrVSJLDHmA5nepySE1dAK1W4TzFTEvJOVDIu9B0SbTwIFw==
X-Received: by 2002:a05:6214:4004:b0:70d:91e8:6cb7 with SMTP id 6a1803df08f44-70d9725f3e3mr251186526d6.66.1756399937368;
        Thu, 28 Aug 2025 09:52:17 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70de7e0ae63sm30790536d6.52.2025.08.28.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:52:16 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:52:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 01/32] clk: at91: pmc: add macros for clk_parent_data
Message-ID: <aLCJPlWTHcaxUze0@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
In-Reply-To: <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GAkaFZExfRXrixrxYO_qvs8YQeYcVsHQagcQILD30NA_1756399938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_095220_928658_FDB779D4 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, Jul 10, 2025 at 01:06:54PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/pmc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 4fb29ca111f7..0b721a65b77f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -15,6 +15,12 @@
>  
>  #include <dt-bindings/clock/at91.h>
>  
> +#define AT91_CLK_PD_NAME(n, i) ((struct clk_parent_data){ \
> +	.hw = NULL, .name = (n), .fw_name = (n), .index = (i), \
> +})
> +
> +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })

If you have to spin a new series, then personally I would put a space
before the {. I see both usages in drivers/clk/.

Reviewed-by: Brian Masney <bmasney@redhat.com>


