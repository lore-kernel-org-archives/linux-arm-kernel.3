Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3B2CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=; b=nQw0wEwK0lG+qHtVznGVEIhxl9
	9dKS3BBySUg4zpFt1eoED2KcZf76FRHtdN84DQzjjreNdEJ5LHDvvuLy+kPtd9YaqDxxN86tcRq9v
	FralUmEyJA/RV5qry4ur3dYBL/zhn7p8n7IWtjvT8iuzG14IvD0q+ESsjjMNzOKDtuv7VZxFKmsow
	rVdaEvSgiKy76p7kKV96F/swAapQW3s0bTVjOp+fNoLlxQ6LoXvOiGTvS7o/SqX9plQu0FUXA70Dn
	d5EpaqTM3w40uZF1vaBB8n+ZVWiiX9Vgv3jVZol7oyWE+Wyu+wVD7gIuXb8MVv6gDug2bVb3eSfhC
	PnZCwe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzz0-0000000609q-3b6k;
	Fri, 29 Aug 2025 14:21:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urx10-00000005Rov-0NQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:11:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3d0dd9c9229so343181f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756465888; x=1757070688; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=;
        b=YhnUSFLPmqDr85qXrVxUigFFzlVYeEY497CNVJtVdY8gm70mJTdNn98bCZUw5O5/Pv
         43u3bt4GaIXSGz2N3KJYwu8pPlbcbFjaxLmRSRhAqVvueMB57vMigD1lxu8U+DlK50Oi
         IJP2MWI8X80lC2wxlg7R/or3/O/qlExpFifTs+WqlhEKa07hbXhVZswPRynJavCzHhCj
         hUL7ml5iqFVNL74tQ+owX6bk8Dk5DOJDdp5+0WW6NZCrTKQOB8qGSHxc7elAF6uNd8ib
         RkTCcSRGsDNeNhCOppHjEFA1dit6oIRwE1HhOlic/YB3zhPQYJ1kxOwlTvqG2Izorac9
         NB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465888; x=1757070688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=;
        b=mlFw5OuIykuJyR0ojFB6nyaz5JcsOouAez2+mHAuFeSopWNyDxCETv4y6STkvrH6C9
         kE89gLOf/zJ7E58OrnD4ELPfjrUAyefCl7ciMA5HVVd6mnnGIJCltwih7C4mxNW2e/vy
         BcdK7r4f83Ep4buot0LSNazDYjNDsLN/HjHZe10v6n2VO40EtiAGe8vSAujx+iMqLIiY
         uHbLVW1TZRiP4ehELjdsCl97PKwMnA4PtxF4PlaedZ6YjT/TuQrEzWMUfMZakCuad13f
         I/xfuPDsNRGflYKvkrkw6Fj5Rc2Numjp3z8RTZXVprglL7SsA0mZK5+z1lwdOMrkiOJJ
         MzEA==
X-Forwarded-Encrypted: i=1; AJvYcCXCJdth7y5uXVHcww3aHqjHFu4xpaKNYAtD/21k818vgBMdvdH20HZjFgnhI8LdSv/RqNuBF4RYPOjncIpt75sU@lists.infradead.org
X-Gm-Message-State: AOJu0YxljkhiTWogOr3qmjPaBIPjRscENYKeQZ2IK/8sB/emFFcN61WC
	L6zL6x8GLa5SCb0IzVs8eXLX3JuJliELLUeb8PWmP7vnb9lC87A7WqxH
X-Gm-Gg: ASbGnctA5iJ9VPCy1a1wx/+oP0Y4g24BFPBnlHut9O8R7IKnTnHVijmdnFW4t5RPi0b
	0+Yq45ld2/H8IiU4gOPdEa+ROv/dKLAMQDiFbxdlHkDgbwfXuC+JMhvT3icW7mP88FTmHTq54k3
	Tku6BA13ZSuJyZ8UgYOCCiLBHp1euPfgt4Qto/fquTxSan40bIQ+EW87ZINWkE0t8YN/a06SETB
	EVYbSC40ari0tcJhdTzjLKXsFOgnd6ceSj2bTzI0OG02KIM2vsjbCGepIcS6j0n3plvVOpClKQE
	Dbj2wun/YLJISE8q1Hi9e6ZL2P2j83Sqlkd6YF5Zpdf1rZX3ZrxKLd+kAfLDwiayYkEMj3uQMYg
	kihJ4Nbl4egHTFQyn8MWWSgcM1auELLZlHWLR7Y3R5GOX0A==
X-Google-Smtp-Source: AGHT+IEhgsyB+xV4naRe7U+vGBG91GNLDzqLCMMGY7f5dp8nau5ERArTK4tcf5uChYU0pp1hjF9bJA==
X-Received: by 2002:a05:6000:2307:b0:3d0:ebf6:90d2 with SMTP id ffacd0b85a97d-3d0ebf69376mr1035051f8f.43.1756465887932;
        Fri, 29 Aug 2025 04:11:27 -0700 (PDT)
Received: from google.com (brn-rj-tbond06.sa.cz. [185.94.55.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fbe7dsm2929064f8f.9.2025.08.29.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:11:27 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:11:22 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_041130_128589_65879661 
X-CRM114-Status: GOOD (  19.35  )
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

Hi James,

On Wed, Aug 27, 2025 at 09:22:41PM +1000, James Calligeros wrote:
> +static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
> +{
> +	u8 button = (event >> 8) & 0xff;
> +	u8 state = !!(event & 0xff);
> +
> +	switch (button) {
> +	case BTN_POWER:
> +	case BTN_TOUCHID:
> +		if (smchid->wakeup_mode) {
> +			if (state)
> +				pm_wakeup_hard_event(smchid->dev);
> +		} else {
> +			input_report_key(smchid->input, KEY_POWER, state);
> +			input_sync(smchid->input);
> +		}

I believe you should be using pm_wakeup_event() in all cases so that
pressing power would interrupt suspend even if resume() handler has not
been run yet. Also I do not think suppressing KEY_POWER is needed.
Userspace should be smart and decide whether to shutdown the system or
not when receiving KEY_POWER depending on the overall system state.

...
> +
> +static int macsmc_hid_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_hid *smchid;
> +	bool have_lid, have_power;
> +	int ret;

	int error;

> +
> +	/* Bail early if this SMC neither supports power button nor lid events */
> +	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
> +	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
> +	if (!have_lid && !have_power)
> +		return -ENODEV;
> +
> +	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
> +	if (!smchid)
> +		return -ENOMEM;
> +
> +	smchid->dev = &pdev->dev;
> +	smchid->smc = smc;
> +	platform_set_drvdata(pdev, smchid);
> +
> +	smchid->input = devm_input_allocate_device(&pdev->dev);
> +	if (!smchid->input)
> +		return -ENOMEM;
> +
> +	smchid->input->phys = "macsmc-hid (0)";
> +	smchid->input->name = "Apple SMC power/lid events";
> +
> +	if (have_lid)
> +		input_set_capability(smchid->input, EV_SW, SW_LID);
> +	if (have_power)
> +		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
> +
> +	ret = input_register_device(smchid->input);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (have_lid) {
> +		u8 val;
> +
> +		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
> +		else
> +			input_report_switch(smchid->input, SW_LID, val);
> +	}
> +
> +	if (have_power) {
> +		u32 val;
> +
> +		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
> +		else
> +			input_report_key(smchid->input, KEY_POWER, val & 1);
> +	}

Since you are doing this to seed initial switch/button state I would do
this before registering input device (this is safe to do so).

Thanks.

-- 
Dmitry

