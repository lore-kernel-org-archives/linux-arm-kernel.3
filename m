Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9C2D72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=; b=N5fIikr3hMMXkAVyJ7bUvzBr6a
	A1ldX3WviNCD81I1abr/dbvEiU5Um/Ko7tdb00sgVTJr39HIhgd98RnuYiCe0DbhdNW5Q7O+2P+bp
	1pfGg8Fpq7D4arSEei1rjoY2ltJ+8PUWivhRmsAIi0vRuOnLci6AdZnQGQC+JCWe1EpwsqiH7jEea
	NhnWiZwI9Urm6PNMRgbXqXJUOGY7tHVfPWQuieiVuD0eslQeiEYUJcQlSOYH8xb8IqFaD4BtDk0LB
	nOeGGfpMwcx5A4A/MKZ96Koglxe2SNWMUiETO/phS8ea7SGHSldha+DzVT7fUFItcOUY+iOW0/3kW
	7CqxgJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDxE-00000008fIX-3loj;
	Fri, 23 Jan 2026 09:59:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDxC-00000008fHi-2Jnn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:59:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1497313a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769162385; cv=none;
        d=google.com; s=arc-20240605;
        b=f9oVPdNZ9ejTwGpF1mSYWf10qzBVwtnhAMQZe3kn9wXvoaTC2TGBttYyGTi62yoKPy
         neSAOePHuEDx+daxeCbNQ8okiBwnfSGseJRhNj8U8+pYNwhYKNwZU+ZOW0Dl47ymMN80
         zBXLHlaiSwrIHEdYq64iLkFFtMsfiYpQWBpkQy1wSbUL75RWipRH3Z7uAzBfQDs/JBT3
         O2MB8jVv6N4uQMz+3xKS8uORXrTR+8X1Jr5MGmPVN3YDI0Baqpf0QnPDWf9apT+9jtHS
         A/Wlo994D8JtTf7bh4+Rc2mLLbyOSJreyzHYq9aN3vq9Iv/LQFNLVJ2+4jlmSV5kSMSN
         DRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=;
        fh=Z529oI1ahZFCwvOBzf65HeE+iDuuu/ZwRlfhuedTM3g=;
        b=TIUXXK+pdiEPg8w6SGi5KnIbhb50dX3I302uejhdfrVeEJVVo4QaRbteM1kSuCxFFx
         tSN0XuheuN+AmxVmY8NA9kBfSncoqXyfU4EB354YtlIqX87VpkeD6vPleeMpXmqq6NIX
         qX7p/tx92eSQOqkY1zn98gKij8H/xYJ0KFPtUpbQQlaBTvKD6Vvp2YLJT+b7ENorubto
         k9SxyU3ASehhk0oToVaSrdN9btagNmP+8LXNgSEuT5SsWK3MpFLx6hK9GuEQDYIJGNdj
         uebdtv8q6nVMIQVd/KlVnsl5HKzzzYFG4BUpHeNqhQ2nnUlWKWA39IeOSDMwzZJ+2ufJ
         6ADA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162385; x=1769767185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=;
        b=awynsqGTbK9X8Jg8Ett2tt9jMtsi5fhxqCiC5JBjEbJTgrUqA3opf1qK2lWLzTpURT
         1D0b06JpH3WJmsLCK/22W0No/Ywwwoso7owdkjzJXwHcJK87v9bRqoiBjmpqwNP3oH+w
         J+XG231RDvY58slMijofr7Wmdh3Spl7l2ckkjb0AQpUMUPmY4oduEfCqDmpM0+tOqXPc
         Um2jwrwbP/2XF2sIz/wuztg8JNr4TgMoThOgLb/gLW0DlfrRg3R8Ohmj79oViYjCNpqZ
         1OHZ2umaxT3NDudxQryRayjG/RZ4ZLi57m4w/Xu7v6RhMw1/rb/60U5hW4hT5qLwTm10
         SYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162385; x=1769767185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=;
        b=tcK8JturxIp8BskQ+/RiUQJMRGxz8dOFAwZJtaCzT9JaYwCXjsJ+U3v6BODXbBIOuU
         Rs/zWX7MOsiLwfw8cRJY/WTqu1548eewv13DR4aWd7nnSd0u7UpcPyNgk0qrZtX/q61U
         s+VHrJpRcLfESro9L43j2tcXJEomfC+mm9MZtelW0DgbctfDzUB3CdlWHMeJEfOJFhG4
         VX7rGHVS3lYspyNCt8EeSk0Ip2M9UQR2gmrHH9gViu/q9SV3AfTwGCcI2oKJyiLablZf
         CDFVVTK8r1oYK/W75DY7ecacnw9yMpPfOlXkgjZ8RL3qSJV2z6LbKwKEmO+sexzowEOu
         rRYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNOKYEEORSHmbgOwn2paWFUPQeVZbl9Af6QHeHkkrGgn99RP4xVQRB6QEsxwUDqQQyp8xlG+vdEjIKTmBKNTey@lists.infradead.org
X-Gm-Message-State: AOJu0YxHj/jiNyx9aL8gdcFvnH56UYNvjmcSXSuFdsEhNnQ59jx6kfKO
	p0A3PN/qAgqFqWhcTzfrp9JA5KoeEE/KQijOfxjLDNJD2SGyHbFfy747R0WXH7swZ6liUgJfOAd
	UAKMoweh1OnhBUcsp+L7EMpY1jSt8xDw=
X-Gm-Gg: AZuq6aIJ1otixqzw7emAiBsv4+JMmFHr02YPq2jcbkBlXpK94mvbDHB6ZPluYAL81zn
	+c4LmxdntmmVEYzzyXPa5ol23YSZ2hOZUfpcnBtFkZXK4jXA4avpqSHjX7fXZZsYVoNlObpMfZi
	ZY5NGk/YodZtH3y28MTijzzcejztL6XbgdaaijNTVhLCqD+NNg+CqVYC066g0h/wbEg2N+ajS0y
	4e7zkCodpBAAXCpUsj1jdr8f+v/fFT0197eVzhFrqCpsYJ+yl5RXQ1m2oWWU3EvPL/by2usQTiX
	R/AE2w==
X-Received: by 2002:a17:90b:1d86:b0:34f:62e7:4cfd with SMTP id
 98e67ed59e1d1-3536894da60mr2059229a91.24.1769162385274; Fri, 23 Jan 2026
 01:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com> <59773aa2-5949-490c-bced-b8d110152505@oss.nxp.com>
In-Reply-To: <59773aa2-5949-490c-bced-b8d110152505@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 23 Jan 2026 17:59:33 +0800
X-Gm-Features: AZwV_QjBHIga33vSKBW1pabNQ2XL3EH5NV4mXw7-SfWsbUjsOOrrguhwtZWL6PY
Message-ID: <CAA+D8AOSzBNOoET0_aJRYhf9dsDu4mQqGWso9YNN_HNQU1582w@mail.gmail.com>
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, laurentiu.mihalcea@nxp.com, 
	daniel.baluta@nxp.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015946_590215_0DAFB7B7 
X-CRM114-Status: GOOD (  17.20  )
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

On Fri, Jan 23, 2026 at 5:11=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/23/26 10:48, Shengjiu Wang wrote:
> > The sdma script app_2_mcu needs the permission to access the peripheral
> > devices, so need to clear the Supervisor Protect bit of SPBA2, otherwis=
e
> > the sdma script can't work.
> >
> > As the imx-aipstz is a common driver for all apis bus, so set default
> > value for all opacr registers, that the peripheral does not require
> > supervisor privilege level for accesses.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> <snip>
> >  static const struct of_device_id imx_aipstz_match_table[] =3D {
> > @@ -84,6 +99,11 @@ static const struct dev_pm_ops imx_aipstz_pm_ops =3D=
 {
> >   */
> >  static const struct imx_aipstz_config imx8mp_aipstz_default_cfg =3D {
> >       .mpr0 =3D 0x77777777,
> > +     .opacr0 =3D 0x0,
> > +     .opacr1 =3D 0x0,
> > +     .opacr2 =3D 0x0,
> > +     .opacr3 =3D 0x0,
> > +     .opacr4 =3D 0x0,
> >  };
> >
> No need to zero these fields as they are zero by default being part of a =
global var.

right,  I will remove them.

Best regards
Shengjiu Wang
>
>

