Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F73D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr5xTF33BIsWsJTcbAA8Wx9Qz0NQbfwergVkAtqFqsQ=; b=WLOzS5hjXdMGIajfvFjhM7a25e
	4s8LktVwy0dqP77NcJVDV9enVmxEXOhm2udTtS+O9/kDbSfoGXCGa80+jp5XVJvL2ai1PBigY+gcF
	XzMu/IRjU+5T+K/k0VxdUFgFXH2xvxmy8OtK/UYwNsb2feYo+M8OjPn0XBzsZGq7LmiySO18ZgmtO
	/XaZb2yUv5IIgGEpLwDpR3BEvVx6EbioQU+Pk3U+63pjZF+WGjEOD4fns/pZ19CVXeitqtc8qZLOL
	SqFp3r6ix8WQJmOEAXcd5puUU/CixyxWiukGKi2x9VKGxt2s3H14XJlS9jHZgcqP2bkHqKLhvRZ0f
	a25LN3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdttk-00000000QkP-2jyO;
	Thu, 08 Jan 2026 17:34:13 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtth-00000000Qh6-2V30;
	Thu, 08 Jan 2026 17:34:11 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 557C9C000C60;
	Thu,  8 Jan 2026 09:34:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 557C9C000C60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893648;
	bh=pmpe+Vnk7lZP6tySCs75M24BiBDXu9KNx5mv+Ex7l+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wALwFzeRFSyoASGLSaBprdor4D8IejVdz/qycEplmXSaBy6fNW0+C2S9WBRsdy3Az
	 VHDhb3gVonGlhz2dSUe6uV3gYOAy+4deezskxiR17ZpxF28wdl0i1bs1sHx+a/N/zN
	 lZQfhz61IOnJR7w/RHxoUYVP/unO8g3tw1RDNWQE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id ECEDC1CAF2;
	Thu,  8 Jan 2026 09:34:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/13] arm64: dts: broadcom: stingray: Rework clock nodes
Date: Thu,  8 Jan 2026 09:34:07 -0800
Message-ID: <20260108173407.3784382-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-5-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-5-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093409_736820_CC503073 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 06 Jan 2026 20:09:44 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The stringray-clocks.dtsi is oddly included in the middle of a bus
> node and is only included in one place, so collapse it into
> stingray.dtsi. Move the fixed and fixed-factor clock nodes to the root
> as they are not part of the bus. Rename the node names to use preferred
> names.
> 
> Drop the unnecessary 1:1 fixed-factor clock providers.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

