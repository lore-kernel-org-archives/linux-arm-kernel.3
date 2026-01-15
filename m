Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0667FD44C76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjAI4sw5fZWleNcy5E+bpQXvW8kKtlqPBKTICHmyuec=; b=r9YXPNq/+5k2xjZ/tBo5nIc8Si
	h92xbLk8SJYQi4zoCozcA5jRzF58N/2Kzas7yBSM4e5H3vnsY9Fl7Rp0sHmthdJt16JEyXX1T/OIr
	lcgtJsTHaAcfDfqQRvPCY5qLe7pKuk5jwGIAepAvz8ISojC2O5EiOAPAMFNseMObUwNxY3iPzfW/5
	I+5qaRfrbjb18Rf8QXHmSyk63kD2TtKLAsoAAkyb5P1t2fEbeT8lGxG0Zj8JlUtlX1Aduv3TZJ7/U
	QlodB4ZHmROoQnFrp/0YvrQCjO6ecxQFoLWX0+muuw7ne6PdD2NfbNw5FcVrZjuQ1k93S09Kydm/K
	BXWfb1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ0N-0000000CfVa-1Z2m;
	Thu, 15 Jan 2026 16:15:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ0I-0000000CfTs-0ImD;
	Thu, 15 Jan 2026 16:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zjAI4sw5fZWleNcy5E+bpQXvW8kKtlqPBKTICHmyuec=; b=SgdIcZUflo3NqJzUtZoYf3GC3K
	JoftSOW3X/lY1Pi0hsKuGnEAdP4Xkf5RvordXf9jqy/NXsqZI+Z3rm0864ea3sOV7wd/8n9x7TvtR
	ARiOH/6XDRwyxFUUZHmrpZt0rTw3cKAEfr/8D2rBa/g7KXdHd4XnhJA71SnSWDqVtE46lIRk+gy1J
	Q0WOnuPWm0qZF9cm/OdeCNOkNotf4XE+ZUvm31xeAo65yyG78TGmmnh9t5FRX88lrDB46GzObUFAh
	+/gpCNBZZk3YysdtvJL0VWcu3kTeeVsfbo57gmVuXzvKtkhX3JI40zs0p7BTnQcxIo1BAyB3m1W7H
	bUiVO0eg==;
Received: from i53875b85.versanet.de ([83.135.91.133] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vgPzV-002UXc-0C; Thu, 15 Jan 2026 17:14:33 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] pinctrl: rockchip: Simplify locking with scoped_guard()
Date: Thu, 15 Jan 2026 17:14:32 +0100
Message-ID: <2415619.22IY78Rhhi@diego>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_081522_750288_16345547 
X-CRM114-Status: UNSURE (   7.60  )
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

Am Mittwoch, 14. Januar 2026, 16:30:11 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Krzysztof Kozlowski:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



