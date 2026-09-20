Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A05FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=; b=uV67hSDNL3lPLThDrEevMzZGFi
	bV++idJCtMvKvko+aIsCZoyK1ilJLkl2k5xy7vU83uUtWz868UJvlpuOTaAlU0xs91wPjWvJIR80o
	g2FcAyHV1cUk5XoFC9p2UkW8KyHhwyQS8Zd4wReSu37N35vS5Ldp3hVBjsAxbRShH5O68com8fahF
	QH3Wf/5FzuApOEX+pbPfuSDTg2CryAXGPDvThTy3SqtFeytK0E0PFqo06psz64lXJW7IwC8AN4q6s
	5UO6QgYZf4BcGQAgxM3MCgCEWuHTCzbyoUYwvAuJIYKd8ZpRsMjiVOVEZM+1/zcQxHwkcbnIAB/RQ
	G33YZARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x85n7-0000000GiOL-0gw0;
	Sun, 20 Sep 2026 00:52:25 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x85n4-0000000GiNz-38Nc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 00:52:23 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c254f9f0b20so307355366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 17:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789865540; cv=none;
        d=google.com; s=arc-20260327;
        b=eUuj6PRKhBaxFSW+q2iiIu1mGuWCPdrEHSux2kG7L2dG4M7mKYnxEefghgcmtTfECa
         tN/4MwW+AR68uezhr+HrjQUhS1bCKdRcJDUe7O5+nitDLAlaFfvc4XcMa/L6X62lDNjJ
         sNQtdvsDIcfmrhRnxueOPGIudCgfxpYaL3W2yvAtvMqOKYTamRCVIIxldmlvYreJmUBb
         FWowIIdtUTS1ndoAbiJfw5VyDFVmWivbT1Fqeg6i1yoFs/+zw0nMFU1lH9nzhJO9NsYr
         pL4ijj/7yORGMWoqaqkoRu6XkVg8ip1O9D9Tr23SnPDYU6bvs+s0NGCTfF/MpaWpFkci
         U7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=;
        fh=1U+R4oRrTTV0Cst2Eob3hM4SKsCgv6CiytpFB7l6qtY=;
        b=TqcNUODJexUx0EB47x+JmmX16K+Ca5/DcmBqlEytIGMkDc8qpr4zDYWUGzXDuxAC7W
         hyb/mtaZdjgzczQkMJmlJjzcNog+1qJVgfxlyGAsMFJsrRzLEVQExkSOcXWifWULJDbg
         5pKf1EYoGKVxPc5cS4JlbZYZ2xsuYX/rZcqSZi9LoI/DqRl7qCyaaSaTMreWPODv2Yuh
         YJIgdZGbLrPgvqKlKq2zw+hAA4b8FcR9/8d3VD45TsWlPKPyHBkbql88OdOTj2X6JCZg
         5bVgp6r6lKMP82AP/3nlx7n3/D4upageJlz8PDoPPoPHxI3Fa8JLzoZiGHQv+tSrdPmZ
         7M0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789865540; x=1790470340; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=;
        b=bHAzZtlIK/sm9/TZHqw6tjMLnYyFJlV8FQpAb1KCLn44qKblp4JBPuonK/xyXa5U93
         zzWsOn08uK0qZlC4uB1REvp6zCsLYwjFSCb6zUscgI0NCAcFQ3Z7YL/EC9Ru4hpxIIDF
         HA6E574YSH0sOp5nzg77ICJyJJop/j4NWYkoUMMA89paLgqcq3KZhAcBTr7uRx+Mqfcu
         tQJ/OnYI65lI7FGryWd09VYzA7Bs2q63LACUlfR7npY5m7JOjkUhZThFutHUJaTwWWw+
         FN5noU7VMEuEQ5gDHC8Ux9BQUz7LWbdW97CD9emmMcGvOcfgykytrN5awUGUxeOasJXV
         aJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789865540; x=1790470340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3C3doPNU+BbPfNOlvgAp/S4D1VtR06ufBbUBrF8R8M=;
        b=drPojnEyS8BXcThYYu2egA1Kl0LWfFfnb2KxoFmOLlXGq4fePngKVFgZrF826isGjK
         zjaj4il1Ywf1VEvDnSUb/D6MDBSdX9RJVtVj2Yi1YVfIQPXE7cQ4A4BmKwN1QiRVNIvZ
         cTbFgyjicXbMbktwnh2nW2YOBZ+zWz3but4CTcZ+jExSCdzwDWkokaxEGKn4qpUpnesK
         BgjA1IgyOmU4WCao/aFMg7LY21Uo3iTbVq5g1+NTkOnoABbhqAFPXYUOL31eFs9iu8RG
         k/1tH4PiDWOqYmjtlKtWHgoBGfqzX87Tl6dQJ0xWHjk9DNRgA1KCCRet3JFNTJC31JDD
         wr8g==
X-Forwarded-Encrypted: i=1; AKwUvByB4B73PeqZwG92lhBiVGcgpdPkivJK9lQjdFwzvsbfv2dVT1sdrQxqEVkWLzITaWjDcKoKgucFuyTABV+yUcjh@lists.infradead.org
X-Gm-Message-State: AFuF++nsxlHsz7bHSy9d3V378x9N8l53FkNI+QS8buC+suy2P7+G9VGu
	txJ6c2kd/Y4UsIpdNd6YKmqCNQ0WhFtrtQQuwvEIzXPIYvhz5v9Eu/vZe8WvvCFm3Yi9z3g7CqL
	rasEl/mSpk3gdep+8uPVqo8xiwUp4rg==
X-Gm-Gg: AYBFou0FaKvNEwfdWDvs2D+gNzPvc4kx7lGWnxOuduUCD3DGyhueSMJNt9mLJani2et
	xkjiqNUBeojvyAjh90ZJdolip700FoNM7qJRa1/9Yvk9HhxNF+LaO/jiEgQd01XoZQeUc5IU0Xd
	WCt1SVLrSt5SF/o3W1Z2IBXr1hxF6OlJpB6zw8kRluNgxEsuGDlZXY61oki/y9dMApb4V6eCxsf
	bJLS8sBV1HoEkBXxSMlCXFMihgT7AcK3TqHCRIuo0Pb0kht+8Qjpv7fvp5Jf9fIT3BzbxluP15D
	RZJCQPts7Jj6cdf0WNo3dUUL2GmIgIuCn43tn/NWeaJmd6nLsT4CudNFkIeMOsU8QI/gKxXveFa
	EKCekoI2K+2dc5FhVLg0KJtV/A9NpAfL4gFS6SfzHqYiL+xUHpVt+yZ5O9jVNZe6A8ymq
X-Received: by 2002:a17:907:97cd:b0:c25:58e:83ff with SMTP id
 a640c23a62f3a-c2a156a3794mr545290166b.10.1789865539670; Sat, 19 Sep 2026
 17:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260917192835.58126-1-mhun512@gmail.com> <e544a2bc-79ed-4067-9be8-59453d25acb3@lunn.ch>
In-Reply-To: <e544a2bc-79ed-4067-9be8-59453d25acb3@lunn.ch>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sat, 19 Sep 2026 20:52:07 -0400
X-Gm-Features: AcwNN1VWtFS9czLfcxGxhwerswgSwdEW0tGUGqcJxmZSe1Yapk0ciGjwin5ZEjw
Message-ID: <CAGEsz8EJyv-Ea04gFYysz=6hXD8ehHHtyzvLENpMffKnN85TrQ@mail.gmail.com>
Subject: Re: [PATCH] net: gemini: Free the shared queue after removing the ports
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_175222_807171_778036D5 
X-CRM114-Status: GOOD (  20.06  )
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

Thanks for the review. You are right on both points. I will keep
devm_of_platform_populate() and let the parent's devres release the free
queue instead, and drop the teardown from gemini_ethernet_remove(). I
will send a v2 with that.


2026=EB=85=84 9=EC=9B=94 17=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:25, =
Andrew Lunn <andrew@lunn.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit et=
hernet")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/net/ethernet/cortina/gemini.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethern=
et/cortina/gemini.c
> > index 4c762229ce42..e493d495f2ef 100644
> > --- a/drivers/net/ethernet/cortina/gemini.c
> > +++ b/drivers/net/ethernet/cortina/gemini.c
> > @@ -2364,7 +2364,6 @@ static void gemini_port_remove(struct gemini_ethe=
rnet_port *port)
> >               unregister_netdev(port->netdev);
> >       }
> >       clk_disable_unprepare(port->pclk);
> > -     geth_cleanup_freeq(port->geth);
> >  }
> >
> >  static void gemini_ethernet_init(struct gemini_ethernet *geth)
> > @@ -2656,7 +2655,10 @@ static void gemini_ethernet_remove(struct platfo=
rm_device *pdev)
> >  {
> >       struct gemini_ethernet *geth =3D platform_get_drvdata(pdev);
> >
> > -     geth_cleanup_freeq(geth);
> > +     devm_of_platform_depopulate(&pdev->dev);
>
> This seems wrong. If you have to call devm_of_platform_depopulate()
> why are you using devm?
>
> > +     writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> > +     if (geth->freeq_ring)
> > +             geth_cleanup_freeq(geth);
>
> gemini_ethernet_remove() is supposed to do the opposite of
> gemini_ethernet_probe(). What is the opposite of geth_cleanup_freeq()?
> Where is it called in gemini_ethernet_probe()?
>
>         Andrew

