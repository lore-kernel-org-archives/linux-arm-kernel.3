Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574AECA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=; b=TJbliNs0NO2VckCsR37J3RjswP
	v2OvV0BjqFPAl4oay08cTKBcahffAUsgDmUvTq4MAf0FG+4A42q8zf/B/OyVidtcqx+1+NPzqxB/g
	FR0YVpV7s/NaP5X9Xe+Y/SiTGgSgFQQ/MtMXVim/L9p8RQBIju8mV2QSuMxzzdCDpZEpIq3r2JHNH
	Mvwwm15ZeMUwO7bwe/QUgDowGyO3GsgzfbZ2y9cH0JGNLA7RniiX738GIhvxgxRmiC6T+5t1/jn7D
	08gp2ZjwA0+KGkjJyZS2MoVPwCdx8ebZG3W2+/OnWiQyyYWk90revlZy8E4GVVPFShlIbOZehXSbu
	dd0PYiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCCJ-0000000A2Xj-0cBX;
	Mon, 12 Oct 2026 09:19:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCCF-0000000A2WV-3TgY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:19:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso218181a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796790; cv=none;
        d=google.com; s=arc-20260327;
        b=Og4LiK1VK0oMJ8kGDuP7BCUxZ7rpV8KRF9B062IaUuqlEGR+ahFf8wWcJjA7qlUOl+
         Y7uP/brEPfCdY69Pz3gAxXygWjhwJT+OhMV5dtISnCW7hnUIV9/T2xWCoCIFXfYAYYv7
         /oxraZ6ZgXwIvuj72WeLwQug2guaCINK4KEDrrVhzbS6HvLLqceZAM1VdUiKSYCJZHgR
         q8pELCFWFQx7cwAMq5g9Qw5eJjdT5LMpa58jLklRfLirTWl5din5uOY9sXh09ZYHU53H
         djUeQk8STw4KB5tx7h2xlG/u9vMbxHtE7h8O02mI4irtlXIrb+3Z3QP44TsL3xdqDdem
         BglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        fh=J+rMD79yIj58sj4xA2k3MmoHRNjA7qXZpcKX1kSsayU=;
        b=XAPZ+CKmlRKvgEWe9WT6wn/tof5t3DlDYpcOu39eohCHUX4Q34BGgFGkyJgwxmaro3
         +CdBe+R7h2jnb3XhR+h/9RVvnGcYv0ep6WOINZLHJ9XiH2xgn8o8vDB50TVuEhKvX9v+
         qXSfGvgPEvX9AkistLCrLTAvvhhsNUdWSzFN8Thh/3+Sw8IDFS1Vhesi5cH6RmkZd7dF
         3d7Z/MS61WEsTvWNH2BYQ2tu65Py96ezQusfmD0MiXUshY0o+vnQMwZx524c9OZZFn82
         jcP/bv7ACha5w97ARuPgi+FQEuclHMdzKBS/932tpNMly/RL9XTYRTOSNTQo9484Qc+R
         Xnpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796790; x=1792401590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=tN1vGyzCrbx5YVhGB398aOoi8t3r2u4TgXS0xXj/78XLJGu+V3JrQq7CaONvwLZsB1
         K2G2NxIpnlKt6Ca3wAxUrentNyY5lqAbFTE52I/mvmkpMd2zZOUEGkLfFTCwo4xIcFgH
         4Pgxc/cDEC43tFjdoY45dkUIOMGz9ICUi2D2LQDJr4vnZZU1TQEMI5dKovOlewDyeCx6
         Aw3OQurc5sMhsT0FWBfEmbZ51QLnpEctCgG416ZT92P9VN0aEpgPgD6WfJBI90TBW6Td
         z0hbWcXOp9az26ZZsamFWBJXJiapVuw3H58d4F1TGS6bDVWwBVj1zw2SwEnIt/7/U7k8
         4z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796790; x=1792401590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=JIBqGbkaKUu2WX1e5HeaKQF2saVZ6CFHkfPRZ9Yx3NXTxu5jpjhmSkkD6/+FA11Sky
         G3Ub0KPBvSdl099pg7OSrfH4IRM6aeas6kC6+tyAdXD/7HUTbttbjnHo2k0ESzFh0gzF
         UoLZw4nYid3eTAJd1tthbElpYJwEQ7GHy9Yrea1FphyHaGPe3hPmsbpu8tY1bL0FG75G
         4WN1lQhin+iIN9Lt+lwH/kAWSM/A+abhwtfvWwPtD2V0ut70GfE7bn97Qf8cbygb/BAd
         OhWzU8EFKWQElPX4Sdm/3CD+vCAT3z45ifcbEWv/wKtLprmIyo02aTSzY/mR7nxx9r00
         7Veg==
X-Forwarded-Encrypted: i=1; AKwUvBxI6KM2aKUeUy39SiRND+CSoMMgKvV+aZUjOEUsPcAlD2opbgu6sMdkRmO3Cc+P9PGVh1odQTZGmtVeD9o78FI8@lists.infradead.org
X-Gm-Message-State: AFq9FYL5UuicYhb0ytDrLjFDcBUDVslOGNcwGIQMckB9GEXtYgNLHxg1
	9NlXyoaTHIm3Mu4gobYgqzC7d9LpqZci7c+i2yaKO9p7oy1xm3MO2bZKJ6RDtFQh3R8wTpUox/6
	Q1lrk9YR3oIf/zbWz0fgyGh/IAPkfm/Q=
X-Gm-Gg: AYBFou1PMqZyucvDvhk6HXtoPYZm07sJrxrzH7eO7hF1q1Tj8mv3VtMJJJcsYpx159j
	2UYZPlD1p0AmymfnLwgmzR5jKCPb9sWNj6fhhO0keEw1A+2LNx9VItr0m/+HJcAVof59s3S5hdJ
	Ven8JXK77rA0qfkNQqmMPgzwmJi+aY5GnoIPmyn3sjqg4MlK4yKVfrpV8rUee5L4C5Ji6gJ3xg6
	dwCQPQ+7k/Gw0zbFetJ1wzvcwSxEtZETV+Ud9S0ZXgchhOUIzO/NTRpvpgdnjdKUJFpJSS52Fzh
	G5FlJ3qZpaKj9CGyKIklxL1Re7TLtbPRsZJI1+Yd4yugtnmYFjKqwBLxhjWhDjWWjZ2I1w3kMPS
	XBQchHYmd+dYENmFqZ1GSegMrGc2eBRUPQ1qisX57sNr1U1/IMMFL0hnbHq0PNm/XEY2U2XTb1k
	+jkb6dahvyI9CVPDe2QP44BnGFVRPR+zJ3To7tExSr
X-Received: by 2002:a17:907:c317:b0:c2e:2ef8:5585 with SMTP id
 a640c23a62f3a-c31a9b0af08mr839361166b.9.1791796789636; Mon, 12 Oct 2026
 02:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:19:13 +0300
X-Gm-Features: AclHuK-_ERRyTh4kZLrDH4khT6vrVC8RPJd3Q28g6NygjNOEZR5lX3Usk0n4iPI
Message-ID: <CAHp75VdsxjdbrvjmFS0R0wzFV1pge1L-bfqmA5dwWD=o1Z81LA@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_021951_879030_AD4FCE95 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.

Suggested-by?

--=20
With Best Regards,
Andy Shevchenko

