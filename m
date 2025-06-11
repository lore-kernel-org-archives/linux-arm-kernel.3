Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4FAC71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5Kxi63qWoofSavUm+pcIB+Uafiv7oyd/3nL/pRB+eE=; b=vCiCzt2BAy3KVK2j6Gd63dZ9LL
	wS288zLWZKPD3hX8wmrZVRS37J1wEw5KiAnfXBG8Jv3FuiJhuuG/95/BOpi6MtdFsocUraV1UEZlT
	E6FB5EchTNeXdeax7gd7yLD3HjnQuf6Yx6XoCoBJGn3e4mCH2Tqd1gINGW9eFk0mWN2/wr/tLRzpA
	E6Rnlf2fFJcvArHXPZjwtVoL00RPdvTj/ftqBhduN2YJBjkQfuJdV6eKbGBA/y00GBRPAgehKbBAx
	Fy4MfxjkGBwaK6CLSBxyRmVUqj3tvy2Qs3lHv9bM4X7tKLHCeA/tHSE/ohjcBC/IvOdrK6PZf5Wjr
	Y+HqKJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNNB-0000000AOlc-36nK;
	Wed, 11 Jun 2025 15:28:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKNL-00000009pNm-1E25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:16:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so5545130a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749644174; x=1750248974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5Kxi63qWoofSavUm+pcIB+Uafiv7oyd/3nL/pRB+eE=;
        b=BmC9hJ/GO/95lBQyaw7yYSsioz1cElh1dZGgNTlCzPBwcHXB6aMHstwudsFs+hF2/6
         0ESnujyFTSgF5IyRaXQbkD5KmiDG+5myhCXf14kttz22keG1dXl0TDhNiHjRvW92A/tY
         W64wdbrQPEfCbWyJGWrrALEazvT/e9fvGI9ie/l7a77oI75YgXlDpwaCagcBwL8Ur/lB
         CwhMGGcb/19M1xwkwP/EBwLwS/QLj+jswZkG8OpB79wmCfJW+Jgp6Xk0+hgOloGM5EG3
         yXhfYysrlyNJdTQO8tlby3ics01hyizdlhwnPUVaMPTRTCKBcZlOXYXaq3YOpHzhFzOt
         eswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644174; x=1750248974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5Kxi63qWoofSavUm+pcIB+Uafiv7oyd/3nL/pRB+eE=;
        b=NFTmYbiGFtZPq+RNSb3GKltWWphQq62K/iUhM9XA2EHi9nHATCbQYvn3dk23K5THLd
         dlFP3jaOYYM+g4EgbBpbOw3z2nQ4v+nCNTBr9JPp5isJukpPzYtrFxcympC5MvREAYDv
         VMKPRVLVA4LiA4rvVS/1HB4DYL1AEOPUyb5vqARI9uV5frNOVc16W9QAD9vGm1PX7++t
         DJhilPjuSRmX++2DRASsdjigFEv/0Y22CCskZkcZ02kqsvmGCHM/PYk4+qkM08u1Q+Px
         sx4iyPdrOw+74Lxom7hrDEItxqQNq9ZnCvfNFeErd0NYWFIyV5GsNQnofA4TqQW/pN47
         V36Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIo+DImn6rq2R8oQyBeHITab5jiRJrO3pIg/ctG2czcwoaXOrAaPP6rl+YJCiN6gOC6JBcnmS8d1yjzRE9p/f7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ZuPxW66SfdihODWfdcDPaAlIMQGPx/UwzVAyrNrpwzrA6014
	0u5JFWNqFJWePY2C3IWfs4VEvEQq3i31oo07hzPvvlYYL0ncmkYQn1yu2EXrk218bRue0vqpjIX
	tlkFH0rtQs0dHlzdUPJAlxdeV4EZRjF4=
X-Gm-Gg: ASbGncss05+O07k/CY9tG7jDtb1fvkCjzCIOYxH0Sn9BFGpQoyiGQxv6n6aKspURKGX
	8tnZwAuAN4g52Sgt36ipboegJZY12pz5kkKhAZ6E9RYSKMiFE4XIp1AkP6FDx47ZTfdyMPK3Nzv
	OCWCgW3zpHarSO+t7H3SEYDsQbuGcOY4EZqjYGHp3+LC7BrJcIau5Ht70=
X-Google-Smtp-Source: AGHT+IGX+IZijO75twzZ+fvU3wN8yS0J4BDLwNnzMx0C35iseQJIKnNAJ+smyd8hhsrs6cFi35u7iNDE7NOY/g7z/bY=
X-Received: by 2002:a17:90a:3d09:b0:311:d05c:936 with SMTP id
 98e67ed59e1d1-313b1fbe78cmr2804206a91.17.1749644174339; Wed, 11 Jun 2025
 05:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250606025251.887953-1-jasonhell19@gmail.com>
 <20250606025251.887953-3-jasonhell19@gmail.com> <27c1a3fe-4536-4e6f-a636-ffc0fbd52568@kernel.org>
In-Reply-To: <27c1a3fe-4536-4e6f-a636-ffc0fbd52568@kernel.org>
From: =?UTF-8?B?5b6Q5YKR55Sf?= <jasonhell19@gmail.com>
Date: Wed, 11 Jun 2025 20:16:02 +0800
X-Gm-Features: AX0GCFt9W87odWQcElyj27DLucsMkiMaKS5cZNd0kp8klMHeN1RPxkibO2hVj1w
Message-ID: <CAFGtgY35x=QdmvUrvBTZNDeaV4iMefznzc7d-RD6aHj8LgUaVw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Ventura board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, patrick@stwcx.xyz, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, yang.chen@quantatw.com, jerry.lin@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051615_328231_6E623A91 
X-CRM114-Status: GOOD (  13.76  )
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

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 06/06/2025 04:52, Jason Hsu wrote:
> > Document the new compatibles used on Meta Ventura.
>
> This is not what is happening here.
>
> > Add subject prefix for the patch.
>
> No clue what is "subject prefix" for a patch.
>
> >
> > Signed-off-by: Jason Hsu <jasonhell19@gmail.com>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
>
> Best regards,
> Krzysztof
>
>>
>Appreciate the feedback.
>
>> No clue what is "subject prefix" for a patch.
>
>v8 updated the commit message to more accurately describe the changes,
>and removed the unclear note about the "subject prefix".
>
>
>Best regards,
>Jason
>
>

