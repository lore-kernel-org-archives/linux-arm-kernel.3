Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA15C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4Sp2GDUfFML3x1uoKRtS9TflaYxWalc0AI94nd7XtQ=; b=mxqrLkQ6flUm9e41sPMqoWTjnG
	sfm4ckjl1l79xXXdbd+TGWCNZtUCG7zIrtg2z4e2qVKCYfJ8MrvjEyk6rcz+VQ5t+vcVLjDffu4qo
	uZJ27QuS9hk1sOrYyIm6kMsYnJF34km/UijBlkia4Q7tJg/h8Jw8nUO5XXypJcOYyUEH/XhShGMu6
	uazA/vdWsreGZowlNvWAo2Gj+Wp5rco1onECBT1Gz1Bo/urBPtzIuwu4bJc7EmMYTJx0S+IRFG3kF
	Bv3Q/kDYw3hki7sPUMa1dr9lyyIwJNhEzvK5EU0eLIyueYtbfX1JhkJ/WYi2nH0DBp0akcHhA56dV
	IvQCsBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhLyd-00000002wGf-0VB4;
	Thu, 31 Jul 2025 05:37:15 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhLw9-00000002w4u-1qnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 05:34:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so437986a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753940080; x=1754544880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4Sp2GDUfFML3x1uoKRtS9TflaYxWalc0AI94nd7XtQ=;
        b=U2au85NK98ihPpFNNGmyTDa1Q4VJQZUmBy7zaNTCg7jEG2eDg+4o1fC3t2P8mvYyc8
         CQ7caCquH+EGYhhqzruAMbtyCJaxlrZ2bPg84NqpbBXqjc2Zp2Mr+LXO+HlfzLJmhsMv
         02P/hyg/dj5hSL7qRTGz3/+lGY3NCVgaNYxc5dzcS/vQPFJWorgWt1dGEZRjXoTaGcbS
         i2AKmxwvQ9P4/W6t8r3JrMVV1soQWKY0ZVK4aNRG7IysJ09C3fg+nJnXIfhcU7JSLBjF
         rsAtODCi3RoWissx0ohX5WAnjVM1eYUyoomtBiyvBnB5yNcty8zuwSPF3r0Is31OgDHf
         1AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753940080; x=1754544880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4Sp2GDUfFML3x1uoKRtS9TflaYxWalc0AI94nd7XtQ=;
        b=WkS/FhQGb/VJ5y/44mUr7lGHrvVRq32odBQ3/rF/1RAHnNBiH3VrSjozInuDtdMcQd
         szbOdNKLi9Ei99SFKsxI1UlR78P1tMeE8kUBNN6HJgocNcjwuHh33jta+vbTBL+7nomc
         1EkTF+Ld8nFrveCG2CefcOpe0WF16JlIOAHZgedH2w/Lh+3F+5OzkckPxi9H69Zjq0zS
         2dM3+99cx3mUkkMoAnUBMxz4TsbUJVBpVG0VkSuUraGyzoBWAPszPQJvbUCR/A7IqAbg
         pgudi7oELGaRdaclt0OxLirrdC4AeH7W9Pf6dYQ/iKSUawvlJttGm+d1oLljsJDCdxVt
         vOQw==
X-Forwarded-Encrypted: i=1; AJvYcCXwcwMevsLrkP+xZYMIaFV1yxDLn/eX4lknAFSy3eVv6W9qwxPERF1t5b9XC1DEkp7YEhO77DUnzhIpwC1aDtsc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1EK0QoZ02YMjvmsTu9YCHqxhyA4FXnix/QjmCKMDbmMR5vfJU
	moqduS8jqa3eVkAwTRxGNUBGqg6oMegvPRDhM+u5KpYr5Hsc94ulCpznKSvGDLqlBrwLvAVDaH4
	QI1iUGRGMN5rh09K+VBbGtz+rRxgCEfm4APw+
X-Gm-Gg: ASbGnctvDdslS7T3dCD2EqCU8qiSFNTKV9W95jTyl8iwjIluB90OJylFEUM6awE6yHU
	Y0B9gMeez2+b4gzYyPFBS9DPezDEKbVVZA0IT92wGbhqMCEn+IRMCHZSdBYT4ORsnDJvjkZYp3b
	DSLNn9/XspJEE8WaJUkB67Gnp75girocP0TlDgmUrzy8D3g6E51Zb00zSmwVOfCeUClQCTtZq+S
	9J6
X-Google-Smtp-Source: AGHT+IHXrxbbNNYCinyHQoskYKFqoXHqmo6YX2SFTgg5APWeBRHOh1sgrx3dY4RlljDqEABe85zpkVvrzPg+EkqADTg=
X-Received: by 2002:a17:90b:5847:b0:31f:42cd:6900 with SMTP id
 98e67ed59e1d1-31f5dd9de96mr9675756a91.12.1753940079962; Wed, 30 Jul 2025
 22:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250730125932.357379-1-laurentiu.palcu@oss.nxp.com> <20250730125932.357379-2-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250730125932.357379-2-laurentiu.palcu@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 31 Jul 2025 08:36:47 +0300
X-Gm-Features: Ac12FXy6016R5yBjERUVNjJ9NaURXNKHJ2pnztmaFYpAtiC1FehtoRDqe3M3hL0
Message-ID: <CAEnQRZC5UDTMeF==2POenjw+YK6X4rCPCH_XN1Jq+ULJLofuqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_223441_495530_D1A7C77D 
X-CRM114-Status: UNSURE (   8.66  )
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

On Wed, Jul 30, 2025 at 3:59=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> Add a platform data (pdata) member to struct imx95_blk_ctl to store the
> result of of_device_get_match_data() during probe to avoid redundant
> calls in suspend and resume functions.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

