Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E97BFD0640
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 07:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX4ZLHA/bUIFbWr7H2gnVooppDntw3ZcXObgNgRB3Lk=; b=DI4nHJQ4i7RMvXwoljjPx90v2I
	8uUfjOveFJFOM9xbXYDJu7XhzZIKryf4Yu36iGXCfxiXPjV3qkouv6498C4ZSVu4h4tkXyrdsibYR
	mBHSf+CN54YE7IeIcQozSLurXVEbFq8eluhp5WZPLyFWymqt9vk/0kEp0fDWLP67bksRf+kSkJrfU
	4cdOdkEx7TYM+IjDkirBMHc7FQPHuF/pKFnqGeKREOolRavvHfj3rVAot1OBzb/8gyEFE4nfRmdSX
	WukH6qjRmNK63d7XC7+a2CDKB43RJ/sPwlLW5VYQVyicf7ygjvXbdTCKSH+Ttbt34Sw+cXRamBq5N
	I2sHxfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Dia-0000000B27l-0lZG;
	Wed, 11 Mar 2026 07:10:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DiY-0000000B26i-36rA;
	Wed, 11 Mar 2026 07:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 176146132E;
	Wed, 11 Mar 2026 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4469EC4CEF7;
	Wed, 11 Mar 2026 07:10:53 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 7A22B180696; Wed, 11 Mar 2026 08:10:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
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
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
 stable@vger.kernel.org
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 00/10] workqueue / drivers: Add
 device-managed allocate workqueue
Message-Id: <177321304548.505649.413926339032568347.b4-ty@collabora.com>
Date: Wed, 11 Mar 2026 08:10:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

[02/10] power: supply: cw2015: Free allocated workqueue
        commit: db254b0b232358ab1aeadebe8d147c99a3569559
[03/10] power: supply: max77705: Drop duplicated IRQ error message
        commit: 2064c64ceb1996ee02a6bbb1de05fd6e8028e3e4
[04/10] power: supply: max77705: Free allocated workqueue and fix removal order
        commit: 1e668baadefb16e81269dbfebf3ffc2672e3a3bb
[05/10] power: supply: mt6370: Simplify with devm_alloc_ordered_workqueue()
        commit: f23afa01040a41882a048e4957a7acac1426da6f
[06/10] power: supply: ipaq_micro: Simplify with devm
        commit: 2cfc7cac68e19c4acb236b8db6065bbaff5deee8

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


