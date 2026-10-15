Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60EACC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=; b=43JjZgTvTLgZfTCzWOkQ+AOrP/
	dbNyBywSiB/63/jVlQvZWrc7iXnXf1DEaio/MHuziEqf1EU1hACtPerr8dCETnAeTIq/SgCBRU7nn
	0SVsQ1mFWNJrriOsgJNK1W2ATCefo6fiUqEyuW33DjmqW8Z7kd8BDhGYBBh1Cd+Chid8z0EmT24PP
	bQbb1ZoSOdZmuyJyrVoWqs46nkDyldW85V2F25OZNiIy7/PXK1w0sofV+hJW3V3WLuFqKb3x3mDzr
	vEj+Oi7L0q9Mh5GOR4JE//mFmWocRRxXb7ew0YJ6NaR0XFqTW5zVRbB34dvD3gq/2wxVGpCxd/mco
	bIjW6Zmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMyy-00000000Ue5-0lli;
	Thu, 15 Oct 2026 15:03:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMy4-00000000ThS-3OCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:02:09 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1348160a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 08:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076521; cv=none;
        d=google.com; s=arc-20260327;
        b=c7v1pzjsagVb+QMzNuRAmaKbKam+0KsieiM0rDDQEMYsn9AMdVYKAt4CHJq790Z1up
         SGrVTKFRB2Z1K9DPx4bMxBjeGzGFv1AktL4/6hhvEFyLyITGz1/Eu09V5Apio8aAjDCt
         9F2HItRWIZT+tZ1Xvw5msd7FvsKbw4tRcZLTNpv6KMfbMLCixbUtKPG6CJY3PxEmr0e2
         9d2kbimfWvTjL3eJc2z+05cQ2g17fA543K4aP+mOcNL2AI0XOimR0uYtk2AAtyvHdV+s
         305iBHJvDuGjBv7uulbiXIPg8o/2oAfXvtqFwQFDo+Lr/w936xvXwUv5Wjr5Eh2CJjEb
         s+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
        fh=CBhyhjTKVTIgdqasfnEfg5PEGgke0H6+utol1QQqWFc=;
        b=YfsVgAcpyhJbH229gQyKfJsYabi9JoiK5nLPx7rzhNnDtMHPrx11eNIkcebJnqy8xO
         /Y9TaDtQh8Bf25RWggIMcXPj4tHJXRWovJcIQSXG6gLiKtJoccqyhUfxGLSFZOBK1B1G
         Etdek5NO67edstr94K7FBAcF+kvqT3+uKWS/MEHVP8vcyJyeM1JCXdXLQkk8mZDvu67l
         d8R0nZaZ0P1crHObhZ6KgoCvRbX5LFH7PotH5FQ0aQIsGdv8blU0Rq8JGC2sC5oVmxT3
         w+HIh6jpZE8UmQelV2ramkkbWT7V+ojcp7XdwOginbXqCLWIrrE8a9HHkh0+foOsCx4e
         QBXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076521; x=1792681321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
        b=Qbr9/321uQg/O6dtc4QL/4EMlghPC9659aNmNzKR68pAuxqDKEp25Q5JbCSTY16AU/
         eL7SVQP0kkzo5NHoa50+oJVi+iTd1+k86E3+7qsLov90Ze+FwvHDiaF2DvQLN1Qj0RNF
         2+MBy0PySgaJId6PH4I5IwktwrNliZLHnGTbmQAiP7ySAaQRGPy3CxDw6Z9xEpkAXWs4
         0RNiH1thOCyEpfKQg6d+STgXs1oNPIrmL0dLrt4DiQhX7bOUVPo/ZSYQ0e4zZSbHumbo
         FkGH4ankEuKzloBYIdSXbFyz1o5WqoOaUWrl7GUBdZrYCSSsPYn4DkXPP5wqXek1WiHs
         fvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076521; x=1792681321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNojCwSPIlR/KkOgGy6v/7yjRMePElwktJq6dhAQ7/A=;
        b=nY6iVYkgAHe57OAJEUcsJORPaotNdxTF1oYZDeuzGRK1CWk9BqqnxK5/P518/NZKQQ
         +u7h56qRgucQs5syeBuaZaq8jN1cj9gGfVpuRPYiJyyOT1TjiT+Yf+jwebdZxKZkj3ft
         US/0J3+cxrFyuCmGdUhWiKVh48jJ5q1KvD6YnqLb1WXBONi7eVNr7E4KVsPGO5dk/oH2
         LrmYA+GMrklVKSf44XbEmAjBszDkKh2qwrZtoiwG1Nq+xaqajYsJoL5a2mf9IfBo1HA2
         szbhFY6hA9TANs9lK4vb9Vdsts/QZuXc8YSyuXOZlXnZXcWU8LBPkzDp+5aak+3SThK/
         JS7g==
X-Forwarded-Encrypted: i=1; AKwUvBxHMoed54meaAs0y7d6S7trTgN1jO5bZheno43lfePFhIYFwGtlmOux9se+L9xnu83vLOoBX5+gRGYBaWsp7ULe@lists.infradead.org
X-Gm-Message-State: AFq9FYK/Od2K2O8GNrBx22Mfw3TYZsJWe0RjUIKuDpjuqW5wsRdK//9k
	AJ0+zob5fmQOtJzJ5hvMbuIp+Y42J6TkGfeuRVBmlW33MoSd5TghlKkLxxnV3XCF72G/TIoHr/e
	rf5YPHMAvtQlKGbQ7Bw8MmmN35l1r/5SXgXC5rgM=
X-Gm-Gg: AYBFou0dFhZeiUcYYN8lV4/71QezGuk1oe39RO9TaEyBXDme3lacy9zrMaK+FYijxnb
	ec+OgBCjeFhqdnPY4YrFlz57KKXbzPzmZA/YhcTIYpbJPyJgrjFR35kXHgHerAaQGmMtNBOU92g
	508BlHUKEfatfiXNIujj7B7zQJlDQj1F2doU3JrKdl3vi3Ci9SCKK3k4Br/0T4xSyCltXLu9ySy
	YzPoVwUBQN6lMHfQVDd4t7hcegkioeyGQRJDTT0c+4HqnGkuexfZ1JY7TpqxiVLeAoIbbUbyOmf
	ESqtxKIZmsA5IVfFIa6vQlu6w/KkPU/jq5vMC3tX9xSaZNpO+2RsG0y9WDvbsGqckfGTF/NNV3y
	Zj5HudX8Zw/lbe1BlNT49CYfvA6qABVKKZNNap8alJ4SPnaDGtjrz8CzfBd2Vj5dvQ8aI
X-Received: by 2002:a17:90b:4d0b:b0:3ab:1285:dfd6 with SMTP id
 98e67ed59e1d1-3ac6f2952e2mr5293396a91.38.1792076520686; Thu, 15 Oct 2026
 08:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com> <d7db7de5-4972-4dd0-85a3-e310dcabc41e@rock-chips.com>
In-Reply-To: <d7db7de5-4972-4dd0-85a3-e310dcabc41e@rock-chips.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 15 Oct 2026 17:01:48 +0200
X-Gm-Features: AclHuK_kT3T7rBZ4r_lp0uxm1snQeoydsZmEkfjppf8MxTDec8cdMHuYYUHsJEU
Message-ID: <CAPSPb=vTtNfm8oJu1p5znaW=Z2argekQgmXdVAo2OWD_33A-+g@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max voltage
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_080205_850556_D2C8B3CE 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Shawn,

On Thu, 15 Oct 2026 at 04:26, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Hi Joachim,
>
> =E5=9C=A8 2026/10/15 =E6=98=9F=E6=9C=9F=E5=9B=9B 0:33, Joachim Eastwood v=
ia B4 Relay =E5=86=99=E9=81=93:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > This regulator is only a simple power switch and cannot change the
> > output voltage.
> >
>
> It would be better if you could put the schematicinto the cover letter
> so folks could check it easily.

Will do.

> https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF
>
> Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

Thanks for the reviews.


best regards,
Joachim Eastwood

