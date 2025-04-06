Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147ECC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXcjfQUPwnO0UgUsVEpN+23KbNnyrfUQcReYlaRDX/I=; b=EP7/10JqHfT15BJ5kvsh+nMxEk
	1KKAA2c7sbFOFwnEqEXaHjBsm4cxel/n8StLyKL72d1PIJ49Fa2KGM6Gm7l4e+MIgjmEHSgflHPWI
	pZhcFG4rEV6lLvGvmoWTb37kx4wPCy0rJ8uBjNzKcIT2o8zyqgbxq2XNh7B0RNhl1FeG10esRjleA
	LWEa3c5ZxeRLXuubOTuKLcZSfU6MLi0AyWxtE939vKvPxaQvEZDKPzdb0q6T8FdqLo+99lG0/Usyj
	JOKkzpz3aY7/DODCc6uK4TdmPIWAvPoDL7XislFzhq/rlgSoQqQSF4bZUROaD8Gk1pZpEcQs8v/5k
	9RaSvsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Xd0-0000000Fqrf-1xvs;
	Sun, 06 Apr 2025 21:34:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XbB-0000000FqiY-41AE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:32:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so830238a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743975133; x=1744579933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXcjfQUPwnO0UgUsVEpN+23KbNnyrfUQcReYlaRDX/I=;
        b=nk6WV15oknx5yjMI/x4YZwjtSkHQ8WtdUpiKykjTZZ8ztgETTk9//f17GE+CPTdWwD
         zeb0Vt1ckDnU9ssn6ABw8cY29bnm7hwTaevDMSgn1eCDWXVXLme9SYRTsD2Ulij5lgyl
         W3AcTevGks63NMdKSCtVs5QTEMK3nrJ+Fuulreb4T9X04BCk9a5iamusXhzjhRD0GeIA
         0ufojP5Vyz3GMqzAJgIT9W162vcigXE04krAHwucaaZZnljUiZpmaQHRxMExmGAP4LLH
         jS5j7dKdHAyO73WcYZJ6PHDc3woWovTEOZXBA37Sr9MfRq/Dp7YAfjzGjJSi40e4x/P4
         wAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743975133; x=1744579933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXcjfQUPwnO0UgUsVEpN+23KbNnyrfUQcReYlaRDX/I=;
        b=WprLLshpzyhBSKXUTQVcnBy9Wx/R7SsEIfZQCo6CYXb/U2oQMlN/KOKqQwDRiQhFfb
         aoPWx7/Xdp9er89WhBi+rRoAhXM4BzuqCJ5eo83DUbKoeXNywXfUVi+Kb1VLoUF5bZ5f
         LQ/jWMvAGNonFieOwJSnNtoHTmHL7AT+WnjF0uTDBkv0TwYLY4W9eZA+KrRtKIN2bxi2
         G/4re0ZK/ZuYJ4CnLgrRNqpg/iq9qW4LJVggR6iTbl3Bxnd5tZXSYut64o0eFJnfyX6W
         FlTOnDFsEC9R8rFzspPDOpiG2sMO2tHu3t0dB3hY0dfTHQ595E3Hp1zqm7Po0SSlGPk0
         h81g==
X-Forwarded-Encrypted: i=1; AJvYcCX+wHleL+aKN9CMrI5SXX4Jindkmmi2iA20nL9vI0/uqn11Cc2QhEMwum4GH0r1+lXauhk7aK98z/MsdajD0mcr@lists.infradead.org
X-Gm-Message-State: AOJu0YzZgqpYOMVXrnvhkML2TKJsmhHKB4WmYSr1cAgD+tH1ubbtXFlL
	l0KPUAABgiqzwNX43j6aTRUGIxq+lk1Rgv3PSiGkB9JfPjwGuBYX9Noe5TBij2PGSIoQ03qvh1P
	X0cDD8bkq7+LOa7YRHJ7StqYOYoc=
X-Gm-Gg: ASbGncvEgEqv2bisXpnOaAu6J1JQb+MoPW7djxwnq2QwNMElHXgEThUMo0NCDjzbl5f
	/ZBpat7lUnW9nsldag+q3jejlY7gxfnh93S4wnvFioUDl0kPK2ZcshX1dci99Bp2eYQWi61Dq1T
	llUt1LqTx2MONgTcDObCANc3lz3A==
X-Google-Smtp-Source: AGHT+IFQbYiouQ2/NbpP1ljrGW4rJS6JnT6dvQhKHgt0QsEm4616TsbK3MEaIjOU4GsviHk3ZR9spj/mYoxJr3F/ZsU=
X-Received: by 2002:a17:90b:1d03:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-306a485aef9mr5781290a91.1.1743975132691; Sun, 06 Apr 2025
 14:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
 <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com> <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
 <D8ZV9SWWK1OG.1HLXBSCAR76CO@proton.me>
In-Reply-To: <D8ZV9SWWK1OG.1HLXBSCAR76CO@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 23:31:59 +0200
X-Gm-Features: ATxdqUHEJVg7rvB57HIIvKuiXqlFs1KJ3cq29SDoo0P-lZ704b83I5UzTDJ6_DU
Message-ID: <CANiq72kTh94KiTuUkqJG4Focc-ChpyZruDqAaHo-g34=PbEcBg@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Benno Lossin <benno.lossin@proton.me>
Cc: Manish Shakya <msh.shakya@gmail.com>, chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_143213_994621_3E1681FC 
X-CRM114-Status: UNSURE (   9.15  )
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

On Sun, Apr 6, 2025 at 11:17=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Maybe we should rename it to something more discouraging then. Eg
> CONFIG_RUST_BUILD_ASSERT_DISABLE.

To clarify: it doesn't disable them, but rather converts them to runtime ch=
ecks.

Perhaps it should be _ESCAPE_HATCH or _KEEP_DISABLED or _AT_RUNTIME or
similar -- though changing it now may be even more confusing.

The description already mentions it should not happen, and that is an
escape hatch, and the recommendation and the default is N. So if
someone enables it in production, they really went out of their way to
do so, and even then they are protected by the panics (that they
shouldn't hit at all).

Eventually, we may just want to remove it entirely if we never see a
case failing and/or if we get proper support for those from upstream
Rust for this.

Cheers,
Miguel

