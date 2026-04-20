Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB54EA71BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 04:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivIQYtxBKSYYxLWGWSom7fjyGf+pGkpG586CwmF2GsI=; b=seaYDbCzJqVN4akdmfVfVi8Ub3
	LJFP5xnQQj1uL5AVdAB2unWoQbUP1TrXYOtaDdglaj/74XOQ3aFLDG8MmWqgeePhJMdsOt5R9ZfoX
	NMQnyIovR+YzMQPRGLfhg+diKlMxhJAF3rLA7oYrgN9H1Igv2chN8jMWkijVnDPgiGy7SKtA7+UR0
	pWkHHhEOQm45lCbJraA9s6seAZmCWAgpozwiFQNPKfmlZJRMcvFd2OPxZFNIhM/z5LTX24PwrJFHW
	WVWWCUh16ItKk6WZquQ1tw3CXpyTNYouOYo2/tv8cUnG2DghZ6efNvgktx7IxMHEXLmWwMi86X47S
	QuBHkL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgY2-00000006Pj2-3txl;
	Mon, 20 Apr 2026 04:47:51 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgXy-00000006PiL-1ND7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 04:47:49 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso2175205eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776660465; x=1777265265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivIQYtxBKSYYxLWGWSom7fjyGf+pGkpG586CwmF2GsI=;
        b=Fn8IA7M80U1FL2zHMrwbk1sAiQdlCUXRSKht/p3XCgXmvRsEaA77KJaY2ixZTGkQFO
         Yk1dsGPPhMzLPXFOopKV+ep62j/vH+B38XbqfgEWSVmAxHR41n3NALMCSsWx5lPvlbXU
         0C+lWBCP0LkXCOVSkP9ATtk6Sy92ooXCdQvRqhbTFlsew3uu0hdtBK613i213vS15XCk
         D+PqLKftFZhuYQGs4x9zh0HfeQWXpWE17uDe9JePHl9WYSWKxSylnylnbMZXLxdJEE6H
         cA5C68rNyAzWepkHrX7O3P74EQIp2JbGnILqBrQRHNUmpz7n5GOP0ZFk/NmRkUc+hyE/
         kWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776660465; x=1777265265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivIQYtxBKSYYxLWGWSom7fjyGf+pGkpG586CwmF2GsI=;
        b=BhoLI3QZBvNe6wzCInjxKx6Kw0mLQKpYcdDcg5yTy6IuCkN9XVHdFRBdzXG2KWUej0
         P9MkFtftMtijdGJ+iiaRTh0auyVQbmjB5NFRSaee/GsdcnCJ2NP41CggioboWOXGZ9Fu
         7cszzpmeXyyOD1cPOloaqnC1K34aB/YrpBebrSNKZGd9rTBXMdMpHIhiEWzo8Bh2oWt3
         Eh7FAcb4WeyMorK2rraNQAJzRWHxYmbnFKPERJoIC/AGdxeEF+TPZaiRgPof5/WJP3i+
         uX7QX8akr2Yn9dOP0/p7QiFvo2lP3rY6hm3rNr2S8O3LGSSa3WSkO1xkeHv0K7mO1uQp
         d3Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/+bUFkngFvxMsqipONmOVwO6JjW7VBjgQkUxbm3ismZsrG9RrIia1N95rlYCAqTtwyC6i9/mygSXDZv7rNPPuO@lists.infradead.org
X-Gm-Message-State: AOJu0Yymsse+gfQeFtmsCoHIUdemX/oTrwvnRfoWv62VDGe5gmqO+rjV
	yuAjk8CttJhSTsXdeLtf82fJ1vf0vlSOtySMpRc+axl2P9GCBL5h8H4T
X-Gm-Gg: AeBDietbL68bo5FSlu8JMBJzRZUORcN62NglCu6Xp/N1idPuH6djuQveffqCDHutMER
	KFoKYlsh2Fk5+bN5PDEAotG647A59qvbT9/O1s6rI3liJZxmfrVnNHhV/E7F8KV4YA1qMOpgE6w
	zV9o5K5DkCVoeTTx5RuzUQYL68sQ4L5NCCWF8M31vWi7x2yv43sT7/qrAQH/ZNvWOHAXUgHahzh
	5ZR8fcFrRuUCMuvgE4y7EF+TVPa/VzyLlYV7Rasx1EhvOl2gBTDvEF/yvfdq7mpXvikyXCd1fbx
	iKlV0jSqPN9UJKy9onakl630XUqtxaO6+FQtcuxczer6tihr2kqcQ2X8XGg+L3GMiD6luPezyPY
	/+NTrDYPSyh37XRzx3GnlaidgZFr4w/v8GpyLd+p7eV2ZhmY+xOWbRRgXnurB2M6CZrMggqD1Ci
	6X+jgz0VPXuKCEmalAfeTjEEIkOuvxAg6jIVKC4tsZDe05k1TCFt+212ZPCLm5dJgn45p07qfwW
	Xc=
X-Received: by 2002:a05:7300:72d5:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2e42e10aeabmr4580207eec.14.1776660464756;
        Sun, 19 Apr 2026 21:47:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1a4e:4965:5dff:cdee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15897536eec.8.2026.04.19.21.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:47:43 -0700 (PDT)
Date: Sun, 19 Apr 2026 21:47:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aeWtDA7snjJmiF9K@google.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
 <20260312180304.3865850-5-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312180304.3865850-5-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_214746_612814_9E655755 
X-CRM114-Status: GOOD (  23.67  )
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

Hi Hugo,

On Thu, Mar 12, 2026 at 02:00:58PM -0400, Hugo Villeneuve wrote:
> +
> +static void charlieplex_keypad_report_key(struct input_dev *input)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> +	const unsigned short *keycodes = input->keycode;
> +
> +	if (keypad->current_code > 0) {
> +		input_event(input, EV_MSC, MSC_SCAN, keypad->current_code);
> +		input_report_key(input, keycodes[keypad->current_code], 0);

This needs input_sync() as otherwise userspace is free to only recognize
the last MSC_SCAN event.

> +	}
> +
> +	if (keypad->debounce_code) {
> +		input_event(input, EV_MSC, MSC_SCAN, keypad->debounce_code);
> +		input_report_key(input, keycodes[keypad->debounce_code], 1);
> +	}
> +
> +	input_sync(input);
> +	keypad->current_code = keypad->debounce_code;
> +}
> +
> +static void charlieplex_keypad_check_switch_change(struct input_dev *input,
> +						   int code)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> +
> +	if (code != keypad->debounce_code) {
> +		keypad->debounce_count = 0;
> +		keypad->debounce_code = code;
> +	} else if (keypad->debounce_count < keypad->debounce_threshold) {

This does not work if debouncing is disabled (debounce threshold is 0).

> +		keypad->debounce_count++;
> +
> +		if (keypad->debounce_count >= keypad->debounce_threshold &&
> +		    keypad->debounce_code != keypad->current_code)
> +			charlieplex_keypad_report_key(input);
> +	}
> +}
> +
> +static void charlieplex_keypad_poll(struct input_dev *input)
> +{
> +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> +	int code;
> +
> +	code = 0;
> +	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> +		int err;
> +
> +		/* Activate only one line as output at a time. */
> +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> +
> +		if (keypad->settling_time_us)
> +			fsleep(keypad->settling_time_us);
> +
> +		/* Read input on all other lines. */
> +		err = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> +						     keypad->line_gpios->desc,
> +						     keypad->line_gpios->info, values);
> +		if (err)
> +			return;

We need to deactivate the line on error too.

> +
> +		for (unsigned int iline = 0; iline < keypad->nlines; iline++) {
> +			if (iline == oline)
> +				continue; /* Do not read active output line. */
> +
> +			/* Check if GPIO is asserted. */
> +			if (test_bit(iline, values)) {
> +				code = MATRIX_SCAN_CODE(oline, iline,
> +							get_count_order(keypad->nlines));
> +				/*
> +				 * Exit loop immediately since we cannot detect
> +				 * more than one key press at a time.
> +				 */
> +				break;
> +			}
> +		}
> +
> +		gpiod_direction_input(keypad->line_gpios->desc[oline]);
> +
> +		if (code)
> +			break;
> +	}
> +
> +	charlieplex_keypad_check_switch_change(input, code);
> +}
> +
> +static int charlieplex_keypad_init_gpio(struct platform_device *pdev,
> +					struct charlieplex_keypad *keypad)
> +{
> +	char **pin_names;
> +	char label[32];
> +
> +	snprintf(label, sizeof(label), "%s-pin", pdev->name);
> +
> +	keypad->line_gpios = devm_gpiod_get_array(&pdev->dev, "line", GPIOD_IN);
> +	if (IS_ERR(keypad->line_gpios))
> +		return PTR_ERR(keypad->line_gpios);
> +
> +	keypad->nlines = keypad->line_gpios->ndescs;
> +
> +	if (keypad->nlines > MATRIX_MAX_ROWS)
> +		return -EINVAL;
> +
> +	pin_names = devm_kasprintf_strarray(&pdev->dev, label, keypad->nlines);
> +	if (IS_ERR(pin_names))
> +		return PTR_ERR(pin_names);
> +
> +	for (unsigned int i = 0; i < keypad->line_gpios->ndescs; i++)
> +		gpiod_set_consumer_name(keypad->line_gpios->desc[i], pin_names[i]);
> +
> +	return 0;
> +}
> +
> +static int charlieplex_keypad_probe(struct platform_device *pdev)
> +{
> +	struct charlieplex_keypad *keypad;
> +	unsigned int debounce_interval_ms;
> +	unsigned int poll_interval_ms;
> +	struct input_dev *input_dev;
> +	int err;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +	input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	keypad->input_dev = input_dev;
> +
> +	device_property_read_u32(&pdev->dev, "poll-interval", &poll_interval_ms);
> +	device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce_interval_ms);
> +	device_property_read_u32(&pdev->dev, "settling-time-us", &keypad->settling_time_us);

Not all of these are required properties. If they are missing the driver
will operate on garbage values.

> +
> +	keypad->current_code = -1;
> +	keypad->debounce_code = -1;
> +	keypad->debounce_threshold = DIV_ROUND_UP(debounce_interval_ms, poll_interval_ms);

This will bomb if poll interval is 0.

> +
> +	err = charlieplex_keypad_init_gpio(pdev, keypad);
> +	if (err)
> +		return err;
> +
> +	input_dev->name		= pdev->name;
> +	input_dev->id.bustype	= BUS_HOST;
> +
> +	err = matrix_keypad_build_keymap(NULL, NULL, keypad->nlines,
> +					 keypad->nlines, NULL, input_dev);
> +	if (err)
> +		dev_err_probe(&pdev->dev, -ENOMEM, "failed to build keymap\n");

Missing "return".

> +
> +	if (device_property_read_bool(&pdev->dev, "autorepeat"))
> +		__set_bit(EV_REP, input_dev->evbit);
> +
> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> +
> +	err = input_setup_polling(input_dev, charlieplex_keypad_poll);
> +	if (err)
> +		dev_err_probe(&pdev->dev, err, "unable to set up polling\n");

Missing "return".

I fixed it up and applied, please take a look in my 'next' branch and
tell me if I messed up.

Thanks.

-- 
Dmitry

