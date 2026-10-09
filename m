Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E255CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=; b=sxf56CKFw/bm7zezLQBisRDaGu
	2dzHoZQ3YlH7p4lduGMWPWaAPMNfg5bkiRibwSJsvnt/4LfKj9hF0sfl7HbkSAoQtkyTXGVwE4V+O
	h4pTL37/PH/DOEXZsmSdekB0svfNmUmG8ARnVJYLtK343YegLfv8aFBn4CrE/DI/fF28nId3bL04u
	q92hlSf9iEdl1UMWeXEhRNIIMVqgjymtW5Xs3hwq21RQZN8DBqeHxmVc7okDyGKxE+Trtu6NWXj8r
	JHVVdvE2JdvHHM0zoM04K58eZd4/JPOVz7AKf6lh3vVlJTRXya2ljQoiUINqpCtgw+1vYq7zgsG7t
	5Og9p8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4dc-00000005gMf-061a;
	Fri, 09 Oct 2026 07:03:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4dZ-00000005gLX-1tyH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:03:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8874539bccbso3110323b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529403; cv=none;
        d=google.com; s=arc-20260327;
        b=BtZHbY4FoZxJquHfF7bGy1lyMaPzpDSZRKvu1eZ+gMFKB/Jax0QkhWGIAi+oJmLXMR
         YJ67wsduWINC/ciJZaRfEJFf6nRSGbNzPCoYmJDJh9xojrtuMqM5ThOReD8lKjaNqF6o
         dV4H2Qh0zQic3y6M4o7oG6Wx1SINCosGX76MhXGEc1oWBk2XiwaU6Qi8OKOyrAImPmvu
         OovibDOaJ0avqg5UTnFgoUX2hioMmd80flcpT5k1TkZ+DukAIsrTgT9vmuvBfG6t2KNc
         /oIOBmHmU2x8H0MouPv93gMxaI+7NgBcUTIvIFNvQ97Z/mv16F3d6AUv9qpI2ABKjZYF
         V72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        fh=Alb9MYDfdFfYJy3w/pu0lph5Nd+BoV9S6SCEAs7sCis=;
        b=hQHAFV2EfJPPJo3UfWvXZ26vFS12GYTX7mS8P4xMxndGajDESESx4fCCYfGXYTNziN
         Dd0S4apbIHYMBwPF6acgfTjEDGTv0E0F9OLxUtGYD1NjyQ0j14WJgu1iA+ZIOH0O5IqA
         jMexSNe0uRaHa5TY7lED96k48CKuue49owVrFQCQrpZLAmkNtIt3Jhvzse5admTAkXqH
         eXuILed+iNOaJ+oljfeDNEXK2lL2AQrIfFNcN7S+JYumd5MLEf1RkA4o4sopzcnZuR6Z
         +IOCkovhHnzgZsEF8sx4I8PYyFcG8AqLRAOyVxW4voLWbdC2V3kQwjc2SqNU6KR8++Qm
         MUWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529403; x=1792134203; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=Tgk6rdSrvpPhHrBW03koFMAvROmi4a7wAqNKu0cKlwVWpd7OCv9nW/qOxCGA4H0dvu
         7YlxIt2zNVXhxCUt5ROOfMN+1nxfwi12/i7pSBre/vw7V8jNSDgQgIV2qyQhdjU+Ajvg
         xuXCNYOyPQlOozz2KHHpqoZ/P4Lj9FYbAizo6yYUbrHU+xOiu9uCHkpyS+cUUEY5EIjT
         kMQI4iS9Mwe69pGGCQsinKVBOLbuL8r6h8u0yX8bfznuqOZdhboMEIi2okUAcxnxGjiL
         gfG10DsNhq9fLL1IUNE50/1tz9miwzyMupxqcyfdPokSrmha3u5Va4100C5TwA45a9K6
         Jddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529403; x=1792134203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=oeVAjS7l81gZfw/MAFjELRAbJjFTLL6Y+Lykm68QA+7hpIA7MMcWsGdhlvhqJ7nss1
         ccy+BhjcytXrMijWxtG91wvxSfGbglBXJx3xbSgl1jgJ57eU+bZ7M3tq+QQMeVnS5TbU
         o8k28yAjNcOycOIE72IBhHGFoBFeEZ3IkQXeD/dRv8C6MssQIqibBfDLWT/xV72Ufxd6
         Opx4kt3AszrlD46v/34Yo89U110cT3qPMaBP/gwCBrIOr8//irM7yb41oESQO7U2iFim
         nO9XfGMvMfEX7oSBTuKIk0JnvvULmRTlFwXAyZqRgJJLWavAWlXFQznphhl/rJVH3zae
         f/zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhYasPcLP72PSgyAhqLHaMEhTS5rfXmnBZJ6BwV7KJHlUYuQ3rBXGBVBxAUWd3cUb6tsFyUVPRVjDpCx+cbnwi@lists.infradead.org
X-Gm-Message-State: AFq9FYKto8EAA9mkFfNI29S7KnpMK+2CxqdsZ5PZkHU0vsqU7dtHoNtw
	7ZNyGR2v4k10FuElSYMhB/VINg6t7SXvlJCpX9EIIfTY4YdzncZjpoCLWQVWn2F6Ec76Il2a30D
	LGqdxAxQs9490qWFyboSz/Y06MozEcKg=
X-Gm-Gg: AYBFou3gHpRHtfEmsSPyJvV88hAd4fxmpoExjC6JoiksTPNvsCn5AuWviTS77olt+0a
	7ajscIUug2B27YfMv7lS91F0BSfPoGiOGXmnKe7bmVFjM9/vgDtwxBO0ATsZNnLTO8LFKgt8U4u
	sM3n9seOdCH1ZiZi8DfdHt9wYqOzOBDWoq0x1Ryqn6cVbg0ekY4NpBlrt7RmzgJjpdvDXUYY6Df
	KUjHw7PwiwwO5PZvg4HAtHeQ94qIx992LncsAop0eDGrCXO5w/2Zq5xbIf2MDbsgYKzwq+522ZK
	QhOg833KYzJM1wCgYfe/5lJMvBLKC0g8MRcfu0bIdQdCMeRa1HgCYweA5+CqqOaWJptF3Jt8x7x
	Ut1JBOXrWHcrF75xRS75lQ5nRef5FkOGmb5MrMFcZCffhrhrhHYTWZgPrE/njXws1O5rMQQyToI
	skbA==
X-Received: by 2002:a05:6a00:aa04:b0:885:fcc1:d55c with SMTP id
 d2e1a72fcca58-897c7ec5a0amr846999b3a.43.1791529403528; Fri, 09 Oct 2026
 00:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-2-phucduc.bui@gmail.com>
 <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
In-Reply-To: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:03:11 +0700
X-Gm-Features: AclHuK9K_mTmShroHQ2NxfLYvmjGvCBUVZdlzaaqulcpuz6FtNuEKnD6JjCP8qA
Message-ID: <CAABR9nG6RyjjmGhYKgMJrjbO+E5+UxBq5JBfeoG1qj1VxOZn1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_000325_488832_FEC9445B 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Ajay,

Thank you for your review.

>
> Should mt8195_afe_enable_main_clock() also check these return values,
> and unwind APLL1 if enabling the APLL2 tuner fails?
>

Yes, I think it should.

However, since I don't have MT8195 hardware to test with, I'd like
to wait for feedback from the MediaTek side before sending the next
version of this patch series.

Best regards,
Phuc

