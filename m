Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950C2EE57C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rfnf2qhGGwgV00DUgX+jw89Q5Q97DzPe9bYdiAb1ps=; b=05i4l7R2X5uyALkA4HheFQivc0
	jw6nHpowzP8m2nwfuCs4dE2N0pja7Q4YTt9stbYvQzAbiE23xp5pRqunfzDcybGSXg5ZIqMnSAHSw
	Du9HVZBWzuHqJG70MRAGrKi12BWZnuy0LcUEHQvLlM5lVrH8mGGYNQNU/GLIvBbQBgmsCOIGUVjV5
	Qf4jqWW9spkS2DJ2RBqW5PgiA3NhQJECRWm6/shxDUO3iKmwSkdIABGSSaUHOxyKBVor2ct4Z/QF7
	RPj8PxENrU6RXlg2vodsCKpgBNXVOuka4olsm5zBsE3BwFqeDCSyJs3ITogj4dqrd0bM27Ko43LNs
	KVQ1svig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3so-00000006MRk-0tHd;
	Wed, 31 Dec 2025 21:37:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3sm-00000006MRe-3K50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EC5660055
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D45C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217047;
	bh=3Rfnf2qhGGwgV00DUgX+jw89Q5Q97DzPe9bYdiAb1ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S/myJmuvkQhoJ8EppRf3vex1oHqN6qlqOFLVY9fq6nDRgajD26aH7kRPXmgv928XN
	 DF+TI78MG0UkXzZMdQuw/GlDgWSTvvxshjuoWDv9HPqT/ygN9fSm4tM6/4gtAfbWRo
	 QzgG3od32ACcdrA4U/CqlZorWWrLyM+hVKKc9JprOQAISIoIWyWLrac6n3tEKlvdbz
	 pn7SDd/cIIVAUBaCaNAtbKkHkMk4EWxb3ubqdSGLJYW7BHJG77tQL9PBBKd5n9kxil
	 vefx2gkquaNmsHtp/u9YwXN07/1/wFU4m8CwszxqBuN+8dVBrt7VZWgJ48dhsHZj/v
	 RFgKGQWveyeJQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fc0f33998so71284297b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 13:37:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwi7keo+oZDJ1x1b/k03loCqq7Qorubyt3Hk/hznIzckBtnQkB4883z536AUr+binvBqSg72qmDhja+tVTtgDo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy22sM/Pm7z5dHkBi9i5xahD4pFm44gJ8W/IJpRn9Dh4JET7RZ1
	JuXbft6d3AkDn0rckHrSv4pCGUTpH9XstC1xiC6EOOnauuC9X4kPHbp7iEFEG4vK31r6rF38P8x
	bNTHYjhD7k+hdcKnugEg312OCFpoc4Nc=
X-Google-Smtp-Source: AGHT+IHHeH8zJG7rfiI2GFfedkzIC0YK/SbYafxSnkK2MFdRLnSCHEYor5QZDiE7b0zGilhY27fuPDjyGexn5uPgcoQ=
X-Received: by 2002:a05:690c:3803:b0:78f:984b:4bb5 with SMTP id
 00721157ae682-78fb40c5f09mr590051547b3.64.1767217046540; Wed, 31 Dec 2025
 13:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:37:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
X-Gm-Features: AQt7F2oNijhkSY2l2xLUahhHBTqPWX5BBKamnMGV8HdX2c29O6a9KTnJl-DXNNE
Message-ID: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
Subject: Re: [PATCH RFC 02/16] pinctrl: aspeed: g5: Constrain LPC binding
 revision workaround to AST2500
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
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

On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> Discovering a phandle to an AST2400 or AST2600 LPC node indicates an
> error for the purpose of the AST2500 pinctrl driver.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Also pretty obviously correct, can't I just apply this one?

Yours,
Linus Walleij

