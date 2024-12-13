Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96066E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgQ1AfOgEV/WtM/A3+uz4rEIqiFfux5uHfmCT0tsGtI=; b=YFthXYU21iwAj/XaCaTDM0xjkq
	p3CLatFMzgZmm/a0oVhkGTUwHpeu2Ofit6jklMpkEHg6K8vigfQZ2ktlVZa5v69HgbO7Pm2qzL3mu
	v4259301WjMgkfI0qLJJo89pbfK/v9ctTAiaoCwlbNWGUSpufmhNYnjOy5wzkYs7SAYJ0ADicQ7ce
	8FYb3lIOnNXyV+L0rRJQXg/mabfqkEqFFOzRnXAhbUngHN1gOGd+GmbbKpdkJxm7Ev2DMW0Uwwr+s
	q8fUCl8y/oj5PL1IMzu2XpiGOMBaphT9AwMvVNIeThR6EAgfUX7+mae0XZ0zYIwT2MhzbAOvI56jg
	V8optJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDn-00000002lfg-38v0;
	Fri, 13 Dec 2024 05:28:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyCi-00000002lU9-3ZFs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1537406e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 21:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067626; x=1734672426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgQ1AfOgEV/WtM/A3+uz4rEIqiFfux5uHfmCT0tsGtI=;
        b=WxlgyHve1STPmyD3BfNrUkSpD3xhK3trZxC4D3cX+gUvCczI2QVoIqbi88VG1pyD3x
         Ki0g6xWJts+mzFIIa2BjI6FUvGhwNyGb0aUrmTW2lT0uorfHwuiIWBPPB4kxgb4Qao0x
         lw55cjgauH08Br84mQPJq28NkSlyZsi8+I4HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067626; x=1734672426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgQ1AfOgEV/WtM/A3+uz4rEIqiFfux5uHfmCT0tsGtI=;
        b=jfmaIawk8/8YwebGl1ai1QUa3k0dB+Tv4+D9tz5cGk2G8ttihhvXWdoMlNMaDZQfRE
         XPaEIqwKKoPC8Mfk/EwGFdKx4tPEQUw3C5AWYS9YKbKbLSLK/Ve4ZR/JYptxh0SdjcZf
         x8tENiXYGwk0XkFthfqJGMZj8LSOQ31OzE2dl8Lqqm/pKMcSEqJ80VbG+DoUCY25odp8
         X6lvi4CNi4pyaKxZHH1varbrlKFgdEuEhzynjWApEaXiU5bmexzMmjPIrkurrlnGvDfV
         5uE3bDcst3o8N5KhZVf5U4tuHvyNzUNOOdn8Z0G1DCKMsRTA2MSLZhTioWgxprPTsKLu
         ZLZw==
X-Forwarded-Encrypted: i=1; AJvYcCV59dEbwqWQCeBFHpU0AnI5KDJf9guFRR2t3IzW7Rl3ejPg+dlf867rX/fkZxa3m4vMYa4DP/GOR3eawj55BQr4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy11NZQ9imeVhiWrpRKaMmUKuVwbb0teLWuvqwx2mg4Qrig0oUj
	cxSDZno1QSOrGgmy8Hgupu1q4j2U9qsjAV83y3lfFnsqeQOUxjg2oFpoalnoV2Y2x6hWnaDYQm3
	rz3TMKsYcko9UUGsIX32E2M6c+Jwx+D0CriQ4
X-Gm-Gg: ASbGncuwtb3y3UT2m/rITNTh09rna1U7hDDWpusPYL1hORMS9JQZ8dCMMINk4M37eGF
	cgYBkM3x96nL79w/0ZRAbqmqvEAuI7iUzuoaw/cuUkcX3DV+lyZ+Idjn4WB3or10=
X-Google-Smtp-Source: AGHT+IGhA9h/qMEh3kQO//+RlkgxCOjtkEXubWQ5cyZXn60MBtkXvqcni0KnjZPJqjy4n1nnTxAQnsTV3Ek/V6fc5uA=
X-Received: by 2002:a05:6512:104f:b0:540:3581:5047 with SMTP id
 2adb3069b0e04-54099b69aefmr240381e87.48.1734067626143; Thu, 12 Dec 2024
 21:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20241025075630.3917458-1-wenst@chromium.org> <173381930438.18469.15845444123528821647.b4-ty@collabora.com>
In-Reply-To: <173381930438.18469.15845444123528821647.b4-ty@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Dec 2024 13:26:55 +0800
Message-ID: <CAGXv+5HY4s+0Yn35BezRWLKPnYkURhgg59eSVED1_6Z3QyQHiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display
 output by default
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212708_899161_E8FAF974 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, Dec 10, 2024 at 4:28=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Fri, 25 Oct 2024 15:56:27 +0800, Chen-Yu Tsai wrote:
> > This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.
> >
> > Most SoC dtsi files have the display output interfaces disabled by
> > default, and only enabled on boards that utilize them. The MT8183
> > has it backwards: the display outputs are left enabled by default,
> > and only disabled at the board level.
> >
> > [...]
>
> Applied to v6.13-next/dts64, thanks!
>
> [1/2] arm64: dts: mediatek: mt8183: Disable DPI display output by default
>       commit: 93a680af46436780fd64f4e856a4cfa8b393be6e
> [2/2] arm64: dts: mediatek: mt8183: Disable DSI display output by default
>       commit: 26f6e91fa29a58fdc76b47f94f8f6027944a490c

Thanks! It seems you haven't updated the for-next branch, so it isn't
appearing in linux-next yet.

ChenYu

