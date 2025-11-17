Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C223ACEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=; b=py/eMI+drS2I3QFm/BpERASmKC
	+Tcw+svUgj6+R1iXjy6XaIr9T7BrUCe0JThwzOgG7v6rph3bT79vBQDDUXe2VGDoFSd6QwbxnskWS
	8/9jgtdzeo3GmAzHFYB4GEl0ANExxZhBuboEV28sd4OgEBx+mwQOdOETndcSJrXVbGaGG8uL8Ilil
	JXcEPG6hFvpy5eD1ycs6gPNsJ7QvZ37OJ1ISQG59YDK5cRUzxK6DDtu1kWWdcucwyhpyOKzgn9XkT
	ztv1irVxkwjnjsg+yAOp66dVFfSyvXb74pBcHhLdMQS0KdPc15atV8DSkThAgIAG8CDLbRBkTvchS
	5u+saBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Ou-0000000GLYI-3Xqu;
	Mon, 17 Nov 2025 15:44:20 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Os-0000000GLXt-1fNZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 15:44:19 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-92aee734585so176079539f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763394257; x=1763999057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
        b=F2WlqrsyRp+JByjNog2r3OQYOD7Lyh8BRSQLbHIVvJukxcJWvGd07ii9UGLhjL2nUW
         00oJRYBByM66YNpsnqRDqfQ8RduRWd6jABhMfPirHXTMhEXt4mf+OX5iAA/1XowNIDSL
         acWTFOWa5Sdq26PludsOaq9MKfjFxPLjqFtX730Aaow89v0OrqLHCNtqdeQFaqNoBv4H
         gy5XEsGikXon54zEQKMdMv4Qlh03ZJDYnS39pTtQJV2wy74nf2UbghjgBM5N3PzQiSqK
         pGfAayGnFyU37bMmDtnEsvg4WHGfRXIb1ltK9lOT0vWr1Hk+RTuy9fddfKHXPaqaZT0U
         lUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763394257; x=1763999057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
        b=MK/CFxgqUlc+7jWciIQPRUT7NgRPcAG3pBYJxBO7BkGt57Vagpgaz1MlC9eRE2jx6C
         1/1h0/vFyIQSxoQy6Yv2EWlHeWoXigkY70P7z1Hbh9DgmLRnyU9w2LFyd8AQNOrdgd1J
         G2CqTO0f6coukN2itfBVsVSncmraoHuIOKwrBqLdr3IEspGxvagEkdsaLNL7nueSB4FT
         KhfIOEz3Xqho7bB9F1cwQjLPxaaxGwsguT24lyRTkY31Q78uZ6wnE4k9qimT09q0HxaU
         5q26oJIoxGoGcXC9NsmlZUINJndyLoyDIJiVvBFldf/h4EOqlzJjchsCImCU9UpiW3WA
         J9+w==
X-Forwarded-Encrypted: i=1; AJvYcCXdRZP3QsrPW2HyHXq7whbHSUxQMAAKpz/6BE4Ze6oNrM05xNKPy6KBxNZgXtCw9l1TrGd09j/Q2HLoF7gP0sO4@lists.infradead.org
X-Gm-Message-State: AOJu0YxrEh6l7sShXTb3E4jRhw7Vm8d4C40KDOSxl09jlk078kB2ynyQ
	ThKH0SpXg37cD2thKx148CeXNJl9jIF/mbA9sUJJIQL19SNCXQiwDOYxO/2znYOociNhUchuFPK
	quqAOL5ryf/5Lz6Ssj8R0sRgS+FLD8to=
X-Gm-Gg: ASbGnct/ZV3yPRR3GmNuwhhJF1vt64ERsgM1DOZCyFcK99+h2HF6O3S0u0/egERSZqX
	XPcbCOaEDIjhgGZPY5cA+UWzYTxqUAN8vENgN3LD73tZL48STn3L8g85BZy1yAgj1opPQ7jLuIU
	/6ZWa3P8bhdIq5+1jKftv65OaQX9Jm5r/9MxXQZolS6kzf62YEnf2E/kYpJou+dg/ddKdUkm7Lc
	WIGmboEfgfMjgwZ6keMr11YiM/w5kAAdd6MaqCkbs0CRazcPU/fEoav+ZdZk/ew3eSiFXk=
X-Google-Smtp-Source: AGHT+IFbdBdmra1r1MTAuYm3h2YFina8VK1yyiL7rlrlzpAiB2tUYzJNKmJeOBR2QgET/eNSGZvdZJ+H1CdvND+9bDs=
X-Received: by 2002:a05:6e02:1808:b0:434:74a6:48f1 with SMTP id
 e9e14a558f8ab-4348c94f0b1mr136903685ab.27.1763394257015; Mon, 17 Nov 2025
 07:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com> <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
In-Reply-To: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Nov 2025 07:44:05 -0800
X-Gm-Features: AWmQ_bmyUIznEYyCXfUeRMdsertmn-wYkkRaXSqTVS6sR8e15JC5caO5D32ua0k
Message-ID: <CAF6AEGv9OVHBDF+XVNRr+ZtWijs+MDNUgw9zg0HbebuCQbHcZg@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_074418_441469_F53FB36A 
X-CRM114-Status: GOOD (  11.35  )
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

On Mon, Nov 17, 2025 at 6:00=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> > Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> > architectures. So skip dumping them during recovery.
> >
> > Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
>
> Looks like this changed in:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855=
b563c1203b33da354

Crashdec finding estimated hang location based on CP registers dates
back prior to importing that code into mesa ~5yrs ago, fwiw.. and was
improved over the years to better handle IB prefetch since then.
Fwiw.

It does mean for gen8 we are going to need a CPU based fallback to
crashdumper to make smmu fault devcoredumps useful (since now
crashdumper is needed to capture CP regs), but we need that anyways.

BR,
-R

> and needs_seqno is never true now?
>
> Konrad

