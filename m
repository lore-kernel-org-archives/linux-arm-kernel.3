Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA989C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=; b=4v59AvjDmoLkCTrQa+rVYIel0N
	bRsAqNPqJo+jmwjvGuubvrhrA0q45Wf/msbdZbYCV0Wy2vqHTQ2syxyvHyoIyWwhdeAs6TNe6G5Id
	cNkGiGhNQIXCLDzqAby64eHDTlMvFF73eIqyJAHMX/N154iC+J39Q2z/+MrmBc4CF+uczgD1vWsKd
	Y0qoAWFruzR1o3VeUp4PPhTYfOaUd+u1ILeX54aD+aGyxTu5UqGs+/nViopemXUGBJQNdfFtDgmks
	PR69HU3jilV+mTangHHlPQcJdjFrGjLL1HTEsdF9KsTvMPZ2I3pG3L0sko8cQ8gBF4rdzkXdaqhLU
	bEEkPOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8iIa-00000002HXN-1BvU;
	Sat, 26 Apr 2025 16:22:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8hHu-00000002DXn-2ME3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 15:17:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac339f53df9so623496466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745680673; x=1746285473; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=UWcVZ3NBQ1B3oe/AvuDXpSEp+Zdk0BBZJoalkjlmiVw71tjelQ6vL+9+qlSWeEOGiP
         uTBS7fxTxPGZgjrHyD1YL7yL8tkzCVE9AYaj/aY9ZH2nBNc/FdL1fbyR2fJC2JjCGhu7
         W0ZoUQsP7xRQFNFwm33Ds2MUh7T5OUj27dO3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745680673; x=1746285473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=T8dQBCSYtYwkFOV1RAw4y9jS+uAeMhY6DTHlx0M1sWw9rOBjVNgmW5jLzEfLfN5LoD
         bvdRyb1H2j/2D7OTyLx2fBho3iW+7ewbDuPmLS2SSJnAVubUGMJU+1ROTpZ2N262cTz8
         vN6vIWFx97Fhw8DpJW1JHGu4TMqVRXdFW8BFddk994FMlOsWKJ71FfEvj6Nz/A88tpRh
         neOrmWCL3arDPGSgJH6gIyGgA2v18rbQq64uBunOrvaTm4S8GAoQJPfNeDx8ZvOTTtzQ
         Lo3eRuXBNttyxwxVGU4AzQ+lqpCHD3JKmTmbpWUjsUzTa4SV1vgjdtgMVposubITjgyu
         OO8A==
X-Forwarded-Encrypted: i=1; AJvYcCVv1Vl0imKgzZBS7uJpU/FSdxJ3hqXwoYGx37Hsr6LsOFSxLdWlogDRbL69mA2cH3LEraXzN2yluT9UeIRQiqD9@lists.infradead.org
X-Gm-Message-State: AOJu0YxQgXJ6LikbKs7GWIjwWFsAuXtMmr5SGLimuZjEk1j36ri09Pdv
	jibBDA1XaBB9skWg+SgbAACkCSY0dN+gVQ/qO8O9K93qCVZmgECZcWT1j1Qp2vM99nXp2S5Q6KA
	etRA=
X-Gm-Gg: ASbGnct5EXH1WAZeSDIclMtkaLfLy6so+nXkpyrV6HGzBeBvHZICNvEtZcZ69yOmEt+
	PVfLRcgitduVdbhwXji5mefdQkA08RHlQhVWahFrwPv1AKZ1FeN1xD7mu5y4S8n17p+anSs0yfj
	HnhtUI20cdn4TNe2gjSVRjZRGJ579h7S3T7lqzVx51eQevyPvItdOQ7yTlg9uxseGLeV0evn1e2
	grTwveQZCNfcA8TZeUoEIMXZn+oV4l3wRVIdc0x8HgD5RULKqHvjuaJt8Ig0wqDTicXFfppiKFI
	67j6RzWKUvPRf77y5ppFsY/oPmDOtBT3HjyyOhuRHa0jCmmj+bJGWW5Xdio1Mee7NmMZHNEJYyx
	7BI+WMcUVRRmrNIU=
X-Google-Smtp-Source: AGHT+IGjvHR0eEgrwB7nCe3t75WLZLxWHw83x1PryFmnYRjRvm4dSlOxrIGpJXSRGY3M2VauZ2i3/g==
X-Received: by 2002:a17:907:1ca2:b0:ac7:e366:1eab with SMTP id a640c23a62f3a-ace84af4e8emr296560166b.48.1745680672707;
        Sat, 26 Apr 2025 08:17:52 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41cb08sm308239466b.19.2025.04.26.08.17.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4555729a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWURiRmQ3Os2CwwOv3Sq91aEDKvrCW8cp31GrgVwnyvcBt4bqRgTDM0WfLOaBrzw0Dcoa0KvMmfjaQoNnrxh9uv@lists.infradead.org
X-Received: by 2002:a17:907:7e95:b0:ac3:8895:2776 with SMTP id
 a640c23a62f3a-ace848c0439mr259814066b.5.1745680670908; Sat, 26 Apr 2025
 08:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:17:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
X-Gm-Features: ATxdqUFbLPq86s-2TFMi3kWckNkp7TWtoBPlYGSlRtiuXxSXCOJQKui7bzYM-j0
Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Architecture-optimized SHA-256 library API
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_081754_592510_D86880FA 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Apr 2025 at 23:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.

Well, this certainly looks a lot simpler, and avoids the duplicated
crypto glue setup for each architecture.

So this very much seems to be the RightThing(tm) to do.

               Linus

