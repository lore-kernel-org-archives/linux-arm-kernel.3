Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE0DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL/MQSQ2ufa6wux9YuL+tzjixJQA111EVmHyVach6lM=; b=FTjYdvAfsVWIEHu+BKj7OiUuS+
	erkT0+5jnRf4KT0nIZS/xtbYvI6DSfn0cTv9kSPD6C6AD9xW5ko/71K1K2phNw/q2CcWUuvygOp+K
	ajxL7aUBEvNe0y+QchDzIP3hNibYNy4nzcI4QMH1fNFk+TrAfTi9k7tPvsh6KLeGCD/R/yIY2Ya5D
	TGoqgZDopB4Vc3p+69OwS+9+ZKfpXlWS0F8UUD/ZGc5xVwPH3VldNZzoW09fhg0O3DW1VqmehT2Ev
	M6Ojar/7OK88/Equl2+D/BKb2m55cAmpTRc2wq+PAvtqB7scURFYWmLQNgPaTiQ5vRiXy0t0iZVxn
	dMTEGwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2sv-0000000D5FG-1lCa;
	Fri, 25 Sep 2026 10:10:29 +0000
Received: from mail-vs2-f42.google.com ([74.125.227.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2ss-0000000D5Dy-2HS9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:10:28 +0000
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso223446e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 03:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331024; x=1790935824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KL/MQSQ2ufa6wux9YuL+tzjixJQA111EVmHyVach6lM=;
        b=r+G7U/D3HUie3TclkrTKH8I5k/qyoYHnGGorY27ZkFjmUwQvrFQgdFAlNrowndtxSM
         zfg7SjeAjTYK0RmiJSjylo24CjBq4mVsLYlu4sbOksKB0Zy7BtOtVFwpbVCFAzdXZh9s
         itXZJdVC7pKxncpJocDBuNVDlKzfBYN0UZItWVRYNvDovJmmc0UoUC+fgYVp9ltt1eU6
         Qw3DJd4eoiZgFkZcCIYjhnMkqLVt7L4lydY60+KgaanSxVCF5GUnSnDaNH2m+v+32k47
         qYa26XaiMUbzaePcUgqQPFhjX5JTvqhsbu6xglOBH5yQdAVOoqXGmN2VS/msR/ir8PFz
         oVrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKxNZhIgUPZxGFph/fHzdhiZY79Djkf95Ou5QnhM4BVfHQb5CGAb1EMsr1AlR0vDfsCrOTiAao8sczFuCRikT0@lists.infradead.org
X-Gm-Message-State: AFuF++mVcI87wO/t5X25l3udOMBkvlgJ11xpNWnabduGJBGDUZa428Yo
	SQstIsmNy2Y+GIF7/RsDTZidNREfe8eypLt9XTDdoQVe4zM12jheKPRhEKlTtvAV
X-Gm-Gg: AYBFou3q4T61cAzIJqaF6rNl9jDsBNR/d7dI6BvR+l8SqkzXfVweKEJ7Ic2bTTHwSRG
	05hqbIE+6/llZyBHP3eCDnoby8CxoTYwK7kUUHc9dVrPUlDmMLZjc8foy3Br+0g2SVNo6M9iEhC
	Nvk9LCXt40/i5I2mkRjlqh61UqidwzJ9NEQcH0GYo2rSgF0lCg18LqhOEaBpQB0M3n9vt2ZAToz
	zjAwsgBSEWLqSuAZcBV7lWlvm/JeEp/oWIFr97ilefNxV0fG+lAUfy+Hdzz+BjOrLhBhn5rZ4zB
	yp8hYoyJtw1mzBUBoyTP5uQK5c8q6ol265qWegFef5qHEngWsRNF+fpLIADqT/SI4RTWu/dAkJF
	LrMqv+VJknvN1qrsYVyWEtufAX7IYDFdzERgGcDxQhPW14AFzEPJI5/HVfqfqbpVEv5jvch8Cf0
	01Qa851WB6mzIFWLnPdEOSxVp3RFeE+dy43Sywzq5erxlXFR0FKV2QoOFK2GOUgfEbNkhVDkEU5
	FBRPYC6pr9Ufv0jBihzACeVUzbr51tzOYG5
X-Received: by 2002:a05:6102:3708:b0:7a1:f9df:e35c with SMTP id ada2fe7eead31-7af1e0f1e2fmr2078492137.35.1790331023877;
        Fri, 25 Sep 2026 03:10:23 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afbaa90sm2013651241.3.2026.09.25.03.10.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:10:23 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso154605e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 03:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8TW+WI6yUyJsKkMxUfOJOuXuQaVZ/gC6ERrLjHo+gsksGvawHRujtKGeF3QysZlmf6EVzSXM0h6Z5tParLy8z@lists.infradead.org
X-Received: by 2002:a05:6102:94f:b0:7b2:c201:10d8 with SMTP id
 ada2fe7eead31-7b2c2011359mr193571137.3.1790331023332; Fri, 25 Sep 2026
 03:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com> <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
In-Reply-To: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 12:10:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
X-Gm-Features: AclHuK_GZIBSlb8NwsZCACC-o3m-qOuhGKB_o12zs05PvqCsSGvUGIOw-t14e2o
Message-ID: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_031026_594839_A5623721 
X-CRM114-Status: GOOD (  17.06  )
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

Hi Dan,

On Fri, 25 Sept 2026 at 11:48, Dan Scally <dan.scally@ideasonboard.com> wrote:
> Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must
> have slipped my mind. I can pick it back up and address the comments, including adding the other
> interrupts.

Same for "[PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0"?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

