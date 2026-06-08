Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E8FCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=; b=ww06X1RKLQo6FPqbj6WpUEYq5a
	OemIXIe6a5BiIMBNwErZo1FzWlCsQe9tPRVPXJ31hqc1h3naRpMoNozOJQcF13Q6boBd4opeoev2Q
	CxlJagJvlQZd+/2ysSJiBDHM1EtDFVXpIB0H4Ms3TV3kzT5njAuVnpM25Fx2/cQMR53DKPsalPZeM
	XGZvYYmOFTrqn9/Kq3izWPyXLE0ERIJnzPv7gEPU5oPJlxqwdvVh/n4rzZDFp/caP2zr6GutyCGzb
	epe/h/ZLf+KaWRLFwlZtcEcYq3eiASu75yH6go6fxSX2HAyfod92zw1MwV3i/CytbsU8fS+ulti3g
	B1JP+mJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYVC-00000003So8-14Wy;
	Mon, 08 Jun 2026 11:50:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYVA-00000003SnS-0DVN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:50:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso4298236e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 04:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780919441; cv=none;
        d=google.com; s=arc-20240605;
        b=O/xowLYC8AH3rhNX6x0NmuYoJlW4W6Vc4E+SX3suU2GQ2VmmnwmYsD+xtMMCkN7Uwq
         thSE/RXuYqgvRHtXOZFLMCoD08yDYxGk9emG6C5wkt3zU8FOiL6O2/Iis8ZYNsbkS13v
         BPc/ARDQNNT8oaJoXjUbIcJ9vhhypUw3YnCUqQKzcr1deqBjvvZOVqfokbIoj5n04hmc
         T/piNsJ9APSCoZMvAmUrE99gYznDgrlRPYhSX5tLHtGTvEoJu1s5Hp9tQ5IoUIHRw0tC
         BePSJhCVQywEzADqkzS1B4kriCVcN4dfuhsumYSoZXYxsYVkrxZZZbfByGQ2M4OzXsuY
         qFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        fh=npRu1UW90Ir8imwCSx1voJwTHLqxV4Oie6QWvT6PwtI=;
        b=IZIYWEOGrN6bIkUqzWRjdR34nb6MBZ6QeFBp8WXGkmAV7dwXOZGLzBzJngv2SNte7p
         5O7PzOnKXv2MzIxkSu0wvJS4B5veDxShbjJS7lYRE/qIZdh1DVneiQLiw5gGltNQM9+7
         2xgSMfFJ9I4IDDlzERFrr0lFlVDUPNkNTyN6tba44tic9wSJ6m9eUIaSDm/h9GzHYNyL
         EaL0hiLvElaYC1qwu348c4YQZJfTJpu2SBFv1Yer0nTccjtz1izfRCYISMqQ7VSoV4D/
         zhbiq7lYbJkfxkfB9FpPa+VEjVyZ1U9UrTWXUky7Mqboi5U8686q021cibwUbuoshtvj
         emQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780919441; x=1781524241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        b=UMlWxoq2YVsiS/4un7mhONJLudo669QYpNgy3Z0M593YugUONXzJnkOCEkXIP/fmJH
         EobxYpImpTbiINOFaiLoBFjno+XU1yowGY9fAMiZEvAuHTGohDiR1ht6SV2UCvbjJEyM
         ICxwI5wX54N2aGZv7GQfyEB/XlNGGu1ET7N2REuiZpmbHmx/Uv7CircGeLKMfc3GUY7a
         tyEaDHvqj83tAcA/Xt6abfa6RUpof+j9PfjMnWV+E7sa0oY/zPy4yTgEpjFYwPjqwM7H
         uBP7TFkn56i6CZjq1kyMcrLa3Z+ZC9fADZoKacK5rQEoPiacvX8sGtaoGUdJTXzmR7s3
         Hnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919441; x=1781524241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        b=pbD0IgTEuDRk3fMUG7sZyrk42QNVQ50azsUwKaQd2WQ+CpL2aQeNw72CIJpT4LdTGF
         Qp5lvfJOPxGTWNYZNzKDZO1Er9IN5St22Pc59b9USp7nN+ZFVxUf5e60ShnOXwjGjL6b
         jYsbnMrsHtT5YFJD/ayxCKUvy6Rikk24rJSJoLZQQ9YWL0T2SEwWAknU4nel5Skx1Ioh
         3AQ0dL08XpDtvEf/gyQKBV4SZV1FSlQJMJfNS5eek1G4+u0EJqfjB6ibI2vhRRMGsmVp
         3pTlJhxM9r7AFgwvwpVSMU46t7oTcI2qEohXQ8pJvKXDPk9xgshQal6FkPNeLtfot6ls
         UrqA==
X-Forwarded-Encrypted: i=1; AFNElJ8CAbJVvcgu1cysZqJxxM4tBW8ypUvgWKU7ZGZNHzbcKorpqevUOkDUp2etcTYLa1mmnuBLkG+aV8vncf/y6kbB@lists.infradead.org
X-Gm-Message-State: AOJu0YwvgpdBvmBZJeiZsmViqjrLJA2p/WjBhu39gsISSJzExNWMNXiN
	B4S5EOhPLEVmCMsLCBrTuiAP38vpVa6H1bysqhl1MXuajmTxfatlL3NJI3fngRb3rdOu+Mekx/o
	24RXwjqU/yG/UmhnVNY+vKuS1+BlItco=
X-Gm-Gg: Acq92OHC9tbGp6Knwixpc6/4Mt7SIW3ubVZI/y70kOKWyiiYGWoOEaDBKLK4r+mF8+L
	QE+FS+SM/OFeqftUPP1vuB+TZZDFcMcUjpmgQZ99o+gRXp1ztIqjXToVBfnBaGzQnuhdODtNv05
	H2ckyrGEDZ6QXt2rUkv/dvkZ2JV9hibQn1YGUC9iTQEahKgMSg5jtPM19B2+Y7DQsHiyJ3nkUXn
	UfJ/4GpMoFsg96a2fTM27uRN46Y2GkuuyxasOiIaPE4JTukrOFOUTiMP+EGp/4uGKoaQjBcav8z
	It/NZdlp3a7HZjfSB66Hup6RRC4EMxHTAfS+8l15urBbs4K6zqE18F9YVLoxWtW2nWDyqrXow/6
	drBh8
X-Received: by 2002:a05:6512:3f07:b0:5aa:8823:e30d with SMTP id
 2adb3069b0e04-5aa8823e38cmr3920328e87.47.1780919440875; Mon, 08 Jun 2026
 04:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780912893.git.stefano.r@variscite.com> <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
In-Reply-To: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Jun 2026 08:50:27 -0300
X-Gm-Features: AVVi8CcopUIUnSsBVn_oDWGn46ZYi_6hmaOIDxy2o6en86FExNrPt-umbKSjcr8
Message-ID: <CAOMZO5Azt+FX4z=CXHmwQTNqruKp7y0Ki2EtmDyavkuqT767QA@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add second
 Ethernet port
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_045044_105694_003951EF 
X-CRM114-Status: UNSURE (   8.63  )
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

On Mon, Jun 8, 2026 at 7:09=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       reg_fec_phy: regulator-fec-phy {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "fec-phy";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               regulator-enable-ramp-delay =3D <20000>;
> +               gpio =3D <&pca9534 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

There is no need to mark it as regulator-always-on, as reg_fec_phy has
a consumer.

Please check globally.

