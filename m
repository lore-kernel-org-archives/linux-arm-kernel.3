Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89C7C02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 06:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S4uOKu9VVqEe7X7KKiTHi9neVV7GE5d6hnqB7Mqor4=; b=mr0PPepZfhadsak5keZErCv1cp
	6lFajN7rsHuCdlXKkUkEwGE9voyXsLTBBxJKSfIeomnUlItDBOj6T73X+RPwUghG5gHlwD3cvnnhP
	KWz5d7pZtLgIqwVac4jRXmT09sT0nUj/sDl5yB446tJS9fNesl7wcxxqEv3pf+ZBOfdFakB5LgEr8
	mBIZA6SddWgvKAi5zoZPOltKgS59W6nCyiOd9eIPvAt2xmPtJIzu84o/EnKV7hjSAOt83RaP5tfIp
	ZrLXl4y7slfAB+wLwuvyIIjPhuqyy0XZVbZRFqU519/2WqkKQshfUz3br7t2WLc+8o8i7n0vaH7pt
	xNO1Y0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teTTV-0000000DQud-1dji;
	Sun, 02 Feb 2025 06:28:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teTS7-0000000DQn9-37Z8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 06:27:36 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21a7cbe3b56so50813675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 22:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738477650; x=1739082450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S4uOKu9VVqEe7X7KKiTHi9neVV7GE5d6hnqB7Mqor4=;
        b=In7+7xjuakDwGeRD+U1Bl48WimnmRiz2R1AHmT9q6BkJd07aAW1FNFOmNrzajEym2v
         qSSJzwj06oTkyLjkXJ/1lz+SoJJLZTkSN2M1bNnZvyUXEZf5DMhRjaIm1lZXbeInab0q
         hRjr8PyPCq8+hMRAThD1b1mYjp0QZPhqm+6s0QRv8D4Kh1qxGq6/+Ag3Rq9WJjS3kpzT
         LfwZXz3Ee2c0b4xc6hlV/ckIrvpVMf0HHVARmCnulCkuCmjwnXVVkav7N1NFiA4RwzJs
         3V1yt9omofRTxNJ7jjRRsYF4y1TS6b+C/RfLgOyTQPfUe+tWXRLjUNwpC0OJDn6TvjU0
         OUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738477650; x=1739082450;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8S4uOKu9VVqEe7X7KKiTHi9neVV7GE5d6hnqB7Mqor4=;
        b=GxuKsOsMiDbCtiZ7nmXrcwG9h802NpdG9+OXydtPfIZElgaxSalvKGn/HtAQPdA7/5
         su0Hyx6rrn6WsmHmXo4ZQ2y9YeVi+op6f0j25D+vIYxvuKzExzRaQ72U3XfVKwFFw8gy
         zfCRmqgS5LKMuw/Vcdle75z2SvSm0J6jA6JVenknH22rlyYBXIISK/Zi9trhv2se71sp
         XjeDu0fWTxEPYFfsa/KsNEF+EwZ6D6L4elJEL8eUdMrifEiXX71oxMb87jfDfsakIt3W
         fWPLgVpvd+Jte0UXNViyjlQc4GMi+1NM0FBTeLQW9dswoQKQ1J8lPwdq703mdak7XZ7j
         IyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHLy50tKg3/hPV76hX9oJFAfjs3BnVO92JaZ3RFDi4V2PqLlzzYmWxt3mn004+RzK0unxyQrF4w/vNGGWGKGPL@lists.infradead.org
X-Gm-Message-State: AOJu0YwE78V2+w7YRm+gglusynlWR4NawHsV/tCnxkVSD2c+D660+L3l
	ce7QG064awjyIzFEp6Im8+U2NWm4Wc2+3hYINWstK7hd+Gk47vGnXbhrESee9yyWbqzp/xgAZw=
	=
X-Google-Smtp-Source: AGHT+IF3pmgNiuLZzWrgGalALOUS4W82S7JLp/JXMoTR3Y/cAA5r3Na5/8SbPDs9t8W/vbG9IazixpuGrw==
X-Received: from pfbjo16.prod.google.com ([2002:a05:6a00:9090:b0:725:f324:ad1c])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9152:b0:1d9:fbc:457c
 with SMTP id adf61e73a8af0-1ed7a6e0009mr32711616637.36.1738477650356; Sat, 01
 Feb 2025 22:27:30 -0800 (PST)
Date: Sun,  2 Feb 2025 06:27:26 +0000
In-Reply-To: <c034b597-e128-4356-bcc9-79fb5e39a844@linux.microsoft.com>
Mime-Version: 1.0
References: <c034b597-e128-4356-bcc9-79fb5e39a844@linux.microsoft.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202062728.753686-1-wnliu@google.com>
Subject: Re: [PATCH 4/8] unwind: Implement generic sframe unwinder library
From: Weinan Liu <wnliu@google.com>
To: ptsm@linux.microsoft.com
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_222731_803713_F7195052 
X-CRM114-Status: GOOD (  16.62  )
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

On Thu, Jan 30, 2025 at 2:22=E2=80=AFAM Prasanna Kumar T S M <ptsm@linux.mi=
crosoft.com> wrote:
> On 28-01-2025 03:03, Weinan Liu wrote:
> > diff --git a/include/linux/sframe_lookup.h b/include/linux/sframe_looku=
p.h
> > new file mode 100644
> > index 000000000000..1c26cf1f38d4
> > --- /dev/null
> > +++ b/include/linux/sframe_lookup.h
> > @@ -0,0 +1,43 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_SFRAME_LOOKUP_H
> > +#define _LINUX_SFRAME_LOOKUP_H
> > +
> > +/**
> > + * struct sframe_ip_entry - sframe unwind info for given ip
> > + * @cfa_offset: Offset for the Canonical Frame Address(CFA) from Frame
> > + *              Pointer(FP) or Stack Pointer(SP)
> > + * @ra_offset: Offset for the Return Address from CFA.
> > + * @fp_offset: Offset for the Frame Pointer (FP) from CFA.
> > + * @use_fp: Use FP to get next CFA or not
> > + */
> > +struct sframe_ip_entry {
> > +	int32_t cfa_offset;
> > +	int32_t ra_offset;
>=20
> The ra_offset is not present for x86_64 in SFrame FRE as per the spec. I=
=20
> am wondering whether this struct should change based on the architecture=
=20
> or just set ra_offset calculated from cfa_offset for x86_64.

According to the https://sourceware.org/binutils/docs/sframe-spec.html#AMD6=
4
For x86_64, RA will be stored at a fixed offset from the CFA upon function =
entry.=20
The ra_offset will set to sfhdr_p->cfa_fixed_ra_offset during the initializ=
ation
of the sframe_ip_entry within the function sframe_find_pc()

