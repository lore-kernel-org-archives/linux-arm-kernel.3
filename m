Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68DFCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=; b=zumEwtbgYE/2irm/qR3M1Liqb7
	B1teqIDIL9x3IHesQWcYod0SmSfBAE7+vhBq6fZnv73QpW4b2qd3r7lmtCbqif/crIMVe7UBle2cX
	n6qy3HgpnbY93blgXbtlIv5tTnmIxsrRkzh8NduSRtU4Iry0gcU7Mz4yQHF/yPnhCh+ct+gOaSfJX
	Cp+MtkkkzVj+TuLGTBSidZeqy2FFdIyIl0X0Eh/vnC7KoF/gxXVuQJlaO8rl+DtZ/0fXc+nfSC7Q5
	CjD7wfdIVR5s8zsivbHjbJlc6lQomwgPoCQzvvQ5ImB3bbNcpTUQYKzL5uazp1wBu41ShCoLN1lzT
	5itTcMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcuo-00000001tRg-2sqL;
	Thu, 11 Sep 2025 08:44:26 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcum-00000001tQI-0yCT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:44:25 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-544bac3caf2so1198881e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757580262; x=1758185062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=;
        b=GJD67yQlrEPJ52ZeJ9JTeqEoapkrW6J7Ay57XQkkch5U/AsJazStYs13N6U/FDYrNa
         5B+COcxPLG/BabQnUoJznYa60r+OQWUtClI+bSjLuZsS2TkMz6k7yR88ErIGb/pAaafn
         nh42r+WoJXJcq4QWi7KmBcdWsaP491NWMsTp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580262; x=1758185062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuBL8uqFp6SRqtjWGK32//PnPpBAxLJ8lgwayga7/Cw=;
        b=q8+BVdtlgw8WRdLEEuZ6Lm5q+YW2g69MNd1Mj6O7A+cS+0EIRlOiC5SkqZIVRQEDAB
         X2eKvwRmgBxGL0n+htuIQAgRqcYqpsniAX/2UwIRFu4qWN+M/Zm/yOrWiTEUI5El7U29
         hsZR/h0DYWMYRZLY4sxNp4FnzlIK8n0Ru7jBNSBYv1SsQp06nmJ6NpmPtzO2pOl8HimY
         AWyfWk56SRDx00JUW3jBi6/lGaCBVfEx7MygMAJPUAUZZ7S2EWpFT1qg3v2ezZ9UQuld
         S8E25Jx66UaTbckJ2H0PwHk0cq/UwfEFVjHBdnwX9BJm6YqIhVURT3ddt2UzdejIqiOH
         Y8BA==
X-Forwarded-Encrypted: i=1; AJvYcCXxAebEhVfSY6xwOUnROyvv8EGHGYtVkG/n0Kd6W2HR9nd7My6QQJa/qo/4bJ0kkjAk1fHD/flqpUk1vhdtJfV6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9UFSl6YYVE0z4BwWpj12ZeQ0BcgEhIyiTuRKePVAko6QueEDr
	oFyenLD8jYe4MOjkgwjrlodPKKbdrOGD9CLgG4VhV/M2Iz610oeoILcVC3CGgjgjftol+dgKGcC
	on2c=
X-Gm-Gg: ASbGnctFYwVpEepcdS5Ymcqe2Il7QqdVp/hV4o0iXVbs2d0Faec7WGJg4VBSRRIw1X3
	ZlG7skilj0KVAovoOXNXZ2NtiYks+dcgkV7H09weKzLlTytSNcrKxvuCk41WsNB9CircjEfkGzS
	HLvGocF5HctAC2frFbzZFP6FtRNeV8MS8g/R9hlf17gQ2hSqRmYm0oFdPFBWav8J85S9dm7LJSo
	pruMwBtxDb0BOQH+lWZMpG9egEENA/KYRozSvqyfeY8a1GUyHrGMi9xPjXysscHbxLlfaQ86MKz
	LJV03XGx0Pp3sy0u2lVa74vWiUo0ZJ0gXB4QLGqrpl0oQ2Xj66SgVYMBdut/GpFiI/fFQkDl/WU
	ur1RG9OwfMmnjfv5WYrSFdztNthqw/Fi2Ns2wGLj5hi8DF9X/HpjuMawLQER7Mp+zM4Ld
X-Google-Smtp-Source: AGHT+IHsu4LgXGs/nkb9xLHfKUgTuj32HdwEwGcK46OxL4Cf2uvc/CLaYjZKoYaWi6cHEphskB+1xg==
X-Received: by 2002:a05:6122:8c6:b0:545:af6d:1edf with SMTP id 71dfb90a1353d-54a0984daacmr1062721e0c.5.1757580262263;
        Thu, 11 Sep 2025 01:44:22 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1bd09fsm158122e0c.3.2025.09.11.01.44.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:44:21 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8960d3a6c2fso240865241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFToDuHiwZRqpGICTN47kva/Q61OtnPGxQW/hF8AkRj8zF6y2/6vvJMEXNeVmHyLeRRWecdMu5uFDoguB3FKSr@lists.infradead.org
X-Received: by 2002:a05:6102:5086:b0:4e2:a235:24d1 with SMTP id
 ada2fe7eead31-552065728bcmr950644137.4.1757580261120; Thu, 11 Sep 2025
 01:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250908044348.2402981-1-fshao@chromium.org> <20250910115508.0000785e@huawei.com>
In-Reply-To: <20250910115508.0000785e@huawei.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 11 Sep 2025 16:43:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhDRQFVBDydTq=fmC=jz8e941aPwzg+cY1ZQDqWppx+fQ@mail.gmail.com>
X-Gm-Features: AS18NWDats_rTOk_H5DcYgtjHSlZm8cS5lY_RPdvAh5_wYx68w1LGLEaew8wQCg
Message-ID: <CAC=S1nhDRQFVBDydTq=fmC=jz8e941aPwzg+cY1ZQDqWppx+fQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Use for_each_available_child_of_node_scoped()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_014424_308669_9868CEB0 
X-CRM114-Status: GOOD (  15.23  )
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

On Wed, Sep 10, 2025 at 6:55=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon,  8 Sep 2025 12:43:25 +0800
> Fei Shao <fshao@chromium.org> wrote:
>
> > Use scoped for_each_available_child_of_node_scoped() to remove manual
> > of_node_put() calls from early returns.
>
> There aren't any early returns here.
>
> This runs into some of the stuff that cleanup.h docs suggest we shouldn't
> do which is combining gotos and __free() magic.
> I think this case is actually fine despite that but in general worth
> thinking about the code structure and whether that can be avoided.
>
> One option would be to factor out the loop into another function then use
> and error return from that to call the stuff under the init_free label.

Fair point, I can send a v2 with that.

Thanks,
Fei

>
> Jonathan
>

