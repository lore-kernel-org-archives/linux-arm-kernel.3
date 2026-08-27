Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F2BC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HI1REH23XVWiYYS5WUaJv/I0DtwaxBfUHe8yR5QlNpU=; b=F2zjzzMZgKfTfGjomr2Bi5tLX9
	AzcDogMh8eWYbz8F6W+XC82o0sn0queK2JwfCVJtz3b/b9wLqhMOLurM2TtdsHMuImnAjuUjUxYnX
	aGovwOGHikfmn5D0SA4QRn/mHtowB81Xp3crbGQaE+ondrjIkyKIEulCKuH1AQ8XMr/MUY7mBTB8o
	2VdX2FcrMFkvQcXmM0z4ZNTRaJPKh8yMW8G42rYnKgZqaHpCyzq+Py6g4TAwmifqz7HaQR9vLzyA4
	hawHCDFj66aZiTjFjKIGiQzKa2WCWIq7tpJKWZ/RxgCMBnSfE/qq8+FoT2d11Bc3Xwx3Ca2bCtv/L
	vN4Qy2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaEN-000000043s2-2oV3;
	Thu, 27 Aug 2026 13:33:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaEL-000000043rN-2GyN;
	Thu, 27 Aug 2026 13:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HI1REH23XVWiYYS5WUaJv/I0DtwaxBfUHe8yR5QlNpU=; b=rB74hpKjBvmLYM4d0hMaHp97lO
	ayX3p4+tvbS5YtfZLvz+5qZcztElPRkCKnLvdrC0DZE1nGbZh8FZVICpk0mmL8hkuJMznNE+KZ9PY
	c+lXICC2trG/aatvbdgIkZuoPnUVZSIcYKTs3fnqSKEQT7gGt7RteKMlBMOvhfePTAZBjPd51zZLK
	2hQTyv+87Y6tVUwWSNviQSNR7BIyGcfp6UARuE+RFT7zmphDyqzNgpsl9ZDTgGMAxw5d6pEPUnmEB
	4Bh8uBGL1DaZnPw2kHjMLWpyvt9T7XlAasDBNy169BpfKkDEmWSUYdvuwiQlssz9SLtQcWFQcrtjJ
	prAtSEzQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] phy: rockchip: Make sure clk_init_data is fully initialized
Date: Thu, 27 Aug 2026 15:33:16 +0200
Message-ID: <3434874.44csPzL39Z@phil>
In-Reply-To: <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
References: <cover.1787240165.git.geert+renesas@glider.be>
 <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_063321_581278_200A1CA8 
X-CRM114-Status: UNSURE (   8.11  )
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

Am Freitag, 21. August 2026, 12:08:40 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Geert Uytterhoeven:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



