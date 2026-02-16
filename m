Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7794AE63F1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 06:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OLaxPGmMOUlM+H5QGZLEwi3fIBF1FV98gq1aRG1ib4=; b=GDQx1/A991AlaAU3Bg/RLkkh4A
	t07JEH7djl86Y4tzaIh/TMDnbFDjfKfo6lspmVmYEGzWLbcTz+EecfCLYgbgO3n1xcInsCCGIczON
	40gnxX59w5nA+S7CqYg9C8AfmiXGKNOGnApDX2EoFH9w9Ky8v7jHcix1PBLpn5SBQUBggfE0LCi4V
	ufJmGtjCb/lS+TqBdMPVWp1i2cRIAj3ZS90lIKHWYoXlEqk63eGTYNoNa2nr74IWt/Vefdx47eXIQ
	nNdKsxXKgfNfFriLMdHFPI+PUS7F0LxfZZyqTYLWCuvoEGEQnNaivxpP5pjHUglwNobMxzsi8H280
	RFPGfctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrt3-000000061IJ-0iaR;
	Mon, 16 Feb 2026 06:15:13 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrt0-000000061HT-2f9l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 06:15:11 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-649ba337157so120174d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 22:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771222509; cv=none;
        d=google.com; s=arc-20240605;
        b=OL4HxCCzjrk7f2rS7zgrK5+PwaT5uc4R6MUMpSO9AqElrBqc+gnvO32KslbrKUipfe
         F6laR6+QBmv40hdtr133Ut1Sbqq/clK+JfuJ33dcjimnAM70C3UsHngebRla51pmqBxP
         3cUD/S/Kq+3427uCU6DKlx2gqP4D/7sENpsTIBCZAueLNU9mFo/wVReZ/LpXYMWc7ZBH
         W2BYsEVN/nMrdyV4bjnJe/KCwvacuqaIVewaHSwT5G7HrrtfqmK1CpmQYGHqnJwKjBvl
         xPQlsPqMd/wRrvWfu7ys8AiJ7dfJqj0+lvm1x3bk7odIChhbCUS8Ucyxwb7DcZcNfu6U
         hMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7OLaxPGmMOUlM+H5QGZLEwi3fIBF1FV98gq1aRG1ib4=;
        fh=AUYmH5tjHjGsI4NRfR5s5JUCu6B3z9hKJezYi4KarnI=;
        b=lz5nGPJXiK4ljJkhdDp/qfyEvdmyRYevJPjigV6tE6mffzLqjpazqQbA6xZRcKuyvJ
         gFyELUud1liXin38DofILlY95N6obElLvZYZ7VRocoyytPZWKSbVp1u4sy9A/fOR63dK
         4X0jzE5X94R+LBhh0ccmaZstxRbgAbgCVWX/9FprVIwvs8UGF6YQueZYIS+vZztX7EWL
         47KGzyoRd2hgSqvEo9ZXr+W9e1D1lQ6id8uvyA8dEZjJwDHjaUFW63RgVd6Lb+Y6YX2r
         RHtZhGadQdfDPzidvecqwg7Xw14o/UzX/goecVrXVM/Da3sZcJ8mruVufm9nf0Rq2pVB
         bjGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771222509; x=1771827309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OLaxPGmMOUlM+H5QGZLEwi3fIBF1FV98gq1aRG1ib4=;
        b=du2F3FO2kafm2Q+U+ykUVdZjqIQaCi/Mg1w+IZo6Ae0wvqcXg7FIiJuJNjR9Zaqfjc
         tfGX+/wupIk/W9AqnQJYiyDt57z/cR6+UPM2kwyWt9c8IGGBngv48IZnrjdF+XMvUlgg
         dZTr5uLgqxi/tVq2Z5gqp9VdS6Rt8wXgb/oeM5pZbz6pGL2x1tvEw+BDJ08i6l3T4KCu
         SHiNzJ9nCo3zd5bKGkxqMkn3xzldFdSzHcjpBIbUSxkLvYWahYLtm2vh2nSmbugEkC3n
         mhr8/pwsVdJTq5poWWCDgBWiK1puaXTcxq+QUQ8yTTOYymUAHfG2Ec5E5Sn/oNqHL/wb
         8cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771222509; x=1771827309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OLaxPGmMOUlM+H5QGZLEwi3fIBF1FV98gq1aRG1ib4=;
        b=KFH7uU1k9V5iNBtOL/IuMZZI1Xm9a7aKKr7rS3su76grN+CKIanRZY6ZKyBVHJ0wZ7
         ZQj9qsK3G4Du8kGjqiUX62m1V+R8SMjeCsziQvURzIig/k1i4yebKJo4+6KlDdqUJTmg
         TW+rYHb8yP5ogc9GUfrYyz7NzBuo0uKEdSMN8Zw7uUUhYiw5VZgnz9W7zZyHr3Cc0/ev
         pIFTdYfaiNVR0cIkgoqBlL3pdbCNXw8t1KFOYODGdaRA9dxIc8MXqdOure9Szs8gUDX/
         r26Eys+xWF7m7ljwOVRmQfuF60/EcYvgSBEuDbd5qh9JVd8VXHbSmjyj6bnTIZHDUH08
         KtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4wx8uP6WlcXTLm5oH3bPAihhJJGai5+V7Ds2AzGsQpRSX70eF2O9oQB/ehFf9xsDWe8SR6B5WtS8vHdk5Zifi@lists.infradead.org
X-Gm-Message-State: AOJu0YzrcszNcIsYhECSk5CW5NGBmu3uCH0Eu+sYn7bC19OEW7jXkafy
	K/7CDfXqRK3sWFSNidCxIhVBND1akhp1QP+z2ROpgpptfTi6mO6D/dmqngNV+cc4nmyNrrPan05
	KkkBNJSc6VGUhrba2sso6KL+YJhcJ549bUTSW
X-Gm-Gg: AZuq6aITPxbqa1pO9J46wXQ+5zyCwRi79aZOd6S8XTGrARtMkTgWWLlocpX41gbj8PY
	uC399GJDygPdq2gJV/JuLd/JE5klGrxmwZAhokSOFsT+vr1wIu/Yoc1gMfC9JmwxuehfePtIt0U
	t0X5JnHEPEGWBdk52qc+8J2sMfXok8+iHL6mrWZlDeUgu8iDju0eGAesAqM2CxJfOV8uUS/nl21
	OF5FbdKg+x3J+1VgxpzyXuXOCVVCCIg2AtT/DW+Jtwxjl+xgFK/yc512N/W5ADgoUuPKaspeNUJ
	e+9a
X-Received: by 2002:a05:690e:688:b0:649:af59:a1c4 with SMTP id
 956f58d0204a3-64c14b2f43cmr5633576d50.2.1771222509351; Sun, 15 Feb 2026
 22:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20260215124125.465162-2-thorsten.blum@linux.dev>
 <CAFXKEHbCrp57ruvCF2TXXcnoJF93Z5bdUd7Nt5WtM9_abtc66w@mail.gmail.com> <2E9C85C9-AD05-4BB3-A945-5ADECCB5C7E4@linux.dev>
In-Reply-To: <2E9C85C9-AD05-4BB3-A945-5ADECCB5C7E4@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Mon, 16 Feb 2026 07:14:33 +0100
X-Gm-Features: AZwV_QhV-rE-2L6EhZdu8wVKACqD128xWZDEOzyJLFfwFvFndTo9tJvFuP2QOSc
Message-ID: <CAFXKEHb+D__WYugjdbqUSSnubfsOeibfH-Q33eJGjG3kvfndwg@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix OTP sysfs read and error handling
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	stable@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_221510_689188_9B13D61E 
X-CRM114-Status: GOOD (  25.48  )
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

Hi Thorsten,

On Sun, Feb 15, 2026 at 10:48=E2=80=AFPM Thorsten Blum <thorsten.blum@linux=
.dev> wrote:
>
> On 15. Feb 2026, at 22:09, Lothar Rubusch wrote:
> > I tried to verify your patch on hardware today, unfortunately it did
> > not work for me.
> >
> > My setup works with current atsha204a module in the below described way=
. When
> > trying to dump the OTP zone on exactly the same hardware with a patched=
 module,
> > it only prints '0' and nothing more, see below.
> >
> > [...]
>
> Hi Lothar,
>
> thank you for your feedback. I made a small mistake in the return value
> where I forgot to add the previous length 'len'. Sorry about that!
>
> Unfortunately, I don't have the hardware right now to test this - could
> you try if it works with the following change?
>
> Thanks,
> Thorsten
>
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204=
a.c
> index 793c8d739a0a..431672517dba 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -134,7 +134,7 @@ static ssize_t otp_show(struct device *dev,
>
>         for (i =3D 0; i < OTP_ZONE_SIZE; i++)
>                 len +=3D sysfs_emit_at(buf, len, "%02X", otp[i]);
> -       return sysfs_emit_at(buf, len, "\n");
> +       return len + sysfs_emit_at(buf, len, "\n");
> }
> static DEVICE_ATTR_RO(otp);
>

This would work. I'd squash this fixup together with the proposed
patch and resubmit
a fixed version.

8<-------------------------------------------------------------->8
root@dut02:~/atsha204a-modif# insmod atmel-i2c.ko
root@dut02:~/atsha204a-modif# insmod atmel-sha204a.ko
root@dut02:~/atsha204a-modif# cat /sys/bus/i2c/devices/1-0064/atsha204a/otp
0001ED86032D0002154C033750FFFFFF20B0F703DB0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF=
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
8<-------------------------------------------------------------->8

Best,
L

