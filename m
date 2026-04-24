Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D138FB44C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4lnZ6woT95ybB008fTG6ieOTJpqz2f99IST9cPfWh4=; b=PF128gJLJlZs9N+x2Z2n/tHTGa
	OHySEu9akdJRm41IuYPBXnHLsFf8weJ0JvRbsFAcW0TqnVYrsKTC8C2U1NHlu/x7jNLRSfWH1KHFw
	uJ9univtttoYD2c2956FofWxZpEQ0w/MUzcs03qoAyfWfmeBnWaWKazhfX8VvapfiHNXNQpaFBSXw
	QlAQUOG5FWjuO45T5K7830rx2iNNgEUTIXor0kwzoSOpvQMArXm/k1VjJDL4rpY9fMHLU9haTuP5F
	c6t+oxb99o/Oh7RMwrYcuqg07itXPLOGyd5wqrgVwWxi4bK8f5/PNp5SUg7hnI4JwPWZvJuDJaDXO
	hUgx5jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBLX-0000000Cpep-06te;
	Fri, 24 Apr 2026 07:53:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBLV-0000000Cpeg-2qWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E8DC60120
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E457DC2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777017183;
	bh=K4lnZ6woT95ybB008fTG6ieOTJpqz2f99IST9cPfWh4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dq53E43Gxp6k+q3e9SCl7eLuDmBRWmYCo9bO7m28D5gQA9EciRAgUAED5thnzEIC0
	 Y48R7Zf3BuN0+QdEl23doMPCZXcQx/a7zc1zqi9dc0uNTPLPtuBrpp+UKnkjg/eRf2
	 bl3W9ZshHegdf825YQVUe8Ub7av5jrTZCSkQq62yHgkn9nTFIKwpeLYdAPAfr0uVuL
	 ZhhRevgZj1OfzmAoMXXlSZCEVYJ6dSEG8dZpGp2IRre6z6kj3lMrUkXZJlVEhsqlBM
	 6smb9iYWHgEis+1m2Bkv00S57FrNNe/iag40P1+9NniFG/k7Sopc5M95in4tIU/EO1
	 Te68DqZoc024Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a525aedb24so6400629e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87b6Fntj/WX8LZM+5vSQZ/gVK66F8XZTA/DL/lflfRJ6va/WwSrQcxmaXSRA7O7Uh5JzDYa6J1Tg1un/OdEoPY@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDI29dh8qE+qk5n2xKCICUcfQra+i2ELnv+OiUQfCV3zo/w0o
	OcfWClRkKs4uDNpybiYOB15D8+1wwljxgapuwU1ptLx0zflnz3HJKOIuFmCFlu3ACI/PBYXnDiP
	NYtJmk1pSSSOaCzHeQN1CCPNr/6jEh08=
X-Received: by 2002:a05:6512:39cd:b0:5a7:398b:d191 with SMTP id
 2adb3069b0e04-5a7398bd1cfmr577262e87.1.1777017182582; Fri, 24 Apr 2026
 00:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:52:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPA24oV-89hAhu4msQQTeoPAh09Xm_cR1PunGHW8EBtA@mail.gmail.com>
X-Gm-Features: AQROBzDMenmqczGXy6g1jiZ75__AxsDh7gV6rtaDXDspLtZnQ9GdaBkuXdCUDO8
Message-ID: <CAD++jLnPA24oV-89hAhu4msQQTeoPAh09Xm_cR1PunGHW8EBtA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: Add EIO GPIO support
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, Apr 21, 2026 at 12:44=E2=80=AFPM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> Add the EIO GPIO support.
> Add the dt description and the compatible to the driver.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

