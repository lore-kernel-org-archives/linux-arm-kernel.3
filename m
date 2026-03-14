Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8EB107BCFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hhVDHPdFpoLhFbgRe26hlKwyzjuViZ5djdYgKLBB/Y=; b=FVPdkO8TFmJC16
	UpOdTC0/qmKNZGd0iPYuR0s1iUHadkpCabCrJRSDwnC9BG5YFr7Y1EUUOZhAy8zDjQ98TY1blaxDw
	7FL8VjNVr7YdbP+taPu/GTq1C7Gkp6TLWGkRp6cOipSeO6tychQiKanlgbUk1KbEXHn8RppaJZcXm
	rMcPIuEV8DDIWff7QDKfmrLHjWXsTAiXLTto6Z31MKZO5M2VgshPBa5EV8cn7+cJSR22lS3e95pII
	hFVAkY9niGfHgASFuvk7nUu923D8SKIL2GCXmgS0t8LwZVpiH1u8VDyWYmia832aNzA5xIb552xHd
	17W4w//aGr1XdTbf8GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JVX-00000001aiK-2HO0;
	Sat, 14 Mar 2026 07:33:59 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JVU-00000001ahw-40aV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 07:33:58 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1687f112bso576024e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 00:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773473633; x=1774078433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hhVDHPdFpoLhFbgRe26hlKwyzjuViZ5djdYgKLBB/Y=;
        b=TslbUytTxCuBIhPBr7H0rBEhlmWNZaKX9sMLUqy9gA1CsJBQHfrGHh95gWWr+6h8CA
         Qh9Uhy5JQKSyka0VqkxPLFVxMgT0nFbLcj2/Vbkfuv/MYD4g/kH9arJKJi3cMQ4SrbWZ
         bXDMl33Ftt8FlUZn1c8ztGBwke9Eh5WNF0wpvO4D7TXAqZ6/j8JYgINg/u39txDsfW91
         ifpgWc/I5K60tSn/o8SpltbUWGGXEwM0jeFsTnDLXZSZY6GfjVJZyyVE1a7vkz+TdUO9
         KlQ6ld6+zk8/s/vKjV8sxyxQEsWdC5RtlHg1OAaEjrD3Kxp3VMwoJpejF3uCSYovx1TT
         he2A==
X-Forwarded-Encrypted: i=1; AJvYcCWk/XIqKJ19RLSzajdJP6UK9QQZpv3TJmbtMvG8N7pvcachnnLzvLuLAY20sR/QHQAkyWdsbgQoExndPx9rw5uC@lists.infradead.org
X-Gm-Message-State: AOJu0YzACrdjmfoNr/hH0ZoEDBh1APb0Iqp8U9kJcbTsyjf8fgACgoix
	Vjmi5OXeprRhzsvRx6XWbqqbVSTVxGgfcEzEBsGBwB5hZtmqTdTmRLJHMAL/3txb
X-Gm-Gg: ATEYQzxKYH303NwEJ6zYU0F7wlD5q6HMpuBZk0tO+YIvMNe6x9evmX2J2UsBxzhDiBD
	vOPes133PjHRCb/PHqjIGB26rfQabGj6k5lXTqhBtlT4ql2VOePBGOsiB0Cymke6cOUne8JZO8t
	gbB0aSIYcDhOf7gyUXc6lRB7X0gCKra19VYKU8rc4gzvH2OgC5HK+dBESoHt0V8ATFsI/mW/O5T
	OX3deux/DVnYIvG2VYpE2dicuOwIJ/EPCy0bZ3XKIbL/ToiQQwfVSKwQC4zR3oSyrGiAEwkctF0
	HCvrfeZ+w4jrfQ97IgopzL6RjfpMv+et77lBcHdzf0eqMtDvvCLALco7SYs/D3VFr7jJY+fdrWI
	zIP9FlQBH2mozIEU+Wkh+qRUlqJS2c7wAgYIqjg+nb0TbZeK/Ro1mgmI+VJk4670TxT4tkCBw4d
	Es+67bLxmEtEZIm40v6jMG7K4H0wJ/foXfdKJ9VQhiGFD9Iv9QtIZWA3Y=
X-Received: by 2002:a05:6512:215a:b0:5a1:3f3f:a29b with SMTP id 2adb3069b0e04-5a162aea093mr1523586e87.6.1773473632397;
        Sat, 14 Mar 2026 00:33:52 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162aa1sm2024293e87.60.2026.03.14.00.33.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:33:52 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389f9895c81so27193601fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 00:33:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEbw+/2oUJlck/FTK6acadFXHAAaLbQxQlNmdZmuKCmlA9Vjddxi+yEq0aCqj8p+KT6CvG4UaSxzZQqJ+LNnN7@lists.infradead.org
X-Received: by 2002:a2e:8f87:0:b0:38a:737c:411e with SMTP id
 38308e7fff4ca-38a8979c42emr19370561fa.21.1773473631837; Sat, 14 Mar 2026
 00:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 14 Mar 2026 15:33:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
X-Gm-Features: AaiRm50HgMzViAFsiAKzBuJ21Dl_NGiSreFIiRIGHbKW53o8zq3pm2o3jOmNcYY
Message-ID: <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_003356_995315_A35E203C 
X-CRM114-Status: UNSURE (   9.25  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Mar 1, 2026 at 10:50=E2=80=AFPM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> From: Samuel Holland <samuel@sholland.org>
>
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operation=
s
> have the same set of possible addresses, and the address is being truncat=
ed
> from u32 to u8 here as well, so the same check is needed.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Should probably have:

Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
Serial Bus")

I will added (via b4) when applying.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

