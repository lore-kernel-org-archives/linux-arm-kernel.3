Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF32109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsHchTDD/FwvwORtEGwQTlj+76R1QQwuC5o9Ft5zrh4=; b=PZSPegAHbuRBmdDgKlLEDlhkFG
	KKdi2GW1cBUV/XFdjKSAJQ1THh7vm6zbJYLcpmM+fZLkuXFpaxoojDBObYGjUeUmKgjJaGXnkb93B
	tC0THntNsi67yViJ/pl2Y4h4P2Ip76cN+fltmvHyrh7uh97sF0Dm6EAB3C+Pd6TWmSSmmJJVbzbAh
	mL5wSrFDWe3OV8n0ag4CvpP1GDNE6RbhW+ff2MnJ3NkKlpgsIDzPMzjtM7BD+LauuqyxiSrYvMgT1
	pQyAmIRFzY1mr4gPXsFH/kg+z/ydB7ltV3jIEWXiMQWvcRgkplQUQzDH46A753rT8A8GSckKCC0KX
	+QNtaxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G7k-0000000B3wm-37qj;
	Thu, 19 Mar 2026 16:21:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G7j-0000000B3wb-2UQt;
	Thu, 19 Mar 2026 16:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BAA6600C4;
	Thu, 19 Mar 2026 16:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D019C19424;
	Thu, 19 Mar 2026 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937286;
	bh=SWuryUrLCruxqK7KPSnDrrfXYe0rzOzozifRFqJ4zdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hef07MusVcnp2t8J564ll1u+wYC0m2OUObIg5bVNiRf0DMkXUITgxK/oFxN6BCiA1
	 KgL3T6+GrWN7m+5EdnN330/a/SUiUC0toYsQTDELmz8a+x+BFVVyOZ1wEU1L2Nx02y
	 OC89WGOTkdpT56I6GVHGalJrrrG9RzVPNuPEwWUCI5mE0LaTCAXMA3wFg3CFUg4qpI
	 nsYY82XrC4O+8O/nIzZmXsLQF85C7HkdNDSDrE1EyX5fSW2JiQsbQGz3ReUvx4AZt7
	 1XGKMnUIz98LHRjJQ2oe3WxafNmRsX9xEjxbl9ig7li33yzfu1aNhwdiM1DJnnbN8j
	 MUDhGgNciC/Rg==
From: Lee Jones <lee@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Tobias Schrammm <t.schramm@manjaro.org>, Sebastian Reichel <sre@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
 stable@vger.kernel.org
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 00/10] workqueue / drivers: Add
 device-managed allocate workqueue
Message-Id: <177393728021.2870619.1816530869958472742.b4-ty@kernel.org>
Date: Thu, 19 Mar 2026 16:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Thu, 05 Mar 2026 22:45:39 +0100, Krzysztof Kozlowski wrote:
> Merging / Dependency
> ====================
> All further patches depend on the first one, thus this probably should
> go via one tree, e.g. power supply.  The first patch might be needed for
> other trees as well, e.g. if more drivers are discovered, so the best if
> it is on dedicated branch in case it has to be shared.
> 
> [...]

Applied, thanks!

[07/10] mfd: ezx-pcap: Drop memory allocation error message
        commit: 33e0316783a205625b7c55a78041ddc0d5dce7c7
[08/10] mfd: ezx-pcap: Return directly instead of empty gotos
        commit: 444e11d9d9e56c994da8a253cdf7f33ac2eeb15b
[09/10] mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
        commit: 356ee03f6ae7d04f90d8e2104660193c4f3a071c

--
Lee Jones [李琼斯]


