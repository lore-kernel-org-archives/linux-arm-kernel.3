Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F80D68BFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzn1H6CZuAzSjmowvs4VC5pqYhUeVM2RhXauJ9gpFXg=; b=r2cR0zXRi4KrzAEfqf9gCoLIk4
	uWZn9oUA0gJsdWQQeqxyYTxlDkEThbj15B9MLXgZfuqj3Urhi+iSvWTJyRLkrAi35sDLz+fodYpFC
	vOtf4IOPwoDXMJ40vBtXIvl4XOZBzhUczX/5u7RC2EFQfBU/JKjHYJYqiwlPJIvWNvh9+DbNFs4Ij
	tsGvu7/FcsNH2Jc63k6Cec9C2bedulvF6hxze4DdaYGaN8EFXb8S86C8XLdP/P/iAnqiP68nXdEZ+
	fxXzIIxtmdygtKmOwySB4SFiocAYwhuwZ0UzAn01S+o9RlK6fc7USkkPHqPszwEi2FXee0kD9v9aO
	8W3IqRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGwd-00000006TMO-1KbN;
	Sun, 24 Nov 2024 18:02:51 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGqd-00000006SHb-0DsZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:56:40 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 30E61C0005CA;
	Sun, 24 Nov 2024 09:56:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 30E61C0005CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470998;
	bh=omKfrIu9Szug/NDSWVuj7hq1/WQIb1fsz5nxzoOP0tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zr4OYZPWdIrszxHZdD9AqxfrZHoS9RzwmIKI/4D7j3Qp0/ixhkl/WVYrdYL6d4u2g
	 jwRoxERLcwMTJQF7vrKgvM6/HQG7t9MwjhqwJEy7IGr+neiFv99FbbsFdzCO4vZ2mO
	 94eKMyFG8gmOicgTdnRdFc8nlO+tjDv79+PzBjXM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id C09E418041CAC6;
	Sun, 24 Nov 2024 09:56:37 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sam Edwards <cfsworks@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: bcmbca: bcm4908: Reserve CFE stub area
Date: Sun, 24 Nov 2024 09:56:37 -0800
Message-ID: <20241124175637.718510-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005050155.61103-2-CFSworks@gmail.com>
References: <20241005050155.61103-1-CFSworks@gmail.com> <20241005050155.61103-2-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095639_163218_15682A4E 
X-CRM114-Status: GOOD (  16.80  )
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

On Fri,  4 Oct 2024 22:01:54 -0700, Sam Edwards <cfsworks@gmail.com> wrote:
> The CFE bootloader places a stub program in the first page of physical
> memory to hold the secondary CPUs until the boot CPU writes the release
> address, but does not splice a /reserved-memory node into the FDT to
> protect it. If Linux overwrites this program before execution reaches
> smp_prepare_cpus(), the secondary CPUs may become inaccessible.
> 
> This is only a problem with CFE, and then only until the secondary CPUs
> are brought online. Ideally, there would be some hypothetical mechanism
> we could use to indicate that this area of memory is sensitive only
> during boot. But as there is none, and since it is such a small amount
> of memory, it is easiest to reserve it unconditionally.
> 
> Therefore, add a /reserved-memory node to bcm4908.dtsi to protect the
> first 4KiB of physical memory.
> 
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

