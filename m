Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F31CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=; b=v2arJSjuGWQ2nNjRk+0CXVSQTJ
	QLtSJsGTuK00KIbNYez1n2rx7mhHR7dHs374TA4G72SHuab67Vvg9UfEnx9VmrFm/HaHU6HuBjnYI
	+e4/btCeDTJNG1iVQlHga09osjxkrVO+5vvU4LLKfbwjxp/XRFgIKhYlZkKLKJlAUk+dFoilmSolS
	B5Zs0MqcirZOYiEhy71PdqzauASPzHNsAFRdE4BJW3p5nHOi+shawkTwPx0uH0kiKDFdN21aSpnwo
	X8EFZTVHYmbTRx7j3os3AYMbwNhw73w/XBh2Hyr/4dG1rBhh2AydIj0LyIKl6c0e5zUl7RJfszDM0
	MpsQQqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xp-00000008qg2-1hbF;
	Tue, 09 Sep 2025 17:17:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx71-00000006xHW-0MXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:06:16 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24cde6c65d1so41280885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419574; x=1758024374; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=;
        b=NhQO1q7agVVFXiFbZaIgGIGwZnlE2DuNxRgUBXUs7gnNFXebyPHcHvplC9ST7V5j3f
         u4m7bVs7zVLbL+vYyixw3znBaLaubCT3cU6aRd2wIIHgP69i4EmXbOUTMPL3g8sB3NB5
         9fEHNjzRr8w8xTPXjgW9rw/RrKbGu17+uMKOLwOtqm4VTvSuOr40r29avzlQIDKdhmU9
         dzC+H6FL0eqVun2aN06InYNOz7yIPYcoUa+nfefdwH4o1qM2lhBORmNqkbCen3S5JspG
         1S+AIKdBVTmjSl+ByB1JfOhJOyswtg27LzWgJm/LlJLpK9uSxnuzA96bwG+tRV02nOFl
         Z1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419574; x=1758024374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=;
        b=gO+aeC1efWx4PiiZ7b6YDxVG8JiY43KQWvVivwBC5wx8/1mY1bv1SwewVKSDk74+WD
         QSqVf/6R/YJN6+0f8ig1fyZq5iqleFWc2x3Oyyh3vIMq5Udllpq7wgcqUKV6qe/cHdSD
         zB8n5fqjNR1UGUQrgKsjVdCpcliuVU4ONcPAStu2y0KdZ2mB3PUc4/nXjdk9Zy1M8thg
         fZvXz+o0asW3nvMG/k86Z2MS6+nKCmbCmhVOWUf3pVDmahhMuk98cj+by9Z1K1BzvQVA
         b9h/wE3YjS6AsPCLrwq2FrmDAyNljUIZWW5I/zjUqyp9NpcAs0mpvKCAEeqLim87w0vr
         H5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyTZPv2q3yQ0q4c1TfWW2E8/Jjkl/nPd677eXVKfii53HWxiEiV+fMXiGF7xOOP7fRMqQzyrYpuLFNf++iJXGn@lists.infradead.org
X-Gm-Message-State: AOJu0YyrvS7LavPDn8qeW4bQJnZzxAF8NOYftKP0tQN4tm43HYrSBfQr
	qixxKwLTgAV20dypsbuhdxz1Wlu48WjcurRLpYHtX8mMB8Vg08XLJFo1Hcqp4sSycU73oYzxdT9
	5tHkHdvF805YL8Z/sQa2/TU29UPaNqqk=
X-Gm-Gg: ASbGncuWNfiGusgpxmfX1lIOnr3SJ2AyulRnsyDDaPgDio7Gp4+A3iF3PL5qXnGQAHK
	zfhN/8yJFavS10rklaYi9of4xDL8McfWAxWbwyqzoNjetZxWfGo6qHu43BuxIYU3FS8BjHxcwdu
	DtiHtTgmmpSLGWWGhSjc/Tmc6PClqNfW5qjvYgNhud/IBh6n5uGXD3Rdhmw8qbSWRp2UuIPl/sG
	YAp2XBpzYLqLOlR1W6XsOhbgOYuy9XBcigBzeumDet5i6k=
X-Google-Smtp-Source: AGHT+IF0E23UFEub2CKYrBfDrjLIfLkU4iafJArDl/DfkMDOfmcBH9AaefT4iAXaXjXQyR5D9SnfU06+PwSFYyE7+Ks=
X-Received: by 2002:a17:902:f684:b0:24c:be1f:c1f9 with SMTP id
 d9443c01a7336-2516d33d2demr127944945ad.8.1757419573988; Tue, 09 Sep 2025
 05:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Sep 2025 15:08:24 +0300
X-Gm-Features: Ac12FXygHbi9xw84Hag5OJCVb5BcG8TXx4Q-7E41-mn1lRl_A0XLq_HSPq3mWfk
Message-ID: <CAEnQRZBW1vfKx8DqV9iJEb6vhWPZ3=szxV0NDwW5h6+LTYLpvQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] remoteproc: imx_proc: Simplify driver by removing the switch-case
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_050615_128294_9FB8E126 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Sep 8, 2025 at 4:08=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This patchset serves as a preparing patchset for i.MX95 support.
>
> The current code logic is complicated, with mix the usage of switch-case
> and if-else.
>
> To simplify the code logic:
>  Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_m=
ode.
>  Each imx_rproc_dcfg data structure is assigned a ops pointer.
>  The common imx_rproc_{start,stop}() directly invokes the plat ops, no
>  need the switch-case.
>  mmio/smc/scu_api ops are included.
>  No functional changes.
>
> Thanks to Daniel and Frank for the help.
>
> Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops. For SCU-API ops,
> I currently not have a setup at hand, I will give a setup and test
> later, but everything should be fine, no functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Thanks a lot Peng. Entire series looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

