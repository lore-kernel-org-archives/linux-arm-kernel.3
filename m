Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C4C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHQRWQJHJt80gVTv/WssWxcrsPw0Wlw1SM3KJrgvUyg=; b=Ij5rSWFXrgpeTqhVrzSe65u2cM
	rkBaz54p+U1kviewmDv+K+GoVzFZgllw+aeJ57sD4V3mYa/gx/aTfhFt9Hwn+BM6ErzUQ+Yog4Vfe
	rZ0XeO9pFnT2EC+OIuU1L+CoG6zkG9efau7UXhRdPc7eCAzmS6OZ2J3e3cP07pa0jOyr45urf64Hv
	Q3dP5ofd3EytC0TYY/8s/q7nIGZpmIWDSTdZPBj3qFZRF/SNCsgepiFwEcS5nfyY4bjZ/dIwnz+uQ
	DEciOLc2SMNvda2p0H+bQI+mIPgwwN4slZlsG8w8PIc3lYeURrrRG/CePlg0lU8TTP1mRYvdrQ/LQ
	emtKV09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnapZ-00000006x0v-2qv5;
	Thu, 27 Feb 2025 10:09:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnanu-00000006wp5-1XM2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:07:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4397dff185fso6686505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 02:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740650861; x=1741255661; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHQRWQJHJt80gVTv/WssWxcrsPw0Wlw1SM3KJrgvUyg=;
        b=IL4HN0E2umBrxQ5XKXVXfQeQTnitzx6lHvF5Qktc5VwTByK+EefqxO36RwHfJHrqP9
         1RookZjeTN506h4zfKxJYT8DC7Q9knMyOnWt4sifr6J49pI6zZl09yMf5ItMi2UfASlC
         PIIk1nA7GcdqOm+tWyHo+EsU7pTfsIyLWiybcswQuNwNp0pP5FKtNIZGddUSNlzSUZ5X
         ha2i6SjRIdaHwGaS8OgAPo08UhHBXRVqonGwJpXbhj2esB0Gvm6Ne0a0MSHla5liwLsT
         QclJOw07me9NWb4hpQDfype1EfUltq+IoU9cYGyR4NdPBmXyZ84229oWvB9gPiEexMSk
         AYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650861; x=1741255661;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHQRWQJHJt80gVTv/WssWxcrsPw0Wlw1SM3KJrgvUyg=;
        b=Ep9S4o1AX42jML3f96rCV64exPuVeSm3AAsjlX+9p0onjzEaCwkoXrYS9PUkm9XicC
         irCPn4z70C6lNBow2zspnHDbCkNvOm3z26QGphWA/H43k/uh5YVVS2r1HkjAMIL4Kavx
         cXRqyfIwg0Y+ZElXc1uP120QFfXgh6zRR9DXj/1LyyxN41aXjbvtezctmhLP0eZSin2r
         XYRFNHlUWyFjecVHRF3tNdLGrXu+bNLJ0bxe/1JnnLdGuTAhXL/vpqiXHES2dqeljJ7t
         HO/Fz2jN2dlTMSlNCXaEydzGfAJHKXfr1vQzHfMwDYTLFw+k21trYGpsAU8VGWwxVRwC
         eZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwcekbRuvLSt0wKrdGP675hhYgZBJC8D0aaz0WAndPKN5W+G/huXz7S2yBeTYefKAnpM+cWZ+PDHjaDozhRIOB@lists.infradead.org
X-Gm-Message-State: AOJu0YzRAHu73fVqtgDFKwSat1tuh1ULH8dNWzSrd3WCIYnmhu+wTmq3
	AjS2ZSbLI9bjMMNA3jEy7zWKl2wfPx7ZnJ1mQQc9H3XZN2O+nu8oBXAMPkS7tsnXuAJxeaQqdlo
	9IJ0=
X-Gm-Gg: ASbGncsL1UFWemhFJyddaA/9L4guKdQG8zzTfZAwEKlSgKGDpWmpkFTKudzOwZKvbSF
	NGVtCvpBYUDBZ946RQDLXSbBToFfx/900tcpdE1YaMljKG0WsgJ5HdGCnjtDhcUOkYn0/Zed+Rg
	J7Ik9ct49T38LNgCJh/WymUo5jiHVLIQdTb7B3o291sHCWUM7BAed0XgFbe4M3rYjjj+ZqjfF+y
	OK4VgBkHe53ay3kP0zfzRl5UBAOLaHdtwMYltIqxza3LnVid90/ZUNhtmqrOaRxgbUEzGnjK629
	4aqoK49CKykWScQ7V8+0CIM31g==
X-Google-Smtp-Source: AGHT+IEkdD4wSxsnhnApw9fAgVyEZv/IRiTUOLhTYqm3TeaCryLGDoYSdKNAF+blkPnakgUAQ5Dl7Q==
X-Received: by 2002:a05:600c:3506:b0:439:91dd:cfaf with SMTP id 5b1f17b1804b1-43ab8fe936emr57078415e9.18.1740650860767;
        Thu, 27 Feb 2025 02:07:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ede3:f33f:7555:723d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485dba4sm1532203f8f.92.2025.02.27.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:07:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock
 device or device_node
In-Reply-To: <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 26 Feb 2025 17:01:05 -0800")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	<20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
	<508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 27 Feb 2025 11:07:39 +0100
Message-ID: <1jjz9bg0pg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_020742_409842_D999D78C 
X-CRM114-Status: GOOD (  44.02  )
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

On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-20 09:15:30)
>> Add helpers to get the device or device_node associated with clk_hw.
>> 
>> This can be used by clock drivers to access various device related
>> functionality such as devres, dev_ prints, etc ...
>> 
>> Add test for these new helpers in clk-test.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>
> Thanks for adding tests!
>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 9b45fa005030f56e1478b9742715ebcde898133f..9818f87c1c56ab9a3782c2fd55d3f602041769c3 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>>  }
>>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
>>  
>> +/**
>> + * clk_hw_get_dev - get device from an hardware clock.
>
> Please add () to indicate function.
>
>> + * @hw: the clk_hw pointer to get the struct device from
>> + *
>> + * This is a helper to get the struct device associated with a hardware
>> + * clock. Some clocks, such as the ones registered from an early clock
>> + * controller, may not be associated with any struct device.
>
> Maybe write out that an 'early clock controller' is one that registers
> clks with CLK_OF_DECLARE() or otherwise didn't pass a device pointer
> while registering the clk.

ok

>
>> + *
>> + * Return: the struct device associated with the clock, or NULL if there
>> + * is none.
>> + */
>> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
>> +{
>> +       return hw->core->dev;
>
> Maybe we should increment the device refcount and require callers to
> put_device(). Now's our chance to make the change!

I'm afraid this would lead to a lot of boilerplate code and mis-management,
especially in the clock ops.

Would it be better if clock core took care of that, at least for the ops
part ? I mean incrementing and decrementing the ref count based on the
clk_hw registration. That would make things a lot easier for clock
users.

If the consumer of the API uses it for something that may outlive the
clk_hw, then it is up to it to properly increment the ref count since it
is clearly not clock stuff.

Same would go for the of_node.

>
>> +}
>> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);
>> +
>> +/**
>> + * clk_hw_get_of_node - get device_node from an hardware clock.
>
> 'from a hardware' and remove the period.
>
>> + * @hw: the clk_hw pointer to get the struct device_node from
>> + *
>> + * This is a helper to get the struct device_node associated with an
>> + * hardware clock.
>> + *
>> + * Return: the struct device_node associated with the clock, or NULL
>> + * if there is none.
>> + */
>
> Can you put the kernel-doc in the header prototype? I want to move all
> the comments there so we can include the header in the rst doc file with
> the header 'clk provider API' or something like that.

Sure

>
>> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
>> +{
>> +       return hw->core->of_node;
>
> Maybe we should increment the of_node refcount and require callers to
> of_node_put(). Now's our chance to make the change!
>
>> +}
>> +EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
>> +
>>  struct clk_hw *__clk_get_hw(struct clk *clk)
>>  {
>>         return !clk ? NULL : clk->core->hw;
>> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
>> index f08feeaa3750bc86859294650de298762dea690a..4dcdde283598b7f940c653ebc0d5a5f4c27637a2 100644
>> --- a/drivers/clk/clk_test.c
>> +++ b/drivers/clk/clk_test.c
>> @@ -3077,6 +3084,80 @@ static struct kunit_suite clk_register_clk_parent_data_device_suite = {
>>         .test_cases = clk_register_clk_parent_data_device_test_cases,
>>  };
>>  
>> +static void clk_register_dummy_device_driver(struct kunit *test)
>> +{
>> +       static const struct of_device_id match_table[] = {
>> +               { .compatible = "test,clk-dummy-device" },
>> +               { }
>> +       };
>> +
>> +       clk_register_of_device_driver(test, match_table);
>> +}
>> +
>> +/*
>> + * Test that a clk registered with a struct device can provide back the
>> + * struct device it was registered with.
>> + */
>> +static void clk_hw_get_dev_test(struct kunit *test)
>
> The name of the test can tell us what it expects:
>
> 	clk_hw_get_dev_with_dev_gets_dev()
> 	clk_hw_get_dev_null_dev_gets_null()
> 	clk_hw_get_dev_with_node_gets_null() # this one uses of_clk_hw_register()
> 	clk_hw_get_of_node_with_dev_gets_node() # this one uses clk_hw_register()
> 	clk_hw_get_of_node_with_node_gets_node()
> 	clk_hw_get_of_node_null_node_gets_null()
>
> I put some more test names. If we use gen params we can have spaces in
> the name.
>
>> +{
>> +       struct clk_register_device_ctx *ctx;
>> +
>> +       ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>> +       test->priv = ctx;
>> +
>> +       clk_register_dummy_device_driver(test);
>> +       ctx->hw.init = CLK_HW_INIT_NO_PARENT("test_get_dev",
>> +                                            &clk_dummy_rate_ops, 0);
>> +
>> +       KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, ctx->dev, &ctx->hw));
>
> Please put a newline between the assertions and the expectation. That
> makes it easier to see at a glance what's expected by the test.
>
>> +       KUNIT_EXPECT_PTR_EQ(test, ctx->dev, clk_hw_get_dev(&ctx->hw));
>> +}
>> +
>> +/*
>> + * Test that a clk registered with a struct device_node can provide back the
>> + * struct device_node it was registered with.
>> + */
>> +static void clk_hw_get_of_node_test(struct kunit *test)
>> +{
>> +       struct device_node *np;
>> +       struct clk_hw *hw;
>> +
>> +       hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
>> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
>> +
>> +       np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
>> +       hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
>> +                                        &clk_dummy_rate_ops, 0);
>> +       of_node_put_kunit(test, np);
>> +
>> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
>
> The stuff before the expectation should likely go to the init function.
> Or it can use the genparams stuff so we can set some struct members to
> indicate if the pointer should be NULL or not and then twist through the
> code a couple times.
>
>> +       KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(hw));
>> +}
>> +
>> +static struct kunit_case clk_hw_test_cases[] = {
>> +       KUNIT_CASE(clk_hw_get_dev_test),
>> +       KUNIT_CASE(clk_hw_get_of_node_test),
>
> Please add tests for the absence of the pointers.
>
>> +       {}
>> +};
>> +
>> +static int clk_hw_test_init(struct kunit *test)
>> +{
>> +       KUNIT_ASSERT_EQ(test, 0,
>> +                       of_overlay_apply_kunit(test, kunit_clk_dummy_device));
>> +
>> +       return 0;
>> +}
>> +
>> +/*
>> + * Test suite to verify the sanity clk_hw helper functions.
>
> Test suite to verify clk_hw_get_dev() and clk_hw_get_of_node().
>
>> + */
>> +static struct kunit_suite clk_hw_test_suite = {
>
> A better name is clk_hw_get_dev_of_node_suite
>
>> +       .name = "clk_hw_test_suite",
>
> Same, clk_hw_get_dev_of_node_suite.
>
>> +       .init = clk_hw_test_init,
>> +       .test_cases = clk_hw_test_cases,
>> +};
>> +
>>  struct clk_assigned_rates_context {
>>         struct clk_dummy_context clk0;
>>         struct clk_dummy_context clk1;
>> diff --git a/drivers/clk/kunit_clk_dummy_device.dtso b/drivers/clk/kunit_clk_dummy_device.dtso
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5cc89aa11264428b09e47fd29c5f9ecfb8c32fdd
>> --- /dev/null
>> +++ b/drivers/clk/kunit_clk_dummy_device.dtso
>
> Ideally the name of the file gives a clue to the name of the test suite that
> uses it. Perhaps kunit_clk_hw_get_dev_of_node.dtso is better.
>
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +       kunit-clock-controller {
>> +               compatible = "test,clk-dummy-device";
>
> Maybe "test,clk-hw-get-dev-node".
>
>> +               #clock-cells = <0>;
>> +       };
>> +};

-- 
Jerome

