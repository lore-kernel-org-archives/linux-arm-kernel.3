Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5B4C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIs6fzy+l+1Pv5fYJ/81fnDfgGbi5VGvlBD2/CZN9ek=; b=2K7kWBpuo7NrfWdqWwpiZSXzNe
	5sOQTclvG5zc6iN97gbjsK5ngVyswjXyE/JBP0jmEGLoMbPyhr2zL6MDmoosOGk6IxYQwKvr4m5Ym
	2S4Rw7/wPMYkHPbyWkeM9xG50SQlwlgSz22iJA7RqO4K9KPuVdRSrEGxTfQjZ3ZeCRTcYQyNIHwff
	rp9r1G7ncglNk3wffCP097iKY6kQLPjnwH3fsR+ZFzz5CD0V+DewWdqcCbnU0cyXMlqWDWlKHlBZu
	aCsF9fD/WDd37vDMV4sCVizgb4z6BIdfh2l17nx6C0AmNSC1tMdQ1UOD+5GsF9fFY1pBOzbHQIcU1
	NEYgCm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tOO-00000009rmT-2DhJ;
	Wed, 16 Sep 2026 17:25:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tON-00000009rmN-3h3i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:25:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CF63601FD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83D51F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579554;
	bh=oIs6fzy+l+1Pv5fYJ/81fnDfgGbi5VGvlBD2/CZN9ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eBetjFx4k3JtGQO7sy5AQjaqkBY0p70iFo6+boeVoENF0Aq/orTvbXnhFAh6ZmUOq
	 8cbGxphcP9hIG/8VcEry9YmJ8JiyUNJpCjKCbIW7JZHhUOL9OFtj8N3P/ZLSwqzXRE
	 pWVK4+KZ5gOE7eQkpHJ9oWTnVrb/Utor8j/ulyrsPJWL+L8gpM0o5oxZcIBStefH8R
	 dKv88D2I1OsbxxH3aCX7y6k9rm8pB+rEV4+6yg2Oo67zIqPrN67IUEQG6F4Ck4gz6w
	 5h2NmGZ9ELWwxM+bKafcwGYj1sVocgg6SeO+wm1OtxqrLl4KRGLQ52s7aaqPUBwNw9
	 u3YWOYK0MoX+w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso2073882e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOWASKB0qMlvLV6cwN2J6bhQTJym1aV5H2p6nMc7d3wQ8X+hKRlOsYvYUUC1aFTpWemtmLJ5sGp4ak2R8JjXhD@lists.infradead.org
X-Gm-Message-State: AFuF++n5SWve01zY/0YrVzzjWy+ARzspLr0suVM7bNsp/PzrlXBAWoyY
	ScHWakjMyOv7I0JezFVRKjux4CrOBuU5n7vcliWWbgUzfy/e2op12cqSRVm814U+yu9XRNzBDbC
	O80/2RNrG7nUbuUfgj0Nlk5O961K82+M=
X-Received: by 2002:a19:5518:0:b0:5b1:4c14:9b3d with SMTP id
 2adb3069b0e04-5b8ba5de63amr78323e87.11.1789579553533; Wed, 16 Sep 2026
 10:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
In-Reply-To: <20260915070103.1733176-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:25:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
X-Gm-Features: AcwNN1U5p1jQNWfJDBDBcokXqdBha7CDbxJEl7eNgY0-Nuq3oH3fx3OcCRj68Ks
Message-ID: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: bmasney@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
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

On Tue, Sep 15, 2026 at 9:01=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> of_get_parent() takes a reference on the syscon parent node. The
> reference is intentionally kept on the success path, but the error paths
> return without dropping it, leaking the node reference. Release the
> reference before returning on the error paths.
>
> Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
> Cc: stable@vger.kernel.org

Stable? Really? It's no big deal.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

