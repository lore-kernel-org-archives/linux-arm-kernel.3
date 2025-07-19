Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8596C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 12:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrGw7OPP8/M0aqb1ChC6kqNbsh28VgvodFMT8JAbx48=; b=UahNdOsFHg98k2c9arqmJb3hG1
	cDLnLffZUCVWr+SSTkMvMPWGZwQQkqF8gTFfMEkyRYuwi9oIqkPuLgX9Hn4V1lsM8AXnFcXy8dYLn
	R399B/Y20Q4KCNlX8fZfv51rhWNkSGROOrWo62ab9c4KDRvrB9IfEKgpONMWNjbpN+ZQsowt5Aeag
	DNSC3VQHtbS3C3qbtusVUMWRc3rvQOVTFs1+3Ty7Cx+xItq7UIZazla+vxa4QorHBPoWghdn+Pny2
	f7vol7M+4TmaATCW1L9nlv0h7Yi5vikxX3eYt40oHrETj3J0YNpj6J6N8hQTXrRQxBzpBQFainCsm
	PqIfRETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud79e-0000000EGxf-3cRG;
	Sat, 19 Jul 2025 12:59:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud75K-0000000EGL4-0BFH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 12:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BD3E600AE;
	Sat, 19 Jul 2025 12:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3978C4CEE3;
	Sat, 19 Jul 2025 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929676;
	bh=a2WHzkI/q/vrfok07xSzhfKqQpt4+MzLjtP3AUlEfJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jq8jwH5ioSPAWSCDq53c0gOMiFlEapSfh+u1ampq1Bc2an1kYbzy+Qp5JwT4oCONn
	 5DJpv4QxdFB4CMjzAyO46vKignmqVGI/XyjMKQ+VOnzYJoDoj+sINd25AxXRtl92eo
	 NOFO6lX01LEFFhpxiNbiJci1AYikzfGAngRAGRofT03gCf1qrXhdyS6QJdOh1/kVG6
	 5EMvCqYHxxHIWMFLcwOAD28Q0dpwnB3NReOvwE/ULTcV3fWNGULEq9W4dux/jx3B1j
	 8oJiksxGtGrivHaRVUSLcY4z6JEVXOZqibk75hlFj6NoV2/A5hkiGAvfE9lU0E/VDt
	 Y4eWjdBpazflQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: (subset) [PATCH v7 00/10] Apple Mac System Management Controller
Date: Sat, 19 Jul 2025 14:54:20 +0200
Message-Id: <175292958117.11653.12996215497191655678.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 10 Jun 2025 15:29:41 +0000, Sven Peter wrote:
> This series adds support for the System Management Controller found in
> Apple Silicon devices which we model as a mfd. It also includes support
> for the GPIO block and the power/reset block as sub-devices.
> 
> Changes between v6 and v7:
>   - Rebased on 6.16-rc1
>   - Dropped mfd- prefix from the macsmc driver name
>   - Removed the check if the MBSE key exists in the reboot driver since
>     we can rely on the device tree now
>   - Changed my mail address to kernel.org
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/drivers-6.17), thanks!

[04/10] soc: apple: rtkit: Make shmem_destroy optional
        https://github.com/AsahiLinux/linux/commit/0445eee835d6

Best regards,
-- 
Sven Peter <sven@kernel.org>


