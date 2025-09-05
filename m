Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64777CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=; b=HpvrRgI+vWU+tX4UQGmy+6xiH6
	l3OC0y+15r3HJMSEDe+sFE/UUktAhQVREKX/l3wVxchE8J0pikAIjNTS7YjQPwa/pszZXVNko+vfH
	EQkB15IsOFpkP3a1lggh7gw0m1CIZ27w3gHbN4zAOG1M9G/b7NBknfDcAisjHEk/CxuXZI/YCs4v/
	1GiPCTwf1AFkmEj1/YtFbkMLoF6NKxFqbb+u4lSVwRfhNzRBOLeuBVvefRs87UJPamRwuRpPABfhO
	Jrp7/dABxInLNDiQrvRz72Ups25pu+XIDRUM3aYcozDXFvk+Q4QksFf+U56BaQjKLdljoOG9j5Zyc
	mlGjnJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuS9t-00000000UVd-1FLW;
	Fri, 05 Sep 2025 08:51:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQoG-0000000HahQ-3CLv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:24:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso1733255e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757057075; x=1757661875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
        b=V7Sermg6XtTM9qTfMZ+R3jKM3CN49UkVGOBYLKE8xRmWU4UohceSU0reRe9t/+u5gV
         4DeDShfDCn4GNPh+6jswH54us9ORMj/nBk3WZHLE308naCT0jQwEOZrGnK0MW3R68fFL
         uUr2WuevVHu/3qoLGg/Lj32cat0ahl4aj2U64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757057075; x=1757661875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
        b=b3ixTfAQQcMcbE060LHiiIZ4vpCBEt2LtDYX1boBq5JMee6PzbwnYDORyHRtxCkMlk
         WOH7Gk3cPUH/bycPEvSWUk1fvKS6Mo5lWSc5DJ/DM1IiZcFFfjTWD6UK9IlqhRI1LxTG
         QtUjJpL3reDhQd3TmxzEWL31XfNVrgSvf1hrN+gDNUl059X2jp/0s7x691Csmpz+0RWe
         Yq1VDbTwzwNsAFJ/nEqaPnbk7ACzfBRuk7PqJJyttEncrtq3MEYpz2yyfs1DfnPFjvpV
         zdGDxh5E7RWRi6JPUwP/F0WE3rmRYfOpz20tnSrXU2e5h8hooOM2QaJHBeoEsySxBYvc
         pQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUbncFyyK64xMtTxIOn+i732/ttoqCA+qq06+NxuIoq51YV6VlgLV7qJgizs3xBpaHcUKz8iU8Kzh95csuCdLTD@lists.infradead.org
X-Gm-Message-State: AOJu0YxTbPJKiTkKL564mK714SIffsbqQj0nClQntU3FZnsUa+x5TnrV
	0Y3CsPX5h25hcpb3CXvHqZMiSdB+ngWFi752HJgZyaVoDlwfiqnAfm1HIof3nQ30Rw1ZZIfDph2
	b3wBpsCGktVaZFLyZIwCXITYONJPMh2mlo+vx4Wc9
X-Gm-Gg: ASbGncunFxjk6w1M6eNOZuYagiYo5LnxEO5UJXqAt/bAVGUZhYOjeCDC+htZm2XUKiv
	i2lLxP0e5/TxDaHbnshEQ521GL2mbwdD7K2v001r38z8g4SlgT42qtv3X/AK6y6h5t5/dW+xfaT
	J7U0DgPyak1nDq1LH2NoYP3I/os5b7HSVpDvd+/xjRvWop/+Y8svdpgPh9Kmb74kMYu0zre81Op
	mvqdQ7Aky+yRxdm7bTKSzW47kF6NBxfOBdepVRzgR7NOZ0l
X-Google-Smtp-Source: AGHT+IHsGV8p2LrSQ+5ebPuG3MwZsxnB0+XdK0d6HB4AboER/GhIXoUDzaGFZTbCNnePZ5YQiB7vHJZTSeMi3MgtzZg=
X-Received: by 2002:a05:6512:3d11:b0:55f:4e8a:199c with SMTP id
 2adb3069b0e04-55f708c2538mr6024739e87.20.1757057074896; Fri, 05 Sep 2025
 00:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-17-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-17-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 15:24:23 +0800
X-Gm-Features: Ac12FXxXPTzm9nG4j13NbvkvAJ8eK4LgCQVwRNdKf80aBqhtT_PDYtc5qR-IPds
Message-ID: <CAGXv+5HjrwPJBC-wina4ZrQe_3FBWcyZc3e+iaCCmNOKfMicsg@mail.gmail.com>
Subject: Re: [PATCH v5 16/27] clk: mediatek: Add MT8196 pextpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_002436_823800_E1169569 
X-CRM114-Status: UNSURE (   8.26  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 pextpsys clock controller, which provides
> clock gate control for PCIe.
>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val

