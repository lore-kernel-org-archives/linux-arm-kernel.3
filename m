Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8C6C88E7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ0wRjpBkARHUdg5AXc4jIF+w1YP8Cq41/gPWjBo+gg=; b=W+pNYPMku6DWyth+J+x1mhOtiL
	s7dVg9r/HqFGR0TjMbntaYEufnuYvFaJf1pUzLDYvVp+MEKVPa1cojRsXFgyYQzoqeAh2yLt4VuCu
	l0xLxuds4a2OKjgZUAjDngXuJUeysL6nf5OP8BFLS4owT7xkQV5RkxDmFdBDjGM9BYVmB6Hd511DQ
	MDP6YjYpwYRn+9M/HAYoqzLe0W7TCLnwgJhaAAJf16zmV2uIoAUP6aqKHS6HiPQ2BIhdV2vEgTy3o
	QRlqsFk10IOgd30+awr4BCgesrlgS4kGhF33G+rXbCQdjKkdzaNzrVEQ0oJO64FFPy5OwgHv1R1In
	gxKXfpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIeQ-0000000C9tI-2KZ0;
	Mon, 26 Jan 2026 09:12:50 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIeO-0000000C9si-2IJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:12:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-65063a95558so5797836a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:12:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769418766; cv=none;
        d=google.com; s=arc-20240605;
        b=C7C7bDBS37X4+QuAxZU9Th2GQMgbcfsfM51CTR71nERRV4j/WCXQ9JdO96fq9Z+Y6b
         t7ywQAUQmSGl3HfViasDl++cy6V6LtWyxaJ7gLnVtNV7pPp3RwvKJO6vD71R+dbPxU0t
         Ex5MiOpPvqcCJ8Z7/wSH6lcEeEHlp/EVhSpJAnyEcPNRqGL6+7zlvxVIL5daHiSOiHof
         wA1QzLgQnglB5aT8jeIKTu2WRdkW22WBrIfoSqFCnlPzgPu5I5/C3zkxnsYVwMBPV7rO
         z8fBedo9nodRNY8wdjn2CTFsfZuyrQqjZltbBN1cLYqjHAeb4zsEuC+PSFkXq4/SKeb6
         4X2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZ0wRjpBkARHUdg5AXc4jIF+w1YP8Cq41/gPWjBo+gg=;
        fh=Tfhli5UsduPoHZqsIvcow0SHx1RXY9EOiTFDMVWVUW4=;
        b=Dg9BiIF3q6/B2bHOmqmBfAj06HyfTHM6ijX7e0rUHFYAraeootnJGv2ORzXvck2Fw6
         vNqEw6GZfMaaVq2VT+nayZrGtKE83agyMiRA0adyGag7B2/GwixlbpeA99TlqY+YM7Wb
         oW+SCvYxqYWnLWoi9udJjdxujaiMobB7kt9yLVs7xGSfnc0ZIKvJjLKK+sCR3FxQNAiB
         131kq1oZXOl4yTWu8H2nDoIJDOwVabWu9QAvV2UY3PzqCqXrVIy6wyTohh/+STYW2Pzp
         Zdke6WnySJ4AOWSsj036gTPUAlyEZAHso+4x7r7nZu/koXyZIYd7mZtFFLKADEpcbcKR
         0LkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1769418766; x=1770023566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ0wRjpBkARHUdg5AXc4jIF+w1YP8Cq41/gPWjBo+gg=;
        b=IpG7dfUyyOgd/heswxqBTMQAGaBlim4IUHmbw7FSCE4cajahhDEu1I/iFJ8komjfN8
         s9zRPu4lzG98NbRkx7ynyZEu3FYp3YuKRuP+r9a7XB+IVHzHvzyV3pHFFFb5egON3WBH
         ylYs5k3Ru6Pb/yPhZQrUh1vAxpmeEZADCRlf26Yo/4WIfoCoMGJJ8pS+kA8MjJCZX8Et
         1LGrKVfbECgakUqsVz8Sv6EtaqGUQOJc1s9bA5OZuWipDPKMaoVpf56NKGLn5rnZgEO5
         2LSxAFMHxOtEQxB6OARfQ9nu3aE8KO95LDDQt0aZ64W/QCXvIJtvo5EZ/Qzs4j6vFPDq
         fcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769418766; x=1770023566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZ0wRjpBkARHUdg5AXc4jIF+w1YP8Cq41/gPWjBo+gg=;
        b=r+RtIu2qyNR1NnbTk+4DoRORrJmoEE/S2uId/igwtaQjyzkRYWBuO3gyF0VPuSNjHM
         2dDheX5L58YGfq7TdikDoStkzXr32yksXCim0HWdayj+S2IK5k5WH4y17pxmMPNJ1/R4
         7yre0N38WEjDjVcMzJ79NyXzboN45pR7LnNtvhDuPT1CVK5Bme9uLMYRDENXeaJDw07X
         c0eMHh1zse6t85C7Dfvh8Iw7YrW3fEAmZu3WA25roNclPijDHahdN3NbcW2moHaV9xf+
         tQgmRsXRs4PS+zxRbQrwjrKT95zBQxkoIoI/3PNY3QXi/eqaARf29yrx1VSc0Hc7+x2D
         ojSA==
X-Forwarded-Encrypted: i=1; AJvYcCUZPg8NDdleGjJ+AmaryRCY8eHDGhkmqxhKkiKckHUYmyDejeAMbj7sibh/OeXfuxwNjCv5lvDjK1+JCwu6sJ6k@lists.infradead.org
X-Gm-Message-State: AOJu0YxUcm7y/KpAOaVQwn115q3HXrZsD3piN6jcWY0yy8vY16WgikYx
	RMw2xDXSO68imT0Qgjp6QY5l2WeG7N5ch1HcS6hxwT/Pomz2rhoyIogPi7zI4kux5Rmbt6NQvTG
	4vUmLy7t/8f5PvZJn2osAlcuBy4cEDvk43bDttlJdew==
X-Gm-Gg: AZuq6aJ4j242HHX80UhBFqw64s5MA7tLZ3hqQYm4dFTtoRf+sEOpN0HO41tw0Tnt4Rz
	w+HVZkFbY7+hS/Nc34jy4V9AyjefZ/ZKXKKbra7hLdi+HSrU0L9WhDC33MYI5KzGn7wdGCbdOcT
	H7lTGr6x5Ah+dtaM8XU7DJwRKQ5IeBLni22MwiixFxw3ufGEWfCvJS0Oqk0pIllTGBG6aq2+KEo
	9m2sX7QhF3FkuobjxYdR7KpGdWqLtmcWsK8yHNAL2+wIc/1z+Zq7xuxfvhiR2oRZZRZk+iEsYyb
	GfbrMV4Ye39CsALpp9/pyJAEYsyiNicY4DRIbgP96FZTeFLCOc0=
X-Received: by 2002:a05:6402:4508:b0:64c:fc09:c956 with SMTP id
 4fb4d7f45d1cf-658706d59cfmr1542296a12.29.1769418766039; Mon, 26 Jan 2026
 01:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <20250827-i2c-pxa-fix-i2c-communication-v3-1-052c9b1966a2@gmail.com>
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-1-052c9b1966a2@gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 26 Jan 2026 10:12:35 +0100
X-Gm-Features: AZwV_QjHvCNM4XDV7ASy_DsR-MKQkm_PDnKvDdBjq4JrCqpz7uMbU7Pm9e77hpI
Message-ID: <CA+HBbNF6r0eQLS01eTUX0DAZ3mGcQX7N3HTCnTanVPC0num2WQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] i2c: pxa: defer reset on Armada 3700 when recovery
 is used
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Hanna Hawa <hhhawa@amazon.com>, Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_011248_633687_FE3C18BA 
X-CRM114-Status: GOOD (  42.96  )
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

On Wed, Aug 27, 2025 at 7:14=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:
>
> The I2C communication is completely broken on the Armada 3700 platform
> since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").
>
> For example, on the Methode uDPU board, probing of the two onboard
> temperature sensors fails ...
>
>   [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
>   [    7.277503] i2c i2c-0:  PXA I2C adapter
>   [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
>   [    7.288241] i2c i2c-1:  PXA I2C adapter
>   [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
>   [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
>   [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
>   [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -1=
21
>   [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
>   [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -1=
21
>
> ... and accessing the plugged-in SFP modules also does not work:
>
>   [  511.298537] sfp sfp-eth1: please wait, module slow to respond
>   [  536.488530] sfp sfp-eth0: please wait, module slow to respond
>   ...
>   [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>   [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO
>
> After a discussion [1], there was an attempt to fix the problem by
> reverting the offending change by commit 7b211c767121 ("Revert "i2c:
> pxa: move to generic GPIO recovery""), but that only helped to fix
> the issue in the 6.1.y stable tree. The reason behind the partial succes
> is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
> pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
> which broke things further.
>
> The cause of the problem is the same in case of both offending commits
> mentioned above. Namely, the I2C core code changes the pinctrl state to
> GPIO while running the recovery initialization code. Although the PXA
> specific initialization also does this, but the key difference is that
> it happens before the controller is getting enabled in i2c_pxa_reset(),
> whereas in the case of the generic initialization it happens after that.
>
> Change the code to reset the controller only before the first transfer
> instead of before registering the controller. This ensures that the
> controller is not enabled at the time when the generic recovery code
> performs the pinctrl state changes, thus avoids the problem described
> above.
>
> As the result this change restores the original behaviour, which in
> turn makes the I2C communication to work again as it can be seen from
> the following log:
>
>   [    7.363250] i2c i2c-0: using pinctrl states for GPIO recovery
>   [    7.369041] i2c i2c-0:  PXA I2C adapter
>   [    7.373673] i2c i2c-1: using pinctrl states for GPIO recovery
>   [    7.379742] i2c i2c-1:  PXA I2C adapter
>   [    7.384506] sfp sfp-eth1: Host maximum power 3.0W
>   [    7.393013] sfp sfp-eth0: Host maximum power 3.0W
>   [    7.399266] lm75 1-0048: supply vs not found, using dummy regulator
>   [    7.407257] hwmon hwmon0: temp1_input not attached to any thermal zo=
ne
>   [    7.413863] lm75 1-0048: hwmon0: sensor 'tmp75c'
>   [    7.418746] lm75 1-0049: supply vs not found, using dummy regulator
>   [    7.426371] hwmon hwmon1: temp1_input not attached to any thermal zo=
ne
>   [    7.432972] lm75 1-0049: hwmon1: sensor 'tmp75c'
>   [    7.755092] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    r=
ev 1.0  sn MNC208U90009     dc 200828
>   [    7.764997] mvneta d0040000.ethernet eth1: unsupported SFP module: n=
o common interface modes
>   [    7.785362] sfp sfp-eth0: module Mikrotik         S-RJ01           r=
ev 1.0  sn 61B103C55C58     dc 201022
>   [    7.803426] hwmon hwmon2: temp1_input not attached to any thermal zo=
ne
>
> Link: https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sart=
ura.hr #1
>
> Cc: stable@vger.kernel.org # 6.3+
> Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device=
 pinctrl")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Tested-by: Robert Marko <robert.marko@sartura.hr>

> Changes in v3:
>   - rebase on tip of i2c/for-current
>   - rework the patch and use a different approach which does not requires
>     modification in the I2C core code and update commit description
>     acccordingly
>   - remove Imre's SoB tag, it should have been a Reviewed-by tag, but due
>     to the rework this is an entirely different patch so that does not
>     apply anyway
>   - use Link tag for the URL of the referenced LKML thread
>   - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-commun=
ication-v2-2-ca42ea818dc9@gmail.com
>
> Changes in v2:
>   - rebase and retest on tip of i2c/for-current
>   - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-commun=
ication-v1-2-e9097d09a015@gmail.com
> ---
>  drivers/i2c/busses/i2c-pxa.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 968a8b8794dac3398a68d827c567aa5bb73ae3d7..70acf33e1d573231f84a1f09c=
ffb376a8277351d 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -268,6 +268,7 @@ struct pxa_i2c {
>         struct pinctrl          *pinctrl;
>         struct pinctrl_state    *pinctrl_default;
>         struct pinctrl_state    *pinctrl_recovery;
> +       bool                    reset_before_xfer;
>  };
>
>  #define _IBMR(i2c)     ((i2c)->reg_ibmr)
> @@ -1144,6 +1145,11 @@ static int i2c_pxa_xfer(struct i2c_adapter *adap,
>  {
>         struct pxa_i2c *i2c =3D adap->algo_data;
>
> +       if (i2c->reset_before_xfer) {
> +               i2c_pxa_reset(i2c);
> +               i2c->reset_before_xfer =3D false;
> +       }
> +
>         return i2c_pxa_internal_xfer(i2c, msgs, num, i2c_pxa_do_xfer);
>  }
>
> @@ -1521,7 +1527,16 @@ static int i2c_pxa_probe(struct platform_device *d=
ev)
>                 }
>         }
>
> -       i2c_pxa_reset(i2c);
> +       /*
> +        * Skip reset on Armada 3700 when recovery is used to avoid
> +        * controller hang due to the pinctrl state changes done by
> +        * the generic recovery initialization code. The reset will
> +        * be performed later, prior to the first transfer.
> +        */
> +       if (i2c_type =3D=3D REGS_A3700 && i2c->adap.bus_recovery_info)
> +               i2c->reset_before_xfer =3D true;
> +       else
> +               i2c_pxa_reset(i2c);
>
>         ret =3D i2c_add_numbered_adapter(&i2c->adap);
>         if (ret < 0)
>
> --
> 2.50.1
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

