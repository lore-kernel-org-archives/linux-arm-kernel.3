Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD19E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA34be2teYEYsr2t/72VryT2qJhAIzW5Ui7xESwTB6o=; b=ZdJ71VwzB5Jl1htFAcSE1vs215
	fzGR6KwFck7AxAnfkZ1VyKGgcbkcVYlHk4upSmC13i8P8RH4tvCCmZ9G/ujjWppnXMyITJr2N7nJm
	RDcASbrMc/ooPyhISkRDlTjmrA6MSOtNsg3+XimYy9eQgrXFds8UbiJA23IxrkwKI6RuwsqeSVOaO
	9g8pE/aPFvYs3hEegrWo0fxQQ60/VhhjvXZ2P70EMX6ypRx+RZjAiUFcOS4yVpVaLhyuvQxW2lcmU
	IRXWoQY/RLGLlTEPVQywNsieFWOAWuaThDq665kGL9VZaNiCOBCaekLc7IeP0IaYLm/dMFsYZUyZB
	4dUfuzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8no-00000004n90-3dD1;
	Tue, 07 Jan 2025 12:35:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8mY-00000004miS-2Ajv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736253240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA34be2teYEYsr2t/72VryT2qJhAIzW5Ui7xESwTB6o=;
	b=dLi2D0+/5pz9F0ZhYEyjhCXAMaISbnkUdIwbxOHa339T8WNIEw7aSMuQh4ciPtcQCRx3gg
	51JDsrhMGymdwngUWzcUQ146MsNJlh1qH4HXisQKSIvZX/crmB6yBmzKCgLOYeU5SijNJh
	dwA7vHCzC4A9RTFn98hZ0ggEIJdQu4I=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-ARf3idCjNaG1PcOEvJyJYA-1; Tue, 07 Jan 2025 07:32:24 -0500
X-MC-Unique: ARf3idCjNaG1PcOEvJyJYA-1
X-Mimecast-MFC-AGG-ID: ARf3idCjNaG1PcOEvJyJYA
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee3206466aso21524116a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 04:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253143; x=1736857943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA34be2teYEYsr2t/72VryT2qJhAIzW5Ui7xESwTB6o=;
        b=HRm9wMba9wbEr3opfRMcbiMbSgqQQrqcp++CZZuu6OTmTxteZMeNliftbOB7zzRXTI
         61rn1RMtkCP9gnOIC4xy3UhDNDSoxkewmKrKtx4eJA0+WLSP8uLA+PFLFbvhDfaohqAr
         wMPocam0vQOnbK/xiyZq9KnV7PWavRqEZNcqPU43u6iA9OEdUWljp3nbTTJs6OyzkF73
         JSFqE7+XkPmJk8hjHr1j9WWVQIXASeRjdbJvCPYQd05P8Qvoh+P3qmP8I4iy1jdWHClM
         ojunhJIAHWAuJXsymDE29yHxvC6ldSl5okwxWqj5neDp5D4tO/ZjBpu1KnmSA4mIr7jZ
         +uKw==
X-Forwarded-Encrypted: i=1; AJvYcCUF6LInNzrrbuFbzuTHHzTwnFqH7OnlUIXuB3zc4ol02gP8NuYnUhInN7XIzT8/9OPWdu8zz1yUSze6D0iFNFJK@lists.infradead.org
X-Gm-Message-State: AOJu0YxwKzfEtzvJUtSk4vIDhoh8RUgYmfEFLZRuzoE/d/fHvejltcPd
	YXWlAuy+aQ3tFrOCW8QkNc/VkHnmnMJYZYRxJFgC08zrL5+kukaI5N0stmRUwl4OTESgukSfyon
	k19YGOAzqB/32z/1/eCz/s86/JsaLR3tOK4XlXpZ2j1sOBg2GUfO8puOutZSnnCLsXMIQQEFkMj
	jH3dsyL1Pd7h8jH0ayun6zDvM4aoxKIk7yFtTvkjlaeURy41k=
X-Gm-Gg: ASbGnctmLL/Yz7WVg+5gGPPyMTXK6jjKIr4ihE+MjDloQSTJjhNGu3dEVHr1IUmqumV
	/YW7PLHBV5DyUa0B/WMTIXxvUV2vLIQEjHV0ltXKmgraNABvH5jRWEsIvb29KEkGPe+sqig==
X-Received: by 2002:a17:90b:2f08:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f53cc0026amr4449317a91.9.1736253143215;
        Tue, 07 Jan 2025 04:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXEm8Tpwx9R6D9Gw9QHyKE+GR3tsYiiCv4Ym0+gd1Cz9oD6CrSF51bAc0DLA4TAYCA4UkwcBAPiOxCypE3SI8=
X-Received: by 2002:a17:90b:2f08:b0:2ee:5c9b:35c0 with SMTP id
 98e67ed59e1d1-2f53cc0026amr4449278a91.9.1736253142921; Tue, 07 Jan 2025
 04:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20250103-airoha-en7581-qdisc-offload-v1-0-608a23fa65d5@kernel.org>
 <173625003251.4120801.586359106755098449.git-patchwork-notify@kernel.org>
In-Reply-To: <173625003251.4120801.586359106755098449.git-patchwork-notify@kernel.org>
From: Davide Caratti <dcaratti@redhat.com>
Date: Tue, 7 Jan 2025 13:32:10 +0100
X-Gm-Features: AbW1kvZ_ZjT4b_8fuDBZTcCBlMZd_2JVzhsmZ6fS1Bss4oQKv0WT0sawYektIcY
Message-ID: <CAKa-r6v0bEjQfbSG75E9kV1Qki-5eAbrqiy2maB2iG2O4Wf5Xw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: airoha: Add Qdisc offload support
To: patchwork-bot+netdevbpf@kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org, upstream@airoha.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ToJveylc8O2yrxy7S6GO2kicyZeUhtaY2vTYfdp6EmY_1736253143
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_043402_620769_5434F9D3 
X-CRM114-Status: GOOD (  11.06  )
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

hi,

On Tue, Jan 7, 2025 at 12:40=E2=80=AFPM <patchwork-bot+netdevbpf@kernel.org=
> wrote:
>
> Hello:
>
> This series was applied to netdev/net-next.git (main)
> by Paolo Abeni <pabeni@redhat.com>:
>
> On Fri, 03 Jan 2025 13:17:01 +0100 you wrote:
> > Introduce support for ETS and HTB Qdisc offload available on the Airoha
> > EN7581 ethernet controller.
> >
> > ---
> > Lorenzo Bianconi (4):
> >       net: airoha: Enable Tx drop capability for each Tx DMA ring
> >       net: airoha: Introduce ndo_select_queue callback
> >       net: airoha: Add sched ETS offload support

I was about to comment that ETS offload code probably still lacks
validation of priomap [1]. Otherwise every ETS priomap will behave
like the one that's implemented in hardware. It can be addressed in a
follow-up commit, probably.

thanks,
--
davide

[1] https://lore.kernel.org/netdev/CAKa-r6shd3+2zgeEzVVJR7fKWdpjKv1YJxS3z+y=
7QWqDf8zDZQ@mail.gmail.com/


