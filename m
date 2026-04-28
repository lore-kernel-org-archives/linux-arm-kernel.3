Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5A4FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkNNLielDoU+waGJTxz6K7Cs44v4hc05yCRBP0rYkY4=; b=eRxECawMhuXcDAcQCR9R/+RCJP
	NigONrgF1pJ4WTJj00h/7Y17WwLjs0FnZ13v/Xvsg79X/suzHdqYOnIo8OClGV+nGNRdIsYt3iRl+
	LVzh22vrfYmngkXJhLcjl7E5SjMWDswSxf5qd8BroLbYke8SFf/NrGHB0aTz0QOCIy8rsFfP00N7a
	59WtOW6U6tnBFCHxHnqiHPsU5v3ezQc+KpiZ54d0bUGNgHNeJ3Xw4ZLmaW92cwdnqHqhzqR3KWZrl
	sNSnHX4OpCvuLBvQlvH7umplNHqtEQBLmyES91Fqx6uT1A57MjA5n3qqpMVV1aIXSQYSOfk/f7H2+
	M0BO0wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXJ0-00000000OBC-3stJ;
	Tue, 28 Apr 2026 01:32:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXIz-00000000OAk-0Dcp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:32:06 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35691a231a7so7208311a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 18:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777339924; cv=none;
        d=google.com; s=arc-20240605;
        b=OkvxbpnTTOnm0gNvMBZglWJel+9eVrE8MRZiDGwOLeTYqDz3GzodoQRjIUHsSLGIjE
         yoSRONBlJjNLBH8OYySYduniBLx4uyHY72L1OLtacE+buNea2ZKJ0M9kn1vmwHfGV/xU
         O49FokjZr7nzLDM3XRu3jgvrfoFsui1gRwW0/MMHnlLXoax+W37Jinqwe4v0a+OiJeQB
         qb2TPpV1Eue4/G0WkItvnN+v+UW6AQpqG2cD92j5wX+9gDLyMyvnxxL27dU3W1BOPRBI
         SJaTaQWaWi8UNivnz4/qwAajVi/9hnMLIwOFzAqiwtL9w/9mTqdBTaQj8p7xFaHR87VI
         7Few==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dkNNLielDoU+waGJTxz6K7Cs44v4hc05yCRBP0rYkY4=;
        fh=29naxOBM8vnn4Vs5DgZtjg9XbwQ8fKC5Q3lP/3R9G98=;
        b=EZPi6/YYWNGSFLiA2pzdsJXoxtntWK7lT2HLXmOk7w3P1kCQoL5L3RG5RdIhzbpUjL
         4fPhfAGQXRMirTxlxt+HYTfgzgyihD1e0pyafp+JvFP6M04qEpHh6r/vW6HJ7JnLtp4c
         JlhK8jNHtkiFLlhDJGNt6vURomOfnYSm+k/Bo6RnEmyXgfrfGvuIAjXhA2zaaChZJw8/
         CbcFiQl92B4elujjClcUzQApQ7CCFABl+KLDFdA/kC3Z9UdSUzMJhd9zVBi4JWicjWT4
         iK0C9X55ZfywOM7Vb7Uky6c53EDnTX2w2IJbuagS2d+wWroZHSXCobL/F5zemC0zaQfC
         Lshw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777339924; x=1777944724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkNNLielDoU+waGJTxz6K7Cs44v4hc05yCRBP0rYkY4=;
        b=METstM+SAtHa7JH9zsrvqp/aosMvktd/kFDZoQRLqJElkbLqhl7+d2Tc/Ecelhr9zf
         +bBzYis2zZ2Kz3MVIsxmvaCFHGYnYZ9tcicDzOmhXOhCxPjwlVkKRaO3/rvdWGnKhlle
         ErvKtCiixlBn+zy40sE/lC6XMu/0zw4GGSnUBSKPkAd668IKRmqKIfm2wKWaRVAcbJ7K
         Rl9yhjcEnCGIwJWAlW7eHga7ovsYtT309eQ9dmBJ5aMEdCy4HG4ZyRUJrj2Bbj/27pL/
         vqaZmSfCczHvruXGPAwTWUhKeIDTLwcV2PWHZM9RbmqNhJHLv2IhKDwE8fdeiYu8H9iA
         uvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777339924; x=1777944724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dkNNLielDoU+waGJTxz6K7Cs44v4hc05yCRBP0rYkY4=;
        b=NrwNhyVThsMOE1b3Nqh8lfNIwv95/Gq+1T7yPe1+rJYYORyUwcFCaiYzbHIZq5B3HJ
         5HCWkY2ClXIWOK4DaQOpb37d2EF/+gLD/F4v56sSVevuiOsLUmewAQBDeT2DUBvpu3KD
         yIMnyB/fuqYuTJ9eqqg3qrJ6vygyZfU/y806QFpAqb/Lu68zE+FlO8IvUeSM9sh17QQL
         4QPF7puravuTKa9zn2r6IfRgI04EQ5iGU3btJNDZmU9EjT27qNRiBo1wRc8NOeHLnwY0
         Wm9ZCZ7Eq/iGxhEPHnB/48lIHfwXl6zEJBpnWB0lO7PzoIuzwncrsOqqPSxBoisQEl15
         l0yA==
X-Forwarded-Encrypted: i=1; AFNElJ/aDQafwUa0lQz+9PyfK9tz+/bbqcL3a9F3ZE7Uzi+HVDrLfoek+0+pzdHaseX+GqwasVIODh3DjNIAtiQnZtrb@lists.infradead.org
X-Gm-Message-State: AOJu0YwZvUkil7G7Au6yyZa3DJoeE6u6IngH7J7fvHjvuwp386DFW/eD
	qdRj2JRWjNx4guURt7UG12VXMoAyHFHLLzPVQ8JwVEcFjNZqVpe2D9alYI6wjKh9b/D35GnPvST
	eFsjx+5rM1EAlxDI0V87YGZrFhiI8WdsAWf6drLdt
X-Gm-Gg: AeBDietlJx73iJIDj+S2xJtmK49WX2i2i0X8pN1AWx/6JzPIXzJjQRMX7EhQfp6AbqJ
	68U0LHS1275oC7Z2edYIgRuRLYXUFY1uIzcmuoa5nIjxl0aQhmhpgI5R44MoIQz6P7lDjVUwO2Q
	YujYF+a++ae05Kuu/B1j6HQ0BRfnqC3NA934SGHA7xdxS8pQopE11F+3urIvD8pnzMSPdrdblrK
	LXSab8ndxUC3aJXBSrgHR1DXwZubv79YCd90qoJK5aNxO/J3AFnHWNw+MxOQIpTQSM0oP9e/HWw
	gEcVxddukeiPxpcobQ==
X-Received: by 2002:a17:90b:52cc:b0:35f:b714:e516 with SMTP id
 98e67ed59e1d1-3649202f6b2mr1031930a91.16.1777339924049; Mon, 27 Apr 2026
 18:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com> <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com> <aexIwJpno3iPIdRD@e129823.arm.com>
In-Reply-To: <aexIwJpno3iPIdRD@e129823.arm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Apr 2026 21:31:51 -0400
X-Gm-Features: AVHnY4JvmD_vpNd2uBimzy27N58OmiHGYAhJK_BGt8LuvH5xnPjA0AMhCSfE4Tk
Message-ID: <CAHC9VhRT1v3mM9CFvz7Dh5Zrv_MF3vgBk+BZ=q8wOMkPB6O6Fw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, roberto.sassu@huawei.com, 
	Jonathan McDowell <noodles@earth.li>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183205_089534_114B4315 
X-CRM114-Status: GOOD (  18.72  )
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

On Sat, Apr 25, 2026 at 12:53=E2=80=AFAM Yeoreum Yun <yeoreum.yun@arm.com> =
wrote:
> > > I understand the need to ensure that the TPM is available, but if it
> > > isn't safe to wait to initialize IMA at late_initcall_sync() then it
> > > would seem like this is a bad option and we need another mechanism to
> > > synchronize IMA with TPM devices.  If it is safe to initalize IMA in
> > > late_initcall_sync(), just do that and be done with it.
> >
> > Within the same initcall level there is no way of ordering the initiali=
zation.
> > Yeorum attempted to address the ordering issue in commit 0e0546eabcd6
> > ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_init=
call"),
> > which is being reverted in this patch set.
> >
> > Ordering within an initcall level needs to be fixed, but for now retryi=
ng at
> > late_initcall_sync works for some, hopefully most, cases.
>
> Ordering within an initcall level is not good idea.

Agreed.  That's why we have the different initcall levels.

--=20
paul-moore.com

