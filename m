Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C801EC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=; b=BwRYvS0lTozQyj7QNap8y05TTY
	QLIHjE3wjuIrtoc6y8kYkD+LHk7BD7UM4jamv0MUGSc0Pxqt474ChoV3cBPkQP8o9KyciPYEwI7eV
	X5qgKAxMYP9iNXCs36ysZ5bi+RHSrudjWNUFH1j9ox76Uk0isQOtxBVL0CMSEu/0kFMRJzI+nxFZu
	WTqcGHqLnxUitAyHErNgaYkMUt/X5TGAt79AWjg3r0orMGP6nuaAbn+EMlX9IVA66j8Gw2LBVO4Ry
	ob9lJAYLMRr/faaKYRB/MwsoLmUMYG9Cbe9ykPp94opm+G18Nb5yS5SmC4n2cZ91LLbnuKuSYxeIK
	StN9R+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6juB-00000008Zh7-1yDR;
	Wed, 16 Sep 2026 07:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ju9-00000008Zgm-13uk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=; b=jroixMpMyYKpobCQiM8vml2LAB
	6zi5d5Iiiv7peVn9ETqvlDnDpcr9jdqmQkzYm5HV4R84FipWt6SLj7VyqqoZXaM15DgOyAqkMaQ7k
	nQk2/xFoqUl2opY0/t9b2ELtjmLoOX/xJchgTQeIJiObmOjDvA3+QVFkLjXygoofCK2+7oWLR6CT7
	Nj4M9QkrTxQSTvYpJYZVDehqJvONBg0vqzao5kOCsXdkv7AOMMBPsrtKIrgySSS2RJalqm1Bvk7dg
	SlCtyvhd+ieFdomhmITbXXMq/kmLBupNUvue6pbGi5L9ZZIllYE+DSnWhkDSaPJXe/ABAroFlseoR
	Xt9kEdrQ==;
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6ju5-00000007Zuv-2QHs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:18:04 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939eb3249c1so55918485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789543079; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdwkorVyu68SWyLG4OpkDRKKs62gVEhj8S3M116ZsY7l2wiq0/W3yx8lDKs5g3pC41
         V51IitysoZnO1Ev1m49W2c3pWjIvT8y3iHU9Ud1AP01D/YMsewagiV98ElS4UbbRLO/7
         PvkUH/MjFlTXCrubkTym2/8lhslYP9gZ2RYi29wM9rITefCVHJaHvXKebcfYflNExtOU
         mPIPst9UU7iHThIbcbHx5RoBjYpp747qqAr0YyVzNaJazEPG+I0qAsfSJnfaDM2RduaG
         oTCKVeGmy2ESZbf7UpeLuCF2C2RgUi+7gj+L3K7vpOjcs7fpi3QzVxwu+FuDEru80o7/
         kD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=;
        fh=3WPwfWLZ/FZIuzf0YHm+K8mg1/bdfmIvd0dbI7GpTNs=;
        b=MBWroZgo+Jq/E5Mml9n1cHwcm9FsVALIeViuCxDL1eT6kGXuTNrxlRGWN7JmwFYBL5
         ABULViHF/kE++Ri8GNl8eBDpEoeqE9JGzVBh+9y59/jxmXnyiuHDDU0BpDdFqAXE/crt
         itzTJ2KPNg+ME07ZvfzahAy2beelaN0DzweZJPe/mQp4ld7+VeokaH/O6ZBOTAG1h528
         Yd+EQCK139uE/ND6xsxEiTXPyuVd0gryCF3dLAPx4mGXGfLTYFAUWzl1SANJvRjGYADG
         zD6WaCh2k9eReay0vT/72qq5Na7KmAcVgE9sjrhZb551LKARBwf3YbWY51b3LGtUDLLE
         9SpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789543079; x=1790147879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=;
        b=bZogOfwUxWuN3CuWiibiIiYES8tm1ugcyZoSMs5FRLKvjtfdP/2a4WYXZFCSRDDZNs
         qJC4qedpG0IziO8ZBvfXpNIvxfA7B8PjKoAj3n8mD6SNlSqwJeqwM6eYnWTG+sYkrAEi
         0WtH6VSW85pSBcMsgXj2EdkKLDFszu70h3UewV0RouJFdJJejczpAXjMh9XJHfUJytA0
         t1O61E8vHh7bMnywkUApMKII4YljsgexKjvriWhusp/5f1CXPTYaPo01oQPv5KmB0PeU
         8L53E1FgIxDSPOj6BjBDvbFill2eYBmp10+D9Wp+u+0ilFp3IIUra+yGgfyl4URhBhZb
         pihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543079; x=1790147879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=;
        b=DsE8sE1WiMajIlB5kjrAiXZVqv7S9PS5BRT2tQ5+C3bJBxNqmwmSzgNlRIuIxqUoBa
         xotm85DehUSNtvXKAtk8eYp6Axa38EJ+dhqTDuzUYbZvHlp8xXT2INHu5SHNEuzGXg3d
         nH2k1d2bqUMVNph5haV9+GBnF4jZrHheKG3yIjZNnovdbTsP2L84nHCWeXJrmMeF+0ep
         x79bElfPC919w53it39WAa/5kNmPIwrtx6IVYgB1ntF7zbked71/Ki7K4AdyZgxtBoZ6
         Ita1j1TUk2pXU3PSnacu8PsjrQtmLq9ySixq1Fn8wnXMeJ+PqQstQDzvP0ONLfOScE+b
         q9PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+tgytyXLUqlwy0kxrZqnbz9OvTA7CD0lb/1WW+y13FyVw+iddYDkIcQ1rK3EB4kzw2iFLsgB9KXYA6blt10bs@lists.infradead.org
X-Gm-Message-State: AFuF++lID46zhoPbkZRgMPfrT4E8AuUjYiqNldqaXwPZtwxf/PPWfBMw
	NUVbTjZ7HuuLkRyeRKmKtiIez5ke50gyccZ7b0WenTT5Rb7x7usgpK7vf9NeJJgqQKeF8/xXl/Z
	Py7eVGPhiHMtsSZUPXAcZj8h0av8T170=
X-Gm-Gg: AYBFou36otLiXTz1Lb9ckiNJRSZh2qjDDCykJPmclyVMZEIKzroFEGsDFTwlniFPKXm
	sHr41qUY9Wbt7rruUSrSED54yLH5ZMwsCpUYZyXdeaIi/z2Vm0voeRoEs2gJ3jsPzr5XO2jxu2n
	GVi+LSNCiL8IyJfxf+nx0XIFwE9hQqXXih3QynrzN96qkw9HtrMqVrglMQxvj2M0/yM3RsuepM3
	ndatrdDNCh+Mqz7SbK61ebDrAuVwOS12Ie57G97iaotqdptiiD6kR+4/fgLD9zfsGOlfTsUc42r
	Jt3IJzKUfr0iKpd8zmqyY9T0hNvZ3XEL238H/QHkdSHHj3nvmutym5oq
X-Received: by 2002:a05:620a:4008:b0:93a:7bc2:d75f with SMTP id
 af79cd13be357-93bb790da17mr204175585a.36.1789543078899; Wed, 16 Sep 2026
 00:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260916070631.1965713-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916070631.1965713-1-vulab@iscas.ac.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Sep 2026 11:17:49 +0400
X-Gm-Features: AcwNN1VnmMXQfeYvkGasjznx5Qwpu_KfApsjjbpvaD5udE_w8aTgwLskI1UsZGY
Message-ID: <CABjd4YzNzZ0nnO4Xgw1JsRHhj9Crc6diX1uJnWHpHvd6BcPk2g@mail.gmail.com>
Subject: Re: [PATCH 04/20] i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andi.shyti@kernel.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@prisktech.co.nz, wsa@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_081801_800012_B19F05CA 
X-CRM114-Status: GOOD (  19.92  )
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

On Wed, Sep 16, 2026 at 11:07=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> In wmt_i2c_probe(), i2c->clk is acquired using of_clk_get(). If any
> subsequent operation fails or when the module is unloaded, the clock
> reference count is never decremented via clk_put(), leading to a
> resource leak.
>
> Switch to devm_clk_get() so that the clock is automatically managed
> and released.
>
> Fixes: 560746eb79d3 ("i2c: vt8500: Add support for I2C bus on Wondermedia=
 SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-viai2c-wmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c=
-viai2c-wmt.c
> index 2cf3cc0165fb..74ca93b44347 100644
> --- a/drivers/i2c/busses/i2c-viai2c-wmt.c
> +++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
> @@ -117,7 +117,7 @@ static int wmt_i2c_probe(struct platform_device *pdev=
)
>                 return dev_err_probe(&pdev->dev, err,
>                                 "failed to request irq %i\n", i2c->irq);
>
> -       i2c->clk =3D of_clk_get(np, 0);
> +       i2c->clk =3D devm_clk_get(&pdev->dev, NULL);

Maybe we could go for devm_clk_get_enabled and drop some more
boilerplate which follows in wmt_i2c_reset_hardware, while at it?

Backporting this to stable seems like a stretch to me, though (it's
quite old code, so there would be quite a lot of backporting for a
rarely hit resource leak).

Best regards,
Alexey

