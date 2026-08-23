Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CDC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bGssleoR8j5d5BjeV9KwAwh1Wr2o/KlpY4sV/yr+LHU=; b=B9pCyRELWNovchcGCt6MGJwHHS
	w39D2nMR2y33qknh1rqlkHWetCoyA/d+hUN+bzg6UcsKaYoWkXfteCQOKvtPhPAzBte3LOye93fM9
	P8ZWWd0FV/TF3/prVnUAu8DXi0LU9Ir19CQMKD8PfXVmC5lnNIy326obmzLWnHNWixfIIRcUgnc8W
	GP/yaZpZwZAG+jO9PydOIpplfPTVhdU2JAjKuOBGqDMtlmxUXO2BTgGZTgv1W+hYQppFvdmVla+A3
	ylHb15TcjYl5ax6GUcMufDDGcuFak6z55UThKvl46bJNnu3U0BStbwJqiRuu0wPrrrKpGWM5996XB
	lBAGWcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAJU-0000000FSK6-2VSz;
	Sun, 23 Aug 2026 15:40:48 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAJS-0000000FSJT-0Xwa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 15:40:47 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47362928f65so1037065f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 08:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787499644; x=1788104444;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGssleoR8j5d5BjeV9KwAwh1Wr2o/KlpY4sV/yr+LHU=;
        b=aIvmXUdx+vMTWSWBFiCgISkGCuCzaPAdUUnF5WfkOzC3rtJPmnoapz0fcNa0Km6X6m
         KpAfrLdq3IZ8F6A+/DI9YhwB7E38rOjUKFRXiBCiJBZbQyhuRL3QrNpVMh94jQpXXKum
         CcaWi4NWW68PbMcVbRdLLYQXCwJkfAv1pq+HnCR83Qb9v1oZLBdnjceQ+DurEs+SOVvG
         vwhgvo9FxFBooj4ZKXD8ewCocR/t5j2dq3OMSUXHMBPQjM9iH7I9QUkdq50X42JBjD9A
         yaVKCZopnJa0m5cw+mZTF7Hdygpm47ag7gxhUTOWG2yFk7AHQ2UvqDI/iYM1UO8aAhJx
         BwhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2fDeR6UndJrZw73Wa5qV6g256ZFSAE15JKjjumxwJz+f6qO7q3jkiWltcYx2RkoR8UFGYIhF2nYiFAnm3KQU1@lists.infradead.org
X-Gm-Message-State: AFuF++m5sL6Q7VL6CHGcXzgkvNYY5qu+4itIMiHeNTb7DrXl/+O45Mcj
	5oUdxGKxrPdEkI5S+Xe/VPJDKclhGQYMO6sthaie0SV9c8eKctzgeCN9
X-Gm-Gg: AR+sD10XcWt78a9RQQ4hU7qV6I4cBzH5iSlMcSfyp2xVzMcg3Dvbv1cJpiy/VgFdyyS
	XhsCy+KzTNmFM0H+AUkmRTPugA4adcflyBvyb0gSBWQDb5GCM+XtCrcSnWumjusikB4M404TPJy
	iKaD7gvUnCh9LFaZXpXQymM66n7XeRTaazdV8lGoM/rkPxp703J5XaIBaE6BQ7NXMbwm8wHrYk4
	A02PHPXtcegqnDcGLnS8N9lXC9Ldk191sYR5f1D01RP8929Mt3efYw31+XUytWWh2uNlY7V/9fy
	pEeZQ8hfF+sp2E3Ye2t6LAPYlSUcUS3OamEFm7MxDQDbxw2bAKLZPOdiEKzt6sKEULwOPiBRt9K
	axytxbZPOTJ0oFDkq9uY/7AzlUc79jb2G8+ZQHPk1VMei12nqzTT9ChclRT7dZFOe8K5/kzhxMi
	1Rc3zVIdu+26RrWtmAGPvWCccu+0C0w1Q9gBqIYAum1xBdmCVEs4wPU/TkuS7X8FvCJzgh20Q3f
	79XAy6eDCTcgl/xNVG5vw==
X-Received: by 2002:a05:6000:2dc9:b0:482:9a18:d753 with SMTP id ffacd0b85a97d-482c0b44acbmr22762075f8f.5.1787499643925;
        Sun, 23 Aug 2026 08:40:43 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0acaesm5321239f8f.29.2026.08.23.08.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 08:40:42 -0700 (PDT)
Message-ID: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
Date: Sun, 23 Aug 2026 16:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Lucas Tanure <tanure@linux.com>
Subject: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_084046_181784_D26CAACC 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

Hi,

While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I 
am hitting intermittent system instability, storage loss, and memory 
corruption during boot, unless I append clk_ignore_unused to the kernel 
command line.

Because the failure is intermittent, I am running 100-reboot test 
campaigns to bisect the remaining clocks and isolate which clocks are 
critical and cannot be safely disabled.

As testing takes significant time over serial console, I wanted to check 
if Amlogic or the maintainers could shed light on this:

Are there specific T7 clocks or hardware domains that must remain 
critical/protected even without an explicit in-kernel consumer?

Current clocks being disabled that don't kill the board on a test run:

[    0.380313] clk: Disabling unused clocks
[    0.380413] clk: Disabled unused clock: rtc_dualdiv
[    0.380718] clk: Disabled unused clock: rtc_duandiv_in
[    0.381377] clk: Unprepared unused clock: a73_div16
[    0.381972] clk: Unprepared unused clock: cpu_div16
[    0.382605] clk: Unprepared unused clock: f50m
[    0.383174] clk: Unprepared unused clock: fixed_pll_dco
[    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
[    0.384416] clk: Unprepared unused clock: sys1_pll_osc
[    0.385056] clk: Unprepared unused clock: earc_osc
[    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
[    0.386323] clk: Unprepared unused clock: eth_pll_osc
[    0.386961] clk: Unprepared unused clock: pcie_osc
[    0.387548] clk: Unprepared unused clock: mclk_pll_osc
[    0.388187] clk: Unprepared unused clock: usb_pll1_osc
[    0.388826] clk: Unprepared unused clock: usb_pll0_osc
[    0.389465] clk: Unprepared unused clock: tcon_pll_osc
[    0.390105] clk: Unprepared unused clock: top_pll_osc
[    0.390738] clk: Unprepared unused clock: aud_pll_osc
[    0.391361] clk: Unprepared unused clock: ddr_pll_osc

I am not forcing any clock to be disabled; I am forcing all clocks to 
stay on and letting them be disabled if unused one by one.

Any guidance or hints on required platform clocks would be greatly 
appreciated.

Thanks,
Lucas Tanure

