Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DDFEF06E8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpI63RvsTKr7+Le0GRQxhDSvJP5EizNlxeBlFBd+wLA=; b=Rta5OQJsVRKGPdULqGpYL0iqCN
	I7VKrxBujNwNnpPh/SOIz8MCB7YxJW5vGIyZeL4FJRCe9hqTtGQbfgFtVwYh6u7pwPhFpv5pfb4KT
	YevBx4A7IWKXe88vWe9HhpEA+AamtXBxPSjaqESQxWpzvEzOl1OSLd+78jBI7hK58DvIZrVrNbCpA
	Af4QSJL0TAe7H1s/daLnWvelwhutzReq8s1VB7JdBbPvcGeh5kNPNXvMvlc0NqOWJTnaHgkdq/ljN
	SVHKMEb8Xe5FjoUKgi3NeKVmQdfa02CPB1ZSkxZPCfXUD8aLinaeFvFcCB0u6PEyxsL0IetpIXGA6
	IHawGuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpDMX-0000000EWkF-1ZfN;
	Sun, 08 Feb 2026 22:34:41 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpDMU-0000000EWj2-069N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 22:34:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-382fb275271so24263201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Feb 2026 14:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770590076; cv=none;
        d=google.com; s=arc-20240605;
        b=in+g6YcBmldJSavA+m3XGnlEZBihQfYVmv/JnTFhXAgmJDi9II2WVhUdTSBJCPyysN
         kJk3at4bSVtbWDGuAIQbGhGSCX+dmlzZjJB5JMCJN4JWrsrHTVfZKrGMeNJXpuN7aMAE
         wbDoGLQzb3fuXftCNkOpic0xr27udlosXtDkqUkgoNxqzFwc1T5J0NCqMJiNi7ggDY3U
         oILbW9wPxOSmOibVSwYhT7r4mFo8TKN3M2U/spb63QgZB4N6FCUMAzBDuVVOG4w/ojZ+
         Qw7EO/q+FaeUtNz6AXI0ocRanZfaJ2vYgwLZoIqPc+ECUOlytXJYMjzT0m/dVuC2Dzav
         N5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HpI63RvsTKr7+Le0GRQxhDSvJP5EizNlxeBlFBd+wLA=;
        fh=3aZxibA/bhr7CegG9gkcU+YXPcyk4mYfE3sxGm9c+G0=;
        b=icC2MdzOuhzDhtnmATvhUMEdOku2MeAgHHoHAcCOPkuFnt8hRC3J3LuZweNeutFRON
         VZeWl7ZU0Ig3ClmjdRGtPRNKK81lT5glSdTAuwFkDRSLVWyouhQjyOFf0uJxynS6ZpDj
         aiP4VPzMW6KMPkYJ5yUesiHOqkF7hAOwoH0VUn+xykacTMCszvFWnj6ZhR47oE8J/AHQ
         65nOQFo180JnKHyzcyypSu7moJvGF/7FQjV9BoiqaDiuA2pxG1fQZ98Bzv32jtjk1RPM
         s2Sz0RfwWNI9qPfpxChRHEzookJaYZyAatFs28Aakw49y5qRPJb0jHXOO+n9z5i0DSqf
         jShg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770590076; x=1771194876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpI63RvsTKr7+Le0GRQxhDSvJP5EizNlxeBlFBd+wLA=;
        b=bD57hTBxyo40aBBcCiUafn5gjkEIU6kvTQnr/JmtKpo+rCG0KEi61AcJqaYuSt2gP7
         HfoHh5fb6yp6NzYAF/DpVwfFtGdB0mqesrYiD14c0qQA+/NDO44CxTZHnKC+43OFMpgQ
         tfSbLBYi3tDFrrSCaC4QE9rPxnncPGp6aacDENfho64lllxl41uiAuFKjLl8eXLWDt9K
         yL4PAxCiiQeRoJlM7zFyehzNl8nCXr/2qDolI8EexS2L1wAvp+Q45ktjYAzGuQRHoKZz
         prRyorrIX0kUPR5mXAulzpH6JHJ3EZ8Upv4N5CuCB5QvOVnM0aRTB2FZ4reHlkTc+zZB
         BlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770590076; x=1771194876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpI63RvsTKr7+Le0GRQxhDSvJP5EizNlxeBlFBd+wLA=;
        b=pGznsL8aNi/5azPIdczZEKc1lm6T9CqjIdOuTp2I7SSuWDtqosGnowpYKQYo0jPqte
         ZeYqrjNp2sWkKmAHah/vujoC1MK6vD5/FwRcCPDA9j/b9SVhH+3ekUJVj1mx5Xc+bkpc
         fY02Lflo0AucANdHIsAQTfUP3E4Ced4A6l6oHdnON7dIdFLAHiAHtJr1Gp00Sy02ky6S
         kpw91Co7Nw1JewYZjrJhgPMvyAhaTSDhuJA8c8c+siAQa+JYrUTJA2RnI0BhVNLP/9TQ
         mUrsF35ecUSWzDf3/GxuXS9DBk9mextk2WEHhzAC6BsML3ANeO/dPm30SgmrkxRkERaN
         73LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4x3+0zxvp2sdYMfTOjNYakP/78UYwkOEjGgNYRV6iftEYSro7jTRYxwjsV8ZvgNNqMildW5KfciJMvU5g9jgp@lists.infradead.org
X-Gm-Message-State: AOJu0YxDDeKQp5r0gNTRr5Hhspz44VXHlKsofcqjdUSl2tR7SZ1SIo4/
	ldvLlCUaygJgzmFuAq7tOMIbuNFr8Q0JNP9wcBazeMRgt4gJh2nvRxtAL0Df9dPgVKot6eM1mmR
	YWA+ROdFUYnmDdKroyrgbBlBYCPY0V1Y=
X-Gm-Gg: AZuq6aLTAPonJNmfjucHuuvkkRBsy5rarGI0EPS/xhIUiEXjA7UWrDFRPO5XK5GVX5E
	P93iBSN2drWJDt2llBI8ZD2QDJZhpP7nCBt6fpDFfVXacxmJirevtevCcbw75jO4dFqOGXlplv4
	d4nbPkaDtI+QXCXfdoIRaMcx69RjT7pk5PNgPPrW4s6ylqpqfE0ShyTRE6nMMOBt4ZjkEZLQ+fE
	0A/BXmg9aQ96Z6VjplWghete1RgtQhra56CwkVw3sxL2R7p5Uk9QKetwwm/M7fevxuXWe/A5iUB
	57m8+mLj76yrkbmeGrW1WSgJrEs=
X-Received: by 2002:a2e:b88d:0:b0:333:e590:1bc9 with SMTP id
 38308e7fff4ca-386b50f9d0cmr29580661fa.24.1770590075494; Sun, 08 Feb 2026
 14:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20260207131803.2834749-1-festevam@gmail.com> <20260207131803.2834749-4-festevam@gmail.com>
 <d41492a9-bb59-4999-8497-e28d03d3a13f@kwiboo.se> <CAOMZO5CmKzrcaVdp6Su+F+uT+nAueroaJcBkKtO3O8N0MWZt6A@mail.gmail.com>
In-Reply-To: <CAOMZO5CmKzrcaVdp6Su+F+uT+nAueroaJcBkKtO3O8N0MWZt6A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Feb 2026 19:34:24 -0300
X-Gm-Features: AZwV_QgSxOCFNJYNoGzR93g_6Vr5IQZIKS3xjaEKp5qzU_JlAOUnmsGAPuX2SpA
Message-ID: <CAOMZO5A8D=q7+6YFfCNk87LfY4k3XT-xKnB=2CbCjLaT6VCWag@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: rockchip: Add Onion RV1103B Omega4
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_143438_085077_71623BDE 
X-CRM114-Status: GOOD (  11.31  )
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

Hi Jonas,

On Sun, Feb 8, 2026 at 7:20=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> Hi Jonas,
>
> On Sun, Feb 8, 2026 at 7:15=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wr=
ote:
>
> > Am I correct in that this is the Omega-4 Evaluation Board (EVB) [1] and
> > that the Omega-4 is a System-on-Module?
>
> No SoM is used on the Omega4 board.

Ah, I thought it was a SiP, but documentation says SoM, so I wil do
the splt as you suggested.

Thanks,

Fabio Estevam

