Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C68C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=; b=NXDbf3pJebZGeoEwjt5Mdj/xdF
	hthZc8wgxG6hOo48tliBeojniopjPF2l92keKdW5Pmo/ZTfvj+kGGYwme2l6GQUQVfbPPpWStVMkD
	a97R3Ong9x0ZGbz1ljCFTDwdDEUqzIxg3iNJI93yiQh/p3KpQhuIwRtKnOQ2Y3gRB8Mti3HRl3xx7
	V1Jpz0bOzc3ahMk7VKzkkNWxnB7yuNGtd4hX4i86AjUlmDZtahBExWTVYHG+Q86GdtIH6Egm6tal9
	hfrJPmmALS0jjM2qAVP37yeYVnPipjx35zR4rLKOWGJFV/YjSNi4ZLWNDavaic+MryFQtxSzVL95j
	Lrt1WfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvas-0000000Cedt-0Std;
	Thu, 10 Jul 2025 18:02:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtYq-0000000CJPg-2Q1Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=;
	b=NoOG/5n3eNk1WDsqPLy/gTrXzR40kMOq9CpEFCSL8Dn1c1B2W2Y/hGvafTkgupA1jY0Xbi
	S6bMhfPxv0AJqjNxnL4XTEe27nbTRCxpofubbD/8KszqGmobFnHqDd3hutNKF9asSZJnP3
	+0ag61dv8pFI6o00kQfOP267IpLgKOs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-MECO554WOuG3cNWtIhkuag-1; Thu, 10 Jul 2025 11:51:44 -0400
X-MC-Unique: MECO554WOuG3cNWtIhkuag-1
X-Mimecast-MFC-AGG-ID: MECO554WOuG3cNWtIhkuag_1752162703
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fac216872cso24162036d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162702; x=1752767502;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=;
        b=asAHOIhEKdV7kXfkcoHdkoGCrk61NFEh+z8vcdTcNB5LKXl4Ty97aDJ7ssw53q84Ta
         axzSVIIFbJ1j5MZFjUvhEpbpCO7g5KfiUd878k/YGMuHtWeliRUSI37FIvwLF5SRq6Kh
         HQbBWJGoMREZyzSou2oXAVIsI4yG4JwaxYFsYuErxQc3mIefNOWTaNypJD/rxz/GcTX0
         aoDhe16weKXCc2TN6Yq++TAmz1bBsMmjFvLvmqCRHi1r6EPv7vuKDu+sAKp755IFXKTF
         IfsR7g3f9Pbbo8efcj4OFRAAH+wWbrXdqa8wVrGAYBt2npT66fMjyq8ijdNh2ek9rift
         EmAA==
X-Forwarded-Encrypted: i=1; AJvYcCWBmidtDF6kAGVx6N/TD0ciEOgTGz8gGAkGIT4In8KBQ5v4ybZlhao20qtRic18ZVJtNBWBEGsriZO4WtyelLAh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0sGGRro13Xa5CajEDuVa6FBElircxtExLyK9xq3KTrZeTyB9m
	xE43uabJwHLLRedioGwQ2GbkWWjcJcdzdtfeAy5VW4NRudW15lNJj9ZEmRuXODYIIw2k0Z1o2LV
	WIreLRba3DERWEX1Tq0kRBct9ob+Z88Kh1zS/wqn5KF89RykmSSpssY/XOlN/wt5IEvu69oVQIA
	/TwQcHlLNQ1n7/NE2xKTebIWyeO1asu31jMiAQtxKlbL0+r96bAOTNJPZfET8=
X-Gm-Gg: ASbGncuUxe0mEufCEX03b4N0qUVrewNc8e+iLg706F7i3BwY73VJigoVnCN4i2NTQQk
	b+aMyJzmxXCMiZGb6anv8UQr2IWPZtTc/qfPRFCm4OLGF1Qi5pC5Em9hjC8dP/TA0TxANvWf+Oa
	xxmYPSRSsz76+1TcUUFPVRMSs93ZeWYnuPahwoZEQQqcFwY5gA0PNjpMZnmfw/yxIRdP+i2MDvs
	wWs+bG9LloHJLAO2X2LhO1/ogGt+bX1tkvyYDaoZ+c5H5l5kh4/4cmOs0wyXhaGv/AY0lzAVOSC
	3V1LFoZlj42iMIr6ACWXFlorzatHQejsYlBNzBOKMmlUz+hp7aClZ6YdXDFa
X-Received: by 2002:a05:6214:f6f:b0:6fb:50da:48c0 with SMTP id 6a1803df08f44-704981df370mr48741896d6.32.1752162702425;
        Thu, 10 Jul 2025 08:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6tTS21fRt7gW+5oC/mUmMYYDHl8pgKSfHGnscN6OnkB2uw7eNnpNtqA9BjpxUhpgOQUOErg==
X-Received: by 2002:a05:6214:f6f:b0:6fb:50da:48c0 with SMTP id 6a1803df08f44-704981df370mr48740986d6.32.1752162701655;
        Thu, 10 Jul 2025 08:51:41 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 11:51:06 -0400
Message-Id: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrhb2gC/x2MQQqAIBAAvxJ7bkGDMvpKdDDdaiks1oog+nvib
 eYw80IkYYrQFS8I3Rx5D0l0WYBbbJgJ2SeHSlW1Mlph3K/g0W0rSiaxJ6H1o7ZGj75tDKT0EJr
 4ydt++L4fj0lNa2YAAAA=
X-Change-ID: 20250710-sound-clk-round-rate-adb1a71bd867
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=5203;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9HMFkZbuW9ZpnWbftnssfH9Bqhp8qt4XbuXWzr1wRy0=;
 b=sGBwjqYM4hPVL1CZFdLUsSLiPft7TSDB69HuiD4QNIFy9Mz6ke78nYWLUUl9QcWx2qrOP3kGY
 O85EabSwvs7AKgAZmdJB/ePYT6ukziJUFUbHtudOEOYr50RuwcvWs0Y
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PzEsgbIuwyYPE9nxiPjPvElxBZnpfaTMd-U2UVCdmxE_1752162703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085148_692975_A71883C6 
X-CRM114-Status: GOOD (  15.22  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the rtc subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (6):
      sound: soc: codecs: da7219: convert from round_rate() to determine_rate()
      sound: soc: codecs: rt5682: convert from round_rate() to determine_rate()
      sound: soc: codecs: rt5682s: convert from round_rate() to determine_rate()
      sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      sound: soc: stm: stm32_i2s: convert from round_rate() to determine_rate()
      sound: soc: stm: stm32_sai_sub: convert from round_rate() to determine_rate()

 sound/soc/codecs/da7219.c                 | 64 ++++++++++++++++---------------
 sound/soc/codecs/rt5682.c                 | 26 +++++++------
 sound/soc/codecs/rt5682s.c                | 26 +++++++------
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  8 ++--
 sound/soc/stm/stm32_i2s.c                 | 21 ++++++----
 sound/soc/stm/stm32_sai_sub.c             | 14 ++++---
 6 files changed, 87 insertions(+), 72 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-sound-clk-round-rate-adb1a71bd867

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


