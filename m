Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAB3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=; b=lb8dXTBuSmnoZ5yYVXsZJ+GX2/
	Mgu2WhdDx+EIaCpbQ4ewN6g62XCCbQhExuQJ+SU2Pod0NBKD3adqCeONr2qpVWbXD9TgbVZwigQBe
	m2k/vbiKbahlOJ42+01zFRgPSPkbs3PPPubZ90raMtIEM+8LcrHD8eHlUEqhZpRh4AAUEpwdrugSI
	XKHmeQ+ZdvhJ3xb7YhUj26HGUBnFlLtvK7fYQI0y1QCifdcmtYUaBd4I95tZdoRIVTdx/WqLxO5if
	65EwxUVlKaL5d2a3FlMHhKI3+vApt9WxxXZssEpW0qK46xp30hNo/GyHKIw8O5u748TuRBp7B/9Lt
	ERtP/JxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhwT-00000006c99-3MVY;
	Tue, 01 Jul 2025 20:51:02 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfLA-00000006INg-29vm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 18:04:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso32708031fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1751393058; x=1751997858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
        b=W5eFdF1mxszPXdI9wGtbPFeWXbBGyiHP2X9AM5QifAnBDrdMukqmmNa72VmXL+txPZ
         QLO1ePNb8+seTsu9xNHwAOmHD9Nr6THj7hQIekr+irQlaU4/U0O9XD2Kb6zXvUtv++6o
         z+9Jz9jqIZ637ZtiA4qpEfvaPj3Fhv9ulm0aOjuMDfk/sccwrUjvmoVcJoGgcE8S5tnp
         UvTNf4Oo4UZHNVQwP/Gi4N/ApzbMt8IvjQ0guIz3ZTFj7aKYRaCzH+HKplrR7XIU58eX
         XPXQSlAWY1BoWs75VkXv5w+SK8ZAJu8AxcUZkSD3M4H6YQO97B3mUU3ckOAwiV9L3T7j
         JFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393058; x=1751997858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
        b=bHI8m86sOUA0lDbOsjSLDLs5lenn5xBKYi+yRdI+dpBG8TStQdlQu8KbeERsjAHlHG
         69CJiHAxJUtc1Pnx8lw4ZVPKelahPYCwdLca7Ag1DPyqTReAHF+CblUDWoCIsbyaGuMf
         6aK8joCW0G3ClwcDJ4hedsJLVmZr/hIMxsBkWElY97d1SSjZFWtska4QBmgBySCHguUg
         3pMSnBYD/1H/OcUiG8w/RxI/53YPgjPkB8Sj/5ikE+K4Rls/GVcKhb8hKD07n5diTQKD
         LRWr67kg3CQmywKF8CKss2ig7mFBI+mcUmrz+04/fCfKWF7o1jeKRX8Rj6TezPtbnxtF
         42yA==
X-Forwarded-Encrypted: i=1; AJvYcCWstbMwFDqroNhuwMJy+3I/S7CLtoi/ParwpYFNPkiOqpJxhq3nopymXQ6Qufvb4LB4U5wzrye+HSlGMeoX2KoV@lists.infradead.org
X-Gm-Message-State: AOJu0YzPdwzXXSp9SKBqLHNpz/jML8yhr66aCILlkdewGg1XCqXCj7A+
	cp+SKxxfqkksqCG2q3GUTCAA17Ov6Abnu4Jm/rDZ+yzSBtBHfQKJ7NEwdSp2a0e9r+Py7RLxpny
	R7tIYLfNrzObuBEP54R0255lYpR81AKw7cBZxmn8ehQ==
X-Gm-Gg: ASbGncuoqWNK+6iad2aWKXQTLme7fkEr/MwCOxlWCAE/EX0pPsVM3POVX1dv9aWByV3
	NEBlNuwc+9rQuURkH2Dpj5+14jjy3kGkUPYxPib/EvxSKQgZYCwUpqO9HWh1NKZ2kuJTiPBrcJG
	XXOx6uvFg+65C6GErSZrS590QnoCnaYvn4wuAHdqeplj7u2E94FS3GptnuGjG8bwz95V+GFPyJ+
	A4XBA==
X-Google-Smtp-Source: AGHT+IE6y9R8uLja1br0fCyfzE0jDMNUQXyj9K5jFieZgPvJ9HnnxDlqVbdU3xGPBSrKWNmGMVpDlPgjkWqfN3nYZzk=
X-Received: by 2002:a05:651c:41d4:b0:32b:9e00:1237 with SMTP id
 38308e7fff4ca-32e00075d6amr326841fa.32.1751393057890; Tue, 01 Jul 2025
 11:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
In-Reply-To: <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
From: Zixun LI <admin@hifiphile.com>
Date: Tue, 1 Jul 2025 20:04:06 +0200
X-Gm-Features: Ac12FXzHRMRJLOOItsRIrxYGyHt7wf3A5-pMjsV73wxTRtwvTIExDU1XymzmqNg
Message-ID: <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"SoC support'" <linux-arm-kernel@lists.infradead.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_110420_660326_C9CB301F 
X-CRM114-Status: GOOD (  14.11  )
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

On Tue, Jul 1, 2025 at 5:49=E2=80=AFPM Ada Couprie Diaz <ada.coupriediaz@ar=
m.com> wrote:
>
> Hi,
>
> I've written a small patch below that I think should fix the issue, but a=
gain
> I don't know if that's upstreamable as-is.
>
> > Best regards,
> > Zixun LI
> >
> > [1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613=
dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
> > [2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a89=
3e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
> >
> Hopefully that can help !
> Best regards,
> Ada
>

Hi Ada,
Thank you for looking into this. Internally I've written the same patch as
yours and it works fine.

What's more interesting is the issue happens depending on chip individual
difference or aging. Among 3 chips tested, two with date code of 1933 and
one with 2223. The 1st one has many ECC errors as in the mail, 2nd one
has less errors, while the 3rd one passed the nandtest without error.
Maybe that's why this issue is overlooked.

Best regards,
Zixun LI

