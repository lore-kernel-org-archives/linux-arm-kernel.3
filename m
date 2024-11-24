Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E6DE6780A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 21:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W07l0zNFrs+EFQwQdJy7SMIOa1ecWzPkN3V9gFJWiHk=; b=beEtGnqZvcldF6jh+LQKAi7aZt
	QpWZycSYuSPFadnQithGzNL247FrRkycdBcFMOoY05silFIgc60LIWsnZUpHLHsk+RbfdXgYlyc9S
	Hu1eGe4miaGjFKwytAYp4X0CzjZ/rIQBRSm2JaiZlo8Xk91uBGQUq1TNh+/mybiGvspGJ4TLkENwK
	NdeL7j0dp3MOnNiz9Gm88El3d7VeUYMaj84DnLKsC+0HdUkG7WCLzRwytH1005tWxBeFDSLH3hI0h
	CNfkqRu2SiYdx+nOx8TQVmRqvOIGiRLStpnbkzbdcV8aWKen3S3sMRbAE3o3XRUi3FEiz5JA3jGr9
	r652ZL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFJtF-00000006eCJ-1JCO;
	Sun, 24 Nov 2024 21:11:33 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFJsI-00000006e7g-3ltz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 21:10:35 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-46686a258c2so8122771cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 13:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732482633; x=1733087433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W07l0zNFrs+EFQwQdJy7SMIOa1ecWzPkN3V9gFJWiHk=;
        b=PcuJcOGhPBgNzSaVyVhoBbyMF0a8taQHVpBlqDsoJ85c27kOlg9tU8/lw0TCclj6bs
         48sWMyBfJ181IKNZxdr3ci468VD3rScgthAivfyLCykcPE1aMy4w3NKlV82CTjSij2Ew
         CdRETLs7x6rWyQpozLUq5xq5tkAc9izHwxev1s1VHlfqj1uronrdepyYepv374qnAUDj
         VttXF5ktqthdMFgzOUd/iqaYPAIsyTiulqUR/rI8aAmvHT1WMUxNLamsELMRkxpU4LkV
         AFMjlI77MnHwcQpN81EKBBobrEhZA5t0UArRVNT68rqH4uU/mJ+7Ul3lFQ79AxMAiHCU
         3DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732482633; x=1733087433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W07l0zNFrs+EFQwQdJy7SMIOa1ecWzPkN3V9gFJWiHk=;
        b=Swsrcdo0t+Ppr7tgoHoMUZVFGpiHHukxH6Yay7UOyetyqu/5itdyhV2nt7lDoAJGT9
         Ge3BSnTkvGSKqrzkgivEnBawUPMhwZMlXDNP3TZwZNgWzJv259f/mMDX5PBVPFSxd6z+
         QcrHTcB0PRGZ3ZblF1OnOtmBPfelSHGz32S/mIfJ+SsqtcLo2AXygZM4tAXdlfeIuKLF
         FimUI26K4YDWKHQqR7tKmWDsInYHTLhzKdIrkL6iciIYK1jJPt4Ngl1W1o/PxvLozqGw
         Puc25CupGmwXx+oFv+zNFo7N2y16lbQeADuSsoJdXhb8HpL35+8MIzZbu/CZ+ALUN9Gl
         C3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXxB/wY1NcVXM45dmXzl6fgKArSPNK81fFfb6CGgPv7GbxQFztGw5i4v2s0++KgVqB17kvxIeX5D+WmbLhrCKUr@lists.infradead.org
X-Gm-Message-State: AOJu0YwDdFkH2p9zwnEYt9XE6WqldpfQBdhcGEr6c7s7IDoTRkIE7pRd
	iaApzEopSbLBrDr58HtprzhmzyBElm/cwK17bf+06tFzeD9M8TUKgxhro+6TRz7JmMf4NnuPm4u
	i2OaeycPSGekG93p/wAFaCkXgT6k=
X-Gm-Gg: ASbGncv6VOuoIfqhWz20tM7Bzt80A287bJ6BS+3fiST32hdOgUfr2LTPONgikklNdJc
	bpLW7yN1ede7EVAGJJPCaS+1tmtIxVnud
X-Google-Smtp-Source: AGHT+IFFGfCsnztfsLunwMxUWCnNQbocjlno2uE7RveujuTHAm4e0cTyGoyDHCbxuwKBXRaxOpeKeT6w++DlBbaz2BQ=
X-Received: by 2002:ac8:7f16:0:b0:466:9003:aaf0 with SMTP id
 d75a77b69052e-4669003adc7mr41252241cf.37.1732482633443; Sun, 24 Nov 2024
 13:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20241123212624.6237-1-jiashengjiangcool@gmail.com> <b3e2ed68-092f-4ccb-a945-19e19d5c8071@kernel.org>
In-Reply-To: <b3e2ed68-092f-4ccb-a945-19e19d5c8071@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Sun, 24 Nov 2024 16:10:22 -0500
Message-ID: <CANeGvZXjUUOhySGhMCXDp3yfTtuOKdXgMa7DTtZDpq1iXkkfhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camif-core: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_131034_952195_3CED8DB4 
X-CRM114-Status: GOOD (  12.28  )
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

Hi Krzysztof,

On Sun, Nov 24, 2024 at 5:50=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/11/2024 22:26, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC s=
eries camera interface")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
>
> Nothing improved...

Sorry for the confusion. This series consists of two patches.
Only "PATCH 1/2" has been modified, while "PATCH 2/2" remains unchanged.
As a result, there is no changelog for "PATCH 2/2".

-Jiasheng

