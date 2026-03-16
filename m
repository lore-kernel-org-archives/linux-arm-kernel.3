Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BB7F53D98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDpp0A+IE3128b5qg9mgHDDvag7HGFGONnntwcqkU6U=; b=gHw+sb146Kix8IXIGcRWstjt+q
	iOdrxV6utaLsxILqTSikJGon59DUXwVJsIQDcCPmtnTVq4AXN8jt0ST/yL/Lr1L5iWfPmLijj57US
	/R4SLJUBwIoAWydPtsrzGa5c1IVPRGhztPbIAqVhBNO0dkTUmZR6tXV2KuzRCiHtdllK+Z0nbC7V3
	WFnL0oo+1pR79xWvt5rhPzzZNmAC0Oxich1nHoxkwoyNLf/1frs+/E34HuILIhIgsBqxhLQb1hQ56
	TKxMxurFtvyAPSG53S/uOM1sQrwsSCVIzDzoboJuBxbuI0fEnIIyE9mn9QaNIlD2RfFUjfmAFxzIm
	nRaH2qJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Emv-00000004pRK-3DUv;
	Mon, 16 Mar 2026 20:43:45 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Emr-00000004pR0-0wrR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:43:44 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2BC14C0005CB;
	Mon, 16 Mar 2026 13:43:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2BC14C0005CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773693818;
	bh=W3Vv8A2Za9HrqIOTwJsGyIfvZpnDJ2c/uZPsxDKqTzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=doTy37qeqqaUOPhJ0bt3C5D581JlYn0UF51AJl6Q9uSIxiTvxoDIBqnxTLeUG5msH
	 KqBXoPIeAHPRlATgdsE5xunJMlSy2thha6qBNxM1K5QanY20foncjwlOQLZ2Ul04YF
	 kZSqIBoclU/a7A23quZp+ktCUOSnEDm5LQkujMOU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id BC575A83;
	Mon, 16 Mar 2026 13:43:37 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: add root pcie bridges
Date: Mon, 16 Mar 2026 13:43:37 -0700
Message-ID: <20260316204337.2144930-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302000736.592422-1-rosenp@gmail.com>
References: <20260302000736.592422-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_134341_360403_F61E436E 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sun,  1 Mar 2026 16:07:36 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> They are always required and instead of duplicating a definition in each
> dts file, place it in dtsi with labels and work based on that.
> 
> Also changed each bridge@ to pcie@ to get extra dtc static analysis.
> 
> Fixed bridge numbers as a result.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

