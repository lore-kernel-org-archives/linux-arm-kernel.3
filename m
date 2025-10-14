Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ACFCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL0O6oR7tFBbgxorRPIiHZOqnAEHXSA3uOI/qucr4Lg=; b=oLswXoTc9c+rBXRBwuIp12g+xg
	NSW//xXiXkkKipkzUYmpi5khE2fWyuWeB9Ub9yKW7vfk0woRv1ohu+azagXlG/IT/BQ0g52bXtzbu
	i4YW1m+OsV3ftMQOJ5jfPLEzeCzIWyphHqNRKSGU45GgtpLOp83NB3sFUdVqAXoO+WYDMkaSFSTj1
	xOj6lBkT3rTteBHz7Pk91Q8/RIqG7GRKOIzxsDsTCGUUPcernQigkcqgw78aK2oJ+KS1imtWfOWPU
	pIEHUDyco3w7I3daZWjVS8WnoqxN4WGqzHZ/obSBlyX50jU33rTgnAvyjhRATCOZ8pfK9FvRBf4YX
	762+go2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Svf-0000000Eq3n-04cD;
	Tue, 14 Oct 2025 00:30:15 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Svc-0000000Eq3T-2yAt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 00:30:13 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-781421f5be8so12072327b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760401811; x=1761006611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL0O6oR7tFBbgxorRPIiHZOqnAEHXSA3uOI/qucr4Lg=;
        b=O4kGoPsnDtcMMIriO/w5ajXwkY58D0JbgF9PDvZSKC1KYxNCFZpJ+zBdqM/rREtBi/
         tfQupiQk20w8x9iAC7xXVBUwBPgjDdBLWznGSqRkcNVWKmDpbs02o8zqfvXVnXFZJmZe
         51UJ6msNXVaV4wOoD5YE3AToEYHDRX9eZSd0sGgBCRBolOesLjRil/0WprBxRQhZ7/AQ
         eVgVP4X24PNv1xZ9m/In5ZfaRs5JhcXGMG8QVPiJDTnZAI9gF+KxdOimnGwl6FvKjMN6
         A2Wgs9wnqd/+3/Em8JxtLbVuBFOIXqrBX8p9GyDqyhomORdGhijCMTP8Wt0Ub2p8Q4Me
         qg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760401811; x=1761006611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL0O6oR7tFBbgxorRPIiHZOqnAEHXSA3uOI/qucr4Lg=;
        b=mzoyaeKUFolamYRWYo9cKFmjaVE5wKWuvRmBc/xJhhEWzDS7huwCvHroITLFl4n5Dw
         v6f5MGD9oGfqhP4mSn0M1hLCAvwOgp6CeQR45bxhY2efsU71SfxwdRBGxbTyBTMDFJrv
         d8XD53QZdcrIkPNqVwQUvnk4i6WjIahpG74bp8Or/DWCclrCR7vrh4+brchtqh5toMJu
         zXT8qofOMg4udJO3y7Kao07sUL00G3/tlLKc7UalnPoCivNXyHLIltgnHvGFTSBlrgHq
         7bMg87CUsYIepkF4zPIOjDdsjgWPW7F7MV2f8eQqUif2REZswKL3/OoXPK/99/ydKi/o
         P9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Sbo3g3uQXO0Gi2JpiRhN0qG3IqxK6zi0QzOMjyTe8sj6hNmxG6BkB4mSGU2U1w+p1B5RUdVuzyEzdqB/53v9@lists.infradead.org
X-Gm-Message-State: AOJu0YyE0y9kp4P3muAhiNqlGHdR5cDPhyRyeTWek+HGuPGRRDMUJ9t4
	c7cA/8OVUYnf8GzlnHjH9mda2SY5lP2uuJXfG4ZyXBs1MDaE84DV9PTL0AadPF261VYFQ2NZn69
	vBJSrbExUrnT1wNRZEcSADuviWIzWsjw=
X-Gm-Gg: ASbGncvWrSE8aaL2UORceCxn3c4JH33KehJhrSNV5YyDySuzONYfYrTD2NGqR5nKPKd
	y05uBQqqLPk/s6oCsbKfLpu9jf+Suwcouc/+jME63XrojwjoiCerSVoQCcwB3qnTT0NzxQxa1d8
	I1kDyi3gmd1abAQP+2Y/eeUSsfYiSkCgw3x+kJl/arLagy6OeCuMNxrfb/jh0bHsuFPweLVjT2/
	6tPjtYyErhHXXDJDzsO7kKbCWK5Xj6Roo/cBSUujunt06Ie9mBHj/njDA==
X-Google-Smtp-Source: AGHT+IEUvVnpl14a7Q5M/OtoBNBYZn6+9fewhUttiUvAPvVoTebCWbrrZ3wpmAZYfXuUtNCIrHfIKGkBJJx456zaMyI=
X-Received: by 2002:a05:690e:15c7:b0:636:5e6:cac1 with SMTP id
 956f58d0204a3-63ccb7fb22cmr19733855d50.4.1760401811361; Mon, 13 Oct 2025
 17:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251013121709.104546-1-andreas@kemnade.info>
In-Reply-To: <20251013121709.104546-1-andreas@kemnade.info>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Oct 2025 21:29:56 -0300
X-Gm-Features: AS18NWAiJadHGMJZMT_VxfTRlUlHgWEUDMnUSc2rSEDmAVW-OfdMZEsrg58YfMs
Message-ID: <CAOMZO5BQQhNrYyjDRSr+bAYUa57YdFcroY-hi=La9aOSEAwURg@mail.gmail.com>
Subject: Re: [PATCH] arm: imx_v6_v7_defconfig: enable ext4 directly
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, ebiggers@google.com, ardb@kernel.org, 
	dario.binacchi@amarulasolutions.com, martin.petersen@oracle.com, 
	alexander.stein@ew.tq-group.com, stefan.eichenberger@toradex.com, 
	lukas.bulwahn@redhat.com, tytso@mit.edu, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_173012_771949_B9317F88 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi Andreas,

On Mon, Oct 13, 2025 at 9:17=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> In former times, ext4 was enabled implicitely by enabling ext3 but with
> the ext3 fs gone, it does not get enabled, which lets devices fail to
> mount root on non-initrd based boots with an ext4 root.
>
> Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Thanks for the fix. Just faced this issue.

Reviewed-by: Fabio Estevam <festevam@gmail.com>

