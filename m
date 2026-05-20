Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA5CCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvcSANqXYxSuWMv70aiwowoFinc31+uKPSBaTXt6+oY=; b=Y8qETida4RXsF+/7f8CD8KRDT7
	8whymoRrsdiIQcP1HHh8aOYyzM2ZX/ApCcs1jKzQz1fEDhWCDleTt+mL0tded32r1sYkw1wyCa2vS
	vd/uraik3ejEwA/CdAsLOirRvSir1s7opHQdGgngqAch+MVICefpT2Aqu8WsJfVLJkvneOXA3qAk2
	D0jLdKw1O5i3IwyaLsGmummB2+RyrH7bAjEd0prUptD8GP+lxXlO3VDaMQ+3anGhhxH9dUf9b2fhJ
	1A0X7D0/V41nlcl0bHHp0s5SFiCvnOs7s4wc6iYuWMklu7Y4ZZ58BVniwCe5s4Pfr5HmdjwUJslET
	ET7c1Gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi78-00000004rHp-1Jg9;
	Wed, 20 May 2026 14:41:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi75-00000004rGr-3pQC;
	Wed, 20 May 2026 14:41:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02EF743BFB;
	Wed, 20 May 2026 14:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C88C1F000E9;
	Wed, 20 May 2026 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288094;
	bh=WvcSANqXYxSuWMv70aiwowoFinc31+uKPSBaTXt6+oY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BuERah6+47YW5iWHKhsEZ0zroxGvV206KQVRRtyhyJ2M/YpxiMGutiYbh5ugB9fwY
	 zCKwU+mGl9fPFVQlk7eXA2D2OmlkQU5VSiU0JBovDYH4rJL55BnH6sh1gNbDHswI+B
	 TPHu0VrR1cRuvoePktMUvVYKgHYBK4QLIrTstkZZP1bMenKulFt4Cs0g3lCF5xelzh
	 QKCXVuqZ2mwSb4Vix2KcGtnYFTDoLY+Owf7rGv/H2UCs/E1lm2eadm4YriBAi+7aiz
	 n7HsyG3uA3SnODbgQVV1n0lT2KCJyZuQftDhxUrNaMv5UBIyD8K4Dh3eb8se/BlTV3
	 Lp1kM/UEe3Lrg==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
Subject: Re: (subset) [PATCH 2/9] dt-bindings: mfd: mediatek: mt6397: Add
 MT6365 PMIC support
Message-Id: <177928809004.2820600.8127364744264482549.b4-ty@b4>
Date: Wed, 20 May 2026 15:41:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_074135_968148_F735516C 
X-CRM114-Status: UNSURE (   6.80  )
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

On Wed, 29 Apr 2026 11:44:15 +0200, Louis-Alexis Eyraud wrote:
> MT6365 PMIC is compatible with MT6359, so add the compatible strings
> for the main and sub devices (regulator, rtc, audio codec).

Applied, thanks!

[2/9] dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC support
      commit: 5a7c6466133eee4370995ad5ccf4c377011a381e

--
Lee Jones [李琼斯]


