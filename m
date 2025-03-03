Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F71C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUhmolDFCbsRrygEyjdB/SNREOTYrW2sTqcKH1rfaVc=; b=P7ArsJMDS9yJCWPcpmxY6rSrkx
	I3seHzsxieIs8uE+aRItVP0tytZxMs/80yRzwdRocGVv1+nHeRvu3jELOMNRqL6gmfAOUNZXLTUl8
	Zp27HYxa+WeB2GAWNjkBeG/5eh/yV+wLfKJnhkH/GHuhoJLkZyW6fAW3/fHJaioQJUke1LWQbjLzE
	wVTFxn+Jc/lifBIyKd4KgTT91WQ+9xwp0lbYcvh1nvXe1F7fITPfjA5XPxTKB5EFx4us+J/f15Q8G
	6El+YSXx5rejzIS0j65JgybGNsHiYXXBCOjP8nQ6XMk6MP7wnkULTZNGMBKLIwFuqudHMlUbpw0iL
	DYlfHKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9jP-00000001myG-397S;
	Mon, 03 Mar 2025 17:37:31 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9fc-00000001lsE-3feb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:33:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso8141337a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023215; x=1741628015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUhmolDFCbsRrygEyjdB/SNREOTYrW2sTqcKH1rfaVc=;
        b=VPgVMgC4aQQRvcx6ijgMEdPEbtvm8RU4OcuMSNrNw+Jkm2Uh4xpDKQKNnPyD+iTcnA
         PsA00aUqyCURFL3izJYQ4pR+vFDFEqy7GOLiclLQHqGvYWxqtAxwrVYT4iKfPRohmvnK
         czhWeVv1m5kY1TFPvT8e6EKcJ5XTA2BHvfq7yMyqML8soBC/2KPzpDkob1QlFcJeVp77
         94U0vvEhrjwBA+T0w/mtvKj4J/+L34eCL38dgWoBGL7CuaODXYPR6G0oKUh1CSqDuug6
         BY980Z5Fll65lTzUjPtjipbY3AzG3kURVTrPQ/UxX8nRv3Fi+B5fVWxQPk/rZjvzk0ml
         4o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023215; x=1741628015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUhmolDFCbsRrygEyjdB/SNREOTYrW2sTqcKH1rfaVc=;
        b=LNCbNyrNE105it204Uv1ANGmWurjJG+Q5y0j9LrluKzIBhBcYXaL41iznyyZq0fDxB
         woQvnzIYqrb58OU/FvS1icAkjqWGgoOXj65Nf9Y0+4xUGwIycB2yITkQXGhxYQVnl+kV
         drjTNWAzqf8ULftG67ELUNiBeoYM3hiZo8BBA81ezInqre8LF7FWbG/Od6Y4uTJEsTam
         Md+qSVTu1d1OzXaHVwLE+O4cyJCqkzd+Hyq0Nq/oQtvGt6mOHiF6tNXS1NPWmbPGfh86
         DZTtFZvvKncZV5QlROjbCcqGtEXxWPc2De8mtZLl3zocucIXGuSNn3Bxavyg0xcjqrWc
         0KaA==
X-Forwarded-Encrypted: i=1; AJvYcCUzCmdt2zpoTvgqZaYOOE5F9zuXfba5k9LwOWJGW9qVH1oqK9SJ+hj+zsH+dF7G9qEq6ivmav81CYBoBi4LpcAE@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqUCOuS6Jjngpj3h6rO9a7V0ZHZg4h4MR53gQ2Bw2G97byV7g
	osKg85cNJAU/6RQm0wjL3+Q3SACK6nUmDXEOLA/8+qyDUis/4R/LtmVyFjWrDjg=
X-Gm-Gg: ASbGncuHM5vn675+wXkINeEN8qJf7Fd9hVUopP2/gQgR79a2JB8B8AlWh0ae4y7VcLY
	LHuZml/CVZXnIm2tMw9GCe8uYlPlWCjVOOqVAXxQgCpXnNkqTNlDTURTLsyn+MRixJD4pECMYmk
	vUzeaPxXCCte+RmIbJV6UtTClRHu4qZ6nIBtcguJOAXqkNExoK08fttNjkcEg8T+fuSiLwGOJss
	axMqviC5YA4reK7wDp6C4N2iCI0cs26VwFQdyetDxawcQhIMIiYHuXOkBop8NVC/Ggxf8ouB/YP
	UcPLSIwXao4Ij5aQJlfNF/Xs9B7LDYYs6nf5lNP+DA==
X-Google-Smtp-Source: AGHT+IEfd6FqNltMqV3tCjIrZsZmfb/5XycRyRy8vJsW4t7vzj04maxfZbsm1bvOwLU1xzzl3b3NTQ==
X-Received: by 2002:a05:6402:350e:b0:5de:db0e:311f with SMTP id 4fb4d7f45d1cf-5e4d6ac4393mr14943743a12.4.1741023215104;
        Mon, 03 Mar 2025 09:33:35 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e50751c496sm5104649a12.67.2025.03.03.09.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:33:34 -0800 (PST)
Date: Mon, 3 Mar 2025 19:33:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Message-ID: <Z8Xn7f6vXg0aM4zx@linaro.org>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_093336_910769_A6204356 
X-CRM114-Status: GOOD (  13.27  )
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

On 25-03-03 19:30:58, Abel Vesa wrote:
> 
> On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
> > Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
> > it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
> > the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
> > 400MHz.
> > 
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: clock: imx8mp: add axi clock
>       commit: 2471a101938b0d1835b1983df08daeb98eef1205
> [2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
>       commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
> [3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
>       (no commit info)
> [4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
>       (no commit info)

Applied only patches 1 and 2.

My b4 setup messed up. Sorry.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

