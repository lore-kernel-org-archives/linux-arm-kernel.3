Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21927EEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NjZxR7n/i3V7hLD9I4rLfeAHHpOdNccUfDSk4/Vc7I=; b=I34ekgT1p+2vN0pSS3uyo5euHm
	U7xkh89tdDBitRxG0nQGpePk00xDYgmaW6OcLuhKsTkiDKZkNOYAPaUOP7taekRt8FS3oR/KtuFTH
	SUj91kQjVMojByz6+IMFwB7FEaL6CADxgYvkseJYswvwmNOLZEXVpNCGFouysc6E11QQoLTp0iBdu
	9FgAOUR4aLAhoXiA1rQUMakSNdIdBY/rAXENWHksuZwsPJcNO3stJbRWyHLd38JPmoDPdUb0e2d5E
	P2GO/JGnIMLW4UxhWo8ur/+7+ET7+Nde3BgsNwP4Yn6rMOGmdnT3709L+9MOzvIFRwwj3qg0fXetI
	GgBn6u7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRIY-00000007bsM-0YI9;
	Thu, 01 Jan 2026 22:37:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRIM-00000007bq3-1kfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C214443E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D94C19421
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307045;
	bh=4NjZxR7n/i3V7hLD9I4rLfeAHHpOdNccUfDSk4/Vc7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ldleX95IA/Rhvnga9zhFQWYGX90TGGbu/MedExFGoLKzVm9VARMh8b4CPjo/2oO4z
	 uKiJMDiRPe8vx9Ae2im5rgASh7toMyvrp+3s8uV+b4s2A1bo2kIMVdy/np8WxJ0nFF
	 jpnUfQKMo0eZWT2s3O6705wXXVNYU0bfvpsidNKw5cKrp6aHSDERDTXmzczKXpTR+H
	 tz2TLU3He7TUxiY7sjfuAbq5j/4OEo5k6fbMpAy+E9hoj9Y5cZ0GOXDFSkbrB+HL+d
	 0Z0ONjr6g5QbbGc3ZTShvcyOdNkauf7dciFEh9mQ4iBPiJyTohSkKFEEp8kOKXbz2o
	 SyoTt/wvt2k6Q==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78f89501423so131321617b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:37:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVU+v9Rzv43cOyi+tgD25EsYeoGaBI0F4DoZX5JBJ02T/zIRlglK9arh0ovHa/gXm6YvW6c+TIreQJTk90h/KSw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/HO/I71FBIX0ri0kPogzz24TzcGKi3LRTUGmzqhwn9jWI9Eqg
	uZedIuNI5rKWVvj0ls2M0K3HmX+quKOTcVKkrg+sDGMRs9+yoz9LRbFbY5JDxlssDuTQewYkYsY
	M6P/n2LM9zOU/jnxX2mEzpCo8FWizA5w=
X-Google-Smtp-Source: AGHT+IGxfFDsTCRV20/MitXOg9IYsjIgYuqKye3DeOL8wH03xNmqZuWnyqOfWZ2rc2d7AeH+J//qkrFfgP8RZqpfLp8=
X-Received: by 2002:a53:8585:0:b0:644:60d9:8661 with SMTP id
 956f58d0204a3-646632e1cd7mr26165537d50.45.1767307045252; Thu, 01 Jan 2026
 14:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com> <20251219-gpio-of-match-v3-3-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-3-6b84194a02a8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:37:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLndAvhQC_pxU7fU2DgL2HyosfNQqnTxVXrm4uLNK59y3A@mail.gmail.com>
X-Gm-Features: AQt7F2pIVe2by9dHgGDwlRyH8hysFAWe6pLdQf74mH3djmHANQGvVjg82Ayxg4s
Message-ID: <CAD++jLndAvhQC_pxU7fU2DgL2HyosfNQqnTxVXrm4uLNK59y3A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: zynq: Simplify with device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_143727_052613_BDC44814 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Dec 19, 2025 at 1:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with device_get_match_data().
>
> While changing the error message, switch to dev_err_probe() so error
> path is a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

