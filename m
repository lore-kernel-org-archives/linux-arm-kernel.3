Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06733C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEK3TrmN6mfMIzQQCnzQAWWZ+QxJLbnrCj8nmqswDeg=; b=hBWFAw5gS6hDC91XXRD1hpnm/9
	+NoZ/53JPjCZdJ0x6hwpemz5HvRALIWLFazwb0HqEAokI2RTxiyUksRWBteiW8Jn+DokLRpa9DN00
	MQOk2t9XQ7K6U5Rxmq1inqKYBz+OEj6BasMO5ErOBVsVsWXjQvueu4jC6iY3D8e6tJSMePODZThSw
	cSOdnd8qHjOxve0657HR6r8Lf11wHzcCNXqRm/nU2iwQvcpYKTd1EVAHlyfhfUYJFa7LGC46g7YV/
	WsA6lh2vhEKUoq1gh7hvY1T+IhxnC6DVpG3ithimJrOnX3Y/eS5i6PC8Lo0h+xZTasgyk5t8cXTVH
	8XErB62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Jy-0000000EUq0-15sD;
	Fri, 27 Jun 2025 11:32:42 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Fh-0000000EU79-3aJH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:28:19 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e79dde8511so426187137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751023695; x=1751628495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEK3TrmN6mfMIzQQCnzQAWWZ+QxJLbnrCj8nmqswDeg=;
        b=XzIP3e713V5XBCfo16K4N1Cc55M5aqfcxxfM1oJ3hU8k3v2gw9ZQi68TtxrWxowoPa
         EGAGgVwPeab97CgZsHQtCfDBuwpxt2bgk0bqBBA/betCNzXfT6+dL6dVdddrzt2iuP9m
         qyv5aUmX2cZXtnWbkqScFdNgTLiGj5vIcpSX04U9vJFMAcA44F2al9dOIwJPJwVr5xfQ
         jAtfUWR4EzUqugkTopAaeQtbPxX9TVjDW9/vTUv7Jc1AgrzQA8ABp/rr3fKOnKZc0NGy
         QL5Zu5aYPJUM23BKAWuU6jSmeXa25aUFrY28kBH5T2EoTgXn6t4WO3eTPqQ4RE5KCQhe
         ThlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtwE09QKLue8nYB9YxGnXSRrL3lgcJjZ8Pm0XKGKHEom8u6TvyY3q+aKJO7WMRZPrFulr20KT10LrRvF1gyP6p@lists.infradead.org
X-Gm-Message-State: AOJu0YzRa2SlhGMkC+0mzyvPrRDBJi26UdgvO+hZ50LFsqvJ6Ti1/TPg
	KN2YHtZ7qxOwKr1GKjCQPaPQD8ReyG4Fu3Ndlm/It6WVxPIinFrq7BWveS4Rc9WAd5M=
X-Gm-Gg: ASbGncvHapxnR+xcHEwkdstHGrSvV1dofOldKqN9JtK77uuJGoafwp+0AUq/YDHFwVk
	HdUABvyrIrq0liUtsihbHZDQV8aWfTbH6VPeMu57Di6oP5ps8wtmFSY8ZxTiUe7O1P5hqOoDnfv
	XJfW3W14OKdKZhQoHzfftdZPiwEz51a0ehbsHknTVrHWT0ljyoFtIGzUqODhurjBpbt2rcOhU6p
	CTyuKFClryOLO8WhM/657Y3wkUYlCFe/ZcGbN8+Qnn3SHJUsxMEXaBOgsMej7se+vGBL1EWVUZV
	onNz0LVw/U9erPXcOPUGoasaryLDlN38NcMeVnjbWZLmEykqb0YJGsXAdXawf7ax8kwM+o2EalV
	2wU8bULoHFMGpzMNljcOJc3Qc
X-Google-Smtp-Source: AGHT+IFQPV3SO2cAXXvTpxtU0/g8/4cMjabzIewXXkRhRZ+bDnXuOqFbFtrLFQuFQDN8ndujtDzWgw==
X-Received: by 2002:a05:6102:26c6:b0:4e7:b893:fec7 with SMTP id ada2fe7eead31-4ee4f489301mr2003366137.5.1751023694897;
        Fri, 27 Jun 2025 04:28:14 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1da06ffsm547422241.26.2025.06.27.04.28.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:28:14 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ec6f5e7c9so569704241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7sL3Xf6CsAi6cLiBop9s2JQhvw/O2xN3k327PdHNjcDJVr1C4WhXNj/PvjEvqiBsVVI9kezNcFpadaq7ye7Uk@lists.infradead.org
X-Received: by 2002:a05:6102:41a4:b0:4ec:285:72e1 with SMTP id
 ada2fe7eead31-4ee4f4e2bf1mr1843344137.6.1751023693796; Fri, 27 Jun 2025
 04:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com> <20250609212356.2264244-2-florian.fainelli@broadcom.com>
In-Reply-To: <20250609212356.2264244-2-florian.fainelli@broadcom.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Jun 2025 13:28:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjYJeS48jToVe9O8DsadyeT0q1CsBxQtx3k+X5h8LLTg@mail.gmail.com>
X-Gm-Features: Ac12FXxx6AlZB9goS3Kuy-9PuglmpGj0_M6FTCRkX8gafLJyv4mGupPxoMZrHiA
Message-ID: <CAMuHMdXjYJeS48jToVe9O8DsadyeT0q1CsBxQtx3k+X5h8LLTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory-controller: Define fallback compatible
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_042817_892914_DEF09865 
X-CRM114-Status: GOOD (  20.31  )
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

Hi Florian,

On Tue, 10 Jun 2025 at 16:32, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> All of the DDR controllers beyond revision b.2.1 have had a consistent
> layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.1" fallback
> compatible string to match them all rather than having to continuously
> add to the list.
>
> Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks for your patch, which is now commit 501be7cecec9aaf9
("dt-bindings: memory-controller: Define fallback compatible")
in mem-ctrl/for-next

>  .../brcm,brcmstb-memc-ddr.yaml                | 54 ++++++++++++-------

The oneline-summary really needs a "brcm" part, as this does
not apply to all memory controllers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

