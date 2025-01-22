Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCFCC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=; b=UeeDtnJQZ5cFTkO2EYVwyLqtMS
	X/hQU3PWhrD7oK7CF0MNYNxUa84lBS3b4ekqHetU2SQk4x6TQ2iJW4G0qwMyCxfGS8utC7wh6z8aZ
	Rm/VGEGwtyi8JrgSLfI9dhoFGnGWBC8EhfpiZchMtxfQqNOtOytdC0WENjKj7OXsDV2ZTjtffTT2G
	71HPOxm7A+5BIFJMo57daCU+zk47EOJcijvNYpg6Fd0Up1hlEGvzC92KMIpVrITOvBTvQCXYPt8ci
	k66BYYzztfmsubesrNUtzH83EmF8yaGjYus/vf+hqiIeJYQ+3fkX+Ou/3Vs3ec4L6gWZ1vqFZNWWK
	OpbCT0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaqx-0000000AIB8-1jIT;
	Wed, 22 Jan 2025 13:33:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taaob-0000000AHaF-21Ma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:30:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862d161947so3704964f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552640; x=1738157440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=;
        b=xGP4nkfKiCQkJguDwoWnMQFcftFM4VSX4heaMFkTWnAUrhFJEGg/BK+/j12GxsQSyr
         C69V6cmAyAo6VcRKbOMIxNGibkZR4cbMOmXoQ8f/o16KdIp4bLVJ1c+c0YM16cl95f/x
         WVRRY+tNa377HGjd0nMgiGghi7m5OH5B9krr3qn6HYJwJZ9UjhNaKevYiRbN1NkZy9OX
         6gxEUPqaSJEdCPboVf2alZCCVA81TBfizUEhb+ner3+oqm/jyCMZhDcWpObIZbhnZ/qI
         7HUeCvhe5yVMWyGIg6HdpVl6JuIt016z3PR/j2vt5LqNOwTXbtIRsWa8eFM1QmEmczKJ
         dcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552640; x=1738157440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=;
        b=ZvJ4+ZEUIHuKMQEIJWScfVT9Zz3JQDo2theHW0gd13jL8TkhU5lkZz5qp3P1mYraMg
         YvW7Qni2sHS5T8e0SwTCrzIapN/2EkU6C8pPK2t8AnycDlUG+ZFL6v7ehA6tMeVYEfrd
         Rqy4LxSbGVV9V0nzFjLzeDQPJ++QBS+BCH40LdPcDUjit2d4aBJcy5uuIouJ13nBoopF
         2JFY3npCYXNq63KMlHvgMsgNHtIhkXNE3KtUa5RNAp7tPXOM9nwkmw/1UQ1ty0vuFhRS
         glk4QXKsaOtkFB0neZD2prwbYr8UwiwuHRaLZkyu03vhI4GAMbgoTiCt0NRrJvqoEGLk
         Er9Q==
X-Gm-Message-State: AOJu0Yz5ibYYBPLd71tynvVMlg9IMvd2qYvxaTl722ec5Ol7ZRgRBfip
	o0a6hhcQfIUFGtvTlYsWIittkW7bGvsgSIG6RbgjmFt3LcIRtGSkhVL0Cdrhfk0=
X-Gm-Gg: ASbGncuTI9mqH8WH5q0OEl1YdnX05Sk0SLyoXgZdXn1EFbT/nXF+KgvEUythQzWi4D6
	tnt4y1jxqbYsrAehuT7nRItp1+03EP1UH8L4K84bHurWsKn2H6BVD1eVpyt2wwEiSSdHYPCWdX/
	mX78VT9g58TBhe9bUs/FKLCarkfLApjWlQt7pFR9w4WhEp6yUXsoFmHIN9i+9dhzTyltBB4x7CX
	TfyNDznGTFAD4MdOsCiRY4KAVEThDwTlyiIE6OINOX9lmcpYiZ9OJGjjW4Vx1iERxpzRb9+BJyN
	Y6jGPgI=
X-Google-Smtp-Source: AGHT+IHGz3oZZDXrd7dn+W7Dx6QiFyDmlY7D2ck63M0pEtyL+pVpGkX33GNbY2T81rXpW5skMbhNiw==
X-Received: by 2002:a05:6000:1f88:b0:386:459e:e138 with SMTP id ffacd0b85a97d-38bf57a604amr16210415f8f.36.1737552639966;
        Wed, 22 Jan 2025 05:30:39 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm16081440f8f.48.2025.01.22.05.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:30:39 -0800 (PST)
Message-ID: <93be5858-6c1e-4a09-bfe3-ac89d458a892@linaro.org>
Date: Wed, 22 Jan 2025 13:30:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: qcom: camss: update clock names for sc7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_053041_522965_843DF0E0 
X-CRM114-Status: GOOD (  14.14  )
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

On 21/01/2025 18:07, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> sc8280xp. Rename gcc_cam_hf_axi to gcc_axi_hf and add gcc_axi_sf.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a85e9df0f301..b1358457c66e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1443,12 +1443,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
> -			   "vfe0_axi", "gcc_cam_hf_axi" },
> +			   "vfe0_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe0" },
> @@ -1468,12 +1469,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
> -			   "vfe1_axi", "gcc_cam_hf_axi" },
> +			   "vfe1_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe1" },
> @@ -1493,12 +1495,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
> -			   "vfe2_axi", "gcc_cam_hf_axi" },
> +			   "vfe2_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe2" },
> @@ -1516,11 +1519,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   	/* VFE3 (lite) */
>   	{
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
> -			   "vfe_lite0", "gcc_cam_hf_axi" },
> +			   "vfe_lite0", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.regulators = {},
> @@ -1537,11 +1541,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   	/* VFE4 (lite) */
>   	{
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
> -			   "vfe_lite1", "gcc_cam_hf_axi" },
> +			   "vfe_lite1", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.regulators = {},
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

