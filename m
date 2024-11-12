Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E3DD32D9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH/T2BI6HVkZQL03GIQDo88iJkCYlcUW4yqDvUQiWwg=; b=dyXeIUIJcIf1vyM4cchwd/bDt+
	BEJ/HEY/r3EMiGBnIPWyuxpDORI0xsvqaUWskl6sH/ijatqBYGuxitk7WQSDXNLM1XzJDLNak+sz5
	tkmLJ2ljRwayKGVhiEfR3tBWxyTdy+hkNkSX8bNNc8GG8suSz5yPkgC3jTFOxhXr3h+viXsGduVDe
	PuDeXa1TKXJ+Z9Zs68uKox1eRidXZeKr6hjdSLFEP8/WP6y0XRhkaT0qSI9jUTt/3r/XyYvm7fdDT
	jWNdR5H62fGdMOq+qQbmj6TFLwU1k0CZSyIVCYa+j6bH6XgEYr968w+whqU3POrDe2IVTe2+wcfK7
	ZS82FR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApf6-00000003L7E-1ohe;
	Tue, 12 Nov 2024 12:06:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp1E-00000003DON-34Pd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60CEF5C554D;
	Tue, 12 Nov 2024 11:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD3C4CECD;
	Tue, 12 Nov 2024 11:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731410711;
	bh=XlDTTHWw7KeaNRsoKYg7Sq9T/4InzW90Q+1dVA6MOlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8Nc876hSVMqolsakMd1Gkh6Wccb7p8k4FxLNEAUn97iBGzyhQQ1XeLqago7SmQFO
	 o/XuH/idG9vB8UO1eEXHxRvYt692/yV5KMVXtAMypS0ipnb1htnYk/gwbon2EEPMNA
	 CPVqRouPMZUhajExIQaRf4bNQwOu99JaLRuMiZz9Zq1V2TN2MEdr7WwYB+eD9FMLKZ
	 jbtsNySJ9stKtFoolhLwZF8THKTVlNXDBGXQLvuHAs//ljPw3U9378GMw/35rdkbma
	 dYSRGGDin3dmI7Wll9nWmPQ1YN624dP6dNz/hGvVMqYC+Tq4nlhEKSGcRTVg+tg8pa
	 4d24dQDV8TQAA==
From: Niklas Cassel <cassel@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <linux@fw-web.de>
Cc: Niklas Cassel <cassel@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v1 0/3] fix some binding check errors for marvell
Date: Tue, 12 Nov 2024 12:24:56 +0100
Message-ID: <173141034159.1636325.1565605503934630907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109094623.37518-1-linux@fw-web.de>
References: <20241109094623.37518-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; i=cassel@kernel.org; h=from:subject:message-id; bh=XlDTTHWw7KeaNRsoKYg7Sq9T/4InzW90Q+1dVA6MOlI=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNKNrTlCF3e+N1BKMmFJVy7sOBErsiZxa9bilTcPbLqfk Fe1pH1HRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACZyI5GR4XHrnfi52/kixS36 nlaWPNE53dO1MDrgXNer1681dlbwTGBkWCB2uSh1spehZXMd1y2P7kmMBck3Pxq4zjjOtzwgMeE ZNwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_032512_828253_0315CF59 
X-CRM114-Status: UNSURE (   9.11  )
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

On Sat, 09 Nov 2024 10:46:18 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Thies series fixes some Errors reported by dtbs_check. First part is taken
> from my old series [1] where i converted sata-platform txt binding to yaml
> because it wasn't picked up.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-1-linux@fw-web.de/
> 
> [...]

Applied to libata/linux.git (for-6.13), thanks!

[3/3] dt-bindings: ata: ahci-platform: add missing iommus property
      https://git.kernel.org/libata/linux/c/e8a2389e


Assuming that patches 1/3 and 2/3 will go via the Marvell tree:
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git


Kind regards,
Niklas

