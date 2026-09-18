Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F50C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=; b=qfEr9IpbdU4D0EAGV9XmUiM/fg
	ff2gIy06ZCo37l2mzUeJvESYAdoa/6lYMmnwQqVtKPG1VoJTFf6L7o5yaJnX+KjYruQgzcFYS/cIZ
	Ra0BIpgSxPIqj0aS0UkAYR8ZYLioTfVpIuISCLR0bF9Eto2SJqZJRdVUBupFmxtR2Nx3HxpR7rKjf
	cCWy+0U9KPtHCpcwKgXZCTRgdyDJIdUSDOBdL7FP4jhkPwcrRUa2NSo+xTNEZA1jp0gF4duY6DoSr
	IMu2k2vxzc8RPP82flADwIPow1pm2TFQdHe+jnwzJUZC3KC/a9Zsv9qCQ47/967bzopjZlmZs5oAo
	/IiNs+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X7S-0000000EIYH-2pDt;
	Fri, 18 Sep 2026 11:51:06 +0000
Received: from mail-ej2-x24.google.com ([2a00:1450:4864:34::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7X7Q-0000000EIWp-01tM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:51:05 +0000
Received: by mail-ej2-x24.google.com with SMTP id a640c23a62f3a-c254f55efebso92683166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789732262; cv=none;
        d=google.com; s=arc-20260327;
        b=RTSc9MHZjuozIZUEPcXcgG0yGBSJY7h+Oxcf8d4xdkbDHLQK3+JQC1vKETsctlNLFf
         eIJFNa1XLGvD1nzfq40+V5eXf6CedRBdBEfWDEqSIlOQolnR8f5wrNt4Dss1algJ1ZKp
         /t0CwkM1S5XsBrMl/hlpxxnXM8E8Xv9GN3vPdrZIzDxURAedWVfCn/dI8hh7v2VvGXBp
         oVxxHdZiz6XjCMCdSPy72GizkMm7uXsiRLi8mps3vbbcixZqNcFGzrpAcRi7w7zhVZaT
         Eu6S3se/978kH9lFAHcDhiZ4X+2gIYGbXiQ+YDgShbDVl98RFNnTQDVvX+Y3mVTuUtdB
         ZWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
        fh=AQmQKzN48E4+hXw2PXrWb2Z6V/An2HEzhzfrvZwbCX4=;
        b=dq0UJ89DVFk+lYsAgsQU7/HiY8ZddrUWf4i8SL9QyfUyNIOhLCt8+BJq6D2jUJOTvG
         wmCiq07HnguZPlSvwN9LAZSQKD/9asQiiJcht2+zRDT0KzyY28Of5engcCnJ/fBoJMxp
         n0X1E61gkAIWLL+bCOTwPdU7oyd4OglJFSogq7TEvy5hjWb6KcbfpIqjuekWyJ8U3eE1
         0JpCLWLJBqk1xstCnYWBv3EwRBlbBOqe+9gP1SezT6H1/xI1oBcVZ+Kave3cIkvqH/7e
         /1y/Hnr/xSN62dWX0CEuaHZoGQ5aDKxVX9If0A+a+R5U0Pmd6WoUHuwQeV37OIk0sOfj
         dVew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732262; x=1790337062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
        b=BSQXRzGa25ZYBnoUnE+dIVZ3tAdit52sq35fUuGa7ySRmYeFt8gbqZ2j+bZ2fDxiIo
         BIJkbGCopmORUS8Y5F4jdooh63WBXxZEgUmebX8LdeSoT2BpvFbEJX6U7gOvZEWYOz5y
         90t7f6Y7ApHbDO3HyetrDXHTCLvtHUMP8FehoVL9n8EWLxBPmFFc8SZ8/7X703kVfhjx
         sUmaS/86Fg4hgsScTCC5cJKP/YrXiRpu2kaUmKelJhJNYXrpagHLjuWdxIOtf/qKJiCW
         tRiaZecJn2IHVIRLjK/b0lCnbnhk2JyVeGB1/ennSkjzoArz1fDnmxNBmqBnkAVcoabQ
         UGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732262; x=1790337062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
        b=sjxzgn4R3+NVjUzQzoj/zquB4Dtw496aMN1I6emtipPFaGpu1SO32G4TQWpvMEqHod
         0I5SiHbHN78uOHHmwUnBkx9pZndWgC+VCGndsfssUpTqsSVtpV8TN5BX+UzUnKT3MHoN
         Tj7xNt0TBTFdH2UB+lB1ksffGPfXbdyO5A2vUoB6dEpKGVLulbRjLk7QFQkc8HdHP9Hj
         808hBu2M71X2cF36kplfUcXtqfh2UcmAw0QBsYVsHScaS3umHp33lJy1hwDfSoioTukx
         t8KxmSlKrJi0oTSj1J9r03AC1Xu4AuySsYsyQEceuIT6pU8dSKPFy/Ywh4KpdBrF26NI
         orAw==
X-Forwarded-Encrypted: i=1; AKwUvBzX2pXiBK/6pEUjNThfC30uAbx39rhSjGyOyunAwhms/tvuYPswHNjNXChVXPpJq2bdgXCvs6EBQUumqQT9YoWv@lists.infradead.org
X-Gm-Message-State: AFuF++kHFglH+i6CHgmFJlATildHnHneB5f4HYGhJUp2PN0Cr2hss1ll
	dtgiCVVpktBltNwlnuRpMpcGoGZLear3RCYZmBHhtZ62+jxRO+7bGgb4iWdR2X+1I4K3hMJxg3V
	ZNYUBgbYuk78bx/vpa1ED7BDiMZRE5BruWJVyUgnGKUrn
X-Gm-Gg: AYBFou3A6Ko8EHFYrL+3eTpO9fhpKiAvRhpYZPuCzQOKF+ear4rOOvQQRumrMofAB+y
	BAJvR/AdUql22yNYGli2jsh8PYs0JiS2MQfiy0UH6WbOrtUgHhW7reQYod3Qqbk8IXZ95UkA2HI
	arj7HfeJssze4ZHm2dWVBRUERSOBxrVEcameiRGyRnVa5TtPyOiPNF/va5tPIov3ujqmKD79cT6
	hxLC8ZvFeCkHyU63XQXNHcFJzvWgxRfUlxYi6ABbMNUpjHv0kLAm4b7oVBB+j3lOXH4ft8ntj2X
	Ofj18pR/3Wl4GG/IQvis0KjfXezdeRyOkSYDxL5Rod3IqOClmxbw7G7Jzts=
X-Received: by 2002:a17:907:970d:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c2a15699fdcmr247289066b.11.1789732261931; Fri, 18 Sep 2026
 04:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260918040214.85580-1-ndaugoing@gmail.com> <20260918040214.85580-2-ndaugoing@gmail.com>
 <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
In-Reply-To: <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
From: Yuchao Zhang <ndaugoing@gmail.com>
Date: Fri, 18 Sep 2026 19:50:50 +0800
X-Gm-Features: AcwNN1Wto2_O0uy6UTTB6in3F4ALPKeKnrIKn4mv5wL6jmnw_dTYJHrXeQ1oo0Y
Message-ID: <CAC2BP3K-fvW2s2j2ys+kPMuxrzeMw9yc6MrAk7U7CqCpb2WePQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from AP
 list on disable
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_045104_063490_EC7BBA57 
X-CRM114-Status: GOOD (  17.41  )
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

Hi Fuad,

Thanks a lot for pointing me to that thread! I was not aware of
Hyunwoo's earlier report and the discussion with Oliver and Marc.

I'll read through the thread and their rationale on the ap_list_lock
approach. I'm happy to defer to Hyunwoo's effort to avoid duplicate
work.

Thanks again for the pointer!

Best regards,
Yuchao

Fuad Tabba <fuad.tabba@linux.dev> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=94 15:22=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Yuchao,
>
> On Fri, 18 Sep 2026 12:02:14 +0800, Yuchao Zhang <ndaugoing@gmail.com> wr=
ote:
>
> [...]
>
> > Note: this closes the primary race (the last_lr_irq node itself is no
> > longer unlinkable while in-flight), but the fold traversal can still
> > race with a remote flush unlinking a subsequent non-LR node in the
> > ap_list tail. Fully closing that window needs the fold side to take
> > references before dropping locks (in the spirit of the prune-side fix
> > in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
> > interrupt affinity change and LPI disabling")) and is left as a
> > follow-up.
>
> This is the same race Hyunwoo reported back in June [1]. You might
> want to have a look at that thread first: Oliver and Marc's view there
> was that the fix is to take the ap_list_lock in
> vgic_v3_fold_lr_state() [2][3], and Hyunwoo posted a draft of that
> [4].
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
> [2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
> [3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org
> [4] https://lore.kernel.org/r/aiXvwGD1hS6vwLEd@v4bel

