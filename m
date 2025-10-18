Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50504CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=; b=iECxqQSideKLAMVbBCD7iVkU/R
	+46/zyWwGlOt5+tWhL0vXjw0jAMlRacHjHZcUB0NAFRCtyDZd4Rj7y48Lhkjot6nDMJLJw/3bh7lk
	UGxuNfPDUtX1CFNbtkdfRBotegfRuALMXpL78vDC4yPWkJLF0Zh3OeIW4QOWvRPkPgLQBjh4/3gXg
	PgMxl8VI0avDXrnFLTfodV1KuYvZmvG4ikRSMv4YfPPTEZ6JSBB54/TvoDSvxXviDfMa7jYXr0Hz/
	7YIdyESGEdjAzDEhW/yTnzzKT/EIIO4g2muG+kY2vLRuPrv0AKGVQk6lzP93ShLl5Mp2ZcRFwubdb
	rtWdNMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA39L-00000009jsf-0iF9;
	Sat, 18 Oct 2025 09:22:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA39I-00000009jrh-1xoX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 09:22:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso4634408a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760779370; x=1761384170; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=;
        b=HNn7lDYqNs72K+E7Es2i0hHqGnK6Gk/L+KmTA/5YxJAeTVwHFM1T9TZ8qI+R1KSULH
         h+6kwYVUZYYXmUQMgr7yxw76emKG8N52Xus2VVS+nBzPcw74K3uYNYhSs4r1CLtl2+Nx
         GWoax4kbWtYPj7yk9zJVsxsXIN1I1sfaSJZao1X7mftTQr9TMez92LN2siewt9rYgdGu
         fmni8n8mNWWxvzKGN29u23/n8fOAta3Md0ZF/SN1CxmAnuASYpM6WEbtTYh4gVsFXGXK
         lFPfq3xGkAaYzfYSWyPcAtGDvdTjUAl1WVNQaiHHanJMD4df4ULDseZDZgnm/Vx25pbJ
         I4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760779370; x=1761384170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=;
        b=tUD5UqHwCozWFxm6thrcG679akZ5gmJinfS49gf0J/ra8K3D3s0gGsOvpdYKFG3wdV
         ogHFMn7bUM0pjYUCNT5Y4KtnDznItnSoQHEEZA95i8T1/alAqUX1wq3SxD33Z/q85J10
         TJhwYmwGlwN6S0M6G2PvMUIH8xn5d78j36USNetkCZi6k2VR8o5qUPeOyAROsbDOXFN7
         8GNJgncc7ulJPxcf9Y9ja8oDBWxhwG/mydCsIjDjCM0yv1ITIEikUwtVEr00LqmnYKig
         HjwFENlJANlXyBdWQ725GMHM1WDlpvqod7Q8l8COCE2kiiOnG7XKc2Az+E893WSnFyjP
         R4tg==
X-Forwarded-Encrypted: i=1; AJvYcCWTleXafrBNEGU/lma3zFLngjInU0cY1D+8JwIPhbfvioyG3nOm6zPUhRHDumvxeeYKKV6MAi0DXjacXL+nJEHT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi1G8t2Q0eSOtk2/Gh4DxYBs6Li23k27VG65jyVOtoDMhXXXRA
	4moAAfncwBFMpIwjlOTT6kCtoUw7G7YiAYjWAov+RAtV7pNmwVHWj4HlTBlHDrF3gXgvqQhiaIT
	DiHjpFrffo6ZLDLikpcoY1VhPH4x8hpI=
X-Gm-Gg: ASbGncv2Aetb1ZHpRUC+2pKillIRSWdETLza/pwJx8p2lxfp6qYpC5MHHo2RLia9C+E
	MVb4tKlno1vuwbdv58YmcoPr0kNY1VEFqiNipqufJ+FZGer866aKOTQ1JM/xfzRyb1RH6DDe7oF
	w5np530EnKwF2Aa6s6WKW6JHFrat/WOmL4eZ3nm8w7WyLzmD0qB0cXKt4oc3rW3Zf806oo5Zemt
	Dj73HCZEAY22W0viPZW/Llurs4AKSzUbLpD4JL2CyjMsEhQmgEBF/JqsywQZro+dWZbJw==
X-Google-Smtp-Source: AGHT+IHw19pBZ9IqmqMp9HxxNmCsj695WdYgJZRejOrWZTvR3/bpEeF5am+muoYu9/EE8QnKVNq6O32MbmibLE6n32Q=
X-Received: by 2002:a05:6402:d09:b0:633:7b1e:9aa3 with SMTP id
 4fb4d7f45d1cf-63c1f6f6269mr5785386a12.34.1760779370419; Sat, 18 Oct 2025
 02:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251014113234.44418-2-linux.amoon@gmail.com> <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
In-Reply-To: <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 18 Oct 2025 14:52:34 +0530
X-Gm-Features: AS18NWDbaJ8hdNv-j0Yxl1ICNkckxlgqQRK21f2Q02tESiNZuDiGqp2OynZDz4k
Message-ID: <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_022252_515702_77885AC0 
X-CRM114-Status: GOOD (  19.99  )
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

Hi Markus,

Thanks for the review comments.
On Sat, 18 Oct 2025 at 14:26, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to ret in all error paths within j721e_pcie_probe(). This ensures
> > the original error code are propagation for debugging.
>
> I find the change description improvable.
>
Ok, I will update this once I get some more feedback on the changes.

>
> I propose to take another source code transformation approach better into account.
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075
>
> Example:
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller/cadence/pci-j721e.c#L444-L636
>
>         ret = dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), "Failed to init phy\n");
>         if (ret)
>                 goto err_get_sync;
>
No, the correct code ensures that dev_err_probe() is only called when
an actual error
has occurred, providing a clear and accurate log entry. For deferred
probe (-EPROBE_DEFER),
it will correctly log at a debug level, as intended for that scenario.
For other errors,
it will provide a standard error message.
>
> How do you think about to achieve such a source code variant also with the help of
> the semantic patch language (Coccinelle software)?
I do not have any idea about this.
>
> Regards,
> Markus
Thanks
-Anand

