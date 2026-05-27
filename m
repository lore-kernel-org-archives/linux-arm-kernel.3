Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B57ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=; b=vt7/dqIWgLa11g2ijqVusq8Mfh
	8UDmLlNWYTxCTgeWwl9BHQ+3bdAYWAl0l3X2CorArjbRDkV3PT0FCjzyPubcsGK/qGJmR6W4LEjEt
	JoXt7l7uN2gocfFIkXVWr5+WG4XtzLxxaDx9hD1NgnNv14iW9immUV0kylbw0qM15keTrmIpwpHiy
	wNqIWA/T/HL/Br56wrjxn5tHPXyYzatYpyvGwBEIDLKpcfpOqhmR1waqErEwKtucfsAMpK/37qiid
	+BsXjuyXY6q46wAqk+/MNuPbuz7U6TAdHjU0wv+YKpqBIQZhVnAAVW7JZVOCHTMqUfgyGOYcM3ese
	1o6lGeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSJ1a-00000004dR5-3lwi;
	Wed, 27 May 2026 18:30:38 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSJ1Y-00000004dQi-2kq2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 18:30:38 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-304cd7d4083so669025eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 11:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779906635; cv=none;
        d=google.com; s=arc-20240605;
        b=OiRMAMaBru4obTkoWHyrpvDgGPVnETN3dzb6a0OViVqMjK5/77nLCQvPVo9E7jh4En
         WWXswCWo7OTbQTxpNyX9BkBVbjhl7ckApSRpUOHFfILUak7M0ruW0cVh6dsQvR2T9l/n
         /oW9e+yw8IFaNDhgxlP8awgfnWXlgTsKo5rjvSuu+Xd4dySPxpElQkcvm5ObWY/Ud7Az
         KHDEf3lsZZGHDhx+C1Jb+7iGnwYkeYIE5qyo/UBOYpMn+T2JvX9odxd8+USsOj/b5PvU
         IiT/4gEenPC+4UL9SqaflFNdMQiNRIQfaZ7sSJlz96Ip8HaJrojR5HJ7R1Mrwx7pr7D6
         mVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        fh=1Jlq96W2s8bMmkhhczWYsM32edxT6Sm03GaK2cxD0Hs=;
        b=I1/L1XHZDcUa2LSjmfFmEkkZ/wCQFm+kvsVL8Xc8CeTO/ML/xAbyfhFyJj7K5ZNz6x
         7vp/3P/fXQHP9ie8HAUA9UqON2ZGrF/7jkFgLLcgrXn2yOKeJjxBhHrlUZ2LYdE8GyIA
         EBwTHEXVcI3G110uQEIM3Y5zs1YOQFnPUHeGWpMvnaA9rTy7gPfd+Pnai43ecjkLRC7X
         PNbK1wwmU2IijTia8k7PLxo00MbOp4nMkMifnFvrCPLfCUnqVd9hFfDIRN9StTSZ2bG5
         JcdJIhqqncQo1T39CodCCIAH5ZwPBTZ0LNUpfYGFcgw/Zg6+wAUmJCxJMPezXdkZoN3u
         REag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779906635; x=1780511435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        b=K+4odZMPVWyG5v2PHWbxtHMgk+DI+19y6y9qDWohN/ATYXuBN0IdOqb10ZfhlraZtr
         QVjsurNe4RnyH5pfm4crgjNHfVwiZpqNoNL9bf3xQfMTOcX/Pr4qlkzNLFXaAAQzME2a
         BXucG49ZLG9teurIsQZgqTxN1ZeXl6VlFYIOniFkd6+YDhcaz88y38BueFfQWAXXYZr1
         VEz+qs0U5hNzcFuE6lt+9tLsCNA2BIHoudFWA+uVlBBLa7c90ctNjsr2ATO//fV8fyU8
         0PW2hk6tagheF2cGPqldbLqNczH4sj8VA6//h6Od1fnKfq1tPVDrbIfkh9J6W8Bu3sw7
         EjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779906635; x=1780511435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        b=JU3I48djHNjC8zj0DxIMnLi704zVn98pMcFDefdrGyy7DDlmRSwoEIjAatX/CKNY+B
         IUYJ7nT4SzqSoL8SpNbe6dDNyFTxEBh1x2Ia65C0qpckkp9DXsZw6s2CbaaPbw1XKUUJ
         P5OtqgYdb0AW/zE3ZQvSibo94MclsetBUaFRXt6AX2+EmHKWnRd2iMGBJ27KvtKDpV/3
         psgzLo0axgCuPLABdpuLkUMwUoQ0xTKSvBXG0YPzP3DxroRGwRkrc/vM12X3oxoI699w
         x0ZjITgs2ACvZLaLBUivg2WAdubBb/jdSyWIM2BnWMo0BRZaZ3It9ccg4m1TBpJSxI8i
         /Xlg==
X-Gm-Message-State: AOJu0YyEfheIFCrEZ6KDLBG3WbPdcbujv1YlCKk/O0aYobsBotWsXwOj
	7HSuFsRqhlSpL2HJtCmMy9c5n+RQkdSr8vgH5IvD0M4sq7Z1ms7lm1/SSSI9DMM+rm7OFyN7gtD
	d8NTzKNEOYXIFELTJpFJzEME+U2Qx5LxB+6OGKtHo
X-Gm-Gg: Acq92OGlYMNE0a1/V1TfSe8ATfLA63P4AQpCELbORHX7ccK5eRbcreC8mn/sk9pNCN4
	Eu2Cyz48d14Dz7Vj/7IdAHs7gF2RMgIkgLjLmh9W8nMuBK4mN+JLcPHGDoUtBRTj6FgqMYyktEk
	B1PHQ75cM9rsCgxZbYCnOLmpa55e9zSyLV6qWPSMu4iQEjnnIaQwP5gplGR6pOropCOwGvOhwVD
	z6soCpNv56KpbRXr01KN+G0VUvh8BDLO86uV8/CbhyWS/5ImPYnP5tBnw1r/NesL4G7HTj6DOjE
	EjXVo3Q2il46JolZTKkH9ihmqyDRIDmjMzwsaxmVl0DX+wRq
X-Received: by 2002:a05:7301:fa8b:b0:2ea:3370:6e51 with SMTP id
 5a478bee46e88-30448ffc5a9mr10859326eec.4.1779906633763; Wed, 27 May 2026
 11:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 May 2026 20:30:18 +0200
X-Gm-Features: AVHnY4KCCktAaAvshFXaUEjSxCxJfhTGbdSffnT8DJ2KsZSbTwQFBibAhZnsXPI
Message-ID: <CAH5fLgimP4Rp-jR5i4rpMDceg0VmxwY2pybKkcdJaPmcmkChFA@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_113036_703404_49E7DA54 
X-CRM114-Status: UNSURE (   7.08  )
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

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> Link: https://github.com/rust-lang/rust/pull/156980 [1]

Oops, should be 156973.

