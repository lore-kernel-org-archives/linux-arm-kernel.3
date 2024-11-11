Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CC2D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82twavGuLWTJE8grzKhhtXUFG4Q4BS+QMs6hPipSk/c=; b=xk98slu4gBYgZzdZ6DhjpJ90KE
	I86E7Oqj01BqKe+vO68iLXlw7VuNsvTtKxqh5qLDsdWeg6dT+kmfbDUSTYG5zvJ65GaeJUcAVj9UV
	6dARLIgYos81Ax4Qn3wR3uyBwIfwIUEoHoAetBABHb+J6QMlkGXLuFdBYTNAZt8e6bFuBmMnplr9j
	m+3dfoucZbOhLtZ8OVOCsO9MzH2x96UI6I01mrdpV0scThzTkQx213wBA5AJTU9H4Po8AIp0zI1RC
	zNidjV+Ir8JtY9Q7NrPGCZGoz7XC5mqnAvwhLNui55rpHs0eSlK+dVeLGKBQDJ+IADNolNPeDN0aW
	8CZiO6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbGG-00000001EP3-1Bsn;
	Mon, 11 Nov 2024 20:43:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb8w-00000001DF3-3szN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE0A2A40851;
	Mon, 11 Nov 2024 20:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79185C4CECF;
	Mon, 11 Nov 2024 20:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357373;
	bh=Kr4rn7O6C9i3ftwAxRuTUF7vUGPIBqmjEbRAesXeZA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltodrAhTZo3aVvGPd8qqNAmbPPeqsf5Z5hwMHgWfqAvLxDN9asXFbBBuhgrTXy2mD
	 UTlG0QMEP/Dk4ZvI0GM4pOU7e12ZHsRqg+o5ZwZSwDYa3PXLIbHFGstsRts1mAxLaS
	 L88Q02gLedHV+OGFXmp2ZHoHTj2FrFjI7P4T7JVUK6z+px33enOmMLlSr1hVdvjX5+
	 I4ThDBdH4fXvhC2Wtk4jm0BXEYimtVVLe9fyag02Ncq+SK/mjKhf16dSr2l9hd4Sne
	 1wZYpRYHi5ADQbVojOY1+3Q6GO9Rwrk/PRDWbjTolKDGzHMyoxTuWE2BJJURMmEpvU
	 1ED5ci85HG+CQ==
Date: Mon, 11 Nov 2024 14:36:11 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
Message-ID: <20241111203611.GB1887580-robh@kernel.org>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109094623.37518-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123615_051783_227EFBBF 
X-CRM114-Status: UNSURE (   8.38  )
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

On Sat, Nov 09, 2024 at 10:46:19AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>

Thanks for reviving these.

> after converting the ahci-platform binding to yaml the following files
> reporting "'anyOf' conditional failed" on

Here and the subject, "fixing anyOf" isn't very specific and is just an 
implementation detail of the schema. "Add missing required 'phys' 
property" would be more exact.

Rob

