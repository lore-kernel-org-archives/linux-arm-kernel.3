Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4g7tLG0z0iauVDCZshwQEMQAR05MDuCJfXUDNGgb4A=; b=xwJ+avhQzRJa64KdFiQUCkhFN+
	Z1h9cnVr8E7jcCHUURdkY79UDxjrAvQ3Jmd5Ah2ZW7rmkizYCOO2uQ66zkr/hzf4ulUZwuGI9pbfV
	eV41niO51zzveIgbs8uPomgJ4wlvjQ64EC3QvjatHpvuxDfQV98UsJk7FWir0SdWmSoN3pDodls/W
	ghR2VMZWEfnHM3p6o8MHQxw+MeNDkhMRKo8GJ6Rfj2XXdZjtFK051RQrjWJRw2raEl/FfnFbzAWla
	YDRvwZiE7Q/xHNifgu9uqCcaeYhmQFj9Ho+s+PXoPgnFj6MTgFU4W/hua+XXc88HKTp7csp1+48TN
	peq/a0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAl7q-0000000CL6y-2QWi;
	Mon, 20 Oct 2025 08:20:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAl7o-0000000CL5j-08oW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 08:20:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42420c7de22so1955199f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760948414; x=1761553214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4g7tLG0z0iauVDCZshwQEMQAR05MDuCJfXUDNGgb4A=;
        b=XYB4fzRScTmsTCtmhZ0NZWyBAhHR87fYpwybzqaewJJc257SkTHvZ7+KXUaXjiNtef
         k/AMwfptOD2aQLAgzZ14zVAanBuwPw/sLgx9JuMOvD/c+IG+uWhtb4ZwKMQopPkDn8dS
         TLD7ukjGSc1ZB5hifyQoiubRl8bPqsnHByOMJAijDlGsWTopb7A7yKMDp4bXtOvJACDg
         y7BQw1hAb34WpJ89r3hFT0XVgQyjIijLaXqHaHCiFCbO9ch8kbkWHCbARO+D7tyc/q4g
         j121VMpzXJYj7LNjhkY1Y3pkHLfA0xME0m48bENWlWTyQuAMEIObB5SKr31sewo1M5kF
         bejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948414; x=1761553214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4g7tLG0z0iauVDCZshwQEMQAR05MDuCJfXUDNGgb4A=;
        b=AwRoYDm47X6TSsNvmFL+VO1i2tHScUmMSzlwuVnC8lD6PUcpQclwOMj19XJQjA3tkZ
         iHWh86tvI5Q7mXeSlO/AWFLfJnQrhFppT/S3U1jyt1hc2BZ3eLMSyP/gcwNzpyXE9zyx
         OxMNF/MAQXi8E1b1h4Bdz0NyMnEnl/Os5du0bcWv8tvJ21sfrwEfXtg1HkKssSPsZlFg
         yf9PZlaEhxAyHpPp1SKlsxybDxOXhHz7/XWIDy+NjfN+GbNOHD2Uy+c/7BiALwP3Id9P
         4FQsIQ0wuR+iGeiFPgPO4qcAkXAh7bkW/auo/3CzRXpaCPX5A2ksOeFEF06h9vNnUzIh
         rzaw==
X-Forwarded-Encrypted: i=1; AJvYcCXKzvu4/pKwJUzXjz3XJoMEQVGgf60ZolGEoMSkcfzY080FEqM9o02UsV4jVGLg6UFf2Fp03Lyi7OLIyGN0n0yd@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ2XG8RJI0WruQA99t2tCuuAiDKIWTyMrf6sWz5IoGVs2Mo32e
	8ub5bGa0M0F/m3V162Z2cyP5Ne/mte8IjZcXR3W36OzBfPZFfefA2VhkS/yiEd/OA04=
X-Gm-Gg: ASbGncuJsheu4dd321hpFmBT3XcMe1T5lCn2EO8G/1bKBShYYScaqtys/8oFE/Q7UTX
	SF4V6o3UjBo4xkMAFJCxNG1c9XQNhZiVUSihTJP64Po1/LkgeZqXvSNfVnL+8spZYuhcsUDvLgs
	fOsI88GagfHkqErSlseVzn1pNV0/+tSvPyIQplSNZx5pXIxz2PdP0LVLG5P1cCtEeRutx/6+LzV
	XbkdQwQmErLW/636wgvf8+rn8sRF6vdStfmmDzaOcxu8O5PSDs3/2L55urzj3p7MVQjcWUEEFNH
	S/FzXU8/+6i1FJavYAxOZta0wLQ2x5MTiyXQ+/OsP4drXd9sDtSZNFzFGSEIcyzrr0s76XR0385
	CpsTcEa0nAiACHC8/pa0srUHTrkevoS4HbUhqrCX/U90EYKPs+5aECX6AC+y/3mVuvjkFnLRxuI
	VgsRri
X-Google-Smtp-Source: AGHT+IF9UUnAeLy3gCa6SVoO9qEd1RLxMrSgZ5Yun3pQeXRQI1M57QDjdkLDsr9aPMss860pll2eKw==
X-Received: by 2002:a5d:5888:0:b0:426:dbf7:9e51 with SMTP id ffacd0b85a97d-42704d522d0mr7056583f8f.18.1760948413562;
        Mon, 20 Oct 2025 01:20:13 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a75bsm14255515f8f.23.2025.10.20.01.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:20:13 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:20:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC transport
Message-ID: <aPXwuEebbjEJHmc5@stanley.mountain>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012016_237790_B340393C 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Oct 17, 2025 at 02:23:50PM +0100, Sudeep Holla wrote:
> +static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> +			  bool tx)
> +{
> +	const char *desc = tx ? "Tx" : "Rx";
> +	struct device *cdev = cinfo->dev;
> +	struct scmi_pcc *smbox;
> +	int ret, ss_id;
> +	struct mbox_client *cl;
> +
> +	smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
> +	if (!smbox)
> +		return -ENOMEM;
> +
> +	cl = &smbox->cl;
> +	cl->dev = cdev;
> +	cl->tx_prepare = tx ? tx_prepare : NULL;
> +	cl->rx_callback = rx_callback;
> +	cl->tx_block = false;
> +
> +	ss_id = pcc_get_ss_id(cinfo->id, tx);
> +	if (ss_id < 0)
> +		return ss_id;
> +
> +	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> +	if (IS_ERR(smbox->pchan)) {
> +		ret = PTR_ERR(smbox->pchan);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(cdev,
> +				"failed to request SCMI %s mailbox\n", desc);
> +		return ret;
> +	}

Use the dev_err_probe() function for this:

	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
	if (IS_ERR(smbox->pchan)
		return dev_err_probe(cdev, PTR_ERR(smbox->pchan),
				     "failed to request SCMI %s mailbox\n",
				     desc);

regards,
dan carpenter

> +
> +	cinfo->transport_info = smbox;
> +	smbox->cinfo = cinfo;
> +
> +	return 0;
> +}


