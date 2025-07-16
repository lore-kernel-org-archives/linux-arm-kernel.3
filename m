Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C68C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRKMCti2Ai/CuBdEyVpIY2yewXiU7F1sYeoCE/NOUlg=; b=JBPflF3FQuDGsQek68J5u8r9V9
	Dp+S/UEXjh+8y/rj5t7+qWUFJAf28p3/u9+kTAjVCNhgeMf2loGYFUEbimEW3qd6MaCMUl5OF3M3h
	PvJToNWOAQlEIr8aiz18hdXTYMyfk+Mr9VB2vgAuBdAG+enHCaiwZPLAs9M7XPxZxXEiw0+81lT4T
	tgYU8VSiOM5A3hRt/cMAQ/otphNkC8rSA32kx1LAE9jRHqAc+8wVY9ZK/6MW1HkSQ5xFXB0KqZIXI
	zhFihJOuQgFZuNyD3RB95Bzv5cRpNKc3l7V5OQmCLOSWu+RyHRrRBWZr6oUfVBCCdh2JOIWjk/rAW
	N4uoFJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9bn-00000008hAS-1i0J;
	Wed, 16 Jul 2025 21:24:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Wr-00000008glC-1EGC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 21:19:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45634205adaso1230115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752700744; x=1753305544; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRKMCti2Ai/CuBdEyVpIY2yewXiU7F1sYeoCE/NOUlg=;
        b=I83T/AZSA6TjUavdXmC14NtWZcsnuyo8vvAT2ADdPPoNfcqyE7lDsOavnEjFAzjrG0
         7kYgIBUckWEVyf8QI6wSxrMvL4NRgQ/8NkmFLvS7b4DP6IaTcFVp4ligENdc769Mo7to
         /Xf091BIKKEkJCKoc8ZkP2oa2yWI8zNikoajIZ7KQhX4UVW9zrahskxWWmkXsOj70Bye
         VqlQibzA1+FnHUpKvnl3Hi9RzOe2L4b/85DAtUG2/5UGB+z5hHDwc+dxICM8t4Y7998V
         XsVR0PQYH9+pHVRjFlH4CLjp7g93QDsmzcYraBaYrquwYfO6ZJ3KailShBkvkfpVMr4v
         vBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752700744; x=1753305544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRKMCti2Ai/CuBdEyVpIY2yewXiU7F1sYeoCE/NOUlg=;
        b=Dy9PfDLAooSoPI8/mqdm8XfPhvCOJ+zVIchgHrW4Po6XpZGdMw2IvoZ0YAkWEmHv0y
         J3GGHAArO5GdMmrU11xaN9o+/i+k480ykQrmrdo4NxWaF8N9EM9DBe+Sea1PR0t43+cQ
         30+7GmdFuxrNSslKAhAtIZSI7X+mdqw/iV6uXcJXn1olc03p766RA4P+JxPwF+XF7sc7
         y/gBTPyznvcTtEJPLehiIwlFqlQiFfzTgd/IemI1j0rQFE8o7gc36yq6VrXIapZqtWWv
         IBsCA5zN0j6eWWEd3a3ZsjUDgApdt+8IalKOTv5DqVh18VZNkOXZPLXZjCQNnoWoMrWB
         mFFw==
X-Forwarded-Encrypted: i=1; AJvYcCUeDuXf7GzX9nZno1aWQmAfZDUhDrvLL7aY0GWLjovC9sboFe/eA18xe4OtOCm3XiI/rtuDxsB5as36Hs8zDbWD@lists.infradead.org
X-Gm-Message-State: AOJu0YwybL2n81kCljTHuRAn3+6WDK49XsW3WwYF2sOsLB999CuXfTOo
	2QRx4/XDVLN/ZWAowulQYPl/y6EuQ3JnrT3l5TQApvU26AvqmOdSTInJKLGlA1HQCh0=
X-Gm-Gg: ASbGnctOv+GFk/2FfouXxKfI4bnGWBslLAT+PYkX5QORcWHt1zHigl8sR365M0Memgh
	3sIjWE2cYFpA61UtkhvzdJiN34yXOrTOgGlGU0ZQjn8W4Z9x5lVm4ioPajcJd29DUsb56zg3yxX
	/9GdyKG3h8PZ30uBOrWumlIRAzi+fD81PzirD5MarasLiQXsyLO6jIfT3tuVq0c7rSXcu1fqBwL
	E6XnzYoa8kbb6haq6ovwWqquvYe0Tn3VZANQIuxFXH0zN/laah6APBmHHofudEB3s/OxG0b+goW
	hIyEvvVdIImVkJYNHFeEAZktU5t+/dUNAjCeAjs/lZfY0yEFAng9701MgxwK2lO8NtuJrA4Fbd5
	pDiLmMzerMGV609twELRCZMTGRyJUrCV1Y4ejpAl0EsPKBnssZUDbL6Az3S6s
X-Google-Smtp-Source: AGHT+IGU+ypDAJJxAGg8IJL70QMGqBYPckZVXPJfzPAtYPsw777vZbMiHPPbbkBp+5WtNr4iOtNXRw==
X-Received: by 2002:a05:600c:6097:b0:456:302:6dc3 with SMTP id 5b1f17b1804b1-4562e3c4b98mr33569505e9.26.1752700743650;
        Wed, 16 Jul 2025 14:19:03 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f4294sm31833045e9.3.2025.07.16.14.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 14:19:03 -0700 (PDT)
Date: Wed, 16 Jul 2025 23:19:01 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Mason Chang <mason-cw.chang@mediatek.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Julien Panis <jpanis@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Steven Liu <steven.liu@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add mt7988
 lvts commands
Message-ID: <aHgXRcyEWreMC_P-@mai.linaro.org>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_141905_352941_BF8CEE73 
X-CRM114-Status: GOOD (  12.23  )
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

On Mon, May 26, 2025 at 06:26:56PM +0800, Mason Chang wrote:
> Add the LVTS commands for Mediatek Filogic 880/MT7988.
> 
> This series fixes severely abnormal and inaccurate LVTS temperature
> readings when using the default commands.
> 
> Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
> 
> Mason Chang (3):
>   thermal/drivers/mediatek/lvts_thermal: change lvts commands array to
>     static const
>   thermal/drivers/mediatek/lvts_thermal: add lvts commands and their
>     sizes to driver data
>   thermal/drivers/mediatek/lvts_thermal: add mt7988 lvts commands
> 
>  drivers/thermal/mediatek/lvts_thermal.c | 74 ++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 13 deletions(-)

Changes applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

