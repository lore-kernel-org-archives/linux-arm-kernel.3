Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7366B10A88E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=; b=Bo5l7rVZ0gXCMIKjNcavNVX0IX
	8XYk8ztywW7gXys3iolkRY7S3ymHInTDPVYJ9Yw5tqJMeXjhjpEaoj2RUyeb3QAB+19uiIZ2WBxyg
	k5oxv37FJlyKSgXuMfQbTbn08Z5R/Ckbd3cwYlvkzSxg5W2vOCUmLb4QnYxhIQkwBwjNUoouhuuT0
	nipynj/jA4Zd6VQI3obKoEO0Hd+eG+f+NFejyMWB+bJ/Kk0xx2SulrG2w5IlcVNQ9jWo9mMDqMXe3
	erZtkQDfl4QyuT0AXwjWJSwVIHQX2DEvVvwjSO1/5ChUbqA4qTJEhlfluo9WTHV34S0sCQQAexfAf
	ir7RTA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oXO-00000005wwQ-2TdN;
	Thu, 26 Mar 2026 17:30:30 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oXK-00000005wus-0Q5B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:30:29 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-127148c2112so102811c88.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546225; cv=none;
        d=google.com; s=arc-20240605;
        b=Hef0ETNzXvtg2qwh4Im/7sDVXv7EPGYs+PCA/se2e5I6mEtePb8BL4gXK4+iNPu2B5
         SIUYipXPVxeagBPkxepeC7plgu7HyYCmcEVxRJKV8oUuQrSsgeXHIg2OynbGGBiS3kSl
         DdAL3Q+5NvdG5qLzCxctDHpiGfwFDRpxrgzMoNZKX1DP4yrr0oZrztdSkuSa8q5PjpM/
         TQ/fv4xCmknSiwaBAzBqVMabbb9A+K68Krvgpd812FGAXkAd0z66zhR96AZGW67QT+Ze
         rV7VnTm8OR6bN+FXU3KQKt7FyIVtg0NaGSxKDeaJ92XNg1ctfiX2b1Hy33iLEyHzsIiv
         dXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        fh=kj4eizJdw+hgRtf5qw1B/jc1lLwxHTnDDS+qVEnjPcQ=;
        b=iSO1tK33U+UoGoV8h12D0dPB6Gh8wc4mVPe93RkUeTF+pPpfpBqRhsnnvtHsMjJOEk
         h0zis1J0BY3sMa5s7oyxUu2J2gE6/VaPAajf39+JUYnfj0XQF8YBo+srBrwxn/ZrxCmw
         MQFPrVHg5qig+WrgIN+l/2Uv1rNqyjtnTc5CbYB0Fo2p7/UW6KELqx1asYVULsDuK4Uw
         ffydth+QI/LBtJ/e6r3K3wY3oa06srIqv6TOOYHdGC0mhEQpefRDVLPb9Mbr7qUaeFyE
         RtQOzRNgx5Q+ywEg58e+EfDg/LsxoOxMDrPl/QVqNutQzqQZBF0WJH2NthKHCbBZ0FyX
         NonA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546225; x=1775151025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=M+UQ5ERWQ5g6bo+vymD6XmOkQ3zXgZn4HaE6gEesSShHQhR73f9la3AGq1A8haVxX3
         Q4lscoS9qvNykNh7mgr0pFCB/dayiT0E6W0e2Yf5xFAlq436mDnt124hMnKMPHppCBJP
         Csg+Xm7DAES8k3lz1vBcLsosjNynWl75GTJ8RklvHnavpQ4EGlVL1FK2rnffqTixfB1+
         pfLGMLtpY5quyoL5vMsG3OFfdUFVyAUulA+sxiNGQBn8QBKnCSlnA5MrpjfGJV/Vyq5H
         HFN/PbzlGtr7vpC7NhCONh2TlEUmcepBpJM56Mg5l0p4/6Ra8t1Fh5ETRodHlAcneCEB
         jRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546225; x=1775151025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=cdbPSGlZERk0hqIsxqsh0Cj7eUrLzTPLICGyjJW++aS7QaS9clpWynOxIJSJAZ5LWB
         4HupD2DlAh6wSBk0Pu0T7do6e1E9LIZ2Uy3wkGrg17c00XR1wJsQFxf+prY3tzhqcrca
         CUHy5e4G7tF7gEowYJQRdn898O6410xndOM6ltDDs/+CiRSaYvTeP2/zVSDYyr5nHAgA
         KCaAVOY/Nw8lany3+LwHB0g8/TbhD2wa3YX+VRCtkrCTondjEd1mAx5oKufJs2Q9MByO
         6tt6xb/Vob836yM2KSxFfjruTgFRtmq2mWH1jYHInZBnvaDVxT7NjniEr/ur8/6MTTVA
         LxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUewiLcy3fNUXXPUPl7HhCEEJpKbG1jk9uw8qF6ptWjiLfa3m6ZgO2ruO/L7nmb0/Oks90eS1yrYG3PrhycWca8@lists.infradead.org
X-Gm-Message-State: AOJu0YzCefWTJFx26ZjbVZELL9TJqP5YWo48KxcOBxs3N3aL9qPQCEoZ
	+H8FSgw+D/JLslUXubGvQZh4guKl9Vl3TjydcdoCXJwSL3FgiNpIxMWHptKg2EOydItWSLA+gAd
	j4zJGeMrPon6u6NTvUl9ubY7x1P0xZ+U=
X-Gm-Gg: ATEYQzxSfWmeXOcgGzFN9NuB49BG52RA5flggDhUNwGyM1W2dTBFI4T4/PUnBnVpPh0
	yu6AcLcVHt718AGhLt+kOU5pdlCKgnXXOKXs9qnJPxAl9buu5hfOuxpACzkI0wZDyVQGjMzdwui
	nI3sTbu0j1L1RhVhlPYwI9KSfGAhrjR7rn+Ps7qvzOHqhcE7GKvdQZZbR9d3dmpCFwd5vjtzsi/
	Y9rZAtcksSPU2nwqGml5Wb/M+LSlCEK5p3GcFWgIh8ilOYIclM0Cqa35Do9AB2kUAlVkpSDTOob
	Wzf4PX1zmb7Ri6q4Jcgy17eG+75xA53IdnrFnB0sr02l+tOiUkrWouIaWRdGyRz5jiO+SDa7S4R
	ElEETI18sUul6xMyD5VnNNE4=
X-Received: by 2002:a05:7300:d50c:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c164162eaemr1927580eec.4.1774546224910; Thu, 26 Mar 2026
 10:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
In-Reply-To: <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:30:12 +0100
X-Gm-Features: AQROBzD8mk75r53XPOqmRDfmWXx9t0jf0bYbL_Ww497XzqV4mLKwGQ6QIr12vEg
Message-ID: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_103026_385797_DC2BECD7 
X-CRM114-Status: GOOD (  12.38  )
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

On Thu, Mar 26, 2026 at 4:18=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> I'm not sure if this is still true, but I believe it used to be the case
> that the -linux-gnueabi target has one behaviour for enums (fixed size)
> whereas -none-eabi, the size of the type depends on the range of values
> included in the enum.
>
> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
> behaviour, and I think there were cases where Linux used "enum" in
> its UAPI.

Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
`rustc` target, and indeed:

    #![no_std]

    #[repr(C)]
    enum T {
        A,
        B,
    }

    pub static S: usize =3D core::mem::size_of::<T>();

is 1 for that one, and 4 for the other.

Thanks!

Cheers,
Miguel

