Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC6AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=; b=N4NUJNbyeKFHzc2/DeFNCkdSzx
	Xg/DGorFRsnuP1r9eLNgHJaDXoEazPYmqc7jtTFDpuCeTNTeIHYdCSBxGOuRDAo3CVJX76br/Ix1p
	6AkkOBQ35lJIK6qZUnk9baMl9MBCt7RE3bzem8GyhcTmUYmmjvtfJibFzBUf9Z/iJh6KQ4Gj4W62Z
	I7G7LqeNEEh/Ga4jyGc3fsq4N3FHMzFlzngoGPuKsabcUWtnRKYoZtMu5iIsW5I0YVZHf/rAbR/o2
	d7QFtFQRb7NRbcNnfqIeQMkO0EvKb5y38GfS0QAOBtAGCWnWhZuj23xbGcYrTmTEwV8Sxzdh4Inhi
	RlgMNcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75Y-0000000FCgK-01qH;
	Tue, 07 Jul 2026 14:47:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75V-0000000FCfO-1iQp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
	b=JvE7aHLCdDf4j6IAi7+vcKYRLx9J85Ii6qXGpPQ5xHZO5uEOSCYGNIXjtpWirWG0BPNmsP
	lnoDiV02peidlMp2qAytKyIMdVTL3gclPEjhTyCNQWwKpg0OBiAsm9xxzWIDN1TCClpllq
	kR6TJ0N8w+jJfqEDiMD8dnChsnnQwG4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-xHkYPXRuMCW9_-tPTK35vA-1; Tue, 07 Jul 2026 10:47:50 -0400
X-MC-Unique: xHkYPXRuMCW9_-tPTK35vA-1
X-Mimecast-MFC-AGG-ID: xHkYPXRuMCW9_-tPTK35vA_1783435670
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a17ce8b08dso2079845eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435670; x=1784040470;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
        b=fVp9jTZVyYf/lkc9YonMqGYK42CIgcB4igKNd/Oki5A6z7lf0m21vbsR1P+G2WPlRi
         tMb3joOFp6NDDIC0N5OkICds1mSKL7Z+u5ggEZpEPdhrXAflcElg4jyzX+JvzagtFNBp
         ZLM1gyIxTx8gdfDzcMuyuCBk4nNOKYKzexzh3b9M47PS2NRrwh7o6dLe/49xmEM4N04G
         +yd0FGZAgswiBWcNPl2nGaobKtt1JNy/yeWJ2LyT+ae351I9ElSXQGOlhOwu0MWuO9y4
         MG9hAl0Ci/RtgGpXu59Cy0DQRyHwdKtCbaBfOWFVuHHcDmwk4We1RIfIvM7oeyEjdquF
         LR/w==
X-Forwarded-Encrypted: i=1; AFNElJ94lyhIPFDmAVGXgLL5u6KhLG6vndCO31WRVHu/ZBdM750wY6L9wkwtBDZVhsXhPHv1iS3kLmGzY6MfkEebdSh0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw4JA/Y23Susi09La4GzqHqGIrozF4ffpysnLdmoqMC0lkfQtU
	AgrZFe1YJ2h9FrAzxJjS+awr2g8CIp9yme6L3HoxWtQ/WuEsu3oaO2/VP7bhqh+3P3BxlvALWmV
	BcLcbc0nHltC3jscNEOcbE7vIMzQG26l3f1YedJMWNYVrDJMG/97wLwfFW1EE4whFG83zPBagc4
	a8NZR9y5Eb
X-Gm-Gg: AfdE7cnCKk6tgEaMY45FIn/JDy5XO0JGyJ9M6kzouErcnN+4U9cfgRNzvhr4YZchOkJ
	DC2oz8RLXgeGvZNS39tmv54l8gjZ93TfCYjBbg2Q2945n1HSFW57cEdnFSBr0opRbdpOVjrS6uG
	XKyfFCzHmQhIur10yd4LT08vhARmmBhVN7e5/a9twhMX63IEYOGyWjl9uPUvD1mJbx72EeKanYy
	+zH1FbYfve5tKRTLa3K4gWgwHCY/PRWjfgXt+sm6/Z+UlJDwYNL/V4zSZpJwWvtXYRb9YduUGtn
	Hbs4htm9KVGSjncNQPga7l/BHudlmqSdFCgGgAcLU96xWesEh3SLIMYMlZ6jk+2D9CvjnAV7OCv
	WzfQPPdSP
X-Received: by 2002:a05:6820:818b:b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a3555125fdmr3682528eaf.72.1783435669921;
        Tue, 07 Jul 2026 07:47:49 -0700 (PDT)
X-Received: by 2002:a05:6820:818b:b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a3555125fdmr3682515eaf.72.1783435669460;
        Tue, 07 Jul 2026 07:47:49 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a30ff8e0a0sm11018754eaf.3.2026.07.07.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:48 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:44 -0400
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
Subject: Re: [PATCH v2 3/6] clk: mediatek: mt7622: fix memory leak on module
 removal
Message-ID: <ak0RkDJr1FO0BCoV@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-4-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-4-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZtiGWC018GQzwTAJcAjCSseRZTjEgchQSaeGZJ6WTPA_1783435670
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074753_519729_52A79549 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, Jul 07, 2026 at 04:48:32PM +0900, Akari Tsuyukusa wrote:
> clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


