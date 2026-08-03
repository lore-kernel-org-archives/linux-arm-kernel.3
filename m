Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A030AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=; b=t+RqKNcKhEpgJ3jJDMLtZayeGG
	YCP+CA5FtuzEPOSuugShrGQxzMV78/K04vaQLXzCZpKQ8p740si3gISJEE44qRvlajUf4lc+l+/Mi
	C5HtCSkuhoq9NU27jK6K4KtYXM5pB/LPR+LJy9m85IHIKM53MO2ASVrCkauRp8lF42YKaiWgBc70Z
	av4aPf2tgTJLtMrOeJa2j3rkjoMTosclneGf1lcKMTFvGNKkrSt4sPGbSo3CBSFxHL+aNjFQjs5DT
	lKuIewk6GnBU9kt8BKa7J6d7YBpigRa1gc5q7XiHmZptHlbFkCUJ+16LnGW32EVcUET4yCSy58H87
	jLgq6IRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqJ9-0000000Gu1M-1oxW;
	Mon, 03 Aug 2026 10:54:11 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqJ6-0000000Gu0a-0GkE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:54:09 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4ab70b882c5so1859030b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785754446; cv=none;
        d=google.com; s=arc-20260327;
        b=qRh45rQw45M57lNPQFslD6VYkWL9ThwUMcv57QF9dcVoIOXyghqUytN25Cg5FNRzi2
         qLxUkH91PUYG6kmjC3HsnHc1/KAMvp++2jkiRTrQwE9KfYCzDLnX8yJlopx2Rtcs91Ov
         e9TPnNA/diyiWC3km+MQDYxHnuMQJwGZ2GzqbuScCVcEI9rT/gGmIKJSvWWeShERoF8P
         YnkhzDtHo8+RtJgiymmbt7pnKh1/7ntBMiRPZ3TEmGNtwm8BKxO4P9xM2e2+IFkf3JK/
         OLNZRN5r5pcakUcUTPIcBP8duEmvloXza7yamOmyLXbqX9RpSs3Hl27mp25eczQX/ZTz
         2x1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=;
        fh=tC2uyC0Ia9+P9+ZqHk8xlocGuaNb5u9mvOgTML/YC4w=;
        b=B2tdqVMaDvUb0YOowAz0B3gZONMwBLjgHN5V19R7gckTiuVqrnFCmLEFrfm8uMeXSN
         4HQdMUXpcTzStQM0B3+ExnpRHBmIiW2NXVdfWu7z0eDotm7HjNrska1WAhwclFTBCFNo
         bc2Uggf6mgYVB8Og5R6zq0JGjc+q+xMi6hzEgI+lndw7ePZhZlrJuMEFeV+KdpJNL/cN
         Shj3bQvl7tE2KKUOD+Hp+VI+KJ8b8B0TIO9WnJdEDHe6M94T/enluOBUbH9b2LCXX3Xq
         eS4i820T8TgvsqCKvR6cO1INCFo31BxzeB0kJENrGBjWHdoW1odQjK88cwICBSQzn9ZM
         rweg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785754446; x=1786359246; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=;
        b=tpcb6xibipzcwzzt2wiryUuzS1kEPtGDJJXT0XhJjKy61l5UaTUGkbOM+39Gm7XY2+
         N+BNP/ZHRnkqLExR9c/IIV9/d20MwuQdWAuq5MRe8qrpCEG7IpxxhHyw7EpJnVlNIN/m
         sPCSZzaZQlbGaR3fQLSrX13lovStUdUvtInfg9p4R4Ex4lygtW2Jw/BF08s267oKbr+e
         UfW9Dkp7X9yiYFpTQb4YofAKYnt0SLQA6o+MFHO0Rvs1p6pqluPBxJI1IJOufx6q6Ey7
         E1v0xYso8vbrIKeRbrxV+abmEfZFCMmi5DlLly+ObiMZmgF5yqtpUZsJH8RsecIB0m2f
         dtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754446; x=1786359246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=;
        b=pkXSBklBZkEnzG+4jjVrxTxu7qxyCIZzDwaTN72iDb/R6aCyxT0p0Tn676sfMjXLRv
         YTqHA7luBNMublKSgvsb9OWIPpdwYsgaL9AcqPyWdlZtSRHf5si58jbbaD5kkh7vZc9i
         Ar+ZIVCIS+IOsdZ8QViop25HlLt8JbuUj2I4TnRE8vCNfgzu9QwUGIQc/p58GnCAL+JE
         p14T6L71ZvRXnHA76KGc7bQeI3u8hku5JTiQPKorYzZmzkR44lyloxlT8KBPRHPyuOVX
         cs6j3tsOAMhjBbw7pR8bfvSsiZfnMwa59G8q6upLOlq3z7SWE/FiO0zV9Vf3mkC8KINH
         Ct/w==
X-Forwarded-Encrypted: i=1; AHgh+RoiKXZI/58K3L57qEBYoJd6cJ8WDw3ZaDPal9Y8BgdbjJ6Or3vgUxYlvk3qrw1jvHQq9FHDRCNFWrWuVwwIrVts@lists.infradead.org
X-Gm-Message-State: AOJu0YxO4tpwzUSlaOOyLXkwbely7qWb1Mf62lAc+jkKoA+mtCrzLzmW
	uypW3OsQALcUehreO6VmJybuS7lzVguk3iY2rZkIVj8easGZXbdSUsKRfSep4xZlb1Ej9ocCA51
	n4bThGLRiC95HmpQaQ0eHmuQJ9IhOKEGBtsbDeHxjHA==
X-Gm-Gg: AR+sD10O5YICk7jIPbBNavBe2divJtZpVWw4bQ4xcHiCWJPKyLOpLGpGYPlS0jjt/Ma
	4pC2XtklUL1N8MLL2n0PXuKhj9sMarvkTDIm/y9X88KOqqnBbPTynDMQzxONe3XaYI/Z2GaH1No
	1D6W1imKdrxok7ZrT5l/oY8Zmmsd+KdlYXms0txQfIfFGzZuz1rWLRJwY4AjyHdQ7mpC5NHpuFM
	toDwnyeVLlunCIl9EdwJTZPKKrYCWgFcznLBnTSjz6vBlzNh/kPOJROAtuMsTEOlbeHUReg4YUn
	p+aZ9fB4sNEsN8i4nQyl052z1+2NQLu5qt1X5Lkl6pjutABa/tUhjfYArmmPXUsXDgFw/oXm/e6
	S
X-Received: by 2002:a05:6808:159c:b0:489:a387:1e29 with SMTP id
 5614622812f47-4af5e3016cemr15807503b6e.20.1785754446430; Mon, 03 Aug 2026
 03:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <20260730-small-solid-spoonbill-8a8bbd@quoll> <6d9b28ec-0905-4cb0-9a62-980c7fa69572@reactivated.net>
 <e4dece11-ef3d-42e1-b179-cb710c501622@kernel.org>
In-Reply-To: <e4dece11-ef3d-42e1-b179-cb710c501622@kernel.org>
From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Date: Mon, 3 Aug 2026 11:53:54 +0100
X-Gm-Features: AUfX_mytTkO-AkNzCG_mHrIojcRJSCw-VpYldbwKB1TRQ_LSnTcKOsfcIgvxdHU
Message-ID: <CAPhyPA5K6nBAoSiUOyx3EF7mu7AHP6pEo5u72Jr+r5WiLo7cNg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_035408_181546_44F17188 
X-CRM114-Status: GOOD (  22.01  )
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

Hello,

On Sat, 1 Aug 2026 at 10:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 31/07/2026 22:34, Daniel Drake wrote:
> > On 30/07/2026 08:00, Krzysztof Kozlowski wrote:
> >> On Mon, Jul 27, 2026 at 09:43:59PM +0100, Daniel Drake wrote:
> >>> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
> >>> +                               struct platform_device *pdev)
> >>> +{
> >>> +   struct device *dev = &pdev->dev;
> >>> +   struct platform_device *cache_pdev;
> >>> +   struct device_node *cache_np;
> >>> +
> >>> +   cache_np = of_parse_phandle(dev->of_node, "brcm,iommu-cache", 0);
> >>> +
> >>> +   /* Fall back on 'cache' property used in old/downstream firmware */
> >>> +   if (!cache_np)
> >>> +           cache_np = of_parse_phandle(dev->of_node, "cache", 0);
> >>
> >> NAK.
> >>
> >> You cannot have undocumented ABI. I asked you to drop this at v1.
> > Is there any approach I should consider here in order to support
> > existing shipped firmware versions that use the 'cache' property, or
> > should I simply break compatibility?
>
> Kernel is being shipped with DTB for Rpi, because firmware is not
> embedded into some lower fixed storage, so there is no problem of
> compatibility with some out of tree, unsupported DTB.
>
> And no, you cannot use argument of undocumented, unreviewed ABI in
> downstream forks as reason to add such ABI. This defeats the very
> purpose of having upstream.

The IOMMU cache is a separate block, shared between multiple IOMMU
instances. This ought to be described in DT, one way or another.

Of course, there's no need for back-compatibility with any downstream
DTS, which can easily be updated.

Regards,

 Nick

