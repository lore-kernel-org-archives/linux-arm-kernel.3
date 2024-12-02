Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423A8D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iIxLX8MdJKmfYZx84Ifi8jJEfVuHKL2dEYMIadupn0=; b=AMm8FRwDyQfDiC9y9t8MoK6SL7
	GT4F2A6G4+sAbbOPOEHPPySrckGoJ7jjD7522iVd8dTGdtlgHMgYI9FKCMt5bBgkDOh6FX32y1/c7
	cwKOULuzCyDBIju6f2GPXld77NHAQEKOhU6fRZHICyKq/eK2N0MLMUpD74fugUqYl2LGYd4ZWTXFl
	TUH7HAQQhaZAEeBYvuCduN4BVtbfhpHU1zvvu9liqR1ulXfLDCAWC8wIE+if+nCD3vDMmj4vKKq5j
	6EBCLdmWoZhcoG26lpk/kcnQTmKhaKsWP9H909OaNzzy0soGJHXcgflZoR5R4WpxQvpFFHREJNxy5
	YsXNzyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Wx-00000006uDg-2k0J;
	Mon, 02 Dec 2024 16:44:15 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Pe-00000006sPx-0QAA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:36:43 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e333af0f528so2833317276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 08:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733157400; x=1733762200; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3iIxLX8MdJKmfYZx84Ifi8jJEfVuHKL2dEYMIadupn0=;
        b=eq+YrgWG69SeUgtCk+6ZDlA18ImLqUDsoJM2dZF6LH8I9v3xQPAr+rJUThlNt6KjBR
         6AeR5hKLBu/aXvOjyBIRS9y9h5Tkp4JTrDLSS6SJqQfBjXHrJd4VcI19mff5NQ2SYSG1
         lu1IsT/AHHy3zNjqmX3SkxLhOPegi2kn2moo/L7LYpqPlb2/XOpK0nCVKg0Hx1CYMsmT
         CKG0+F6evF4EapE7SeWUYXb6+iCYOtY1dFp6PtSsjFi9sFdmEZ5oduxYZOq52cZgp3Ww
         f6+bPLaCDlk1WfPTprIX6WmiGj7P92nHqJ/Rgb07wZp+FfW80R7CaYYl8dby3TAOXuqv
         dyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733157400; x=1733762200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iIxLX8MdJKmfYZx84Ifi8jJEfVuHKL2dEYMIadupn0=;
        b=GgskTbkU4pM5ejVxdGXd9hBDDYdl5hqBHR3FVZw881hLZY8CtzR2vibbLYILAeuO4G
         T4/aXjrAvW18rgKR72tG4FouwFmBxJSkTSZ53IXvcFWxAIHfCZLD6cYvm85qzK/qZG8D
         GyFHNoRY3JVzWaxUpDRLZAl0GLfIWUOYNLtA8KZ7JkMQ1T4XJ26zUrTmsi5QwJei1l3w
         nBuwvS4HrgFEj+b+qrqiVt7qBefFmBKInY2uHQ/wn9ko4F775k5G0l/NwLPTmlO0ewZr
         P+MIQimyT6UCvRCTxuDKtfXen/fT/DRk7rAFZxQYeqXFEXCcHb4Bv1dzDZTdYMB6dL0q
         CNHg==
X-Forwarded-Encrypted: i=1; AJvYcCVGyik/S4Anbyq7g6yopNEY08frD4MiP6YuoOGYuLkUM0WYFJkkPdZcVfjjKTuOF2t9ezqoXSZCNeYsYQr0nJv+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0WxFxZVlv6RBlq3USZlOpsb+3P0CHJJyQ85AFY/OuzSbptwMd
	6IXQi1shSXJR0Uw/h8BdGPl9h8Ty+zbHSYUojuEJQVplazm7H7/kd4qRDI0JrDvVlgZJykYMA5a
	7iAK7wAXJs7LFP90XELTo5/T9F2c=
X-Gm-Gg: ASbGncuvYsKjuYoTL4GujhuhDeDQrEPbrC7iB6aQH/MTtc7zY4etZ6z/H96KfXNQqYp
	2uZi7A9juR73kMaUt/VKIz4CzuucT+sUq
X-Google-Smtp-Source: AGHT+IFQ4i9gEalC/d1K/SdeClnhnHzZj+IX6cR1THj7nWjoIltHkFk9vX6X4yTjjoj8SQHlC0zxj1n3y1n377U0g9Y=
X-Received: by 2002:a05:6902:110b:b0:e39:7a90:eed0 with SMTP id
 3f1490d57ef6-e397a90f42emr15007609276.44.1733157400328; Mon, 02 Dec 2024
 08:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com> <Z03f08Os/csGbMap@vaman>
In-Reply-To: <Z03f08Os/csGbMap@vaman>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 2 Dec 2024 17:36:28 +0100
Message-ID: <CAMT+MTTFkVcZHoC77BAVc+R_rvDfhoSQZujic9SCCqb8OkgSew@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: apple-admac: Avoid accessing registers in probe
To: Vinod Koul <vkoul@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083642_133320_E98081DF 
X-CRM114-Status: UNSURE (   9.77  )
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

On Mon, 2 Dec 2024 at 17:27, Vinod Koul <vkoul@kernel.org> wrote:
> So looking at the driver, there is code to turn power, so what ensures
> that power is up while we are in alloc callback

There are two devices that use admacs, mca, and aop, with aop
only having a downstream driver for now. Aop's admac is controlled
by aop firmware, which does the power switching. Naturally, that firmware
has it's own idea of how power is supposed to be managed, so we can't
sequence it in such a way that the relevant admac has power when we
are running probe().

