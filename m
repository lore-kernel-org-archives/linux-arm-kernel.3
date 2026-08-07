Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F7C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1raNmBEOmz6ZINnfoRbXmauBepPzo7RH3URyysnOXJI=; b=h7W12cB7S+TkcNBRV3WIjAXbPd
	KihZA34dUQ30n4I/6f+efU3bCHrnhKAI3bblQ4/dXVldGkfEAcy8juHD9UV/Yuc9zYlFNvTNR8hLb
	xhlg1AG9h8B6UDIv9CkSfIpWluDX2XYG6sHLVfzaP7v79160PXWkrIgp/PUAjWatCOlmQnmXQD+2+
	sN2bjdP4wwqRgOXjEydo4+jRCazAfkSvH5JZMUX7vj5MHPh1szdAOjujbQvPzNmA22f4CU6c6WygH
	T/wm8vvqDnxv5Zjk7Km+vn/5vXnW+4h+F4n8rZGJbx2Tzl/TNRoLU8Ru7YicZwHLanZhE932aDVJW
	YsgZCxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEz8-00000007Eut-1Abp;
	Fri, 07 Aug 2026 07:27:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEz5-00000007EuB-3qlZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:27:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5b015532f7bso2862383e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786087634; x=1786692434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1raNmBEOmz6ZINnfoRbXmauBepPzo7RH3URyysnOXJI=;
        b=GK/MUU+12YOdudd+IeMPJtVWnEORCsCNXxCv7g8DtSp+rmO/X767dF6OmxQT0F44Yv
         WRjILbari8v/mX1IRCdNwy0sU7QpYAM+uEc0m0RNDUkCgXVNYJyuu6a87A5GJaKMivuP
         HVk67V0GPRUmWgv4zTLYO/8/zVcMpUXPmDbm7fyWHPnQNAl+f2R3bGwvzMp125GNZw3M
         9trNgtFNEhuegMOL4sFqkaKScQuonWu6JvW2jv6Yl5WQ4SMICHVsZuA7syFAY7nhgOEO
         xm2UTWu8teTYg0TMU0FZqZ54+NYOGrhHbUw+5cNVM+penSfeTLcRYJqLPM5AggNHP1iI
         qyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786087634; x=1786692434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1raNmBEOmz6ZINnfoRbXmauBepPzo7RH3URyysnOXJI=;
        b=ISU1R3KgBPPP1yw8BBv/LE2SzGJqRAXmEW0rNYPK+OgGyR354NqlOGCzxqTR34tTri
         2cDanTWFOmeF2jbNBQb659hZnjmq9s0aUg0XVkhDpdcYWuwdTG1Lecoebwzz86B6192H
         JYZDS8n4WF6gO+7j5YqIweoN9vzoM323XCKRqoPhDTC9mYq+sShxVszzBpLXI60+CCKg
         yzATwFnCQmgT1CIFc8ytDkSW9FuP16jzWiQbis8iT9IfOHTvUArIl+Q5FupY48tpYXsD
         TIQ52aE0bwTkkA+3TzNwRD0iIulrCYjDzegnmEXD8qXew4SJqazW+fPxudTXbfv/nx/q
         UGMg==
X-Forwarded-Encrypted: i=1; AHgh+RpPgNJZbklCKvdYKSlXCyGGk6/zv1yeYho0AjYQVSPurhqJTuxb2itRzpJzo9JX1eFE53EGyk8DRjRMn+nZJN2I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0rOISakgv9zZmKZ3F4nB7y2DHURrk6lOvh514uBoGrw/cNmGS
	MOOJFZS/m0LE3NPvqnYgSVoAOzt5wbO9+G9b5UHXeIxtPie8IArdWCc=
X-Gm-Gg: AR+sD104zILtzOxAMJGxbyOUjtK8rrfpyjzghpA2wc1FFmDVl284oCAQlSXuSs1pw26
	j5FVsgxgQBr9EW58PO37GDflJCK2uiG6B9qc+JK1n/asDjP11c0nwuDfh4Lg/b8U9MhuEO9iAUE
	fhVtYcGRs47IBgvV3wSnxaR5LnNMPg5g7lA8/Uj6iTjfLeu2bJcD6lY+3oCDNIQ2zttT8lS9ivi
	YPODLebE3Qp557516BwRFQ589EBYINomVaRoe+EQqtdHmvrre50rplfMpPbiyjuq37aW2hCkD2a
	ViC8VrKT/0yD0ozbHF7OM/PU5hbABmpl6NZiZszi8TPTii1TVnAff7MjiklsQL+eYA0NfrKd2dP
	BK702ScCl5hS/QHnImic83WdK1rygL2tkfkYTv/sC4oRotoSS/ji1M/5XEIV8rjJh31GPSzCUg8
	q2qx7bQBLSi870CYcFVQgFaP5ZfeUs9hX85Jy6Ktq/rfYbn/wQGT0=
X-Received: by 2002:a05:6512:3a93:b0:5b2:a21a:10e7 with SMTP id 2adb3069b0e04-5b2f4ccb4aemr2641992e87.25.1786087633471;
        Fri, 07 Aug 2026 00:27:13 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f1cb0sm317139e87.64.2026.08.07.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:27:12 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: npu: load the firmware without the sysfs fallback
Date: Fri,  7 Aug 2026 10:25:30 +0100
Message-ID: <20260807092530.46853-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807024125.434055-1-sochnev.v.74@gmail.com>
References: <20260807024125.434055-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_002715_958860_F1FF0EF2 
X-CRM114-Status: GOOD (  10.55  )
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

On Fri,  7 Aug 2026 03:41:08 +0100, Vitaliy Sochnev wrote:
> request_firmware_direct() sets FW_OPT_NOFALLBACK_SYSFS, so a missing file
> is reported as -ENOENT whatever the firmware loader is configured to do,
> and the deferred probe path works as it was meant to.

Prior art I was not aware of when I sent this. Ziyang Huang described the
same failure and proposed the same fix for OpenWrt's copy of the driver in
March 2026:

  https://github.com/openwrt/openwrt/pull/22697

That one predates the refactor which folded the two request_firmware()
call sites into airoha_npu_load_firmware(), so it changes two lines rather
than one, and it was never sent here. The reasoning matches what I arrived
at independently, down to LEDS_LP55XX_COMMON being what selects the symbol
back on.

Recording it here rather than leaving it to be found later. If you would
like it in the commit message, I will send a v2 with a Link: tag.

Thanks,
Vitaliy

