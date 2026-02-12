Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE8AEB48EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=; b=c+KbSsgiCl5AC6XfhbVEwptov4
	MHbJ13/fl1VKhNANxG0kzKooca2xxPePH4zrwT10CTia0ulDVFLtD3/R+kpQHfGfDZALImotCOEI4
	u16e94YA4q0SEJYKnQ5We2OICFsXz9Os7kB2MC4agSH4HqNewjy8h3Nm13meXQD4M/LbgvZ/FRX+2
	Ja8W96uOSznElSVloHTtpdI1ts/NbkT6ZMTCLqj5QjXx//eamK0I+8cHnXxtMz7j1mXPI5djkM990
	JF5Odc/KznsuGhrO1aOWveIrvpEWPZsXmAWJx0TBSeLOJecjc6il1xj/K29Fx6eeEZALTkitEx52m
	BCaC9dCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqT0M-00000001pix-3oM1;
	Thu, 12 Feb 2026 09:28:58 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqT0K-00000001pic-1100
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:28:57 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-12732e6a123so641550c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770888535; cv=none;
        d=google.com; s=arc-20240605;
        b=jcDMRZmtv9MMKDFqsngsktAFfApd3n7GTKZxuZ0DJvkYHWXPhmjyA7Ee36LDUFoG/H
         D5ZCEaA8yh5ipqvKpz61QArbyNIlqILCcLz7lnisaDBWlBqOOM7Q/vaWDoHAFBcBYWtN
         V4D5lkC01JC+xBxgsHCg9nbagTFasqkRqDlQTGZZlaXKg3FiffNZwdsqZbkqf+sHF/Va
         Q8zIiUoNaBQKHSzVWHfzID7rs/4msIypOMnjuaqhr/G9nop8IXxl+vDUvoooLN+ZOAUw
         d92GmkT3kFfDaC8vhEY1fMmtf16yj9rdbUb+NmeoWcEgnJQwIS7Fnbve3xaw8mYGYGNL
         QZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
        fh=hPKmStvGggTqv463UlLvhJ1a67hPGdmEtjXhLR7RFL0=;
        b=VclnR/SZ0v4cjR75Un4ojkL27BImDGsmHcdFrfjRklbS/mkTdq0D0ITW4lFNcvd2sN
         +uNjRhF6/v49Gldvk05febhkB2nZT3HaCFAVoBJMtPzFSkNYPBpVwTBngKO0dwoxwcUe
         m19ycCYoAnjRQVdhV/g1H0REYt+i39PTbFV5J8TmvHzAg7PBk/IRgKy5qOZ7um9z47G4
         OcQdNcmZGlFUnByeNLNLbvdJoSggGakfS5UKhk23f9SE7ompOHvZR/TcGKDPQTuWhJyd
         SfdqGrmqL1d4+MjeN/hcrmqmhBxpTh8yHIABHQaLqYRRyiPhBSy43zzd3WhG6y6cmYhM
         WtQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770888535; x=1771493335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
        b=ZVHmqREFZaZjo9iCk7t2MsEjF4+DW4sFuevmyMudJMHLIsgwX0ls2xmuc34XueTEIs
         JMmEftaYPaNl388VHbLnZZMbG7IKJ7RNrLUtO26lYlSmIzOmn2WJWjR1iw+6vr2x4I3S
         avAoXCr5oneMI5TZq+Qmgc4Nwbs2gzzRE8wHPOHdY7WBYMYGqC6aXQbVdV49yZngfoiQ
         r+KThtWyMA+Deuuxbao2XbqJkpxBuSdi1b02kCXOCFfS3KE7qtbFOGA15vOyeoXdd5Jv
         EB+Cxxonw61HFhCfKj2KtaZ1AmyE1lEAIiIrFleCAwRyTkagjPf4PRQlO0VYPMLYDZkX
         Zsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888535; x=1771493335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
        b=tG/u1vQKAS8uTnFes096YcGkQifmNY2FP8WNTVl3dWehNzBfNj7NewyRFMbyc6El3l
         9qLLAccE3DDFuyA5CvO5MF8N7d+qIdiyDxaU0GDT8I711BYp8rBrd7Y638Q90XD3tqAi
         pIs0yHHtPkKiwuA7KzzmQve074H4H6Gp6L0eNGcTSVf2qS0FkjLV+zexI9RYLA58azFB
         /fFGsJBcPxhV+tjO8RhvdLbDyXtnGKNelYojPeSVGioGy8Fyy91eYyHDrT+DgaTIFD2R
         GmkqK9wKr+RmarLJ643I08/RARqjUltS9NnxU+MnQXwTwpmS0sfst+70Utl6VeHos6Qg
         Q5tA==
X-Forwarded-Encrypted: i=1; AJvYcCXLMAuBXmDmJF4jNopxJsuBB/1TcfXRADCGNL02RwjXZrhQ2I5lDqDm4+56xQ/zYX8NFINJAIXoW8nX0/ENQ+/z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8FPLqQzrCfGaJvDTbA2ZK7tMboL/5jmyVNihVZpsPs19mWa4/
	bsfYRSbHeeOtWptw4XhCpMjUOKlerhso/Qy0agdANKmjKINQNXf9wS2hhetlZqEhVCG4Z4hHSqh
	B0fAUPkINBSXs2GukV5wsx9sGDjBYddRVSA==
X-Gm-Gg: AZuq6aJ/uOsBiSXgjfU6Pb6cf5CEfmqYpb8KqAg0qFlrhtKaQH3vbKHlEL59l4Qfd4W
	CEtdEgXBfpBZpbeqJYiLTWY2Jkre/sNOu3mD/lnm3KuSY3uHSBwsDskYYL/J1IenW+e2r4ErQ4i
	d5XwbBVfQto4n9tLqQ3+HjJGTGNkTv91zJzZypvT50xDUD1cgW2PIXlbvtDOijkYjQvQnqnLg5w
	f1gjeVzg8iCOWhBm6DniXv20aLGNVD0D+NYoBfTSEf4x6uUok3UvHQIFLM66hjtfGxauWFLlSK2
	xYNZsJzrB2jMrFxq2If5iUAb2+djCSRccqFeIsXSMtaWyTCsy5wuvMOfeAOOj6MhXyV2Gs/m6xK
	84ov1O4zS1pFYUYTZpUse33xqAbQvNgOU
X-Received: by 2002:a05:7022:6081:b0:125:be41:db5b with SMTP id
 a92af1059eb24-1272f780d9cmr917943c88.42.1770888535262; Thu, 12 Feb 2026
 01:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com> <20260211-imx25_dts_simple_warning-v1-2-7b40e1acca27@nxp.com>
In-Reply-To: <20260211-imx25_dts_simple_warning-v1-2-7b40e1acca27@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 11:31:37 +0200
X-Gm-Features: AZwV_QgGMIlcIGcwVtxSix2gOB2fixK07XuT9MDhx5OR9fCA5qKRVtqrGhICOTY
Message-ID: <CAEnQRZBUNOiTBhgypWDjBUYqNv2LBUf33REqKRM-zqnnkwx9TA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Alexander Shiyan <shc_work@mail.ru>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_012856_303299_4747B099 
X-CRM114-Status: UNSURE (   8.07  )
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

On Thu, Feb 12, 2026 at 1:13=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Rename node name uart8250 to serial to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@=
3,200000 (ns8250): $nodename:0: 'uart8250@3,200000' does not match '^serial=
(@.*)?$'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

