Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB5C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+NeI4oPDFcDXRLGoGYINFchF4i+6dwoVmcAAxulswU=; b=rmSc81r4eyOk25vdCTVwtOGm9x
	jxPy1nfTdiSLcNTAqJTdOv8HZX+P6bCGaCF0lhc8wWBy+4lH08MnA8FAtBYHZDqF2Bzwi0soDwNe8
	dXpt/a4NJmQM2UiFSPux8Duw7pRFwkxztlmUz1Ss/+w/5eNkDPNEMCbMLMKvma2FOYTBMYj3dD1zn
	N3HI0Sq0xV0b/+8SEdLLrM8ThwQ+JsELl0vwzl2OTOtUTvVnlAGXg1kjQUmzhc3bCRQBhxQxKqHoK
	pbPJSoJYXWtFHWm03vYqx8tPJN/W0RD58q6oP+I2lueXOtKT0sdo1qcHmLR8rUzYVJhJ1jf79B1gW
	vnMDmZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Zv-00000007hgl-2kBM;
	Wed, 16 Jul 2025 12:49:43 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1XR-00000007hJp-2zyy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:47:10 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-718389fb988so6187517b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752670028; x=1753274828; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+NeI4oPDFcDXRLGoGYINFchF4i+6dwoVmcAAxulswU=;
        b=d4Qt4oUy9xQpZl+gK5VYdb+JEiNOOhJ8vWeoaghzZzocX5jUp54ek1q6uNLqQyZSuZ
         J2YChCJpVBzls3cTSIorlYq9GUwz9Zcfurb690hQkLXQNCkfwwRTy2C/UrnQG3VbOjj+
         KsOlRtKDafWVFEiCIlJXMYebl4BXEjqfW8Q8J5ehHJ06ggmY9F6gpdKQcRtwC4RNcyDR
         36o24aIVH4Kz3Wyl+Gh5JCqw/T4ce9LoYstjFayPuxhgQQ5AP91UiOzlJGzWvMUP9ncF
         iV61OX30x9jB3+ZM+ls2nEgd1dzUJSgn4tYRnHdvHbKsMO3WUEOStmTknCGhqrSRUHr3
         Hvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752670028; x=1753274828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+NeI4oPDFcDXRLGoGYINFchF4i+6dwoVmcAAxulswU=;
        b=FPE7AWPjuzRikkxlgNjMIRB0dobhmtD+3HCVEcN7YoB3lNhVaPC1lV7dNpE1yg8WII
         QXWEKkWxNgjlOLbw1kH+pNkYicVwiSOE1ygHYARW3sYfa80gzkPgUSHez/JZg9UA4buc
         3aJSQeGnXi/dBs7XVcGEA7Ga/d16dPT8CxYdMxWh8WOY79+5GpGmAsUlSA4cV0beyZtv
         gyyqmY1KVxgzooKZx1AfuYpgwL1+wKCCfGkHTa+uypYdYSNUZTnXbWtCma8tQUSGF/4C
         YLk4ilW+cMYLLG8Re+A68BvHJtubxKtMfs3trD72+pggZyfPm6uuKcOjlFPHxvZx9MxA
         MZDw==
X-Forwarded-Encrypted: i=1; AJvYcCXZF7vwg7zIm1oxXsD3+N4rNuPR/EBNwzs4qYPTjOkh5PsFRe/Q1Uzfw2n8o5GsuJIc4a6TGqdAknTLHQ5fYDX2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+GyGyuMDnCIWOXIMZgbDfzCvu4NrW0PSV8/7PyjErHL4eDbuO
	QkxHn8wLXk+qe6XksFUbaVc19NYcqfra7DTrUc5c5aiPzjbWQTKb0cTXXiASq4dkPwoZOzFLb+G
	FoNTBj3u7Aie1IlKXihkzxXe1iX2LeScZpKjJwxAZEAmpmdfrUgYfEhE=
X-Gm-Gg: ASbGncuKPuaAnnXvCb/iYcpB242HjAfUU4xVkDf4sq9HNR6An41NMQNmf7fiKxOSCYm
	Gyf7BUJdNTZ7CCBDy1o/cLgB3ms8TKMWKjsAVQNBXfeI8ukNaX8o5EHdFHoFHCLCJmPmnDDl61I
	O40bMHlejtb3o/FPgPbTVlcZ6ArI6+APeOQ1UbQAk8mp6x0PKYaN6oEfJZLLpJMq7JJigqNJM/6
	4iU7wiF
X-Google-Smtp-Source: AGHT+IFnmV7tqHnKAAZin05zl23pu/BOmTcDrsz6MJtyOoKAjZsusep8borKW7RWSkgBxZIsdcr3u8g53bJV87ZlM/s=
X-Received: by 2002:a05:690c:6504:b0:70f:6ec6:62b3 with SMTP id
 00721157ae682-7183515bbd1mr45195087b3.26.1752670028190; Wed, 16 Jul 2025
 05:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com> <DBCI05B4Y2ZX.VM9KNB61PGU2@kernel.org>
In-Reply-To: <DBCI05B4Y2ZX.VM9KNB61PGU2@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jul 2025 14:46:30 +0200
X-Gm-Features: Ac12FXzurDUmM43xe6kzQuLOxwsQlwsDpzV3_U4qJupNwsd3iX_y9_VZPsZolOc
Message-ID: <CAPDyKFqUHmMi6tBOJyA2YAOYLX-c_kDMskyRTC1Q+c9B4q_g8w@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_054709_766606_7A61B259 
X-CRM114-Status: GOOD (  19.13  )
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

On Tue, 15 Jul 2025 at 10:50, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Hi Ulf,
>
> On Wed Jul 9, 2025 at 1:30 PM CEST, Ulf Hansson wrote:
> > I decided it was time to give this a try, so I have queued this up for
> > v6.17 via the next branch at my pmdomain tree.
> >
> > If you encounter any issues, please let me know so I can help to fix them.
>
> Can you please address my concern in patch 17 ("driver core: Export
> get_dev_from_fwnode()")?
>
> Since this has been applied already, a subsequent patch would be perfectly fine.

Hi Danilo,

As Greg and Saravana were happy, I didn't want to hold back the whole
series only because of a minor comment on some missing documentation.

But, yes, let me look into it. It may take a while though, as vacation
is getting closer. If you want to send a patch yourself, please, feel
free to do it.

Note that, while at it, we should probably also add some documentation
of device_set_node() (next to get_dev_from_fwnode()) as it also lacks
it.

Kind regards
Uffe

