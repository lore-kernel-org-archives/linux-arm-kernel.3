Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C085CD132BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHPKkrWl3Oy8p5MrcbZuM2KD4tgm5qxZUZ0cBJ/U+0w=; b=oKLCLW1oiK4Ara+jjVCg3cv8JV
	MxuvTRrO3l6NNMW9o6fIYTUJOcnE6th4DMnluExNY389K2b6U/XoCkpHvgN4afS4KS/0VQG5Ac2kG
	RmObJw7pJvAJvG1kFbCvw9Gp6ontNTixCQFUAJgSQy2MOYtlg75OwPQVT5TTvpsiVDRHjZIwr7s/Q
	/98Mj/cn/0Uk+1m4Li/n2F048MK1GqUYF7vQ0e9tG1TNJNxnuEFmngZpkMQj43FpZBzvYPktMoqdo
	uY9GZX71+ZUoYk9apOUYagx8mCna/rlLB7Mn/NOlATcqu9HRtEVmq8p8wmaHBJLh0a8hDaTTeMiKa
	71Klx3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wO5-0000000DihO-0TEU;
	Mon, 04 Nov 2024 12:40:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wMP-0000000DiZG-0iGr;
	Mon, 04 Nov 2024 12:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDCD9A42EE2;
	Mon,  4 Nov 2024 12:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BB8C4CED5;
	Mon,  4 Nov 2024 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730723947;
	bh=3sKt0pKQ7l+ewl3dj/n8AiM7yxbEFq3qr76uue5LlSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DhzBv4Qw/jRz2kLqJWnrL9AmrJDBvFX8zXP/vfElrDZdHWrzLB/ZnpbWxlmcKkDe8
	 ZQYaMAjrvvMq4vAHlEoZs022vT3TInz6dt/Ha+fkPV1iOa6yaZ0RovvTDIYKdgWjDx
	 QViQePlDTW1N/RBNcbcIHAmITMxXQPLWesx6udR4quGbaHqHaAujho6HgX5NqZMV9b
	 ohjRnGyzc4v+5QWxcxBRmmJIkNYYDjUxwwtvNpWp88nJSzzGnlbL+ReLlYXdOi9ebv
	 IF3Id1AaO29eVzPmbJLeG1znJzo03xDRBcbe7yhG3z0QPhIug1IVlHZkottVQvcYhu
	 ubk3a/LfbDVRQ==
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ede6803585so3666476a12.0;
        Mon, 04 Nov 2024 04:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVrkT+6rz4oKJrr2XGDOsj0dyYNXziIUxLS1ljXHRpfZJZnP+yt9yHQjHHKn/93qjz2KL4EYIm37e6oUHCJ22D@lists.infradead.org, AJvYcCXCZ0IDDF/aTnoQS7jVabkphRH8Tk5jBrlREbjmUyPS1yFONNs6sZ44YaRK16oQSO/Qi93PZSYKBaVSYy9bj38=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMR7kF5Di9SzYSeyRVVosZG2w6Za374OQtb0kASjRRS1Q4tewf
	lxOAB9rjSGqCz5TGOPM7Rk8iyj0atUW4QGapTDvrUJ5Dzg1ClDx7PDNh/OF49WN6upcMI7+gWon
	b0BSwOtcpomVUDj7IxGeppA/EHQ==
X-Google-Smtp-Source: AGHT+IGp3PoghnDPsbTvX2ld6cnOJBapqXb+5hbUeZVa3jcTQkcnfw8QcLHobq/Oeep5/JnK90IvUmtv0dEY2fr3tnQ=
X-Received: by 2002:a17:90b:38ca:b0:2d8:3f7a:edf2 with SMTP id
 98e67ed59e1d1-2e94bdfdeadmr19464472a91.12.1730723947190; Mon, 04 Nov 2024
 04:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 4 Nov 2024 20:39:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Vf3_BCOd6t2G=e-rU-cKZTdGbqEChPi5vipY6yR02eg@mail.gmail.com>
Message-ID: <CAAOTY_8Vf3_BCOd6t2G=e-rU-cKZTdGbqEChPi5vipY6yR02eg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/mediatek: Fix child node refcount handling and
 use scoped macro
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_043909_359544_742C524A 
X-CRM114-Status: GOOD (  13.92  )
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

Hi, Javier:

Javier Carrasco <javier.carrasco.cruz@gmail.com> =E6=96=BC 2024=E5=B9=B410=
=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:22=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> This series fixes a wrong handling of the child node within the
> for_each_child_of_node() by adding the missing call to of_node_put() to
> make it compatible with stable kernels that don't provide the scoped
> variant of the macro, which is more secure and was introduced early this
> year.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       drm/mediatek: Fix child node refcount handling in early exit
>       drm/mediatek: Switch to for_each_child_of_node_scoped()
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20241011-mtk_drm_drv_memleak-5e8b8e45ed1c
>
> Best regards,
> --
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
>

