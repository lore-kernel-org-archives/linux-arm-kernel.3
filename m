Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51918C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 01:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7eHw/raYhzCKyoQvZO5b5gtYbr1anwl7xluE4HEstQ=; b=FyxChqu5GXqxEE7bJrhZLTXOpF
	4+9cYrJBMUwZPYetGRtcdc7ti4Ip7V/yqhjc6FjA4ZFdrEUliebQgNLKteWACZN81HBdnGXxMHzo1
	F91VwCla4fPfRVxs3Ogd7DRqF/Qlno9Nt6SZx0WLnYQhiyn3kyfBhzSoBf/FhVzKhoXl0J4yNveVh
	FmjjiTgE6G3fyxFncaOBADP9/TLAJkhyDSY0OjlOfxP0M2hmlCH3x92c0SkWxvsR/JKURG89DcRWV
	jJs9Stp0BBqI7H56ptLnRlTELTGRqnLRUrLxAtSW3s5mnzqw+VHLyv5fHIDvgCakfwLQu8CZjoArZ
	8VZmFEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whdVJ-00000000kS2-2AGa;
	Thu, 09 Jul 2026 01:24:41 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whdVH-00000000kR5-0CdF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 01:24:40 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-80bb578d58bso13987687b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 18:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783560277; x=1784165077; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7eHw/raYhzCKyoQvZO5b5gtYbr1anwl7xluE4HEstQ=;
        b=nzLGAHa1KLDPhOQDJVH+ZXJdz9FXDnwVfVRsIWWvxuwatizRxqPB9ukal2efniRSya
         dI7tdEZ6xKhwiwlBOK83PgdWAITY8PmzuDhE0F7r4VIEy0PDziZ087cjIuOWsQxVqp1O
         7FQEKZpTheFiolPfgiF0ZM4l0FXT+9NHbRvdW5e6E+Ou+43FsZeQy/4e0KVyFfmfV6Hh
         LowrQdu0GpNmu9j9bQFmx1hpDUo6R/ikf9RgYAjbaslO+fLE7JpfmIcrL+8Hq9JGpjiz
         A9PLlhQrOcMRNBV1NEAG7YUboSJYILFMrKNppdvItEDpYK15mF0s+xD96A7BwFT28jEC
         uKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783560277; x=1784165077;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7eHw/raYhzCKyoQvZO5b5gtYbr1anwl7xluE4HEstQ=;
        b=XN/Fi5Re0QUx/4qynzLK4/IWfhiEkqtUF5CCFVzXiCCFPJXhYkjPeh4/vWip/o9kav
         PXHCbuHCTbk45dLN/PLsodvpG0BzYNfprkeD+1xVFcWCwUmO8gw/NZsETXUeKQ1o35CJ
         ycU1EFmLez05GPApYhf/KTy8D9hqe6dML9wRhS9/dMb0bRn5YVJvMsVo9/b6Hnx90KPe
         uo5ymqrfxbBvg8xBif7gqnIVIFXzZGeSwcw49zzV3Oyt6hMJcxfRRDcWnleTU8PPbJM6
         EKZT+YDB+RIqfV8lvD/HMD+Ch0bqvKsiuezVwY5t5YEKhzdA8zl/rF6BTSdMN7Ah0XNN
         dcNg==
X-Forwarded-Encrypted: i=1; AHgh+Rq68/7pA91+byNieSSAPDJMYMulu4F0zagKjt/bxpGF3bCu4MfiCWHzmJZGacGD3CeOAiVMV8q+99ceXmNAPXoW@lists.infradead.org
X-Gm-Message-State: AOJu0YyaFOZezTk8HEyFWUNkuTHyMFpZCQ2QJvsCEAwOy7kmW7/IK/t2
	Ac4dktFkrgNksIEjUTyS3P8HVdCsp6IJtuJhURtvHV6OihYLc/SX2JDt
X-Gm-Gg: AfdE7cm2kUEwfiM/M1MyANDt+YngmFSfLoraYFTq9RRd1OhU5lj23xYJ8VMNwzNqb8i
	7pi7NaYwFdVt1pxKrPAfYE5Ud/BaRKKcnZW/hJNetRgzSic4lp2uLlUPBdMcvPVJH6fbGPTlgSK
	XvzdAu9sn9FUmHSwNyd3EtA08LO70pf4QOhgSShhJ4xtgNcQKZhx92o6Hm0PLrqexm0IreNRYyz
	D9DykH5q4AUfI2OF3ZE/aIt99L8P92/nVoRop17PxQiy+Jd5khc2UOEaufrCpV5OOvcbNo5qq31
	8PQ6RxJKbyo9pHv1P+Z8YaJoFAOpTr5URrEidgNO+NoeO7FztOWII19RyoBzLL9+ZM+ktLWuHlb
	Jby9R6ra0KIuY03M6+Q9s2oPDMkOxH47n9ebJ7C2jskjLYt2GTenmNraGWHNZdjE9cNyQ//hd3w
	ev/jQZRLuuGTFS1ECPmo854wXG09Xu52cBx4/bFELwSc09BNTiA1TvX5hoxgNdtRs2yQ==
X-Received: by 2002:a05:690c:12:b0:81d:4f4b:94be with SMTP id 00721157ae682-81dbd41c1a7mr37863157b3.32.1783560276655;
        Wed, 08 Jul 2026 18:24:36 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be99124sm6315537b3.4.2026.07.08.18.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:24:36 -0700 (PDT)
Date: Wed, 08 Jul 2026 21:24:35 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?U2hpbWluZyBDaGVuZyAo5oiQ6K+X5piOKQ==?= <Shiming.Cheng@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dsahern@kernel.org" <dsahern@kernel.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 "daniel.zahka@gmail.com" <daniel.zahka@gmail.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 "nbd@nbd.name" <nbd@nbd.name>, 
 "horms@kernel.org" <horms@kernel.org>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>, 
 "willemb@google.com" <willemb@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "sd@queasysnail.net" <sd@queasysnail.net>
Cc: "steffen.klassert@secunet.com" <steffen.klassert@secunet.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 =?UTF-8?B?TGVuYSBXYW5nICjnjovlqJwp?= <Lena.Wang@mediatek.com>
Message-ID: <willemdebruijn.kernel.31a5346f5d77e@gmail.com>
In-Reply-To: <2d71af40897d73dbd9e243ce5e25bbd3f99acc5d.camel@mediatek.com>
References: <20260707021425.483-1-shiming.cheng@mediatek.com>
 <willemdebruijn.kernel.39a3b0237ed2@gmail.com>
 <2d71af40897d73dbd9e243ce5e25bbd3f99acc5d.camel@mediatek.com>
Subject: Re: [PATCH v6] net: gro: fix double aggregation of flush-marked skbs
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_182439_093408_1CDC5095 
X-CRM114-Status: GOOD (  16.36  )
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

Shiming Cheng (=E6=88=90=E8=AF=97=E6=98=8E) wrote:
> On Tue, 2026-07-07 at 11:16 -0400, Willem de Bruijn wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > =

> > =

> > Shiming Cheng wrote:
> > > The skb_gro_receive_list() function is missing a critical safety
> > > check
> > > that exists in the skb_gro_receive() implementation. Specifically,
> > > it
> > > does not validate NAPI_GRO_CB(skb)->flush before allowing packet
> > > aggregation, as of commit 0ab03f353d36 ("net-gro: Fix GRO flush
> > > when receiving a GSO packet.").
> > =

> > It does not check .. as of commit .. ?
> > =

> > No, skb_gro_receive checkos NAP_GRO_CB(skb)->flush as of that commit.=

> > =

> =

> Is this wording okay?
> =

> Commit 0ab03f353d36 ("net-gro: Fix GRO flush when receiving a GSO
> packet.") added a flush check to skb_gro_receive(), but
> skb_gro_receive_list() lacks the same validation.
> =

> As a result, packets marked with NAPI_GRO_CB(skb)->flush may still be
> re-aggregated.

That sounds good to me, thanks. =


