Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2722DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1WmaZd9ARFQ+f4h4szrLm8go6qRg9zWlmYYmYDlw3M=; b=emXeICfuHiSyvnRjpltIIj5Qt+
	TOzb5fS53LjWQLWa5LVHZm8ZOqUCLK1cyCsnZswimanJU7fZZIWC3y3SBEMGuY/aLqA2tKvPIYupK
	Pr0oK/7/HjNTgo/BHQZHJqKXV9SurqZPZvKv33fMKlftUmNqsLgs+BO9B1Y+OSpccuayxpoSHAhvr
	8JA1Qw7lowOT4PujQZvMqLgRSCZQyaHX7avIvE6aaeFAs1j2ern2HITU5aWfhceTWqkx1zxoBh3O1
	45H1zh1zAim+skFznUkEHGIPuZWQSdeQvfxVwdO8smvS8+6hcLRZweumkpGgVkp+Cv7mV3N6Ign4q
	B6m5lfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T4Z-00000006go6-2YZD;
	Tue, 15 Sep 2026 13:19:43 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T4W-00000006gnR-1hgE;
	Tue, 15 Sep 2026 13:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478381; x=1821014381;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=SVuepb5qfMblq6RP1L3XJFZ0Q7e+JMWIKTiRz+aUxrk=;
  b=egZQ1zUqf6CJ9qxwsfjWYjRHC452y4nrCoPEBJ65n97cvy2ZpqDmP3N3
   83Uzf6TZnDK/tyd6sP8mmOnfWi6bIWrg44U33U/wBYGYgETEG2qJQzxFw
   TJj5TYaykKzpjwfbQlGIpAlN5FuzxtU7Z2VzhUOavAPNlQD6PVOYRHtAf
   Pgrrr+QvNddOvQ24364n0BebC0criM/OniCrDx+dG4OIZYY/0M3NXlHsr
   BksmvvKaHbLfKNOJbjIlLov5cNFeRNmt1hIF8yNr5Ma6ZH6WarJfo9SKV
   X7WHTJdSQCfBV6k56eF9mMN+saUOX0gHjkk2EyiCIdq579Hd58Ua0MRGD
   A==;
X-CSE-ConnectionGUID: 1scwqrTgTFqoKp9c0QbUsw==
X-CSE-MsgGUID: /lwp0aE9Tme/IGbQL6i14g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100164660"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100164660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:19:30 -0700
X-CSE-ConnectionGUID: 0gcTBJTdTCy+dghC/CXPvQ==
X-CSE-MsgGUID: WxWomO74QP65TaQ+mWPnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269734764"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:19:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Vadim Pasternak <vadimp@nvidia.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Zha Qipeng <qipeng.zha@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Kees Cook <kees@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Phil Elwell <phil@raspberrypi.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Pan Chuang <panchuang@vivo.com>
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Subject: Re: [PATCH 0/7] platform: Remove redundant error messages on IRQ
 request failure
Message-Id: <178947835401.32141.4790012593418715097.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:19:14 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_061940_494208_6C5A45DF 
X-CRM114-Status: UNSURE (   9.12  )
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

On Fri, 17 Jul 2026 19:20:38 +0800, Pan Chuang wrote:

> devm_request_threaded_irq() and devm_request_any_context_irq()
> automatically log detailed error messages on failure via
> the devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/7] platform: arm64: Remove redundant dev_err_probe()
      commit: d147ddd21884defe37051f2ad1101fb42e4767fd
[2/7] platform/chrome: Remove redundant dev_err()
      (no commit info)
[3/7] platform: cznic: turris-omnia-mcu: Remove redundant dev_err_probe()
      (no commit info)
[4/7] platform: goldfish: pipe: Remove redundant dev_err()
      (no commit info)
[5/7] platform/mellanox: Remove redundant dev_err()
      commit: cf613b192c76e887857ce592ce535799c21034ff
[6/7] platform/raspberrypi: Remove redundant dev_err()
      (no commit info)
[7/7] platform/x86: Remove redundant dev_err()/dev_err_probe()
      commit: 6047fcfc8971e0c01bdc840f661498b044dd8916

--
 i.


