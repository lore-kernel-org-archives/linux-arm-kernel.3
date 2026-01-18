Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E6CC98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dv4DKCaxph8RQdwChN65tE/2s6++K2ESe/8mNuJC/OU=; b=WvBW0spWdtGVCJfu3GOIObx8jC
	fnp7E6EXpA4lM+CC+UEKj/OSkvq2+8B1p9Pl0CSFYgXcri9k0zlagxNV7coCfIuNzArOe+bwOZzFM
	Wv21hA/zTahnweuWGtw2hSVAr8VGSidlbU5wTBJqIDXtFqnvYYOQExjeLogmYAszcMJh1D0Srhgni
	OV3FsafpCuOoCeAxPLxQu91UUa5FUF6bK2ndXT+u85jk8L1QpIWCG7r2ir0hhl4uzgK5UP7dWok99
	zt2x7Id3LmgBF6fVTkSXSIwKxaKfQ0BBXVF9oAPnP4sw0lbSjHpCnzNqa+rKICkbN57pIfSYszMeg
	2n56scUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZmK-00000000xl8-19bD;
	Sun, 18 Jan 2026 20:53:44 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZmI-00000000xkE-0LJH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:53:43 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-45c7d812567so1089655b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769621; x=1769374421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv4DKCaxph8RQdwChN65tE/2s6++K2ESe/8mNuJC/OU=;
        b=OI3Krh/3bROEL6bsdqK94yyjI921lj2GKWaxwYxf7if+RpXdcMvGshxxGQv007J4Hw
         sonZyWkrR8LhhPsA0aOEF6+rzpRcGsfneays7GngnOboYezU3WxHMFUVpSgycpnZwwwe
         J4SJUH9dbbG196xvhzfZ1XeRDRFwdlpJ6owmjdtiCfxTsEFefb3S0GQX/VsB7tb0xE/J
         uF6kLeayUIk4QyumOtysdaK6N4WBcVpyeH9mRj+dFrxrWHWrT32h0D6kzLZbtGvkpCoc
         ug7UmNTYnZ5l1xZry5S1O6KK95nBcdpKbMewSQblTMTB2cdU9Vhti483Bll1xm2sWT2f
         WZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769621; x=1769374421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dv4DKCaxph8RQdwChN65tE/2s6++K2ESe/8mNuJC/OU=;
        b=KaEnwocph0uJ1poCo+Kvr+oDeAPZd3DS+Z7JtK4oLqXrX4+mWOgxpdD2yq+2QIODnd
         JBg1RxX/J4A7no8CcppR72gk8dCPxKO88HIorQ3SfbF0OqIiCK2+KKt15CnFZrTriqL+
         n9IQZr6dqaAoAwem9YRDcwldWx/Y04I98KqpYNVtbOcqVeyqOI0lk/en7xMv0cjsLxc/
         rE+i0u3Cbgry+YJ/Uvsr9QgQjXG8cMPbQBWmLYdPaTCkkaLrw5TzIeZ6aJs9t/tMyg/M
         fFcTO71HF0VWE5D4MLKLvRQuQQ6BFElFuW/Z3firmgz+2FJb4S4Bx6b4y1aAao4LjEHp
         ul2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPMGfkQMS4OO4XpYFkSnybe+b+A1gqox+FrjNh3DWjY1qgnEfs3VBWq/heshqiUqADonk7j2jxHj6jSYdPePC4@lists.infradead.org
X-Gm-Message-State: AOJu0YxYHRfyJlnhN5rvmJObGXdmrQGuBL4vuyVtv/3ycyOO/NeRUHB0
	zTC2HYSFQncmCO1YxpT7NeE+KDCngO0bkFdY5ytUsa9uuJgmf8Miux4L5CbLTqbw/BOHAbj0jXA
	0n/ugMfYxv22FYJ/l1+ve4u9HYpxYnT0=
X-Gm-Gg: AY/fxX56kf7o1MZcOSB4h5jYw6hYygKeWLouGZeVKCl77ywW5mNCH9B0jVFCQbYxEEe
	MvNMF22gKz0zuWUOgaC5G+kqDyTtfKq2W8KuN7pxUGGhBM/7REkTUTtulJ2pqAthzHzg+UlsXtn
	oWn9DWNdA1DCtl7/sF/xTROTXTuKPH+U8946n1zlKMj5DnoXFQ4Xc8FqOyRWjLZjFgyXyT4pEL0
	9A7yI//Qkaupy8Jjk6thmn8R3fWYuB0XaxU9R/leEPoDIzRLkS6uZVgjUyNIP8x5eQ7dXiV
X-Received: by 2002:a05:6808:538e:b0:45a:9068:6420 with SMTP id
 5614622812f47-45c9d85e92bmr4514304b6e.45.1768769620955; Sun, 18 Jan 2026
 12:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20251223091807.3070-1-lakshmicar.2023@gmail.com>
In-Reply-To: <20251223091807.3070-1-lakshmicar.2023@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:53:29 -0600
X-Gm-Features: AZwV_QilSF74xscA_z9kTavhPD1VsLkQhZ8jFszvb7EDeACq4hr39jc9vJM_2Oo
Message-ID: <CABb+yY12Hog1=k=sAodU=SBiG8UfjkrQ0t3mThPQ3vtz-T3StQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: arm_mhuv3: fix typo in comment
To: Lakshmi S <lakshmicar.2023@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125342_121480_D6641163 
X-CRM114-Status: GOOD (  15.65  )
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

On Tue, Dec 23, 2025 at 3:19=E2=80=AFAM Lakshmi S <lakshmicar.2023@gmail.co=
m> wrote:
>
> Fix typo "channnels"-> "channels" in struct documentation.
>
> Signed-off-by: Lakshmi S <lakshmicar.2023@gmail.com>
> ---
>  drivers/mailbox/arm_mhuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
> index 0910da67f8a1..a1c528be47f3 100644
> --- a/drivers/mailbox/arm_mhuv3.c
> +++ b/drivers/mailbox/arm_mhuv3.c
> @@ -333,7 +333,7 @@ struct mhuv3_extension {
>   * @rev: MHUv3 controller IIDR revision.
>   * @var: MHUv3 controller IIDR variant.
>   * @prod_id: MHUv3 controller IIDR product_id.
> - * @num_chans: The total number of channnels discovered across all exten=
sions.
> + * @num_chans: The total number of channels discovered across all extens=
ions.
>   * @cmb_irq: Combined IRQ number if any found defined.
>   * @ctrl: A reference to the MHUv3 control page for this block.
>   * @pbx: Base address of the PBX register mapping region.
> --
> 2.25.1
>
Applied to mailbox/for-next.
Thanks.

