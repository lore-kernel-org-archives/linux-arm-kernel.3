Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E797CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygSwhLMj6NXCilW+c33iw+FbMzYRnhoWI20Z3BXK3IE=; b=HhPFDcTQ0Tebxzw8ScocfPAprG
	sG7EvV3i4weRYq+XPABqLa56gnwixUcPDlIMcVFFY3oFE/S/mhJztcg9JSxFrW5/Fdqz4YfHH7Bxq
	a6GubJf2EeW9I57DTmcBDswiwwum7QLGLanPclWPvN1PoFXpWC4yeBLr3nV1QfGom23pnz31FCZzl
	IH+qA6zMlZ98K9RIppnmJ5WVHT7+pibZEQR6RziUnp/ECB8NW7+KXOPtXimsTp/KtBYV0DJflyUeI
	aJM/qcMzGiIoYVgOgKCI8DABCKEpnj+J1PGBMVsTplmZ2mOBGWdpLFbRiGTV5bK+Pt4rKiZQooaTx
	0N7A5eBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWWY-00000008Q72-1gAL;
	Wed, 24 Jun 2026 22:56:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWWX-00000008Q6w-2DeN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:56:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BD6743CA7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304B11F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782341809;
	bh=ygSwhLMj6NXCilW+c33iw+FbMzYRnhoWI20Z3BXK3IE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bvho+GqGAxHLH6uEZGyu9fddQFEwrsP0mN8QqgpKkIwYYWpu253UeybRkOcs9F84C
	 cJGiJ7nKH0vcQPW80ICOo5u71AbDVPLQAZxlgQsr4HW2YHgizvw9pFtEr0lJhvfb0t
	 fluwtxIgJxiZgkEa6MJ0WoVdWdj88s85Ivq3gtG+eGRMOXXR8EefgB/C7OIS0V7bcK
	 ciS3H3V0bfaeXziERb5x7swNfY5FnCFkiXvBZTZ3bIe42muOvA7HAuvUhtmjpj6ETD
	 xE5mRCaIogz1f//+vFfs/vRcpLAzewi8Spns2OlYlu4x8R6WU3+HnTnF+d3jJQIzOD
	 vZPbA62sM9utA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ad68b30252so1843451e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:56:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp642Tg454Vr8qoa8Ib6phHIIyAGIdooXuM9b5rERQN/S8fVThlLcWgFDJNAe6K0KhXA9O3EVs9M1hY9Tb0Bhr5@lists.infradead.org
X-Gm-Message-State: AOJu0YzE1BAA3h9FOHNAJ5WE/9KTNLX7oevcDtkfNG4qzE7MWDfpGhTa
	Vpa6NKBb6VW8ylsY8XSHxFrb0wYckdoHjPEB8hpbzKIBt6+Dqc4/cI+nieF0jG4VkGMuAC4Wv8a
	Is5aNRgMN1er6httDPtDYZCGbAuqWsIQ=
X-Received: by 2002:a05:6512:135b:b0:5aa:6ede:1a69 with SMTP id
 2adb3069b0e04-5aea1f43aa8mr15092e87.17.1782341808041; Wed, 24 Jun 2026
 15:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com> <20260623-i2c-fault-reporting-v1-7-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-7-6db1a8aabf18@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 00:56:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLnF34JGQ5HbRdSx=g_kyvqj35kDoW8mjaJYadCFVWeGLQ@mail.gmail.com>
X-Gm-Features: AVVi8CcNUuaB-Vq_8JOqV-nSNQpuwqzs4DxG1-v--Hf1jCE0OC5XQdbb55KCWJI
Message-ID: <CAD++jLnF34JGQ5HbRdSx=g_kyvqj35kDoW8mjaJYadCFVWeGLQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] i2c: nomadik: add support for I2C_XFER_V2 - detailed
 fault reporting
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 23, 2026 at 6:32=E2=80=AFPM Dmitry Guzman
<Dmitry.Guzman@mobileye.com> wrote:

> I2C_XFER_V2 is a new API that allows I2C clients to get the detailed
> report in case of transmission failure. Previously, the only information
> returned by I2C bus controller was the error code; there was no way to
> find out how many messages or bytes in a certain message have been sent
> or received until the fault condition occurred.
>
> This commit introduces support of this feature in i2c-nomadik driver.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

I don't fully understand patch 1 but if that is fine, this is fine:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

