Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F1D49C65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnG6xg4PsOUKKQ1jkLAF2YDjC5bopGJAX+gen6DcvE0=; b=JrBhlMuEP276rsTSqnlvHEcNco
	YhLya1Wp7caXesWdmciXFYAaldJp/mZxHkRIu728z/53YFoF+YCZpmerMr4rh5eN8kuExs4Rs14Il
	Qpyrh1qzLSh1HZmOwYIEBuZtg7tf7p3LZoInhTYZtLIRnFOC4dX+ga3nxOa8IIn0Tsm+IPJgc/U5K
	HINn3EqbSwvxb1xeGCYnQchPZq3UzJQbFneQ5GcF10/0ZmBg7X/3xweIZEwCAi1Lv3+hUJLlt0kx/
	NdPLVO1geNBevpYw3mojTx42+zGYjYB1sqUHz5PlkVoY2ULw7cEdEAf5JY39kgFK7BH0NmfSaIVaj
	kAz3B1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliaX-000000017V8-1z7h;
	Fri, 30 Jan 2026 07:06:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliaS-000000017Ty-26MS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:06:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so1121206f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769756794; x=1770361594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnG6xg4PsOUKKQ1jkLAF2YDjC5bopGJAX+gen6DcvE0=;
        b=hrd03Qa5SahQN0oWiqt4WE2l+q/VpVLIsGC2eOpJErhYJMZSSUmszcEUkA/Mhu2ioF
         DGony5sqaJDEU5S7X0ZVB40JF4QfWA0ZUk5UeC4SA5b78jjtu3GYBeta287XMNt3rmRx
         cjaa3XRP2cJMRPaXlSKztYIduH9hmQLK+hhMXEhQ4wupWERY6mnL+zHris2UiduQ8GH8
         WahcNqUvEdncm/nOWDhWFBBzzGLiftIHJWO0jwlp7K4DaiwDsiidVHCxanK8c/28XAVz
         KvRTiTyASDSBEuEDpYV7FbZNANyOahWjQr26QxhnqxRGOWTuXhFW1i93OT/tkT7vvc5w
         LRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756794; x=1770361594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnG6xg4PsOUKKQ1jkLAF2YDjC5bopGJAX+gen6DcvE0=;
        b=d0CHAdlnmhMxMr816mzcQKANbejARasCdhIxxab5RfJoImibC8ed0xp66CeZ0q0d92
         uebrSp81MwOeJ7N8UyZ+Vo+hlUVu9mnxbT+e/2j/Jtp3I+k6WEuYPHPjmobfbJm9impg
         /gggjdQFo0ojiQ9I/I4dB7VOxnH6HRUxYlyQGBg7zdZCKu9WGruMFEl9HRFrbkltfJFs
         KVJM+FxFA1NZ0qRuiKZUe5uKiR4zBzVT7leLK9fjvzldHnYtKQ/pjgLhlWkdtVbT7FoV
         3YIG0D4SfJsS55J58wEkJRQvElOdLO9yVbJ3Wk/cEImUW95lR98yu5OpYUYuhOjLoqUl
         bDrg==
X-Forwarded-Encrypted: i=1; AJvYcCXtJhN0p2dMeFlFBOqKrAGwWetUgYF0hMReZ4LhbjkTEag1V44P2Flea89UfZBl6wmEfWgne3DZC0Q5CbKiUASw@lists.infradead.org
X-Gm-Message-State: AOJu0YzddSylHeruxGRwPHx9vXRbN27aRr4wtSt8Gx8SgyKLb1NE6658
	TWlmRQxkOsJ6di+CiEi1Prwo3uF3B95lXjJ00/oj2tRl2M6JEnPOAriJD5B/+llUTM6sepbtoOg
	HJnfq
X-Gm-Gg: AZuq6aIdq/rf8rzTkU1MkM3YQRbWEMSJ47wd6ih/WGr/D3D27iDnZkMbRtdhCCmSwgr
	BADBFpsDDt4yKzQ0P2nJ9nH5oeHLNDDwL1uOmKfF6PVB41v0ZUdHEJrSeKLMicyTXxn+EPPMXMG
	VsNZ30SCxCwfLUhrmPzgxL+YU/iCIUu2OKzEXd9HGwMLI6LNgaoQ2LauIGAOPUJE7Z956qClC9O
	ryETf6+UjT7CHVHCBBaocJUzTXNqM96HTZmtx+bwvkR3hzU3oPCHEygPLhn/F6DU4d4XYQGuivF
	RuGYYEtCmF3KpU09Pj4WmPmQcwdXvfHxbX3beaoERTrXlGYG7HT8lBtDySOBIDptw6+uPJepwam
	pL/uu/SNocO5Pn0yMxIL7mgqTWHSW1VNsgw5HnlPpedKpQf81zvnZPCjzWi2ROJ7AE8GP1EhvuO
	+D5eEGdSYBQw30kh14wQ==
X-Received: by 2002:a05:6000:40da:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-435f3aaf81cmr2905850f8f.48.1769756794284;
        Thu, 29 Jan 2026 23:06:34 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm21442766f8f.38.2026.01.29.23.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:06:33 -0800 (PST)
Message-ID: <878697e8-9770-4707-83c8-e8c3834c4447@tuxon.dev>
Date: Fri, 30 Jan 2026 09:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <37dfe16abee98a6b768fbb3b82c0b8cd23bb6e44.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_230636_580125_C68C0903 
X-CRM114-Status: GOOD (  11.98  )
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

Hi, Ryan,

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> @@ -818,18 +817,22 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   				switch (sam9x7_plls[i][j].p) {
>   				case SAM9X7_PLL_PARENT_MAINCK:
>   					parent_data[0] = AT91_CLK_PD_NAME("mainck");
> -					hw = sam9x7_pmc->chws[PMC_MAIN];
> +					parent_rate = clk_hw_get_rate(sam9x7_pmc->chws[PMC_MAIN]);
>   					break;
>   				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> +					struct clk *main_xtal;
> +					main_xtal = of_clk_get_by_name(np, main_xtal_name);
> +					if (IS_ERR(main_xtal))
> +						goto err_free;
>   					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
> -					hw = main_xtal_hw;
> +					parent_rate = clk_get_rate(main_xtal);
> +					clk_put(main_xtal);
>   					break;

Could you please let me know why is this change related to USB? It looks to me 
that it should go in a different patch. Same for the similar changes done on 
sama7d65.c. Sorry for not noticing it previously.

The rest LGTM.

Thank you,
Claudiu

