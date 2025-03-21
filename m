Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0290C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=; b=2WUmDpGGIsNN/v2lRPxgSNXLt+
	rQl4F9FRELgCvB5i2P5aBGe363z0VGFJ3xprdxqzzpSMVj5geZXsXbNECODmSeg+P0mLpmnQ7QUQ3
	gygNAdfXT5f82ypEdZvW1sABPYNkcrMzQxS/SCpGUEXSbGm+1g1f6AmVzThFoA5OiQSoE/1W9Q4uT
	5bEnmnWC1+6tYxEWwHfss74skTNS6+s6JLzhFPg5jhUS+v9KdxosZpVHqAtLCFxXKogvfDD0cGtmq
	lyWVYBl12TWJ+DYQsKMPxX2lt0+nN1Pc7Qg3jN5Y6uAAV25BiIwDOsGAthpAfLEnf+7mgyUUO2hzJ
	rfbwaZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgc0-0000000FmCm-2LaG;
	Fri, 21 Mar 2025 17:56:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgZ6-0000000Flg2-1WIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 17:53:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3913d45a148so1894891f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742579630; x=1743184430; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=;
        b=BBGEkugGdZI7YwspPyRUqA/yjYj4mtAb3YqP6eruSxwryT2gwFbl7Nkswkyo1w7fZ9
         mVN45C4faikKbV0PVafQeNHqd397ST61zYU3YCcOjEb8rQ5Pbv6uzLS1dWa8pKHNXpH8
         wrwlAITB8o2tF0DhmjVGuPi6iM6dBbY9Fd9GC1GRMdiP8g610qmJboGdIpsrI3muByxS
         N7UcPgdB9mJJF08hbf6JRL+g+o5rfTuEk0qWS/DM08SwcCL7IoCddqDnPHipCK6AHvcS
         uaZQUjVQdycSE0l9rq6g31BXT2d+oCYfb8xRvYGGhDV0qu+oux8bkb6YAts5LJha+FeH
         u3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742579630; x=1743184430;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=;
        b=PaGgDXieSvWY3Pg2bSdsh8l4DnkXg7m4QAut9lSacmVHaL0EfK+dXsZ6D180Tcl238
         qaaEmE3VeJHFx5G0xhYOOK1G2XLoUVVBBZVugwre6pNZML2aJdjIgqYZi3Zmjd9aGgHw
         TZRBQuyhmNoQFcBNuKwn8uBzvHgEDRIaDweVz8UZXEhcs2OeG4orQ21swiU9wBRGz1CE
         mWk/oIo7yNHiYRdrQm8pQBGPsBYot4wBl5aIxp1I6DT4zgD8fbD38fjUiitgS+71KHlu
         +kaGZRNC2TI9aEhWQKmetZipsNDu4YYV4gokV2pOjscPWUDiagZ0UU9onspd1zGSPOlB
         XQrA==
X-Forwarded-Encrypted: i=1; AJvYcCUQAhIIxRCQ20bp+DEwwMCrLl6djR9x7RUxWN8AWJ9WrGvLOvL7skIL3n3sirjxx7Ptt9Td0m8AEVvavz9YnLPN@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ07Qw17Ohsdh1LT8M6hXmaIulQQiZdoSXMy6lqe+w2QR+fWdo
	efwf6wC2OTZlAdJJ2Eot+9YwNYKaDaDY1djrSy8y7uqKYrqLG7KPHaYoK0dWJrk=
X-Gm-Gg: ASbGncvGfsMtPW6q63fFzpidtQDw+3BSIGJpq0GY8YpAsra5ISD8UhdYHtmpyVZGsN1
	ni1AsyLhMwlVJlUJfjIAU9azlYmzkJ8mcSLmfdqpXUCUNECyqtteGyRAM8yNUbP8bEW3PXyRwSV
	+th+/5uD6FoXqUVAREBGfrNR6Dc89B9NjMupm5LA2PGelw410bMSu4tDL0jYkzLLPENmJzY7vZ1
	Jtjy435QFVK9xehcI59O7xBhSLhvMeUjYEeLJE9qQqanAWlRuWzedv+r3hsxQqMYL4DSI3Xpqh5
	7BJigMMjBqoQBwxELQ+CHXKW8XOYiWzpX5WMzl2cuCl/
X-Google-Smtp-Source: AGHT+IGw/k1s3UhG3nO2rFtVFyriyvE9zSGonoM40r54Hxa67x+rs2qU6DUJGZCT59Otrl8jKGhlwA==
X-Received: by 2002:a5d:6482:0:b0:391:2da8:6e26 with SMTP id ffacd0b85a97d-3997f94083fmr4523621f8f.52.1742579630502;
        Fri, 21 Mar 2025 10:53:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c5a7:dfd4:9ad8:1ea0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9a31a7sm2929623f8f.23.2025.03.21.10.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:53:50 -0700 (PDT)
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
Date: Fri, 21 Mar 2025 18:53:49 +0100
Message-ID: <1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_105352_409344_5FA9145D 
X-CRM114-Status: GOOD (  14.83  )
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

I'm trying to address all your comments but I'm starting to wonder if
this isn't going a bit too far ? The functions tested are one line
returns. Is it really worth all this ?

I do understand the idea for things that actually do something, such as
reparenting, setting rates or what not ... But this ? It feels like a
lot of test code for very little added value, don't you think ?

-- 
Jerome

