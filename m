Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A581E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYseOpURRh9hqApQgpIM/XepY4WChUBZ1jGMRsNQHcs=; b=YubcSPsjNLhnIENHtVz0O0bjHK
	4Mm4kw0yW1HN1DUzGPyRlXLapDo38Jp3XtRoyocWvqbudYrhB1O06pkVITdJA1ugs4scglyaVQjdH
	wx7Gnljrr/CEVzl6b91Z10fLQVQKTgPwpY+IX6ibzRrSo3m1l0+7st3yOKkadcTzsb5soS7JStVGx
	HZk0XDj04TRfFQcp5l4sh4ru4STCNV5LsnO8CtXhcg5cy1ztpaMpXnFqlvH59TRD3hQ8NYjUqf2bT
	4iVIFCEe9jY2VRTbG6KpJkD3e7F1g3LwVJl+j/GxjpfDQfx33LXJFwY46O52O1k5XSVVWQj0yK5ze
	5k5d834A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0II-0000000DO7g-3jxe;
	Thu, 09 Jan 2025 21:42:22 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0H4-0000000DNyw-0tLO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:41:08 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6dd1b895541so23356066d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736458864; x=1737063664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYseOpURRh9hqApQgpIM/XepY4WChUBZ1jGMRsNQHcs=;
        b=KVLA1ecCO4Drtfqhy4FCnpNTynsfVVw+lr8Yz0QedYBgbI7bMMoHs3K0XKUNM9anxX
         yLcSmrndERdu51TCBx/woMRai5y7IruQD4VegUTEamc4MflW8+9bJmb0KQhSBXLL567d
         CSxvrdoI6HUPC6RA6NA90KrRozjurlo2Ij5CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736458864; x=1737063664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UYseOpURRh9hqApQgpIM/XepY4WChUBZ1jGMRsNQHcs=;
        b=N2RHJRv6afKbXZ1Xl09BQDyAz4+lXb2a5WF6RFtW1tQ6YNEUzixAFw0pjhBLaG/jIl
         EgN8SySZKsyfLtqCDwGYpvVrMWClpR/sbZjtxrx4lBKaAkLfoGJBzaxTaZayub3JgCZK
         tt7r2rM7SNlp2O/KXBvwSEZjps0Bwjt8+XOaQj9lG1hb9uC3oDYtxvRNJdIeO9O9UHZb
         5GDOXC/FhjAIz+YX3cUtQI0KnPqiv83zSvLvunqLZp74/7cXiwQnqornSHGjI4bIg8RN
         f+VP/bgQ+L6mA214vDmsUva0r/y/4W7DSTFpE/K496BQsPOLayhdA8yjiIPA2tj6cMl/
         QiaA==
X-Forwarded-Encrypted: i=1; AJvYcCU0sCNJHR34IG2nq/WIiod6AdpHKdCNi8BbmV8ks/TUFiSM/z2JnxLChObHkBQlcF4oN4ed2sigcBC2d7yRqYr4@lists.infradead.org
X-Gm-Message-State: AOJu0YxYUzRqinWrySZ20YzQH3X+RsP8w/nAK6uxzIkrQMgVLXT8afW/
	wjjJq/ZS2NjYYeaNMA+yg+vV3PF2eUpdOCd/OPZ/6Q/8AoTQBaoWdUWVuWzshLNVaDLESsVTtXD
	MeBTnMVHveceiqzZ40KoLtWGYGF6cFXQLduGr
X-Gm-Gg: ASbGncuqyudC81LnSlL6BP0WAnleiDargFbR+O7l2+FTNkSn5t9km+xOHuz9rJN627c
	Yk4KUtKalz5broxfP4fE3NkQmjxa7TBSadvAn4apF4hIKSkcBPBFnFj0JrErmVHeSQQ==
X-Google-Smtp-Source: AGHT+IEKX5fqLs19Nj5Euy3b+3ANgHmr60cplFk0CNeQmGP21sPNoKthsCxbKzmMS125ujK0B00l23Ab59zEPd3mFGE=
X-Received: by 2002:ad4:5d61:0:b0:6d4:dae:6250 with SMTP id
 6a1803df08f44-6df9b28c6aemr137634956d6.34.1736458864590; Thu, 09 Jan 2025
 13:41:04 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jan 2025 16:41:04 -0500
MIME-Version: 1.0
In-Reply-To: <53b83a66-c0b3-4227-8dcd-022f70810ccf@oss.qualcomm.com>
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-2-swboyd@chromium.org>
 <CAL_JsqKMcHPhf8yzEZNC6280-k+aSmo3SQOBZLMjmfTR47BH=g@mail.gmail.com>
 <CAE-0n52k0Gg85Ry4KyjE7Ms_dJgj=aPA4aPB5gmC-VGWSNLZXA@mail.gmail.com> <53b83a66-c0b3-4227-8dcd-022f70810ccf@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 9 Jan 2025 16:41:04 -0500
X-Gm-Features: AbW1kvaEYHdRDja_xzTNJbc0kQa8ep2z24O4PgYaJif2dmWpmU8qkWy48lGlWcY
Message-ID: <CAE-0n51f_RQqQgH+FidFiFigY7koZCRZoOtDqQeTGKNsKtBSbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] bus: Extract simple-bus into self-contained driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_134106_272711_6752DBD3 
X-CRM114-Status: GOOD (  21.55  )
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

Quoting Konrad Dybcio (2025-01-09 06:02:17)
> On 8.01.2025 11:44 PM, Stephen Boyd wrote:
> > Quoting Rob Herring (2025-01-08 06:11:28)
> >> On Tue, Jan 7, 2025 at 7:28=E2=80=AFPM Stephen Boyd <swboyd@chromium.o=
rg> wrote:
> >>>
> >>> Extract the simple bus into a self contained driver so that devices a=
re
> >>> still populated when a node has two (or more) compatibles with the le=
ast
> >>> specific one being the generic "simple-bus". Allow the driver to be a
> >>> module so that in a fully modular build a driver module for the more
> >>> specific compatible will be loaded first before trying to match this
> >>> driver.
> >>>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Saravana Kannan <saravanak@google.com>
> >>> Cc: <devicetree@vger.kernel.org>
> >>> Cc: Arnd Bergmann <arnd@arndb.de>
> >>> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
> >>> Cc: Bjorn Andersson <andersson@kernel.org>
> >>> Cc: Konrad Dybcio <konradybcio@kernel.org>
> >>> Cc: <linux-arm-msm@vger.kernel.org>
> >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >>> ---
>
> [...]
>
> > Maybe the best approach is to simply avoid all of this and drop the
> > "simple-bus" compatible from the soc node? It introduces an annoying
> > hurdle where you have to enable the new driver that does exactly the
> > same thing as "simple-bus" does so you continue to have a working
> > system, but it avoids the headaches of trying to make the fallback to
> > "simple-bus" work and it would match how new DTs would be written. We
> > could make the driver 'default ARCH_<SOC_VENDOR>' so that it gets built
> > for olddefconfig users too.
>
> I think it even makes logical sense for the /soc node's compatible to
> be.. you know.. the model of the SoC we're modeling
>

Sure. The annoying thing is that we'll have to enable the new kernel
driver to keep things working if we don't have some way to fallback to
how it used to work before. I was trying to do that with this patch but
it's easier to just force folks using new DT to use new kernels so
probably we should just do that.

