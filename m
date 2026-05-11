Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E4CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=; b=Pgnk5cU9YhdlT4a2oc3AN0zv+x
	ltqIleVuqm8cK4HRyT5/Q64emKBocdgJ4aB5RbVdWifdDdM2ksypCiQlrIpB09qTenzB5Uqo6y2qd
	JnPGas2TCiaL9oAty7uufUA+kI7TYSDRV2rnE3FuXp6CKpqTwjdlPInWjyJf0X2EokPdt4QpBiacW
	aZ65+gMADVDzmYVV7S+CG3avZqeDONsICQaGIbwdZ6VMai12JCktcotoQIKGVbkxq1KTxhBrmIgBA
	OjtNN17x57d4rfQJE2iS/hcpJi62xunQkASBzo9A30IQAzbOIfjscJ93I5GSrqzq8qKf4aOGu41M8
	15XYDXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNPe-0000000D253-1Fqa;
	Mon, 11 May 2026 09:58:58 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNPc-0000000D243-0xqd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:58:57 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2f16c892babso163425eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493535; cv=none;
        d=google.com; s=arc-20240605;
        b=Cz7XujdK3MCooPcMPvOzeyrtBiS9B2FCL07Ca3RJHVXWXDSccBQRGSA7oVD12COpWL
         KD3DIK562WYJaJw8SvaSyp9Z33uYLoGxsiEx8yWS59MdGX9FkLUPN/+v4/YZUhHlxgfP
         McFuC78vJ3IyCnLdDT0BotIaPHQegxGY8/67rqiBNeGSXneQvjSpr4KLvyfvZAI0/PaE
         NWo3q5dnjZoUB/xjnxE3QzvXZyI/q+zeQygoe02v+F/vDcgEEQW6dCSme6gCDfqU1iS2
         1ql96nqBhRSSyFHB8Pf6jimXFZF8cP2wYUN2G/4TVylidwIlNUIVf8XDPTf2YnPu71pX
         6D0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
        fh=86ZXbysPEqsVecPMjw40k+zYjIVmNt87mnWPMrpRZh4=;
        b=KmuI+nZDaP75re/vGfFZspkmh/+tcaaAhXvA85juVCWz0ZvTlAdVSh6LpPwCu7m3i9
         eNYK85xfOMPfuundVl/qHJ2phfh73mMxpAIP01bZKwFcrvLbbBb3EEOEboanWb0uxf3b
         VTlP7uiVFTX7c+zQvqdg5q2DsBZ8BVuDKNCIQHcEwZLUdvosAbpVCNljuLQDbXOeSV/8
         QlFCljKOyjUnxOQ4oWllZWIIDs+Rd/bT9mLASszNk0bRo7JhTGA/C38CF3VFaxuRddUu
         qBfy7g/1oluqhpLak8Tsk0alLP2yiazhziqrx/fcIoB0zHWzYHqPITcxS274aKYLjZIT
         988g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778493535; x=1779098335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
        b=B3fGlyGr8nmnTLxexU691LrBYhcDs3lvsxt+v2aaEf7idurpaLVoxwlPYXiz1YIxtA
         yOysbAxnulqvHpSQr7OzN6RIHo93wo4nb8iP1GqFxlRO0H816VJKlzlkuwI5ee5be9hb
         hDBS+DyLSeQ/+kKjmH0iRnxBFuWwCdYdoUrnz/dPjEc+VtV/wkYbTJrOac6cv9pP/xHl
         WxfYs27Lq3IRJXhfidXDtjsfbnc9qaGLfsk206urWQn/E1V+Ex+m9tdhvdwTgYAAnVE2
         vBn+UVeicJpOQRHnPPiMykNXrJRXDZ/urjUSN9a1jvjtboG0d3IuWsU9SKqFWVgSByTm
         eX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493535; x=1779098335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgAbfLZ25lu3eN+rVp08IzNGrcqim9qvYCZbACv6kgU=;
        b=sbuz3S0t1oTShE5/OWQYDYm+JaZYcZU126YhQaCjnnf73wiZcpIDwK/b62JOaXoRBB
         deECnAEbdw+6QmCrUcXMbpdW/O+h3DrzsrK7NZHHlEiDR4bMHXwucG/ovOfXkg3aagCM
         x5d2fg4pxeYzk11x0AJrtH2BFIhxttVrDV//vkqbn69QVJ1p8PxM9uhd2rJaGGjCeQoK
         8mpt/rBxZthA//dQtnVYrTjU0X9+OgyKU/q50QHVoUyXWIe5w298cksllg5OhpUFhz7Z
         fR4NttqE7kRt8Eczw9aBi0J59jS1Ztw7PZtSlNOpTvfvq6b7iw1CiSlZfJ1OoF15QKg2
         oiDw==
X-Forwarded-Encrypted: i=1; AFNElJ9V8a94mZRPlKf73LbEsHeass2eTbUy5uWHYDKyGBjbSSoSvZvqEIygvUEOhA3EYSRhIdbb0ZKLgmhnk/X7sDxG@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOSR0dG2bphqWfs0L60vaL+Z4u0RE2Uzyv7+x1Rx30Yc6r9dM
	Vh9dQg5iSwVxVws6dHm9WqjV2mb5eWBu9hObYpId25VrjYiG5msS2DtvaRzKTS7ya37QeB0Hf75
	RNBpKLfCRigY5VD4bHYsP7BiPJe+1tJg=
X-Gm-Gg: Acq92OGOB3VW+XLTQf0ydKvpXPXm8pJpZO4zJl1/b2FBAOF4RQ1jrirS2ycV/8IE61T
	t5g8M6tSEpWqFVs7OIUhku3+FT5/JEfS5ZaxqQ9zzz6INjg1MOi4rEIP9OHTxt2RdyTeOdoqexB
	kE47Vr/p+8kwTciBWZ+6s7LHUyD+Vuz3Mrl5/EtaeiO+4A+R8LU+c9f7JVUkBm44LAe2Q43u0bT
	1oF+ohv38WO+koZAOZe01kWETI1u33yFModELpYxRKIuckTAyoWD0CwpjkLvIPSOhnLJ4tVbOol
	geFH2Z/QZ/+K4KLoDZUr9m9nNmY8y22n6NaE9zqj6Zaf7/bYawXQZKRJtp7TzFleszn2P1eDbMg
	DBHb++pf5Ic6EcfhbUm6Xt+riplrGoy/+nA==
X-Received: by 2002:a05:7301:408b:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2f548ba3636mr4653507eec.1.1778493534947; Mon, 11 May 2026
 02:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
 <agGRnHVTLiwobb9W@google.com> <20260511090943.GA1029560@ax162>
In-Reply-To: <20260511090943.GA1029560@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 May 2026 11:58:42 +0200
X-Gm-Features: AVHnY4JBwbANAL1JBo2hZTZsbExaBqv3bNbSXroud4wMMH0avITBnenRjEHK_84
Message-ID: <CANiq72nm_3KM4gMnb0x34oJk1+_8XrUz-43zwW58Mr1UHG8qtQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Russell King <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_025856_269972_09AF83ED 
X-CRM114-Status: GOOD (  13.96  )
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

On Mon, May 11, 2026 at 11:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Sure, I kept it simple for backporting purposes but I don't mind
> breaking out the dependencies into their own symbol, even though it
> feels like that could be done when support for the sanitizer is
> re-enabled, which would truly mirror what you did. No strong opinion
> though, so I will send a v2 after giving some time for other comments.

I think it is fine either way, especially for a fix, but up to the
KASAN/arm maintainers of course.

Thanks for the patch!

If KASAN or arm maintainers want to pick it up:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise I can send it in a fixes PR I will likely need to send later
this cycle, so please let me know!

Cheers,
Miguel

