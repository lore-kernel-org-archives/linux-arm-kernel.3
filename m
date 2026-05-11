Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12AFCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCCfdV5epOfYo3BsJom2sySg0/nC1lFfsXrTGiNtRwc=; b=qCEVUAVxXpevnFFlJHGIntc654
	DXb2pMf5/KUXM4OnwguwLNRZBEVhn4QgyZFAHUGZL7PKg8o4gHGBS+1K6AnhT4ffpdxWI9mMcCqQ8
	A3t1HHqhv+JxExBWRgYf96Du5ARlH3NDrXN+1iE7FAigsIFbrHimAEs6wFRAGJu7De+LekTXwrcC8
	pm8+jaJosGMiuPvcL7PzYsImPwImdxjsqFx6vARum9/nZBLpMx9w9d4D4MR8lZue2yFFna7CQRrkf
	By+/sRDk0hCw+XjqxJ5wX9tKLJNfynQ4H1CsZTLmuf8ZhD1Z57LBGz6xCyRaZ5kNNWp4rrRYYWsP1
	yj0qiKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTrK-0000000EHAv-3hUY;
	Mon, 11 May 2026 16:51:58 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTrH-0000000EH9h-15Hm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:51:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-367d88b9940so1518666a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778518314; x=1779123114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCCfdV5epOfYo3BsJom2sySg0/nC1lFfsXrTGiNtRwc=;
        b=uQKwN8nWeLU/zIlpWu6mkMK0aghmPl9Cs9Cka4JqunyVj/8LWInhl8WsWwZ+85ToY0
         TiTjvU3ymAO5YImt2z/Ol5Os+wZXSSFlYecc0F8HoSb+U33YSaTwHOdtiBtF+T0iSVbt
         qwt2MxiiafocTFJK7LjfIqQWrtuBGStfxIfFwzRiLruwz/+8TldSDKvcq7MNviqeVggJ
         91S29JWP7u5WAtPYwfI95NGkwLfYlxz+2zS1/FC4zoy6b9wwSsxSGH/YfqnSssdukQGz
         mH4nh+FZnKad/zpw9SGnn02k2Xqdn18q3n0MQ2ZCtI6YCAGqOHXI5N2XBOOTN0CRnjjc
         PEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518314; x=1779123114;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCCfdV5epOfYo3BsJom2sySg0/nC1lFfsXrTGiNtRwc=;
        b=JT/J6Hj4t1NGBblaRahBSH2sYrPWrlV6Mw3rfzjU3O1sFlcog/dTR936VmmqauxZqZ
         E5oZJUJ3nvEksOOfO3oES3ns2rqZmWH+XoMjQ3rkOLhh2UV6oV7G6dyRnxGS7LE597xM
         cPjHl0fLWk0s6VLoDTdN1owFuCX9Q0JwL5lCd+Tx2yLvzQbWIdSYC2oYrHV5+deDTS+k
         DhS2DPfDPelHwgrMz4diDgc7frs1a0NY68cCC2UbW+dEAMxLFgqLUKxG0RL7cQLV4Az8
         65gLwn7n8xUOieNb+XpX1b6a6o3O8yfaKGPWg9V1WvfYTqoRX5brCnPdeXhOHsdKfbUB
         qPTw==
X-Forwarded-Encrypted: i=1; AFNElJ+1tRnYs6+QLU1K9G0iHXL+oX2xudd4u781SRLumsmR+IWAbRPozK8Fwr83iOR/73rV7QInd3ReccbX3T2U+1rY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0g+F/6tQPSOIV8leqv2pvbBgFg/CiKtRzjCOs2VfeiZmxt1LC
	ma8/YBFUJGoTu2H2NUpAX2YGrF36sE5tdqwM68G7ynoQBtlE7H4tXIHlfe3cM7ckCMw=
X-Gm-Gg: Acq92OFVlwgSNGY+DcXzQ6qsTMgnAF2dihZ+sON2Y06ZxfXwAQUqWur4kNgBai4YwxP
	T6ufMFJXBhdFC7EpxMYI9sp/Z466FZzxLFtUUoWjtEThw2bLAt8nl/NHy0OUhImabotiX7ZgCM1
	4/ZZQC5CW8EGLBgpq66BTt+k8SdSdz4aHBfPJF3e3UVRtMxLVxEJaG4PhZo/FLjqnt20hwRWdlV
	vnSCnd8oxBLddg1VU7Z5JTUXByE0bjFCYZwQ9BKBqRWtKn0KAXy8KMIIcxOAavEFJznB/dyeSE9
	EJFRpNsYOmZ948n+4omv9yIE/xJLOyX/GRV7/iiWJOCkA+8ovmneEdcJr7mEFHX3XRf8y142+F1
	OxrrlDTtWDprIr8ieQn503XYHMdBXx+Cu6gruNBsn7uGS/mFbHpbtNYxnDMYARyGs/Efg0uxf5I
	GHwTJnvcqnwZmtetSFU2Ot1zO1MDma4Q==
X-Received: by 2002:a17:902:f70b:b0:2ba:5e44:ce8f with SMTP id d9443c01a7336-2baf0bd5421mr154830895ad.0.1778518314037;
        Mon, 11 May 2026 09:51:54 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2baf1d40a65sm109201975ad.20.2026.05.11.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:51:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20260330213528.18187-1-rosenp@gmail.com>
References: <20260330213528.18187-1-rosenp@gmail.com>
Subject: Re: [PATCHv3] ARM: omap2: simplify allocation for omap_device
Message-Id: <177851831304.45285.1551367657338168278.b4-ty@b4>
Date: Mon, 11 May 2026 09:51:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_095155_299507_BFCCC510 
X-CRM114-Status: UNSURE (   9.35  )
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


On Mon, 30 Mar 2026 14:35:28 -0700, Rosen Penev wrote:
> Use a flexible array member (FAM) to combine hwmods array allocation
> with the omap_device structure. This reduces the number of allocations
> from two separate calls (one for the device, one for the array) to a
> single allocation, improving efficiency and reducing memory fragmentation.
> 
> The FAM approach also enables bounds checking through __counted_by(),
> which provides runtime verification that array accesses stay within
> the allocated size. This improves security and helps catch bugs during
> development.
> 
> [...]

Applied, thanks!

[1/1] ARM: omap2: simplify allocation for omap_device
      commit: 2a7a9e20b9e8b5dc4fdef777e67d390dcb3a8ea4

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


