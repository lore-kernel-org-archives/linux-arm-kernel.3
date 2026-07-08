Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B33FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHRAJ8KCEo3kBblosOTrn2Ke4Sb1IqEMIQxw9CoxcGU=; b=tRq9/Oc3zsy5bMLyCMhk+Vso4t
	Hna1vuBSbMlAOwjvH6UqJ0NKDwJ0tSoVYsUxHnLTu1C+9cl09WyvcVpocOP2wBQHbZuSI0wxvwZcD
	ImiZ1pRFaZWe9X9kTPZ7XI3QFs2J3SN+VAeh5jzbswuFWgr5ms/g1WMV8e/PiygTtovgCmLdpMq3d
	EBCtBMkd0Ik8+1y0t4Jnj0m2DwM36Jlg3HoM5wQElAYTL+MBpwy95kAlQG2McGJHCZT2p0ozwTUje
	qxyw/HApH+EmE5Ty83BBGOD4LyRQ7vS00PIyYotNTUKT8ZvJRXT1bsfEikG5ojvbCFMEXCj37veiu
	Kml8QJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVi9-000000002yE-13sF;
	Wed, 08 Jul 2026 17:05:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVi7-000000002xl-0AD2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:05:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c125c082ee2so4687366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783530321; cv=none;
        d=google.com; s=arc-20260327;
        b=irO3gGSzj6bAFIQ1xVRtvPF9HU3BntbM9+a9/JVbMyXT/qSH6eI0EfLAtt1Rx26Q3k
         wSn7O4fHXI+fcM3Pu/gX5g3sLQ+DtNANO/owc1rMmzsG6skh16nrrTgpD7GDRJHP1sUb
         pI5/a9WB4tbXs3JnEKXkaICTE36MDvwHBFBcmf80LtfQRJPXndpUjCiptbA8LwsfGsFy
         Mb+WpFeODeh7fKTy7iJa1OwhxgjPhsjdNo6k/H9HjIbRK2WSxjlNXGFqvqcHO8vvDVld
         kYN32RGf7+J1ASG6EAD5S+i97IUb4zdV8+fonZ2jKo7eGOUyHNfAHlGgBInprbUaBWxS
         HemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pHRAJ8KCEo3kBblosOTrn2Ke4Sb1IqEMIQxw9CoxcGU=;
        fh=2/MMs/KvNsPX176MVuCVHGtWDwj59wrttg2VIOiiY2A=;
        b=iV7TEjTZrEw316l0SkYtVHgeOPawKAwdhNxPMyzluqiAEEUwXmT9Se2s5XCDdy7TG3
         X91eaaexJvgbtnunBjW+TirUeX4RLalzZE3yuTmh19/REsuv51nyk2LJVEAINStIz1Zm
         j9/Xi7ClaUqhOxcRrWUySJ7qkn8wCV5cJMurg7hYhcvUJ2Ohjl72Ddtoy8orIOYQAu5K
         Qyg0mviWVjGVi58QFOIyI97sAt8L3wDZ5ZpXizepQHnENqyRFr+HnrEVOzzVd2WsiTIH
         s71qq+XxCQF77SKCrc1Luc0MVP2VJJ9tLWXtznspBnItXmUgwjbRANRzWbBnNtk7DpFt
         Nuag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783530321; x=1784135121; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pHRAJ8KCEo3kBblosOTrn2Ke4Sb1IqEMIQxw9CoxcGU=;
        b=Qq218JMyzXaqMU8ZJiG7Yo+LdgdKwY1BL+PrqucypbwTLVCrchJDbqZsonnvYb4p8Y
         hvch9jEgEwKiE1T86rYOvUlFKW581A1RHp23bw2DvZHx2an0E5wLkldEsyczg/a7BrkL
         igfv6auv6b8nMGE51nqSOnkPY+H3SK/cWOca3DvGehyzZM0Jg++Z12EYs5gGHBnWf4ej
         AHQF4PrtdR0wgNeqZQTvy0nP/WRZvS8O8icjuCFhO0sK9M63P4E3DcaINzeK6eDJHA1e
         vY7jcZ4UVXeJb8XBm4exqukZczBB93wiyXF1xJ5wMUqUe7shII7412y/9NUcmZIHCuH9
         QDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530321; x=1784135121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHRAJ8KCEo3kBblosOTrn2Ke4Sb1IqEMIQxw9CoxcGU=;
        b=L2yY+xpkLK1QOyOpzTIMJEd4kZuz6Dt4TrxQLe/e3Yjl1mO8RiDXRMKOEkFMq0O1+N
         jBd+CoS/CsIhNWf8ZC/6exmUziwuCahmMcxPYuG7YeaWYKGo0e+bulSvKXdDktZnaMEV
         JfFhJojdvzU+iNpUb34b/t8QMB1zOqudt5TnNeuk5V21aozaxJq15x0B6huBnYuZW5Kx
         Zzn349FSAL9pHrNRGbO5dwpzdGT8MZA7cK70/wRKwSfsbN0UNRd7CmyvKZMOt6mAEcRT
         3DlwmLSMRf9SG1TQ7L5mUphANFtLY1+dLYnZufFmt5byKSelFDQp84u/TAmfD5DfAaTK
         5Drg==
X-Forwarded-Encrypted: i=1; AHgh+Rqytn1FAewgPKwdgI4TsEodySCfaTUsT+HkLN1vmqbKjYZMKnHmv9Ya3jM5w5rxTu7P/jzN3IdIYTo3z7+sRDLZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxwsAk+unPN2Q/wsbtpMaUfjtHRBs5XaRXqLNSsgKGT7q8Lj/oA
	jrjTjxXckVNLWfIxlvUcVn88dJxd2+wwd6sB4AMLJ4HPGZcp3nHTVY8zdUnUi5YRIy7iFcYAsyL
	hl0E7zKbfTILSuRd2oVkOty+RWVjPDxCjh19U/aNtog==
X-Gm-Gg: AfdE7clPQ/n/zuUl8JI7tJwsH6iLGpqmC/rW4o+88mG2GUgDRMPBvTpmHptCwIPc2O5
	xWtHwcRAEc+mFeWu4+RKFeyHxvTN0Tu5ps/dA09R1OS9LAqNjsHEhNkpIWLwS4rW/hpYfSs/hOi
	7wRAo9fUrkGZWeDGWnL4RfNqY73NKxY8sJZKHTDidQO+9AJmYGhICIlhjBNHYRTkz7AZZ9UxQCA
	oLVwfZ72INdcKCMOjTxmq6iJ/O6gH3rdQGNkoYcMSOVnVIc7+AXAACcdJtg/Niz97xdCJR7U5Rh
	/jWAH0i40avwOGhOnBHg8SqwvEtB1oIQww5X+Q6w7JL1YcKiQhIUvFLYPlrnPQ==
X-Received: by 2002:a17:906:4fc5:b0:c12:d971:1c1d with SMTP id
 a640c23a62f3a-c15ce0ee72cmr168212366b.45.1783530320904; Wed, 08 Jul 2026
 10:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260708165201.624271-1-robert.marko@sartura.hr>
 <20260708165201.624271-3-robert.marko@sartura.hr> <20260708-guide-outing-b471d0dc92c9@spud>
In-Reply-To: <20260708-guide-outing-b471d0dc92c9@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 8 Jul 2026 19:05:09 +0200
X-Gm-Features: AVVi8Cdu_ypWhE5d2JkOMVlQ29SNXhJeaUvRunEjCDsT2tHn5OyCd62kkjaC3iM
Message-ID: <CA+HBbNHceio1GXxsua0L7CUbm2YxaTDE9A2H=cZ-0r2GYP2CUg@mail.gmail.com>
Subject: Re: [PATCH 3/4] spi: atmel-quadspi: add LAN969x QSPI support
To: Conor Dooley <conor@kernel.org>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, robh@kernel.org, 
	krzk+dt@kernel.org, broonie@kernel.org, alexandre.belloni@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100523_104095_3ADB01F5 
X-CRM114-Status: GOOD (  14.62  )
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

On Wed, Jul 8, 2026 at 7:02=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Jul 08, 2026 at 06:51:10PM +0200, Robert Marko wrote:
> > Microchip LAN969x has two QSPI controllers based on SAMA7G5 QSPI.
> >
> > It requires pad calibration, supports DMA, and supports 100 MHz operati=
on.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> > @@ -1708,7 +1769,10 @@ static const struct of_device_id atmel_qspi_dt_i=
ds[] =3D {
> >               .compatible =3D "microchip,sama7d65-qspi",
> >               .data =3D &atmel_sama7d65_qspi_caps,
> >       },
> > -
> > +     {
> > +             .compatible =3D "microchip,lan9691-qspi",
>
> Where is this compatible string documented?

Ugh,
I managed to somehow forget to export and send the dt-bindings patch as wel=
l.

Sorry for that, will respin for v2 tomorrow.

Regards,
Robert

>
> > +             .data =3D &atmel_lan969x_qspi_caps,
> > +     },
> >
> >       { /* sentinel */ }
> >  };
> > --
> > 2.55.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

