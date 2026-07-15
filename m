Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56124C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ot+mkzy97NL/CsqY0rSsvtS6zFCj6FDV5nN9Lq+EnEA=; b=QLLaZ4apvU8csL
	3tLFX/1GQt/CU4OofdpISHQ01XU9jFuNl0h+gwOaBzL8yCVkG5HaxiEQT4KOnovJzWsC+QRqakF7f
	4MqhLsGxq41n11woGIhJrCsn1Fm9+jCb61w/FsahL4kH8rjdOne7KrN/JdpOD1qFLaG1zDRS6Gm4u
	3W9pCLfpjVvTOt0C909N8CZ6+qQTrHSydrudndz3bSFVzylAFXM7S30kOSqt4NFFoWKnGsDshfqk9
	l2c39ZHieMxtd+3UfWTw1PjPso2Dl5NGb6QpgUqXHK2wbSjYd+eD/AWlAZ218qGgy51I8t5l/g7ld
	UPKUQrEFUsIICo+wfJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk11e-0000000FE1n-2KLF;
	Wed, 15 Jul 2026 14:55:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk11d-0000000FE1d-25eA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:55:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DBDD40213
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028BA1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127353;
	bh=Ot+mkzy97NL/CsqY0rSsvtS6zFCj6FDV5nN9Lq+EnEA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=bfPyQBnMrePgS0gsls84e5NymQoU9NI2k8eIbUXBcnCc/PN0MBsMY0eyzNrGywcjN
	 woIPBL/ZrgTFZxn1Rwid8Ob0hbYXDZums21U87ngVyZh4GGB9qNf3M8856b+SekyGh
	 lghmvhyu7KU9Fa99c+Q0kN5F2DyB59V04xyALAXwYuAytmrRSo0KmUGYD+tKYZjnON
	 qNN4KHzdojKVSjLwUwmhAX91uqAskuvouX52JXMIS3Ivwcaeli+Mx9QbyhppuWUT53
	 TfUgsV2gDIuuoTQQVdNrxmvt5fkJIPFhbezsFS7Dxx14ftB5DXZy/nq6Jk7CHbvurm
	 yznH4IQbvR73w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c9107baa7so56398771fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:55:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpGpFEL9N0AJaXoMVrG/bQGyyRW2p0jxqd1Wsd2pddm2lccqcTNAYg98P4aODIyoxiK0utzHxI7YhcYVcv57jZU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9jKtmeqy1H88Bu9UxQ5Vy6+pWrNlNHWLbBzpetVR7warS3PiZ
	mjR5CLDWS5haeIDNv1EJtNQiAozhg3ZtoZ7KKNn3QoS6ieS+kd7RjSSCHjl3k+I3jDYoet3Il/g
	t2hzJ3MBg2SpReqxZ0GogMediQb/xFCs=
X-Received: by 2002:a05:6512:66da:b0:5ae:bbcc:7a55 with SMTP id
 2adb3069b0e04-5b15d76a23fmr548738e87.7.1784127351426; Wed, 15 Jul 2026
 07:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-2-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-2-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 22:55:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v67piCB3y=Pzvq9QZi0=zs6299UAxRdU6O2kukSW+JqMqw@mail.gmail.com>
X-Gm-Features: AUfX_mxcQ3YqNDO_ieBbHpUkaQUkcwRm2R6d1PkTwYWjPGrm2EyNbVKGbYPMcj8
Message-ID: <CAGb2v67piCB3y=Pzvq9QZi0=zs6299UAxRdU6O2kukSW+JqMqw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: sunxi: sun4i-codec: Use dev_err_probe() for
 probe error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2026 at 5:55=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

