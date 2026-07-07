Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01034C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph7EonUkISD+ckd5Ulg8eFLpvpFj+V9UnIoIMQ3RmAQ=; b=WWhCHoU6raThHNMNLVaGh3fgtc
	EgYBB6VS3Sf9hMtLAaNan7FTmbia3FlPIm9jCVGcAXDF3JRpktYxo4ZbEcmYKSVZrtgK218BsB9tM
	A8eQbjyvqD77MzEoD1NUGuxODOnAJc7vdjPLouvOy++xMQTINSgEnMCCmjLf0YRW2TNKscXRC/FQj
	7hJ0BPaD/wDB7wjVWXwya0DeoUFw4IjwkwlH2Cb+Rz/iVNuL2yZlj7gAUfG1GwTtQPZke5FLb9WCG
	mBUfx+UYo5P6CrPaJbQxWrGxRmSB541RwFb7Qw1IBykwC26OLQPgSrNAxBUix3etOkiwTdNrjv1zI
	jvxojS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75G-0000000FCb6-2LYa;
	Tue, 07 Jul 2026 14:47:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75D-0000000FCa9-3jNQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ph7EonUkISD+ckd5Ulg8eFLpvpFj+V9UnIoIMQ3RmAQ=;
	b=UUca1w5xU/s6fBTBok09ONrpCNws7irYVfMqc9XJO8Zam3W7JJ+JBC5M+HzyeFXxt2E+vg
	uv4BPiezZ0xkliSIfdUHfC3ytGjUXKykZwC29j00Gx44s47yvo4E1haBw2TE265nuRZ2CV
	n8d3yHukaIUqG+rkSH2yeUKm8MQKa+M=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-ByIEEBg9MpelSWGgih3qDQ-1; Tue, 07 Jul 2026 10:47:33 -0400
X-MC-Unique: ByIEEBg9MpelSWGgih3qDQ-1
X-Mimecast-MFC-AGG-ID: ByIEEBg9MpelSWGgih3qDQ_1783435652
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a17baa4d18so4976763eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435652; x=1784040452;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ph7EonUkISD+ckd5Ulg8eFLpvpFj+V9UnIoIMQ3RmAQ=;
        b=APU9ezjeNoGej9Msum6h9PMDQ5fRLC0LJyWGyYlLe/GKrCrwlducH0pn3zx7Sf92OR
         JVC1fUTTbpBbPC1GFDkPN7lpzNcbT5mRO4uA427X+F55qh8TasVMQrIopb2viG/sHopU
         zNsL6r8XsN/NZtGImof9BkV7sLj0tOXdkFEgjePGfY5rJFbxbulGt+GykogfV++S93uz
         Gvh5P1VCuOfjXhNlj4/kc9wlcU2FbfAA4daSQ+26yk3zMYIj8kZ5QRSac+HTCEJGbx3w
         qBJik+8AnJss9UVK/0ciXQHSw8crunfoHgSED0gemMNseyKz4F1DvHx/m2JZBPEVdbak
         SVfA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ze8Y/t/Rd8mjbVNIQlyDahv8PUXz8wZ4ja3JIxcPRvYPu3VUXhWWRA5IbGbNHNqNCp2DvxGF16O+6xgxwqqwU@lists.infradead.org
X-Gm-Message-State: AOJu0YxWiSLddJ/87tIP6210iVAG0FOzlggy++2eEqD1cHEszCP3ZFL8
	KGtDyrx9+QGImFiekseVHQ1eK+g0EIvFZv6T3KsppSvw8LRgh/2btFV/Lw9QDELXxVNtpXoSEXt
	cLqZpSj3qrNDbq8nUCnhuu5fudQeGahKedfkGslxVxvFSU0frXvsZZgaLuT3LXkaOFSegM3hzBf
	LH
X-Gm-Gg: AfdE7cnh8T15Rzxxvw3sWuzAX17PjfEhYhfBCBeydmGpiaxOlljfICN2FSh1dQaQFpE
	9uT3HODIFGeLOBmtZuD54Fn8Pp/MgkaeqmB0QGt8uiCI2iojSQDNyybGd+nj2p/u65/2a7RoF0Z
	erytWEd7ypPTU2RHm8OiBMDxqwOcin2+PieuwxruFUJ9vtpsTFiIUf2W8MjP2gwS4ddC6XktIqk
	ZPFJvippDdsd/qyeqzY+3A4JOOVjpEJDoj627CqlJwA1ZDW0R38fn/wBZ+Mwgd4nOuClVbLFsdn
	Jy7lKU14sSfK/3cCt5om71s46SlZbjjpM3KiI/gWrIY4stU1/JvIw6zXzpAFVatzByPNnFy4Yt5
	MfPlyPul5
X-Received: by 2002:a05:6820:a09:b0:6a3:2b61:4cc7 with SMTP id 006d021491bc7-6a355597cdbmr3682017eaf.72.1783435651829;
        Tue, 07 Jul 2026 07:47:31 -0700 (PDT)
X-Received: by 2002:a05:6820:a09:b0:6a3:2b61:4cc7 with SMTP id 006d021491bc7-6a355597cdbmr3682007eaf.72.1783435651367;
        Tue, 07 Jul 2026 07:47:31 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb54f775sm13945468fac.10.2026.07.07.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:29 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: mediatek: mt6795: fix memory leak on module
 removal
Message-ID: <ak0RfpOX-KTT5IZt@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-3-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-3-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GJfBhTbZw-jSiAKjQ4Hjp-tVDaufULqgyyDWEXxHuhY_1783435652
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074736_004939_6F73FD17 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Jul 07, 2026 at 04:48:31PM +0900, Akari Tsuyukusa wrote:
> clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
> do not call platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL, which leads to
> calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


