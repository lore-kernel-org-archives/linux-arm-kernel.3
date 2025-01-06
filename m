Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7C8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5EeJ+Kq41D/Bv0Ajrh0n4I+EJ9ou23hfrzgzaRrU9A=; b=1T1gq9QYOuP1Gq
	wnTpv6qz4JeecY2faCghVFaOqfbQAGTNZr6wY9RKk8FCi5tisUY8x3/0KJiUXIDULrnwB+DM5v/P5
	Av8BfhMp3r+1uCVXUZpcobRXz7fUD0OX/kbVzjNkkhQGVPRr+t1BHWABxPRf5nFeMgTpSmPRKZmWq
	9JKcxXUOjvZLZUGG34B3AP/crLzCzRmUh0bn9KLpTt1sEhleCS/HkeRxQmBBZGugStZq4NRl5/Dm4
	ginyKUPRBe4fU0EQplSyg40/HV8ZTHYW+jh2kkGer6F/wOdPhd5MWYkebtbbOdzHAGKc1qGrqFt+u
	Ewi4W/q6tyDYekW21GAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNa-00000001qTD-2Eyf;
	Mon, 06 Jan 2025 15:50:58 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpLX-00000001pzB-0Enh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:48:52 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so15307221e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 07:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178528; x=1736783328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5EeJ+Kq41D/Bv0Ajrh0n4I+EJ9ou23hfrzgzaRrU9A=;
        b=BZhK9AVDYGRK8CRxGh15f6CTA2lmP5vBmxFcfASHmeeXlrVUdwX+C9KydauebSemXz
         GnhILTJcsjrF19Nrpe56azwi4NBtDmrgPWeesOPO7CbxF6dZS5V/A98YK90heNSUgWGO
         /HKpEf0nsc2wqtsTJHqdY8zsNyRdse0ytfPIxFcglTU57TC4cWSmvvfS1NKItAJCM+TY
         1eAI04+KyuWfpBasVqVsNVIqAjPEJTEptTSGV/DAaoYB07LmvUPg+2kFaPn5RK/VrXV/
         8Tn1X0leyx8wM7wMJzRTudmB5qu5pJovABoOKzI7+JP7YLKaEXFDirEpt5eMStjVgEvr
         4nQw==
X-Forwarded-Encrypted: i=1; AJvYcCXceOPFpac0wLqHh2FoihJ+q6oBRrrIlJ5pn986sSb64qjGzhto7SVKB0T+iPB5OUBmuO3oji8J+6eMJZ0k8DI6@lists.infradead.org
X-Gm-Message-State: AOJu0YxgUSXFl/ufLL1cZHdjfFfPd4E4bYA9EoA1gQ7M2D4ZsEIxu1Zc
	AkGwQWCbjeO1uuIlwdQP0fE+bgSgUIWvDy1TOiRuC+qQ/eWoudDQ0YQUBdHM
X-Gm-Gg: ASbGncvqiv7bLF9IMzSflrsRqfMRh3dSPvm8RVHF35jTG6e9yqTCa9xz0pCvtzx1hYI
	gYMN+6ED3OYBxJ8SjUWFzT9OFBMAuPwQdth+IjTYi8NjJrQdLi0flmKkhRrP7JYjGEWyJ1yLF/M
	BdBN6i5WO7HpJPHY6lFTqBoXu3X5Kb9kuUdL/+G0HhRY0+FzjB1u2dBYegB0bMbMeb/TU1iiHEe
	BwOY7vTXZedxl43kaWax6ftgTyG/KS0WIMrUHk/S1hzZ20AmOGaPiwB53wzT2HQL0xvtddaKtZR
	y2CCgVN7LCUAnQ==
X-Google-Smtp-Source: AGHT+IH5ixqAUdvLdziTwTfQmUj91niJM8rUGrnQW04UJzY+QxTFzm+6WMfpp4pUWlbTHnisEFfSAw==
X-Received: by 2002:a05:6512:108a:b0:540:1a40:ab0d with SMTP id 2adb3069b0e04-5422953fef2mr15336961e87.28.1736178527672;
        Mon, 06 Jan 2025 07:48:47 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600773sm4923390e87.97.2025.01.06.07.48.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:48:45 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3022484d4e4so177278171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 07:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJgO8C/Tn74EmKP+tKeBfO9dp7uZ9eBNzUL+XDPJBye/JhIT+3wjcEQSUZw6maS03FDgCL/zAyi700RlBRmXVE@lists.infradead.org
X-Received: by 2002:a05:651c:2129:b0:302:4115:b69 with SMTP id
 38308e7fff4ca-3046851f488mr190424841fa.8.1736178525182; Mon, 06 Jan 2025
 07:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20241211222205.1915027-1-csokas.bence@prolan.hu>
In-Reply-To: <20241211222205.1915027-1-csokas.bence@prolan.hu>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 6 Jan 2025 23:48:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66MgxCV+rNVC4NaXUFtxMk_=g+CyStLjpb=5e8Q0HNJLw@mail.gmail.com>
Message-ID: <CAGb2v66MgxCV+rNVC4NaXUFtxMk_=g+CyStLjpb=5e8Q0HNJLw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074851_091093_7A5DFA60 
X-CRM114-Status: GOOD (  10.62  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2024 at 6:22=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.benc=
e@prolan.hu> wrote:
>
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

