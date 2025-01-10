Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBCCE7719D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w33jw1q4Iy6fLg7J+U6vKqGOAfKskZPYBAN9gxyTK/M=; b=Wuhh/LdNcEXR1S
	2lupCleOx5b5gXnoO9KGl7KLlDCsPh99ZSWgneEjw9OgKQ3A2gBOXdoWe2qaNQV3P9minqwklKsoe
	LoYtuxiVYMsNxM599qeVH2vRKXqGDhibxzQot1p78PnDyropWpHPoIBrhvuyITwYnun7WlftYfOG3
	DKnGkVVroKPAH8QOzSdyZaPCYITz1/dlCPzKXfcFUl7I2il9fNIIWRMEFnYSd4DndCXzmVQkEknt0
	/otmWvkDojSTNrKqJOHY8UEwthfg3CD8Gomag0VrI6dHoEkmlZkJxs/VzTko4tFlndZw0L896UsNi
	ktA9vs/5EFUQuHTPvsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA24-0000000ESnu-48MJ;
	Fri, 10 Jan 2025 08:06:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA0r-0000000ESip-3vCt;
	Fri, 10 Jan 2025 08:05:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so2761448a12.1;
        Fri, 10 Jan 2025 00:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736496300; x=1737101100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w33jw1q4Iy6fLg7J+U6vKqGOAfKskZPYBAN9gxyTK/M=;
        b=AfZN7k68loKkWEit9pw+2lc/hpUhI3zgKeimvGw/qMGmTXNBI31qh1BtWvaf2faJ2r
         7Nw3mdCgbA22TsluBz9+zE64B8ZRIMOIvWHICCS7xreUQwaS5Z5IekF5KDrWrRP+0cSE
         Su/+kqAAVPUCBNufEAmCapLEAFjxDFyNkTF06ng5Vguei5IPzk3pqoZ/kI3bMsuUOCEb
         5kjACJAyrhMR5gfzB5SOC7DKXQMvvibi9ip12krpe42VOtJJhrtlYl3UYIHCgOgKvH2L
         0vUYCd2zjOoV1fI8mkuvk+Sg9L6hpX0M6fWeNoyc2mzpkYXR0IPzLRM/WDf+Vq1ztPrO
         7CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496300; x=1737101100;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w33jw1q4Iy6fLg7J+U6vKqGOAfKskZPYBAN9gxyTK/M=;
        b=tBj1KGXoMLjSb5WVMrRXfCZ16f9ixwKCKiIQyUcC3fxxzW0GLIDCuymOYcb3s+KtX9
         WzqZgLdWB6A4dotzvhSf4GuA2IauPxdEsY77yVaiZnzAQq79e894eajWp7kXOOsLqg72
         MPnqbPaLkgo+xUQ3Rayf2gQ+vpkCmMzdz/GOr0mx4ax1u9n3GI9qKfCdM6/pu1jms1Wo
         6g1xIc/lp7LTeZSnZ04UPzgcTBg+Z8Mv/NBKTxR82IV7g8kpFFg8eUFztLIuWqr57x8g
         JKggSDJx3d0/zRNTAxTXM82ltHU91NjehlaouZpBe2zJjFiKm4j/mvFBanBwgSz8jVJ4
         KJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCUljkVqAjFHKL5Q9PPFQWDkBvDKR/ijGDM+XyfBrS3tRHcEwZP6Nv7DbJKFfVUK/iWW8dTDNrsn3Q2HWvOWtkk=@lists.infradead.org, AJvYcCX284J+qMIkKpER9CwST9zcgC/vmf2CVhCdFrbVQs52xRXRJgBSI31JhyYUlEUyvGelU2b4lkS8CFGwgFmeNgJl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ZurziQi3IMkocjQsggoHaz1Uq2IcHMQ3SKSy6ZuEzoPNe/P2
	Ldl0ldNQgOKBE3ke+wXc65GCo3VbiRHCpdiOMkaFyB+vcA78SPVW
X-Gm-Gg: ASbGncud5Y8RzFv9y6m4FJBtWkw+Tu8Qjmgwr6pzunTRB3XLAfD5nRopt8eD5tKLEUN
	4lR45dEmm14sq1nqDbFAHEzVyysB/snjYoq1sPtkXwWfzbczJGNd+V3rr4nog5FP3ivCisHrzLM
	xZGo6GYGLuioN+7/YZqbkxt/FABKIBvYNnYii2TsKIrY4qiJ9CWHtx+SZXTcz/f11d6iPwuH4cp
	gmIJuD8v65D3c5BigEkF3rBgKnOwHd/49N3CqTH0lw5ILg8iahMdVodMcFTPPvICzrkUDcX3F/5
	Il4OGzKnogXmat5KNbGBLCTwAjIByL9oC+glLvBq/NoLox44QkVvfzeuxmcNe0ssPCiCT2+uzui
	CZNkAB3uB6swsnsI1bTHLyBz9O+/d2Gg=
X-Google-Smtp-Source: AGHT+IGbgCuh3qC7xY8GvEiBWaGdc/P4HDKXuM2eWs1hM1/IBlvby9L+VE2CIAbznQNTJB1KVadNgQ==
X-Received: by 2002:a05:6402:51cf:b0:5d1:22c2:6c56 with SMTP id 4fb4d7f45d1cf-5d972e1be28mr9171656a12.17.1736496299668;
        Fri, 10 Jan 2025 00:04:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c523sm1409367a12.8.2025.01.10.00.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:04:58 -0800 (PST)
Message-ID: <a54b564b-4f88-4783-9e8a-72289ce11c04@gmail.com>
Date: Fri, 10 Jan 2025 09:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/5] net: phylink: provide fixed state for
 1000base-X and 2500base-X
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
 <E1tVuG1-000BXo-S7@rmk-PC.armlinux.org.uk>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <E1tVuG1-000BXo-S7@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_000501_980343_9692DD10 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ar__n__ __NAL <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On 1/9/25 4:15 PM, Russell King (Oracle) wrote:
> When decoding clause 22 state, if in-band is disabled and using either
> 1000base-X or 2500base-X, rather than reporting link-down, we know the
> speed, and we only support full duplex. Pause modes taken from XPCS.
> 
> This fixes a problem reported by Eric Woudstra.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c

After changing 'if (pcs->neg_mode)' to 'if (pcs && pcs->neg_mode)' in
patch 1/5, I have tested this patch-set and I get link up.

Tested-by: Eric Woudstra <ericwouds@gmail.com>


