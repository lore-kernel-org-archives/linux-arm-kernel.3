Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAB4CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=; b=H2DxkvMhYfbVTvz+9tPoc/BdGR
	klpi76F0mLY9Y7dJ/RBxJ+cUEpwDfxNPqJ4Oaths/coNq+lEJuZypnbX1GLqFnDNRlfUCi8ZGO35M
	uXi/1LmjfeSrLlVPWZbtD5gLVQSMzilPR18ziEhEVetDRvYkqAY+S/uo3TV0UoxknV6IVOKMWs7uC
	wKYQed/Fh56aYWELSSc2ugPXTAY/oqkwWYdTSgO6iwLnS2DkoPKCVBfLkXzzs5IZ099V6rlyT7EWH
	PvzLqknl3Sb5FbpXY82a4SIj4oZU/DqPc4Q+dr1OOP7KaZScfQX6ZZsQvhG+QXSit6DD0RPwjz3bD
	khRshkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2io-00000009AyV-0W6R;
	Fri, 12 Sep 2025 12:17:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2in-00000009Axm-1eMM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 12:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=; b=OxDU/YWDGCjRV25f+mnxP/3nm+
	KIDJQuG+FYXg4WK+km/HJl64cZ0EkxejyoCOaVMg4o8cr6L9gYl/bi3rLSS/UjAYXq6zSrQZaNq7R
	layauKNhMAs1XKFQ+TfLROydIpaSXL7mwzfPqdRZTXPyXpgTBviPWUVynwU7FTJsR344erOubBqOJ
	P9pra73JJ110ob+O8EWrSRkGjAmMs6dheqce9SNgBCNwt82HG1Uf3SrDYWVBuWBrIcxuH0YIhjzil
	UYtfgUvU3+AFX3JaB/bLQlMFD7CRK6lBZh3sRIi/dxPCO/2nrAERB4TnPj5ES3YQcH9TPCA6OlghK
	ghLB41Yg==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ik-00000006MHq-2HBl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:17:44 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4d118e13a1so1318540a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679460; x=1758284260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=cgVz16GcL9f2aBsFMf+itSiZb3ni/8QHHbnmOVKzE/qJo2TjEUdCrKE6IixC5ZJPGd
         gLYSLwoJt7vU+V5vSOHIpRyVIg7GoNWtBeLjBmhOcYquEZW9ltFNrT3h1ovD2z32XwJ0
         XXXXC+ZZGgEhy+bXjioy0iOvJjTKvVYPQkLD89TlAQKznbZpEbMcpjRxRGKqIOJCtExR
         rwp8QQuR/avv0RY/ZtnWoYT2MqeYgj6Zvb7ULBSQCYWhpAEo+rraO+pdpmRk9Myd0ZQc
         /ssjz09N8GLtFcDQjz7k8qx7cuSqwscTXjVeV57oJi44KFYeDzAl5rNIvKQ9weSOg53N
         cN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679460; x=1758284260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=bsFFf0/R6vWi8+ih5JI9+QhiZFZuaBWI+XyHlWo344l+YOlxDmP0K5TROgEFuuCSyI
         yxMOzqbrstScS+1P9QaRFgEve4imbEqzPMcIQGNzSTIUOwun3wfBcY/PxCriqio1zsmz
         ZjKnjk8zZZnIbGc7As9bp0I/zS0XmHCknbw2hrqnNJDSXFjjUdM2l6nE4KmpE2YQOqDG
         F4ezA+RDJL1310f2PDyteCIsFKTpEFt40S8tCkrBq1uH7ghT2IqdqoYSowDuF0ZQYlds
         bbM5GuyimNergZJFrs/kKuZ8AnNpB5ZAVzdrLUv9aXsccFoRoIsDZxSXXW20Tj3pwzux
         bmnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfP/t2s33Q1Z8teZHPRIOIU25ami39nin5yIGOYsC1mts2il0QGnmwixK5BPNAilrJL+tsivIxXEiB/11fFDmX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5VAKQo0hYs7q5RypRYQJxCfkxR0gABngYKz2CazfvcODmetdh
	xNcNhI9H0pJlig209y8MnhDJgaGtjJzx8MaUHrid3HBonWrWuRD3acCjjilvrQWZVVuFFZxKegC
	/X9yFDfpIhFYVrHYngsvlxx1xelVa41w=
X-Gm-Gg: ASbGncut/2Do8VZFyrPo5PVm/SAY6eB3PC9wQ6M0gJu+hpApZ3mpNvUIUaucAujRbBY
	/mRAb1K3Cg+EL59sG6XtnsrdsTMElJ/FGmpn21qMwY9wk8L6DeYcvAID/36p8VAvE0n8uiWlRZC
	IKkjikrWpdKcCLcPOjQlabsLMeawQN25Creq3SZvbjT4z7JRPFyEt1Ww1Et3TciBfn4oNAkRb1H
	XhD3A==
X-Google-Smtp-Source: AGHT+IFwtZ97HGjsQnwDLaSscYiXyUyWaZRXiTzaM5M046FWDXCWxB8k2YOnMd3VJ+Y3cvmtimQrX/EgHhgmJ4CE7Ho=
X-Received: by 2002:a17:903:1207:b0:24e:7a4a:ec59 with SMTP id
 d9443c01a7336-25d25678b88mr27471845ad.22.1757679460088; Fri, 12 Sep 2025
 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org> <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 12 Sep 2025 11:49:01 +0200
X-Gm-Features: Ac12FXy3daR3VOEp5n6tNwKkhCq--fDPiLYS4w-Toaa60ZTGN2VkMzc0b_ryiUA
Message-ID: <CAMhs-H-1VrKiknwoukGY2i0ox2VNd=pmFrMcR50mn7tEZ0pZ5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_131742_709917_0D49D0E5 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, Sep 9, 2025 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

