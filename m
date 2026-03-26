Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A0110A88E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=; b=cUg0p/egzOzuGV6OnIK1GLyaQb
	8Bs+bH2+Np/rPsoqkr+m6tcTWHXshL+93XOzKAOsNuvMpEYjWaalKkrxpVo1BNArVTImATq2Gfq01
	DOujHYylaeASywpKbAYDqtteA9HE7/pzj5aYeXdXM6Uuj8ZttrvJqLwhWHCciKp5xY5rb9AaHPjaj
	EnyAU1j+hEpQrrbX7SEDwE6ddJ9S5DNgSWhMvJXsIrfaJsycqAo3ycuvgOaxVNSjurZD5IbVJhLfU
	XKjsPGFkKrNDPWwIL0s+wsroKBgJicem8HwWTMtgGNnYCTOJMYvcftIFjkpRfwAxKSxP0oX3p9e4Q
	hsFA1q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oYR-00000005x6t-3xqT;
	Thu, 26 Mar 2026 17:31:35 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oYO-00000005x5l-3m1O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:31:33 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12736a0147cso95053c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546292; cv=none;
        d=google.com; s=arc-20240605;
        b=ESQeMpv8pSgDrnoARO9LLswcICHyqPFl3O5AQ5RjK/xOHrQZSb1y9fye5Db+BKgQe+
         vdelvgrq3I27z1KrvF6QoFRkR6jpWDCXDiNULkrTVYcrYuS/kmiviXHt6Xo5MbnM7I1L
         5z5kxSkypjXMbi6mik/xrc02q8MaBds191Jz5Qx8zk+0KbyqIr9BYQxYWMKisKvoBF3g
         7963lE9YVOH6CslLc2RH1WqYLxBTqiPgp/Lymwf5+wIXSnJqgI6+nnHv6ObSNe68/RUv
         NkxhTMSGpjK/RbgPh44WoebKj0VXuJrgZ6xonS/uVnH0zB4bTj/ii0q8sIvofcJlj8PP
         MSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        fh=PjJjhMnuT9T5lGdxUtRDyfoe+yk9iII148sdr8+KU2I=;
        b=T9WLSN0vjWT/eig60f9sy02UND/R0z4nsGuDtxCdjmjaXlyyz142OG+EOKCbjzFegV
         LpnLUwxldCJ1c4Dh0piofrHF7Ii1wepTmaSin4W7DM/bwAs3ISHtghZbnQttKzZyFk5s
         tMD/B6kOUg929KRbJ3F9xsDLbf2D0lJL0WnnsS4C40pjw4d9YZ2j3zmvDoUlrgJZkgZZ
         pd2GpTgjNDhgS3D12UHyFx5YKHbuqAP8QoVcDSTsh0Q+juGcvo4iNN0yPugtXMYVehXf
         HWdD2RB94GClXQT6kjxvGMKIq+AwbfZ+2QR1wTtdpNQO8PafHh2AVDRPP61i48v0MOQK
         AiWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546292; x=1775151092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=MRrvansRJS1w8Ewvd7iUduhweyqspRRutRjPO3lar4n2Xp5sCiOR7HSepY/nEXvcfq
         3fpSugXKNj7SBEz7zACjnEHn9+lGDgVos4FdYsQTH860VKrfmnayR4rWSJkc33Ors8+S
         uMuIDxufEL5rDBb/3AoPe5XiLYahB6CZBOqNa5oOtjV6ugJ228tM7muvOqOjmXFFcglh
         ragtXr9rFOOiNZrud9sMjePe0e42/RnLtWSUiCDLCZ/RpS15qa1JR7JZYdVAdiWzHhHA
         8LG9aJOyDmwwid8BYB/7OTNa81PjbIY1G6rvkViKMwoeVAwt/Hdi0nT+rqYgQddrnPpf
         WgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546292; x=1775151092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=OsXfCFeUB6h+gYUGbe972xN1Gn844zofGz51+RIHaZu5a+5jNPy16luK32cx8fpFDr
         NhsEQtQxH+vEpvsaetwNwXROAEW2Jt9vajATzfzeuBW1I/ziql1Hp+FYNWM55JT8Kst4
         fu4bm1Ch2OEqEJahMXdU+y530OAKmTFf/JC55qGPYq/BgGbKkZ0xf3y6Ddkh5mhRA54Y
         F6Z1qw6eMWHAfSa0h2n2mUMiBZ6UGawU4zP3o+NYTluda2gkSuK5eRd1htxnJ+Pqwjse
         VpUKd18xk90ltWSSsexw2xqW3A+/gm0551+7KIH29jDmiFRo7iGZK3zlx2mgjA4TBw+N
         ee8A==
X-Forwarded-Encrypted: i=1; AJvYcCX6QRgBBq/BdTGdVgtcM8pf5teQrfSpo/q3pR8Nn2YrgDPv5RqXSI8nyS9pOv8lHbTntD73XdvQeHN4bYmlYNtb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt0T1EnPr+Smi1ZiyqHh9ImsmFAtYA92hcTIUH1myDkvWNKtD4
	Bsx4/zzmfDBEH7ibwW7luab8qluYrjY+F7i/A06JcSRP71+uDtGImwIdNROWvcvlX8OVa4ArWt4
	7koH7AOh/h0z9Gh9YHi87VEYCKfdExWc=
X-Gm-Gg: ATEYQzwGSyoKplz4f8jjAUyBQGvTizUyAcqu0FQQpDyMWXbPwyBiEwo6tlvXQ1oglGy
	zUazFiQW4ie3QezKWsKozFTCGC+6UeeCJq1gNaG0lLYneYvGRwnsnFjkhyi31x10a6rmByRY3DH
	FJ2BkE+jrNjAAa9PzsaHXcnaqVVMtjSPteoiRQQYwMDyMB0inzLo9O9EflNVv9ug/pGkN+Y0E3F
	F/89NU09wePuD9cXP1APSE8hKQqCDFIEE9r3UlPvySMRg55N2yoa+lQuwwKVexGaUxBdrJk9WSt
	8bnkmPSyZxg0g2+BPbp0j2YBDErbd5ySmb1zp/IIEpfl8rVz6l6CzBkF/cCFx5ypw8H+5laFI5b
	v1TPcL0ZF6d76YYntYcNeitU=
X-Received: by 2002:a05:7300:cd8a:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c15d3eebdemr2110432eec.5.1774546291859; Thu, 26 Mar 2026
 10:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com> <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
In-Reply-To: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:31:18 +0100
X-Gm-Features: AQROBzAY2TUlph37K4tdyrXW3PnWDmlLF1E76Ca3evvsqWc92x8ByVyN4OKTlu0
Message-ID: <CANiq72=fm7FnfM2iqOLvsgxxx7X4LBkr7XU8=LWYqSzQ7zjJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net, 
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_103132_938148_22DE6D30 
X-CRM114-Status: GOOD (  12.66  )
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

On Thu, Mar 26, 2026 at 3:31=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> It should probably be fine to use armv7a-none-eabi. I've mostly used
> arm-unknown-linux-gnueabi since I though it needed to match the
> bindgen-target (which is -linux-gnu for all architectures) and
> because from what I understand clang also uses arm-linux-gnueabi [1].
> Also when I selected the target I thought that we would also support
> armv6, but since I had no v6 hardware to test on I disabled it.

I see, thanks for the quick reply!

My current thinking is to enable this only for x86_64 and arm64, so if
you/arm decide to switch the target (and/or enable this experimental
feature), then that can be done without a rush, independently.

(Please take a look at Russell's reply as well about the short enums thing.=
)

Cheers,
Miguel

