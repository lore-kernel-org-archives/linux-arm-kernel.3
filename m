Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A524EC01CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=; b=kRSH/PAaFxhXt5aB7aQPzYGQpI
	u3qBZmU41CuE72vFPLGcU6nXg1iQD0eroJHlLVAVJJWk22zpA3ZvOHxD2PjQfsyWuR1SlBZ1SH0p0
	iCuRoCVcF1U575a/Ce7SPR5efW9VuvhXFOjojb33PKTmWsW77MUXsqHpGce6YsVSBSnJSNdYqL0V0
	NavwjNORDsVkXZJj9T3IAi0pI1AfIx4hY6UX6/WnEaGl4R4lsBUnXfes7W3Y+AJA6GfbIuYGvzT8F
	/pbX8K23CkUkpa1pJSHInVWj8+HM8pYvGzZYw1K/k1pME3Cuoy17bCHEd10HUUK38fMzSTyCPEhNK
	y8T8FdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dXe-0000000Gd7b-0ZXR;
	Mon, 23 Mar 2026 11:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dXc-0000000Gd6k-1nCA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 11:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=; b=Pnhi/XH/A0mIw0Aj2xYc4w/oZS
	dfKIxh/oT910Qj0X176QNX9T2RL97+Kp7K9b83wK3zWTtIU0PG5y1tTeysrPoyeXnMeeCsCEMK0b3
	xQQlJchTc6HisYp825aLU2apkkyH9Qlkjk9VAvAn7uiC55OrppRqYLKZAvhsIHxq+XyW4Rr7d1THq
	LsrEXmmCSTQCNKVqQ4AoaCW1sGom/Fl+qmfscoQiD+wmjfaN4mdGboERP2Py+p5UY6EmbodgOqmUv
	V4zKIpzhh0DQv8DwVDR+zU4swhBZyCinNy+Sb2sht1bNjxHknjDSQEsEOna9lFLnQifhHwivggzDE
	xRxz1JIg==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dXY-00000001OAj-27CL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:33:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1305543a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774265625; cv=none;
        d=google.com; s=arc-20240605;
        b=S3D612Qaore1yIcEAi0GDj7dnC8oL3cj3oa1h5/k0hrV1TQ5c3+p3y82wuS4Q7CudB
         UTW38+FILK858MbgnzQDVPNk25M/fh1f87WdDMm6W9PNOpVFGp7qjSvmjj4oOLYsZTTN
         xI3ZmA1jo21kWQSUSBl9rINEZ/9O1SE8EfGBtSMJWPPtoUqO7mxS6KLBy+RymaYsR9WQ
         T6Kveexc12VdQSwknxscdP+6whYWQ7IX6wAmu17ZJlCTEp3X7JF9NrVWE0ZNNTYA2NFc
         8gQfBw0l4RjPCids4tjZpjclITpOfR2BMngliX+SKjCk/wg7fpXkai+3greL3GFGZgtP
         FT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=;
        fh=WejlG5BtP3xvbht5JXdrlk78lXa5YX8Jx6PWOi2nE1I=;
        b=keeJ7rkGbkt9JCbRx9eEGgGWo4y+GThhOb1bKXmjitzCfahqzVgqI829jWf0Alhrx+
         Ed019xXc5mwpx6U27X248a9SUQPDr6nEOmyRWgXXOxPQxHM0ssgEca0hAmQ+QyJYcGnf
         nsbcik7GBil/tNQco3YoJyGG0+82oEppjCyZGYkhg46Ef64M541vKx/07C9LGeHk+o86
         S7lp6NaP9DtYADJq/eqdGn4DAUoUqzM6V4MFxvQfacZgK5GyOANoAQ5On6kb1WMq1SWx
         oLIG1TV0o1c+LFfZXVXuEq67/BjLcwYat/UmUHvlvEZZKuFFXKI1P6l3ZyP8AH43Y1jb
         jxBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774265625; x=1774870425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=;
        b=CtyBIReuO7tEjjO0ZfWDLYJR4lfga6Q+Kl/5U+p8RnrSH8JEIxXW5SDUTzd+okqh9W
         +9hWjsPhZAhqwTe0w7TGxwOnfjpZbQlbJLINdbcwOkp5qFvF8O864y3ClXWOFnC4jiHY
         TanudCUKayno6PYf05iTGcxBgmL+zSfoVTTveUdMBUs9/H8ju3oxYp1LVbukxdwNNqm+
         nrUVxpHlZW/itj29PTX78fEfvvwsftQhPUIbYNbr70cBy5CiEC0HG+jESgGgrn8a74EZ
         mZ/62Nh3nWdeqajtMlTQxkk9Q3J3YIFqERvfJ86Iw3guisCBXbKuWL7rXDgXR0mGCHnE
         dPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265625; x=1774870425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ/CJ372O++VGNkJEcYMfrMLPZfurcWAJbtOkanVpSg=;
        b=eVHRsdXNkdu9vgSlmDAwK8/WnNKrR3t5X6LD+14+ChyCEuc+Ex/cJ8iSOpL3sVcpi3
         BbBvOoCwW6wJdTiCVfmnZHQGmpqtJ/1CtKf2MBmBaUXSOGrZpgnmyxsZ7u5F2xNAt+lS
         VlMxpR2uIATPk4zgPttzofsepgxCNYk2/PWK3b1ZrJzQXOof2+hvgnvOhphUJe0jlef/
         PtyZcbO+bDk5U63qhBIHz3wDqml/G2WC7KbL6pjnvJ+N4yu7hdIGDWAFjko8LN6xcz6E
         cr9Iq6PD5sEqT9zP3/Tk7D6Myi95Ke6VvMpN+KhE561Y+RiBbwxlzpVblIYOeuF5v/7d
         bc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxYxZLH1i9WAbhdf06AEIoDydpSf/nHt9CHVFZmSyxmoe6b1A4kB3DFfMqP7VtaL5HGE6z7C4O4FqXlVAqzyDu@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTPez3hsElNhB5/Jrt7cqWq1lQYlWJnTPg7h7mNfYFjxleBMW
	TvrQ2vT7Wy2gIb8g9Ox9P8xfNjD7AyN8cEF10VXBpt9FtnHWGcMmc3vaWcl8VCZcJRjZhmPJQQ0
	D6N/AVShUeUhPzmREeKbb6kOeBEybo+8=
X-Gm-Gg: ATEYQzz34zFjW9wN5Cexr2GZZ2JHmSjh7oh/RskgVMcijtaFi8yOAOwMPq8gFRv4n3R
	0rCn3QbxfA2x/8qywMRixklEfj5wI+8OQ94jJmhMsovLroOMAclAhkEvD9TWlW/JsCOd+KCXeCa
	RnFRl7sKQWA+1eE21Z2XcyyDHnda3HUhnX9Ou14iWYkFz7+bEKanTX5xY/aOEwa1O4AqIVGLTyg
	V8w0n5D+RhyIcvNz31veggZiRO5pevIeWp+DTfXOzYkJOg0FOrGVrowyjR+B0DR5Y9iiTSz1d43
	VawxhNku
X-Received: by 2002:a05:6a21:4ec4:10b0:39b:d9f1:6ce8 with SMTP id
 adf61e73a8af0-39bd9f17360mr7025738637.59.1774265625133; Mon, 23 Mar 2026
 04:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com> <acEcJJgoaaOdBz70@hovoldconsulting.com>
In-Reply-To: <acEcJJgoaaOdBz70@hovoldconsulting.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Mar 2026 19:33:34 +0800
X-Gm-Features: AaiRm51fMHcHwpQ2lYhMbJk1jYvV2u3krU4fRyFnpLfPmI3k8CiscRrZsq0Trqk
Message-ID: <CAN4SLj0P1pAAMBbuWhbnjfwqd-5bwsNroeMzghv0P0Y_myUSqg@mail.gmail.com>
Subject: Re: [PATCH] spi: meson-spicc: Fix double-put in remove path
To: Johan Hovold <johan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_113348_694300_C3334012 
X-CRM114-Status: GOOD (  11.02  )
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

> Indeed it does:
>
> Reviewed-by: Johan Hovold <johan@kernel.org>
>
> > Fixes: 8311ee2164c5 ("spi: meson-spicc: fix memory leak in meson_spicc_remove")
>
> While only root can trigger this it should probably still go stable:
>
> Cc: stable@vger.kernel.org
>
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>
> How did you find this one? Are you using some kind of static analysis
> tool or LLM?
>
> Johan
Hi Johan,
Just code review, I have fixed a similar one before.

Best regards,
Felix

