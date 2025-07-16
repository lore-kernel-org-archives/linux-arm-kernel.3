Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE15C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwY+ydg7QNO8ffgOhspbvFzuLK5V0VJeLu7G3qLFQ9o=; b=imEG1TNe5oAvG+zxTDhS4Dr+oR
	jRkq75y6xMwXmw+EtTfZA/MDJcs3bcVIRZwv37cR/HtfN5cdlbPUa/5I1YZZ4rBOa/0lr4gAgrXaD
	LURl5bls4PVaMIZQjXUitsuUIBZTUBxkEm6+GG/i3sDAsOYYQMqXqPAgZr0lR1dOZFgODQ9JgFD1s
	Ek3LZbcrgOI/TMH7/4v0pnz9RfouF/wngUbmiT2zeLAcOfhlb0JYPWqzrxhI1k4u143LzuK/gECDE
	2sJhhdsPJkzDiGoDS6BZZ8+kqtW6fyNBVaA1BilKJ84s4+vehXj7fnhdZNK3uCEVIPMvITtXOKZtp
	oqJyvIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubziN-00000007TOy-2CET;
	Wed, 16 Jul 2025 10:50:19 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzC9-00000007OIY-3ohh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:17:03 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2eaf96c7579so3941227fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752661020; x=1753265820; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GwY+ydg7QNO8ffgOhspbvFzuLK5V0VJeLu7G3qLFQ9o=;
        b=jHO9OZ+yy18/T05U/MFKP1Zyk/5WGpdeuZLXH4o14fcYj/4hmK0YVxTlQK2Ewaru17
         RVO8jOWQICEWc+b6PdX6WSAiu76z0/U61lkhOLqrmesQRyzbhUgwnd7/o3Ko259f8E+W
         p4ugcCZAckkwRIVEOKkgfrIYuFcCGZeDegfyhaJy6qmjT2OSLalKx9CHVEtALLdiApNG
         NReBwsob1nrnALZtImLVFHzzC8FQKiHQ+JaNxMbkq08GHvheI3KLhEbn2BwTXYPHVXcr
         BDOWyo+5O+h1F1ei7WJpcNWUX7alxKhx64cfxUtBh1iwI7VfFZrf2yWbFqSPTOGOePvJ
         NcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661020; x=1753265820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwY+ydg7QNO8ffgOhspbvFzuLK5V0VJeLu7G3qLFQ9o=;
        b=iLtN9PV3VkyKrbDJFKhEiksk8nIM/cHDdIwvsGzB/KMczpRNVlVrPAdVF/f2w8yTc9
         zBb3GMET/J038ynPnWvWkfrdxDjfJwJ0zL6wZ118/tqa0WxxhhFIzdS+NCKmvJChNbc9
         u+xY+2ub17Nc1Me5wgiwU1xONgUNfVhvjPlbJIjQ5nuK7lsq6Qxdi2IFm2Y8kzY6GvZR
         tIPPHtreiLK8f6gBni6v/Tun5lMyDhwE/hOouQSQWGkuNSydfCqo1mY5y/04p946Vgph
         1kyoH+ZkZ9dgOa0P/UFpuXAeYoZT4KOTApt9L2yd3n96HlSJzkREWRrpR1F3vSsM3rDE
         A7wA==
X-Forwarded-Encrypted: i=1; AJvYcCUXu6W3nolBgwEiyJuXl45G1LTPEm8yFiTjXYY2L8uBrNFM1qrJIp/CYrexnQiBb8Yupom4tsnFNHcKf9ZevKn4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt3Tf27juj/hoLI2w/Xt/HBqICjG1+mQ+IzIrShZPYYboeLiqr
	qZYLGwER7LdYwZp7PYasz1OhRzXgbiiWW2ehWqlW53RLlH8YS90FQCEPmA/6HiDPRNpr61WGQCg
	WKDtEGDf7fE7Tk0HuSxe/5QQfCMUvl4+j5VmFSeyOaw==
X-Gm-Gg: ASbGncshMlyjFVWg3vt96SmWJGHmKHpixrBjtWrelwpnAWbufj1Yw3D0v2JDp9y3SNv
	H8EJPqiYadIJ8IsOrGN07yVOigBtOZPHXHaMFThCE2nan7782HJhq1stuivZDhU0WGyII7VEGQ9
	SulqMUa4CJ0m8KCQoPlePgHkLHACD0qygrf1qP3opHnT+F75/RAhoVlLvIrcomwSCP+H4/B3lK5
	Fyjgxqn
X-Google-Smtp-Source: AGHT+IFBJVxKAXo/cKR2ndkM9X7Bsz8i7y0trbE2KS4VktpXvhySzwMgUoWrnTeCkvYzPODvF62WRFigY53HbadClC8=
X-Received: by 2002:a05:6871:71f:b0:2eb:a8fb:8622 with SMTP id
 586e51a60fabf-2ffb229c270mr1371804fac.15.1752661020506; Wed, 16 Jul 2025
 03:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org>
 <yq11pqiaedd.fsf@ca-mkp.ca.oracle.com> <yq1a556776b.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1a556776b.fsf@ca-mkp.ca.oracle.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 16 Jul 2025 11:16:49 +0100
X-Gm-Features: Ac12FXyVvVETCy_fvebhSLHtpuQY_pd3_d6Vt5LZcabX59ifAwOETZg6eR50R8Q
Message-ID: <CADrjBPrCBG4ZatLwYyH07f5EQrbO876M7WqXX7UfgD9Cg8w9Uw@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: exynos: call phy_notify_pmstate() from hibern8 callbacks
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Vinod Koul <vkoul@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_031701_956305_7428C44B 
X-CRM114-Status: GOOD (  12.36  )
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

Hi Martin,

+ Vinod (phy maintainer)

On Mon, 14 Jul 2025 at 23:15, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> >> Notify the ufs phy of the hibern8 link state so that it can program the
> >> appropriate values.
> >
> > Applied to 6.17/scsi-staging, thanks!
>
> This appears to have a dependency on a patch series aimed at the phy
> tree.

Thanks for your email. Yes you're correct, as mentioned after the ---
in the patch this has a dependency on the new API proposed in [1] so
can't be queued currently.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org/

