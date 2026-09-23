Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F25C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=; b=fgkmiWQp7RB7GB0Jz0sM49nxjQ
	yHGfBEBpaggRKn/OPJbau/JotqRQKGhfxuv/0nPaDZY9sGNVj+C7KfTXElG2G/PYMvEZZe30p7Mgf
	Wq4lFsuxmVoXYr8UReQb2KPpJYs9OpwnKN+Mr1onojhIxfF7H9Pi4V3j24CxAJVLnhblOvRgRnf1Y
	bLuEvycsP2hUlLKkg9tNjUEqxYoqHIhdlJxy+UUc5QTOtJ7YNaaHbnWoXngRyrbY77YkZYxbql/pN
	EYa1el8geBIz8EnkeO25ROsfMyrbatLZbjGOYni5TczjAwlw/Cbaf0di2dGWsJHnzqL+vP2hkiwls
	GA1CrY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ku4-000000080tr-1tXN;
	Wed, 23 Sep 2026 11:12:44 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ku2-000000080sh-0COu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:12:43 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d91a931f66so4062345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161961; x=1790766761; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=Nf81lhgbeTqWb6J0EA+q6+2zx7nQeoP1lZHcBXndaPEKq2Z8oxFXVDW0jpfrLZNaDk
         igz6qnKd01J/OlqYqi4PxwwEswPdjTd9PrlmupZAaPhr1RJy/mgHMPUN5yAoCapxNosN
         qw/an8VC5g/Z8Itcp3B+QELvAhkLXLNvImR9SFHkfalmM+QrIXsori/IBzMXSXKxtIe5
         cPcCkoty/epG9dfUE2i94RlfIoR8UB15XnYRNA4nE6mgBxajGsJLCscajDDiRM7FV0hX
         XJO/C0N5IFtQVqMufTHUkIiDtCyBICpRZ92eyuIq9MGYlotsj3iws+f4b8mU4DcWJdVq
         JV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161961; x=1790766761;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=R709Ux7a7sI7qF8cPM+9G9ET9hm4Rn2JGrmcvAEOU6h2Zos+aYdFgWo2nD+M0fdMzs
         rIjrsofXFd1za+h72bzPtCYTgD5JJcWooCp7P+vor7vKqOqFhselExAl7aP/e82Q+Ip0
         7ZmS78Aq/QfOpWRQvDHZ/cGSGB12RxpQgsRdUTpWPKqwErRLT6jwt+P2N7gp9I5iRddh
         0OoWEbjqwuyzG3W5GuHaiE/koITXvRr4vOQmIhu/1GUbMjmBXiGa84Avn0ewEJ5rRYqZ
         rK0mBMxXZaE43hm7gGh9cIFA1/Z0RKYalZrdYfbuaefEX44ueIHyBSPGCnK+5V4+tU33
         iTGA==
X-Forwarded-Encrypted: i=1; AKwUvBxgcMy0Avom0He+sDJHIf+0T/5k6qMaWAy1/mqVqaOe6ovosktTMF50Nw/lSK9gZASq/pBhgX68hIPjLAiGrNi5@lists.infradead.org
X-Gm-Message-State: AFuF++nunX/Dm3GKuRfBz3Fwk2993YO+ju+Srxv6I2PDJCHMKxuDLLtc
	6z+EkBhtxDz3KfiOBn6J85ZHy8Hp32Lp+TL/4Hy6rwYIHFTQKKHIbB3P
X-Gm-Gg: AYBFou2pl4EBmM3P377D7qA++0l22aaFdo8IjCeJb1ddCOuYtFEWKaAadBrq65qZKq5
	HI3lfo8rKAluR7Md31+0YJuSzlSz/KYZCdtWCRdpJiFbipgP1AmztkNMr9m+7yWWvuxitxDWXyo
	OW5jRYDS7gzHp21zj1XXApi97JfZmSG0BLEipuHOX2fjdM2NYzSiUlkYZgY1X9GsajxcOLYtrnu
	strryGavuqOGv/q7F/fJ7IKSSqWdkhD9G3MH58BsaweMpsxyPWTQQTxOT9CKUndBcuA2Q7tkALS
	3PwWydMYJGO38oil5XnoDwSbFX7YQms8Zg8DGOEDw/Vpns+aB6Zc+o+b9zwmOFwcjuwcx1L/hl6
	qrSO5NqLtFP8elu8BX8L+kpQ1l7/Lo6ZtilIfayU0ziJioMyIEh5W/6ecix1GeNs9bizHauENFB
	V6A1YbCJAeDmrvfTQ9izvrPmTwaSsJRjxA2C4X6CIFYH/FuZwwmhyLH3rdwKZMwxVsjhJBjDKLX
	FXvqeDmPqzOtx4xiA4LSPFCUCechm3nN6Dp6BaN5dngWn/nDXjKxrJi8X3mZVJ4jiqOq3deMy78
	CN+2WJDkOur5mS/Dh7GmDxtNOnsBZYtwb89ZjUIh1K4W82bjlmg=
X-Received: by 2002:a17:902:d54a:b0:2dd:c053:d739 with SMTP id d9443c01a7336-2df69dacfb9mr19455635ad.32.1790161960734;
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f5886sm8814555ad.72.2026.09.23.04.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Date: Wed, 23 Sep 2026 21:12:29 +1000
Message-ID: <EVVfptRVTru_6AKB_uY-lw@gmail.com>
In-Reply-To: <arFa+frv9QcL4b36@opensource.cirrus.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <arFM5QGrJx1aYhGK@sirena.co.uk> <arFa+frv9QcL4b36@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041242_093953_AB38F2E1 
X-CRM114-Status: GOOD (  14.53  )
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

On Tuesday, 22 September 2026 2:27:37=E2=80=AFam Australian Eastern Standar=
d Time=20
Charles Keepax wrote:
> Are you using the wildcard mostly to skip the component prefix
> stuff? I wonder if adding an option to match without that might
> be more explicit.

We use it in two places. The first is as part of the speaker protection
system, to ensure that all the relevant kctrls have been locked by
the same owner (us). This one just matches without the component prefix.
We also use this facility to eliminate duplication across left and right
channels, matching partially on the component prefix but without "Left"
or "Right" in the string. The second use case is rather superfluous so
I am happy to get rid of that. I think at that point it would make more
sense to just construct the full kctrl name in the driver and pass that
in to the existing API in the one place this actually remains necessary.

>=20
> Thanks,
> Charles

James




