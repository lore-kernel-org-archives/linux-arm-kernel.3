Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB50CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 03:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=; b=iBN70eGUej+P9AkTkcetPkByMF
	hwjtRk800C3VoiYwNiZsbEXJvzkrNSUlkOv0CSy4WqM4IvRDfwuXF/T2nuIA/Ot5VjC96L3rMz4Vo
	AMDdvaVj1RzOJeR1gVq7opGH6vFDhpQTcl2x4M7TOwd7XsFGfLzByaDxrbZt6MkzEFUebcgrQZqku
	SNHtLwZXAdjlNdvqPXlIqY7oKAIUq8CFoj3AZ6Ixepj6dVQpaWIohsvN9HI5LPIe4GuDSODTb0+ew
	B7udaVQV9O/OIkZ2TCTr3Ht8oZSz4gV8npval6XalK4lxqCj5ke3yRmseLv0kjxNxZjVDC4eERAbd
	0ckDejyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8bR-00000008A1F-2wYP;
	Fri, 24 Oct 2025 03:36:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC8bP-00000008A0u-3gVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 03:36:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso1600843a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761276991; x=1761881791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=;
        b=JHPpxFiFaiIeKt6Tpvn/XL7mH3oeZX5maD0Ane2OAQIsdvc2IXatb8gcRuFo/DUivr
         vGN2/2cWXH2GNlndXwyB3MFvOUjDbgRraSLKbY05qZfNY8UsmilFmjuN/zJwSuSWMnod
         /8TtdrwW1/MfbqvD1rLrOmrEZ/ScXExQt+05d2lzQLMPe2/0sGaRTnDZDI+ChE/xlNOh
         Nq7Smz8Lbr1EIof7KJ9Ch2waboN1dKWViDKS2gjAhvFwvDpkz4hPZCzHhKfg4JipyMHT
         T1LDgGx84KErAId6uF4nR2u7QT2gMaq+Gc0nUvF75S4lzGxFKUjA4e7G2T/zOslZPcoR
         /02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761276991; x=1761881791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlN5DvyH2+GBtNgIhKU58Oi5/dzl5ldvweXQc1JJd8Y=;
        b=ZFg+GtBdMMbxbpXzhxmXkQMQpUWm9TiD+Nrg2HBqFv+9bDiUIh3RnZY536jLrewt1d
         d5nhq0Dfds/l8s81/4pBE1y2VfAbIM8rI0prE+oHvpH04kXZz28Mok0AYkwUHbETZzGT
         DGsPZh9MFCV2xQvW4MfXUSO+sQBG0g+mz1+cR8eYtqaLu4G5eDgB5q91fvfcXTfyF35Y
         Sqs99ysT1gBLbl1YxXcbIXJ7m2kwmL9ZRJVOB1A90+btljxwBOUrEvFiFHX7XKLWYIGl
         SIX3OMXDzXt4KvWuqhQ1u0SLwRApC6Gx4Ix7ggNQ9FRaYUyz755LmEHDOmTttj4RCWvZ
         HLVw==
X-Forwarded-Encrypted: i=1; AJvYcCXuhcjZkJB+q3y0dCpS6qUT7qA5IdYJpwfSq+1ryxsOfOTA3Hda66CiitYDHk1f8mp3cJdx6R44eqCmPlD/opse@lists.infradead.org
X-Gm-Message-State: AOJu0YzyWROcWiC5bOXoUKuwqQWu5aARSlND3m9rJP5druCqNe8OMh/L
	z7HupiPnT3kOku99rUVcImdKZ4Hd29vsW/NuQ6iIb5VAEn771u2cNtSHIuF3EVGYqjxl7gMRrLu
	VCKjpVPrFdXHeLGN4xdwXg38qsltm/yU=
X-Gm-Gg: ASbGncs631Gb9oCKdrifEAvYglkPK5b6JgrsE2BNaqabBoQ/rYlyML45366xz6RPL1h
	jJd3eDnEVdS0xoGK5I2/SX0bkWSAg+EV7oVgSltUtTBYaeWuoI4Prghc4/tFl4U33UOjhf5TNp4
	UKHpB1o1TdD+94jzsGhH+GD+P2vREVaDdB6thQzO6vgk1QUP92vyqoDismmmbE9m8wxn1ah6B1a
	Tcdz6XHRXDFp6u2VAeb0o4aMfNctqhh5btJyqO+OT7R9AsZ6S2QZPWYOANufv6+QUGBtXg=
X-Google-Smtp-Source: AGHT+IHmAjQXW6oneD0rQyql9NZfZkZxeQX5ygzBPkzltdafT4YRRH8XN5RuqvianxiGov8Gjv/rIG5Ew31uUO9ltuI=
X-Received: by 2002:a17:90a:e708:b0:330:7f80:bbd9 with SMTP id
 98e67ed59e1d1-33bcf9202abmr28546749a91.31.1761276991065; Thu, 23 Oct 2025
 20:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 24 Oct 2025 11:36:19 +0800
X-Gm-Features: AS18NWAUWGWX5ZUSW4jhS3wlXEPW7gKSGrcNhdPOEUHBjtb-V-Oq2o2RBvRxgdE
Message-ID: <CAA+D8AN=Q7-b-SxfziJqsk1T-yNxw+VnOPAGsQhXh68e3UpN5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_203631_948370_3982C2DF 
X-CRM114-Status: GOOD (  16.85  )
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

On Fri, Oct 17, 2025 at 7:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu wang
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 6b357adfe646..eceb37ff5dc5 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -14,8 +14,8 @@
>  #include <linux/reset-controller.h>
>
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET      0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK                BIT(1)
> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK    BIT(2)
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK                BIT(0)
> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK    BIT(1)
>
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET    0x108
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK      BIT(5)
> --
> 2.43.0
>
>

