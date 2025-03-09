Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E1C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3pmPX9mi3l6MtSftgTcp61DrI1vlvr8C0D0WUCrKDw=; b=L6b4vP4ReRMLiLjmOU+ZklCXDn
	Xi3qolc1J733x3ZPM5IRtcBSA9r4L1c0DhI+1XDbjSrE64ym7jNAK60tyIHlKbhPtPBPYSIKS9UtY
	M84M7VrrLjuTECHDBdNyZTi88RI4rFWsNPvMi9Y/AXeX7adHOMEK8MnxgcVdFBYlt71lwywVQ1FnT
	hyu14dTZobj8HrcvGzgm9OZCostcrBpcl61+b38MKVpM/gfYol2RgDA7Ql5e1ssxQIcqk68XFfVoy
	EtjUFMnuAcPWquXskGUGyDn/CthMG5jhrPbStdSJkkbu5mieWU73ZYVSEnzZA5qiUbKM7ioup4tLg
	vf7t8BAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDiF-00000000LCb-1V5y;
	Sun, 09 Mar 2025 10:16:51 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDe5-00000000Kns-2MN1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:12:34 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6feab7c5f96so25291417b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 03:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741515152; x=1742119952; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a3pmPX9mi3l6MtSftgTcp61DrI1vlvr8C0D0WUCrKDw=;
        b=vXJP7MLUQgJ/8H8FqdQkZGtbM70l8YABW2KywrL/8z/kILiVe3yflBKckD4hKz8CL2
         vUxL2Pd/5hoeIwB7TJPrS4uwEET3WFx9ylx1Nce/TJlJZBt+lS5wWZ6pnvYX/Z2vIpXU
         9YZ1e1VMcANYoMfvsXOFRQbFS89IejmrpqzHaTLLKwcMVkiKFaXYMNM3lLC9ooeDlxku
         apl/JZrp33xro2VmlGLlCAnJGZDqJLUXOTIbx2NGDaxgWtBOJCFcer4zV2HbUD8uc+1S
         7JXNbuWmSqugbjjXLqrFL3+qC5IxM1P/7QqHT5IXkOXFmvvP/KvOyXIbqTGaK7hgeZGk
         v4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741515152; x=1742119952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3pmPX9mi3l6MtSftgTcp61DrI1vlvr8C0D0WUCrKDw=;
        b=vlU8XWSewOeBlODr/jvQ2v7TAu+A2EEwexPDQSP1h1yHo+U+UI7MAVHTINTr2Nnh0z
         Ooeafg79Ulj3Baj2QFaMvt3JbdHodevV4nEbxP5BPL+WOIplyLI8As/+ocqb/feCWsQP
         Ng+8SCoh/Rrh0HsGC2mw+xwtdSej9Qb26qzLdo2RsiSRNMyI68xc7xL4hmpnxBxVgKY7
         6uJrQEJalBOCdrAdYvyW4qX2VkPa4P8PNSz0r3ikrqJk8cC7D7iK4FIliQbDdJwngvGw
         K6XAHGh4zXXwihqNqSOEi2eJdv4J5ImwfSdEf3WYBFhU6wPnJ3tqCwR7CIwHhEj5KgN1
         CqBg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2VEB7rJZJKPLbZmi2dvrSR6qjbMpuTysTxZxZK2suskG8SNAG1Cy6v7qlE85q+xxNHT9rI/3KezoeZoBvS9Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwNY3qCBqJC7F2qRjeD/1PUEw7Uru+RM/rAwpkrF0tzaL9KuRgd
	a5ZYwvyVSJDJZl8H0ARFM/WxZKmajhtID2E0tjEaeAHT2D3IvBXad+sIII18aRJMhxOU4novsc7
	BKp2/slzTFksy2LHzoEGa0GNkTTqWscimR0YOiw==
X-Gm-Gg: ASbGnctyosneRLE4pCcq2R1bcfMZ7Tqr7KUux8q35ZlFbodp+QX1vmXJ+g4vF3BDb7N
	rYtLcZH6U7vyLMFsRsjtQed7nADmw2ysttCLTwPbqOKwpI/V41pK117PPTJRHcSY5rMyrY3i3Ie
	k4O/mZesB98e87xY2z93FcMx8wGUQIUzuzyTe9kvSO
X-Google-Smtp-Source: AGHT+IEZFS8P/SqBnB+WkQtnz50kE/KLVe8z1PUmhj0XLEUm9sUtkaGVMLjPe61piys4lVxnrSqV5nhPuLtN0bbXmko=
X-Received: by 2002:a05:690c:3386:b0:6fd:6589:7957 with SMTP id
 00721157ae682-6febf3e141amr139728327b3.32.1741515152574; Sun, 09 Mar 2025
 03:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-3-35087287f9d1@collabora.com>
 <CAA8EJprBcGz0tZ5SDVC_WK2bzjXZAtOj+LfGnSxmwktvaQw=VQ@mail.gmail.com> <f1e33b02-5646-4219-98ac-c09e31d8215b@collabora.com>
In-Reply-To: <f1e33b02-5646-4219-98ac-c09e31d8215b@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 12:12:21 +0200
X-Gm-Features: AQ5f1JrmwkN2RQ2GrRt72vVxlzBhDHQIaChvycTVxwU7KB8WVuxJ3KFj7BXSb9I
Message-ID: <CAA8EJprNTUuOwu__GcRhYmNi5rT0+3r16fs+n7Gdy3sjgTp+nw@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio setup
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031233_600712_D0330AA6 
X-CRM114-Status: GOOD (  15.06  )
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

On Sun, 9 Mar 2025 at 12:11, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> On 3/9/25 11:17 AM, Dmitry Baryshkov wrote:
> > On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:
> >>
> >> The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
> >> 340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
> >> and not before.
> >
> > Am I correct that the only functional change is a switch from
> > greater-or-equal to simple greater?
>
> Yes.

If you were to repost the series for any reason, could you please
spell that explicitly in the commit message. If not, it's fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

