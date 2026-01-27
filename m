Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5352CCA6CB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fhNaoxeEqHkgipGOWq15FtPWpaf67z94Gjy73GwHac=; b=wZj/ikHzckpWiZ0ZCOneRdVz7P
	mrfUDDPLEu9igRrS3JE07O3RWYNmOUt0jgyGXe7l/RZn52C3AKD62ssZOIQEgfHy3le3+8kuOCq1f
	vDCexMDLOss/lNsJXS1417NxN9WGMaCBXhxCsBYQwfk8YXPqExaCF/FrgVQJKjT8QygXdhOpNArrj
	UaLMDqrubkbuXuBmLtl94/VKSj/ak2N+wv2WvVUdp+h99zSYwTAYhYLIX9z9P2m6fOhaCblNgA20+
	WYyIyBZrlS9tvKZ47ycbY4XcBZHS3L+d4Df2/BB984kljovxSdSGPmp9rcDxu/Cqplggz4YiHbK8Q
	VoPSBp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfKP-0000000Dvnj-3yAf;
	Tue, 27 Jan 2026 09:25:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfKC-0000000Dvm6-37Ca
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AD454425F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73C9C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505927;
	bh=4fhNaoxeEqHkgipGOWq15FtPWpaf67z94Gjy73GwHac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xql7HytjIomnGYTsyU+yL/RmeJzSAwfYRCSswOLPckmrBUB9YIpSMUl/X9729DuGm
	 8c5WR+EEN94vlIk1jb5NC0skDFoqLBPtDBJQN0ZEiQfESE2BosVrgh9iofMFGXKjXF
	 4MXtweJh+rum68lIDMcNWgJDouo6o5xmfQSHq1ZnMTcsEY2+YrzntGz0M456rtHiJi
	 K0dZvzBerdzbZ9icNgYQ8os6X/ru9bfIQFLRRASdx2DoiCamLH+2iqFa6PcfM0zKtV
	 EuDwZXx/oTg0TgyZCBleRBowWqki1kd+WGxftWQnQhmDcO9LhfelvFcL+xaRohr4Je
	 9WDl/ffGAHtDQ==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6494a3d92f5so5791413d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk6+w0ivWBwNU8Vm2S7oAWwyvLf8Kc/gZnwEF+eJbTnClnxfIDzyibq46jV2YDz0Kd1HUgwSTmlOwj2v/H+5BQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCKrRtcZlSABj63c9zZROvig9Iehib0Se/X4hztRh7dfUzbGsN
	fmu8ZO1w6wZajMHMaL97RlYXyxz2GZc23R0fCy8fmnbcFy/l6klGhw4yzWmGguW5hFvzDClZZuu
	2uQOIT5d3Q2oJ/d9Fwrj8VmKS17jfJec=
X-Received: by 2002:a05:690e:130c:b0:646:5127:9d14 with SMTP id
 956f58d0204a3-6498fc68930mr540909d50.79.1769505927330; Tue, 27 Jan 2026
 01:25:27 -0800 (PST)
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com> <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:25:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm0vj7ODP6xq=YmCbF2WomKSnY7PAMiSL2zQ-DNUdKfYw@mail.gmail.com>
X-Gm-Features: AZwV_QjVWNP4X4nR8KbNY0bXRJ0Tx9Nx3_diLL7W3D_y2HIVAXBmR108tXoT0LI
Message-ID: <CAD++jLm0vj7ODP6xq=YmCbF2WomKSnY7PAMiSL2zQ-DNUdKfYw@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_012528_883176_08353305 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, Jan 23, 2026 at 11:42=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Because the HDP peripheral both depends on debug and firewall
> configuration, when CONFIG_STM32_FIREWALL is present, use the
> stm32 firewall framework to be able to check these configuration against
> the relevant controllers.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Lean and clean!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

