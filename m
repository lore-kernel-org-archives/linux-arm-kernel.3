Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102E5C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=; b=JOuGXeVoCCQq/WOAmXUhyHiisx
	2VWgy8rWPnwZR82rt3AB4cI9YxjGIZPP7cA/DF+iPr2ahd6eJMQFkNZWX3HgcHPoTyRiAr2TmK0L4
	2d5YR4rHexyz0EEULDelRFCPB+P6OL1+NDHXdJC7njnA86/k2iwMXUJqm+EohaUx/WXtb4/LcVAV5
	sGDrKi5weZ17JHSugC/n/BNpu6cFnfk17uNqXyo0VfU6Zp2OWgyvlsjIsLENkWObALM+/S33VMIYA
	tcVvb3fyZ4CKQNU55DpNBEPsgHg5K/NcPx6XcKBw24y7PXo+VTUZAExM6GzonTcbCadXOzLF+dg0d
	F22DlcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZR-00000009AcY-3XHZ;
	Wed, 02 Jul 2025 17:48:33 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1AB-000000097Mr-2s0g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:22:29 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-711756ae8c9so72122017b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751476946; x=1752081746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
        b=IE0XD6K45vXHIU/LA49nfwe6rvYQpiIoRyGjNlMBmwp2/V8HkJ1e+pxOmIu1ltChz6
         FREK+eTDRCg/7Bv06pJnCtpUMPdmbTcO9xYt8b50XQaHMyp0swnhlhkA134ZYi7k2ypq
         m8KYGWSYGTpV9B8yCJf8xCMMKR2MMtz7OSC0fxv7E+Bjws4IKPDJlzm3DoN+bnrdkB2Z
         pJ4SRHwMgz6IkmK9gkA0t033Cs6g9NAq75DPMrDzfKcaRna8T035JRnEOrEPgxHGRWgF
         sMw0RvrR2iBZMuBzGgYTXH0VxTKMuAJx8imoKotkfo14hoXFyFnvguOgN3XvXkbFGYug
         i+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476946; x=1752081746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SkwY6ne+g8BY+F31MtkqlGaiDXb8coPhVMth5244qs=;
        b=qehL0gcFkJ0lPP1EjbqHwY66xvIFsIU57JoWjhSo9gpWCYauLpRj/u0OokXKq0Rqqk
         6e+2k8hI26C7IZWjTqrKuvudxnfiuQ75KV8WdYBrZBsQcFsWoNs9B/K2Nq6Jor2LbDt/
         oYLCv2TqaPRa0rYodii6AWEvU1voqaDPkGBDGMbJ9b6Y07m4Dvi0eB2a9hu9yXFONLC4
         BCdTAV0amJFMjGNvXpywoLJdbqRB99nB6THRlxWlNDwmlgvEr6gihbtrO8ONrECksVM6
         0Lao/xS5lyOoUAM+BbrQfyJJ24NjizX2cs4rboE9gnHgmOJyi0uaVe8y2o43lTJXV8Iu
         /8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVm0y++52UTDHcpTpsinaV7xCYh+aGC1gnZHYjxztf913TvetXNZUPSoDuYUZm5RyAy6qMQBkj12uGeBoNFhPs7@lists.infradead.org
X-Gm-Message-State: AOJu0YyTdKRTe2pNYXd5j2fAV02MByRj8pFtgafI5JT6/H0DSkhxFwHb
	wbG+isQ7GwiduxBDRXrOj5CiDZft23D4pmcs/5p2bXw3yXghb6BtgNoDSyZseeB5OkY1oqYLl/a
	F6X8auUEfPohMOvkfwzK4VPT0SYGsnGFj9XIkSczY
X-Gm-Gg: ASbGncskovUvoaHMRez+G9Y5YP07U0yIvuo203vt6TiuZ3r7TvO6fV06jVexvx6FzGI
	jxauZMDnxWDu4cCoHoeYaa+wjQ+ejXTOlyvuSSNiehl6lc7ElpNFvLrOTmGdwvsB/h3TAVKWbSK
	pS9/oMHYYNdPAaI7VCP0buKhBP7DjONnEuwYxfLF3qPL6GfiGJNkNCnGUuyek2eR/qMOY3/AqAq
	lG1
X-Google-Smtp-Source: AGHT+IH+2cHiDRkSexobKNpcDsdKZBCYRCcLg4PJcbDmEq49ClTbY7a3qJRhpGa/9rwzq7pB1ZCDPnILu5cCdmgnzFU=
X-Received: by 2002:a05:690c:7487:b0:712:d70b:45eb with SMTP id
 00721157ae682-7164d539984mr52498477b3.31.1751476946103; Wed, 02 Jul 2025
 10:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com> <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 13:22:15 -0400
X-Gm-Features: Ac12FXzMF1aM5Sb75d0lCCLP5TcPQJxcLdk716xFOwxeZ7EpHXVjogygUeOUfJs
Message-ID: <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Anand Moon <linux.amoon@gmail.com>, 
	Da Xue <da@libre.computer>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_102227_841549_74814B25 
X-CRM114-Status: GOOD (  14.98  )
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

On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
...
> If, as the description suggest, the regulator framework somehow ignore
> the timing set in DT, maybe this is what needs to be checked ?

The regulator framework only cares about timing for regulator on.
Regulator off just turns off the regulator and returns without delay.
The code makes incorrect assumptions. Then the kernel resets the board
without having enough time.
I can patch the regulator framework with the same code for regulator
on but that seems very hazardous given how many things might already
depend on the original behavior of returning immediately.

>
> TBH I would suspect the delays before the regulator framework itself.
>
> Those assert/de-assert delays tend to be just copied from boards to
> boards. Maybe some boards need different delays. If those are too short
> for the actual HW, an ON -> OFF -> ON could result in a NOP.

50ms should be sufficient for all boards as many boards don't even
have this functionality. < 30ms is sufficient most of the time.

>
...
>
> --
> Jerome

