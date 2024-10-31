Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A991E6895E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ey3Nir80ipbi6aEqJTmKEXKmtI3cKgTNpdgc0Wv4xOA=; b=05FlAZbQq9jVoERqz5obxdjFFP
	XiXFn+CROZGyebxX2ToshhlT2kFqnWwuoWSMklPA57XzYhsFruxrdO+2VdlrW2sXF+uJhQDl3aAYY
	0sbaiBHWlFNZSgsLcZuTttUdHGBUkPP5qpBEhM4SilPnXF65OSpTJ6DUfTxrSMFL0Ui7hggUYN+YG
	kI3ZkAHDJNbsp1Rqde1jeKBXsr6k+qSDHLsduecHkiW3LZpWOzPuok2/pGkD/rI3ogfO8KTzfC+eZ
	OZA4D+YUBcQ5LEeuclBCLSVQdx1PoLhsnp6v43ayip3IHqJysiA0BM3lJDdM/czH7RbgVl9IVXOS9
	nzg4uXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6R8T-000000031Vw-2cLH;
	Thu, 31 Oct 2024 09:06:33 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6R6p-000000031Gc-1MNj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:04:52 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e30cf3ef571so107733276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730365489; x=1730970289; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey3Nir80ipbi6aEqJTmKEXKmtI3cKgTNpdgc0Wv4xOA=;
        b=jKeOpiiSg75HlE+1HBBR2zKSc9yCase+RRpOlGlL63mnz5xkinjDolGaVvVhD570ho
         tlqQUmkZSpl9v6mnNf9Lwuk9Pg0VsOyO7zMsN6aNncEjSSAvoQFrU88W3KczqCE4ixm6
         9Nt430OOdBA+UP94YQeYhlZqD+B03V5njtaJA4RrDXqhKC7Gz+LDBRzcSmcCOg5lUTRE
         gpLWkDHNDrP2KRVZQGkk7K9YqyKgiu+i3y3D59b9TuTZHWtYULYpmctESITMbxT3N7YK
         UA5B5TOO6NYA5/q9YPXH5cQ+eT+ZHXcdh8G3qvf666MOBLwjlmSnHRS606blthGrutWl
         VKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730365489; x=1730970289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey3Nir80ipbi6aEqJTmKEXKmtI3cKgTNpdgc0Wv4xOA=;
        b=p/pATSAV4XJggs6OoMPNbT+hnRQ++l7gDCKwdI/ImkT3Kor+y8BSMBULxNLQJVy8Wt
         5KuSM++3J3jQ+UQ1WGQPpIX6W8CnVGwKAABzywaRNCU5PX/hNvVq+J061TCbzztyJSn1
         IJ4M73O2y2DcJwQvwxn3nagH0GjzaLfwzCWvAeNRLOuSFRPubKCkUMUPa/13Zw4X54NG
         OW+lgmfmVVRBzCPkp/24cWYAY1DFpWei5+FrJfc9+2jFnCmVahC2FNot/eXb3ltxWaCF
         WkV8IMSeetJEmrxYxXKNSp7f/AjqjByFOkCMoJAxnlBGJfnOiaadEGlbsFwYiU58Hw9P
         FsgA==
X-Forwarded-Encrypted: i=1; AJvYcCXiFIAueZHkF+Sv5rfCeu+N6vbzuzuCbHPEW2RAYMUEjrZsdOLCXyshSpvoYnzdsH798zQq4x3mLD1Qzf9QMW5g@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0QY/hTGcmVPufnDgXDlURCrdyomcuCbkpZY0UkKFYPq4mpyJ
	YNhXbO01xrpRRIWFWX9HByfcxrIVJrmFaIbcnY5hpdQQYGhfFmhoc5I2lzNimJpijbdRSzV1gJR
	lyFLcDLNm+KE/cwJbOGH60CD+7q4=
X-Google-Smtp-Source: AGHT+IHZguKS/F1V9AJj+A9lEBmF80qUzVmVIz8k06olAGMVP1Gm5twS6Ahy8M35orW4qXtccoTRMk9rczRRsmL94jQ=
X-Received: by 2002:a05:690c:ed4:b0:627:a25d:6e76 with SMTP id
 00721157ae682-6e9d88e7719mr79156307b3.2.1730365489324; Thu, 31 Oct 2024
 02:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241029202349.69442-1-l.rubusch@gmail.com> <173030774932.1269076.14582772234717243392.robh@kernel.org>
In-Reply-To: <173030774932.1269076.14582772234717243392.robh@kernel.org>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Thu, 31 Oct 2024 10:04:12 +0100
Message-ID: <CAFXKEHaUO=Xo9iGYfUbadQPbi1Sepv=GODoRabQ9qP5PC-MRpw@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] Add Enclustra Arria10 and Cyclone5 SoMs
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: s.trumtrar@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, marex@denx.de, krzk+dt@kernel.org, 
	pabeni@redhat.com, edumazet@google.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	alexandre.torgue@foss.st.com, davem@davemloft.net, mcoquelin.stm32@gmail.com, 
	kuba@kernel.org, netdev@vger.kernel.org, a.fatoum@pengutronix.de, 
	dinguyen@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_020451_387058_938030D8 
X-CRM114-Status: GOOD (  19.38  )
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

On Wed, Oct 30, 2024 at 6:04=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Tue, 29 Oct 2024 20:23:26 +0000, Lothar Rubusch wrote:
> > Add device-tree support for the following SoMs:
> >
> > - Mercury SA1 (cyclone5)
> > - Mercury+ SA2 (cyclone5)
> > - Mercury+ AA1 (arria10)
> >
[...]
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.

[answering to this bot]
None of the "platform maintainers" gave me feedback so far. My
intention is just to upstream the mentioned .dts and .dtsi files. I
checked my files and fixed my obvious bindings mistakes.

But, bindings for platform socfpga are still described in (old) TXT
files, not in YAML. So, do you want me to write the .yaml files, too?
Or, are my files acceptable by "the platform maintainer"? What is
missing here? Should I try to fix every error of Rob's bot? Are the
boards / is the platform too old and you don't want them anymore? I'm
not complaining here, I may try, but I would like to know what's
missing.

Please, - Rob, Connor or Krzysztof - can you give me feedback and tell
me what you guys expect me to do now here? Thanks in advance!

> If you already ran DT checks and didn't see these error(s), then
[...]

