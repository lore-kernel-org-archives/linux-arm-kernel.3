Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8382C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0db2ZvvEaBiYWW5dZn01u/FW+dk6clupic3ccg4s29U=; b=YKgmRt6JqisHL44gFAkpG3khYE
	669IJYzLVUKuUHWoGEPFinfU0Hw4IvAN2Y7iD7WPOUMx9bUc2lZs4I/qdClQq99+5Qep7V4jHTFQ7
	6jSRhft4DY2tu+bY3dsoaQWQUsFmPgTq6mk+HxbSZazMy3+iBIgjdHotA/2nDRPiKj6T2ocMQerzc
	sw6S5cBp7slTeD3Gj9/emEUklZe4I8gaHb4FCVZDegtNgeo/JS3OpfI6Vh6wFJlZtNjj2YPjCmhoT
	UH9PctKgci/nrT6jg3mpEJz1l/Rx17k639lznA6BSNELsMQVKHgRpc32vVdngdI359oO6l1oPnhZh
	1HlmRwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L0B-0000000Eoe6-0euB;
	Fri, 11 Apr 2025 20:29:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Kxs-0000000EoHk-0aeT;
	Fri, 11 Apr 2025 20:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D42C14A3ED;
	Fri, 11 Apr 2025 20:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81263C4CEF1;
	Fri, 11 Apr 2025 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744403223;
	bh=0db2ZvvEaBiYWW5dZn01u/FW+dk6clupic3ccg4s29U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=esDdo68Z+d4Hv2xTg9bir7moDVY9WA5ZHNQOQQSuaSqpK4ZVZ5TYCII/bn4RwxMZr
	 v91Fy4ZOoM0+/Jt/kJz+hHTDBH5Y7cgorkg7hKJYfMEaAtyYm0yo7TVsyLDYP8X8Yr
	 lbBolizfkYoMybinoxMnQeO4z15ssNsGWjbJWaCNcXXhLeL8+wXdXh4bxQDVNpBy+W
	 16U0UR3T/W7DwHyxqusjQCSezbEnBHt3oAODHEOXBlDZ57rr7uw2sGTGNNSPwztmgs
	 OP7R18BP7Fw67uyJpytSsPPFA8F8LJPW2roAjchwrwdUeX0R1tYzq+HQy0G41GmtXm
	 oaWZ2H87kVc8g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3628594a12.0;
        Fri, 11 Apr 2025 13:27:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRb8TCibSuzpHO4IH9cA3mNUYP6tJaKqQCUdgYKrbGGgdbdgBtlyiIS7lJlDEoHZiTDt2F15gZ7FMNwNXI@lists.infradead.org, AJvYcCWhqp13MTLlRBz5yo1fDva0L5fs8Cj03qTr7bbqIL//2fAt8QUltSLalHfS2LOkoZ9bXrMA/cIorO3MgZJecXK6aw==@lists.infradead.org, AJvYcCXZCMm5ZWYbppTwfrhGWOd2CvsNFRuubUpUl5KzJQtZ2mFNfqLE8fy5RRZc03SOOeC7gTTHVYZrGxYiFJuj5Uk=@lists.infradead.org, AJvYcCXdJjIgXlPZan0fXSk5pRkA8EdTrK9usQJhRVC5y4Mdm/0F+AcyAZVEM3+n8uWmPyOBk6IUZXpQD7Y8m6bc6eo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIrhw8HBb4mZsGXW2DiSnXZKPjUdDIQKq80TX+JJhTQgRNaPmR
	6ytkKGHvSpRqwnKiQWLL1dvrhaUjwIWd43e2J/Ai0mrq2dAzPScZKlgxmURoVotpN47NiuDCfiB
	20LJnvP6CMHaPTwyhvDPFLUukNA==
X-Google-Smtp-Source: AGHT+IHTq9IynIF/z4Ryd9XhwviquzTS623VvUxbOB2plMDWlWmVxnnGmioMBYPRMrNx5/qrse/N9OEq7aX0hV7vQRQ=
X-Received: by 2002:a05:6402:1d54:b0:5e0:49e4:2180 with SMTP id
 4fb4d7f45d1cf-5f37001322cmr3235456a12.25.1744403222033; Fri, 11 Apr 2025
 13:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-3-63d7dc9ddd0a@kernel.org> <20250411-ebay-exerciser-392c42daf5ba@spud>
In-Reply-To: <20250411-ebay-exerciser-392c42daf5ba@spud>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Apr 2025 15:26:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJza-bufzjZ415THyDDQaOfk8F+JRFvFxzNwObG=NKVJQ@mail.gmail.com>
X-Gm-Features: ATxdqUHjYgk-N2yFwfhKqPvFMPb1Jj4TAQ2QQ1AYg4EXz2sFdyWD0eKD2bEivlI
Message-ID: <CAL_JsqJza-bufzjZ415THyDDQaOfk8F+JRFvFxzNwObG=NKVJQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] arm64: dts: microchip: sparx5: Fix CPU node
 "enable-method" property dependencies
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_132704_214517_22E092B3 
X-CRM114-Status: GOOD (  14.04  )
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

On Fri, Apr 11, 2025 at 11:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Apr 10, 2025 at 10:47:24AM -0500, Rob Herring (Arm) wrote:
> > The "spin-table" enable-method requires "cpu-release-addr" property,
> > so add a dummy entry. It is assumed the bootloader will fill in the
> > correct values.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> > Tested-by: Daniel Machon <daniel.machon@microchip.com>
>
> This is already applied, guess I forgot to merge it into the branch that
> appears in linux next. I'll do that now..

Sometimes I check next, but in this case I just looked at replies for
which there were none. I dislike submitting dts changes because it's a
range of AWOL maintainers, only applying around some rcN (so up to 2
months later), silently applying, and applied but never in linux-next
(until in soc tree).

Rob

