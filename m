Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB020C55ABC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=; b=Fsf/3i5IKQYY7EnR0SRDOrZdXE
	U8elJ05ggJm6XI4kXWKzFisPSM99i63GiH146pYrSbIRhhIfzG1FqTgqp2b1/2gteJQ25fzBBMSp4
	x74BZTDff3XlFi0yiiUSFpzcxMMWWA/629VoMhlaHdPvzhMOA71pkYecR3yCdX6ZYzzXDuaEM2Z0t
	vqZ6G39Mf4Z9s84/5Awg+nfLLw+yh08G9LF+gkcKoCf9iW7rkLKllfli8g4jorUbXgd0TFTE73a12
	t+Q+6X/eMbO5C0878qrJP2hGaARGOJxjj9EU2TYLhno3fArJ5qdP/jHK+D9IILr2RCyWln+X7dTMS
	jvQ7RRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtP95-0000000EStf-1mHr;
	Fri, 20 Feb 2026 11:58:07 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtP92-0000000ESsr-2T06
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 11:58:05 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59e57973dbfso1948906e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 03:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771588681; cv=none;
        d=google.com; s=arc-20240605;
        b=SWXrXwsIubIdcWWGOuc91mLqE6r8c1YluPctnGRnhOmDHGRljtfEAWWw7m78EDvrNm
         h7ab244AbS2bLBoXIYG6ZRYEYgv8xvIfA5Ilx5+PmBDQuUVdKYJ5yp5QTrXUKdzCPlua
         kqR8zMDFQQtEZ1mBvROwLJpa4eqz2spFtaZkIrhbOsfMq348cgImPEh8n0Mkl8Lce2kL
         0iTlBlsNwysNVl+5JVt+0muPPf51JmnCPlhwojgu9AvLEGIlBvJ0D43KiozZcU1rlPvP
         T68Tqo+tfDj4EZYZ1QlPov5wmvlOzpiM4EENOKxsDd+QDQl5kgDJE7Lk2ojmMnWdkVOU
         4/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
        fh=nOTA3SjLd/ttq19On88c5uh5rEkk9vNoqJwslWVqR2E=;
        b=FpyG3V7r/Am2UEDuEwq94ZsTp7dw884hyLTuXJMaeN+8II+hI49GayOyHNj+YMJmTq
         kljtNliWHirRZbBZjHG1s0fSSliZldXnNh9CbOadTg3XEgGms9QAMZn3Ic0rSvnoNq8Z
         IPqbNd+dSrDyVFCqd4KIgn5kVu5EdtNSYr2osk8c4j04bz3rmP5xFm9uHca1D5HBho1Z
         OoFhRVxVaoT57PD8ZepcFcsoyWJlqTWfWFFFC//Ui1A6oLx9tuPgVpZGnNW2o5dMAT2w
         shdUwvLd13b8Y5T0j6SDKjJ9eo8M3HfsBzgp1996UZxlXXCbD1XXxm21kHP3g6tkBDNX
         P01g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771588681; x=1772193481; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
        b=hXE2A6Vmypy9xoo8UWySnQiNIEq4rKkTt/8oipTktBkHoxHgbK6QGF+oOrXx/HV4iO
         OZyLMEofm9CwWe5vufOLcAs9HywT1kxhnD8pMy04SCvLlx+cGlMT/A9PexghQgZfeVFa
         EsAxtRUvROw64vvqyhkiB6V+KWA07MaHMzpDrQPj84xB7LWoCyxRiCFjUDa2ljMYcn4W
         kjTRsFo1EcF7kvD+VYEP0NtzcreGoMgDcMrQ7PB3Qw30LXMbKtC5sbm2wonn1h85/n+R
         OVzIR3M5Syr0J6T4ECpQL2FL4i0JOjhgkfx4KYfaGQLokFsXIC2KPd0sRJ3j0KG8V946
         m/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771588681; x=1772193481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
        b=sNga9xh2LbbZDp4BmcTzBWFbqmQ1xR8oA0g3KqB6t7SSJmHS0xONDvrXebChX4IC09
         SFSOpk50sW1TPhrhJ7arjwfGo3YBEd6ffwpmK8N/k5V9+GXxoEGDpJsWcNZI9uptjDOI
         NHaEZ23S/d/z3+fi5zyuPM7hBizRyWqtzz00WgqQqfGwo7Mc9K41jN3EX7yPrYkioXBf
         YWzKpwvzpclvAhenRjiHO7rQ1xsh2HRVczDq7DO/vvEz/TYbnOVPu8akEun06L9hEhp0
         Z8ELiQTpvHRZcZ5cgfWc44b9e7JkDUpuz1XrKi1WNckMiMaSZAbtFJSsAeQ/D/DXOGMK
         4r/w==
X-Forwarded-Encrypted: i=1; AJvYcCVCz4anYGTTR0BGJk70x+yjzzq+1+QEHnDulfSc6vJr5oMe8zsD2Z7AMaCBS8qXcz2638b4XIWvC1WzJmHLKtlB@lists.infradead.org
X-Gm-Message-State: AOJu0YzliV0i6WWH1rRLP68MSd7COSKRke+QC6EnTnY/Og1+CYLQARwt
	wIPVPYailDe72ILo0hgqbU1UOjUmJgz2AJSbhso7mzd3ggc7oaBrEizxp4aInjRw6+dID2q5Qik
	+5+i9FOK+1gZ1V+Dku72wfEAMvvBJizc=
X-Gm-Gg: AZuq6aIMOSw1fOrRy0f3nm4OegPf/beGLcRR6/Bn7vM5pfJyCwL29I6Bf0NOpaCdMmu
	ZVYD2HXkUratAE7B0pwPHUsJt1GgTr5HbepyQ8hzH6EiEXLbZA9KptGXFK/oqOwr+jvFmaExrT4
	xVw+fp5A+WPd0VQ3jwsHdYUOoRAmW/whRdSVF+vTskRj8hrCuBehjUvjbugG/MFQHoscAEQPpSn
	WvEamchULGWiKivAXEBIAl08NIC/HFRiUsEnBtV3gwI8p21hM5pmhRyPDwKAHd6fEUNwbwJLk2k
	yogTxOJyP4ic0KLc4qQLrTV2O0TgHS+1xM0wSY2ZxOCx7W0w2LDq1ypzZTfT8ISfsrLmTs0=
X-Received: by 2002:a05:6512:36d9:b0:59f:8dca:693d with SMTP id
 2adb3069b0e04-59f8dca698dmr1155437e87.26.1771588681209; Fri, 20 Feb 2026
 03:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20260220103636.9697-1-frieder@fris.de> <20260220103636.9697-5-frieder@fris.de>
 <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
In-Reply-To: <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Feb 2026 08:57:50 -0300
X-Gm-Features: AaiRm50XZNrFKYb5ETk17Lmql-pIZCo4EU6DvZWKcKq6NVxcvVE0Q46aMC1Z02M
Message-ID: <CAOMZO5B7kYtXzKtguYe=2YEnSm6rwa0vTHJwn1p6pUqjgZ-b4g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines
 in DL devicetree
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_035804_667466_B9D9E1DA 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Feb 20, 2026 at 8:20=E2=80=AFAM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 2/20/26 12:36, Frieder Schrempf wrote:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >
> > To make the code more readable, use the macros for the GPIO and IRQ
> > settings.
> >
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Typically your Signed-off-by tag should come last so you need to swap S-o=
-b with R-b tags
>
> in the commit message above.

Is this suggestion valid?

Shouldn't the tags appear in chronological order?

