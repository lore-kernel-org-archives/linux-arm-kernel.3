Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A686DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBrvDEnJYvhnFH7fX5PvcLxlTQTad9r13RWJQAwNzRY=; b=DXG+xgpUMgbHMequ3nE1E2RizK
	p1pXsuoLlHySPprrYhsj/azd+gLgFgadnCDcDIuN8C7p6D31/MrEDGGxK9ReDj1shagAH0CgGk8r4
	q20CEHhvcymqttsi/88eMHhzqGjzAhyWERRsvyhYzVWs1rfzvwna7kjZDIcXlXdb+ezgM1tHg74Jo
	5+ifjvJ8bVq7X8m4myc6QfNaJg0klHhFO+crj/8wLZgwVrMRYXLsANgdM3zoNNVsMHXYDCaOnMVWv
	cj8r0fIPLTcy7zSYLWTt1Y3uxQ2GrW5WTc213+Hz3ktvCNMMyDN9crlfIsKdB2RAZ7ifOhfU5oX4h
	qUHL+njg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Tb-00000008qdi-426K;
	Wed, 29 Jul 2026 18:57:59 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9TY-00000008qcz-38Uh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:57:58 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7ff05e5d009so17181177b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785351475; x=1785956275; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EBrvDEnJYvhnFH7fX5PvcLxlTQTad9r13RWJQAwNzRY=;
        b=eyx7+rZ1JENTk3L3P+zzAXABJHRajGP8fH22/nK2d9IhsoPhXDZp+gYdQ7Z5zZyS8w
         66chiar6+OJk7U1ceiqlMJoPLeJQkGc+UwfvpzCfCRkJF1GNIMeHTp4ZrE4espq2jteI
         urUcNE71huHnU380qqsAVXeQgSpDd20edw8asjVmPa8hN+7nUvh7/PIklXZbuEr7Bgp8
         6OHeryRutnCrAe2WVMLGzV4g3gaDjJV7F4xTvlx1eNUGTCtbCEvJHqcu6XwAHfIHYzQT
         0CKY0s6C9M03dA2nEaqjbNvfEhsNPN7w3Vr+6XdCmYe4ThcdAXmDGASNtB1ya9zoJGlv
         oH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351475; x=1785956275;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBrvDEnJYvhnFH7fX5PvcLxlTQTad9r13RWJQAwNzRY=;
        b=HtO+OqPeWATKEJskC4Dr5kyKYeSSx9Uy8svlJlUOybrGBLdB9GP5rFCxj7HFnKJ+Tm
         CioiTG9GlzgViaZ2SqlzFkhg95cXo6Fxuca8M/jY//gvosSLG1AJEmHa87uZYcGZuWln
         H+7nukuG9kLXj9SM9NBuIJcM82r55JpH4wSrUU4G2dP7OZB590RTcv8Ke+4lEM7jCVFz
         MfZRJ0opS5qptYwAIudqmzNLbephhFYx82ln9Dj0u8HHVol/EVA8LnPcR9ABpTe7uUr0
         s3D2i6kIjThXD4AqjuYxKJGrzmWJFowPldtSUFMyujloucuhD14DJCLa1wwB+1DQc/au
         0ixA==
X-Forwarded-Encrypted: i=1; AHgh+RqOhl7AmsPIDH1PWiS48OBZJGUfeMU3o3y4jG0oZUyyKGRDjJJsiA/VhZXuXA5Gnse69F1ZkgA7OwN4fpQJyh1t@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6i4YvzyOlRUzEm4Sm6Asx83SRdjQ99CBtqdiH+XsCbhBTaGr+
	qUJ5pGTlO+eYH4yBnstIiyZx9GJtfOKJ+Y0DthYsYUT32WU04FgDGkaP
X-Gm-Gg: AR+sD12leHpidQFKiELXhkVetTCeVo2HbE6sKGbA8Xv2ynWga+UhaL2mr91/P3pueaE
	XKX/3V8j2KoxkLdry0l5oCdKRpVQyujwBiIyiR+v3DLZNgAgu93nbiqScabo7lJ4jMRDDRNwKTp
	9lKw1xnoB7EK5CQuSsvywTOjuW3dIXMKyMk+4649z+CoZ0bwMfjq6E1ew9/RsQA/x/zU3Mr9oRI
	NVVo+lUNLRxIiVWfPPJYaYJa1mY7wRqyBcNTIJPhGemYlYnOn7woLEdalyYN2Erj6r8HYopO3GF
	gsfQbQ82D7SfSsli/Ugl09/21cUHQNr2StcWRERjq8OV0JuC8Ou3lYQInKLAZ0f/mP+vsE43kRr
	Tmu+NRZcJC2YTxqBYnkysl1JpRLMSEGLiBelzdB5r7pAr2zditdlj8X2zpx7F/sxdNoVh+Je9cs
	2IC8ID78Ek72JrOBSM7yKWM5teICDxuuhKLDqAzwqZMYNubbuxj+3/LAblm/IFz2zmgqZ49GLff
	AYXB4RSRJWfs8g2OAG4+eow5F2YpHGSBquxcw==
X-Received: by 2002:a05:690c:c08:b0:81e:4886:2727 with SMTP id 00721157ae682-81fb5de8df5mr374317b3.58.1785351474737;
        Wed, 29 Jul 2026 11:57:54 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa2756af8sm24846587b3.3.2026.07.29.11.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 11:57:53 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:57:53 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "willemb@google.com" <willemb@google.com>
Cc: "sd@queasysnail.net" <sd@queasysnail.net>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
 "horms@kernel.org" <horms@kernel.org>, 
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
 =?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "kuniyu@google.com" <kuniyu@google.com>, 
 "ncardwell@google.com" <ncardwell@google.com>, 
 steffen.klassert@secunet.com
Message-ID: <willemdebruijn.kernel.1758c8f19209@gmail.com>
In-Reply-To: <0f5668da79eb9a13dfdb9c97c7d71c5153b3a48f.camel@mediatek.com>
References: <20260723091601.72103-1-zhaoping.shu@mediatek.com>
 <20260723063935.75bf55e3@kernel.org>
 <CA+FuTSfgBbPkdLanqEgbDq-jLVQJax4fUxQ-tuzTuFwQANwxBA@mail.gmail.com>
 <0f5668da79eb9a13dfdb9c97c7d71c5153b3a48f.camel@mediatek.com>
Subject: Re: [PATCH net v2] net: gro: avoid nesting TCP GSO skbs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_115756_795635_C9378EFC 
X-CRM114-Status: GOOD (  37.59  )
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

Zhaoping Shu (=E8=88=92=E5=8F=AC=E5=B9=B3) wrote:
> On Thu, 2026-07-23 at 16:02 +0200, Willem de Bruijn wrote:
> > On Thu, Jul 23, 2026 at 3:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.o=
rg>
> > wrote:
> > > =

> > > On Thu, 23 Jul 2026 17:16:01 +0800 zhaoping.shu@mediatek.com wrote:=

> > > > From: HW He <hw.he@mediatek.com>
> > > > =

> > > > On devices that support both NETIF_F_GRO_HW and
> > > > NETIF_F_GRO_FRAGLIST,
> > > =

> > > "devices that support FRAGLIST"? Isn't it a software feature?
> =

> Sorry for not making it clear. The test environment is:
> device supports GRO_HW, and enable NETIF_F_GRO_FRAGLIST in
> driver.
> =

> > > =

> > > > the hardware or driver may deliver packets that have already been=

> > > =

> > > If you have a driver in mind please name it.
> > > =

> > > > aggregated into a TCP GSO skb with frags[]. GRO may then
> > > > aggregate the skb again in skb_gro_receive_list().
> > > > =

> > > > This can create a nested GSO skb, which is not handled correctly
> > > > by the
> > > > later GSO segmentation paths. When the skb is segmented by
> > > > skb_segment_list(), it not be fully restored to the original
> > > > packets.
> > > > =

> > > > Avoid this by setting NAPI_GRO_CB(skb)->flush for GSO skbs before=

> > > > aggregation.
> > > =

> > > I don't think we can do this. For GRO_HW devices re-aggregating
> > > in SW is quite helpful, HW often runs out of contexts or times
> > > out too soon, generating skbs with 16kB..32kB of data, the SW
> > > can help bring it up to full TSO.
> =

> I'll try to explain this issue below.
> =

> > =

> > Also, after e751256486d0 ("net: gro: fix double aggregation of
> > flush-marked skbs"), it's not clear an another bug remains.
> > =

> > If it is: as said "nested GRO" of hw + sw GRO is intentional, e.g.,
> > for BIG-TCP.
> > =

> > But it may not be anticipated for skb_gro_receive_list. One option
> > would be to skip the fraglist GSO optimization for such packets.
> > =

> > First I'd like to understand better what exact bug remains.
> =

> I agree that re-aggregation is useful for improving GRO efficiency.
> =

> However, as a general rule, a GSO skb must be segment back to the
> exact original packets stream. In tethering test, skb_segment_list()
> cannot correctly segment a nested GSO skb produced by this path.

So the specific issue is a driver that builds a regular (HW) GSO
packet followed by software GSO that uses fraglist?

Then I see three paths to fixing this

1. decline to further apply SW GRO if skb is GSO and in fraglist mode
2. if in fraglist mode, further apply SW GRO, but do not use fraglist
3. in skb_segment_list detect this case and fall back onto
   skb_segment

We already apply option 3 to various cases where skb_segment_list
cannot handle complex use-cases of fraglist.

This patch chooses option 1, which is fine. Alternatively it could
fall through to the regular skb_gro_receive path below.

> This issue can reproduce in the following scenario:
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
> =

> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
> =

> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> =

> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
> =

> The patch only prevents that nested case before skb_gro_receive_list()
> aggregation. It does not affect packets that are re-aggregated by
> skb_gro_receive().

Thanks for the detailed explanation.



