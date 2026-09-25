Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA0C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayLp4Jx22xan0yoaXXO0H5UJI37HFonSA4zUCdy+nIo=; b=ODOWu2YeVYAxYQ1plAD61esG8C
	gYu+VKED1fObG7BFCICgjN1Oyfc5/5eqD95aYhbdA/Ma7gm4rz2VRp4d//bHz8XzqI9aeyxpGFMjB
	yNHIofZWA/5Z2HP1NwFePRGL3uAdbZ2ZDjupbEkorHF7ws8sc5cVIFW72X+EbOctIKY2ewLek/MQj
	OVzPmxcEvBmrMZkCLRrw+VVe4t2iy8SL8Ae46fP7O1LBsdXpbolluuzAn9ibOzh9Te4z87ZTDrnnA
	lIqH7DyY+vaQPFbV/lg8aV7/93cJ79ok5XR/kbA8m+9YbryIIhpAxxV9tQ4h2dsAOQzh2Vf093yJY
	5DokBJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEFG-0000000EYco-3tWi;
	Fri, 25 Sep 2026 22:18:18 +0000
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEFE-0000000EYcR-0ajg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 22:18:17 +0000
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-1450541ab50so658601c88.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790374695; x=1790979495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayLp4Jx22xan0yoaXXO0H5UJI37HFonSA4zUCdy+nIo=;
        b=SskBOlg57uJD63G8VgjlNT4ZroYWQEw9Tm7m33sgpb6yXusXFleTcrbfNeZoa10PQq
         kUsI25njR8ifOswLTehpD5UuAB7zSPINRehnAmRI4EUIwH2ZDQ9ccM8ol3nvF3y6apPZ
         eUzCE0vbCj2dmcndx0k9Dm2EpDwQhtzJOQPwvi/Ci52KkQzy1fYHO0vBMDyql7BCamnl
         N3JiPOG1x+7MLui/URJyfQ5htlTMpDuw/F0NWmIXUmL77fvjjdt4pkl6e7aG/hsxRRNB
         ZHEEgSv2Ufp+UWvpxloDFagT0DPDzyRDyja/flqHINZKDNMEz6mxKg+aeKtzeUDTfu6G
         2u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374695; x=1790979495;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayLp4Jx22xan0yoaXXO0H5UJI37HFonSA4zUCdy+nIo=;
        b=BD/yhvEY0QnMRuxCZPTM1L0Z54oyKowtq4ASZJ2Mp9Y0K9dQOX1q3708xuhzP18mCY
         Nd9yvy51Ce3QNX55tsJEYR1cbJmFGajDCx9x9N1IKWhADuiSBa3B6x8JNOkMQcmPR2NV
         GDZ6eM9PVqznekuF75iWNZ1AXw07dEwSxT2jEWmzz/aFl6v/2xSa6a0t5KKOHA9uJnY5
         oWfJCLNCx6nmXwr6CtOtP4zIq/bHF5wQCWiNp2oGcwQKVSXS2ZamwEsYFzwaNTV8PLZI
         nwBP1zZ3oYg52GOZa1ScaQAYYyu2qd35yOr6bcjQCJo0YrhO4LPGddaSQfAxi9EDbV4t
         3BkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTgVDILW1S2Wx0pMohKGXXeH/3NAZ9Jf0w8E2nGdT0M0Kq9yT2/Y7aHi/sv1AL34VjTyTLSVYObxkubgIAxHuB@lists.infradead.org
X-Gm-Message-State: AFuF++kwRX9KpE6BRz8Df7mGJURHhEYNZTLWtTqBJyh1jaQUsOoNKKu8
	Bd2vJoRYRJKbAaxNMqLRx7J93fsMy+Sj817tFqrAwdcHMSWb/H/kgGFE
X-Gm-Gg: AYBFou1SSqJUq/eHKfSn7JXavuF6qJYxTU+vbi77z4dJSt4DA4u0/jclySt5eXCfXWU
	ltpLgz5CbOf1pBe5Sbou69eOO8An33ELQXFbiVUU22DeAMvShKsNZf01JXDoXrsNDrFM8khfkVk
	NGhdRYZCFYiSECSE62i6T38pguKKDFyVrrRusv0rnkgAXik1/NdzSJBVHu68mAjs9k9VFndamhT
	7MHtMNT5HOelUe5Mm6C9Q/FlXxZzhx3x71t94F8bxWzzOE0YFRxggVAQrANFfJr8QMkZ+0p/kgB
	Wlnvmsr2Fmc/PzTtmXirGx4jHHhmfSYoGNB1/D6nVxgafgxPoAMo+TkV0o7QXCE8gJaUI99n1K4
	QsZUXN/FOBGyqblUIvUN4g4ye2Xz2KvHZHp0Z4ybTj6PgBWTWicN2vb6pNx6Vd9/u5q+DyTVoIi
	vrZSmQWoWI/1bPvzf+T0UneMTrUiT3xXqGyXMiM9fJ4HDn5UM1KcpaUkOjuzAkEeFPh56ZLYG0S
	momas2Ano/NsYfFN0Rjj0/nzE3PYHNxJpwQ21s=
X-Received: by 2002:a05:7022:288:b0:138:3613:dc6 with SMTP id a92af1059eb24-146ce67ee45mr1270576c88.14.1790374694857;
        Fri, 25 Sep 2026 15:18:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm7166213c88.1.2026.09.25.15.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:18:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:18:10 -0700
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
	phone-devel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v8 1/5] Input: stmfts - wait for controller ready after
 reset
Message-ID: <arbyyscK-3xYlj6H@google.com>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
 <20260925-stmfts5-v8-1-0fcf49e2c85f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-stmfts5-v8-1-0fcf49e2c85f@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_151816_207490_95978FA7 
X-CRM114-Status: GOOD (  38.35  )
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

On Fri, Sep 25, 2026 at 11:22:19PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> After releasing the reset line stmfts_reset() sleeps a fixed 50 ms and
> stmfts_power_on() another 50 ms before the first I2C access.  That is
> enough for a warm reset, but when both supplies were really cut during
> system suspend the controller boots from cold and can need longer.  If
> it does, the first read fails, stmfts_resume() returns an error and the
> touchscreen is left powered off with its interrupt disabled.
> 
> The controller posts a controller ready event once it has booted, and
> the event parser already completes cmd_done on it.  Enable the interrupt
> right after releasing reset and wait for that event instead of sleeping,
> giving the controller 300 ms, the total budget the vendor driver allows.
> Boards without a reset line keep the old timing.
> 
> Usually phones such as Pixel 4a and Xiaomi Mi 8 needs longer delay, so
> without this change touchscreen stops working.
> 
> Fixes: 8a1f9de80e45 ("Input: stmfts - add optional reset GPIO support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 60 ++++++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index 972687797f826..1720202d6186b 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -59,16 +59,18 @@
>  #define STMFTS_MASK_X_MSB			0x0f
>  #define STMFTS_MASK_Y_LSB			0xf0
>  
>  /* key related event masks */
>  #define STMFTS_MASK_KEY_NO_TOUCH		0x00
>  #define STMFTS_MASK_KEY_MENU			0x01
>  #define STMFTS_MASK_KEY_BACK			0x02
>  
> +#define STMFTS_RESET_TIMEOUT_MS	300
> +
>  #define STMFTS_EVENT_SIZE	8
>  #define STMFTS_STACK_DEPTH	32
>  #define STMFTS_DATA_MAX_SIZE	(STMFTS_EVENT_SIZE * STMFTS_STACK_DEPTH)
>  #define STMFTS_MAX_FINGERS	10
>  #define STMFTS_DEV_NAME		"stmfts"
>  
>  static const struct regulator_bulk_data stmfts_supplies[] = {
>  	{ .supply = "vdd" },
> @@ -538,25 +540,16 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
>  	sdata->chip_ver = reg[0];
>  	sdata->fw_ver = be16_to_cpup((__be16 *)&reg[2]);
>  	sdata->config_id = reg[4];
>  	sdata->config_ver = reg[5];
>  
>  	return 0;
>  }
>  
> -static void stmfts_reset(struct stmfts_data *sdata)
> -{
> -	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
> -	msleep(20);
> -
> -	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
> -	msleep(50);
> -}
> -
>  static int stmfts_configure(struct stmfts_data *sdata)
>  {
>  	int err;
>  
>  	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>  	if (err)
>  		return err;
>  
> @@ -582,53 +575,76 @@ static int stmfts_configure(struct stmfts_data *sdata)
>  
>  	return 0;
>  }
>  
>  static int stmfts_power_on(struct stmfts_data *sdata)
>  {
>  	int err;
>  
> +	if (sdata->reset_gpio) {
> +		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
> +		/* a short delay before powering up */
> +		usleep_range(1000, 1500);
> +	}
> +
>  	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
>  				    sdata->supplies);
>  	if (err)
>  		return err;
>  
> -	/*
> -	 * The datasheet does not specify the power on time, but considering
> -	 * that the reset time is < 10ms, I sleep 20ms to be sure
> -	 */
> -	msleep(20);
> +	if (sdata->reset_gpio) {
> +		reinit_completion(&sdata->cmd_done);
>  
> -	if (sdata->reset_gpio)
> -		stmfts_reset(sdata);
> +		/*
> +		 * The datasheet does not specify the power on time, but
> +		 * considering that the reset time is < 10ms, sleep for 20ms
> +		 * to be sure before releasing reset line.
> +		 */
> +		msleep(20);
> +		gpiod_set_value_cansleep(sdata->reset_gpio, 0);
>  
> -	err = stmfts_read_system_info(sdata);
> -	if (err)
> -		goto err_disable_regulators;
> +		enable_irq(sdata->client->irq);
>  
> -	enable_irq(sdata->client->irq);
> +		if (!wait_for_completion_timeout(&sdata->cmd_done,
> +						 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS))) {
> +			dev_err(&sdata->client->dev, "controller not ready after reset");
> +			err = -ETIMEDOUT;
> +			goto err_disable_irq;
> +		}
> +	} else {
> +		/*
> +		 * We do not know the real controller state (was it powered
> +		 * off or reset). Let's hope that this is enough time to
> +		 * initialize.
> +		 */
> +		msleep(70);
> +
> +		enable_irq(sdata->client->irq);

Sashiko gave me an idea. What if we do this:

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 1720202d6186..e147a27f57b3 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -578,6 +578,7 @@ static int stmfts_configure(struct stmfts_data *sdata)
 
 static int stmfts_power_on(struct stmfts_data *sdata)
 {
+	unsigned int timeout;
 	int err;
 
 	if (sdata->reset_gpio) {
@@ -591,9 +592,9 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	if (err)
 		return err;
 
-	if (sdata->reset_gpio) {
-		reinit_completion(&sdata->cmd_done);
+	reinit_completion(&sdata->cmd_done);
 
+	if (sdata->reset_gpio) {
 		/*
 		 * The datasheet does not specify the power on time, but
 		 * considering that the reset time is < 10ms, sleep for 20ms
@@ -602,23 +603,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 		msleep(20);
 		gpiod_set_value_cansleep(sdata->reset_gpio, 0);
 
-		enable_irq(sdata->client->irq);
-
-		if (!wait_for_completion_timeout(&sdata->cmd_done,
-						 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS))) {
-			dev_err(&sdata->client->dev, "controller not ready after reset");
-			err = -ETIMEDOUT;
-			goto err_disable_irq;
-		}
+		timeout = STMFTS_RESET_TIMEOUT_MS;
 	} else {
 		/*
 		 * We do not know the real controller state (was it powered
 		 * off or reset). Let's hope that this is enough time to
 		 * initialize.
 		 */
-		msleep(70);
+		timeout = 70;
+	}
 
-		enable_irq(sdata->client->irq);
+	enable_irq(sdata->client->irq);
+
+	if (!wait_for_completion_timeout(&sdata->cmd_done,
+					 msecs_to_jiffies(timeout))) {
+		if (sdata->reset_gpio) {
+			dev_err(&sdata->client->dev, "controller not ready after reset");
+			err = -ETIMEDOUT;
+			goto err_disable_irq;
+		}
+		/*
+		 * If we did not reset the countroller ourselves continue
+		 * even if we did not receive "ready" message.
+		 */
 	}
 
 	err = stmfts_read_system_info(sdata);

No need to resend the series unless there is more feedback on the
bindings.

Thanks.

-- 
Dmitry

