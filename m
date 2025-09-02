Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE50CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GldbsHOxwOqRszhiKUe3fdsQM11GQH7faWzrEcD84Hs=; b=Cdbqpc/jgwu1ioykKmw2e2R3lV
	AA2vpZkAeLalS52SzpaXYPnVBX3lgp4HCDka0PC1vTu5g2keOCIRxBHg5syBq3Eusk3lpAwDHuaMV
	y/Gy9JAcJd9GGafpUjDZFs2TLJpj0pYZ7Pyo3qt3uyfLUqWZI322A6a+O4BC2g9llbqhvpOXz1OhZ
	fev2NWtlktxDavfRXzbS2qrAyJZ1gAzwZc0/u/s35H0ZBVNWhFHWFb6urhvGMRkND/q5KhAVDhPbQ
	V4vdOq9757sA61S9HEi8EfSx8eyKFYhHVfzsPeTBwNgn+E0qMw5W9tDW4OuUEIykhzxvYXWjW/zvZ
	dCHc5l3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKaN-0000000FXyh-0Pdr;
	Tue, 02 Sep 2025 06:33:43 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKXc-0000000FXFp-1YDU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 06:30:53 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e931c858dbbso4017173276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756794651; x=1757399451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GldbsHOxwOqRszhiKUe3fdsQM11GQH7faWzrEcD84Hs=;
        b=BQLYbP9v0epCsUtpUhHbIW0Qll28ld3NfkrgQnDdT2/V3BFFcE9q+ymUwy8DprSUZT
         DhUN16Tdusw1lrSi6Srgp+QVH++8TMi2cwHLhciMUOC426dyKlRoI7if4gT/OWmtYtr7
         3iHjOSjRi7JV3xDn6ybI8ixoFmdOaCnksolVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794651; x=1757399451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GldbsHOxwOqRszhiKUe3fdsQM11GQH7faWzrEcD84Hs=;
        b=AHzuPLpo8y9YOeZCH7HXta/GEmxwTtJkw9OWiFbRib16PxlmV5w0sOniFA41rWqp0j
         OEqUXBIwgyaSyMAK1G+F7wjLXzyniVzP0DhNgYwdTp4Rve9Wkr02Iwo4sM+HYxQEolyd
         9hG8auch6V2LkYq9wngCxjYl64COe1hEuksJSsKyusEBnCAac1ALsq+xGMv1kcS0/zf+
         wWtQueR61QIQSadZ4sj45Th9CTC7k6tgiAbTW1hFTL++b8pYZ+e8pMdLekEroxX5bC7i
         BitViAiXC42b+RlA0HSNsDN6BS/n2df6eAoSc/ACN8hcMXpzRA0uthhf7MGVm/7jBsW+
         o0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiNGmC2f8bGL2whL3TYLaQ1mryGrq9vQSpDOP3w8/Pvxh7xaFGp2N1MRTfsNZ2pKVv3REQPIVNysUB4/Ppa9fx@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ8JYootLZST57zz+YqkIuX7k5jxkfVfxO3bNQUHbBYrr+n7uk
	UHdz27UOXIkpv/YY4pAVShQZFKOvWWvjHyFpKKQrA9qLn4+ut+zXqohBQDT8dxxjkLsJ8pJoa4s
	v8PlHTVCWs8PRDD2s0is1bhYC43oYOoBBzUjUnliRig==
X-Gm-Gg: ASbGncsbuY0crHtXlTgPD4hAJ3+Sh3VmKZwFSOdpzxZzOgSYYs/y6KodCcAs48uGR5p
	/tXKNzev1LNoAsJPmAFTsnJZCiEPzSbM+qs2ZOtWrHkG/uifNZwxXIJXSnz0FsfdTPNE++tygG5
	Bt6s079/gbz1zoaCXXpPp5SmCEXENmubtDCm5IXxXBYpHW7s9gpox0pU6xa3FZiVcwUNdJ9nnkP
	lhSKA==
X-Google-Smtp-Source: AGHT+IFhB7Yl9/OZwualFBQTMDBb72xbz0Pgu+LMqFnInMFJirNghOMFct+IVEyMhDl89O9Jsjjbl97dtB7oxxL5r+c=
X-Received: by 2002:a05:6902:238a:b0:e98:a36a:7635 with SMTP id
 3f1490d57ef6-e98a578c2admr12602864276.12.1756794651306; Mon, 01 Sep 2025
 23:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com> <20250725230342.GA1993803-robh@kernel.org>
In-Reply-To: <20250725230342.GA1993803-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 2 Sep 2025 08:30:40 +0200
X-Gm-Features: Ac12FXxNBkEwJsqkZcDT2ePkxFGLxfZm9eNi6M7jREEW07RJgdKjrq9oLA6y4Bc
Message-ID: <CABGWkvpeKczJVhDbhyKPDgNyYKYkEaTzJ+xDqCgkuqKJAyCa0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: touchscreen: drop any reference to touchscreen.txt
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_233052_411702_817FA530 
X-CRM114-Status: GOOD (  16.45  )
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

Hi all,

On Sat, Jul 26, 2025 at 1:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Jul 23, 2025 at 09:14:20AM +0200, Dario Binacchi wrote:
> > With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
> > schema") touchscreen.txt is no longer needed. Remove the file and
> > replace every reference to it with the corresponding YAML schema.
>
> The point of what touchscreen.txt says is to not do this. I'd rather see
> time spent on conversions. But you've already done it, so:
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

this patch is Acked-by, but who can take it for merging?
Please let me know the right path forward.

Thanks and regards,
Dario

>
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> >  .../devicetree/bindings/input/touchscreen/bu21013.txt  |  2 +-
> >  .../devicetree/bindings/input/touchscreen/eeti.txt     |  2 +-
> >  .../input/touchscreen/raspberrypi,firmware-ts.txt      | 10 +++++-----
> >  .../bindings/input/touchscreen/touchscreen.txt         |  1 -
> >  .../devicetree/bindings/input/touchscreen/zet6223.txt  | 10 +++++-----
> >  5 files changed, 12 insertions(+), 13 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/touchscreen.txt



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

