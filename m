Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40446F46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nm6SOmbAdyE8jNGWZXC2DpIDvWoUpHEkSCMdIvsKF8=; b=wnaI210nBgI5GKgcGgTAhedfua
	ke2rgLYRqjHb664ZXs1UtsboTm8EYmej/q0XEhOJqp/OVgM0JIKRz9NT/Vr7WH45SXyFfxaqPcdrj
	Votalxlbsfx9sadbpOk493bjLk5wWts69qPGgy1cNNBMH/RdDuxyiVgFSqegDWGniO3Eb4THu7N5e
	N0roC6cJ3rzu6TJkR2GRxyI+S76y1x97U9wy1NrvmnUfphTlmZDiUMHs/wCzxv3NmdyM75UQx5G5e
	WYBgjz2pv7emDBR6/c33vTYSlEAJT5I9Bxdj+FTS5SVHlmAz2M4vw7mdo6V/0/M+MaFQNyYD0XEqD
	ECba+F1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fIt-0000000GowL-00C0;
	Mon, 23 Mar 2026 13:26:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fIr-0000000Gow8-31x7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C49D60120
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12A7C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272404;
	bh=1nm6SOmbAdyE8jNGWZXC2DpIDvWoUpHEkSCMdIvsKF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q5qnR3HOZZRlYKpzOIah8/QDXe1UNfYTyjAsxZSS9fJCNbKMqb9BlF1I3zpEQuAI1
	 V6PMiJgB9XTxFuCJCCi7APdnTl7Gjn2CDe1JJgIyNgQotuAE6WaI5I38qgtZtUoXA6
	 aL7IURxgy+VXHQEpOO+buoRi8VRrDNwWjEKbvZ1WYnuEIdtuaOwwuz1FTuIiB7qtPU
	 k2Hc+44akW+atl/8oupCEqELcgydqAvqF0nV0vKfGghEquaEAvekCD3FBu9AyuB3VD
	 VsWKjW5WMXY1AfNL0UPoX8pSBSI9Nz0R2C6jSZN/q7ksC3y22s1B5fXtghcW+LfTqx
	 X8oSATU7OswWA==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ae222d978so4286476d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:26:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCOOCmxAaHBxRS9LxaiNnkPIRqK+W3Ap3rUubyJO8XDAFDlAjlXqYffVFQpx5RvyJzh9AWr9emhUGPHAWycIXE@lists.infradead.org
X-Gm-Message-State: AOJu0YzSoWHp8i6l6rb6VMMt9k+VMfUgeETjWj++vl13BmOLjKlArHsX
	kjek9PftWVhZrsB19N0GJcZ7Tw+obkOAnuRD/qiReib+y4pWO8cWcGlEYGbavX+FhxIQ8PlosvX
	5mx9Bq1PzKGg2f/73oHytazbsNlbyz+4=
X-Received: by 2002:a05:690e:16db:b0:64c:bae1:2168 with SMTP id
 956f58d0204a3-64eaa6a30bemr8671486d50.12.1774272404188; Mon, 23 Mar 2026
 06:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260320151506.10679-1-eleanor15x@gmail.com>
In-Reply-To: <20260320151506.10679-1-eleanor15x@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:26:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9NS93nLndM1xyHGDdEdwGTZz7XSe581yM+JY3s4-4EA@mail.gmail.com>
X-Gm-Features: AQROBzBc5ESQ52ylUmYjA0iAQoSQobKB7oj7GrXJiTdufMGkti0CEO2UD0X63gM
Message-ID: <CAD++jLn9NS93nLndM1xyHGDdEdwGTZz7XSe581yM+JY3s4-4EA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: abx500: Fix type of 'argument' variable
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, matt.porter@linaro.org, 
	syin@broadcom.com, csd@broadcom.com, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Mar 20, 2026 at 4:15=E2=80=AFPM Yu-Chun Lin <eleanor15x@gmail.com> =
wrote:

> The argument variable is assigned the return value of
> pinconf_to_config_argument(), which returns a u32. Change its type from
> enum pin_config_param to unsigned int to correctly store the configuratio=
n
> argument.
>
> Fixes: 03b054e9696c ("pinctrl: Pass all configs to driver on pin_config_s=
et()")
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Patch applied as nonurgent fix, thanks!

Yours,
Linus Walleij

