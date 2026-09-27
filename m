Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EFDC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+V9unX6aBDFJuuH1gIxp0fin+EUilc5XMo2mblqJ30=; b=R3U8xpBPY+8lCVrYzhRUhcvAT6
	fyEQ8utzwCVAfDQENSJXhSsRnGVTwvOLSZrCEAo1I6ONbQP4kHttqcx0qJ5YaHabCpGVvuP1XEWO9
	koIka9BsYWI2MTbYbMvi2vOCLiFu0IVGibBQRFKTs+pKRW6ikyn9rh7FxUFvDZwMtf1D48pp2r2fI
	CTOFDw+/2CzerdbzFgPRzwOyKG6K01BQ9Zjfep/+/txyWgcy3FT33UHBzD5cvVgD4kC+pq5JlIR+I
	jJABLcR0f3sHN1LUILJfv3VRZShktje4jt0fYqsxWdsM2TlsYTrAGsYd01iTCZB6bKuT0f1OctVaE
	53/uQCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnax-0000000GHc7-2pf6;
	Sun, 27 Sep 2026 12:03:03 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnav-0000000GHb6-0tSZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 12:03:02 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843af75de5so209795f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510579; x=1791115379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+V9unX6aBDFJuuH1gIxp0fin+EUilc5XMo2mblqJ30=;
        b=lq8A3EYeE/vl3dZYV9s3QF26GsxwJ7TgqcBE/Jq1sb5AqhzJIAmtRAky4dTjEUNW08
         sepp658isBPnP4Xw702J9Q4cmrwX25pJ1U5eS4MnFhxEZm43k9SHNg3uC1GE8Q5Onkmv
         oI9beTi3IGWNJ/Ix5auMCcPjlAgL/nNl7nqvmd/TEN4hkVZ9vmvOLvVkiIV3sRbnMZ8N
         IWObcR93IAioDW5ug9bIzi6HVajbsNWFyzK9jfmiMrRVPCZLQE18XWsxBJ4ukWqpY8gS
         F0GG9CjmgHR4oz75kb0ZpZHzlmTFCd9AN8nnaaJ0RWyS47PbvCyV5TX/aS4VYn9ZXp24
         +LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510579; x=1791115379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+V9unX6aBDFJuuH1gIxp0fin+EUilc5XMo2mblqJ30=;
        b=xvwObaV170+lAJ1Z+yYtF9fxvZi/WMamQ78kimpB6jOWj13A0hqzDtloVYDbj59Uq5
         ep4OnBMPT+yvfTEuSdHDZRG6KsRYAVxA0PonB/te8SG25Rq2931+d8FeFu1TqLn/IdkQ
         RQNZqJPC5evQXIebYOaaS9JmoTjpOQjkJy3Cc60cymJhX6ZGS9gxxm6VHJHv3zI5hQpA
         +f1dXaP87qRgkZSt5X7Mu5szpyDeyEICI6+7KgjgJ83zqsh/BS9u90mTlPhj/vhWjKpN
         sY7ylwJc0Ct5EZkH6gLRmA8H+LLpV8DD7VSw3Y0dKyc8N6LwFwco3HELmBLnyMM3iPkz
         0l3g==
X-Forwarded-Encrypted: i=1; AKwUvBzeW+aBR91kcDyeTTqC4Y8AT317mUIU7/6J4De/UAWHMzH3NkjJDUi7KRTxfPggkqGK0JwzxCV+auhPuboM20Sq@lists.infradead.org
X-Gm-Message-State: AFq9FYICsk0JrjSTlgamI2iJp2knGoNqCMHTc6/6KuewaLt6F4fI9Gbg
	XQpgVcaEraat/Xovik5cmZIJKdaqWUDTgeceRlRDbW8D2RcUEsYqEFuh
X-Gm-Gg: AYBFou3a3Gp0zNTlYyXbSz5sC6tacnmWNscPcRh/LJxt13nk0LzvtPV3BhgkTjCuPkV
	U0B4BOXWsgp1dKub+Cuppw1Wh4vul8hiXzmveienNdnQ2/uP8HAualFFj1TPEtom7bcmsJXQQwc
	/S7kkAqJqE5jep8sfbs30zuSumKLzmSwpaKbH1JhBAbm15DFzetaK83zNNFu99BrcOhUtlijIQW
	8inM3aMXodWozT629gz4dnp+UV072jKUacgEIYOiXuUTffoaYGbMZ/c1UNBOkmHPJHPj+nXBLvZ
	SPuj0wSqMgXf7K3esJXIq/g6mN3Djx4ogNBc13tREWZFVYsSzLYHSSBDG/TTjQ+EpF1No4RUHOf
	AIZrjMv8QV6Vb4+zkAmFcmgGVchV0E1Nl6ToeOnVnCPVqHIyR3JPy+YIcOSXTghgGMCVPTKKAIp
	cKzNnJgrcFYtKt5Gb02ixaHA5Ur/Qz29Ef66Q7ZAZl6ZT9BmDcrnAKf9d2Kt/D8KOdPqzZvllXv
	JbNA/cjpmKJGRM5IcILBoB/kLcZ76OjlNzWlGJuEnNQyXUh4qc/y49lqaAIwtv3rxCX4V7yO7DD
	YUo=
X-Received: by 2002:a05:6000:184f:b0:487:fa3:7630 with SMTP id ffacd0b85a97d-4887acd8844mr13892557f8f.6.1790510579294;
        Sun, 27 Sep 2026 05:02:59 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B89A9009A7C72AB6C68D3F9.dsl.pool.telekom.hu. [2001:4c4e:1b89:a900:9a7c:72ab:6c68:d3f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm19548417f8f.34.2026.09.27.05.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:58 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 6/6] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Sun, 27 Sep 2026 14:02:47 +0200
Message-ID: <20260927120247.9807-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-6-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com> <20260924-b4-rockchip-dwc3-rockchip-glue-v16-6-126a2e9133c3@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_050301_270050_2D3E18B9 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Sebastian,

I tested gadget mode on the Orange Pi 5 Plus with the same v16
kernel as in my reply to the cover letter. The board was an ACM
gadget (configfs) on fc000000.usb, with the Type-C port set to
port_type=sink for the test, connected with a USB-C to USB-C cable
to a USB4 port of an x86 host (Ubuntu 24.04, kernel
7.0.0-30-generic).

dwc3 forbids runtime PM by default, and with power/control left at
"on" the controller never suspends, so the case from the commit
message does not come up. For the test I set power/control to
"auto", unplugged the cable, waited until runtime_status was
"suspended" (about 6 s after the unplug; autosuspend_delay_ms is
5000), then plugged it back in. I did this 12 times, 2 of them with
the connector flipped. Each time the controller resumed and the
host enumerated the gadget again at SuperSpeed; where my script
timed it, the UDC was "configured" 0.9-1.5 s after the Type-C
partner appeared. Apart from the message mentioned below, neither
the board nor the host logged USB, Type-C or PHY warnings or errors.

On sashiko's question about the early return [1]: I have ftrace
output for 6 of the 12 cycles (the trace of the second run was
lost). usb_udc_vbus_handler() was called 12 times, once on each
unplug and once on each plug, always from dwc3_rockchip_set_role()
and never from dwc3_usb3_phy_notify(). The PHY notifier ran only
inside the runtime suspend and resume, twice each time, never while
the controller was suspended. In each PRE_RESET
pm_runtime_get_if_active() took no reference and the VBUS call was
not reached, so the early return does happen. On each plug the
resume was started by dwc3_gadget_pullup() from
usb_gadget_connect_locked(), after the VBUS update from the
pre_set_role hook, and the gadget reconnected.
About 50 us later a second resume request came from another worker;
from the code this looks like the pm_runtime_get_sync() in
__dwc3_set_mode(). I did not trace that function, so I cannot say
whether it alone would reconnect the gadget without this patch.

Not tested: the board without this patch, data transfer (only
enumeration), sashiko's other three points, system suspend, and a
host with a dual-role port. On every unplug dwc3 logs "request ...
was not queued to ep1in", also with runtime PM forbidden; I did not
look into it.

In one of the 12 cycles my script first marked a failure: the
board's Ethernet link dropped while I handled the cables, and the
script checks the host over ssh. The host's kernel log shows the
gadget enumerated normally in that cycle.

An LLM assistant wrote the test script, analysed the logs and the
ftrace output and drafted this mail. I ran the test on the board
and did the cable pulls.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

[1] https://lore.kernel.org/all/20260924174014.366B21F000FF@smtp.kernel.org/

Igor

