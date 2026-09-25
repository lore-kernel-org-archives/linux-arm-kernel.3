Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C038DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=; b=Vvuti1D2595GnIRejM8HnWkmUD
	OUbrPLLThxak4frXH9gjTpihCfGSeeh1/w0UGe+rswzJ9Y3Uznwc3STQsyl7MBHiaqJnXH8KWJKvK
	HcVqDlLo97X53SWG8FdIzA8h0gXlJ9LWy+60jN0Kc3BK7dR2GFhZxrmM3NNPyb4ntCz/+sjn2fWzj
	i1mCXuaGoXD1e3D4Z9vr7VRzRS2+roZ1DkQTfPPOPHtdDr4F2KWkUz3QWTZZ3BV+RvCIF3JamRln5
	/GdECHkEe/WSaA0uqj7aYSgE621IpDgTFbxKtH0a56MZeZIxSX0Oy4qN9f9nNtyD5V5cbBdATofIY
	W8lVe7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABTv-0000000EFoF-39gR;
	Fri, 25 Sep 2026 19:21:15 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABTt-0000000EFnn-1DyF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:21:14 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33bfb26865fso1037973eec.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364073; x=1790968873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=T8jfW6lYfpqm0SMcTI9yKdj+CDVa9ntnHDKM1Hp3hXoCZR/BcFLKnoj/HzpaPXVtTJ
         n8D+luLrjUOcSCQzMNVcOyS2uYJpYdvFc3qX/pC50UrcNC6kzPU6sm0vq8YU5MvAlNgF
         /iLjol44syr7dJQ07P/dlC+uuooG22rbfAIQhBwPyl5H8mkTF63vzM/0DL6JTXX2v4qm
         QsfIzhV+dTDwY2IgCfQlyD1A4Y/zTpzA/QJ+mlgf4Vv7MbHvj/EkWRuti9QEllgZm7bW
         VysmmNAefKQb1J22nwW9RmWHRvoETrdNHbBmh+Bvqpz/SZeH58BhArAOGkH8gVxx0GSx
         LvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364073; x=1790968873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=uZhKvsZcrpXrnMFUS9iroTt2qsiMuJrkCkdgxcpywM28Zl3MYBcj+uWTF2X+COQIF/
         v3UZFabFzWXtkEQz8ezoeO2nkj6KB77rik/IQkZoIMv22Cxb/LwWgVPvtpe0l5PgDDD3
         RDZgtlc/bPgSQvbsYCxcISyN4F4dmKkFyG8pgOwm4ew5AY/ZgvGitGvB30UOqdtZleR3
         8h9Vjs8RFB5LKTBUXDJQTr17/OmEGvwvNbYkxyU0aNHaBvy3J93ErXskAooi0M5GnK87
         WHfyCBgqjAZvYXYpQV35pn09JRvf4fv5LYTiL0P786hQ4XypSetJR75gfeGmPlRH07j3
         EKxA==
X-Forwarded-Encrypted: i=1; AKwUvBzFjQQMuEoEOqLHcfLKTAbTOqKm4/Ncg7hq7Sjv87QJp6o7b/lfxB42nsmh2r4Oc8a5UgKle/S9uLhrfKrAESuA@lists.infradead.org
X-Gm-Message-State: AFuF++nV2r+G7WJmGp6xSrtYFhtQCvxQyenBWvlgoO5PwBezKvDjYgqd
	Nh8X2XX8D8k3TwBbc4dms5m6T7EGU/KKM39Rg4p0LRa4XR6ET26LvqQl
X-Gm-Gg: AYBFou3GAWzmkV8hCmgaqikfViqc39YDaiVH8cBmenIvWqeEriL3MvYBDPeAdIGiWWD
	Zswfoyq/8MYU7CuWZQM4o6CcSjZoCFaF4WR5xpGg4Dmb3W21xFj/FcNPqsXVur91WYUAbKUnw4E
	uXyYf4AvZMxSQFu74gpTo8R2cHmpLjHSkRfNBRCKQXfKOGXJPWKtODrS6rn7JLfi5dmjsHX1RyT
	l3Q6XCcIZ+98S+YfEGz7PHyHvEDj09pUytTkJqEdDBjIEgpEMEtsC1QLlrbIvpOWfnnobItkxqj
	yZ3Sszihq8YIvdKbfGAA1vCqaF0XzZMoWM516q+s+cyatAJigU7D1MF8VZk7MdC9BuzH5ENaNzq
	PbcSCj4ZmycQ9sRIy4yFld6c7xD91W6T+qx1JDGTchRQWuIWB9Bh9wd6KiK9yNfvDgld4gNsps7
	b5LVpunRhapC0Ogkimfc0irER6Hb+Zti0D4O0B8hdan10WEN4ne8eReUB4518rqsYyRkYrP4lTn
	6R8DPawRGKNuEeznDSJM7lhrfx/sAFPaja7krs=
X-Received: by 2002:a05:7022:7e85:b0:143:3242:6301 with SMTP id a92af1059eb24-146ce29fde5mr1024848c88.4.1790364071957;
        Fri, 25 Sep 2026 12:21:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm1708481c88.9.2026.09.25.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:21:10 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:21:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] Input: stmfts - support FTS5
Message-ID: <arbJQezIkyvCf1rR@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_122113_694161_08D00D7D 
X-CRM114-Status: GOOD (  12.55  )
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

Hi David,

On Mon, Sep 07, 2026 at 12:50:21PM +0200, David Heidelberg via B4 Relay wrote:
> +static int stmfts5_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	sdata->mode_switch_gpio = devm_gpiod_get_optional(dev, "mode-switch",
> +							  GPIOD_OUT_HIGH);
> +	if (IS_ERR(sdata->mode_switch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
> +				     "Failed to get GPIO 'switch'\n");
> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);

You need

	input_set_abs_params(sdata->input, ABS_MT_TOOL_TYPE,
			     0, MT_TOOL_PALM, 0, 0);

here, otherwise input core will drop ABS_MT_TOOL_TYPE events.

Thanks.

-- 
Dmitry

