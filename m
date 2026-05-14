Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58251CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLBceJIUIkXBbEAd36GneXji+KFTwt+3OEMl9TEgGAg=; b=QMlLBjsIsT+/PxvEsCGjW4fIF/
	r9IvAnihe88QQAI4xgkwl8CHRyiBzTHm+s1ur1JNQ4mjR/uH3Pv81sVq4jt8WDx79hpRoqHydfm6w
	5ztsSGY0kY7m1lWWcFbAB6o999c0Mn3n86jaCNzA3mmXWJTspSNBnVrFt4i3MQUhK83XgKjyTEbJf
	etPWYUQwfKEb6rZtJcS5SLUfhcZEyp0UHRP+py/sDRW3lEobuWpLDQEThSsHwViIC8q/f59pPaEfv
	SAh5UqAigy9+pvSmqF5fMrxgdoiRckqM53nsXc4aX9Pm/oFLQwSsl7vfTwv9QTdV2FL9EpoxxO/3N
	7mx4lCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXHo-00000005m6R-1lXL;
	Thu, 14 May 2026 14:43:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXHn-00000005m6C-1EZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CB7860132;
	Thu, 14 May 2026 14:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264C6C2BCC9;
	Thu, 14 May 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769818;
	bh=vYgSx3dmEm0ZEEAz8YRdNmK7l9u7//QUaR05wrA5BAY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ai1tpI3aDfb2QvDeKsYxG3EdOoJNoxxp3mZVlKehdBzqRg794VxG0iOi7DInbQjWW
	 5f7sbtOVr5xR7igPW5+7ocZgBoGkbeWY41tUlYkYy036HiHvi5Xs8swWgwYVVODiLT
	 iywtq+BIUTGl4070jjcMHZP0k1maSkiHqT3UhS7D4rVmooCHZzXV30ZHuhpqDK6mut
	 8k2XvUQaYrhCMMxAVuWRJrQ8ovotO45zAb6nC8OX0wv6KQuCrfEuOtsUcvN1OVvg/W
	 eedSkrToE1ol0TTOq8FVlmPCvszgYlT8iLPls+ufdK/azJKbFmTUtUd6nACCOlmxz0
	 LplWwo3DueAWg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: Move MODULE_DEVICE_TABLE next to the
 table itself
Message-Id: <177876981488.2795269.15417552684114266100.b4-ty@b4>
Date: Thu, 14 May 2026 15:43:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 05 May 2026 12:28:45 +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> [...]

Applied, thanks!

[1/1] leds: Move MODULE_DEVICE_TABLE next to the table itself
      commit: 7c3d6730e8f03220f48e70ba9d4c05296aa83fae

--
Lee Jones [李琼斯]


