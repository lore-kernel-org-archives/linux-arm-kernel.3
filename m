Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB73C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vp47jDk9EdbNa/22Vb4r2YNTMUCPmM+xIbcDxwo1z94=; b=pqLEchAB7qIRj3hm9NaRtw+49i
	2FKLq0TCinQTDeRckNUtWgN7YWG12bawLO1FicRYfpNutACZQJQMWOoI4VxwXVduYoZY31hLtm0Qb
	D8IgMZxIy73kG+F5xqrvT/AJsiQGFaqbw0Hs5hrM3/dWxJKfKjWIdbC155OErMbZgxiUJNcfTbzG6
	jg7W4KumYYZzTW1cphN/5Xlwu9Do09fUd1evr6c6kfA1JuKcAcN9HZcOKKPwfwthuDZZY7cyVR40e
	DF2OCRdvtocBNeHLetImQo0bkEPtOVNR5XQresLFCxrVWjvrh5fP0vi+Lh1lyc5wl83IHDGvJRocx
	WHg+e1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHk8W-0000000G3QK-232v;
	Wed, 21 May 2025 14:09:36 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjUy-0000000FwFL-2Ode
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:28:45 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-72c47631b4cso4914221a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747834123; x=1748438923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp47jDk9EdbNa/22Vb4r2YNTMUCPmM+xIbcDxwo1z94=;
        b=U899vaytEjK89nE4tbmLDEj1tSZJXhTAtV9hBTvf6HWhq+NH9uxAiNHHc0+YuHn7Sy
         gn15QKfctbnYkFLy44bAvEs/wJMYD8H0Rn1hL98cqkj9mNE+EKXCz2HJqHq2VzRFC/JJ
         EkKMFMl3Z1gJFiC+M/j39jUXGnxk/BY1yuYL7Ra4k1gtytKYMlFSDYtctlQD5CSA4e0P
         Ec4R7PEf4HO6dqs+V62uas1B6Zi7ls9F5L1TC6SJwPDNUAknN11/+oDSzWKbMQoBZw7Y
         7OElA2rSJjZQJnrK9xj6QnBnVjD4KOMCVCcPATrkgjoWAqr7Hylc8lOJfkJnkv37T4Ox
         wPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834123; x=1748438923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp47jDk9EdbNa/22Vb4r2YNTMUCPmM+xIbcDxwo1z94=;
        b=svxWmGRhobn/uYKlFSRa1oklI37GhxK3+qUTIW4a9ioNwMZKZx8LJzmaSIIDSwmLbK
         g/XA5fDJUt3BJc7TH3Lzm5xz/MWrlt0g12JyCpvQvfPGW44GM554Y1NMI1SZKvi3xo3q
         ed7IVqmcwxrZ5NaxQe5/VBpD5EhJMX6kKu9ZBNKruneVtoB0usX3yi0YF7Uz+v8tX05W
         Twz1OSI7v/QDbZxpMno9zmGvUj6nC3CBSFcOCtsIJYPRUlaMFgCmP4yGjUHBXmnn5C1P
         /MEiCTn1imAbH2wUvS2So8neJJBUzg2hhzUUezIU2KxzTWwkwiyyIGSsB09vgWOuRgMO
         nYzA==
X-Gm-Message-State: AOJu0YynnFCyrzaCqEQrpAJe8L9u5Zqn4sclaRsccz5Rrz2D4aOqis7F
	nxmiWRss1Hbrgxvx+6lYkiMWDL+i7ysGK3nz+3DP33Lt05O4ra0WFtRAT3KNN5lPsmypPHOGVC3
	k6GUMbPd4RNxt7AxJ/yrxBsRSa6M9JSN4kFciuuI=
X-Gm-Gg: ASbGncs5bNxvhLVcOSujMUk83g/iu6Edi6Fo7tLkOjwkv7Ivs7RS0VjjCzRudYCy8DS
	2OgZCkAjmQaorvveqtuhkFWND2VHzMTp76nTZtxKTUhrGQxqGC8sK0OtUTFpv6C9XNljNLLhyVH
	UqXq2eSbqlmfQiFBEkviAwFxZNZkU2rh+M5YJNJbzecS0dJZ45fkBudQoEgLRaCL1Dkg==
X-Google-Smtp-Source: AGHT+IHOaVukk0EM+lTVkJgI5fCyJJvCmSaqJ4uFqjPApedUD3Wu7UNEtmyfEUE/FiwATDeJm2wxlMine+dMoW6oFSY=
X-Received: by 2002:a05:622a:1c10:b0:494:a4b4:a21f with SMTP id
 d75a77b69052e-494ae366aacmr379074121cf.1.1747834111964; Wed, 21 May 2025
 06:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:28:29 +0400
X-Gm-Features: AX0GCFs4gqRQCEacR_P5jWt1HkYYVLmoLMkcLsui-cKWWqCoZfVHFoasVDeMjPM
Message-ID: <CABjd4YwoVRpJEMss8UN6xT9x4hf6GSjm34GtTHmmnHi8Q42DAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on WM8850
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_062844_612163_208E7A67 
X-CRM114-Status: GOOD (  12.96  )
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

On Thu, May 15, 2025 at 11:39=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Small fixups for VT8500 related device trees to improve correctness in
> light of current guidelines.
>
> While at that, also include a DT node for the PL310 cache controller
> present in WM8850/WM8950.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Alexey Charkov (5):
>       ARM: dts: vt8500: Add node address and reg in CPU nodes
>       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
>       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
>       ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
>       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

Krzysztof, could you please pick these up for 6.16?

No big deal here, but W=3D1 builds and DTBS_CHECK become somewhat happier.

Thanks a lot,
Alexey

