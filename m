Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B59EB3631
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wpJnUhLRwyBq+mVVA23zcsGSxWP3hdj1JlJ6fsTXco=; b=Opu2TLIMUHPYiARXeck0nWdw6O
	ocVvGp+UL+k6PVksPzEHEbcFOPi00e4OPdRC96JphS9uQhyrja11Bu3eZkGySL4g6/qA333HgmDQw
	lfvMItqGpyYcjQEWndJMQTXC400C8FPwzhKdkC/xGTu44nJsMDEtC92a4H4Goi82Q5zCdlzD4/G1p
	M+4H+hY10/qVE50Jd9/3Chgei5fzGdpw6w1u6ooP4ZhWe6wGPNsPi/v6QXXoV5yZpwte1U8owvQlV
	eJQxKTeW2i8+N4rdiC7b0+ssK41eAzecEzcN/3x39Y+RRehq7qSioQmcpggWrBprEsq5f8UlEXOKT
	bLxRp1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9E2-0000000Dl0C-1K0i;
	Mon, 02 Mar 2026 19:46:42 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9Dz-0000000Dkzd-05Fn;
	Mon, 02 Mar 2026 19:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1772480778; x=1773085578; i=dubito@online.de;
	bh=5wpJnUhLRwyBq+mVVA23zcsGSxWP3hdj1JlJ6fsTXco=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:Reply-To:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=Z8utqfQy8up1CjNjHJ++HIovPDAccNha3TEAGqLwi4/4iGFTIvKSbpe8xOU/hSEW
	 oVzJdlguKH+75AOfc92ZQyP0rjPL9kbAaEhS4SC95kmqUD5vNfNZfwqqOp1TW7tDN
	 uEbkMFWOm6C7ECJcNc0PyhuNKNs2ylif7PwREFGvRuld2Dhc0aS7/YtcwZeZPbKXK
	 Y/XvyW8dgDGJaebx8QCHu7mHMSm8II7GjTniJazGDoF1E9waZINYue53QafkYIyYZ
	 o3IGMjoUy7LKe8+5BhO38VRyry2dT9Sv++Er+oliD1MrZOW9ei6+ayYcJDuvHn9y3
	 QJ1x/Mn+oX0GgpcKRg==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MCbMx-1voae939TH-008xjv; Mon, 02
 Mar 2026 20:46:18 +0100
Message-ID: <88436a35a3197393b5eb4fc49962a3b5906bf147.camel@online.de>
Subject: Re: [PATCH 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
From: 1und1 <dubito@online.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Vinod Koul	
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko
 Stuebner	 <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, Dmitry
 Baryshkov	 <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Mar 2026 20:46:17 +0100
In-Reply-To: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
References: <20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-Provags-ID: V03:K1:cHIHrp76Krx+GEiJ5Tr6zcnpn4uuuBPmlSmCgX9BsnMwNrozq1o
 P7sQaNOEGbHnLO1lOUcJLcVt2eWyVNS2JZDjLtrgCVjobiXhS0XJhyAPkLaTd4v9Ohpp3aY
 VfadFkfCnZFYH4mmvNjuvYL4c0h+K18RO5sXwGph08EHycTs+hXxJh4+DOgOmvUX+OW3dfR
 WBDTIAnti+POCpjc0e97Q==
UI-OutboundReport: notjunk:1;M01:P0:s4RTz3M8PsA=;YoUrHsNC9MqC5e3Q4AE0fVVvhCc
 L3cVFd708vlOoBQQjNwTfHSwy4r/qwqtzutD8bdFuaS6GMVTLR6UPrXGUuEnmEpidnOoCIdn/
 iJUiXJ5cv4hzZ3oCvr/MTOZ+pcqtd5HgKDIt/u9IFRvN/7YxlWpvCQFinEiy163txV4YlOppc
 HRxS0FIXr/3UPAGJB9KMWeoY5jfiIluV4CgEqV2Axlo/eh5amwTPXo+34SdYmuJ/22XOcxEiU
 feynNFwlfAobmwtRRNWxNcwwdcFkwxGtggOU+s9jNGSVN5y5VBhkqPYJ6IKXNgUID2xKsTzIx
 r4XuuIXbceKD2RBclQvg9B2nZGG19DeyZzYJpptSY2oZkkbLLhI/IaF9hbMcM6Fv4RY9wkWlQ
 PU0tkfFcSrqHpqzAj5cXB8qDmNAIhZR+2h3/P6R6vsa50QTWh42/ImLtbhl/fDPLvluHfhdib
 KCKYz6wz4y8A4ek5GdWAlAZmc2v2LAwcPNlE6U5rkTFl8Lu/vgnb/B7lP5YGsjGKJiMQXeYNl
 HiZu+GVTaiqq+lMlUcRUAal2R+0yZ1twqFc3Eg6ddU+f5VFHFdwmx5Bf9lzBarpxBbTsI93sY
 v80k7gchXlWF3+GqAu/zJv6qRwRY/dTlRPSFJrMtCdj2XV7wNAyMHP4eqo0kPCOq5GsR2RUgl
 CXm/MgHr9HeDc8cU/OERv7Ftd3HWgEvK0NhG8jVVehTEYWI/6wvM859JzKr2qQfcrFbbc1gTq
 YV2/AzBGzQhlDu8No41umSdZwAC/8bghFtxuPEG+Uo/7WhZrMSnyEMncgL/m7NmCAkxAY4b5V
 7Ct9KvW5YJzLq9akjejY1vrhWs7CoWW/d0L+id54gxXRHUNc2bJspAjIfA2iSZA8RWm1+DOA7
 HcwlhlHtRAyDK1H1vOqJ9pImjA3n2tJs/PBnKrIHiUf8ZZP4h8JxNWXIdW5a8fpaJwtAzmYNX
 87YpQQ2wt5pwSzNJ26fZEZvJNqol4Rl6fYQbWZpxZIr2BmfiXJFmIEjKneOLL++UtHPFulvHV
 Lxa4gFTjjy3/AdTzTzQ9FfNOg++uxDAZMC9XSRl6umEjJWYZacsUKBsNOaaRLfQqVftKc4aeX
 18S718vr5nXYJtbeK/Vhjx3LHp3ndHndpGWr8vZTX67parLDPTJ55bLGoKEMYFoplL/FUZO1k
 e2iZKwT83MvAn+yw45Tt4Tt7ic38aml8TUuCjGYGy7tlDNbpioMV4zEHsMoedeLftyew9zUUg
 ApH2mbxnK4a51Fsl+Ay+FL00GPeQV1rhkbtQfPHPRF3sQ7Kvj7t7XtaO7DTD9K5+YyYntReqU
 W1wm+Y6gVy/8q/s2BLdAnJ0A4w4W7EHXqTgdF25q76eLqm/S7bM2TULEDtDDpcx//OXCe+adk
 Ful57G2Nw/X37RznMDCYOLCG90YO4tv5YqCm0f+BkcZaefyeZn3RvkN6cMtRamD/cQU+Zfx3B
 a4njP3qB6GluYFSNCYVp6z2FmuZq9GlCDQ6ovXOuCqrPHdkR/SXn1c630GF6SLiOpJqn0F408
 pzGmmQZ7TBdlNvWZtPFYs9gN3Yi0hFm8PacpUpLUHqZJgXrJOsGFQTcofsULx4RRGXp6sQTpO
 d2aUS+w+t+unVlWg8Sdch5Hy20NQzSZy8UaE2CA3XgF8hg+FCb3XPmrPfDvYRBNEJxu1kUggY
 OGOFPqrmN2WrfiC9Rjd95egP9AmOu2ZxCuU89V76Ua4PVc+H9l28/ouOzyLmR9yU5vAIDLgu/
 TxkY7k1VKmkyF5/I0tths5+D3vBcFPd5SJ/9AGvaQBx74Irj/HjjcPPZzLU/LTn6I/tozBibF
 GUp4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_114639_418147_622BCF01 
X-CRM114-Status: GOOD (  16.28  )
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
Reply-To: dubito@online.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Cristian,

Am Freitag, dem 27.02.2026 um 22:48 +0200 schrieb Cristian Ciocaltea:
> This series provides a set of bug fixes and cleanups for the Rockchip
> Samsung HDPTX PHY driver.
>=20
> The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
> calculation and synchronization issues.=C2=A0 Specifically, it fixes edge
> cases where the PHY PLL is pre-programmed by an external component (like
> a bootloader) or when changing the color depth (bpc) while keeping the
> modeline constant.=C2=A0

as I brought up one of the mentioned edge cases=C2=A0with my Radxa Rock 5b =
booting
linux from EDK2 [1], I wanted to report that with this series applied,
everything works as expected and my issues are fixed.

Thus, feel free to add my

Tested-by: Thomas Niederpr=C3=BCm <dubito@online.de>

>  Because the Common Clock Framework .set_rate()
> callback might not be invoked if the pixel clock remains unchanged, this
> previously led to out-of-sync states between CCF and the actual HDMI PHY
> configuration.
>=20
> The second part focuses on code cleanups and modernizing the register
> access.=C2=A0 Now that dw_hdmi_qp driver has fully switched to using
> phy_configure(), we can drop the deprecated TMDS rate setup workarounds
> and the restrict_rate_change flag logic.=C2=A0 Finally, it refactors the
> driver to consistently use standard bitfield macros.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: rockchip: samsung-hdptx: Fix rate rec=
alculation for high bpc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: rockchip: samsung-hdptx: Handle uncom=
mitted PHY config changes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: rockchip: samsung-hdptx: Drop TMDS ra=
te setup workaround
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: rockchip: samsung-hdptx: Drop restric=
t_rate_change handling
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: rockchip: samsung-hdptx: Simplify GRF=
 access with FIELD_PREP_WM16()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: rockchip: samsung-hdptx: Consistently=
 use bitfield macros
>=20
> =C2=A0drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 215 +++++++++--=
----------
> -
> =C2=A01 file changed, 92 insertions(+), 123 deletions(-)
> ---
> base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
> change-id: 20260227-hdptx-clk-fixes-47426632f862
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Best regards,

Thomas

[1]:
https://lore.kernel.org/lkml/b32164001947ba922aefb6ca86a8dc59e9323d2b.camel=
@online.de/

