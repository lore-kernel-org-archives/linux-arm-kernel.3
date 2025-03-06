Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D817AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvbDTBv09uYhXrqnT6tqKepPXrEK7O3PyRZop8Ow+kM=; b=i43WG//i0FZqoL0D1lWIZ9d+Mi
	aHHyDvw95BEalYURp46HY0kOuqhZN1fWDKR0W54qucDClvbioBhIM+Z6G/eAo89Dr3g2x1jyyE8M1
	q4gqSIJ8RzJJYGEjwK6yW6BxMT5Zjlqn+qZALET1MjEoriU6sR/dGiYuPq2INpbMZQ8nkCAZqTHYd
	/Tcd5tDNgkqiEtDZ29ec2tscpTSQ8UrPebneMNvNa5LSrtFsK72wCi6xyJptOZCVM2QCetvjjVzI8
	zfCEnCD28XR1jf9lIDHU8U8dBYAdSoiz2+bFzl7RsF0ekyEzg+XqsdNkB/U2xjwPELf3Eh1YkOdTY
	ZskSYK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFtw-0000000BrOn-3XuU;
	Thu, 06 Mar 2025 18:24:56 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFqv-0000000BqzR-0olD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:21:50 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AF501C003E08;
	Thu,  6 Mar 2025 10:21:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AF501C003E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1741285307;
	bh=zT//KZZFEKytLDpgaT8Obwl7x/iYNsngN/KykrGbh3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnDMrJ75OX3hcsHuFZ+n0/AfWoS5zAilNrJihvoWQKa8tA/VS2RNaCrIReq3AkN8Z
	 LZiPMi6YzuF4/OG+P2+zjT+pQqL/WuydAgCwMfQuigDfZOjl4ynJNWn/72Yg71mPf8
	 djq0lnPC6KUDfj+aFFmZ5AgNQTye338MYwspbnkM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 394BB1800051E;
	Thu,  6 Mar 2025 10:21:47 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Artur Weber <aweber.kernel@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 6/6] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
Date: Thu,  6 Mar 2025 10:21:46 -0800
Message-ID: <20250306182146.1762360-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303-bcm21664-pinctrl-v3-6-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com> <20250303-bcm21664-pinctrl-v3-6-5f8b80e4ab51@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_102149_305427_40439EA3 
X-CRM114-Status: GOOD (  11.34  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 03 Mar 2025 21:54:51 +0100, Artur Weber <aweber.kernel@gmail.com> wrote:
> Add common DTSI with common pin control configs for BCM21664/BCM23550
> and include it in bcm2166x-common.dtsi. The configs are kept in a
> separate DTSI to keep things cleaner (pin config definitions take up
> quite a lot of space).
> 
> Currently contains pins for BSC buses and SD/MMC; more pins can be
> added in the future.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

