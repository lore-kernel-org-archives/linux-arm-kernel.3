Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB27FCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NyyXmb73ZSERJsOwHlDHX2G70DbygXiaSgqghyOqJA=; b=w+dTpPyJTcE1QZFMZAirNwOh7s
	3A/ux/OzpdqSoxZCQIk7R2vNvyFtX4xjw1TNaaSdnn54GReKnKXVuF6rmmkN/y0lOc6w7sR+1BC/K
	xCWvSJaM8eV2sKdUJLHkkPfA7vngKysOWWqv7UkvY3w5Sck549r5ERvyIi1bEU7Ml75r/OqEMo8Cu
	pIyJVCX5CN5NyvVoTm4g1XGiVyeWkWXXdC8GOukCiv8oBizowFBt4vLl6PktBvogxk/K0d9V0IA14
	kFqMFyBP6xkaAy4ewEJ4K35/M3NeW7kshfPt/S30QFB2eXEG3DFYKa1HiFXcvIeDFyebbMOqtA8Lp
	QHK/si0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjj-00000008eY4-3MGh;
	Tue, 10 Mar 2026 03:26:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjh-00000008eWf-1NJy;
	Tue, 10 Mar 2026 03:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64B4D4416D;
	Tue, 10 Mar 2026 03:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FEAC4CEF7;
	Tue, 10 Mar 2026 03:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773113180;
	bh=CGUraFSadO6xwK8hyPzW2nYZizEbPRWyDuSeFqHRTi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9f+oybQ39xBTyHNnSSDheYXZsp8GFVDPYcsxsfvYUkmJAY3jmrxUmGkMAnGRLmxj
	 F4emLXKKU0sgpNy+zSHKXDvyMmmZJ0KtYP84ceCrFU+85OMgjmCk1WgZEcwm4/cjSS
	 XaumY3JY1DVAPL9VGuQZa8IAPP/U8OoqtKDmN9C2OE3HqhQQEwP1KQjqiMnHUWakRA
	 y7NrWrWv4CfaDy/cUAcqt/D8DsRdRw40FvVXSKkH3lPuBPUsWg+2eKatLJrZZn/UNs
	 QsGtZ3DQCc2xcAC/DWLQ62n6e3OcJl3FPKPFoawsV147xwy1ba8qrStY6iNDV2eEhp
	 +UJ1MboPrYxHg==
Date: Tue, 10 Mar 2026 03:26:14 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 10/10] platform/chrome: cros_usbpd_logger: Simplify
 with devm
Message-ID: <aa-PViGyA2CTVxHv@google.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
 <20260305-workqueue-devm-v2-10-66a38741c652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-workqueue-devm-v2-10-66a38741c652@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202621_381731_A388B15E 
X-CRM114-Status: GOOD (  11.43  )
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

On Thu, Mar 05, 2026 at 10:45:49PM +0100, Krzysztof Kozlowski wrote:
> Simplify the driver by using devm interfaces, which allow to drop
> probe() error paths and the remove() callback.
> 
> Change is not equivalent in the workqueue itself: use non-legacy API
> which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
> used to update logs, thus there is no point to run it for memory
> reclaim.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

