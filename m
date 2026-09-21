Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0015C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=; b=fSqnLoWeR+4XtOX8cS1b8jHL3K
	2wBscSFO+/6n8YgXqUgdTwAaI9mstf1ybUb5SttsqJ0SPo2Huu2GBbI+uptToxg80khfBPca5Rh8b
	X38zfMfEwiYYQNlebL5k2ycXCOAqFZ/tdt4pEdpdEtXdIYFXYNYDkwQ6mukn0UcJ8TTJ4RK72WuKB
	bYYgHZhMGhSXF0A4J1tw2JL1ks1rsCsUK7d/zuPn+xghGz1pfXsvqovhSM8FEf3BLbeOtNyicey4o
	P8NxS6AtgNBUBSS40e+cshJT4/iroHjFZxVztbcyBdBofEbryRNN8k6BCEkaQ6FVQ6c4dy8BVbbgA
	CcPFpC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m9s-00000003XGQ-2bcT;
	Mon, 21 Sep 2026 22:06:44 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m9p-00000003XFC-3RRJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 22:06:43 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so91403066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790028400; cv=none;
        d=google.com; s=arc-20260327;
        b=PbCKVDdL7UfEsXUosi9jlAhVB6pE0M4aJaE1VGzekO5+XIz8WTpCtg1gPbwG6xwSmP
         0JntVtL8kweE34XL/nqQptnEUFU1tauWsX+ubnHBhze/fJQsv7yO7NUAEhh7QcPUM7hp
         qEN4/jnR6esuMV+ZoeL/RsAvrEqZRYEmU15nMsZDIj2zcSVzDZzLQFIRDXYQMlOs/QW7
         Hz5kofT5HsfqZfo0KbGBKnKRXjlAwef03VGArswtVUckjyaI4GeLsOqFs/v6vE63X5GY
         AerFfjWXCxvYEKgq0JBgtr81nSjmTcN+fBMis0/iYkJTTCDwYoAXTHMpP8csTgHmZdpJ
         wT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        fh=aSswXIH+nRCfz13Ovu9d2o4yQsmjTGv3uH6cS2DNNM0=;
        b=jQVgg2zASzUA/flKyUsvzU8hN/d1f2hQ5WKoVlkIbv7wYMV85Wcs/Zvi6eA1M/AK2R
         MYWv1k7oq3c6QcsNiSQ5WIalZh8slJhW6YD8hKBFmEWurFhyV6Zaa50xv61++LMkdVug
         qk59exgkrDptWscDlNDi6E8ew9fkSAhPu6bmulyoXpeXWxzhHi7gdnuw7CbmqQ6KEIO/
         T7IaaZxTCwuqdCHS7iLOrVOtDqp2igl9RYKlsUpdcRgIISyAhX3dzxk62WBrbv3rBzSS
         imMwRN5QrqQKF3EjdRH0VFvShD9eGGHiF8kfLstGGStBs3Cr+0tgsghsD9tRv8xVO8j6
         ozLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790028400; x=1790633200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=jtwJd9XIbVaAJZNynM+yNElN5f5m3heTlLFbmt575sBSZkDbJFZZAe26MQuScQLuAo
         93QjrHD5+rGQ+0WbmStiFdyxoQmHyon7GAcSKNpEddrU1yOfPZEY6Rp4BTCeMNrZ4yu/
         34OtXIb18nnlmRyzYbTfnBqZr2UyirVaks06Am0LXqjAazXBOgC1QYxx4KmGGZNLKgje
         lsyW9sVei9sPVWX7Qoelvs8qYLtwlR6oAf6pv1td2KfLPvdrwcY5HOQIUiT3MWiPsWNS
         VxA9t8PeT3zP03oNvoxHWyQmwSpnw4K9sFkT/Bev6k666SUz6pfpY5uHD0Bp2Y0F8fIk
         GpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790028400; x=1790633200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=MKOVJTf0P8d1a5o9X1rI+8AOCpBkdDOJucqpnX2lbXEuazgr/6k37QopnEGRpkA4Rv
         lS3IQE5YKXkvgP0rDSP4xJ8KBZct/SjIC26Cx8xpeTxBk+ld0UYw2Ylny9KYJLSRL3NQ
         W3NvBGlqhF2xrR7S543jfY0Ipki47ju2PvaN45Ignit/osC7f1eF8W7qq+pFzv2uDold
         gKzGI1xB/VICvjpHfmXY4/TBuuCZY2oMRZMz43Amfx2yOucLLkH74tTxWVXioheYDkXl
         eNrt4daIbY7djbAmlq/NpleNrnsb1YmT/Gn243X21cK14VvWJzjMCtBkSpCjPpYRks9k
         HH9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzE2caOoSbh5ohbrxvfwQb2GchIUUQW/XjrOg5RwBmNuWmwsXZshXBvJBLC/j8FR/bgxE2CJs6Cv2yay/H7lgHR@lists.infradead.org
X-Gm-Message-State: AFuF++mklrTvvumx4NPF60JElfekNiGEFGiJUxYjsfdpJYNwuEBn5VbD
	3wf9bWcxfHCaFYhUZjEiovOohU2P9K0d405CW3yeTwl3xAOoVQ+44lJVuFL1UMVi//vn6WdoFkG
	hqeuoG8pByaFJIrmJ0jskP9LkIG3SvB8=
X-Gm-Gg: AYBFou0irC8MmYoU4Pq53Gzrx/TTAFCuBmNc6P+JtxTIXNci3S6mlpghvSeC6bZomFZ
	MZMWdIAhMtqsUMpoSnET+vmTrelbFLStDBdA7TNJSi3ajPsPP4dl2sEK6trnHp3dgF8n1YNUmIo
	QmeaA4wLamFHNYDTWsGQmLOjk81bA6OKy4E6ZMBZpB4BT5PnMrMeSstOXfW8tXu8Abegd4KJr8v
	dJDcGg9kIFO99MAWaLpF6w8mOu+4N2uimJ1I9F4HYv/VO1G0/NbPRkCj8x6RpiDF9DYFKCDvkQb
	GyWjbu5qLBB+mKptzRVb7qJfDjFLaO1/PtxsAxbiNHMQB/U1yWE6ARN74fmDAuOwoM4wabK/Pos
	veGZJoICb4l7RXi1Bhnw99ZKMvWMbT1djLLOSfKMrGRgvTv6yeYwcVZVhCMF8nc5Y1qCTLAwiDv
	DNKPGoiZbmEwh2WSRe8/xTzCyKXxwwHLe0SflRtihb9R2sa2vDNvfPhGKz83x9kXjNr/zUW72/p
	aix
X-Received: by 2002:a17:907:9813:b0:c29:f5d5:5a90 with SMTP id
 a640c23a62f3a-c2a15810476mr995533666b.26.1790028399498; Mon, 21 Sep 2026
 15:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214133.16519-1-rosenp@gmail.com> <20260921214133.16519-2-rosenp@gmail.com>
 <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
In-Reply-To: <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 21 Sep 2026 15:06:28 -0700
X-Gm-Features: AcwNN1V2KB9rme8n-5tyXAxXcXiv23teUPiYe9CAfdPv50-_aVX1j-Zp6NK4YGs
Message-ID: <CAKxU2N-5E=GJF1PkcKzXJaj=kzf7duHnu8j=KZ1akgu+6Qg11A@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150641_881480_FCF16C2B 
X-CRM114-Status: GOOD (  13.52  )
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

On Mon, Sep 21, 2026 at 2:59=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> W dniu 21.09.2026 o 23:41, Rosen Penev pisze:
> > @@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core=
)
> >               return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_de=
sc),
> >                                    "error obtaining VCC GPIO");
> >
> > +     usb_dev->regulator =3D devm_regulator_get(dev, "vbus");
> > +     if (IS_ERR(usb_dev->regulator))
> > +             return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "e=
rror obtaining VBUS regulator");
>
> Did you test this for DT without VBUS? You seem to *require* regulator. S=
houldn't you make it optional?
Nope. Confusingly, devm_regulator_get_optional returns -ENODEV if a
regulator is missing, which means probe will fail.

I could remove the return but then I would need to guard all
regulator_en/disable calls with IS_ERR. Much cleaner to have a dummy
regulator.
>
>
> > +     err =3D regulator_enable(usb_dev->regulator);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "error enabling VCC regula=
tor");
> > +
>
> Can't you use one of devm helpers that get and enable regulator for you?
nope. devm_regulator_get_enable_optional returns an int, not a
pointer. This driver requires management of the regulator in suspend
and resume paths.

