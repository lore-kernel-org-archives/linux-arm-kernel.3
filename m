Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA85C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=; b=Wfc31CyOkWo7xZTmvQU7uiK1B3
	8CWCGNfc8MN9ZpBytlPQZf7OC0TQIJkPspKisVB2cbZoU7R6cOyyIDo+Yhhwb05TycDlXexLBN/jd
	iiK/zLcLQzicy30q6/Gso9IbyBA2tYjebADkODicVmU7lJDI5f2Tk80QaLU0IWTOKr5bccKiNKYyE
	ZWh2sHW3RymeNSYkHuvQJ6KrXovS2FgrC4Q1q1o2WpwTiaes8hzbOMcP6Z7LbrFNVtQd5P7ys02Ag
	lvV5z3euV0DO33IVA4uhhbp0tQk7zF1t0ad6osXKzXaPgBXXqpDZ2UFj5nRvdE/IzkZXyQnN5b7EU
	9CYq1yTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6xH-0000000AWQE-3qpi;
	Sun, 09 Aug 2026 17:04:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6xF-0000000AWPV-1Vgi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 17:04:58 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so767105a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295096; x=1786899896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=;
        b=XAJNYFTZAuSmOTT0MPL6sZDVXw3qTSmejt6eEWhTdPZSP7cPaor3O3rESGN5olELWA
         4uhWaQboisfoekpi/0HDLiIghf/x9Cf9v64lEAFsI6/R3DAXPm8ICpVk6QuPDGAw5lv/
         250bobYc3ZidZl7QUpc2xcoTusFoO2yd6EqFjuybjcN6wlE/1xxHe3GWc5qO5A66V5JO
         uWkUaIzZavFrEwxw3PT4p94gtJT92IQ9j3hHqpGVoBvfhlDMS5r3HLXiGSFTzdwCbiCV
         3KhQuTLQ5Rf0HZtipL/atbMC+3fFGpYqSe8o2aF9RdgG0tzS6Noj6l6T1JL+TjbSMkz+
         7SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295096; x=1786899896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=;
        b=kSz3YSPWHoJ/IyrfFLQ7NfrZS1+Qgy7diE7JYgTDlP5TK1Vgsbi0skI5Ppji1Y6LON
         TSzr+Z0QyzpimgL/tuJBfZWCe03eFEaUXEXi0XXICsS1BZ6KJ0sKo4IeFX71oiVAZudN
         RQoGAx5x1t1gYYquoJhiWKvoG9Ctwz4UZOSIml2q2Pc1A29nmBx6y994UFxiBgI439lA
         aGUVEQ0tB4gnD/wgEmzm5riQTJ5wvXw5i16evyztG4J+A12urPWEDZiy1NQ/Xbk/AarT
         q2bZrF19fHjZl4w7qKV4FKesyR1hX+S59/FqS7JcoLZb5U1zq1P6Xpl+0azGSqNHb/L/
         oXnQ==
X-Forwarded-Encrypted: i=1; AHgh+RomNcJ+s4WhgncdgdoHr0GKHrLvtniZBkELjCRsXyqYbfFOGo/lLvjsBhy9dgvqLgauNwNoJKyn4FTncJ0O0MMc@lists.infradead.org
X-Gm-Message-State: AOJu0YyHSkeZ4Ne6UJXPFNcs8suweiYfp5YPBdy0CJu+nfQwG+zloiSe
	5WTf03WjOg54++HHATXIqOnTct7joTamk3cC8PX8b/WSx/4upGmvlvDK
X-Gm-Gg: AR+sD11g0/W8e4dPzF0njtfk6xj9pewDC6DG8w3NzdyxfJX/FBmp0sTgrm+gtS61iiK
	ofXgxRd65H+4SmrgMCSbxiCBO124mqCfvT7GAjcnyzxgW7XoTgrol80YnVYQ5Eu2VwGBW1uzR5O
	6nlvs3u932g/QJz5pbFHmVwIz5TagBEmE6ffW3xBEm/LJsoeXo0Z0u4+knIgVe3uxVtpGOBcVaK
	fc3UDR2MT7GKej5SGcoBXUE1hv9pOcJpFoRvx8OmWejfAMg61flJ0kdhzY4vq7RzUL1IjV1SuW8
	rctVG16ulIn6KQnsWftSDXcWJlnIuNI/p+iIwx+Y/3hlfBjOQyntxzloHTyKuppj7yr7mnt7L8i
	NnCdlAQwNFhKMw/t2CmRvOTvkogZDVEm4GPGjUFl+QmQq2g3swuSYN1lsV2lZL6/Oj4nS7U+r+7
	r48JsbAfmyJhwWI4b3FIjhgTUBZ+pV50XrwxTWiwRc6jXQ227wPQHZfKWJCS4IU/D7ULv6pthV8
	k6+wbuctuGngogrqeUBX2HGcnO8Z3l+
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3cb85e6689fmr39981875637.18.1786295095808;
        Sun, 09 Aug 2026 10:04:55 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm2824978a12.11.2026.08.09.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 10:04:54 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:04:50 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
Message-ID: <aniv5B4jz07mI70D@buffalo-ssd>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809160643.33991-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_100457_401694_0EAA7A55 
X-CRM114-Status: GOOD (  12.00  )
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

On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> Enable the toprgu reset controller feature for the mt6589 SoC. This
> allows generating reset signals for the 12 subsystems managed by its
> top reset generation unit.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

I provided "Acked-by", not "Signed-off-by"...
https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/

PS: I am also fine with this patch carrying my Signed-off-by.
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Best Regards,
Akari

