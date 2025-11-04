Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE71CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeY/Q1vjgJqdUpxoN7I5OLtGxJW4ljCXvqhX1XWJkyQ=; b=QsgtPrbPqL4nD/vm+WQBwQvyv/
	tAz2R2ovkwkwAUSXKe47W7nJCXPGfroy/m4u6IgnD5oBR7A9zrcO7bpdzBZdARgYCk0C3kD3qjrFd
	+hlaxfnEtE020DiuqRiNzcg92dEYVH5CVaVGqu9pMjTAf49Xz8tRUQ2oUdgBiWqO2yPjvU2tajsgF
	whxBeJuxnZmV+kf9oOM05jdcS9Ogi9LWtt7WBuCnaa29jwZZ4hv7/CHy8nPCm5le2a78TQUVW+J1J
	hEQKk8R0f6gRmlCCMPxpZyhEa/8Tmt6mJ4/Lj/YvRJGd+nmLmLiSct0U39afqhprRbjTRnNftP3ZX
	hQ77WgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJz9-0000000CCWZ-2tqg;
	Tue, 04 Nov 2025 16:34:19 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJz6-0000000CCVJ-2rKs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:34:18 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-63d0692136bso6204444d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762274055; x=1762878855; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeY/Q1vjgJqdUpxoN7I5OLtGxJW4ljCXvqhX1XWJkyQ=;
        b=S+n7xf209gwXJsZoXsWq2+gZDvMiCOBlIn9Q30poHpLfdUL0JBP+i6V1+0pzVVD0ES
         LlIV+/pu22jHAGeiDUHtJbDWZEXmqGthzaLzdXsWKTjymkwC/DWuw845ST0VdZIKbKDW
         aw1YHV0y5dWw2gcYjiaSJqkycejAkse+O25YE3EFgGDfpfu0DZcIbp/HDjff4osDuWuQ
         giRqIEQOEuhUJeCN6fdlKYhSNPFiSa1b9SN1yj9efK0jM8so/vmp7cm/D7EQl7jMJlTI
         F2JKj2Ol9pAVeoD0hyGvwixFoDlYoCsiob8n+f6s0svMID6u1XGKLDYnQDnd0UiPfbdw
         IVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274055; x=1762878855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeY/Q1vjgJqdUpxoN7I5OLtGxJW4ljCXvqhX1XWJkyQ=;
        b=NnbPC/oDOMUGhiXfoMj4pHI3rWFU9yxnAPEgqoy9lPxTEzPGE4kk/7771Emib7qGnO
         ZSMWHiRr8WSDPHo7U0asrC/HGCAwcKT2dbHHIK4fcDTd1tyozG6rjmhVODQAsnuj87Gx
         MkqQNptmI5LuwrmiU7+jXwCn02q5B9q3zbrMUBDzApqGE4GM1rOXvP9bAGqjoJsY1flS
         OOFyuwhLMxnAvlFIldbNX12N5t2pu06jcE6mqAjAWrKRPZSgtY3tsaSoB6xX6D0gkLAG
         6WGCNsDow5P/kJQShE6nV48tJnEYIMBv67WtPoCWOO1V5Uxk15eXRd7YJZ6m/ZcFDRWs
         z/7A==
X-Forwarded-Encrypted: i=1; AJvYcCWaBZkON7s6IUNcmKzTnEtchwF1luO51jTW3e3EMRlyBcq9v5LWX+bjOTUTCh3vScBMQ3uX9dX3frnUQAbPIq6D@lists.infradead.org
X-Gm-Message-State: AOJu0YxxXyLlnhIC3c9RL/GNjzVh5ihEYuiy2OwZ8DibwmcsC6BGviXz
	5QY4ue0FnnQS02qsuIoRT61958MJ/BQf9zYNu1O5GE/KL2/pCXNqRpuxbcTkp19DFQM7vpjyEaR
	4nPSfG8drfCoqghLDci3tpgRJcDhmkdQox5sQEcK1JhWYOjSIVDyR7oE=
X-Gm-Gg: ASbGncuxjz+oBjO4GBow6qZgfzsU9q5RpMiq6aIcexUMQ7Vg8D3HBBwdURT3brsrUAS
	Re0zVoNBO9wfzpn2digG+dRHyLnNrkMSGhj1Nmw5g8zCkOpa2gKTTvSZxFosJJTHJmbRX+uZN+Q
	8HM9DOVJnvxPMS8rgNcDIn6ZnChPbsxCeELqHH84a2/FLkLP8sZ07aVZCtfuHhQ42PiCvRIhTCQ
	sKJss+LVfmAiQvhqMEgeDgunGBJTKhyppbD2DU0BoXwmvuWCoNXFc7bw7HfbA==
X-Google-Smtp-Source: AGHT+IF0Z/yNF7yi6Lz9tQRkNyi37+NTyOPEnzyNmvGQXNJdjD0tMjSSXuyBHzY73wkfo4eUOH3v52Gvr3xMHkvavMo=
X-Received: by 2002:a05:690c:4882:b0:786:802b:d7ff with SMTP id
 00721157ae682-786a41efce2mr752787b3.59.1762274054906; Tue, 04 Nov 2025
 08:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20251028031623.43284-1-linmq006@gmail.com>
In-Reply-To: <20251028031623.43284-1-linmq006@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Nov 2025 17:33:38 +0100
X-Gm-Features: AWmQ_bk9KtCzO_f_YWM_AynJxSlgpLBL58lIquCitQc40-GRB32NM5WebMbg_Tg
Message-ID: <CAPDyKFqiNeO==u0j=VTKmWaG8VdMR-mS84QoLjrussfMYrr1mw@mail.gmail.com>
Subject: Re: [PATCH] soc: imx: gpc: fix reference count leak in imx_gpc_remove
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lucas Stach <l.stach@pengutronix.de>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_083416_727853_659BB22A 
X-CRM114-Status: GOOD (  18.21  )
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

On Tue, 28 Oct 2025 at 04:16, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 33991f3c6b55..a34b260274f7 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -536,6 +536,8 @@ static void imx_gpc_remove(struct platform_device *pdev)
>                         return;
>                 }
>         }
> +
> +       of_node_put(pgc_node);
>  }
>
>  static struct platform_driver imx_gpc_driver = {
> --
> 2.39.5 (Apple Git-154)
>

