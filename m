Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF0BC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=; b=Hxkk10VZEEaBxnSEIyMwOBGdD5
	6Joy5DHd/oerY3NxBtah+zCa5UbdPqHXYWa8hycGNKdaqwBGcAX/Ltkb1LgpcToLnIkvhdBFerryh
	vk0oihsZu8/i/UM95DbNR2zScm3gC2vOag5Qw9eBK2OgBLiVzJiqtLvvgtyGA8lj1aAQZ3gZNCn5j
	HguH8S8EpVmjvy4L85eQdHB3dTZ8MpLbOhuocBezodomkU0Xl7k6pdgJUdKs3JUhdULL7gB+dLN8E
	tP9CQn+Q+s5yEamgviXNkftx4cGPpx0PIQ0lPF4cGA+jhkp9SuI6/lE+7bF6kEPk6DB1iULgUMo0h
	4c1rmrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMZN-0000000BQfY-3wup;
	Mon, 10 Aug 2026 09:45:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMZL-0000000BQep-1zR2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:45:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1587473a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 02:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786355118; cv=none;
        d=google.com; s=arc-20260327;
        b=DDFDsz/o8ukWdl6qFLUHik1Ykd1hysd/3zxPnkRSoJruzv+vCCAtlSbWpBu1P7CDvo
         LIpqudW/8tr8ypDzsb65fkd4huEZtCymwX7/FCRSvqsxUAUgAEctPkMx1hYJ+siD69XO
         0PZ0wzn+iERB4Hap4kAkAsYpvZk3+JtQS1EikDMZvqKek9SHcnGeU8hFP+4jMJBBylRV
         SwNd34FyQQM+kXu/E322irUuATjNjjsRWCMxWDq7NCpSrBai/30rxJaUg9ODt5vVUGfq
         cjar+Sa85uGfAemWIsEUGAmvwnmv6AqegH4XS6WBXfFuHEiu0qJtFtjxFNFVaObJ4MpJ
         FzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        fh=1nH4/Fk9AbdLDCiCbqNQW52hcJrdqdb5rxCPqg9SRg0=;
        b=iCY8elGE+nxHqFfghpPVrDMHpO17ZpccbD626EsMXV0Y03BTEzUOpxc81/yys8Gth7
         tk9eUJnf0jCdfx9ZsuqYdfK7v5B78UWBMNEXkZfZPf/iDPrg9HioWj++yAlqATK1kDUL
         tROP+UnSJaaVvHDs1M9obMwySM6QsfbicmLPbLW1zgQ/QtEIzIlclAZFJebd9cg8KXvE
         Gb3JUFO69icA4old6h2JFgKNxiY+167TlL3RI9Ppb60vRptNG2ZuEF3m9OKotjYz5zRR
         NpBI/MHFvuodJp/sfDGEb/AmXmKIK/0I92tgm54TgjEzpP82lSzA+SXb0rU1G3RQLLgC
         KSoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786355118; x=1786959918; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        b=p97jRWjCrO0CvpoP7fUZoTypY5tVMEy4cPCmq8bXxdkhmUBHbk9ceitVpvd1Nd0AIx
         2cZWgWevwCLUyCdNDRQsLkFP/eWX9/V2Iwgrnkrlo2vmTASIC0rsjMG9Gtv2um6GQ2hD
         mljF3aq6qki1EkU230+GIUuqnxppnjYi1aBlJVIv/E2vrIRTNtS58qG0Q9kDevgaMInb
         p87aSOXvQ9Aqe6M8xBe5VBLtU/3asFB/hwLOjF/uQtC7z1GWr+m53yWHZ/hyUbFTJ6Ld
         Oxr++Ex93E79lPw1GQ2dwhb/1kWm41JpgdqZzcH8mKezPu5dZ59G8YF85AQ0euKcjsme
         W/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355118; x=1786959918;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lEhjsMWG90vKMNIv0q/NvqRJMIZC5Z2HAc5jYXUw3Vo=;
        b=eTz9UY25eucHWLGH7Ni7S4hIRCNRuED0qlevecTUAHuUW/gNmdjy6jx3fEc84KgGly
         lpSutBI4ksxhXxOzMw2hFlJ7Wao+ZDCqa3vfpOXTeK42Cmi1sYMKzK0QV3Tliv7t1XMp
         TeN6RR8i8E/AMMf28NpKwJ5gPUqKEDNV3JvR0EkOfFR0Ws7k15Y+UaS4hWgoinDHeH9o
         55ioip2bJU+gnbS16w94Et5riySw5+w0M3h4zwTlWXTZjF2HPEHvI1BwjucVLyqiMV8J
         OrbD94aumtJ2mCyGyE2XXvshsoZmzKu8l4GXh6ROVNfGdrjegfhTQw7l6Ik1e+8sFx0e
         Ig4A==
X-Forwarded-Encrypted: i=1; AHgh+RrNhzVi/VJ4s4gJD1dnd1ZEUQvjZCCuzEEygx5v/eUzwT1t6jGyB26ytJTxaX6JaADkq5dxJLmuoR2rV7e7A8gd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp5x0FsUqoc3GpzOTpUZJPi34Nn9D2mNahzv1ShxENgYblyazk
	5iOx4ppRJqRnhNX864BsrhwXc8E32wz3Cn04wd5sZBGV6YxtNtkRlGj4D6LIatv8JNXTQPihg0d
	GW3T+SPE9Gn3CeIzPNPLiPaghK3hsTGk=
X-Gm-Gg: AR+sD13y4VBo880FbRJjhmuxJ+RSc8LXFLKqnvxlpcNnKUHA/L/u1vF/2rF9KRrkrPe
	PmqS4s9YUqqfn8M8R0+qexFD1t4cRMdIjwoN/LbkrpQD+mD5vlL7dk+0Wl0EjgeulrwnL5nff5F
	xZubuW4drapmlbhfieu2LIYWW+pVqiqf0V+Oq35FWlceBclRTmyELgjtg68rO5f/sZnustlZWMA
	URFv67N3JtaRFAeHHrYAAiRUMt/EzjvpsFpnoW0dHA90YX9x+SX1oXfzbymeBcoZ4UnQkp0Rn1P
	eC8w2iZ49ESMFAGEYvn7++pg1C2QqzCfi9jLtWX0jgKFhjR3/I8St8p2OpoO0IUa69eTbj7nOE1
	kCaV/ZB0ddK9OAfC1bTqxy54tcL0dFuwcNMiy1v6pRoBudm15W4uixcaT
X-Received: by 2002:a05:6a20:4309:b0:3c4:48da:8102 with SMTP id
 adf61e73a8af0-3cbce930129mr18884836637.29.1786355118398; Mon, 10 Aug 2026
 02:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net> <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
 <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
In-Reply-To: <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 16:45:07 +0700
X-Gm-Features: AUfX_mzy3FMnWBW1ZRsEZF6RiTcGKaOh9JEcD_RNAR4jnG-Nka5rge-6f-tSjWo
Message-ID: <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_024519_520215_F40A240D 
X-CRM114-Status: GOOD (  16.38  )
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

Hi Guenter,


Thank you for your feedback.

> >>> +                     return irq;
> >>>                if (irq > 0) {
> >>
> >> This if () is no longer needed.
> >>
> >
> > If we remove the if (irq > 0) check, irq can be -ENXIO and would be
> > passed to devm_request_irq().
> > I see that the irq argument of devm_request_irq() is an unsigned int.
> > Would it be safe to pass -ENXIO to it in this case?
> >
> No, sorry, I was wrong.
>

So this means there are no issues with this patch.
Patches 2 and 3 have already been applied by you.
I will temporarily resend only patch 1:
" watchdog: qcom: Propagate errors from optional IRQ lookup "

Best regards,
Phuc

