Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBCAC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=; b=BlbrXvscoIgDYdPgj8zgfk080/
	kRGwFyPSpImEI3uSC1b1ABzKzbYvXiXT2304AZBS8kbemzZ2aVxr8e45CDlg24cuQwNGLhNKhkB2C
	5pa6YtMMCGJg7+vFROKRx45RkxcE0vliQSNyuwGoHAuDzQ6ZpG1cUcQ0wRxeggfdpkJK0O84+ss9w
	fFL6xUiKpoApG5d/wmzBvITAmlzsi8pC/YJJoNLAKC+5ifsVZVJmAsoMNh6mHujtBQeKhPMmUg9DM
	ztI38bBcqKhz6ebVil0MRLXEkUTVHI26/+QhOVRDLUebEKNEpTIjD2CmdY+Wc4u1ENBlCmNMZjaQ1
	Uu/TVncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Oms-00000001J2P-22HR;
	Fri, 04 Sep 2026 07:56:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omp-00000001J0a-0jYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:56:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7009535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788508593; x=1789113393; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=;
        b=bt1+JLwE06GxfOAQDsxhdrdSVPGmYeo8CB+Dc8W2wYTdMW5Jb8nKOYuv3tZvf6eMG1
         HZPY92jNVcLyFA7b1A4MHR7fypmjMPJnYv1w32tvWC6UnoOm5I2Yovw9/HYM/eQl4yVm
         Uok2AC5q7VGFlrn9wFyY6zOU+YaGszQLyH5OZE+GD/TQ+h/FDMxOey2tVMI4qON0I5IN
         cVWkYt1jKNzxOS+sGBNUq69HH9OJ42D6clZBjSv9GQ6qR4nEaCaITP0aUIIAsJNstQ7z
         UT3jCBjeBWrG6oEXGeTk2Y4kjQjbZ9v9d/jcPv3kLB96C78ULDPcD4opYrlNiHjJGYdG
         /ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508593; x=1789113393;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=;
        b=KHDm5HRmXXEVPH1ZIsyhJSOqYaBDEdYuyQHDs6QbJg/oEifZviHWq95tuOGR+fSTWr
         utp9EvKti0s6RbWHo4eutrgLoC6t8oFBxYWcUcre0MNSoiYlmdwwExbAtAp/XZz5iaTI
         YsWnoDK+k6GhKPzjJEUBzQ2GuK+7hmQ8ug6y8TwsviPgJyn5RCnOpt+sHVePyj0V5pan
         oTmoHHmpfGcKLljgLVv8tj5AqtRm/TVTmRxfhZ5K3MTn6lKrPbjmSqML0ZPA1miRC5vA
         OiSvGJl6BbG6yqCHxNqr+j7Kw3ojY3PJ0GoSUJK/eugZkr9rxAoUWvbpBmcs1wYZHplS
         Su8g==
X-Forwarded-Encrypted: i=1; AKwUvByr+U+7KOGWKoPcEMaaHjgwDmbzXa5mWQNv6VAQ04Gd5rENiYeElSWa9jUkbnGjkWfGoGcDCHtHMZfBing54Mk6@lists.infradead.org
X-Gm-Message-State: AFuF++mqkbNMxJm9Itr0yNwU9B6sNouhZRzt/CjKt82I0gnyWSy2bau0
	0kbGUGV/aefG9Z8aD5LVhkisNLTqJ5LgAajbvWMEKxdJccBRFdMPQGlOkAypcWgFEVQ=
X-Gm-Gg: AYBFou16f9NfMt6mSbj/BAR9eg9IF+rNDyVorUYmzBa/OtvkMZmg6rYUX/ez+FGhRpA
	9L7lW/1ZJQ7PKROeA8jFd9ElcyhLj2uWpQaPPnkE5LFJzOEZwO3XnstnRfCy9Nft+HBa4s/ONaj
	Wr4g6ZkwnQ8XGX1c+fuZqM3+BWy0AYBA9nnmX/OPxryQAtXLAm5tydgk+18yHm2jgG+JepuLMhU
	pKCB84ta7rLlrUs8XvAPackExg7FCpn8cBgpA/ryrk2GcfBlrPi4CfQq1teu5f86uXjv/QCJb/L
	9Jzy0kY60hGyV4LczsyMueocJsqENfffvYtwVQw2guBuZgVN4COoY+bFv4ay3VUkFmyV31IEQk5
	j7RIVEOzwgo461CNd5zidMpdknu4/NHODnPlAIUQmgWw2XZcDMUrQ5Q+ZIRfeZdnFMSXPRQaRS6
	+jkb1d7KYn15sCtrkdkFuJ9iFWmeG4yhKjKAJtkBxBjZmKvfumdOreoO8ZOAy9Gp4nGEnpf43nc
	5KvWv5kzp/MVpHqDA==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr15228165e9.26.1788508593241;
        Fri, 04 Sep 2026 00:56:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm10480125e9.3.2026.09.04.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:56:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
In-Reply-To: <20260903225921.2290441-5-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
 <20260903225921.2290441-5-tanure@linux.com>
Date: Fri, 04 Sep 2026 09:56:31 +0200
Message-ID: <1jpkytlaa8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_005635_228724_550A9367 
X-CRM114-Status: GOOD (  23.09  )
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

On jeu. 03 sept. 2026 at 23:59, Lucas Tanure <tanure@linux.com> wrote:

> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
>
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
>
> This depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this one, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.

This information typically goes bellow the '---' because we will not
keep it for posterity. Please resend when your dependencies have been satisfied. 

>
> Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")

Thinking of it, we probably do not want stable to pick this up since
your other change are improvements that will no be backported. You can
drop the Fixes

> Assisted-by: Claude Fable 5 <noreply@anthropic.com>

The Assisted-by should not have an email, especially a no reply one.
check https://docs.kernel.org/process/coding-assistants.html

> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/clk/meson/t7-peripherals.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
> index 55d09e78593b..2f429ea86796 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
>  static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
>  static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
>  static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
> +static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
> +static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>  /*
> - * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
> - * used for DMA between the peripherals and the DRAM. After the clocks are
> - * disabled, a device that starts a transfer cannot complete it.
> + * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
> + * the peripherals and the DRAM. After the clocks are disabled, a device that
> + * starts a transfer cannot complete it.
>   */
> -static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
> -static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>  static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
>  static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
>  static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
> -- 
> 2.55.0
>

-- 
Jerome

