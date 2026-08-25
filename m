Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD4FC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYnsOWP98idIvZ3ZCnCr9cNbdRpPzuxkEmqKUTf1CWs=; b=h63wmq/9E8/mNnnCTI7ygmL085
	M80yBdI7Czvk8+C1hFoUqLO6ITAIobxPtNJmBL8YFox6GsQp/6gTh9RgjJ5hAVrFSZR8tkOzG1ZEG
	+jAb+fbbfB2zRuum6zzVWzs3SA3WKiJ85vzYrsP7VlX+pHViWHynrKY+1M+mgwJWwDlJPRTcxgu45
	1QO4C5kNOZG37LIzMxiutYfDo1+wv55lycc0o5HzCt933pDBWaLO/AfjPgFyd4XxTeO86Q9QRUjqy
	OJVNwSFCVWNS51uxPyby0NzFhogB5Ik7NojF4AYD15Li2zt7KZSz7DDF1XPBHMENFoIk6Jh33qK9w
	aZEMe+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynMN-00000000TjS-3wdy;
	Tue, 25 Aug 2026 09:22:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynMB-00000000Td9-3ktB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:22:14 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-852c481415fso232813b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649731; x=1788254531; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gYnsOWP98idIvZ3ZCnCr9cNbdRpPzuxkEmqKUTf1CWs=;
        b=BwtEQAr5W49aDvcTSNJYh8PKorVv2JDyT4HB6/lzewq61bz515SZvLbwfD1v0w8N4H
         RABYUWEYHYfEdEW/4NMZVxiBWyuHwe5K3Z/48PlqAQ+sn/giuSoOxjnW9fUPJ45ckMco
         5zDyWiCg6lzVPtLvAlgr/PEg0HrqYFdywSkCFmyVmu2hvwmxe0EyOrSLbXQ/uk+oGwvQ
         hBxk/FFk6hkUis2zIV3D8puUCNxSXbzyQtDTjxyoyE85BTX13406/CDxxHP8kp1VnezP
         D8HvDVzeGAvGxqVy4WrTQDFYNnKYjrCp3CC8DDGzAUDOGVjceWWjzSnPTXzjuZ0AT+6l
         wP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649731; x=1788254531;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYnsOWP98idIvZ3ZCnCr9cNbdRpPzuxkEmqKUTf1CWs=;
        b=MAseUNv0hMrv90fsX/IT7FCwRcDBbvZ5hsPWk7tzuzjJKmWTwzZTJWTKjS37+UNFzZ
         EQy2bt5smiRFzgD4k0+OS+mkUhY8eHFlNrrMHuL+k2j6Q+xC+qPsDS2srXz+y5iD1CQj
         SAvp7nVG+vUvCtnQNtZCGRVy4Z1ZXVp2b75t9HN+71jXqXpLYU4DOm02888FCxp+fHev
         eSSdLXImoch5X+Rj1y8e6K8ASfaJxx8hiEjapCBTewXHcttcWY6EqMCnJfDygJdkFStN
         5NclZFG+N15Sk/KgIri7frWoEk8UtCCDPb6hlZFrD/hbipi4bNZqddrZdtZ+gYWt/RNA
         WnLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrxb5Cd1HljzCQ9HJjczd1PDK66Trh0rSwigop3bmvwtn5FgYpuoxjrXGsg7GTzs6u9SJy+wkCZdsqFl2sLANg8@lists.infradead.org
X-Gm-Message-State: AFuF++lbA6JnEQyTRJRpZreKDr/VctMWGwEw5APmQAn5fRtqG/ohLNbX
	hlSRFOlsh1KdYrhySFuoXdfn1XiPxoON13PUVI7YMK6nSdj+fEJOBwk=
X-Gm-Gg: AR+sD104ELSvlt3opD9+gc/t4kmRriPisFSrHicmwwwa3lW/1UwtCLUV+c6/bkBwhni
	wSovymm9E9kVUbmwDb8fph44HEFdYm9/1vsDXh0gruIgNr0I4k3w2WFB8Ae1huFZb6h6uzBNO0S
	j8CsBM8I/lRCd1Ct5B/VQjeSHLGuOXKImBLzSWgZkbs709xC/kluPMFiFx8U1kffmGG6hh8BKYp
	Q5p6VxdjMSH/iI++iyGJXGfTzYdU6Dtt8anfCJ3lv85CiOjvgmVdUr7Yz4CZDtdlcBiYi1UK5C4
	0tx4Cc4ZphDYaukyVzHUovyOalzuyWHRsO1kv8g7JJOENeaedsi9PVtQNYoU0W+SZaMalcw/pok
	mK6UIGOKy8MUnLQXAOVRfk/xA4HOauIn7nkK2zeQgBBesT4gHGCYiYZqQssHf9Zl8zJhhJpQSza
	8QDtp7meoa/Ua3I+qFXArSbIFOWBQl9HnBj8iuDOUClWr+JOGP3/GcpkhEBb565GBkqd1uBQtaU
	UnltA2BSg9d
X-Received: by 2002:a05:6a00:194b:b0:852:d5:d0ca with SMTP id d2e1a72fcca58-8520be70013mr37789775b3a.9.1787649730800;
        Tue, 25 Aug 2026 02:22:10 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef09251sm2921367b3a.19.2026.08.25.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:22:10 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: krzk@kernel.org
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	miquel.raynal@bootlin.com,
	nicolas.ferre@microchip.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH v2 0/2] memory: Convert drivers to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 16:21:50 +0700
Message-ID: <20260825092205.277595-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d4a0f9f0-6cea-4dac-a315-638376c12e71@kernel.org>
References: <d4a0f9f0-6cea-4dac-a315-638376c12e71@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_022213_236981_21E6C84D 
X-CRM114-Status: GOOD (  21.10  )
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

On Tue, 25 Aug 2026 11:13:22 +0200, Krzysztof Kozlowski wrote:

> Did you receive review?
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>

Yes, this was my mistake. I missed adding the review tag when preparing v2.

This is still new to me, so thank you very much for the explanation and guidance. 
I’ll make sure to keep this in mind for future working.

Regards,
Triet

