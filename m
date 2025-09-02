Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D4CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjnsL3XW3UaJ1NXrQ/ByHcSCbiuu0UPyPN32gblwuVo=; b=p/05GqWrkQobhdMSbrj68ASgFP
	04dqeDVWOmAa+gmksaZ/U8JKHM4cqx52kjyqz8rPSB9E3sFLb2+6XebFLGiybqhR0ljl99qaCUGaw
	xloquyM/rcsi1RU1xMZ38DOweyRB3ik7Z0DMLHJirHhVYSP/lowuMYwKTer0e7E8lmSfBRXtq7U+w
	gifHRDGkHB/5imcSrnOFukD8sSL07KNKnMbKewq2Q0Uc7alv3kSxL6drjqQu0zaSjH+LElT41QLMm
	gHOsgl7viulvnpoilRNaNFzz0CKPIs73PjxexWnwiE8LV6UNJ5bHaskDyRlyEBJ+2NL0P5b9Xcb8u
	HDZAw9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ7T-0000000HF20-4Bc9;
	Tue, 02 Sep 2025 12:28:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNHv-0000000GMdt-0CYO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:26:55 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f7204b6aaso2454442e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756805209; x=1757410009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjnsL3XW3UaJ1NXrQ/ByHcSCbiuu0UPyPN32gblwuVo=;
        b=D1lfu8iNyuLnDmG9cLEnFO39XECfSjPYo/1h/9r9h6AWqfCJWokgR9suEx8UWnHMFD
         lXyFLUtltFySNqt+29YxIB8d/ZGVbqzfysHvkev6/CSoMN+vB3NfRGOoqtbYJMyJUYjI
         1zhRqocsvwNKgreZUpxNI8cCXW0GaflR6ZKmPcmv2hiRY6cmRPhk360Yo4R83SOAkHvt
         wR0oLE+clBKAQ7SBW2bgWPyHiVEu6n2RF8H+yO6pdlX1Sfw1/vkh98fIuMwjdjbU1ten
         yXlREyCT03ZdDQcZ1v0AZwKr8GDNMesdSYxNsYnk1OpcnBwtOtK7SthAPoVlrCa6ettV
         q3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805209; x=1757410009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjnsL3XW3UaJ1NXrQ/ByHcSCbiuu0UPyPN32gblwuVo=;
        b=oQt93Aqb/LzDKUIi+zmmOvv+O6a4YbbssmobtF8wWF+yaspKmVBUpj7z9Fa6onCXwm
         nWRUqceK35t2SiaXYLV45YKHpCLG6I0AGuVIWppYMyvhWBYfHANZgOqoSLkBscmL/6Tq
         ykgDO2RDJ7EqQhf9lxIe7JmJX8BQTgvGA6y7TvAx0YoVzR1TpKFVFOoZgJ9rgdC0kGsA
         AnfmqV/N8yvnmOJ7sTTwvj9bWy5nKlIBatisHyHLBGQfJ2qqWFM81Fpj4+SAdb4C9vpT
         2xm6xFIFmWuCGJbk8xZReZx7bAMohszFOtM29x/XjYJomk8ev63g9903fb4Rq0zu7zke
         TfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEbQ3/77qk+9CRpZbnLhii4gENS1FlS3FjZHXnHCrfvy+AMXKlKGu20hKAFhGP6h49yKfatqkecPBg3QCJATwh@lists.infradead.org
X-Gm-Message-State: AOJu0YwVJihaM7bz4ER+aG4jyBV/QqgNSAeLhHRg0Y3bBXHLYFSQn08U
	tvnS/o7DpXFLVoDhFORzSOCjD49RrU7QW5UNhPMFaEMG59A56dvUrcVgqw6dJwJnwDU0fTGFU5E
	8rJNLXE19ZaSsOlps3nfTZItruOCdeFxwvp9kSKOc3w==
X-Gm-Gg: ASbGnctfVdPsEREpTIcJYBsTYgcSYfH5hIKrKcybprZ8GhnGPSzOBHhkKe0B5Br08m1
	YcPBHSJUqPOgJ+SwtTSceujqNjcMfVZYkT+Rxgt7Jec/bAcM7N3I8sTFv89NrbWic2g60Y7VjqK
	MBBabVedLrQ7aqtXwSxh8ZNJSHdfaBjrIYh+0Tujd+Xce13xNS1T5wxOlQKUKyyckjmfeKIXG6F
	8iV26CT0kpGtX7VW/EeqAs6awQZ
X-Google-Smtp-Source: AGHT+IGJjurN9JA0rscto8t99g0Y8tUzB0NwVw3hs98dkcT0jBqS8SNMy1ybjM5cAAuSdEp7ZyMJ+Whx78oyr6hiRrw=
X-Received: by 2002:a05:6512:4042:b0:55f:48ab:a2c9 with SMTP id
 2adb3069b0e04-55f709954efmr3358483e87.31.1756805208488; Tue, 02 Sep 2025
 02:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
 <20250901-bcmbca-i2c-dts-v1-4-ad81f60d4276@linaro.org> <2c5daf76-ed0b-486d-9f8f-dcaf35365042@broadcom.com>
In-Reply-To: <2c5daf76-ed0b-486d-9f8f-dcaf35365042@broadcom.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 11:26:37 +0200
X-Gm-Features: Ac12FXxpZyw8Ld2p9LAajSUL5_6eX8KJUILwnVdStX61ZrJSSWDRbGJlqECUNUc
Message-ID: <CACRpkdaiRMzBi8cMQDrsqOR+YG6WqECK91Qeu53xitYuP5C4ww@mail.gmail.com>
Subject: Re: [PATCH 4/8] ARM: dts: bcm6846: Add I2C bus block
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022651_205414_24EA9F81 
X-CRM114-Status: GOOD (  19.59  )
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

On Mon, Sep 1, 2025 at 5:49=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 9/1/2025 5:50 AM, Linus Walleij wrote:


> > +             i2c0: i2c@2100 {
> > +                     compatible =3D "brcm,brcmstb-i2c";
>
> Historically the BCA SoCs have byte-sized FIFOs rather than word-sized
> FIFOs which is why the compatible string "brcm,brcmper-i2c" was defined.
> I assume this was changed at some point and this works correctly with
> the "brcm,brcmstb-i2c" compatible string.
>
> Was there any I2C peripheral you could interface with?

Good question!

I have an SFP on I2C and it doesn't connect with either mode of the
I2C, I think because I need pin control for BCA working first :(

I look into the i2c_bcm63xxx.c driver by Prataba Reddy, which
is what at least BCM6846 is using. The register access looks like this:

/* Read the value from given bcm63000 register */
static inline int reg_read(uint32* offset)
{
    int ret;
    ret =3D *offset;
    BCM_LOG_DEBUG(BCM_LOG_ID_I2C, "reg_read: offset =3D %lx, val is %x\n",
                  (long int)offset, ret);
    return ret;
}

/* Write the given value to given bcm63000 register */
static inline void reg_write(uint32* offset, int val)
{
    BCM_LOG_DEBUG(BCM_LOG_ID_I2C, "reg_write: offset =3D %lx; val =3D %x\n"=
,
                  (long int)offset, val);
    *offset =3D val;
}

And those are used like this for the FIFO (read):

        /* Read the data */
        if (fifo_len =3D=3D 8)
        {
            for (j =3D 0; j < xfer_cnt; j++)
                buf[i*fifo_len + j] =3D
                    (u8)reg_read((uint32 *)&i2c_dev->reg_base->DataOut0 + j=
);
        }
        else
        {
            int num_dwords =3D (xfer_cnt)/4;
            int left_over =3D (xfer_cnt)%4;
            int temp_data=3D0;
            for (j =3D 0; j < num_dwords; j++)
            {
#ifdef __LITTLE_ENDIAN
                *((int *)&buf[i*fifo_len + j*4]) =3D
                    reg_read((uint32 *)&i2c_dev->reg_base->DataOut0 + j);
#else
                *((int *)&buf[i*fifo_len + j*4]) =3D
                    swab32(reg_read((uint32
*)&i2c_dev->reg_base->DataOut0 + j));
#endif
            }
            if(left_over)
            {
#ifdef __LITTLE_ENDIAN
                temp_data =3D
                    reg_read((uint32 *)&i2c_dev->reg_base->DataOut0 + j);
#else
                temp_data =3D
                    swab32(reg_read((uint32
*)&i2c_dev->reg_base->DataOut0 + j));
#endif
                memcpy((char*)&buf[i*fifo_len + j*4],
(char*)&temp_data, left_over);

            }

        }

And for write:

        /* Write the data */
        if (fifo_len =3D=3D 8)
        {
            for (j =3D 0; j < xfer_cnt; j++)
                reg_write((uint32 *)&i2c_dev->reg_base->DataIn0 + j,
buf[i * fifo_len + j]);
        }
        else
        {
            int num_dwords =3D (xfer_cnt + 3)/4;
            for (j =3D 0; j < num_dwords; j++)
            {
#ifdef __LITTLE_ENDIAN
                reg_write((uint32 *)&i2c_dev->reg_base->DataIn0 + j,
                          *((int *)&buf[i * fifo_len + j*4]));
#else
                reg_write((uint32 *)&i2c_dev->reg_base->DataIn0 + j,
                          swab32(*((int *)&buf[i * fifo_len + j*4])));
#endif
            }
        }


To me this looks like 32bit access and one byte in the LSB of each
32bit word. But the FIFO data_regsz code in i2c-brcmstb.c is a bit
terse here, which one should I be using?

I guess brcm,brcmper-i2c?

Unfortunately Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
isn't very helpful with this, I can patch it after we conclude this.

Yours,
Linus Walleij

