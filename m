Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5180D59F6C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 05:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ucg9q3D0v6rAtcTIoC3bcbK6UjxarZfs96WicJi60fE=; b=Pq7GJb4kzXnby/Cb5Fsl69Qdhe
	xRE7QKEq763jiUrrF5xoNzck44dMzVPzUwOwBoPg5xfxLo1vOa88qhEzVWJ0HdHY3yeFVM18JM0Db
	uAQXUhmdFYqKseqH/D7PkRbSF8CvVgn84EP6y8BIauVGO0Pr3eAeZ9v9I+Wwj0CqWPt8ufMjxhs+w
	fDWxutTS92qVkfiiXNCuCyiDS22nuspC+B5hVux4UbjOLPcilp28X7TM783x5Di82Muj4pMaJlY+L
	pHUOhoPjtdfsOHNMjA6tRjGqQLieoEIFu4BLGtDAFQtnie6XMxBGVplNUCr2NwD+BvUWgX4vQIm1Z
	zFgka4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUIXD-00000001QwY-0iDP;
	Sat, 13 Dec 2025 05:51:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUIXA-00000001Qvw-3bMD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 05:51:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a08cb5e30eso1156675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 21:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765605071; x=1766209871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ucg9q3D0v6rAtcTIoC3bcbK6UjxarZfs96WicJi60fE=;
        b=bFUSGx9DDh8NzLdHKVzgz1YZMl8jMb5T8A/XAmZ2l3ga8yMnBYa0Kh5kM2bf3AgIyG
         ehSMHeFt1ZLI6ZIQHFHwK6jm1Ut8zLmvs6ObR1KhKMh+zOOLKZo6hAq/mc2HtVxb5Fkf
         xihekh7UcezxajSS07qAn0BpKDIwrCfU+0lZd/qolEPmB7eOu86mkIieP5hLXNnq03ep
         qWqRV6DwyXDV9BqDHVO4jUJxh6kGBEcqZgSBnVRNYGRzZjv4CGquEE3j4v+sVE66EvD7
         ZF60fMxCOIlqQoHFXm0LVpGMh1KX+sDRxLYKnAjMTgvJT7IbANqdUxCssv93aWiPRE+4
         w+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765605071; x=1766209871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ucg9q3D0v6rAtcTIoC3bcbK6UjxarZfs96WicJi60fE=;
        b=vcsXh/l17OUu53tQTrYK2MPMTiLw2EdPDJOoxi+9R2rRo2WMOCeq2D99auZ14zrBl+
         wj6VF93VabwIaQ4Smpwi5KiIPxM+1m78zn030e4w7cKUHb2fQ6MdH8nRLaZwVs9fV0GS
         qSnomxniUDXt2i0rYubxVTpc55X3QpdszT78sZLMt9xO1T7zKN5mEYDf1XswmHtmZKD1
         fRehU0yr0AAei3Ms6coScewNJmhMm4+kZ3xIVGmz2oaZuL5+72ICOGcejAEHF43sTs7U
         vhwjGXc00OyMCxSkAfKDHPSVLGzgFb/yE2dQu67s5VsWY/ys4XJ0ui+a1YbGeYLOp6q+
         SdZg==
X-Forwarded-Encrypted: i=1; AJvYcCUahYI8DCT5xy1Ged0LH1BevZ4XSefiuvK2A6QzKNAIs1xUTJz7CqoB3HhQbKs0UCBg6KQ8gYodI7v5Sw10jUAB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm+rxUziAcgguNUpS7ExgjY5FkOxoU3IxFaV1m/z6uqT7Uv+GY
	B+SF+bpcReAyE4wB8v6thNzvXc0RR6crW3eLf11JaSrhCoU7juEH3M4m
X-Gm-Gg: AY/fxX58+1HYNLpnX3XWZowQPod1dKT189EFuJnArBRmGt98xaLiPqEfJgnKKnoxcJs
	VO3GvRyfFlSL7yrYsDOJ8rmo2xpCuvmqKVshl94ExVHwDH4g3HgG/6rml2CQYOF1NnTEcVt2Nin
	lNkVjuFPlIhuuMU8u9zglIDEODiYMGNI5IebZQRWsVKkGsy3qPrtVQDT3cW0xm5CKayWneC4Gwn
	QhYT3p7brWpCfDvjX44ToxvyW2cKfl5qktN+vspdo/2SgEx5nW0L71e2EAKwTL6qUqA8OWGXA01
	V9XEhDbpK0+v52tP19ZGtsXtHN6ytfD45IRpkKB3Z3k2RK461nYAN3JcvxD9CUrJUsyLgJhw6gO
	YwaWKgvST9hx8d1gPtvmAq832+5tcIYantKiJII5yEAB5794mwRuSfTsZSrkEGEj4kkQMaEknBC
	2lLqv5Gb3YkFCt7jTDZ+VU5Q==
X-Google-Smtp-Source: AGHT+IEVdF3D+n6cGQxNGJqnrYCRTg/VLTUaOirWaicTa+47OE5NWo1Zj/EmbxRkTtSFJrNN1gu79A==
X-Received: by 2002:a17:903:2cd:b0:297:df7c:ed32 with SMTP id d9443c01a7336-29f237bac9dmr25852125ad.0.1765605070738;
        Fri, 12 Dec 2025 21:51:10 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea043d62sm69743215ad.82.2025.12.12.21.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 21:51:10 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: jonas@kwiboo.se
Cc: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	hverkuil@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
Date: Sat, 13 Dec 2025 13:50:52 +0800
Message-ID: <20251213055052.3046554-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5c2dec91-667f-48f6-b958-e0cf81cab569@kwiboo.se>
References: <5c2dec91-667f-48f6-b958-e0cf81cab569@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_215112_923891_1303E642 
X-CRM114-Status: UNSURE (   5.63  )
X-CRM114-Notice: Please train this message.
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

On Fri, 12 Dec 2025 17:43:35 +0100, Jonas Karlman wrote:
>Chromium should be fixed to follow spec at 4.5.3.2. Initialization [1]:

Hi Jonas,

Thank you for guiding me to the spec, I will look into chromium and try
to fix it.

Best regards,
Jianfeng

