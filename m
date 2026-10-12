Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7306CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5yMycJwawPg0C3KC+oeROk1OVlGqbmOeMxx37gHkgo=; b=s0Vo+94W1JFXB+iJPSLlI3xviI
	2PZ05C7efuy1IsplCZdJBtwX4OH3bXS0exxbea6M/MLG+lvRCiPNTdA+9vKz9UdrTmwWFyN6RbaMn
	V8taTuhdhmIxiVUzCYBm5l5rskwhTfLEuIwv/unL4qVa/uPuTajder+9zZWulKOLwMa8Cp7kht58J
	wNSONrJWDZDlDEQVaOZCQjGZ5bfrb8E4RGZKDsHSOzqp7xvuHIKtY5e+5WoEOeufVxRLPX1RX40zQ
	YCj4zk+dI/BO/9vw6KO2lbtmEN0d20I/+l4RY+ap+FNehzy6wGVmOuB7pPCJbyFrKFqbnD8uEyNnX
	f8FhO6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIr9-0000000AxUJ-2IbB;
	Mon, 12 Oct 2026 16:26:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIr8-0000000AxU4-1DLb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:26:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A620F43C08
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857FF1F008AB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791822389;
	bh=A5yMycJwawPg0C3KC+oeROk1OVlGqbmOeMxx37gHkgo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=H/y6NOSpa1dM7CEj5vQvvFBcP9cuGERYPsfPAlkJtFRd0ATEj36G6bXIK0Pl+VtDc
	 pPds8LGurpWdqo0KQAO2bBn2BPYtpcDVHyhWNOhZjJYeNWTcTfOpZYzE60m1AiP92Z
	 rcug3S2fT44XKbSZhWbM4RXyjC9l7rnpe9tH0xTKMKCZDe1bz1jqS2aiDJkPQjRSuB
	 WXnWGY4ZrazMfrnRmr2c3BpsOotfrHfqivHHx7Gl9+83nK2I5/QjLC5/mTXq1G7sne
	 ysUWStjhwxoqN15ElgaqBzyE2FRh6VVkhTuDbXQshlId2BvAAdOLSCUgCRS7uYAfY0
	 DwKXJZwd5lNRg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so6605781fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:26:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwI5W8vfGdqIcdzt3cyHI++yGwD6ksCzUH4KWaduEhzGXmXR/qtgwYpUZoNOJ+8ns4/0dogYkINmVVD9mYn0UR/@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8qD9t1D6SiQAs9btKmCGj8imJQfaAcFprEGSBsMhgTB6BdAer
	WTbtisu1l41UkgriCXc9GHdeNhMTuzZBKeZoK8scKRr0bQngB7ZUcgcY+6MOrXK+SXOFNDJIFhf
	ZOc7HDeA48b9noAtn8R31aPDPs6+r1VWGghretQIEBQ==
X-Received: by 2002:a05:651c:211b:b0:39c:624d:82b9 with SMTP id
 38308e7fff4ca-3a9c51556e2mr26412571fa.4.1791822388127; Mon, 12 Oct 2026
 09:26:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 12:26:26 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 12:26:26 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <asdVyUKWndnZ1Mxv@gondor.apana.org.au>
MIME-Version: 1.0
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
 <ar9qNirrzOTDLipN@gondor.apana.org.au> <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
 <asdVyUKWndnZ1Mxv@gondor.apana.org.au>
Date: Mon, 12 Oct 2026 12:26:26 -0400
X-Gmail-Original-Message-ID: <CAMRc=McxneS=y9eof9cO7CY2Z0GW6swk8JZKiCvY7wQxLyxdeA@mail.gmail.com>
X-Gm-Features: AclHuK90qLjVg-NEmXjcMIVyxP5clymZXcyYKBdYqwoXDXyduVU9WFnN6XNIWLU
Message-ID: <CAMRc=McxneS=y9eof9cO7CY2Z0GW6swk8JZKiCvY7wQxLyxdeA@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 8 Oct 2026 10:35:21 +0200, Herbert Xu
<herbert@gondor.apana.org.au> said:
> On Fri, Oct 02, 2026 at 10:31:41PM +0300, Bartosz Golaszewski wrote:
>>
>> > Please check the Sashiko comments:
>> >
>> > https://sashiko.dev/#/patchset/20260922-qce-fix-self-tests-v9-0-b1aa742e79af%40oss.qualcomm.com
>> >
>>
>> I've gone through them. None of the issues were introduced by this series, all
>> are pre-existing. I've added them to my list and will fix them. Can we not
>> delay this series any longer and instead work in smaller steps since the crypto
>> algos will be disabled by default anyway?
>
> The very first comment appears to be pointing to new code:
>
>> > +/*
>> > + * BAM DMA cannot handle zero-length transfers, so the driver always holds
>> > + * back at least one byte to submit to the engine. A zero rctx->buflen at
>> > + * finalization time does not necessarily mean the message is empty: the
>> > + * caller may have imported a state that already reflects some hashed data
>> > + * with nothing currently buffered. Handle both cases through the software
>> > + * fallback: reconstruct the running state when there is one instead of
>> > + * assuming the message is empty.
>> > + */
>> > +static int qce_ahash_finalize_zero(struct ahash_request *req)
>> > +{
>> > +	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
>> > +	HASH_FBREQ_ON_STACK(fbreq, req);
>> > +	struct __sha256_ctx core;
>> > +	struct scatterlist sg;
>> > +	int ret;
>> > +
>> > +	sg_init_one(&sg, NULL, 0);
>> Can this trigger a kernel panic during zero-length finalization?
>> qce_ahash_finalize_zero() creates a dummy scatterlist by calling
>> sg_init_one(&sg, NULL, 0).
>> sg_init_one() unconditionally calls sg_set_buf(), which attempts to resolve
>> the page via virt_to_page(NULL).
>> If CONFIG_DEBUG_SG is enabled, this triggers a BUG_ON(!virt_addr_valid(buf))
>> kernel panic, because 0 is not a valid linear map address.
>> If disabled, it results in a bogus PFN being stored in the scatterlist,
>> leading to potential invalid memory access during software fallback operations.
>> This path appears reachable by untrusted userspace via AF_ALG performing a
>> zero-length HMAC finalization.
>
> How is this a pre-existing issue?
>

Sorry, this and a couple others were introduced here, v10 coming up.

Bart

