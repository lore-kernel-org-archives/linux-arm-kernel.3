Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34000C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmc94BOeV/agrYVwd5GE2jTgxobDY3nBhtv7wGNzmI0=; b=BZNIzoN2Vt+R7EmJG71JwXf/D2
	hh8eeV7Ke5917lHLDy45oV7rzmFaz+OKzo11/eItv8eGFbAgg98LK7URBvy7D0vo0XTlwQetSUe9E
	CV5DZi0jO4TK6Q3AAFGesTIytfG6mRk9tX1jEm/N0ALfV1q8RivhSUeRC7hTxFOFgqXAmKI+amcmR
	2EfASaQVNxqaJmzzzDnzVfXXQ6tZe4gEhKKDkTCVjQdLxNdsdpcZ5VmENw6iYGHEJOAJ7nrGMHd7f
	0decNA8H/FWSgF+C7f6/sfn30oTL8gpKnzv6LuMFvqpN/5aSzIf9nQLKxZx1j3lqQ087UBNDa1h7u
	t/+uabAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1OT-00000006H30-3f7l;
	Thu, 06 Aug 2026 16:56:33 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1OR-00000006H2G-41cB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:56:33 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c15a5b265so6451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 09:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786035388; cv=none;
        d=google.com; s=arc-20260327;
        b=DwbocfKNCUKfFXqojwX/MOvqb8/1qGpfp3uX0NEyCbG1GDjZojFwWQ1jzhG7bCArnb
         L9+YweUQUlnigAejRjtI1Zx8Bi0PPvozHzXUgUPTggyFRspUeJbZ5VXtJrHBB/f1baMl
         U978nL1rp5TQ+sIE8ZrKZ5eY+zMlfx963r6qwCzf9UzGU9RFDERg8FxELAlvkzzGd8qj
         u5NjAxfgdtZDJrf8loEF0ii5Fm8LGpszyVoOhe583KFwraZ/zpOjojvX7Alz0dw2zRUT
         26FeV4IDJKv9NsdwPLvOtUfVMC0H6Y2IZ76ZdrSwuveZKbvZpLAn9UN8AlHCaoXQQ3EK
         oY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gmc94BOeV/agrYVwd5GE2jTgxobDY3nBhtv7wGNzmI0=;
        fh=5EUpP7brmwGUPfSKBtH5lnCpGHx99qdx9Vxm3kWhrWM=;
        b=TWv9DqxN0Q3i7Uk/L7eUe5eBA3QnLSoYwVcUgRoAF1AREh/5UVmtj1Z/JQz8H7Gbc+
         OPPhaLEGEvq6KNndYSqyhy8n0Eg6CrUJ6klEk5tBdzVi3GdIu+ijL8Uz1v1Up9gp0G7d
         jtiCSBvUEUqOewMaRj37QnxfEZaXwrWqddakCZTbeRDi6J+oNDrFJSlYWlPsbSSS5iYB
         /jilHh00sOlqQHbCk0cngi4ccKs/8VnzNtlW0kf/Vh3gceQ0XRtT7f7gAnOBIGRMv7sK
         AETiiApJM9THHHmYmD9ep0pHu2XJdZcdq+2jczL/aIUqx27qChjC03vnTMHkOKYigm3a
         GWmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786035388; x=1786640188; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmc94BOeV/agrYVwd5GE2jTgxobDY3nBhtv7wGNzmI0=;
        b=Y14weAO2Tybo2qDZ6h0PZf+7vu1G4Fyw+S7BBQjEdggRRE/VnFFquGLyRxJtweWI/V
         FV2w5LFcQsp5igZzg6gJGT9UYcRxUJe3KnkUBWUzjDQIRss3NITUb6C/h7yAmzOj7Y2g
         wR17ptthEYHITcFjhK+ib9Zs4x/yCSeBYIlyBu2TpCInWrlqlukrUvC0ZY/wRxfxbPHS
         z7icStnymosOwEYSJ/HWKlaksnALtypDVSLkPZR56iKg/MzkROxIOaw5g/OcmBaEG5qo
         r9SWZKFGwkjBOD6bo8cAO0DUA9QfKM++kEeJ6Bl3iT+mHyph2PO86QL6DSOIJPqbFcvC
         KkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035388; x=1786640188;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmc94BOeV/agrYVwd5GE2jTgxobDY3nBhtv7wGNzmI0=;
        b=L8oi/Qmg9XXOqHZIFuGRa9jL2Kt+6oIWexMuGKFPgPKqgN8DdlT9vm3/TVIMorkhkg
         IVlsPHVjzLqtFxT8ky3RtfISLbAHkfURRKS1FsfJt+Vs5hKJeAaDsZcKP7muKluxqnhU
         TaBfXD3e5VDEFAlqvHuTcBD59aWYiMa0ITXiaaa8CcQa4+FmpSu3XS6YuraWswZZaftd
         WbZNwljEgomGsmPFLKtSfS6muYrbCvgFE/29NpnaSSVb9k1LFA8esmLyR3Sb73RGSEub
         nv6IONzTUBipCUhgAezsYoGEakHbq0aLH00gxIzjPQBQyxaKIrI2a1Z1a4orae6rG3OS
         Jx1w==
X-Forwarded-Encrypted: i=1; AHgh+RowghFXFxtIDTE0kO0nWyXzd2dGSO9fcIX4hssRKazzXSntgMY7iXijk/2ergX3EkAxY+6zZvwYSoovD3UavpBm@lists.infradead.org
X-Gm-Message-State: AOJu0YxbK1Ikur05R0N+62W+whw7RuMC1L2+z/TPrxVofFijW3NZODNo
	8XQIC7ic+mtxRHqAH4HnnPDJN8XntK8EqMtnRw53XJSICY1SL8AFs0jVQd8xJzp8huVOTGbUsvE
	KWdTGjINqL6US8Npm0gmgqdc2BT08Mi6/VTn3dG1H
X-Gm-Gg: AR+sD120K03qn15WV5VMill7LegKY8+fcR5C6ruLFSd5SOR0G/zJ1rXpB/0q2o9nfrc
	lY+pHUccGA/2F2Ltl8TRxzKEBruvRQpGVLjtNFGN1PX4UV5qAeZb8r+P7R7aE6Mb0wu1c8Pctoj
	Rmh7mHhDA+UgyHw8VEMZze19aTNf3XoxB7JRL7qT4lqPuUmb3c7HHAv/7fCtC9pCwcqpwIeqVuy
	LXaQOhPkV5XLQVttjfECZGam4VlSG3jh5322li2Tso2/IW4U6yxJ/la659TFoXweqp9DSFcofrh
	rzmtf9MW+LOhPv2orNO3rd6dZHygdqPaSP2mZDxmpNDHv870+E+3mcA=
X-Received: by 2002:a05:622a:aa06:10b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-52cfea3217fmr17874811cf.9.1786035387706; Thu, 06 Aug 2026
 09:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260806150105.4010701-1-smostafa@google.com>
In-Reply-To: <20260806150105.4010701-1-smostafa@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Aug 2026 17:55:50 +0100
X-Gm-Features: AUfX_mwomSdWQ7tiQrgFTXXCNg9udOM-KnUsiS7N6B9mS0wCaSf-yQZNn_iicSE
Message-ID: <CA+EHjTzk154LY4Tb8mKCL5iud23M_VovoRAujkr6qOqEc4_rWg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_095632_005268_0850C3C9 
X-CRM114-Status: GOOD (  12.26  )
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

Hi Mostafa,

On Thu, 6 Aug 2026 at 16:01, Mostafa Saleh <smostafa@google.com> wrote:
...
>  void __kvm_timer_set_cntvoff(u64 cntvoff)
>  {
> @@ -63,7 +64,7 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
>          * Trap the virtual counter/timer if we have a broken cntvoff
>          * implementation.
>          */
> -       if (has_broken_cntvoff())
> +       if (has_broken_cntvoff() && hyp_timer_get_offset(vcpu_vtimer(vcpu)))
>                 set |= CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT;

nit: the comment above could note the trap is now gated on a non-zero
virtual offset, to match timer_set_traps() on the VHE side (well...
maybe you don't want to _completely_ match _that_ comment, but you get
my drift ;)) .

Tested on QEMU with a forced has_broken_cntvoff(), then booted a
protected guest: without the patch it hits the UNDEF, with it the
guest boots.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


>
>         sysreg_clear_set(cnthctl_el2, clr, set);
> --
> 2.55.0.654.g21b8a5bc05-goog
>

