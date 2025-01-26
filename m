Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645C0C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 00:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e571IkY7EK87y3Sunky/t3TOpY/BAarwHBxbWfeNYyU=; b=XHCB6z7lfbEKv4Xwtngxc1qxT4
	c/72CwFr5sAHg6pFsAgYw1IdKi0ea7wiDtEoSKFxEImci6CHUzVGbJVjB9uQnb67ku5TSzS1Oa28J
	EUQgem6aua7XhFhvWvn+V0lL3yb7VFM0jkk5V1y5UDDAG1zF/kx+QgpwW/fWUsahy0egSFNYsEO7W
	6yGm8oGFGkX+XOVRGOaaZL08a5Qu55MaKtsOQjnZJechRpZmqR2IGyDUyXO6YRHPjwsAYLIQyH2bd
	qhuCREBYc7DITMJI6Vr/K9G7Ps2typrJDfrBhjew4yN1O+fmNkpUivDCRwdLEop9XLXo0s0p0Rj94
	4xHlqnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbqnG-0000000H0nm-0Ss7;
	Sun, 26 Jan 2025 00:46:30 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbqly-0000000H0l9-0R6k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 00:45:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-304d757a9c1so36453081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 16:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737852306; x=1738457106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e571IkY7EK87y3Sunky/t3TOpY/BAarwHBxbWfeNYyU=;
        b=cCUaoAsIrsqmpSXXRpVacJa15waRfGxf1tDXMiKqfJxgCpBbrJ0NvtQcn+t58gGGGA
         CCmVrZxaA2rILtrgLZQntbPYQy5VEjY39qo0yUHi5rOyT1XjMK1AajBO8TQ0NJXj8sJI
         9D30dFSwpDqUdz/f0xfPmTCAtijG3tWM5F6pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737852306; x=1738457106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e571IkY7EK87y3Sunky/t3TOpY/BAarwHBxbWfeNYyU=;
        b=S1BQezPGQQ8tnj8Y2P7OuiIH5/s/76HkXXg4irSDaZBUS1jZGxR2PMIRL2HDl1ZXDr
         Um7is0OH8mrKqzVUBVtfxJDaLN387Nl9qkrzOlDNwzOvMtgvwOwrS30yGNFCEm1fqVRs
         nmpAjp2l1W6fczi0FKiI2kpMMASA7hiubfNmXDVWsX1A22WhPuKfTZiAOqObcdusdWib
         IqJX/d2mCPaYxlZqUu6MAC6XMDgIORA32hk+l2ZR8SwE/pG74Qi1LHh3H0s7KsR1CxAE
         fkbt6wt1zWFqtmBG+MSQIe6aDza/S2c7XZJUgNsjmFvceIlXNK2rlV2ze5HTQ3wByYU9
         waPw==
X-Forwarded-Encrypted: i=1; AJvYcCXOX9JXkoBNyp4poCCm4N8o2c5fj+KPPwlg2/Td8sd5oidpYilQ4O1k95ibwjW8S/aAZ/GTd9aptSMDXBZDlh4w@lists.infradead.org
X-Gm-Message-State: AOJu0YwQJffHohh+hhKSmpIQPKkaHYNmZ6G5iZpx0Cj85OZcGkoJY/Yr
	mJrQOzG9cxpnJBmpDoq8vJeCciINPs0IXOuPhsuTGzxNQV0YLuZZVsmuPqVuetgkWG0SYfzCNwu
	XmA==
X-Gm-Gg: ASbGncslgpTTXvmw65VTA95h2LOskKlsiuR9VIalGLVdrJWCWFTbxwHaTM+KtSe8mbR
	SAe/fRs9tg8MQyko6+wZfooUNBCuZmkOAXhBRHiO0yYrMts2sx+crlke0nAXfQ61C1bcrzPAynx
	BKM9d/F+QAUyJOBc7mwnb/elGrlqnI9pPB4porHdMt/ArQxm5liZnyrgUQ6TUKMRezi7kE8E6kZ
	gkVosrvssH6lpCCY41eHt1QdvPvi1acyhaAek/FY9TwVjtkDZ6V+mKVtP9D9DIlGNjnE60nRmQw
	HLAzK9kDde1P+IYcpJf5IKtJvbGeuJUFNJ2JB/rPp1CZB5Ko
X-Google-Smtp-Source: AGHT+IFNmHuMTKeR+vaVpZhIr4HotxqyBxSWgjLunlRON3E3/2ZW6/BJNu12EJO5gCedwMkpVSKdaA==
X-Received: by 2002:a2e:bc27:0:b0:2ff:df01:2b4c with SMTP id 38308e7fff4ca-30761b8bfbamr39648431fa.4.1737852306468;
        Sat, 25 Jan 2025 16:45:06 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1978esm8434351fa.71.2025.01.25.16.45.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 16:45:04 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30219437e63so45260211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 16:45:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhndLKoncmxJ54VnnekHWX9nSpvv0xEB6mcpivW4oN1EUsC0Idh22wfGI3+5P44w8WCGZMfSl1qkAUVBn4ayDA@lists.infradead.org
X-Received: by 2002:a05:651c:205c:b0:300:17a3:7af9 with SMTP id
 38308e7fff4ca-30761c517bdmr37753901fa.19.1737852303712; Sat, 25 Jan 2025
 16:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com> <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
 <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com> <7ef0454b-fddd-44c0-be4a-c81c443f08f6@rock-chips.com>
In-Reply-To: <7ef0454b-fddd-44c0-be4a-c81c443f08f6@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 25 Jan 2025 16:44:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZOfqcV51Sog3CNBe0mengYyX5cRbftdDY0e73mZNWQA@mail.gmail.com>
X-Gm-Features: AWEUYZlT8dd77sVC0SZMqkozj-k92yxOjbM1lGN9IVzDz0DDUqySb4xOYDl6kKM
Message-ID: <CAD=FV=XZOfqcV51Sog3CNBe0mengYyX5cRbftdDY0e73mZNWQA@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
	l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_164510_172359_D74FA50B 
X-CRM114-Status: GOOD (  13.83  )
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

On Fri, Jan 24, 2025 at 8:18=E2=80=AFPM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> >>>   #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product=
_id, _delay, _name) \
> >>>   { \
> >>>        .ident =3D { \
> >>> @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >>>        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50,=
 "MNB601LS1-1"),
> >>>        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MN=
B601LS1-4"),
> >>>
> >>> +     EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP0=
79QX1-SP0V"),
> >
> > I don't love that the ID is 0x0000. That makes me nervous that the
> > panel vendor isn't setting the ID properly. ...but at least the string
> > matches in the EDID so hopefully that will be enough to uniquely
> > identify things.
> >
> >
>
> The ID "0x0000" makes me nervous too, but the EDID obtained from this
> panel indeed show it, which is quite surprising. May I still set it to
> "0x0000" as it really is?

Yeah, keep it as 0x0000. Since the panel name is in the EDID then
commit bf201127c1b8 ("drm/panel-edp: Match edp_panels with panel
identity") should provide some safety.

-Doug

