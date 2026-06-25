Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D5CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnOh6DAm+iyJOY8k9lF1wLJxsL5PuyoGuxA7tFKj+gQ=; b=MKINfKXihX05CqGNkS2YXv83NA
	Ck+cpf0euxYoaa4fFF5TonCF2SCRit6FZ/e4pEvtTUTSkzdoWJ+HWbY0JqkZvEfsqjr0zE8Xvylub
	zYtclYfs2ycRk8xgTMJKj2f2irVTA5JdEsJ75TKZvM216rX0D7xl5mUYnf3C2Guy76KzKV1Z2tYxG
	fjR4AcAOlucQLY51RLAxkAqcVdHITSS3iBBUPF+KZfGl6QIOtuPIwQ9MGvxniMnTNCdQEPdSyAvc9
	T4wKQomDsMYm85aelLpv8v2rJCPat6/tTp1kq6acoxsjXE5MoYO7p9HOuO1chrlRDGDQuESSbnByE
	49U9ra9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZk8-00000008Z9e-3ORr;
	Thu, 25 Jun 2026 02:23:04 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZk5-00000008Z8T-1iAU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lhjreogzzragvezzbpqetq5pkq.protonmail; t=1782354178; x=1782613378;
	bh=JnOh6DAm+iyJOY8k9lF1wLJxsL5PuyoGuxA7tFKj+gQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hC25C7qQy5j6iwI4a0K1wmFvikllCXNDl6SKSxdSkhxW0mxWxC6eSr/7iO1N8UWzT
	 2g3rMnIkX2Dtro8UcbuKCPzvYLMi+iegQ4wTwEnFtnQruqOKFmI7LGugF4KOqJOIx9
	 WFdHwFJyvAhX7Dac/lJ8sBMpht9lnNnFFrI00IAuxq/RuQizk4P7vMbGZ7CeUXLP8P
	 v6YresBYDL6L5lvmxQxVU6TC4TWHZ++kFj6zDsUHWxHb1stLECEFDMoX4LF/T2B/EA
	 ihkU8Cl0Nr50OyD5rQij5eitWnQ4EY5qCg/9iqXDc8zcd87hsxWgSj9LBWiLnwREwE
	 B6ud6H57li8IQ==
Date: Thu, 25 Jun 2026 02:22:52 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Message-ID: <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
In-Reply-To: <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me> <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 2189097c3afc9ff31fb66855912a0f096fff92fc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_192301_819386_E2944491 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

On 6/23/26 11:50 AM, Konrad Dybcio wrote:
> This can also be fixed by migrating to use qcom_cc_driver_data,
> which takes a list of alpha PLLs to be configured, and thenthere's
> a switch-statement in clk-alpha-pll.c that always assigns the
> correct function

If this is done, should a patch that migrates to qcom_cc_driver_data and a
patch that fixes the issue be sent, or should only a single patch be sent?

Regards,
Esteban


