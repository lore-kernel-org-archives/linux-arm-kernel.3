Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C74F51405
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=; b=W5q3vn5siY/56BHyOEhj0QqZ+U
	AuMZ5TYjnO9GXzo0CL63piBVnO+J0vwkUSXS+eaFylImA8+uG21ZcuWljz2IyxGeHWaq1tfuRc+V/
	XJ+iHBGrT1VbFR9VRA14eDaUzJ6a7ts0fzwzrxt3sLG2ECsUFkKcWXkmHSNU5avlJGUVJkjyQocA8
	SX+62ZZUPqc3yQfAmQBBldrH7kcM1ESTSMwz67eJHhk0Ax5nNAaSWnnNCGPhgeEwly7r9+9QHdo9c
	X2t4TTC7gzp4/rSP86I3odRirGPlNAh8jqKx05SsiLMvvnDY0ImTYlOTF0Ug6RhC8waH6+LKxBsJD
	t6hxV7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOXG-0000000351P-0JZC;
	Fri, 06 Mar 2026 06:19:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOXD-0000000350V-471N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:19:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b9381e78a31so1156734866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 22:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772777978; cv=none;
        d=google.com; s=arc-20240605;
        b=JS9AO+SRdH/nzsVohjRysktNJ8fhxhrO57quIkHlXdAVkzJUp2MFvi0aLZX0Dygu3L
         7oQKM8fov2Qf2h91susrwLeHn4okA6W6uLNFzFERgXQ/p4o5Cp83cqOCf1Q6BnnM5Tyx
         P+w4fQ+BIemt/1B6h9/V57+kEveK3tPsyYft9pejEvR91vzyklSVeItIFZtFS4y1s7gp
         xRxRT4OQL/nXJSEd05w/1nmVNNYjTmvdzb1Vg61X5+9s1siP/30NTg8OyJOlo3UDEdOp
         EljfwFVTddGzH0F+3LS8TlUidtL9M6UWplDlwhZqdx8EnxlJtjtWRdgzzVPymTq/jZJQ
         7zpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        fh=9MExODfkHxyjfJYfkXyviBd9WkOUpPAHoC2bTZ6IS1E=;
        b=jpDOLEAw5oNkR1NZPlNu3TrPULke2gtnsGZQwuot8kXzKYhs3N6+4nQIm6z/Ovio4n
         u0MVMBzTCEtkw7VgYtPlc1L6Zq0SrSlk2c1w0PDuiHs8rH1fYC0MtaTzLv/O44u9Hnys
         2fini8EZsqpewplGymYPgHoFfNYEfh+b9JCKRLZjbr6fNQ1Sjhfq3qyOBXKKovBIVgDy
         hD6s/Mof/RannW5pLMjjWOkqtQkBgfqdndMVXp7xOIM73EYhzefcqIu0SDMS/IpL2qFD
         SYHJCeLJXjWe7/4uh7pOciIJjSU2XL4l39pMWCgYHkR0BiKhUu/s/iUXsikhSZGZC3ex
         /xyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772777978; x=1773382778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        b=Cq3NkwfdYYcCpA/DAnB+YhBHN3YBo/pl5tiQonjAg/UfGKVmx1YohfDQeS+toKuJ7d
         e2Aur7WNSKEcvKoAAw2FOgq0ZbGP5s6F4zpzFb8TkOxbO4YLtYyW6Y7x/ojepouPOhXT
         ydSrguu1BVPP4mUIYznDpE3GEFZ+wJxwsUyrZIofUij9+oBuO3PXsZfnrt+LndejHexA
         //BJtVBrX/uBcGWnmXSP5sRtnBFIIcs2Bxq/AoAGqVu0v+f6z0TIFQMiOqxPYlDA5jee
         pNqI5tPOpockUpYeE37AoKJBM9E1eJoFhobIrWqEAYsMK5PqCXzNyVBIGOsN2/jPgzqX
         ujcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777978; x=1773382778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0VGWiHF08Hb/LHLPzScyeOvbLZVakbt6uUzSBkPJkk=;
        b=JbnLFHC/AkAleuGK/ld/1gs6YEjs5FYjElwNj/fCvoKvvson7CA9PBML96bNzBNm5F
         kISwRQebf/5wX/x6Hv/MKMwGlzlvnRE13Hm9poyiWtWy1NH/atAZdl0YloDxyCHyrHbH
         iYm6qSVCoKC0O4RJfYY/aOwLLev6n+6nJYtgat73adjbOcFWqKL80LvzkoGC5O3Fpm0a
         oae1+MZlUV8pE639NNX/WKIR3kYvTgrwbYwxPwtSQm97zEf+Nj7GfamqkkH5YjjXmvRB
         YvKYKt2DLZZVVR+jZLLsyQ7vIQiXZ+piQz1wjGZnPrjhLeQ7M9HP5Dyd/eKOPTirqkwm
         mchg==
X-Forwarded-Encrypted: i=1; AJvYcCVkdS+xN5HUJARKtMz930p2ENLFi/tEkF+uCOX24KXhPvS/r+xOTEq6etK9P+QYBzcTIKbCTtVjJ9TgqmqTnkhz@lists.infradead.org
X-Gm-Message-State: AOJu0YwgrknHsZCS079Llz3EhJwG/C8j9KpVZ7Sirpt56LNJpmCBMzmZ
	owTMKS8ssEkKAP6eNX9Te7EnqYE5K88XwZnkDuyTtPNWZUzLmeO1bHvsMGmNVzwS6xXgeFS4MYX
	6xljm94zAjpzH2EVN4dt2S2htbBrcnvjzN96B
X-Gm-Gg: ATEYQzxVFJ64GLgCl5/Ni8OUVSTbWszG7PUtW3IVWU6VwrjBU1T9j9sBSBDKZecz7d9
	TGClqJcUAb5z2t8dxl7LQ3jrY4uLtbA3Aooi81xGrmDFiTzCKsDHYyjCUWp52n0DHkSIzB/yOOl
	NZKXu89b4jYYaQqW2Mxcet0da9avmLxW1l4Z0HwJ1vxUsrp+QAILO6+moGRxkNokcdv1ic/tAjv
	IkQ7mwnEmZyLnbrRj6Dn5AFxiTPxtDtkBDwTvTmurKUlAB/yNTZQXhl2nkSWKdZhPsnUJLR4hFQ
	U9ZD0UzT2F6yiqvyfBZAbmJrXprRIsyxGPPOqVRGPvTtRtp7HsOWOumXhnKXENrvynYkHldb/or
	fvMwZ8A==
X-Received: by 2002:a17:906:f5a5:b0:b94:244b:2ba8 with SMTP id
 a640c23a62f3a-b942df74e45mr44939766b.29.1772777977596; Thu, 05 Mar 2026
 22:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
In-Reply-To: <aapiBcnPHa3eDLN5@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 22:19:26 -0800
X-Gm-Features: AaiRm50x7YMCKK1F6zYGE3uuqGNee--50j1jpnmhfHu0gWe_LApncHVHg97bcLc
Message-ID: <CAKxU2N9TyRe_o6zj5pNRdTR65BgZZ6brsgRuq0Oi1EFvQSCiVQ@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_221940_036306_97585D46 
X-CRM114-Status: GOOD (  10.18  )
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

On Thu, Mar 5, 2026 at 9:11=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
>
> Subjest: use flexible array to fix memory leak
>
> > Use a flexible arraay member to combine allocations.
>
> typo array
Will fix.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
>
> Remove "It looks like". The pipes never ...
>
> Because fix memory leak, need fixes tag here.
Since its inception. Lovely.

That had no struct_size AFAIK.
>
> Frank
> >

