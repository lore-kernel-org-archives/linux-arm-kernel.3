Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA175D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=; b=MZD1CX+xhulrZHVVm8MYa9Qz7U
	dZ1TbioCG7stipWrtXwDSf9wVshd342pllCsSGqg7oxBx0swz121xgJDu86Ha7UFN3Oqwh3Wv7mwu
	Vl9FFnNNHtTmJURc4JYjyrhuRLOIRLGqqQSTlV5EMTdgcGGAccaywcG+XVbR7hz/APpSABkGWOViY
	wxzmXLtLcwjvFrgsNR7uRRJ6bBFkpXvLiXIUxEisFNQv+uW0d42zLuXVJpJbDFPBCUDJHEqpRXLiR
	wlTDRCX1SjlPNdHCb+QAQrPEH74dUmQy60zJIQELiIyCmnlRhh3/jnD93k/9mcz8BjDhM3plL7F+k
	71+jstBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9qT-00000003hzI-2tmD;
	Tue, 20 Jan 2026 11:24:25 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9qQ-00000003hyQ-02pO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:24:24 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8c530866cf0so513295685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768908261; cv=none;
        d=google.com; s=arc-20240605;
        b=NoVUcINO3oVvhEWyJca3qIv2B0FJByS1DlxvPLy+VFY8Q1hfZB/wl4HLmb9o9ah1Gx
         o0tNNlk/tmFRxnpSGKgcMbu9x/eS3lSCmEfzgf1pJBDB3QNvVum8skDcVYNtz5CFV8ta
         iqf7Qi3ALOHfKOj/dFJWpqq2w2EabAJay0fegR/27zTX7kGqBd2VuWnE06kMGxxJNQa4
         nNntD0Ja6+/4ENmr2AnKntB4s47AutKuilug6ZCo+0FWNkkOZTWZ7x4uXu4MW+mM4Kyj
         MPfyWzxN162wphC60TsUvlzUieLa68bpK5N2O2sZMFVJivHyJRi9RlEiKC1KtFjiioUg
         GFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=;
        fh=pw+FhBngeEUWC1e0Bj8/1aXub45OeaKKIZzNgWuATqo=;
        b=lTgR/Uqc86WJ58xudKA2i/rOnOuRm50+r2FeklJNimXQkEJsXQlb1NRlSJQYfidJMa
         KEUcVdsEK+eaJLGjfya/vC8ODJuyM1G7pu2Hd28yQO60eSskGU77qelVguWsp5pPfpml
         Lt8vAwJ6KYFuq76EW4eMOqskQZL5Vt2IVfA5sbEUpiUEXQ6Yegt5H1bEIQZRStrMN2oC
         g1vqp7MQL0YEIiDbqju9P2BFVMjefJMX+RHcFq0P0I98H5ZXo8MziTYE40Z9annuKsTX
         xyohSt0HWqC+woYPHtVRzqKZdFppN0nGUVRTlwW092lSy3sITANTw8aiKygRbrF58EJT
         byLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1768908260; x=1769513060; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=;
        b=RfUhSuWRA+Hf1cyj/w0TCsHbr/PFX95rUs9xTxetYbWdfqB7XLPZbIjFSiTJjlT127
         nJWYUhlmP7dk1apKc8iezogdwiN1TxVaTcJR+BEOepz9YdnemKYSZTa/tqdFjlaoOSOP
         xZR4tXm0UpAssHRUAFkw25mcv4OF6K24BYLm4nwfesRVCfhA9iQ4va0wCeiH6hjnWrEW
         gGMzZD5eyzaMC+jqXZyWpRY5XzDi2tzQhHaqI0GzAUMpyeWNNt2MEYQkzF4JT3iXnt1n
         5LSy2D6wM+Y5/Edy9cQdVBqaEXFlOu6S33EOtKGgcmkma+Db6hZVJHYofaq7JJPWIttn
         ErwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908260; x=1769513060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=;
        b=SAJFtKKYTLWswEmpsp2tMq34IIB8YyWl3tHcVRFb8PhWaGWT92wb5x1M3tMsfJyjWX
         mnNyxfZxXrQm8Y31dEPX1UHOLZy49dN6vu4hVpuY3M21qtclPQtMoJ1DaHK3xfAiQRu2
         oP8fQ6lZHLWUS65uML8TCAeSQi0SyVdvN2bJ0Pm6zme3WL27Od1fzs8W5i/t7WdoeAm2
         QvpIUR8hCcmFrgc7BqJjUSf/f+kkXRAVufCyt5AQ9F1qKNFnPYkYhoFzmKyCJ4v0vqgg
         M3lEGJ1cQk34q1CiWttszrNBKw9xmHmsTGZ1pqGgRIXnIjXYcdErgzRiPIgO3pBwtJDP
         qFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX28YADnYpXJDQMwMNr58Y4Q2cyz3qpMLQRmHqOLlqCagJvVjzJtw2uDi8HMA6iK+ipSwkN3nvB8SFo+9Oh67uQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhrt3GLqLUb190Ucs3dkSRWeJk34g6LJEZo/VsoEX3E/5gop8X
	eUnL/SsGq+eVapPUNAxw6nvcYz6ZqOY85A7USpirUb6AV6+GVSmH5GhQ5vyTfoiUvemHjONbxY6
	2qr3kn/VCoF4nwCle3ROj063uuaheTjjTWdcZ7a1Yag==
X-Gm-Gg: AY/fxX5gOnu2XQycK0uxH9aln4k6Sxqrq2jXohjabLY/uLEMbGjL4L3RzPBlf6nFU75
	H+jb7rpHlgFr4hLz9QDce701BT2U+OOu5wZya8xYYYDeVklNp4Dk3F2cBJZ85GF6sp618e9PDXH
	fDjg8B7wPeY4ijOWl0oG5rwhx/+3tCyihjMmOtBTEeAcxQonIqC9R8jGTo9J8Tj711XBRHr93gX
	0b8zY/zjX3IUzdTMnjZNKuhzBsT+Ax9WrqehkDtThA22z4mD+NtSnA+glX8PrU3vRMk
X-Received: by 2002:a05:622a:293:b0:4ed:b012:9706 with SMTP id
 d75a77b69052e-502d8560e22mr15738471cf.43.1768908260643; Tue, 20 Jan 2026
 03:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20260109005821.225235-1-andyshrk@163.com> <CAPj87rPYsD9bp7Ep=fBb2ViOzSnWCgWNJ7Hj=WZuDR+OTNpnSQ@mail.gmail.com>
In-Reply-To: <CAPj87rPYsD9bp7Ep=fBb2ViOzSnWCgWNJ7Hj=WZuDR+OTNpnSQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 11:24:09 +0000
X-Gm-Features: AZwV_QhTX82cJ3r5JB05_RUf2GPXL2PjFD8R51i19MJ8Z0EQM7Kp4Hhb5yTq2q0
Message-ID: <CAPj87rNJ_ELo0C7u5Qqqhg5br8kar+f7DjcKd6Oxkr1uETsVAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, airlied@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch, 
	Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_032423_661559_CE1B244D 
X-CRM114-Status: GOOD (  11.70  )
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

Hi Andy,

On Tue, 20 Jan 2026 at 11:03, Daniel Stone <daniel@fooishbar.org> wrote:
> On Fri, 9 Jan 2026 at 00:59, Andy Yan <andyshrk@163.com> wrote:
> > Filter the mode that can't output by the crtc.
> >
> > [...]
> >
> > +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> > +                                                const struct drm_display_mode *mode)
> > +{
> > +       struct vop2_video_port *vp = to_vop2_video_port(crtc);
> > +
> > +       if (mode->hdisplay > vp->data->max_output.width)
> > +               return MODE_BAD_HVALUE;
>
> Why not test height as well?

I see the question was answered about 45 minutes ago ... anyway, why
not as a follow-up, change struct vop_rect max_output to just a single
max_width value?

Cheers,
Daniel

