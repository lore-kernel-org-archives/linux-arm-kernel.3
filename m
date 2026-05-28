Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31AACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14hM8KxFWjFayLbwQs4aNnXIF3yZXa0JAkdcIaa33gI=; b=hG2huhLk2FwoXOrJYnxJzXRDFv
	uKs1Q36ax/lIM4FLpWV9qwGgF5HixuuSUorlGoEiqiq6nEZrxVvU97W9E8ck14NjNCVUfg4b/gctv
	J2deQWvU/W8iZQ0MHAHUfvp4Tib+pSTrbSTVN/0XD3RYqFYjBa159LGudEqVg3xSU6YJn1h8j4MlR
	W6WCVnaViize3BlHUwiN973IfejnVSGkjS99Y0kkEswSs/t/ghgUPFpW0mgeAXX8I4KJY+eKNlJzU
	nTpEt55gZHw1Fpm6TorE/c9HI+6wC3rHxNu94cejlfgjQVPaQnIK5UGSkVzasorRqQq6ayKizn8og
	JGCMJKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSah5-00000005m8q-1qrW;
	Thu, 28 May 2026 13:22:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSah4-00000005m8M-1BhH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:22:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDACD60515
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959221F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974556;
	bh=14hM8KxFWjFayLbwQs4aNnXIF3yZXa0JAkdcIaa33gI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U6iuwG9sGH8cO3r+Nn/tL25qTkBHumd+0nhoNiPF8lDexhURU5YTYHTjJJ99dU8ey
	 ipExtdl/1mO/AWQRRsVC34KmEobHLhIkuv9uLxX6xXiHFEWVRCxWml2Lq0D93rUtJO
	 P6auQRDcYxyWyw2Na4X9g9i7/25PSGVx5KYmoZ0BYTaf0LlqTQfFFFn/bEePDENdZw
	 5BihZfwEWazwhfGj+QEsZTKkpK0tKa9B5W9WP5P/Oj5jCj30Nz3Tq6PDPMGFCavwyZ
	 ZPnbxLLt0+7QuHNLuLWP6fBaiOrlL2hKfJ/qVGLBSzUAcb3Jwd7sF4gq2M+S/x7SHR
	 voTZwzw0plh6Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso8762047e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 06:22:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gjpouIrbukeaeKGBmP52gtftOFlxEL57mdHQhAKoCpeFHgPncUWZm95QbwExR7eBVsq/8jg9XDzEYX235BSTB@lists.infradead.org
X-Gm-Message-State: AOJu0YxR/wsCFJONCCW8Xhn5KY0agceuPCmNUqBEXKwxTrFHaq/kfcY3
	oQGFx7yDnDzs52Dk5gjunphBmLpaDPwLfihoNv6TOR1oBhZtSet0yFpfAWXopiQo8IY7B5f+NNb
	hkGOsGTO82azswyMhsI99WGA7rvYpE/8=
X-Received: by 2002:a05:6512:1152:b0:5a8:6f3d:6cfc with SMTP id
 2adb3069b0e04-5aa32396b09mr9091774e87.41.1779974555411; Thu, 28 May 2026
 06:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com> <a909d3c59d00756130ac16051ceedbec0ce9cec7.1779950275.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <a909d3c59d00756130ac16051ceedbec0ce9cec7.1779950275.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 15:22:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLkA1uQRCYyOYWBakwL1Poqt4xabbgBMz4WACqjCwv1hEw@mail.gmail.com>
X-Gm-Features: AVHnY4Jmb-2WCFIffZopygt2IA1H06egzEjWCuwLGLILjgUi_KzmLJfMf4CtuxY
Message-ID: <CAD++jLkA1uQRCYyOYWBakwL1Poqt4xabbgBMz4WACqjCwv1hEw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] rtc: ab8500: Simplify driver_data handling
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 28, 2026 at 8:48=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> Instead of hiding the rtc ops for the only supported device behind an
> abstraction for multi-device support, hardcode the used ops which gets ri=
d
> of the need to call platform_get_device_id and two casts.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

