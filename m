Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5606ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uA0DazZmkLDVCOd7Hi+MwWYlsTjyYHG3YOHKZZ9+8s=; b=R4tZQcZA/y8q39IhKVokZRWoO/
	1CCA83PE9GWtWvbZ1F8oty7MxBT479pA2CxI21CVIJ+TCIIayslnx8+uPOQ7yi1YnFjN+DC4qTpvX
	/Po/dfwcXP7npH2Oi4SOpLdZoe66Omoe/iUDDM1+aJBiQyQ++vboI8UlsoyC6B1gcOW/C63VqLvWf
	HXFC+/o1nNNOyeWpf5ruPtmfIRbA2hgihumHb7aWaPF4C5W2uBGcz6c2Dby6uwtmi+DURGRc7VpRq
	i6C/cgvf9fEolVsVDs6VOcUgvKD2+CS2Sc+mjICeMseEQMVgV1j2ZQBhx9MpoeWbhTPyP396SLS0j
	lckOfwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxm7L-00000001CW5-0kfp;
	Sun, 14 Sep 2025 12:46:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxm7J-00000001CV2-0nB2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:46:06 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62f37aebd6bso134620a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757853963; x=1758458763; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/uA0DazZmkLDVCOd7Hi+MwWYlsTjyYHG3YOHKZZ9+8s=;
        b=QVbRcFZxcz+1WkWhv9lKaki46VmEugnriEorUb8d2YdcZByrRJeNnE7YN+wVmPbGfh
         urrZlIbHWM3crWCcP9AcelKzffGGO5FRiWfrF7lSa0nKIud4yJGmnc9v0hbaXgLwuMB1
         x3q2lmNgP8UpCI2dz2GNG0INnsIRzP4k4DUWvajUHrEoZrPz7PnN8xy/Ti5jF1otCDSz
         QTZmuC1dvMRBePLg+RavPqIiazn7gLHZPFnqT9E3sSiVGM+paMFDFtL5tI8BCubX76uK
         F+lU7H3EcVrUQbOvVD7hb4q9odG/ZusZYwH+AICm6fADE+RjXAME4cCGL0szgcswtDu4
         FD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853963; x=1758458763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uA0DazZmkLDVCOd7Hi+MwWYlsTjyYHG3YOHKZZ9+8s=;
        b=WTwOgPUVMwQY5BqYuOIKF0nDUalNlFE9BJaX42HItr+KonDZMpKY+9sLBGslLnkGm1
         So0BKIIBXvYX7NrvjYjlsuX7f6j5talEgrANcqsv7cDKBNf+H/x+0YzmkoO8bCkGDyif
         lij4OW2u0BbCxL5TfjhWnNoZKoJw60y5amGFXAjXFFkd3iTq23wgnJ1kW0F9NIiiYq4J
         Zwv6CPC5rBtaM6dUc4CIP2PqJYg+w1lAVW1JOOjPu4wwaSav6tR1HC9JMsx5Vh6CT3BB
         UGx7x4bYwLDS9FYI060RA9fbKblh1aAqPcf0FL0C+LrsVuK4i7kkXo4dPsNLY1uefGvP
         83Vg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tiRmWjIQAEvPZmJcMeds+hNl9Jsl9AMtfQ3p1p485wJn1Vlufnv5ixz9bcHBuUoG3HAeSyjr/ZCd9r4O65UM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4INP6fYFnW3m0qJdr9mTxju/UMvDMhQwrC7nGaK9r19U56Mpz
	WyiKFOIyZ/4RwiYxLNBCY27wFkAJZnOOiuyXOP3pLrWeKjFQ575OGxvUGNs6YYEl0wSpZ9Ip7NG
	aQYqmx7XxNK4IS3cqex98Je3EobUlYFGRQjrscq9lZA==
X-Gm-Gg: ASbGnctAsN+qV1sSO2wuwKJpEefd3uco65igR0MM4Z1dtUS1H/+yfp4HDIpDiFfiZd1
	atI4Qm3nxINVPTuoqhjZZ+lf4S2S70/CBV+sTj7p3RVWxyvgBiF/KrqyQQhGZoUwNUm45VsT6L0
	W5vIv9jqTj/Oi62po3WiGtGBGfZBPeYFK3h32YZC5p5EK/KOoatR54hpnunqbII4ZpNxBGH/eO0
	4+eHGBSOrZVEAlPdq6D2+EAeZFRbgcwT7X8ZMs6waQVqKI+vih9FSmv2A==
X-Google-Smtp-Source: AGHT+IF0U4igUTTHAKDeCW0Fg2kILVIbP1QPrcy1J8WdoQD+33IuiA/5Yv77TdtGzFDmT9u8ZTuET3vq9LCucVbwHEg=
X-Received: by 2002:a05:6402:46c1:b0:627:d1af:8c66 with SMTP id
 4fb4d7f45d1cf-62ed823f049mr9261875a12.5.1757853963345; Sun, 14 Sep 2025
 05:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
 <20250912141436.2347852-4-vincent.guittot@linaro.org> <c3449621-546d-4911-9692-a465c6fa9697@kernel.org>
In-Reply-To: <c3449621-546d-4911-9692-a465c6fa9697@kernel.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sun, 14 Sep 2025 14:45:52 +0200
X-Gm-Features: Ac12FXxJDD4XnD2dYu4f7pXduOOEfZf2XFKS1QftIpaBO3CqniLNvi7YXY_SGp4
Message-ID: <CAKfTPtAcVq2rwhPEkoC=raFVG8YhpxUBwmaXqNogr4JeejP72Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] pcie: s32g: Add initial PCIe support (RC)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_054605_235516_4DB5DE3D 
X-CRM114-Status: GOOD (  17.05  )
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

On Sun, 14 Sept 2025 at 12:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/09/2025 16:14, Vincent Guittot wrote:
> > +
> > +static u64 s32g_get_coherency_boundary(struct device *dev)
> > +{
> > +     struct device_node *np;
> > +     struct resource res;
> > +
> > +     np = of_find_node_by_type(NULL, "memory");
>
> You leak OF node.

ah yes, always forgot to put the node

>
> > +
> > +     if (of_address_to_resource(np, 0, &res)) {
> > +             dev_warn(dev, "Fail to get coherency boundary\n");
> > +             return 0;
> > +     }
> > +
> > +     return res.start;
> > +}
>
>
>
> ...
>
>
> > +
> > +static struct platform_driver s32g_pcie_driver = {
> > +     .driver = {
> > +             .name   = "s32g-pcie",
> > +             .owner  = THIS_MODULE,
>
> That 12-yo code. My litmus test from last talk...

yes, I forgot to remove it

>
> Please clean it up from such old coding style. BTW, tools are reporting
> this since years (in this case coccinelle), so be sure that you actually
> run standard static checks on new driver code (smatch, sparse, coccinelle).
>
>
> Best regards,
> Krzysztof

