Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AD7CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbgpVXooeJQoxtDkq+orZaKLHLZsU4tUaffVgtq1Mcc=; b=XL30656RC9Bp5KtwgrP8FDXfCw
	P/MiqRJ3PYHUDAibqH3ZbPhSTcVce3vlF5fYD79cSuiWSMlOb1HDmcjmF2TOCSzty4v28TACPJ1zX
	kTgzeA620Z5qi4dQtnH3VSJE+KfFbky9+nBavuJM/Uf732zdLm2RBVJY0zIDbT06Zc7TNmpaeU03g
	hoLzH5BMG9lv6YgHaEC9yhhzOAxkdux+dxj1ZP0IZ7hlI5FjlKmlalU+x6h6QJ0Dnt4uSHsRnQESW
	pEO9JO0XwIQBtJ+YVK2qh3t1thKd7F9dtXts4PaSC8E7GGWsm0jps7zO/5bcTw6ZJZrI06a6iMcl2
	eGSsWm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hkf-0000000Ahdk-1zEx;
	Mon, 22 Sep 2025 14:42:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hkc-0000000AhdR-2Bqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:42:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so2160841e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758552164; x=1759156964; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbgpVXooeJQoxtDkq+orZaKLHLZsU4tUaffVgtq1Mcc=;
        b=sr4oqFJslnFfz4Ppr8MpsAAgs5ZjPhLKCNZK5OW7oQcQOX6aVBgzlu8HuQxRW4KIlW
         BVcsnfuRrVZWMWHA5gI1+xV2cCsBzYYOS/wXvN6eI9IBWr7t/DNpbDli2dUyMLC6Wl+p
         BJwOjt6HGWI9f1sRHF90jon2f8S4/YQW5Lw7sEJ24x9cVjObpolRX8iNiXenZKlXh6km
         KHrraWf0xK4Pj224vb/AUCJjyUdTIsKB5ztLzW/N34xpcY8KcoLOB45NmxGgaID4y04W
         B+BgCLia9QaOG5hrbKGrIdky42RhnoJt273NGMTdRFwU4eEiEPaZoQ6ZdmkBKdd22gVn
         pxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552164; x=1759156964;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbgpVXooeJQoxtDkq+orZaKLHLZsU4tUaffVgtq1Mcc=;
        b=Xok+UrLwuHy/hWald2PY5I4wt6fsrVc25A+Mdbocs7WTYLgeLzG+Ih7mdWeFNPSxvB
         pML9RGn/5WHuY9eGwA7Jv5H0plSU/Djv8xPm5uyIEWmfhigjIJSIPtPeqrOKf9VNk290
         XxBdtfW3uI5nGmlUz3x0J+PKshdJPgsHbhrs3BEctlGb7cCa6U1Yu4qzWXkjUGIdouUU
         2219utyDCyCQHzX0QZVEPMPJbxg+PK5NMMs565nxhRdfiTmVD/dTHUMtKz4d2h6PRYly
         iJEg/yXIvX1GX54cBn+iO/YjZQCl3ALFlp+XaRHvgukudwvgYzDXGTWjR+LvWbfIZjPT
         CJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWPBLNUpyv7QNtwmmAgD+cYZA8ErPUejDQYwD2kzWCdaX3f43tX1SyZB54QNW9y1Jd5R8QgssBU1fF4OvL/26tK@lists.infradead.org
X-Gm-Message-State: AOJu0YyN16L2bAcTFRskZqSAfOIqfOgjdylFe4NhscMgkgFNrQIzc8Xm
	71j/DpZhmI4B9krMrY5HhkeV2vYjB9PJQd0Tb5xvWSvVeohpeu+FFfbi91dMscZ/DdAecznQC4j
	d2WuZOy/tyT6KRSMxJ2zCSYUw9mNWUINRGO6clmgmZxW6tXFUEsnktGg=
X-Gm-Gg: ASbGncuHCyuGFpNnLCjAg3MS/0zuP2kctDa0XPVL0/J8B4erM9u3sEqFO117h0ilbyz
	UHPBZwwC9okfc0EJyjkXF1qkCoK4kZf+supybZMjblXyiSkBQ6nyQrKlj5covs2FESDdfGbYmjM
	Ojtq4q1vIUZuDSpzHtdWtQGhVoQ9fIwyzomb+NufICCeDxfVMx19lr35EO8Dh/UnzlHd6nXHe2+
	wiJgLwGDiaxW/nfD1mSpOmipFScZBrQhxwspg==
X-Google-Smtp-Source: AGHT+IHaE9nqceFLj+JInNghJEvz7NuUskN6MHfzPYyLxUjABx4E3I4QkTLcuqh8bctTyJSvA4j3CUuzt28CZtnMZP8=
X-Received: by 2002:a05:6512:2395:b0:57a:501:54ab with SMTP id
 2adb3069b0e04-57a05015577mr5016702e87.50.1758552164438; Mon, 22 Sep 2025
 07:42:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:42:43 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:42:43 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
MIME-Version: 1.0
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com> <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
Date: Mon, 22 Sep 2025 07:42:43 -0700
X-Gm-Features: AS18NWA6jseTsU1-el3RwI7NaUjcbCUkPeK98Ko-CDeIjcGra6Ar6whhs_lBYGo
Message-ID: <CAMRc=MdMMQxFfkMPHaUg9nMWuW9F1p+PT2i-ggcU5SSFKOVGKQ@mail.gmail.com>
Subject: Re: [PATCH RFC 5/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Michael Hennerich <michael.hennerich@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_074246_566576_9BF4D283 
X-CRM114-Status: UNSURE (   8.95  )
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

On Mon, 22 Sep 2025 08:21:00 +0200, Marcus Folkesson
<marcus.folkesson@gmail.com> said:
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
>
> Stick to Hz.
>

This looks good but would you mind also changing the name of the field to
bus_freq_hz in order to leave zero change of misinterpreting it in the future?

Bartosz

