Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040A71049514
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=; b=iLjmZnd11HaVSi0U7pXpZi6fMP
	7NxmgQyQ5uIZ6FPYfhgMXHv5L2K01y/spfbssclM5gKJ2aqEufA+DYWGjdx8vT70F5NwlOJ5JDe4q
	kyuxUDv2oLPkieqhgXyJgoM9qxGsH2n3hVmm04l5LcUCZKwk08ljVKP8MG5T6y1K+RPjwX8Dy2oHR
	sSI6dtTkTVUIKnRagSLlyJa9zWaz+loTZqgr9knN2tMVr9Zyn3mIRsk4lnChKGadnkOgQsOEtnJud
	hrSxve9gRSHrm6TrDoGXyURqstCHQMnnTzovvFhB2eSg0U7L70BqG2wutL25MZ/271DOfbBlDAxhB
	Ui52vNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FnS-0000000BGi7-3mCa;
	Wed, 11 Mar 2026 09:24:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FnR-0000000BGhU-36zs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=; b=pXZhn8dVSv4uJonJPrze1cr3to
	ExfTpIJKxhCtuASmeDN7w2Y7xsu5j19GOuoy15SNMvGU1v47ogE4h11A9qP9aCYY8eLcnKTvDtGy+
	QW+QQgOVAAFT3N20C1XSU8CraUxOi9Mbsv1SODQetNzq3AyRHcsNUci1/pzLBX5L8hiIOS/63ACd0
	gFBGdU5B1XbLc9yAIa19JcHRu+azNJbKF6nqC2by/BiX9GiCNu3+tdKTmuscS+WLJppLYhavtzK7Q
	ZG7K1DCEf0sJwwQEwK7eNy4bFCghcHY7vxLOzmdMqaAgQ3gnXsuINTh1IqfziIrSEsPtAppWWwoR4
	YTJrisag==;
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FnO-0000000GXU2-37WS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:24:04 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8cd8d97aa2eso371159985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773221040; cv=none;
        d=google.com; s=arc-20240605;
        b=Atx16LTF+HTe9g+tmr5Ghm6rjeHQtkR9I1WS+tifGPuahcV4A7nIFwB2qOUVcIE+xS
         3TsjyvNGv9hgBWkMX608DBYU0paLQNBRQRlQuwG076jxrv2mlN0xYsVi4XQA1p/VVKeC
         jKSW62pLulX1SCvpLl6HdWrsViO/vHgmARPifEIAQ6vcLm4JSX8Q3UoLd+Hfn6ie7Pty
         QnhMiibvJjKMRimd216qIrcuAmvCeNaU5um2gnnNmqGW6r6BOngdAT+a2gPaUkywmoWL
         gJRhFphspZVnQYvXGqfYX9qc1TQqPbe011DDltmzLrV6f0v/kSb9Z34LN3fIYTiepiWt
         2SyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=;
        fh=T+b/gi3Vwajdtk5XgF/xzbeSkDSj+Nvm5+WcqF0ZVMA=;
        b=ZIySzGd0U1EkEaEL14FxJHS0Af0ha4xP0tYyrZ2Srv9Q9qy1Y4Mqj+ku6gtaigctJL
         8xM0dxkVdXtJ6xh37CS4CCbMgmYMiRiLLhBAlacaeEKsZR4DatgorZ7HvBz6XSfC/tda
         YL1bbZNHmCZAL+A8/DgYC3KI11ku3WAO+AraGxrNNUY91vAHgXuFDkw+r7c25nFP+r4S
         voApBXbH4187GSIMoVgeaaTHqUm3+xtDNoyVjFyo/VTmi3Gj4MlXkL6mbaeitNcCCu8j
         gAziHrvgK3bQr+fhe28hLJj2kTfk7yyzXG7UaK28L4Cfft6lXYHPAMtaXxkA+sQbDP8n
         QiZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773221040; x=1773825840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=;
        b=NAWiMJn6c9Pymu+PQGuXXqKBnZkQ/HgPGNvdbxCqKdvsbXyA/4FWBRwRq5nubCcnfm
         fCtW/3rxugESEFvp7IBc7r+ZSAn4ZjgKJregj6N64GHtubD4dQi7FKR3zg+nVeG0zrHU
         KeGUV5/m1pcFIvgVor8/h7PjALJOcGlUtafrIE5rlmh4lTJvllDjv0aIQ585oOizqZg7
         rr+BU8vuMm2fqxGUDh+QJionnYZhGFL8socVUogFJkPe43X8tlwhdB7vslVekm18QQXM
         e3A7qcO6Mnv1p6XsmolAn3s5LE1wG6NGvifsP7o6mVKcGnmanU0ZnG3fW1unv4SID9ww
         MjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773221040; x=1773825840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=;
        b=FApz9dR7dioy0PREGMj75/MDfByC/7J0I+l8w4HBa4J3bP7O15VRZzV/KGt8uD+fRA
         vVUss3LktF0ohre+1CEJZjBFNG/Re77JeWOoJVz6tm14yRGcUFYF5OWtEKQUHyr4K/QF
         qXWHYExFtDDbfce/087Y4F3lgTptF1HW+Qln0Q4nCU7AItWoOUacPpB83VI+2klLv62w
         LzM4SBKNtutMb5HPSd4azZxfp7jZ0mzpRPJe6PIqsCUBVFGdQiQo7mWkiBM1rweDeuqi
         CcmfCAXV7a5auRmWYi+W0KrBMnyvyG7tLvrzDzi8HPBw/rLtzz43DW/gbXL5H6vmh+Sg
         bbUw==
X-Forwarded-Encrypted: i=1; AJvYcCVgGrdhnHg/Hwo4fMNQM8O3ktXzVC4PI4QTK6xoUGm/xbg7k9AIV5obc2bxgljveNDSjsJcsUE2PqDlxpscHbXy@lists.infradead.org
X-Gm-Message-State: AOJu0YysJt572XM7ML7tv5x16Xml8XWUUC5o359lVMe6YxABSpSEbwUs
	2ID77UJXleQWFSCdM12gYjZVTnNxpD5l+FSMnu74IA9XyZpTy8DRVELMO+U/UQmofvRbNHMBxno
	Jg0ZC2gkPmZjvZXNT59kEXgnWwVXLcgY=
X-Gm-Gg: ATEYQzwoZXfzEbIwvqEu4jmK+haFSaFli+gwTkvO7PzHBn07/SGTWcMypJAiOyCFpTr
	c5+DCU9X1LVdbmCJ5+tz3ZTkpvXJk54UicsPcmRksbTBH4Rg1BV369ITAhNgkZhib6wih+37ssK
	/g8tD9Txt90kD5FWMC0kZq20PA2s2dTMRE2O1g0FUHuCBINSWDkjiotTGNDISXgu8zvdJ65H/Lc
	ciGXU3n731f8za8UC+7W/W+h/xuepuXKA6UheFxqz0w6V/EjyCeq7DZrIqj/wyaQ8D+NYkS37yU
	C59UshXq3tdnPY/3RSvzrQ==
X-Received: by 2002:a05:622a:1193:b0:509:2a00:4283 with SMTP id
 d75a77b69052e-5093a1dbd17mr21113261cf.75.1773221040321; Wed, 11 Mar 2026
 02:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260310005230.4001904-2-ed.tsai@mediatek.com> <20260310005230.4001904-4-ed.tsai@mediatek.com>
In-Reply-To: <20260310005230.4001904-4-ed.tsai@mediatek.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 11 Mar 2026 20:23:48 +1100
X-Gm-Features: AaiRm51_8cV-ZC96Wbr95oK6RdVpyL1SwORArnS0Chyc1w1UnqmozKo680oVYNs
Message-ID: <CAGRGNgV1jcBGoUzksRMANzm2Ae130zoN2HovqHkKe0Wp-P6J5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ufs: core: Add quirks for VCC ramp-up delay
To: ed.tsai@mediatek.com
Cc: bvanassche@acm.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092402_844104_D3FC7A59 
X-CRM114-Status: GOOD (  10.13  )
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

Hi Ed,

On Tue, Mar 10, 2026 at 11:55=E2=80=AFAM <ed.tsai@mediatek.com> wrote:
>
> From: Ed Tsai <ed.tsai@mediatek.com>
>
> On some platforms, the VCC regulator has a slow ramp-up time. Add a
> delay after enabling VCC to ensure voltage has fully stabilized before
> we enable the clocks.

I believe the regulator core has support for ramp delays and settling
time and all that sort of thing on regulators, so why isn't this just
some settings in the affected device's devicetree?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

