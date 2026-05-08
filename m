Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90FCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 06:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=; b=wVtW/7aqCsLHb0j0dDogWgmDTB
	hTXJVBHsWmGNIlVYCUmljbDNNYNtPomzBuN4hlXa26iotXCqDzuIhBLxbA8n/iPb+neiK/aBhKkkt
	P8a1TjAwHZjB8zvfgMrDhMeu1khevEqZyB+koqNCIouoY6ABCugoEFikNXqNMg3AupyjplHHDmm1x
	f5hyTEK5d8/OCJAzNXhas2wxftLYX7FoN6yA6qX8rxUTF6gIft7Ge42sCvvFzLKnHewkHKPgjlnEc
	iyxdYm6MgCXypZtEiKz+6fCVcS31yyRhapahJKWkj1yS04UfrTNYzERcINPj1L4eUkys4VH9atLvp
	tuSog1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLER9-00000005heN-2LQk;
	Fri, 08 May 2026 06:11:47 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLER7-00000005hdn-2gkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 06:11:46 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2113583eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778220704; x=1778825504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=;
        b=dt3ivasgek9F7NuUEYHt47ipI4dor0y8GHQ//ktzwvNn0HNqQMNkXx/vQsKK2YdvPk
         WQxL8ylgj9HwnQPjPdTEAm5k/LfbMIxd9yZwAWZ1o+3Tt/A98dgm2LsbUKSBCyjZbT65
         Dywi+3H/kD3O3A36IyWW/meRJGihZQzaU9II35iHhKMxGT58MJBP06La0of3rr+02qZF
         3Oul2ItUl145KGuDDcMqoLvNRPF/I8mQvBUhu6JXHgCPeSFl0RVvdYqgnOIwufsjr0wL
         CGpLJeFFE33TH0KUqxHdloZBy6kf9PTITVIgBeecKWm0ySEoZRGGmfvt2it4pLffuQuH
         S4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778220704; x=1778825504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=;
        b=IhxpWqPKptSCBPh4LsKFRY0aRC3GPjtSOflVybhjv72fZBCXdULQBDk2V98qFHMEtL
         FMmQ8dJP3QMb0CVDuLaWWSQCTGnDFfnjXqJg04bxLpeUf+AHygKTKg0EEIUePdE/9OvS
         ii+XoKZ7XrWeporc8Xrr/xzTQwPhnnF8bvAfiIFkNpmMH15PXhUevKyFZ+glJ6Kt4m3x
         tpmI+v/tv4/tophgbrCpmMYDd/8uiOm+N+47Mi1uhqyyST6C7Aa2rHgqjfys9UBe++48
         PvX4+wInS4Y7zbp6rIBwboorwq8tJY9e2CTXzOkAwb78Evqsr7ehwV2TB7RWWHpwlUCX
         2YiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8HdvjpM+kbdbrsTPHCNqBmCjJ3Q+D7uTPkZ7gX7okccGmCFbiy0ir7FYtIsOSm6Q9vurxuQdy7NlgSeAUfpbh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi8avAEEEuO1XAEFl+ukWRJMMzCBMRP5M1RcmcngiiHwl/41EC
	M1smdCZWsTFh3fD3rC4BbnrOQfaeurbyjzmPCBnwGCp879fxBtJYDNis
X-Gm-Gg: Acq92OHWDZOqFMTWsvOkketRDl+VKcJ58mr8p3jf/H/97k9zHFDRzgTBnBEIM5hxk2m
	s9wwP/R7gfa+WxWXZ9afGdG9jz3p7IYLCQ/w6gAs3Mwrxp2xwS51BtO1uE8JgM0I3ZHcrnJncN3
	yr7Hynl4KwvIXxwQMd1jOY6h8R6U6rKAskhQBcZqvOGWCLwEfA94ALZ2F2jsfMWD+FoQ1saDdW7
	hiBGR5MH5pMbFV+Km3aKkC4cQhAbplWOgOswm5LwW9OxDfBN+iagkTBlmDaBCDUpCGnp8JJHLoq
	IupaTOF0MhQX1FIjNyISWmRKUvNRyKiOPo+HAOkm3pgR3T9z3dat4ZBpImvsycs1fTpIHugW9ld
	VLhUubUN07GkjPhUdEPzcVmo6ZLNzRE08tHH1/fYcqvu+G6SzEOzi/MJOSFhkN4zCG3+XxcTEAH
	bJb8OCVqe7KxUyVZfUxitJYBksAjhWrEEJESMC8pvq2w/SBP7yXPpEYJlgqSDsSp/ctjkJFrVXx
	l0=
X-Received: by 2002:a05:693c:2b08:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2f54aa78245mr5844784eec.26.1778220703475;
        Thu, 07 May 2026 23:11:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:852e:ebf3:8de1:32e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm1132502eec.27.2026.05.07.23.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:11:42 -0700 (PDT)
Date: Thu, 7 May 2026 23:11:39 -0700
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
Subject: Re: [PATCH v4 10/11] Input: stmfts - support FTS5
Message-ID: <af13d0-zM8Qjtjcj@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-10-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-10-64fe62027db5@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_231145_693154_FCCBFCD6 
X-CRM114-Status: GOOD (  25.71  )
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

On Thu, Apr 09, 2026 at 12:15:53AM +0200, David Heidelberg via B4 Relay wrote:
> @@ -101,12 +129,27 @@ struct stmfts_data {
>  
>  	struct completion cmd_done;
>  
> +	unsigned long touch_id;
> +	unsigned long stylus_id;

I wonder why do you track contacts yourself instead of telling input
core to do it for you and report BTN_TOUCH as needed? You just need to
call input_mt_sync_frame() when you are done processing input frame.

Does the device send all contacts state in one transmission or it can
transmit contacts one by one?

> +
> +	/* Boundary check - some devices report max value, adjust */
> +	if (x >= sdata->prop.max_x)
> +		x = sdata->prop.max_x - 1;
> +	if (y >= sdata->prop.max_y)
> +		y = sdata->prop.max_y - 1;

It is allowed to exceed declared min and max, so this clampin is not
needed.

>  
> +static int stmfts5_set_scan_mode(struct stmfts_data *sdata, const u8 val)
> +{
> +	int err;
> +
> +	u8 scan_mode_cmd[3] = { STMFTS5_SET_SCAN_MODE, 0x00, val };
> +	struct i2c_msg msg = {
> +		.addr = sdata->client->addr,
> +		.len = sizeof(scan_mode_cmd),
> +		.buf = scan_mode_cmd,
> +	};
> +
> +	err = i2c_transfer(sdata->client->adapter, &msg, 1);

Is this i2c_master_send()?

> +	if (err != 1)
> +		return err < 0 ? err : -EIO;
> +
> +	return 0;
> +
> +}
> +
>  static int stmfts_input_open(struct input_dev *dev)
>  {
>  	struct stmfts_data *sdata = input_get_drvdata(dev);
> @@ -371,6 +622,28 @@ static int stmfts_input_open(struct input_dev *dev)
>  	return 0;
>  }
>  
> +static int stmfts5_input_open(struct input_dev *dev)
> +{
> +	struct stmfts_data *sdata = input_get_drvdata(dev);
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(&sdata->client->dev);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&sdata->mutex);
> +	sdata->running = true;
> +	mutex_unlock(&sdata->mutex);

	scoped_guard(mutex, &sdata->mutex)
		sdata->running;

> +
> +	err = stmfts5_set_scan_mode(sdata, 0xff);
> +	if (err) {
> +		pm_runtime_put_sync(&sdata->client->dev);

Reset "running"?

> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static void stmfts_input_close(struct input_dev *dev)
>  {
>  	struct stmfts_data *sdata = input_get_drvdata(dev);
> @@ -404,6 +677,23 @@ static void stmfts_input_close(struct input_dev *dev)
>  	pm_runtime_put_sync(&sdata->client->dev);
>  }
>  
> +static void stmfts5_input_close(struct input_dev *dev)
> +{
> +	struct stmfts_data *sdata = input_get_drvdata(dev);
> +	int err;
> +
> +	err = stmfts5_set_scan_mode(sdata, 0x00);
> +	if (err)
> +		dev_warn(&sdata->client->dev,
> +			 "failed to disable touchscreen: %d\n", err);
> +
> +	mutex_lock(&sdata->mutex);
> +	sdata->running = false;
> +	mutex_unlock(&sdata->mutex);

scoped_guard()

> +
> +	pm_runtime_put_sync(&sdata->client->dev);
> +}
> +
>  static ssize_t stmfts_sysfs_chip_id(struct device *dev,
>  				struct device_attribute *attr, char *buf)
>  {
> @@ -484,10 +774,8 @@ static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,
>  	guard(mutex)(&sdata->mutex);
>  
>  	if (hover != sdata->hover_enabled) {
> -		if (sdata->running) {
> -			err = i2c_smbus_write_byte(sdata->client,
> -					   value ? STMFTS_SS_HOVER_SENSE_ON :
> -						   STMFTS_SS_HOVER_SENSE_OFF);
> +		if (sdata->running && sdata->ops->set_hover) {
> +			err = sdata->ops->set_hover(sdata, hover);
>  			if (err)
>  				return err;
>  		}
> @@ -612,7 +900,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	if (sdata->reset_gpio)
>  		stmfts_reset(sdata);
>  
> -	err = stmfts_configure(sdata);
> +	err = sdata->ops->configure(sdata);
>  	if (err)
>  		regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
>  				       sdata->supplies);
> @@ -620,6 +908,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	return err;
>  }
>  
> +static int stmfts5_configure(struct stmfts_data *sdata)
> +{
> +	u8 event[STMFTS_EVENT_SIZE];
> +	int ret;
> +
> +	/* Verify I2C communication */
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    STMFTS_READ_ALL_EVENT,
> +					    sizeof(event), event);
> +	if (ret < 0)
> +		return ret;
> +
> +	enable_irq(sdata->client->irq);
> +
> +	return 0;
> +}
> +
> +static void stmfts5_chip_power_off(struct stmfts_data *sdata)
> +{
> +	i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
> +	msleep(20);
> +}
> +
>  static void stmfts_power_off(void *data)
>  {
>  	struct stmfts_data *sdata = data;
> @@ -629,10 +940,73 @@ static void stmfts_power_off(void *data)
>  	if (sdata->reset_gpio)
>  		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>  
> +	if (sdata->ops->power_off)
> +		sdata->ops->power_off(sdata);
> +
>  	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
>  			       sdata->supplies);
>  }
>  
> +static int stmfts_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
> +
> +	sdata->use_key = device_property_read_bool(dev, "touch-key-connected");
> +	if (sdata->use_key) {
> +		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
> +		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
> +	}
> +
> +	return input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
> +				   INPUT_MT_DIRECT);
> +}
> +
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
> +	/* Mark as direct input device for calibration support */
> +	__set_bit(INPUT_PROP_DIRECT, sdata->input->propbit);
> +
> +	/* Set up basic touch capabilities */
> +	input_set_capability(sdata->input, EV_KEY, BTN_TOUCH);

This will be done by input_mt_init_slots(..., INPUT_MT_DIRECT). 

> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);
> +
> +	/* Enable stylus support if requested */
> +	sdata->stylus_enabled = device_property_read_bool(dev, "stylus-enabled");
> +
> +	/* Initialize touch tracking bitmaps */
> +	sdata->touch_id = 0;
> +	sdata->stylus_id = 0;
> +
> +	/* Initialize MT slots with support for pen tool type */
> +	return input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
> +				   INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);

Why INPUT_MT_DROP_UNUSED?

> +}
> +
> +static int stmfts_set_hover(struct stmfts_data *sdata, bool enable)
> +{
> +	return i2c_smbus_write_byte(sdata->client,
> +				    enable ? STMFTS_SS_HOVER_SENSE_ON :
> +					     STMFTS_SS_HOVER_SENSE_OFF);
> +}
> +
>  static int stmfts_enable_led(struct stmfts_data *sdata)
>  {
>  	int err;
> @@ -678,6 +1052,8 @@ static int stmfts_probe(struct i2c_client *client)
>  	mutex_init(&sdata->mutex);
>  	init_completion(&sdata->cmd_done);
>  
> +	sdata->ops = of_device_get_match_data(dev);
> +
>  	err = devm_regulator_bulk_get_const(dev,
>  					    ARRAY_SIZE(stmfts_supplies),
>  					    stmfts_supplies,
> @@ -697,8 +1073,8 @@ static int stmfts_probe(struct i2c_client *client)
>  
>  	sdata->input->name = STMFTS_DEV_NAME;
>  	sdata->input->id.bustype = BUS_I2C;
> -	sdata->input->open = stmfts_input_open;
> -	sdata->input->close = stmfts_input_close;
> +	sdata->input->open = sdata->ops->input_open;
> +	sdata->input->close = sdata->ops->input_close;
>  
>  	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_X);
>  	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_Y);
> @@ -706,19 +1082,9 @@ static int stmfts_probe(struct i2c_client *client)
>  
>  	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>  	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
> -	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
>  	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> -	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
> -
> -	sdata->use_key = device_property_read_bool(dev,
> -						   "touch-key-connected");
> -	if (sdata->use_key) {
> -		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
> -		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
> -	}
>  
> -	err = input_mt_init_slots(sdata->input,
> -				  STMFTS_MAX_FINGERS, INPUT_MT_DIRECT);
> +	err = sdata->ops->setup_input(sdata);
>  	if (err)
>  		return err;
>  
> @@ -789,13 +1155,62 @@ static int stmfts_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int stmfts_runtime_resume(struct device *dev)
> +static int stmfts_chip_runtime_resume(struct stmfts_data *sdata)
> +{
> +	return i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
> +}
> +
> +static int stmfts5_chip_runtime_resume(struct stmfts_data *sdata)
>  {
> -	struct stmfts_data *sdata = dev_get_drvdata(dev);
>  	struct i2c_client *client = sdata->client;
> +	struct device *dev = &client->dev;
> +	u8 int_enable_cmd[4] = {0xB6, 0x00, 0x2C, 0x01};
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.len = sizeof(int_enable_cmd),
> +		.buf = int_enable_cmd,
> +	};
>  	int ret;

"int err" everywhere where the variable carries error code or 0.


Thanks.

-- 
Dmitry

