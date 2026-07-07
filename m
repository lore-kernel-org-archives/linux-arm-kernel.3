Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83EFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=; b=hKQVPS53niNKMhHAP0dZam0j+q
	O8DwLqeyljltqk/DqJ5Rdj52JiFnuN0UP21Bl2gKUMnRqMTnrM1wjOe9Fa+i3xTzGQYcHgOaMB+aO
	P58rAzBwBfaVpI4o+xcE1TM+UjfTd2dRU3W5skzAI7joaV0tudvhyhVJIlm6NdnmCfFAoiR+B8dHL
	nGW00JvP7UQ4/wZJIImwWLkOaly+Aim61LZORD3ksusmA4zCjZluNy/+Csy4L5am3HmCThLcWvmVG
	LaMyyhl/MJFJBpyoQuDE4YyE5wpf5beoNWpfx5G6h9XMh7iLJkN6CQGG7i61bYO/zHuurZh9mKhn/
	VKYoGcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76B-0000000FCud-1PbM;
	Tue, 07 Jul 2026 14:48:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh768-0000000FCtC-4AMg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
	b=bP1O1QiL9ImBalx1GlpVDq7PitwHeYA16z9vHwhsehClLAKenlDXm1KpoQ9CmFn79gikUR
	CHupu+7E75NNQTgSLnW1TYFoB5/hJ6HtgeDQCidYt1zw/JZtcbkKw6aBcNA0yYCQpnl1lG
	KYTw1hzNrO11t3w1q6Rt5pqbtCmdOmU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-0uELRodIMRGw3JAvViqWCg-1; Tue, 07 Jul 2026 10:48:30 -0400
X-MC-Unique: 0uELRodIMRGw3JAvViqWCg-1
X-Mimecast-MFC-AGG-ID: 0uELRodIMRGw3JAvViqWCg_1783435710
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb6a8c61deso3551278a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435709; x=1784040509;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
        b=mymvElxYLEPt+qRSjDMs3GbU6W+dazuuLdLjc57um2uBGp6CY9OhT0E9HNDa60kb5M
         dcNfeNfnzKgTBXrj5xXbeBwB9XoK8hy+3KBUzSrP4Sy50p+KecbmV6yCkNS9M9yaz1yo
         XdV0jtHAJ+t1X4GeZ5weDvNS7dmlG7Kecm2bLMiONc810d5t3yK2Vqeyf1hq1KjbHq5O
         +eoosEmmEspd34ohoVLWwftmBnjYD4iDp4HLg0vaDLSKsrxZAqcD1k0lM4/xX8R45l2l
         x2+zuocg/FO16bZ+NIhupzYitTRr7Rt4JY2c94asT+mqk4hepWTESeW+u/WkFMQcd0US
         I3WQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BcFKw4xRPE81OXWvl6TllNR6TBtQgwaLZrDoBetEktLZNgfUMf6rT6oh0A1U4++h0V/UAd/10Pw6mvdGnc25k@lists.infradead.org
X-Gm-Message-State: AOJu0YwV0ynCrARQPrNXCjKG7p5f5M6Ri8SH/WxC5+MN7MDEH7h0kHM8
	TOGK1/tCJnogMdwgcCZhhiC1qDzai1tK8AopSMBaZ1ARXhcN/rC6+Zo/iODj2IjUTsv/c/Cf+cm
	PhRpsGhgVnXtOyfSXEBkUUOiHDixhTo5Ctwobs9pQ+MGfF3m/Xj47z3FwOVF+d82rj+uq5PpOZo
	M+
X-Gm-Gg: AfdE7cnMDnRxaq8ocyRoA+ADkGWcPnJGU+iIWWA2PQDt/FSKEyqcpFXgDyr7uk74KIY
	aYX9T8otv503ygGUR2pOCsTLZcMaNWkXGLCr7eBZ8o7lLC6VW62qy1P2NXrveCmDUk0Doo9Pd3+
	Y4sURBi8beIVfa86FMDSYQRVzsfz2v8yGEJIQfHxOC19WjMo2kyZBySsrAAxhqHFgBes6Whn/VJ
	lEQkRzUctmtm/s6+PtqcWoeoeGlYzPZBJyeKwZUrlc2ZgnJrkZwT1BfhYtbZs2j+NvXMqBx07Ht
	VTS/NfQO08vtHPTk1MbZbqDFZ8Bf+6tS1ZabUAagNAknACRJBDbx3ZwOR+7skLkbqIeyD3Vb3fl
	p7iwgfQN8
X-Received: by 2002:a05:6830:660a:b0:7e9:f0e6:fd55 with SMTP id 46e09a7af769-7ebb239d6a4mr3693059a34.30.1783435709572;
        Tue, 07 Jul 2026 07:48:29 -0700 (PDT)
X-Received: by 2002:a05:6830:660a:b0:7e9:f0e6:fd55 with SMTP id 46e09a7af769-7ebb239d6a4mr3693021a34.30.1783435708164;
        Tue, 07 Jul 2026 07:48:28 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542936e6sm14104096a34.5.2026.07.07.07.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:48:27 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <ak0RuP-Gy29fpPVi@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-6-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pcGgnambcWsyR_HWXDulaimSlc847YAJNhmy7vPiX9c_1783435710
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074833_144883_43B6D98D 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


