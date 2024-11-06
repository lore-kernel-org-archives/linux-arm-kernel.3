Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6C5D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWcePYTh3GffUeILuPKuTxypuUWopkhyezSXbvbjQNY=; b=X5mTygIuMO3tLEgOnx08rJtAxM
	8jEliMri4arl/nWTdFDVQnicl5yxF98hLqx2qe47BYmu4+avGo/BU8crI5Pst+Wd9PgFj4c/LbysU
	P6qi+EILwO+rA2B8G/l+1H+OJ0e4OqWxAtJI0yB55mByIM64LWp1gTl/CVReupR0992fWWh7aXZPT
	8tLVn4YaXyhEmd198Oqbw7yGu6PWDqFnQ1CwOUZmQ1WRwv8P9xv94E6K9jlhtDbegpMHFQeO47+wa
	xeBlfG6/TiT5rs4PhsMcHcXiKJxuQcMNXuzU0xquSpgZnf3b5fpVyXM8lYrSKvj1HJkUVWaTdAzfp
	HxlSFl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ete-0000000380W-3vat;
	Wed, 06 Nov 2024 12:12:26 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dyA-00000002t1W-1loD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:13:03 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb518014b9so56252981fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 03:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730891580; x=1731496380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWcePYTh3GffUeILuPKuTxypuUWopkhyezSXbvbjQNY=;
        b=g89+AzpPnVl0dCb6h2A31zvgEjLw6st1inZeI3j5J95Wm5DQkbob0g/PqVd0ILbzdK
         wMlKJVhDfAoYzLeeKHcYTpWyJpMeH8rTXRFMWgo1HAHbsuAmHDvPNlTmWiJOF3JY1Myt
         7fQUpnRJ9+G6mFcl5H+f5+B051mns0qKVPucXEjoVIpEa6+51gre7+Gk54dw5X1K4A2k
         M6rFX4v7vCNoO+k6EF92iUFo1kwnqdyNmnefnfyvCMS6UzVoiB1yuE77zp53p0dbhFHn
         921R2DG0rjqk+V66wQ811BUTaIFAAhDSLchNmaqYqOcdWHI2IgTPnnsAMzVFig9Cs1oB
         325w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730891580; x=1731496380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWcePYTh3GffUeILuPKuTxypuUWopkhyezSXbvbjQNY=;
        b=jOL9uee63imitWiFDKVjVhCbTsnYyeVN2oRtRiUYz3uszdP6sPAybaVcZBDbZ1WoON
         BbIUnmhUNoGVBUurrzI5q9LOLGUduKtB1skufsT+8+rdTD3y6KT7ItfzRn3+1j8xPNz1
         5667Hn6GdoXJDLwGsLKS69Nbd94HANN56AAwIjahKDFeJIMf9F4Qzpd9TKEBP7jWPdfE
         RuVs6x2hlZy8Y5bq5Do4tuCmb2q1/n2ZLsf6PnHQef+lcduYiQEgexDi6Xun1Qg0mAU7
         UlbXu9VXnlexB+1DIg6g9QlfDE+VjLfdoYhToIZBM4h53yEjpcn93EjTfnNLdg0s00MO
         NrFw==
X-Forwarded-Encrypted: i=1; AJvYcCUp53PMhjNhQCIVle9k3xqzDoVlVW0tivK0BXJcLCX5ADzg/3pHRttHCp6qJ6CbD5eMahYKWfVHrsKy0tXj/9gW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1tOEq++LOzzYKnVDkvCsK9ux4tHtJv69+k4gn+oG579T9K8FR
	dz1gUNHAwYYgj7fZ0Hip/tiLMqx9cnl3nkWlJK4ezRUjKMD/0/qlHHOUy7umW9IAs8RPs2BZLAx
	HucM1BM40LyP3Qr/jhfpIQggCDv0=
X-Google-Smtp-Source: AGHT+IGBnEOZBQXZRo83WTbMByT2bEvsn+eicYIabhpgI3gMWvYJvIZucMS06EKmA+kpHuporqgCTWChPl6dWRrkimQ=
X-Received: by 2002:a2e:130a:0:b0:2fb:5cff:fcd8 with SMTP id
 38308e7fff4ca-2fcbe04f0c7mr148646941fa.34.1730891579522; Wed, 06 Nov 2024
 03:12:59 -0800 (PST)
MIME-Version: 1.0
References: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
In-Reply-To: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 6 Nov 2024 08:12:47 -0300
Message-ID: <CAOMZO5A3dtic1CZS4RJ3RoBP_rV0PpK5oin4J8531XRebkb0ag@mail.gmail.com>
Subject: Re: IMX8MQ EVK board not booting anymore with v6.12-rc
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_031302_479874_C6C1E3CE 
X-CRM114-Status: UNSURE (   9.26  )
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

On Wed, Nov 6, 2024 at 6:43=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:

> Have you been able to boot IMX8MQ evk board with a kernel version since v=
6.12-rc* ?
> I don't have any log since kernel just don't start.

It is booting here for me:

https://pastebin.com/raw/h95JZgjk

