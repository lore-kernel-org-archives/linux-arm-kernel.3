Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E931D609B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBxxllbmGCNC4M6ZGUi3hTx4gy23i+k4nkuufppIRDc=; b=bFWXD0pOYgcz4BEjXsU8uwB1y6
	km+GW5LwjALKCbhK+J3NFyAC/8h3mWdF1s2SgfSYWhZq6wLywEcL7ki8KH52ixIJdx2g5IS/RQ/MR
	sCwbuztZWymnbKxIVemq5HGMUPe/TuT+lXHvaMCtHpjU8eIOu9LmR4z/kcFcWtU+YoCyzKWfGjf9v
	JFDSQgsfBqkrOMCarq7sv06Dbb8SdcKYTD0JHlK/skwh+kaLq7Zy/8WqZH75swFAZTmMxD3m1u7TK
	DItWFlfvB99QOIUMGVauXY3gKcUkEwqldOC9xvoWGxWmYelY/ugZLXrvSpuzrze8FXX9fU86b5AjW
	JwrmpSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE1p-0000000CfGz-3Fti;
	Wed, 27 Nov 2024 09:08:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGE0s-0000000CfBk-0A41
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:07:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso31045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 01:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732698427; x=1733303227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBxxllbmGCNC4M6ZGUi3hTx4gy23i+k4nkuufppIRDc=;
        b=U+ir+Ee7hIKuvXynPhzA1BG0VwD5xaH6kdB98kymrQNa3fHdN2psiBQORD2DZj8q2k
         izoeUQT2iLbxk2ZhYi7oaQUJUredksJWGn94EwpUQtAck5w80bU0EsTTTGs3SWGGTzC3
         Pn1Zrtg4cp4EkpTakpKpmBk1n5WLyPJqlW3EkTSK+dW6hwC5x7T26bQ2gvvBWSAc9ECw
         99keKnfHuEORZwZjkKt47z0sXK+fZ7l0eXDOFnE1NCJ1TJYsSOK0CYCUd28lQlpizsgY
         4heeqqp2yIiDl9ceVKXP582y05OdQ0eP1vDJNho5T4hxYfi/8WkHh5WJRVMlFabShPPW
         XR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732698427; x=1733303227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBxxllbmGCNC4M6ZGUi3hTx4gy23i+k4nkuufppIRDc=;
        b=dAgnKdmN8xvtDRB+5cPxBiXXLYsl5+NRuCSiv4W1bCk+xw1Zy6skDKf8RmQV2fl2Cr
         NFAMEY+VYuU7iPBnxRGnx6RvaTr2YJlEf5WzXpvy8JmAfKvMJHbV5rJyq6UV7LDggUML
         ZkqKmLEQvO4+Vl6OB6Hzv+yfhTB6Z0VsMYQ+0YJTNfDzMcwN0VstaK0VqvIMfQzhgi87
         obErzCkgrbSN0lEW0oVnfacmw81/cHxQ1vhfzCGDUstwdBaf1ZG9NW+EbjtvfUbDCA2u
         xDUEbspo7Vn+EyYW4A6q5Bsd4O/3AcVQnOSToL7gIR1c4F6OF1peZ+Epp1Qi7T3FzQd/
         V8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6r3SNcyBZTvPKzMfjBDZlyJXCVfVjCCSIvQ151m15gNA0AFS3649uxxFRKbfeL+t4lC1tPHxvXDrDZY42Mmzk@lists.infradead.org
X-Gm-Message-State: AOJu0YzhwJWSgpdba/73K2b8XhJb+0bFrRxnSDwG3ofrMVrEBfp4IrRH
	guXpgRibudJWON8MUkIUsbPvnQXuhxlwLG3XBh4R+gkegNxNmIOybcpWiCtTmJPvl6luubPYySo
	nVjBeBzQ983ppR18l9hOY3O3TiIkXQluwauoz
X-Gm-Gg: ASbGncs78Joe6KqybO/Fot22nJdQ0HRk0Kz0QqdKQIenVRomO7R08z+Oovf52r6RcMR
	Tsoj5oY+mGXZ64iM/zU0+9TpB6I+mRVodaPbDPDHHellpVxuDNmh8mSEJi+ir
X-Google-Smtp-Source: AGHT+IEUOv+ttrgixa863IXDx4IkyNSORqkbzpzMgsE3AtC5i38dGESn9hxm+cgmL+2iHBzWVZ/gwvQzBFwaHgYd9xU=
X-Received: by 2002:a05:600c:511f:b0:434:9dce:75da with SMTP id
 5b1f17b1804b1-434aa0a508fmr870905e9.0.1732698427321; Wed, 27 Nov 2024
 01:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com> <20241122110622.3010118-8-tabba@google.com>
 <100b6b71-22d4-4513-9f8f-849a11c0a809@arm.com>
In-Reply-To: <100b6b71-22d4-4513-9f8f-849a11c0a809@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 27 Nov 2024 09:06:31 +0000
Message-ID: <CA+EHjTx4WdCNt=ZHNSMFygGDsy70LnDev4VpdTnhb+-j7QfdQg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] KVM: arm64: Rework specifying restricted
 features for protected VMs
To: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_010710_076514_A886C8FF 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Kristina,

On Tue, 26 Nov 2024 at 18:28, Kristina Mart=C5=A1enko
<kristina.martsenko@arm.com> wrote:
>
> Hi Fuad,
>
> On 22/11/2024 11:06, Fuad Tabba wrote:
> > The existing code didn't properly distinguish between signed and
> > unsigned features, and was difficult to read and to maintain.
> > Rework it using the same method used in other parts of KVM when
> > handling vcpu features.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
>
>
> > +static const struct pvm_feature pvmid_aa64isar2[] =3D {
> > +     MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, _vcpu_has_ptrauth),
> > +     MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, _vcpu_has_ptrauth),
> > +     MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
> > +     FEAT_END
> > +};
>
> Just wondering - did you intentionally hide the MOPS feature from protect=
ed
> guests here? (It was exposed before)
>
> I did notice that the HCRX trap setting is currently broken/missing in up=
stream
> pKVM, which means MOPS instructions UNDEF in the guest. Is it related to =
that?

You're right on both counts. It was there before, but I removed it in
this patch series since HCRX trap setting is missing.

I have patches that add support for pKVM, based on the work that
you've already done, ready to post later.

I will respin this series again soon, with the comments from Marc.

Thanks,
/fuad

> Thanks,
> Kristina
>

