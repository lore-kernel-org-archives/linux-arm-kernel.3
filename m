Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C498E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 05:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=; b=WYMR+JRjL05Cg5T6+IFtr12csV
	21mCqJ3h4n5GYJyuNLOOshoVXLLEJRlRKWkqTANN/srH9FKD+0A8Tbz6KNNSGaGBan5BItGw0mr+X
	uZYcHzmgdgo+1RnuZvjMGzaf1gkXDudoSoTTTwr2PXC/kwDN6TGsoQ9eIrnPnkWJoK1ozEn160DN8
	hrPfDqXP9YJ7xfDqhhXMxC+d8kSSS3C9EYHGYvjCx+/839bvdP/MT0MjvnrnUfHHhWakGX6SHGmkp
	Ak0jhuAD7S0S1mj08qqMlvOfz9q4xeU/cnPLyYPhEGOAoqvTValb50f4EuT5IgEls4CHT5eJnfSBa
	WdNzzqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPx8b-0000000BHDL-2pxc;
	Tue, 24 Dec 2024 05:07:21 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPx7E-0000000BH7I-0lfM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 05:06:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so5293314e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 21:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735016754; x=1735621554; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=;
        b=w66y0LEK/TFlb/QM06qm4uVVyykwTHZcnUEmxft4OwNR97Y2jR3KNpchhbNlOFc+Wp
         c/lruVA05/zxG5OzZeQuRBKocX/eX+HZMoFAaO4X5YFZfYHU0M7UzIOUlfVSOWDMxdan
         oR9xJTL+TDR9Uzg8eih5JavtuDsxfloGk0Vo9d+e1zb667Oq6r7R4NiNIb9FxSuExhfq
         Kms44SgunEgL8Bn58GlVsl2v8/Tb/fU0TdkGn8zpxG4O6tGjAMu0g5e1QvWqpGOyxKmR
         gGMyrSmbdXqmPEmilF/Y327NeryCzDyZSJahZgTYG3b7OhPamw84MhFNhqlWPykkfpJ2
         4R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735016754; x=1735621554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=;
        b=u125FMYpP+GwlF+Gui9LE8t14AyBdPEPURjsVRcijNY8cAhkEZr0MJIpA95Xcx+ITn
         BZBznta62ZPwrBubAUUo9x8JTYGhzeacdMKqRbAsixXA1+E8nnL7xXRqztbM27TyIt+z
         7iNhiQh+QElikSCzk49OQLSVLAUG88/njKh6mXqsmjxLzm6rnZDFJbztR8QwChccg1gv
         Dkt6dtlmlBtWLOEHhXLTAwajq/V9tQmoc3d8ZeCZANH0zt1vS0Lb8balKT4kqXWOfzw4
         MOPR3UU5ij6aaOyv53kZXi6Abh8Z9WwO9KPpv7I8AQWbqiT6vdq80B8ZxkrmlGK9Nved
         x5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWfjkpKRmZqGv1ohbNyTzeL4MCtseHJPK1KwhHJ6eXszXhnjm3fic7LOziV5Y/AgmRZD4+jaXv6Re62awDyKALO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/pA0aiJDTe2vDMKS2aJ8kM6EQHMvNrf/b0uMfxxTHrmluRwYL
	5VsswjEgIEuyBPA+5ihIxts8LEqa0XfIJOde+J6LdsAAoQO6EkPBG+3BQ2ZJmt0=
X-Gm-Gg: ASbGncsyZ2YmCxjatPQdhfdc8V/t+zEu02ojay3CSJf9vliYghNh7rnZAK8sqhWfkFA
	GHF29cT2tKDglhps/u1Vpr++izciEmDSgA8PCLMxE7MhiyhUV7iAi6S7kOToLRl429OSNW77x62
	QaC299+xhfV6KArGrr7K6cTUtceGAtA5vC9yW28Wxy/l70h06tSRpk4XRdmUwYGDeOagf2fhqyA
	vNr6nCCmKKk1wGxe+uCv9fGf5LbNU9/pH8mH8mmpXWeBWprbRlfoHkbF3evqmuSz+RwxmpfuGsy
	dpMNomyKNCHI2HCSfizygTwulrGpLDcsSe8b
X-Google-Smtp-Source: AGHT+IFEQbqTtUHwKKMk91ZNCPcChoIwDJTCy518t9r4AD4nY9+X1Uvz8CG9rXE+5M9RXLCgiSKkQA==
X-Received: by 2002:a05:6512:3b08:b0:542:23b3:d82c with SMTP id 2adb3069b0e04-542295244aamr5324092e87.3.1735016752385;
        Mon, 23 Dec 2024 21:05:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238216cbsm1486707e87.216.2024.12.23.21.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 21:05:51 -0800 (PST)
Date: Tue, 24 Dec 2024 07:05:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos: add support for
 EMAC on qcs615 platforms
Message-ID: <htnq5jjxwbsn3fjc3m6tzvyqrwzckipd3z63j2dotkliiwnqgk@lifzh4q35dqg>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
 <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
 <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_210556_251409_649065CF 
X-CRM114-Status: GOOD (  25.63  )
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

On Tue, Dec 24, 2024 at 12:36:29PM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-24 12:18, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
> > > qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
> > > compatible.
> > > 
> > > Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> > > ---
> > >   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
> > >   1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
> > >   	.has_emac_ge_3 = false,
> > >   };
> > > +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
> > > +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
> > > +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
> > 
> > lowercase the hex, please.
> 
> I will take care of it.
> 
> > 
> > > +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
> > > +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
> > > +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
> > > +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
> > > +};
> > > +
> > > +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
> > > +	.por = emac_v2_3_1_por,
> > > +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
> > > +	.rgmii_config_loopback_en = true,
> > > +	.has_emac_ge_3 = false,
> > > +};
> > 
> > Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
> > emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
> > corrected to use qcom,qcs404-ethqos as as fallback entry, making this
> > patch unused. Please correct the bindings instead.
> 
> Although they currently share the same data, they are actually two different
> versions. Their differences are not apparent now but will become evident
> once new features are uploaded. If I revert to qcom,qcs404-ethqos now, it
> will be challenging to distinguish between them in the future.

Which features? Moreover, note, the use of the fallback doesn't preclude
you from addign a new compat entry later on. By having a fallback you
simply declare that the device A is also compatible with the device B.

> 
> > 
> > > +
> > >   static const struct ethqos_emac_por emac_v3_0_0_por[] = {
> > >   	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
> > >   	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
> > > @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   static const struct of_device_id qcom_ethqos_match[] = {
> > >   	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> > > +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
> > >   	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
> > >   	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
> > >   	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

