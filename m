Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB26C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=; b=NUrIwjHf3Q/CVZKdi8wlA8czJV
	hZDRQP9ymD9G9gVmEgZKawv0oIcXj79MVVLurtgKgQfMeX8WuG9JzsQn6hNTk2O1BbbaiVaIq8KwK
	AZqZCwNZ+/E75gSsq5r5zNUbvkR4nHXno498wSV6UiFQuuqoqgeTUrpmVbuW96tjQEterVSPa/4LO
	pYhudrL0fgbGEg1P/SOHEy7r0pxv3XqDH8XGUCbmNt0nYLcIsY9Fe7P679I9kRVG+zg+3483bpj09
	4DdR/d9TBYh0aF3b+LGyiOKi3MqpUbLTlhwwXv6drmyhPN26sIchZIob9rcjVL+HTOJKMXNzcUujP
	bj1Mgntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76L-0000000FD0s-2T42;
	Tue, 07 Jul 2026 14:48:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76J-0000000FCyO-039t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
	b=Ay/6FBonifhOZVCrnhuIm13bEyWzTvphdEtGscors/x5YdbPEwJTc+5Syo35zwd4vpyQAO
	1lPcyqGfDGZ/gJBj7ItOgbKwx0oUq76Nx4OZaZmCaNq+de87jCsFwq4e+nOcns8rFv4vJL
	Asd+cl2y859d/h8+M+Wb84KSdkjUDQE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-YvPTSMSMMsyF_Bo0vVFsbw-1; Tue, 07 Jul 2026 10:48:40 -0400
X-MC-Unique: YvPTSMSMMsyF_Bo0vVFsbw-1
X-Mimecast-MFC-AGG-ID: YvPTSMSMMsyF_Bo0vVFsbw_1783435720
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9f1ee3ce4so1041304a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435720; x=1784040520;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1r3uOYYLfyHkYl7JQXo9+dI1iFhQk/Yi77FdFZjY7s=;
        b=pqezSx+ZwA6oPC0ZL55/Ja4aIoANIdaz3vpdMNxhk5F4r0dkWDKdTW9/CiWG5nTWM7
         EPVlU8rNwe5hq7IGuvAKju6F36GYqpKaPE9q9XXewc0ebi87npDUSHqW6LekHlc7rCjv
         gzP5XGODRM3SXFWa4tte4TzARS+DAPo1BSt5jvSx5zyyU3WhF2K7ROTvw+UzoYuHM1Qq
         zaiJCg0oEW0G/8YWtd2azYyrXUrTxZe3pdz8rjAs/jpZJldTV65Qc8R5Fifo2i2OY++w
         c4cinsFStcQx3dxGAKbczytH8qAH+ke8FVUrVDeugYVFDUNjBn6nmvL6cg89gBpo3Os8
         d4Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+GXxhRkReNh63C2ob1z20E7igg9rAnVq/XLzkpXGzPFGD4li+qlBeFng4wz9sC/I8y6F5YbSGImmv/su2vmYuU@lists.infradead.org
X-Gm-Message-State: AOJu0YzWfzYbNgjM9LmhAKqT7RTSP0VzV8EjmhxVYTIUjg5on+VSGUXV
	IEVP0CJgd3tZPD6ipyht6/rKu/VeSMG85m/EvI2tkr0JN5qP8xmh8kjejSGwclCWOh/NZgX+r3+
	qLEeBNUbmgFB0OVf/FHObmGUj5W7GnGZOEkX03P0xk3GDtLS33SVVvWufTcxzTPpF3qOCRdjv6M
	am
X-Gm-Gg: AfdE7cmwY1pXhJ/4AoJ/4LILKjcKSw+JHfxZLz+GBq4om/WwRAyP0qRLaeOM3nbpeGx
	Nxl6qDYKnPFfbaoAJu7/OIOAbYePECP/v0MfJBQz+3VXNSMJsu3iML+wuFbV8L/FuvA0GKlymI2
	WImqNMRYq0Hw0KfeOa/e7IvnG2kd5gr4TtMW37/3feFqWK8olpk+Y01Q7nYZnkkgD6rfgC9AUr7
	yNveybUEy3X6n9S4J07IpsXFOeLHkrKrsl0kW6sNPaZL+XD5QZUFwPFbzWzmvJUIVb+XRdMt0Ag
	Ks4ofSdJaGiHur/Gb8KNo/idRdfRgCtjgen0CRW1H6k6RmqVmfcaFepN2eGHqTg4YmdG+Hv7NXf
	+8qXTIrzY
X-Received: by 2002:a05:6830:828e:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ebba10d518mr1910790a34.3.1783435719961;
        Tue, 07 Jul 2026 07:48:39 -0700 (PDT)
X-Received: by 2002:a05:6830:828e:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7ebba10d518mr1910777a34.3.1783435719482;
        Tue, 07 Jul 2026 07:48:39 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544fcb06sm14123177a34.22.2026.07.07.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:48:38 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:35 -0400
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
Subject: Re: [PATCH v2 6/6] clk: mediatek: mt8192: fix memory leak on module
 removal
Message-ID: <ak0Rw5krDlc_ZXQn@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-7-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-7-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E7FfBxDan-nwWyUbA-F4AZkEK71Nz5hNDfVDKfvbfhw_1783435720
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074843_146202_2AB4B3B8 
X-CRM114-Status: GOOD (  12.60  )
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

On Tue, Jul 07, 2026 at 04:48:35PM +0900, Akari Tsuyukusa wrote:
> clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


