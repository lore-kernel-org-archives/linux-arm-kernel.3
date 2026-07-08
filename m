Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890FCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=; b=mvbP+ONZ+QDJxlHoeWIKjosUVm
	Ge+JHBqVx881Emh9UUuHRA+WK3E/p+sui8VWOTHEzYUEQ2TB4lG0RUuA+NprN6kKUBhxv0vdiK7zD
	R/w3Gsf3QhEdEL5Klt3ZhUmaa7L2C3zP8AuLFoQpS1hILlqAOnL3VnSNu9J1avXiK0Y7YhGNwM+VR
	PfREpgayd3h10j1N9EgTVZtgHAu5zunT8i3bO+8KuPhaKpL2AP708cQ/5pHFBpitzBvgQCohs4Pha
	E8+EZdivyv2C81fnB51Odufc39E2WXFseIS0jGsn1fVTKgH9tQJKgD5tq30H1wA/o6U982cYOvTcD
	Q+DeAgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRXc-0000000H84v-0nrw;
	Wed, 08 Jul 2026 12:38:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRXY-0000000H84X-3aaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:38:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so4585215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783514290; x=1784119090; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=;
        b=TBLghfIGkdKHWv7qIKG8DMoMmO9WvvrZVVHYICJ3jfB4WIGcYNM1mcwW6VJwnkq36U
         S3PlGumpdOmLgJOfZlEJGw0gekLzR20QHQi7Y307+uZfiwMGUtHFj1R5VuzDRHDvPUpT
         /oZT8STWaezPJ2Sn7KHg+Zxd30BSJXULUwTwZQAmpTZ4jxnWXUOxkDKrZfCcL1gZtO/t
         MM1vBXwMHUzNB/uPg2J247IKpicpsaKtEgQjNKlq+83cB4+PLpSrMCFxboQ9a2Ez8MGx
         +OSqd4XnLL5o0TylVaDIZ1jebMe3gKN8QMtP+aD1XaqKkdtyk65thrI1uX6X44Oy+sZb
         TxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514290; x=1784119090;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rFFEb1yJr4W/OXQaHP4cwompeqYq2+VX2v909Wsi6ek=;
        b=WtRquInPDiYPhSFK5EIHrX4YmQ8PpyJx7VyYruUYxTP4q2vhKbOA6KIVWDKla5FzCd
         iI3WP/76x/w6xWOrjwabttLf1xIR+2kYtWqigIztSSVNkHTc4iM8vyVQ8i/SIxXLa/pQ
         MOvw5oZqV+qsAzwL6Bkghm1PM7SJjVoNJioOuXTXeNadMezjK/7AeRXq9eJyprzNp75+
         ZhOYiT5KlbT4onGULK3DEc5f3wLC5K7gxR0u01dF1wQLpbzVE7yC4zA70zcITcy8m2MK
         x8xUHXtPgqzmwwlJ+2DU6l5WdE9DghYOXmZEFRzHgPjbG8HE47vAaY6FdW17GhHGQRv0
         y4Tw==
X-Forwarded-Encrypted: i=1; AHgh+RrHpF6jUAn5Wp3qFjD0BdLLbxOHLUOjXAhsrKlcrs0pM4CyPJgSxGmtAHLcnx5RsZY1gBYtBxn9Kj3vtxWR8QLm@lists.infradead.org
X-Gm-Message-State: AOJu0YzrMpg4pe8BNlOC5a7Edf0uppZqn+lXwzVvA/i/aP+raALeohzW
	KP41Ib7bwVRuZwLn9HVaBAcFM8zUG0u/uCv3hnXK+JA31MZAZm/bdwtWChCDT8HdK3LWH04EcGf
	X6SSI
X-Gm-Gg: AfdE7clnMfqIYbDVFtMKPrXQYuZ3sbc3TOlKKSCLiyONQmta4BxI78LrrnP3uwelZ4i
	dJ3Eu71INbpXdg2sQ4RcLnW1NnnXZXP52v/EYhAoWETeOo1ULlPJ5S0CA6NmWglx8NGbtUkKHIz
	2IfWEAvVBlsJqnGqu0SDOMV1/y4M0EOl7cJc+jd4PJrf5S1m7MAvILH7QfDaGkpeooL0vZwegMv
	8Gc+GLvfnA6/asL2SI0hAOlhQkEs9BgWkmBvQJY5JB/h+z62Xk1MNtOjGfDwoHOi6Qqny30qzcE
	g94laHmsYmXeIZUuKj6dmGxLrXwuAhkba8T7b8b+RTmmyZQKzwmECDFb3OBSKg5zDBrxH1o4AZv
	CjY0wI1beDImdqEE6PZYKUKUCau2y1eCDnQgUOyBiF0l/DKnvtAgbZG9zlv24Z1+dxDkZVDcqTv
	7upSSs+y2bQDM=
X-Received: by 2002:a05:600c:a00f:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-493e69e9902mr24247945e9.38.1783514290519;
        Wed, 08 Jul 2026 05:38:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6a8f:4433:b91b:5334])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f4fc0bsm125307795e9.10.2026.07.08.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:38:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 9/9] clk: sunxi-ng: sun6i-rtc: add a733 support
In-Reply-To: <CAGb2v67AXz=TPzNFnRMS9-vweL+6g5T57dwwYCdorwdi8HWcjA@mail.gmail.com>
	(Chen-Yu Tsai's message of "Tue, 7 Jul 2026 00:47:30 +0800")
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
	<20260706-a733-rtc-v4-9-f330728db3d3@baylibre.com>
	<CAGb2v67AXz=TPzNFnRMS9-vweL+6g5T57dwwYCdorwdi8HWcjA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 08 Jul 2026 14:38:08 +0200
Message-ID: <1jpl0xhd1r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_053812_921597_72BEFE00 
X-CRM114-Status: GOOD (  19.26  )
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

On mar. 07 juil. 2026 at 00:47, Chen-Yu Tsai <wens@kernel.org> wrote:

>> +
>> +static struct ccu_div osc24M_32k_div_a733_clk = {
>> +       .enable = BIT(1),
>> +       .div    = _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table),
>> +       .common = {
>> +               .reg            = DCXO_CTRL_REG,
>> +               .hw.init        = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
>> +                                                          osc24M,
>> +                                                          &ccu_rodiv_ops,
>> +                                                          0),
>> +       },
>> +};
>> +
>> +static SUNXI_CCU_GATE(osc24M_32k_clk, "osc24M-32k", "osc24M-32k-div",
>
> I'm not a big fan of using global clock parent names, especially when we
> can have proper struct clk_hw pointer references. However in this case
> it seems unavoidable without making a huge mess.
>

Indeed there is no way around it to support different SoC path with
static data.

>> +                     LOSC_OUT_GATING_REG, BIT(16), 0);
>>
>>  static const struct clk_hw *rtc_32k_parents[] = {
>>         &osc32k_clk.common.hw,
>> @@ -267,6 +296,15 @@ static struct ccu_mux osc32k_fanout_clk = {
>>         },
>>  };

[...]

>>  };
>>  MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
>> @@ -375,6 +435,13 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>>         osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
>>         osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;
>>
>> +       if (data->have_dcxo_status)
>> +               sun6i_rtc_ccu_hw_clks.hws[CLK_OSC24M_32K_DIV] =
>> +                       &osc24M_32k_div_a733_clk.common.hw;
>> +
>> +       if (!data->have_phy_ref_gates)
>> +               sun6i_rtc_ccu_hw_clks.num = CLK_OSC24M_32K_DIV + 1;
>
> Maybe keep the old CLK_NUMBER macro and call the new one CLK_NUMBER_A733?
> The point is to not directly use a random macro + 1 here.

Are you sure you about this ? You are going to end up with this
CLK_NUMBER_A733 in the table which is going to be odd (unless I put an
explanation next it) then this CLK_NUMBER without any suffix put next to
clock gate things

The choice I made initially was meant to keep thing as clear as possible
* CLK_NUMBER remains the number of clock in the table
* CLK_OSC24M_32K_DIV + 1 (while not very nice) clearly show which is the
  last clock in that case. It is not random IMO.

If you still prefer the suggestion above, I'll submit v5 with it but it
look odd to me.

>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
>> +
>>         return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
>>  }
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> index ab7b92b47f59..4f4f4cb00f1d 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
>> @@ -11,6 +11,6 @@
>>  #define CLK_RTC_32K            6
>>  #define CLK_OSC24M_32K_DIV     7
>>
>> -#define CLK_NUMBER             (CLK_OSC24M_32K_DIV + 1)
>> +#define CLK_NUMBER             (CLK_HOSC_SERDES1 + 1)
>>
>>  #endif /* _CCU_SUN6I_RTC_H */
>>
>> --
>> 2.47.3
>>

-- 
Jerome

