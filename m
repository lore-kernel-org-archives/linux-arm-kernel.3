Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829EFCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 06:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=; b=BAGwSf8j3zN1wgE//ArYgzK57z
	eQjWQ8hWdlt5N36PoSM+cgsaSHExwfXVLd0Ded9lY1Tyms98qdxRbZYecleoQxnpL0oaW3h3INf3X
	RIwq7MBo8MMfLpR6Jv9TRJLzYjAGvwIj1TiFO6ZRLkSOZyLWbtiWtNBb1JEejMLhnTB+8+FntmdYX
	Tkw5bpzbBvPEzUOtT10AcfuRvwsU1Xxm+G//FRJ4Mj+i/MUn0eobRXY6V5vjbsfGqx1UOl9S+jW+t
	9kUK7plNQfNYEpgmnGrIydEPVs2yuBjuNgPhKdfMdjSmLKkcSuueG0dPfKWzYfJS47bRjiKpd1DAr
	xt4TW7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEoO-00000005kjG-3cpC;
	Fri, 08 May 2026 06:35:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEoL-00000005kib-2qqH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 06:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=; b=qx3RISY7hHjRnVjgGGmdShu+wd
	aYuwANavVH2rmNN7Yeqcq8LgCk2w9NLD8iZqC54zyey6+fncJHSGBIy1f9i7a54SOtOldHMSJQmXB
	w7uUdA5ufZ1893PPZNVl8BYwi8FUHMZfd1a27egy6uVEsG+4uopCteWzeVq2Q6eRytHpPR+tZdk03
	DjUq8Egcfq+kgOHPSq1fG6X2+L/SSCte+jLMtuTBuKHhJYsRuPGWwvmFsgAFdKsUZK83sy2ug06bv
	Xf/+ZHQJXm2h67Cf5T6tc7E9EUfzLbNhFUqW6FjXgyYSdY4I909nRqORDiH5pq5Tmz6dE2Lo7HVRi
	NBEzi3Iw==;
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEoG-00000005Tl5-2cpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 06:35:44 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-130c653cce4so4748417c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 23:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778222138; cv=none;
        d=google.com; s=arc-20240605;
        b=i8muKvRcxJKI9M2kTOLi1LUA0DSzEgqivbi0ONkhynaZSJLyTFdSuYkuJlTQ+mwKKh
         +j+ipMpJhZQrdigwgiwyjEmwkkiHjjkq3ZgXhpojL/1fOtmBpAnFRsDwHM0DZ+ylCERd
         87UeU4ynEr+kXCtGQUqRnUcQ0vevVWMiUi8sovZK0ILRmAq6aIldvvmhmNI+VWCMXqBs
         ee+Ans43Srg7473dhRtN8WaFqjqrMJU8bh4u9652Nbd3N7sfhuOb16hkrE715dqlu25g
         RCly5efiB+eX9nGQ1cIRPgJRJjKmAGtlvcvRApHswFuryM0pBUb9y3CHT4nd2QP79lwx
         dEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        fh=G9oFfFnSVI2qxgOIa94Hn+dkTPg/yPpY5vljQ4qKOdo=;
        b=cPoEZFLofWzzkz9D/CV7jdAWoQhp2EG7ndMWTtEkjKZ97tg+xpfj+leWEr3M/3shB5
         i7pxkqAW6Fln27SGCFroWEC42n5L0BYg0mnKaMeXhBXXy0NBAhDZzZ8ZX4SwzOKG1gC5
         FESmZNu3TBJlC912DjZ6n+74J+ntKOFqw33KtFOt6q5zonZT/703vGXpWQDvqjYLEOlG
         +rcPYXMfgbWJ9s5klrhtLwglEPDmmXJywxtxb2K9bToaiz9xf+rdwc6XGNnM0tCeywtX
         DPVOwsxV9pMbeU2IV3/ct9XJ1DRYLhXIRwaqGNJ/phgNa+BgUEWC21bEiOTv8/0LELLM
         gMLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778222138; x=1778826938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        b=diOxccO6W9RvHxSdqCiPqL6CxrcM5Wx1mHWiZPa4dly8zAJoDPc6XSuvbyyHxCLQrv
         WZB9mX/zO2xrnq0ZRGUuJY5K0Vyh16Cfdl4wMjkUMme7jHwhNJdYL09xuvpTPdzehukG
         fM7/HTYGurXZq2YyMxwlT/bj9e3O8hxGjNp1qMhEqRMsVQUAjQSZTl/Wzv5gXk5XEhNh
         jHGPSFSCa2TzAYDRrwSZQYhkQyfKa0SEOxiFpN7UsfPxclaCjrG4ZJwMsJow2STh/2/+
         Q8o9M1NNNQeEdi+J4zZ5NjCdoD7Am9/ipiBNUc51zRD4VWiV80hmyhVtbvO70QJ+3Ah0
         d9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778222138; x=1778826938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        b=tR/RnuP9l3y2qFHaN2MzZ4CJhUnGDn56zWc8CURK2pGOf9jn+Lq+2cR3HyuTGi7dDW
         xSOnMJJSAc5Y2xPkDcAT0pNuS/UJxKycUuPijxLnA+hDKln4bOWquyhp1GOF0dQXFTeL
         Xk5bg1MLbWLA3PqdRzbAsrRrOPK5k8HchoJCQMY4brSnE4AQS3ibNn+6WsyCq3n/TCk6
         ycMmIu36Zfl4h7jQDbHfOaq48ach/jTNYbZPYRcT87NbAs7uhi6SbPZXGBZx9LlIRJDn
         zZkB01SIp2udbwxK2ZanB46n9puZUyhlISJylbypANqRyV/DPuIdoxWaHOiEYDOHVY7d
         RdLA==
X-Forwarded-Encrypted: i=1; AFNElJ/AnHnOIiN+HrGvb4JT1oPPgcAvh2/xbdoaSJeVuwwtUmXDlzLw0qp1XXZTdZ+ihpogFm1xtfYz16IIjjd3h8vV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4PI+WJ7ppYV3KQMqSMSt772ZyQxi9m3CxoGfseb6FurKCzIJj
	4oT4/b+wyYkoudOSWnwXo8woaooUB2oIQIkigpTQpqJOJlgbyQQXOrGe7vfcwcf/Oi21wd8vUn5
	A7uSRTb42A73E3GNM9+O6g6zboClPH9w=
X-Gm-Gg: AeBDieuH7Oli9ZvSKB3mj9vrpTBRxfvoBVNB8AX48/pg8+X6NCCfYQhzK65JsHzX5G6
	fj7rYeoziJUGtXgDNMKwoF8SOOiQmC9eoaUfDHtqrmGbGcRyaZ8xOXx+bNfMztpCiNEvqShx8z9
	pJNO3DCBdc54gm3PIThJRfRi1DY74cRuB9mg/PTwahKEHe9ljnwSw9TY0MOCYfW7MlAtuWIO9vt
	NNgZeC990h2RgwAKDwa+OTjQMJHLD0fjwUdanNaKA1wV//fpwjNjlZ6FCBNsXc8jETtn/vLqsJY
	USqT
X-Received: by 2002:a05:7022:458c:b0:130:68a1:a235 with SMTP id
 a92af1059eb24-1319cd28b14mr5907466c88.27.1778222138006; Thu, 07 May 2026
 23:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260508042724.1719688-1-rosenp@gmail.com>
In-Reply-To: <20260508042724.1719688-1-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 May 2026 08:35:25 +0200
X-Gm-Features: AVHnY4I2qz6ZfLEbNWMvqoeN4VgOUktVtsN6fAD2YG5vKdnwfzStpYrnkcS9vyI
Message-ID: <CAMhs-H-mqXXjnj68gHU5uZheCq0u89awLY7gYK8t=c5KzPtzUg@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: mt7621: add missing __iomem
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chuanhong Guo <gch981213@gmail.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_073542_051702_52EB4E18 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, May 8, 2026 at 6:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> raw_readl and writel calls expect pointers annotated with __iomem.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel=
.com/
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1"=
)
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

