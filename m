Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0199C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq2LoFmFiObS5jB4OwtPqD7h4w1zA3ahilWAP6xrcps=; b=hQUX0TBiwUq0FXRquUC1IDnTVp
	p3feK4wIpi6h7k8/j7/8PoUDpcaDehOqGzF7OmFXKk1R2hXFREGVHD0RPJzDKNxr4VkVcVOfJvyA3
	TjJjKS9qM/9h9wG8so4AFzznoIQai5KYo25QnGJYKVj96+1ZXF2A/KynQ9/kkvn32N8hMYGRtMDOP
	fYArzINLf3S8O9KEvfGqMIl/xs4DMHELw1yERajr6Dgkcn58lklbndovBkGbROH/UOtGmmba0qJ8+
	iTsH6YCosInY8TMKFmhJXLQBHaHcFnbmWEJ+MAOI+IneBVfOl//LbEbSAatK2NTWcOlOsRT9vT1PY
	FcJ76ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wIi-00000004n2g-0u0h;
	Tue, 22 Sep 2026 08:56:32 +0000
Received: from mail-wr2-x23.google.com ([2a00:1450:4864:30::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wIg-00000004n12-1AFN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:56:31 +0000
Received: by mail-wr2-x23.google.com with SMTP id ffacd0b85a97d-482e1b55da9so25284f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067388; x=1790672188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq2LoFmFiObS5jB4OwtPqD7h4w1zA3ahilWAP6xrcps=;
        b=M/Zyxq0sy4yag5UwoEbhIU5OZ0bUKKjlujVT5BmYpr7B7+O5iPJtHInEkWYL62RXGh
         O3KZRoVE0cc8OWh0clhT1b/ZYGnVN7GDDUaJAmMZDONz7Jj1Mtp3NYXK8Xh86OxZlkH4
         V/2Sdu9L9n9yNaVsasn2OplJJTtPJyq5q/IvD7fiSjU/X8Tx+ilYR3mtI5duH3ncW5wg
         d5hkiaBtJ5Flq/jdDQ1T9VmWJmRQmoBU9L7eCu5o0Cbgx6aZfcC9yh2P4KP6pRcei3Qp
         DXAoFP+RZAx1p7Y3VwkuYRc7KY+eGm9f1mMq+oq0jA+Jidky1mbDdW36lqRE9NG5XTAm
         iIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067388; x=1790672188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq2LoFmFiObS5jB4OwtPqD7h4w1zA3ahilWAP6xrcps=;
        b=jEqxyKMNoh7HmMzOzrasIj0MYZPsbAKhmUznP0ryTUxn2i2nRq29UUVzB0w3ws4dA8
         CLLMPnNHqt87zHTm1JIHh9AjpXKAAakBjO+JcMZVEul9Ar/0vbd4L2/6lsz7Rzgo3+Hr
         sgyVX+GunGnSho9RMKSQ+WSsiZAGC7K7P7CxTkyFTxzNVEz/v0Gmqfh/iHywB8aKPmsU
         peNfDmtzVvbmPTkCYXmGrN1YZvns9+ymrQp57HnwJoyM0bywSyXaEJc4Wmzm/tZapHoD
         OEGlDUeyZk/qxl8ZnXj8g7Lf8RfDfgoM4VbIa+6dfW3/kSZL0TBTB/yjZLicL+jBjmFU
         yKLg==
X-Forwarded-Encrypted: i=1; AKwUvBxgbe6pfiVAd0IGxl+sg0DvzYnWkP5zpjqt0eEbsBwYv2dUYdT7eDbw63pQCO9shcul9I+u1BKaqOfXercztoyQ@lists.infradead.org
X-Gm-Message-State: AFuF++nRREdqLrftLyi9d0H3PMwp+gqSXBmHwx27hJHp/X6wokiiVJSn
	Jd87t7ubH5DsnDNmH1yhgKgKQu6AOiLYtOoNuKuulmW6Z9rotreBzbKz6GMpx+PA
X-Gm-Gg: AYBFou3/TUXxo7mt33uoBtMQR+FfuLthY+rkjY3MkUt5fglI+CdjLY/RX3NT6bqX0QE
	NAk87ZfELjhZQfmsOIWFv4UIx2Rom857irnjImeCwLvtEkzA8mpL9z2/6ArbOi9hRNkns0aBeWQ
	Y41Aoln4XNDNnwSTe57rdfcSfGlvAgyEgjoASivH7p/eWkwU7gdFvM5G1MeNmH3DS4ixlNmZmHh
	yAU/O8jROqvaMW4ZvM43quttlEXtS/hnt9r8yVsgM98efpLnSYBxmJNLC+GwixPB2nlFDRBDZnl
	vycbhx7aIAH/A82vwAt7dW3fR76TFhaV3KmWeHpTY3qpm50JmLzlnNXMWKXTscsW1huxByBGU7H
	F/VbsqsXdm3Jiv3uNPPPKft+jaq2ElxXop9ROQTB846d5voaWcKs4q730nwNHZmncIvEdlEqHlc
	rokFpJuIvyVtgn4WQfAIlDRyfUtEWA1aEyUWh6Ypz8w9Db5nhtsylCUIHtyEqxPW5qWSCFYk5/h
	pEQ/KYux9KiXPGGaqffmwE5jRJOZXiL+gUhYK0Ln/Pf3WCnHEpRL305P8eX4jvDmZYj7/0MG1mA
	0Z8=
X-Received: by 2002:a5d:64c5:0:b0:485:ac0a:e11 with SMTP id ffacd0b85a97d-4871f9c6776mr18336406f8f.0.1790067388322;
        Tue, 22 Sep 2026 01:56:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886279298asm2881848f8f.34.2026.09.22.01.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:56:27 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] accel/rocket: add devfreq support
Date: Tue, 22 Sep 2026 10:56:17 +0200
Message-ID: <20260922085617.53620-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922081855.160451F00893@smtp.kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-10-royalnet026@gmail.com> <20260922081855.160451F00893@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_015630_333122_67FB5581 
X-CRM114-Status: GOOD (  13.49  )
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

On the five findings from the Sashiko review of this patch, in its
order. All of this is from reading the code; none of it was reproduced.

1. Cores left powered after unbind: not with the driver's own settings.
rocket_core_fini(), which this series does not change, calls
pm_runtime_dont_use_autosuspend() before pm_runtime_disable(); that
runs rpm_idle() synchronously and suspends the core on the spot. It
can happen if root sets power/autosuspend_delay_ms to 0 and unbinds a
core with the clock raised: the put then queues an asynchronous suspend
that pm_runtime_disable() can cancel. v3 will drop those references
synchronously on the teardown path.

2. Ignored return value: true, but here an error does not leave the
clock raised. Scaling down, the OPP core sets the clock before the
supply, so a regulator error comes after clk_set_rate() has already
asked for the 200 MHz boot rate, which TF-A serves from GPLL, and a rate
the firmware refuses never reaches the caller. v3 will say so in a
comment at both call sites.

3. Rounding the boot rate up: not with the in-tree devicetree, where
assigned-clock-rates gives exactly the lowest OPP. Without it, a boot
rate above 200 MHz would map to a PVTPLL OPP and the cores would be
released there; that is the code-read-only case under "Not done". v3
will create the devfreq device only when the boot rate is at or below
the lowest OPP (without assigned-clock-rates this firmware reports
198 MHz, GPLL/6).

4. Restore racing with rocket_devfreq_fini(): real, and this patch
introduces it. device_shutdown() pins only the core it shuts down, and
__device_release_driver() drops its runtime PM reference before
->remove(), so the last core to go idle can reach
rocket_npu_restore_boot_rate() from its autosuspend timer while
rocket_devfreq_fini() clears ->owner and removes the OPP table and
config. The window is a few microseconds and none of my runs set it up.
v3 will take pm_runtime_get_noresume() and pm_runtime_barrier() on
every core before ->owner is cleared, and drop them afterwards.

5. Concurrent unbinds: real. Each sysfs unbind takes only its own
device lock, so two unbinds can both remove the same devfreq device.
The unlocked probe and remove predate this series (Sashiko's finding on
the standalone slot-search patch, which I agreed with [1] and the cover
letter lists as open), but this patch makes the result worse. The OPP
table is not freed twice. v3 will add a driver-wide mutex around
rocket_probe(), rocket_remove() and rocket_shutdown().

I will wait for review of v2 before sending v3.

[1] https://lore.kernel.org/r/20260904135938.8757-1-royalnet026@gmail.com

Igor

