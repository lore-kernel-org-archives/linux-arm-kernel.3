Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24763CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=; b=SuVIF2DjzzLgSa2gx5dRv/FAF+
	ECgLdyJE1oa5ekXYAXHbEuJJDiX1352UvNx5P8eCnRp2vi8IH6U+Lo6QFEYb00FerowYH20t6yQmD
	0aXMdo48FoTUr+sQ3x/5Q8ZUKC14OnwYFOOlUrwWy936S7vjVU8e6jDcpHROJ2YpEYtaCFNpsgZzc
	U6m/shyQ5hKiL4FFO2mC6I5iy0jB3u5rYMo9Poc2g6+IBFx+k57Fomb30Yx3ouUCiyJnl1O4aW3LF
	JFrPl1118Zc6Obe733leT+50wn8ARYyyxNrNgqsb1UV3A1zzF436awrGB6UW+RxMu12E7+FVOJ3+R
	k054QL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbr6i-00000005bNq-3PM8;
	Tue, 23 Jun 2026 02:43:24 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbr6f-00000005bMz-2bZl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 02:43:23 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-6611689dc10so6247450d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 19:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782182600; cv=none;
        d=google.com; s=arc-20240605;
        b=OU7wo+OmhroGy65BWsidAacZYJknG9V/FOHwOS81p5GfbPktCOZTpUlUrpmPxMRQEZ
         8902bsMm3mdo043pTmtTOWjfBJOsGZikG1s+EiK0dsZqwkcuEdON2IacnClEiaUZZ3K/
         bkaf74TNt5w24j4Fpy6ccDBiPhcScLremwtGY9ALsjX+gDudxZYwvFwqPk32DBcBbaxU
         LldF2RQ4WEZ7EXb0r5PhOLYcDiM1JdmtlwUNEOdbjkCNPJjxZKY36kvGG6XNDEe5A4X+
         frEuz60PjdLhh4KRYzNZH4+Ij5NNbjFZkt7/o06tafns8PGSMhM+066X0oWh0XpSUWaI
         eQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=;
        fh=l8dJF9+4FzhEOmSu8RISZngCkFR25YecOGDYq7urL2Q=;
        b=HrcFzUq5c9OfiGRo6ltMgtvwZjvw/nrJj9hPQ5IILC29GQjbsDTL3yyFZjdYwjd9Wf
         o/JP//5wz802jL2rDvLmOqAzbEV4pX79b6aEDMYwU/tSVK9KJz0GAT9hOEi5tWMP8SVa
         qTsEcY5ZP2+Qm4k4oLmqkbgyujEAj0VtdQKmdM7nmA8D2fpzM48AEThLjt5hd3jgZ1CJ
         A3L4vEjjib9nYjOwFNFFIClPxnxGxx9cbYJAjhX4/iicq7MbzNC0zYUbodmt2W+W4s+v
         mskTPO8PDi5Vb180v9HxwhRWaj2bOAPnvp3PYjokU0RN5d9SCfYltYZQLD9QgHSQVo0V
         bnFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782182600; x=1782787400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=;
        b=cDaMC14trOztdnYk9VabKmOYaSpDMoGXeG7oOnQK+kk8dxxI5bZJUKvQ48TehgOrM4
         4PgRGDRmJEJM/2IcDezrlgfjXx8U+acBuJtR06mEPLxncyu9WPhlVRqkrKk6HjnS2C88
         LgiuucEokS+HA4fSz8VEACrtvmfrsjEO3jx0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782182600; x=1782787400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=;
        b=kQK+9eiGbZCo0BOx9B5DrEQC03Ruio91d1qfwYzHNPlbXqYzftOlMXm68ZoiKhJs+t
         1mOuiOtGRBaev2peG0yJVRm98gpi4x4KlkN8o6UYEfyWNIsjaHJKsrtomY9ctDzPqb16
         EJL6nIP9Pg3xdmSev9rchdc5LTzihLOlgzGuj9L60Q8DO6t2rq26AGPne0tFuBaSLJWB
         8FnnRN9IkKU/Y1DDaQWuGJ/sYar31qj7qHfdJfOZ5a/+V7k7Ju/qrfTmy6UIY63j7vmW
         cLO3+9aNDreOb8IjvTDMTL1UrxmAcKI1ZRcWVidlIpqe5VC8QYFsAkoPmuDaKflRosID
         ROxA==
X-Forwarded-Encrypted: i=1; AHgh+RqB8qSCLZtNmykn5aXxej1JBJlKcNSaYpVwqeVxo7EG1QjU3KYyHnx7VX9JQJiqhs+XxjDRT0ymRHHktSRJ+unn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw57ZHQZMeoDwJbqM+makGJodEizdgIzU40BsXOh1qJo+FDAebm
	NQgD0w5V4t9rkUsJGF/hbWCk+/4XBp6fDxvT5L7+X16E6ANWhJ57S0L/IboGlvMTq16T2Pt3boT
	sDRuj7/hjyP11RXBOyxx4vKthCgXH+iCC9GX24Gc/
X-Gm-Gg: AfdE7cmiNy4a9eutFsfJbmdVCd1KbuR7VH7tTb6o7KEceR0PFx2p9qYhTdlcpAhd4Ke
	yVYqcQZvw6RROzrTMdH3Cwafw70z3xjbNLPn0DeDqwXWLsclI2nXdKONTy5vT8GS23qMTAH06/4
	4pm+SNsaO1DMp6sfXo1Qlp5DR9iZrA1xybIjEsT52WZTc/Aq3zH4r8lXncswdOaoJ1bqFFrhLN2
	1Vr/+9tkj2VAdM12Hz1DdkvrFdDZInIeopOcxy8LTKFiXYF5TB4T+5FaCpfvuklUJ/qwBGq4WBL
	Ljc143ibowSr6JL3zgKImGu9MrQ=
X-Received: by 2002:a05:690e:11c4:b0:662:eb42:dc36 with SMTP id
 956f58d0204a3-6635a0ee70bmr952581d50.53.1782182599767; Mon, 22 Jun 2026
 19:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260623020648.112623-1-fffsqian@163.com>
In-Reply-To: <20260623020648.112623-1-fffsqian@163.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 23 Jun 2026 10:43:08 +0800
X-Gm-Features: AVVi8CebahkQKZb2FdRCklbGMPNxHTzKHNXd3WHfoR4Viwxi8rANQUWPZkq4K0k
Message-ID: <CAGXv+5E-QDOH4AT-QTp4+Gq1iNAY3DebG91MigUfasViLBRfRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] PCI: mediatek-gen3: fix unreachable error message in probe
To: fffsqian@163.com
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	kwilczynski@kernel.org, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_194321_707804_76D2C9E7 
X-CRM114-Status: GOOD (  19.91  )
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

Hi,

On Tue, Jun 23, 2026 at 10:07=E2=80=AFAM <fffsqian@163.com> wrote:
>
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
>
> In mtk_pcie_probe(), the error handling for pci_pwrctrl_create_devices()
> has the goto statement before the dev_err_probe() call, making the error
> message completely unreachable. When this function fails, no diagnostic
> message is ever printed.
>
> Reorder so that dev_err_probe() is called before jumping to the cleanup
> label, restoring the intended error reporting.
>
> Fixes: 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

A fix was supposedly already merged:

https://lore.kernel.org/all/20260512103347.1751080-1-wenst@chromium.org/

ChenYu

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index b0accd828589..5d7cfed44637 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1222,8 +1222,8 @@ static int mtk_pcie_probe(struct platform_device *p=
dev)
>
>         err =3D pci_pwrctrl_create_devices(pcie->dev);
>         if (err) {
> -               goto err_tear_down_irq;
>                 dev_err_probe(dev, err, "failed to create pwrctrl devices=
\n");
> +               goto err_tear_down_irq;
>         }
>
>         err =3D mtk_pcie_setup(pcie);
>
> base-commit: 4708cac0e22cfd217f48f7cec3c35e5922efcccd
> --
> 2.25.1
>

