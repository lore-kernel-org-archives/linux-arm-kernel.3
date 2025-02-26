Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2516C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm+hQhpbBPZDXtIxFlvAlRst+7gSlpnJiPBA9eiFpWI=; b=Tc4eYHfT32Z8/b31yWYdsciL/N
	PmjzjzUy5m0YF7kZnvPjgK4nxkNd3lRTsGcn2YEu9OaxGf332H9msLSe9aKIZMqvvpgQp6/aGrGD6
	fc5KcSgHMJpVPM/JGXk49Dhj1d40PX31FO+IIUhx+hb/zXqJrL9vQvn7IrScTpQBx0RY6KKXlX7qF
	Ax187iETXShIIxArzfPA7spDk7Jn1d0ntlWfQ1GWJPbN2gEfsc+Sarpo3wz/S8HcWyyRP6j/wws4g
	Qqor1LAR4URp6lqo67D0mXFNwxJC39oRv+yPgii0w0JRzFD63Z27sM7R4SwwK286mhnVLRVMi6IhB
	Rxrf7Utg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMdq-000000054dM-3vOY;
	Wed, 26 Feb 2025 19:00:22 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMYS-000000053Bx-1owM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:54:49 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-471fbfe8b89so24371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 10:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740596087; x=1741200887; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jm+hQhpbBPZDXtIxFlvAlRst+7gSlpnJiPBA9eiFpWI=;
        b=HRod8h0dbqEnNl1DlFYHkyWZNlkMv+n/Atm8cPYZJT6ALoeRLBbXSnHkrqkei7N5/h
         Ol0BEmF7I5KnBsXOrEepr7JAkancb+AoZoj9Wu1oxCbJaK45wFyGn5YdY1MbbACkxJ2e
         Pc7t69LEyAOmv2lJBC6jbJhhN0rGyobLqthQ61XB7akczBOyWznBu66tZox3viqfLBSJ
         8MHhJDmqSsMW5z2klTi7t/am2zm6grS+Cxw52iKcOxfcUOl7wsXPplyQhbIesZZNGQVh
         E91xcXj/zA3NZ+OqAxFcHLaku51UGAfZdha8VV3u/9mbq1lqCGGy3HVcvHyokPuJXoP/
         lrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740596087; x=1741200887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm+hQhpbBPZDXtIxFlvAlRst+7gSlpnJiPBA9eiFpWI=;
        b=qCKA14KfZatx3BE+pu+7FffsDr4YjIN5JwaE1RA5eNUBb3gGJhAPdDWXu5zAkCmvjb
         P9tZeyE/inYZ9GdnNs7kHQ0DyoG0phIH4ZCTx6cOGjWo62fJ9ceGGcy4Isvj1i8Ku+QY
         EPhIDY+Ty/MUBoaCs3TLhcbR8OVQLdHAzCEOTvUngydbfrhOM7GFaDeX3HyQy7eJoPUp
         iBF0MUqn7CJ6wv7VP1dOHJBGmPyuNp7rcolEDBfw6o7Xy1ntS3t66Ov0IW9G4hksT3wl
         H0AUoQ83VN+st5gL15K9brzG54jeIqLM4hvvnBr1LYV0hm8rUKk11YwBoKaK5NgSyUMZ
         LvWA==
X-Forwarded-Encrypted: i=1; AJvYcCWXP3J6txXbxAjey5dd3cB3msssvmWQ1zfqVlAjIgNsHruUE6gmhgayA9tKN3Q6OdHL13bY+J0s32dKsuPNP2Kf@lists.infradead.org
X-Gm-Message-State: AOJu0YyH99nYyu/Fz3nNMLlngvlpvby/nn6D0r7HxcfMABPKVCdCsp1o
	yn6oH2Fnt89rTpVeCfqgmc+1yUNbOeknVj1gaCLtzqC6lBUXoWnv+/YKw9Gp/uuI85HpWJE+Ox5
	sUgBX0BND+1IdmBURqqmJdlA3UAAY24BBHBy/
X-Gm-Gg: ASbGncsIow35z4MVPy04mN6zcBf2AfSR0yU0T6yQFLKL6lObHtbNxeAh7XP8rlWHMDq
	c4gqrAe6yLMoV5JDPsUSSUBan/xXfz/hlJs3Hhqc3EVxrpLO9prVmEoKtJBG0wYyTIWCUETzJdT
	+jTo3mWzLs7pJpmVPdlg8+IPXJpWXRd851MIk1Aw==
X-Google-Smtp-Source: AGHT+IEvbo/qpO8zM6NEwM8415x8NiC4BvYaD8EjSi3ZRxS+phZeusP2fVadV5Yb1VRrKz30bhb6mW1PPbQZPX6zf/U=
X-Received: by 2002:a05:622a:586:b0:467:8416:d99e with SMTP id
 d75a77b69052e-4743eb158femr36311cf.21.1740596086874; Wed, 26 Feb 2025
 10:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com> <20250214150258.464798-2-tabba@google.com>
 <Z77n_Gv0X0bolONW@linux.dev> <86a5a9q90z.wl-maz@kernel.org>
 <CA+EHjTwRNj6z_TTCXR8UNiB0ty=85_VKWDVsFOLke31UGnBE7A@mail.gmail.com>
 <865xkwrai1.wl-maz@kernel.org> <Z79jERSoEvEtZI7k@linux.dev>
In-Reply-To: <Z79jERSoEvEtZI7k@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Feb 2025 10:54:10 -0800
X-Gm-Features: AQ5f1JqSx5kV2acKeViwRiAfykz0YO8iKO1HdNiNosGApuOWJ7mYmxLt9fS-EJg
Message-ID: <CA+EHjTwHZ-2sX38bsUQCSuwPbQC8pjHwJ0wCQROi2b+k_fHvZA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_105448_472964_51C7AB75 
X-CRM114-Status: GOOD (  23.99  )
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

Hi,

On Wed, 26 Feb 2025 at 10:53, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> Hey,
>
> On Wed, Feb 26, 2025 at 03:28:22PM +0000, Marc Zyngier wrote:
> > On Wed, 26 Feb 2025 12:44:49 +0000, Fuad Tabba <tabba@google.com> wrote:
> > > On Wed, 26 Feb 2025 at 02:45, Marc Zyngier <maz@kernel.org> wrote:
> > > > This is a copy/paste of what we have in kvm_calculate_traps(), and the
> > > > result of the removal of the dreaded HCRX_GUEST_FLAGS.
>
> Ah, I missed that.
>
> We probably should've just tossed it at that point, doing configuration
> for features we don't support is a bit confusing.
>
> > > > > Any objection to dropping this bit? I can fix it when applying the
> > > > > series, no need to respin.
> > > >
> > > > Whatever we do, I think we should keep the two side of the trap
> > > > configuration in sync, as this is otherwise a cause of bugs.
> > >
> > > I could take the initialization of hcrx part from
> > > kvm_calculate_traps() and place it in an inline function in
> > > kvm_emulate.h. This then would be called by kvm_calculate_traps() and
> > > pkvm_vcpu_init_traps().
> > >
> > > What do you think?
> >
> > That could be a good option indeed, irrespective of the fate of SMPME.
> >
>
> Agreed. Fuad, would you mind taking another pass at this with the shared
> helper?

I'm on it!

Cheers,
/fuad

> Thanks,
> Oliver
>

