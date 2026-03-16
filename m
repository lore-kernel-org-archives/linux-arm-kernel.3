Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81976F53D9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLEA1gHZoqBV6E/UQjGhN7U6gh/OXjMMQtTkhIpdLm8=; b=jIAM0ATDTGGIMMbesFJzUtUm6P
	5Oa6MZhPAUc1raoXnW+RcotzUGxE5c4Aj3yrfodia5rrXx6/5ZML7e+m/Hptr7UpUgHgQNbvfzF35
	Y5zgoVBkV1MG63ATEGKZjMdFiNt0bGMIT2nNhkucj4QzI0NfO1zX0MOlWp5TtQzh3uvsYZWEUFFYK
	udsuCh2QMk5RZpI4PmNr1qdkV7hl1xSd8b4Fe2cok/uDB6mWvpt4u3NhkOtHhTYwgL/3iJ6S8Ewuq
	aos5Zyh++MZ0pd0puhIvmGFuV4laWkVhzdJTkLi8nw7dOC2IBoqauaGXjrj9zJpL+wM4Qsjf5qcPa
	lJIkkSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EnB-00000004pUp-2VCS;
	Mon, 16 Mar 2026 20:44:01 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2En7-00000004pTn-3Xbw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:43:59 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 63108C0003E6;
	Mon, 16 Mar 2026 13:43:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 63108C0003E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773693835;
	bh=mATLxZksOR77mQ38ZauPXe13fJxAV8BRFXn2qniPmFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLHj0g8tbNTvXrt75H4ckxwOzJX0kAEj8p0uR/JLxPa6UrLFSyxYMpVCZRei7dpkk
	 UUZp9P/D+xjkSZ8jQoV2dshFVsRWlDkFTuAduSutJbMALGzKt69+J9jmGj8BrsBcqu
	 w2fny+Wp64fM2Ab9xyD/oIIR2lp9s7DhsWCCjB1E=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 055D5A83;
	Mon, 16 Mar 2026 13:43:55 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 1/4] ARM: dts: BCM5301X: EA9200: set WAN MAC from nvram
Date: Mon, 16 Mar 2026 13:43:54 -0700
Message-ID: <20260316204354.2145046-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225230827.21715-2-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com> <20260225230827.21715-2-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_134358_407709_A0EA7FC9 
X-CRM114-Status: UNSURE (   8.18  )
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

On Wed, 25 Feb 2026 15:08:24 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The MAC address from the stock firmare is offset by 1. Define it
> properly to avoid having to override it in userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

