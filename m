Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A1CCA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=; b=GCBb82qPUOfmTO6LVA3yhDl3u3
	lTrlXcUGdMxyc5qQpUZNOYWiZFE9c7bnCrgQ+55H907mIrEtrggA0v4LZfKAmWVA+PdOzQBUSajUf
	awZ00p3iiCXJUPTA3Hq/TROi4gRR9Ahqe2HMOhjsvSF1mwvPJ2TMq7QNjdUgSPbRNOZ8nGHR08+WS
	iENZNI9I3vYQjQjVStwwGgkyE102OneQZBtSMfxOCv1+g4OoSIrr1EDgoCv1Hr5PbyXM14jBPBXoa
	ZlpTxtnct7hlHb+Uw2nEOB98DcPJUv0kw05wlwMbmop2kWnGWZ2lmas6xMKRGzOeP6EuJVFVDL33Z
	1plGa93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urPMk-0000000HBTW-0kXY;
	Wed, 27 Aug 2025 23:15:42 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urOIW-0000000GzaD-3dHZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 22:07:18 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7e9f7c46edbso123372785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756332436; x=1756937236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
        b=YllUc70TkJuIDLjjYgnnveizOWSzqFnX5ASelxTVx+XF9nPBDOQ3LfUQYL1cNXNNe6
         Mn3fO8XCPxBsOxVchAqLrtYdUSoc7TB3KWTQkf969hcjKSWcPfdMQuGHRdAzgcb3ydFB
         NgK4a5dr9DH3qicfMv6TqHc5fCsrqjcGxQk/o/ECv0EWaDrS6EsKilR2vtsQ5rr+G4CW
         sUM0IXoPhc+pIN7s29m904kofKzH/cP/18oO4VsplOwVfRxNetKZHUSvtLe6eo5sZ77d
         E4W57Fw9y1IfVYElcq74skRbRq0rl3BMjBtQO58SCtovET5kuu+iRrPBvCfFOxPh65Mm
         UXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756332436; x=1756937236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
        b=phacLo8JR0zigZJ0na3aRYoPON1O99NnWdDRcx5WhlZETmGcykefjRg8KW2TnS0IHw
         8HHpVm7SndsaW5S0kl+YqChDh2VK2wvUAyoluOVagm8AWfMtLkpehF4ui+AQyyfp7zEY
         Hi/Dbx0aLRLALBVgdGQLulQBnmPDaaAeF2WFEaaVVynEmSGPNGR6h2MBX2sr9opSwkTp
         aRIqjT+AT4ak19Y05uRMxspVdWOFXftr7pHuFD/UjCOpOzB0wZYYUfwOYk0j/chy1xm/
         6L4dBV4Z9NNDuMV/0Im8jbquMaKeX0g799RiKChVngtHwdMtEyNrAvZ0b01l3ObhFW/x
         cP0w==
X-Forwarded-Encrypted: i=1; AJvYcCUb7TYV0kkx2fDgTdlXBIoNn2hrE2CtYKeUwSe+p7xmx9IhqerZu5/yeBeTOn+8UxnBXkmYHm2GkES53Xl9RFjr@lists.infradead.org
X-Gm-Message-State: AOJu0YyVF1RQcx8qEo/6ge5JimCMEiLqMhfdcQli/aCFfB4W204S9N1c
	PbFis5NAHhoJ/UsuP6cqWDtrnitWp5uYMv0mB5/HCZy32PlutHxL2cqSSdqe43w5VaA3PcTfLkT
	eyti314ra0GVLQvvawBxHNObLsBwpD3vzCEwzHj1NOA==
X-Gm-Gg: ASbGncs50UlSED/tncBM4NlDnDTnywyc+EIpk22J70yh7ztR5hm7Dxh9B0n2XzOkBG5
	yNR0Z5EjNAx5tKbm50YNqa9uei+ZR9O6ArW4q3AsMc0zolXoxF1Wr7sRHHXD8cInL0uLyRl5/cz
	5qWeS4FGBM+sqHyN7mtYsMsAyaQxE6OrpH7+Pu58NLa1CEgDNjtl7k5rqK9JMuUcIn37+2bTaQ6
	Dpiew==
X-Google-Smtp-Source: AGHT+IFWnq8ORXAI8SSjemzLtCbxSTUPIYIEaJ5tGH8UF3103yXoCHbrBxVEF+Bu2TrfLXMCEXU8uRfcWJlgWZbs5Og=
X-Received: by 2002:a05:620a:390a:b0:7e8:8086:cb83 with SMTP id
 af79cd13be357-7f58d941ce0mr891896885a.28.1756332435727; Wed, 27 Aug 2025
 15:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com> <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
In-Reply-To: <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 28 Aug 2025 08:06:57 +1000
X-Gm-Features: Ac12FXwItn5RDOOJRHCpy_8GPQsXlU1HYJaUvZiX6yrBr_5ZrTi13wSDfRmUQBk
Message-ID: <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_150716_907976_18490C71 
X-CRM114-Status: GOOD (  15.13  )
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

On Wed, Aug 27, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> > ---
> > Changes in v2:
> > - Added Rob's R-b tag to RTC DT binding
> > - Removed redundant nesting from hwmon DT binding
> > - Dedpulicated property definitions in hwmon DT schema
> > - Made label a required property for hwmon DT nodes
> > - Clarified semantics in hwmon DT schema definitions
> > - Split mfd tree changes into separate commits
> > - Fixed numerous style errors in hwmon driver
> > - Addressed Guenter's initial feedback on the hwmon driver
>
> Don't you think that is a bit useless ? You might as well say "Addressed
> feedback comments" and be done with the change log.
>
> Guenter

I don't think this warrants a v3, so hopefully the amended
changelog below will suffice.

---
Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c=
3e5f19@gmail.com

James

