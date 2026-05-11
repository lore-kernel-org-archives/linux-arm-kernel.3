Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDAFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnQPwf66kcOmOhZNOhx7XrQZ/N7HHyZlvaxlIt2Qpl0=; b=X7HXACrkx9oiSH3i8nxI5lo9Gj
	MDQAOC7QPGO7dGOjZ0EueW688RlMQ3ePZL9sBZypr3GjDQWXfzYOTK8iIq18T6ZQAFtHW0gwdxKGG
	ii7IAVZZMlDkJVJwlHq12WBdtx4yIDi8nboZgW+2lwpT10dFftDeEO+3fGySZUlP3jzp62hV29kIw
	NaZioKyHgHGSagsnq3epOH+oztRTfBCm9KD6B6UZCr+j90IYn+yflNCGdZZM0U6wXKWiiCEkps9ML
	WOnknPgkGi9ta5z8BZ/D8/kTAkP0MeOseZ1xyMLTCzrsEMdtFLe1UeaIinCi4HIGsv8hQs/Z2bAID
	65nOC6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4A-0000000CwxY-0hhS;
	Mon, 11 May 2026 09:36:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN42-0000000Cwvl-3RZe;
	Mon, 11 May 2026 09:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492196;
	bh=Nr6wvmQNMPiK7f1NhJgebpOuZMeoDGQZHRr1LBzM/B8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jUZGEs+GvzsZz3+HsXxPjVObkW/RwXvByy0gotGnwNX2p0o/p+H8lMt+yt2XlhND8
	 wzHsFq0+aGcC2zBTnjeOrxO0/JVrGUAxl8omDgKL7stc9INZ2bZ7zLcAUyo8I7g+rY
	 FuuZWS//2ZCOtwdpK+h5QpcrBHsDa43T7b1dTK1KNKuCawe4Lqdb5ZC8G9Qr6kf0Sb
	 HFj/QnR+KtSzxaDQ23mDbGZjYvPFQCVdKqNzDfTkaTav42xbN7Y4/3pfifTF9cvpt3
	 gctruCbaPNM4V4qAbPY4BvFuxLHjJcVhP76n+VkRT0ilnTIssF0/Qr/JXJOBRx7ODl
	 ZtfXjP8Lk875w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C621817E040C;
	Mon, 11 May 2026 11:36:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
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
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
Subject: Re: (subset) [PATCH 0/9] MT6365 PMIC support cleanup
Message-Id: <177849219574.115964.17730768791948162996.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023639_031233_E9F8689A 
X-CRM114-Status: UNSURE (   7.22  )
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

On Wed, 29 Apr 2026 11:44:13 +0200, Louis-Alexis Eyraud wrote:
> Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
> SoC, integrate the MT6365 PMIC, that is a MT6359P variant:
>  - Mediatek Genio 1200-EVK
>  - Mediatek Genio 700-EVK
>  - Mediatek Genio 510-EVK
>  - Radxa NIO-12L
> It is compatible with the MT6359 PMIC.
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[6/9] arm64: dts: mediatek: add MT6365 PMIC include
      commit: dd85b476c5bb164e5978e42867e1f4deb23b23fd
[7/9] arm64: dts: mediatek: mt8390-genio-common: use MT6365 PMIC definitions
      commit: 38c2adaccd3618882e3c5b8ec76ef77a1ecb8de9
[8/9] arm64: dts: mediatek: mt8395-genio-common: use MT6365 PMIC definitions
      commit: c264c7958a36ceedebedf8a437fa719906e4e1af
[9/9] arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365 PMIC definitions
      commit: 4d2b8fcd8bbd7f00335a52b86189d85686fdc707

Cheers,
Angelo



