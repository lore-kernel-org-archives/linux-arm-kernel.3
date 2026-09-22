Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F31C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=; b=X3dOWM82x/4NNnLUNTCp4jd+wT
	gaBF+wQFuCxtWjQ2KLHdzc8jvcZWh7SZeC9QaUVLKTI4UqYB9z0iaVszQf6kEsdHGoyFwQKSTrOHc
	D6tjfzO+KfJrN9NYCL+iH7LN8nqY1Dau7ByciRAQjKEvm1xZLPoQE+O8Tub27gNdoE5A6PcvD5uXd
	9rHvV0sQ7KoDToVzOj6WUEsaqW7dLm3WyQEVB179hA3fpEtXbRbzvEMrZ7peeYvpQPe33OI0O6n1w
	soQqwJcwPm4bQ2BFtNvvUBILqh7qQtaMFtqob1bodPa63SXUr8VSNa+ETHJA/GqgEwAj5tPLMimQN
	MzRN8qWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zK7-00000005Gop-0UlB;
	Tue, 22 Sep 2026 12:10:11 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zK4-00000005Gnp-2sHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:10:09 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469b35611so2634670b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079007; cv=none;
        d=google.com; s=arc-20260327;
        b=YhW32u7SnRKE80H6WVSJUDSMxBXGsohzdLsxz+apGgJFXYe8pXPz4MpNqGwi+GdXKO
         ZP9GUaaqosEVlZZkUxWFDua4N5SiwZMMDJla6ZrNHHWZVTu+1caKpBHuwPwPzhcjo9Ob
         +QGSnU2p9NiiCnDRuZVvm1TjpPTO8qe+aar3yKJ4dPkxLFk677Y41fue9yH5WfhdLVv2
         y3prMzGhVmEQI2NokPSRrWbCWK1rBd2Tl7ewj0Rh8lhcV375o12i4B0GAHzNoIBBoVN5
         rFdbTWqOYwkp6fMujZO2X5AIUPoagcNZs9wozH+NbG/yEslD500rYJsNiWjtzyaDOYA7
         WZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        fh=8B0xNnjwl4/Yv3XWv8D7r0dK9N9rGZKX+IE0fb3rdN4=;
        b=irUVypq//5EbPyI/BpdXeQsvJY26rnfuTXmshkMifE8nxVsEuNMR1t/1nq5LxFVAcr
         FxFRts/dMLMXxgLhU2zHIAwCjKLKkrbZT3KNLW232C9O7/y11ZcCt3k+e55h+Sl9PHsZ
         40Goqo79wkr6Y1UCvrq2/i1YpVVCzJoxdRk4Omd2WUMnMEwfbKn6N4w06y6iZJZlleak
         XjkCZMfr5EO0i6ReZ1VFoDXPJcFyqu/ccqQ7SvQM+zT7YMGfFdHMIkZb22WiAJvPQTUV
         zNYow60oP00Oj415SckHr8Dlhdz0rCDhWjZrceKqGQiOJAdlrlFxg4O33/iMKrmrIJgr
         2fcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790079007; x=1790683807; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        b=Lq1WorpVgljbEnwLK3/topUFbQEtIiknxlq34n7aELz/5T0sWcJB+CNlDamfzhUXzB
         +dklhblz1mQxX1BPJAn9iYYHi8d/10I87wUD1VfJ0g9Ph720HntBxsJJ63v2/NbRxe8L
         dGBLFKL3M/l0Xsw/3J/tykByninvRVw8g18e03ZD8qQFK4i1mR5NwidcvpoujYLjiBIE
         UYb3/Gsh4pNO5qPo8lwvOp9e8TUZfrRgALUJmDSUvg6IBfqiA35ot7LIybpFchi4qomy
         oMmit8iHmEytsj7HfK8yu0qSHjzZg3/QwQMxhnL4mzvc7E/f7diOPYIADN7z1d64SiF6
         +9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079007; x=1790683807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqZypLrUWsygd/HKyP66Nb8yxEOESbP2MWGoMZWSdRg=;
        b=te/rOmQhqUXmPZxWllCOycI65FLUn4oJ7+MYrRmPUQRkGkHXtsyzlCJlVSES+GZAUy
         JPzkuGOwBk8tuvcCkF4TeMOi9sY4kdgBTYI4M0kPlfady5u5kM4sZwrwBGd1oY7RYkXb
         1ZK+ioRkGsk+IrtB9hFmV9HzJA4TyAWLJ1RHBt2sLor06gz0TpN9d6HXxTYqo8aacyyz
         eG1Owr2zZTk7+Mn9HlR7yZZJKsfSShXiKwTHQQQ51D/65+sZZXQ7nXt4vlxrv1g5qu/v
         EjbPlT2f34BFKSoCzvZ811GNhyq8C0JrhmSiZ1sf9+bRw47zeHypSvUn9WnKrFT9H/Cn
         B7uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwStM+d7GNbi6MH4QlLz8/pfoZh6jbLeOLrypi6RRkDK+KTCkwbtd36nNJFGzfIZBJcr6sxuXHm8QHvJSxGg+1U@lists.infradead.org
X-Gm-Message-State: AFuF++lb+cbud8VdSv8OBBWph37MIhw1IA1I7pT/Ows/PmdebZWs/ez0
	9OQCs130C+Em/RnqN57ATn0WU3Mwqe2NkbfzywQqgAcJp3pCr4NcD22eWUTB6unt92qm7EqoIqI
	1SZApeODfVN5O9PfzBEZS0yT3yNIaoIuhvCfpmkw2UQ==
X-Gm-Gg: AYBFou1r8O4WE5OcsH/8n2gBiteJ2d4sqE8IS8T8s7oJ7DtaPFKZExuTMlkFxkFWI+b
	pNyF0Tm6/rP0yPU7HzjftrU0XhSDfKSpgf2wULmIgqcgCBHI+TidcupArNY57JTQbl201FiD5B2
	tCwMnFpD6DmRsf5Gv2kU01tTksSm+pE7y0ZJWG+B2yN2yWSDHhrahXhE/MgdvsjcZJFDlL2ovci
	4YbxAe59QDYeht0m4xfpAnJx5WjFj3tTejMyyVnurwuj8rWyh2li/fKPttZxWV4bEOvC5qK9MJ0
	LnjgBYs6kbpGzoFLJpRmXf2dzQLDj5Ft68j7otQ0oEXFQp73g3cNkavjaR+YG/vhe5R3Gqi/iDC
	XgKCYwFnL4BUZDGNHq8GIjd1eq8AGMI0sZHs=
X-Received: by 2002:a05:6a00:3a25:b0:878:34d7:69a1 with SMTP id
 d2e1a72fcca58-87c8472a93dmr1072253b3a.49.1790079006604; Tue, 22 Sep 2026
 05:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-4-robert.marko@sartura.hr> <2d7a6e8b-029a-4b9e-b7d4-8b7e96ea6aa0@intel.com>
In-Reply-To: <2d7a6e8b-029a-4b9e-b7d4-8b7e96ea6aa0@intel.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:09:55 +0200
X-Gm-Features: AcwNN1WXi_VCQa282Ypqp9POkhX7gCRsmqb0WReRGFy-rkyIzQdlxyeytRee81g
Message-ID: <CA+HBbNHz4_HTMHPv8wPGq_6UP+S_RbfcToAt6W_GN57aB5hG1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mmc: sdhci-of-at91: add LAN969x support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, aubin.constans@microchip.com, ehristev@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_051008_739102_7D6E9983 
X-CRM114-Status: GOOD (  24.78  )
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

On Wed, Sep 9, 2026 at 12:42=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 07/09/2026 16:25, Robert Marko wrote:
> > LAN969x uses the same internally generated base clock layout as SAM9X60=
,
> > but its SDMMC controller stops responding when runtime PM gates its clo=
cks.
> > Software resets then fail to complete and the internal SDHCI clock neve=
r
> > stabilises, causing subsequent I/O requests to time out.
>
> Is this a known issue of the SoC?  Is there perhaps a hardware reset
> for the controller that would bring it back to life?

Hi Adrian,
It seems like the controller was reused from SAMA7G5, which shares the
same behaviour.
Unfortunately, there is no HW reset for the controller.

>
> Does that mean unbind and rebind of the device from the driver
> also does not work?

It works as long as we avoid disabling the clocks.

Regards,
Robert

>
> >
> > Add LAN969x-specific SoC data using the SAM9X60 clock layout and select=
 the
> > option to leave its clocks enabled across runtime suspend.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >
> >  drivers/mmc/host/sdhci-of-at91.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index b7e2a89da348..e7affca8da25 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -158,9 +158,17 @@ static const struct sdhci_at91_soc_data soc_data_s=
am9x60 =3D {
> >       .divider_for_baseclk =3D 2,
> >  };
> >
> > +static const struct sdhci_at91_soc_data soc_data_lan969x =3D {
> > +     .pdata =3D &sdhci_sama5d2_pdata,
> > +     .baseclk_is_generated_internally =3D true,
>
> Should be a comment here explaining the issue that needs
> keep_clks_on =3D true
>
> > +     .keep_clks_on =3D true,
> > +     .divider_for_baseclk =3D 2,
> > +};
> > +
> >  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> >       { .compatible =3D "atmel,sama5d2-sdhci", .data =3D &soc_data_sama=
5d2 },
> >       { .compatible =3D "microchip,sam9x60-sdhci", .data =3D &soc_data_=
sam9x60 },
> > +     { .compatible =3D "microchip,lan9691-sdhci", .data =3D &soc_data_=
lan969x },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

