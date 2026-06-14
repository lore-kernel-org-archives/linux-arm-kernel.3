Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A5CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfp4pi7JkIVByO98dvYjehm+TU1kIF7zgpppWrfUyxM=; b=bRopEPzIsllLbTxeyiuy6PlKEp
	5upwngcWNoyHgTFZpoKuKxmiSmGkT1pkESlqNZPOMDYzzBa9uLWkUaIibS5Ti4Ext0ujrevyzySxx
	wD13pqWuzC3/tOxCrsfSfpL0xO5MmG5IGr6CkYSYsRbJiBW3kWQrk87W8qzMZP88tgKOeMQKw0XfB
	lkz1GgRsMpAVJY3WcHY0VU6//YgkPOWNuz7m1t8n76WCnOxVgUOJi6vK6C/ImlJOnmqXfOo3lid4k
	bBpxZvGVBSz4GL06oY2Uc8WzS05qHzYMOpMavv6oCkvoqpxZTOo3Br4bJ0Gm8URsf7m8Pw6+YqSYc
	pGR/dqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsdR-0000000DJMR-1hwq;
	Sun, 14 Jun 2026 21:44:53 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsdP-0000000DJM5-1jM4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:44:52 +0000
Received: by mail-qk1-x742.google.com with SMTP id af79cd13be357-91588056619so191626685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 14:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781473489; cv=none;
        d=google.com; s=arc-20240605;
        b=HWXJmTD/3bwSEjiBeRhVHjH0iES1JagwtGMS9Z4DaTIu81aLceAE+MGRK09BklSnzy
         dcignHWQ/4fKbJWLWg1l1u/NHjkmbNJ4BcyZnewe0Q3STPBt3ycOF3wSKL+u7l1EXANJ
         0zbD/4dBcU8jb+AVRRd1J38JHtxY9dq81HKFflPn/zFtWvV4/wAX9vR/zqKdP/C2G+pL
         bGb7/muuYu8Hix9cDFTnd+DnLJNB38liGeBrSVEMYj5KamYlBa8SApcSwIhPuhQtPmiv
         GYDEvutmjXHuaPvnI3G8JALOnQj3SRSCdLiBiPKVwHDRmZVlu2koF/5XN1u8b63He9o7
         omvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfp4pi7JkIVByO98dvYjehm+TU1kIF7zgpppWrfUyxM=;
        fh=vpMALXYmpWXdkPjaJcw7Ch9XNd2YMAIVk9swvXYQ9Yk=;
        b=lECY07HeMwKCRH7cIrqrW2BeeWiK1DWsiYPek79LkI6wJgvCZyLafZiclLviWqLpWy
         MeUc8CTdT+vMrSX8qohmhUOvrm6dFeMlLnAR4k+srRzoztFwLOPDYtimqYyQnY3iMYnh
         LGZ8BqD500I5u2cPLrvCA4+VAjqCwNn1uAZyPS6eVt5PCV2YfgUWAQ6L88rkBDzjTpJ7
         BYWM3MBYgTutmo/gr25vxcyNRs/xU8QWB/hFQtIGkb+/ujycNTdFYJc8Fv4k8iBfwXgm
         TQgzYYiOCcoRYxWvl2VNy0OmG7HTnxSv9Pgr1YGOHjI6s+bfFurV54keSsaHABSPASwe
         wFwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781473489; x=1782078289; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfp4pi7JkIVByO98dvYjehm+TU1kIF7zgpppWrfUyxM=;
        b=J+Z/kHNQOkyTAyQ8m7iSN+CmJXnLv245q7C9t/98YKcjaVMbosSO2suvazCz1/HctE
         26e/DzkoRGvHxLtzmLg/vHgRoziyXcFaYG+DDxJOXQA5EBmkkM3s5Fr8lwIE0Sp8MVf1
         9kTv9QoFedSNYwFMnsYFwCLAYETEPDXHGG6NTf+R6q14FwHfnJunzfetVZDav/cHubC9
         l8AsZkiMmexJy/4SiPbs8lnLvEYF2nXGsIh3ZJHz69RnRiquVEHPdpur4VN50b6+wPdJ
         d4/t3dCfkmcvIIuyNnpdy1cX4mnPGc/PNuKQLJN7a8ZTS/bHm1zwfGLScEwM2gwKnOuQ
         ktbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473489; x=1782078289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jfp4pi7JkIVByO98dvYjehm+TU1kIF7zgpppWrfUyxM=;
        b=rgJumqMDGEXeOaew8H73OOLFVUtcuDCjjtk68rO5G95rt5Si11LnRYEv9FDLxJ5j8c
         9hm/Sqw03ZFbFkWPi4gq8n+G+Tnl+spK6ibqeGX2iDmMVSwn+N5ONFg/KogSb7jhqc6i
         x+g/htFmeKBQ7L3OFenCuJmIpM4/kz37IYuBgjyDGnZYZO6MTJ6XcJvSEW+jYN+ubltB
         RalpkUNoIqBHKunqcizAmi1wKjKOe51wwW+Mh57/+qFeJ5P5KeIuwYSUPPgwSLCWKmI9
         2TF/yhciUa41GTOjPrAUrc/9ysm8rbcBRT2TtYqeGiDV2W6WqxlThCRR8I+euEcdX30f
         lsoA==
X-Gm-Message-State: AOJu0YzI74N/fX3Z/jBJD93Vw0CDgfGgfJ+JYPTly327sQ0T31pHojj7
	6aAjVYnbh+Qbg8kSqGckuUonbY4f0c1nKzAB+3EOUVHtPFx+5XRJa35gNUXBzHtCBRCscJD321+
	fAIaFo4ta1RS0X9SOjQcRAShSjrImv0E=
X-Gm-Gg: Acq92OHZSite9PImeh5D+1XIHJKPRCmcv01F4lO1CpO+7Z3szyHo27WpfKZTJNi2IOh
	blGZtv9wsQcu9D0AsN3r/TNoEJZFE82ekfHt6s1z7xwO19CP04EWxGwJ1wMZ/OGiIwLJ1xcD9p0
	oinPX4RDLeybFyzdnWcYxTAJlYuvhNgA2dIxk6Ik+1bCoEy3vDu8by5e0winCxvJ+WJlHK5/euo
	QMa/qyPzMfL0TsNvCm1OFBZ83b0mtPkSMwaibS3aCcSkDFNTUmwNS5sQrCpOwH/q8O3MwnfYej9
	/uSpf4mfRFcJsOJKen2IwmkXiWzBYRY1sx/kV2Rz8dhTAzozhdAG9B4p1MS5gm+7kLqC
X-Received: by 2002:a05:620a:448b:b0:915:9efe:6dd5 with SMTP id
 af79cd13be357-9161bd64128mr1834791485a.39.1781473489256; Sun, 14 Jun 2026
 14:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260518014920.135011-1-enelsonmoore@gmail.com> <20260614125857.398a0e13@pumpkin>
In-Reply-To: <20260614125857.398a0e13@pumpkin>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 14 Jun 2026 14:44:38 -0700
X-Gm-Features: AVVi8Cf4tnCB2NV2GOy1Plt7K6kpwZUtQU-iBzZg4G2hvwytkLh-Fi1T4bogzNA
Message-ID: <CADkSEUizT2dxUni185QDEkmVA+_r9bEQgbuEbZ8b-Sg3JZWrFA@mail.gmail.com>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Shubham Bansal <illusionist.neo@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_144451_460793_9D8928AF 
X-CRM114-Status: GOOD (  11.73  )
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

Hi, David,

On Sun, Jun 14, 2026 at 4:58=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
> Isn't it more the case that the ldrh/strh instructions were added for arm=
v4.
> Whether the bus supports 16bit accesses is entirely different.

No, it is in fact the bus. While the Risc PC initially shipped with
ARMv3 CPUs, which the kernel no longer supports, it was later upgraded
to an ARMv4 StrongARM CPU. However, its bus was designed for ARMv3
CPUs and has no way to represent a half-word access to memory. This
means that ldrh/strh will execute (because the CPU supports them) but
do not function as intended.

Ethan

