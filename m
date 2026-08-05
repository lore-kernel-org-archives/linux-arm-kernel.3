Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF207C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=; b=xIlwGJM/s6DFtfA6XnE5Z0MszJ
	iLoYFyus6ViUSVnZG6CnK6y6Qd34fozwn6Srxzgc9QVwiYj5OhTghMlJ3PH47wBb92ZFydy5wGDUR
	wxs84yMwkb4WLVl2LrkWXvHY/IHCvgnYZH4IOWD1/bftfpM5KZ8cTzCPmRTt6IdTGbTekm0EJQFr/
	C4pVXys+38VIVbAMEKAvPVpgpGGEC7XR6aNYUXNkQQCuO0VXp2eCajjDIDkwq1xL+fNtM3pAI9Lau
	VMJOeoIkvjrJs1kbKGbDeLM6xG+q1GFqWCXwWDqnLtOgIrSzUdwoXK1yF8lrZz8nh4CVSSh56LW/5
	9l5M/RvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraWn-00000003sia-315U;
	Wed, 05 Aug 2026 12:15:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraWl-00000003shn-1vKB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:15:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so156625266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785932117; cv=none;
        d=google.com; s=arc-20260327;
        b=KYdN+GnWV/BPL0/+5ojcg4IdGz4b1El7aAOCB5FSfnTkJJ3NJAf87iDatVt4F5NFVz
         4FXg0PV0NZun+yf82OrPSmGtoX5E/9aWc7MmrwonWjZ548d0l2OCMTy8G6upmSnJWAUT
         UB5uSqOhKC0AgbNXlO5WnCuun+VQiyDdoCRsbamHveMs3F9Wv6v5yG3jP1OvtCAJFUEY
         KtM1Lb2rujEO7aH6Qqox3mHmzG/9yTuWi/bL6hBHmjvcQQo9E4JziBVm2tc7FS2axW6h
         nRuD+Gt5Z0okQavOmsM32Gc8JVQQB+VVWHhq7dfIjjm3z0DiA5mrBRadqqGLl/gqpOeg
         jT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=;
        fh=PMNhF2+ulDVMWYKJNQOdcMjZ3BTOmlUZAHXtG6zo5YA=;
        b=W/I5EBV1EDs7nG46wUgZrUO2CUKrEpqo74Fy7k3PwUXicWoTzmSfdVdwCItU4q44hh
         OugH7nuASJGdBI0mWMVYFCz8mM801BL+S+frxDl9G6KMNBcuEWYUYHkSZ6yKuZIJOf3Q
         ViLoGUAQXlvb+B4s4sTbqJENdTfMpFCYJSzQ09zMmPDW39iC8Rd8yLx5lbGXx3HkfWo/
         kKtCHic3Fhsg5OeIKbmRd1/+wzOJ/yvfIF7HNLP+BqltM68QBuMrhzMrWQ2w0qRbBqje
         9zMR/QX2UkEtuhWMI5PGZbfL5lyLQt4wuOFc2RnI38eWZpBk6ex6NCzGAgXBEmzn0GCi
         6ybg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932117; x=1786536917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=;
        b=DJY4nrILG6DVHC67jTKPN7tRRBhQJhViSTfWRPjY41C0gDeyvF7IY+illqbCyzb3hD
         HdR8KZBgtap6H9BE49hM5yoIxVmXgo2oaTHDJi3ZLacfnJJkPERuBPobtjspTD0Y9Lq+
         GfaXZZkQd+tz74GkG4YVCKVZAFRbbU6uqGGiNHG+dKAbHMyPfdtFEn1DMDFXVJvgotAB
         PP9FkJy5B1RSI46n60kOwvFjx4IpJ90Xedau9dPwhZ1nQ3V/Unzw4eahfaeExPjv8LON
         34txlWU5lOFTTapnR1VCXvDLBXmvcCzkCbtZoXSGdFedZah/fRPr8tDYjqrpgwIo3b6m
         u2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932117; x=1786536917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=;
        b=sOvPsyuB0tel+M9D6EJSc1qfkDBugZy11v9WXLA/TeFQ7xrax0bM1v+BkDMcbs7y1D
         U2ZparOOy2BLNzZ98R3B6JzXjOUDSV6ir8Ru3x12oF8OxrhPobStpXtyAAFR/7Uit3VG
         Czfb0YI7W6CTq791qo96xK7dg3VL1u0s1aFGFjV/YPRMY1j0U91kqQ6oe3mNU9wOYvzt
         ovszXaY+M5BV+LQ4IjFyibuciiC4VEqyeKSm7qFqWNvulqBXYRnDLe+Zh+8pzaBosN+A
         uo++0aOuYkgKXCPnPeeDbU1zIuuS7iY8tBF/qP6wu8FyJ9M+H45f6bKVm+Gao08pJWuN
         WKCw==
X-Forwarded-Encrypted: i=1; AHgh+RqynZmSu5Tr+mt+RxXed9jwT8HdQSaXUbAkXEeCXVoFlIlZVEUeCHpfgUo21H5ym9VCrHJHsQ10TBmWEJjLJure@lists.infradead.org
X-Gm-Message-State: AOJu0YwTuxGLGLLA7LVp2wS4ROwzORSg0DYRTFx1ZhD+1EtSyMWaAIH0
	lg8lVFxty65Lciriag5SnSuFahfQ6UxUJJQWBWJvVhM7o/q3p27B89pFfEWjfI9zNGpuG1/8bNg
	ofUEjIpBmBfJZ9R9nxNuGusS51Pqb2OOT+XyKeOk=
X-Gm-Gg: AR+sD12z1OKH86j3VF0rJyPOvmgZi6iU/DfyOfoWrUOB/9vPMA9829eOmIvIIDUic41
	thYxUGIhyTaoXljKIl1iX/9X6Tu6S2iZISc8NTBAiv07WUaFwhN4Mc7mupWbR1YFX2TZxQUn3UJ
	4Qd0RuGpB5i/AnKrhI6yR96TQXHbQbyiH1Lh6lZXkXf2mm1hhnMoplXwfUlvc07UGuFnchW7kNS
	jYKeeEDEcy1TEzUGyebhJOnMne1vR/qiVeboQ5xzQNeG2JGzwmdg6elDgzbCbJqTtlgKlusbzyT
	v+2XnGzlaRaSGwexecILREGu8FtdYFOt9Ttyl37CnJgEesszM5CJGiAM
X-Received: by 2002:a17:907:94c3:b0:c16:5cf0:3aff with SMTP id
 a640c23a62f3a-c2039ef01abmr283671566b.18.1785932117071; Wed, 05 Aug 2026
 05:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260805070851.2885888-1-pawlik.dan@gmail.com> <anMJcp-R17Hx6DQL@lore-desk>
In-Reply-To: <anMJcp-R17Hx6DQL@lore-desk>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 5 Aug 2026 14:15:05 +0200
X-Gm-Features: AUfX_mxi7EYRrp2aol42yH7BvJv5JuaOmq_wG_46Ap5ob4pD0cDCrwN83dn9Pyw
Message-ID: <CALC2AphygKfbqvAx2_gcSV0bfZiTd9roe+c8Ekw8LfVFOOMu_A@mail.gmail.com>
Subject: Re: [PATCH] net: airoha: npu: use coherent DMA for mailbox messages
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_051519_523132_1A32B42E 
X-CRM114-Status: GOOD (  24.56  )
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

Hi Lorenzo,
thanks for taking a look.
Hardware where I see the regression:
- Board: Gemtek W1700K (OpenWrt U-Boot layout), aka Quantum Fiber W1700K
- Airoha EN7581
- WiFi: MT7996 (eagle), NPU firmware
- Tree: OpenWrt main branch + patch related to update kernel to
6.18.42 - https://github.com/openwrt/openwrt/pull/24551

Please let me know what you need next (dmesg, DT snippet, etc.).

Thanks,
Daniel

=C5=9Br., 5 sie 2026 o 11:59 Lorenzo Bianconi <lorenzo@kernel.org> napisa=
=C5=82(a):
>
> > Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
> > buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
> > non-coherent CPUs invalidate caches before reading NPU GET responses.
> >
> > On EN7581 + MT7996 that change regresses probe: the mailbox completes
> > successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
> > mt76 never binds NPU offload. Healthy boards report 0.1111.
> >
> > Mailbox messages are tiny and already copied by the caller. Bounce
> > through dma_alloc_coherent() so the CPU observes the NPU-written
> > response without relying on streaming DMA direction.
> >
> > Verified on Quantum Fiber W1700K (EN7581 + MT7996).
> >
> > Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox bu=
ffer")
> > Assisted-by: Cursor:composer-2
> > Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_npu.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/eth=
ernet/airoha/airoha_npu.c
> > index b679bed952de..d2f6c9c084b8 100644
> > --- a/drivers/net/ethernet/airoha/airoha_npu.c
> > +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> > @@ -166,12 +166,21 @@ static int airoha_npu_send_msg(struct airoha_npu =
*npu, int func_id,
> >       u16 core =3D 0; /* FIXME */
> >       u32 val, offset =3D core << 4;
> >       dma_addr_t dma_addr;
> > +     void *dma_buf;
> >       int ret;
> >
> > -     dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL)=
;
> > -     ret =3D dma_mapping_error(npu->dev, dma_addr);
> > -     if (ret)
> > -             return ret;
> > +     /*
> > +      * Mailbox payloads are small and bidirectional (CPU sets the
> > +      * request, NPU writes the response). Streaming DMA_BIDIRECTIONAL
> > +      * mapping regresses EN7581+MT7996: MBOX reports success but
> > +      * WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0. Use a
> > +      * coherent bounce buffer so the CPU always sees the NPU response=
.
> > +      */
> > +     dma_buf =3D dma_alloc_coherent(npu->dev, size, &dma_addr, GFP_ATO=
MIC);
> > +     if (!dma_buf)
> > +             return -ENOMEM;
>
> I tried to reproduce the issue locally, but it does not occur for me.
> Moreover, I guess dma_alloc_coherent() is not the right approach since it=
 is
> usually used for long-standing descriptors (e.g. tx/rx DMA descriptor rin=
gs).
> Can you please provide more details about the hw you are running?
>
> Regards,
> Lorenzo
>
> > +
> > +     memcpy(dma_buf, p, size);
> >
> >       spin_lock_bh(&npu->cores[core].lock);
> >
> > @@ -191,7 +200,9 @@ static int airoha_npu_send_msg(struct airoha_npu *n=
pu, int func_id,
> >
> >       spin_unlock_bh(&npu->cores[core].lock);
> >
> > -     dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> > +     if (!ret)
> > +             memcpy(p, dma_buf, size);
> > +     dma_free_coherent(npu->dev, size, dma_buf, dma_addr);
> >
> >       return ret;
> >  }
> > --
> > 2.55.0
> >



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

