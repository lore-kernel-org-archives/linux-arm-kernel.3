Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7687C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmhgP2D8HiKkDS6wrb+BQEzFopfYHIiJqOc6NEvXz0s=; b=iclRTIaF+cnN8cs6eMfVWfckBi
	Q/dux7nul5Vpai6F2a9TtHziIiaxA42hI0o060+r2jy5ZDVngOVuA8Gehlev2x4GjdLxhOiliqW15
	fdnvLv6eoucL/jQEMekz3FpzYM6HWj9DDgF9sCCbqdUXhy4iZ/PEYjHuHlm1VQJVNwIfjWFS4ijjj
	cOpfqoXzPIpi4+KB3MeWPYgD6OMK0MSRX15k+L04k35KJ6aXSCpsVXjGvCqCRdrPzb8kMo3G9h68d
	ZtnnDSXSZA6XU0vLRX9QMoiXsa6uYdorYP8aoGZ71Q4JxlVuIaxzg3FhnBPXDCJD8qE7dGCvSrfA+
	okxOoF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSkw-0000000CUXL-36cP;
	Sat, 27 Jun 2026 13:07:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSku-0000000CUWr-1o2Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 13:07:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b3637b90so11988275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782565650; x=1783170450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UmhgP2D8HiKkDS6wrb+BQEzFopfYHIiJqOc6NEvXz0s=;
        b=P17IW/5fuIiMk3lm9SVgmP/EpAbp7eC8PzudjXZziXk+2mzPGDmd5G7Ww1InFAZqPq
         MxdShQnYoO3WWw6vSdZrWe6vYO3PryHchiv00iwKmy0lgtHaE3tWOZaaxgCG3sJC5f3h
         2UO2oQt0QOjRqoI4hNJGYnZvGlQZ1tfh9Mbk9LcPLOX8MK+3xUtMcEGoO0UDUZMkfyWT
         t/e4PQuTQAJTFpF3vc6jTm0HrAHYqvNKups6lAecy89p0BeYbgoj8l8A2yf62mYbAUJm
         WTB0Y1HRKRrUD2W2gELuSN7IZBc3m7VTVBeTOcRR/EHbggDM2RfEe/+2syH/7ne4aZSl
         084w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565650; x=1783170450;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmhgP2D8HiKkDS6wrb+BQEzFopfYHIiJqOc6NEvXz0s=;
        b=WvB/pCiBBP5o+s4Cnv8AhkoqP9ZNB20B8bNLhwSlRFatHdzqBCsZL+cerItF0qGNQf
         GS95pR6VJ4asUpz59k764TMMfrzNYVDBCrqCHvOeDs3QroJZ+jx/N81o3kT13BArTD7Y
         foZkWbmt3QVIwQGAhxmq+8JF3ZKgJlwa7tYcUyQcn22ptkWVHunVHKCaQLhYLm1CkYvV
         7wW3RSGZRPQH9AMbDKoBfryOgOqu1fXLFc6EuOmoL9zG+ODcewe8wUYQ3ljF8YsHV0fS
         2a1FC6DdQrwbrCcaQz+Jq4UhSvyKDwjUZKjXrPn8cuRkgHqYgDifsiIw1iRNQGJyeiaz
         cohA==
X-Forwarded-Encrypted: i=1; AFNElJ94H4JyQTQAAHBQR+FpP1VH55QvNsJkzsDpjUeEURxMGr10ZM+GHBRXxJgFvVM21Ul+Umt2i6/bmqyp1WLmW/sK@lists.infradead.org
X-Gm-Message-State: AOJu0YyAuLtRR4o+sjAUsmKomfNuXNypgznizEfQuCOvsZ4XyIbZYBmR
	NKyCdhSxyIa7/isTem5PedbXJbE8WH8RVM3FstEvOnq+zweGdre16ZR4
X-Gm-Gg: AfdE7ckvxftfXU3XHIdLl5iSUbe91GtMbdYUgx3UU9rrVbFRz8nZJ1LnszdoZbjXuFV
	V5U2XSWh95csiQ/XZNewRK6zWOzZl5ysukc4NPRrGUiQxliVxuh2KEjCxdM4UHu/Yy5bWalVSKi
	1HesGb0hnSXcEMByS4Wvayen7wI7UuW7hgJmzOq5I4hc9mL0/xYoSG8wgzeId1BtTTtXaPrxbhm
	TRuixTHJkaibiloFpdTbUqa2XGdqGfRb29X+ySlG1jz3OhCfFiqdveymTJgkUd746gpVmRU5+7o
	hFUF2NzNNlExURd8KeIv5oDzh8fTHqdZX6CMw2CPL4JVTDbD9x9wN9YmvGUVynROD2pdaj5LIU1
	h+Ka7EkCbYCx1G9qsrlIOQisLVzUE05Av81PqCi5gNCHaWyEl7fPRRqdleEmLZN47yZt/X3eJUZ
	OFDx+tyJ2kja9Kfw5T1Yrw/m3UsDthzOUMroLF9tWr35WnDpqvwmTaGGAp3wFjYWA=
X-Received: by 2002:a05:600c:c4a5:b0:492:2e48:81e6 with SMTP id 5b1f17b1804b1-4926684a6b7mr156129535e9.4.1782565649964;
        Sat, 27 Jun 2026 06:07:29 -0700 (PDT)
Received: from ehlo.thunderbird.net (046125148194.public.t-mobile.at. [46.125.148.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c278ab2sm84360345e9.1.2026.06.27.06.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 06:07:29 -0700 (PDT)
Date: Sat, 27 Jun 2026 15:07:28 +0200
From: Diogo <diogompaissilva@gmail.com>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>
CC: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
User-Agent: Thunderbird for Android
In-Reply-To: <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com> <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
Message-ID: <74626A23-5EF8-499C-AF4B-64003BF9F404@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_060732_479214_8C7CD16E 
X-CRM114-Status: UNSURE (   9.74  )
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

Hey,

I saw the task to open-code the drm_simple_encoder_init in the DRM tasks, =
and thought that sending individual patches for each platform would be the =
easiest=2E
Thomas Zimmermann, is it ok if I do all drivers at once as a patch series?

BR,
Diogo

On 27 June 2026 08:55:04 CEST, "Jernej =C5=A0krabec" <jernej=2Eskrabec@gma=
il=2Ecom> wrote:
>Dne torek, 23=2E junij 2026 ob 22:34:40 Srednjeevropski poletni =C4=8Das =
je Diogo Silva napisal(a):
>> Simple KMS helper are deprecated since they only add an intermediate
>> layer between drivers and the atomic modesetting=2E
>> This patch removes the dependency on drm simple helpers from sun4i
>> DRM drivers=2E
>>=20
>> Signed-off-by: Diogo Silva <diogompaissilva@gmail=2Ecom>
>
>This doesn't look as useful change=2E Is this tree-wide attempt? If so, i=
t
>should be done in one go in one patch series, coordinated with DRM
>maintainers=2E
>
>Best regards,
>Jernej
>
>

