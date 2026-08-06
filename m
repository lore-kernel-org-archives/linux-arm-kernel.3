Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B426AC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=; b=FDtyeXyfz6veINsAqdHFgJ0kJR
	+5a5pz03RUHdTIcXHfmUWyV7+NCC9EMxHszbAMpWErC/nyjFc67hOc6oDhkRjWq4tGGApq08XTnvY
	i1Xkv+Gh1PvOomSJ1WSak7McaYjb6DH6NpSBgvpyZJhRtVzN3ptKRsV1AS2h5lfGouWUEBDbMIeBT
	a5WHAhMbuixx0IP1Njgf9I1x92nB5OKC3w+46onF7pyu7qZTIUyvx78+h6jKRxJRlatBtkgDYM73Q
	9NDuEZwV/1L6AU4KpPtP0ep8cvdTUg3m7Md+RzIXG+DCeSkz4tvItIx0udI1/0j0hC/c1C3cBQ3AQ
	bHtXURPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqeH-00000004yy2-1L3I;
	Thu, 06 Aug 2026 05:28:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqeF-00000004yxa-0xYJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:28:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce98cb8165so7151405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785994086; cv=none;
        d=google.com; s=arc-20260327;
        b=Pua1W6N5vbRBDUiBFUKGUzd5hoCB7H4KuWJmRC3WYHEOmzWw03U9Dk9uGAMIvIEA0W
         QB/iv7eLJYaHwikaHxn4D8+8Zue3+AHYLx+OmxjPIem6GF4Ox+nbIdLK3oQZnxOmni0H
         Oxn0MBzl56ji4i9N/ozqDSt3l3mJDo9F+depyDw0KQzq50jti17Caxj9w/TEVAGJZkew
         +GCknyrFs6/2edWmfM/Nd3ab1bzH8Vo6D1mJMq6JLeuILs8dyBbu9oKBq8Cbg8hAjXpn
         14uaXK4bGcZSRXNMUW1z+vgnJGTiFKBRd3Nk/HAwXqfBJIdkNGkNQzMukrl2ILHF1SHe
         1pTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        fh=F9pIFm3eIWaCbpfCrVC4YyItuTZHXoiGj+Rf10qqbxY=;
        b=F0W6kktuXSX2D4SPk3hZclZ3i334uhKn+1wPaB6F3ToJYf9F2JeCH46CU7fnGB7ntA
         FWEsPrfPlmsfUAyAK9o2DVq7Dbnlr6Y71ZLpWORd3Djeevb2doIK0k1ba+5XfsiYOK/S
         CKfDIesVzK56S3IUA4Jtl5J6Yqm6bixxJQaUzSXvaq4cx/RVGzkpypZHvaVJu3//U6Jr
         xxYAi0ahpUYnChHyMiFc6ch0YQI4/jwmkH54f/50gvlE5wyTFnQv0pOyX8q/BwFjtdom
         R12zqNbSNe0oaPREVTBUHftWdpVhRlf4dzrDqrqkX20pioRqsAKbN1UPOg0j/4LuS73U
         IuyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994086; x=1786598886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=DVCSuZ9JMm/nseSUtpfQcl/x71+Z6dN/feYjI9Ojc9mDBumJHu/gEYVDuXbGZVP3dc
         Ef+mU9jXtKk3iMOhAyQweFX8JFIem2wHWrFAjew5b4DulnsuodYiczNRchV05EfkC3mm
         R3e8Y8m6r89TBpn8SEjGE3pY6uyCRmNPBdSDx+ljR/iPMjnXvUr3KU/2p2Zze30lSi47
         dlyMAZ9VaAY1cqmCcq4uCi4aDJPBsKG83Mgz0cRJ3ZM3sX5TFgfw1bAorqzeGWmxjH5D
         He3YQEH3fKSKkg/X5+DE8YCl2hwkbz5S8N6hqFIWOuQGAXAPuJQ+vc5ZqYdVb/OLlafn
         w9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994086; x=1786598886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=RAM97vyWQKuKFCh8Bgdg+sQNtGPPbHQKSFZzrgOM4mVMxSWYGaL0e9OBZdQWP+WXN/
         LnJDjjoXzzgnmTaPddUbxq9qOzsPZNPu5UldAnMaZwOM0u6JfHJSC4CdHA2OtB76KTN+
         pQZ+LljvRaYEosRIs49eqc5fxoK21u8RsvuW3pgYWZwbRpQ7RJ0wwu+i3ZUCue1fZOCk
         fkVXKXm9u/s1SVex5V11MHgGqdXArSMidYiuYf6XVIRTl04Mju4P0drAmLstNJ0/Hx3i
         +pSLl5PspVnTqdzsIwV/mmcOQYzQ+1UP0m0AiXUNu0Tbag4vQqRyMWgr4OTOedzUcbZT
         HNXg==
X-Forwarded-Encrypted: i=1; AHgh+RrBbqNp3ITGOgKjOnHqcxeK8vqBFg7iJIocqD7YnI1Q+itfv18vdeMgh+1f0iep6M4AInyTC82yxYm1eVt0b1/p@lists.infradead.org
X-Gm-Message-State: AOJu0YyZcqseqdjUxnBZrjvsEj8OaJ76SKkpsRm6gMhyufKXPIqOh00L
	tiy6eeKoprF+aa6lY5XEj77Ks6OqewMgHi9KeOjzc+ZmoXkwQHXJaPZTbqgingN+RV99vpX3Lqu
	Ecwfr5wnViOUbEonT0/MJpn2+Geg29fo=
X-Gm-Gg: AR+sD11SbaHQ0dGdrgo+TwnoZv6F1Wp4mrfoKw1YA9VI/sZESIgXS74ncki2hq44F78
	BNhKAcfJt5UDcny/5xsOrVQKPy7nSzyCFbn/fAavj0WDXoEq3WkLGLEtUqCSAxTSZE/0T85ChRM
	rDfpF80wbt8L181XSJak0X9bBPKfv0f1fbb31aCVeOw/A6PpoSegp195BnVLTIFs5IgS+Ns/Cxx
	X4SULX62B33uW8D5TeOF3oGQOHMSM6P8OcMRaLAwkCQeTLKhXocKyJXIguYZy9A1kstZTHKJFqS
	GptZz7CQ77PXRUyxOUYQbKQ8D6dK6X7Wb1vXZxgT+Z0n
X-Received: by 2002:a17:903:228b:b0:2ca:eff:ff58 with SMTP id
 d9443c01a7336-2d0f710991amr9793645ad.15.1785994085793; Wed, 05 Aug 2026
 22:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
 <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com> <anNtgkZYhoWsSRr6@SMW015318>
In-Reply-To: <anNtgkZYhoWsSRr6@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Aug 2026 13:27:51 +0800
X-Gm-Features: AUfX_myhLzhOuWWyjCG9X66ATeLQftPHIJVdiIW_bTxwa_fBiVstKxt6vFHm5B8
Message-ID: <CAA+D8APMT2eSgrc37n_YZ4PsDZ-_8h4gHsyhADGGYDpTob_g+Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222807_270406_A1020D95 
X-CRM114-Status: GOOD (  23.31  )
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

On Thu, Aug 6, 2026 at 1:06=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Wed, Aug 05, 2026 at 02:57:59PM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com w=
rote:
> > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > >
> > > > The i.MX ASRC hardware supports up to three conversion pairs (A, B,=
 C).
> > > > The existing binding exposed only a single generic audio-graph port=
,
> > > > which cannot represent independent conversion paths when multiple p=
airs
> > > > are in use simultaneously.
> > > >
> > > > Add a ports container that enumerates up to three sub-ports, each
> > > > representing an independent conversion path:
> > > >   port@0 -- conversion path 0
> > > >   port@1 -- conversion path 1
> > > >   port@2 -- conversion path 2
> > > >
> > > > Each sub-port references audio-graph-port.yaml as before. Hardware =
pairs
> > > > are allocated dynamically at stream open time; each active stream
> > > > direction (playback or capture) on a port consumes one hardware pai=
r.
> > > >
> > > > For backwards compatibility, keep the old single port property but =
mark
> > > > it deprecated. A schema constraint (not: required: [port, ports]) e=
nsures
> > > > that both forms cannot be used at the same time. The binding exampl=
e is
> > > > updated to show the preferred ports form.
> > > >
> > > > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > > > documented single 'port' node, so this change does not break any
> > > > in-tree device tree.
> > >
> > > if no existing upstream DTS file use it, you can direct replace with =
ports
> >
> > That is to avoid any downstream use of the 'port', so not directly repl=
ace it.
>
> Does downstream strictly run DTB_CHECK ?

I don't know if anyone downstream uses the 'port' or not.  so keep it
in this file but
mark it is as deprecated to avoid any impact of this change (add 'ports')

Best regards
Shengjiu Wang

