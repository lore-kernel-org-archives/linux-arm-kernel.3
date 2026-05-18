Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E061CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI9yVR2/B5aXNHeSAguVUMpAX5AnmrVdpqHdbGlM8H4=; b=pyQ3UvthVUV4B6kXRUirPHA6Fc
	xDWZ9FD1yWQqG2b7s74BVyPiNJXuqGsNNzn+sf8RSaXcPxKkDrl8u4Q0iwM6J5a7Bkl4c4Uka80OY
	5VEaHIffeHE4/84Zq/2tPoLEUHnN0nZosDKnK2zBsXaMKg73bGvoZ2TFCf9ZtKLNpwpEJzV/CIFiV
	jFO0czNDDJMhQwk7ynKRRTjaZGZfyxysh6EICsyH37J9PwrN7OpomkPA/edDqwFc4qY6ooXdH/gDf
	1j38lArvQlZtyTAyYKyw9VwYokNhcfMHLhuZAKcd7dUDxbggz2pZqLK6dcLtR2ebv0kTTsv8WYR+I
	HRi4wYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqXy-0000000EJzx-19OH;
	Mon, 18 May 2026 05:29:46 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqXv-0000000EJzJ-3My1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 05:29:45 +0000
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-902deb2412fso249244385a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 22:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779082182; cv=none;
        d=google.com; s=arc-20240605;
        b=C84KJ2q0WmK55K1o4/0NFm/yXIn2ZVF89rydEp9us+JVa9FElxLPkNPjH8muECJ3QA
         yw5bfSAt5+mfJ6n+NTxpS4YOlFAuSmjwvIX4jzp82eR1o/dLClVEXG4kaLcaUyFpMKjs
         AOBBlZLVRSli2R28il0EJ6U2vQ9ZyL0tTVCoA/hu1TotVexQ5gD9v6YH+aVOkOzFMk/v
         kM5FA0Ln16WaARwrOzhpA1xDzwoz6B5vuXdzODI07x51db4K3+azQQuuR3Phc6YzRaAe
         /wfZUZnBt8awf/eCwU9D4SdjUZQxLiZLqJ/EqPwbDRiGWreCFOyJuYz2ze51sDq3miQ5
         dMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GI9yVR2/B5aXNHeSAguVUMpAX5AnmrVdpqHdbGlM8H4=;
        fh=GtOCcuMEokP5dKiIbNH23k7GLKq4utOYbxNm45Qggcc=;
        b=NSNI1rqXPbPh3sqlVc0SOTUPMSzsr5oGIvNEkoBGZv28+jfbdadecWd7SbThCm+cCj
         YaQ9E77DTQbYdf9LVM/IvFyrMOTjdrfUbuwaMIE8PEqh1ywHMtLW1lCZBgNHEJjPxLi5
         GEpW6KPxPTp4imnnTURFrP3FsqqH768oUw3SJyH3eUfj1Xcpw9tqh+sOwgtNopA9zkCf
         aok+uwO7U6oywibZn6LecUekoiIBcKIs/OqqoRLuK9Z8Vdmjiqv2NWySG64aZa51dF+F
         zw+MuM8FXy1TIMBNz0vM6YeMmXj81OE3s1UDxQgf/jJsXcvqYFbO+8F3Au/aIEu9NXpV
         FsEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082182; x=1779686982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI9yVR2/B5aXNHeSAguVUMpAX5AnmrVdpqHdbGlM8H4=;
        b=VskxkE2Xoo6sUGINbTUHCPxTr8Z7tZVETfKUCK7sQ5KJbGmQQSXW6H9BcyItdkNx2n
         4VxJBNMtd7SdIOEZ4Rny0uly1OygZwq1mJg/fdnlkjDK7ic3zRLA9Xomnucmi0x6Ltuw
         c/8+TZ94l/kpDoXzN2mTQm9he0wwraLFj52RzEveEMKjobCiDAMiGs6vrJUSqyG4sDJa
         gTbtws5Q3LzyA0yZNyUsl6DaPY+uU6A2IGxSMBRQItZ+32P07CY2+JIrZUmWLX2p6bXK
         p5nfPLufPFBhXpPk0wivFaMh2c9qqmh1B3WO1UcvBAeN5+wlR7aIBfLTcgrvzQ9BNy1s
         Hz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082182; x=1779686982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GI9yVR2/B5aXNHeSAguVUMpAX5AnmrVdpqHdbGlM8H4=;
        b=V57o4E0FLP+3MbnTQNeKJVL6DbBWoYPGFEffs9fnnCRe9sWyDHxCB6YmC4w0EnwW10
         LrtS8I3UQEIB5ik15G/7xW5yLaJynzwH8biErqAoJOFuBp5cdUN3TiS9HKixloHIUP1N
         vR0arPlJR424Sg8TbTZyH+Z+dbjil/224cZsvMHhPpyBYahdfPl8QZME5gD8rqb1WoUQ
         QdxYK6r6WiZvTYtJBMVaLZjnqNa2UN+uNlGml1Qugrra/uVEwAm2l13Xp6IijqHr49IM
         kfk8+inel9pN7ETr8UUf7exJwg4zJX9tn9rTwTtvkDo2SJr69Wyt6AwiopXZoTDro+NY
         XbGg==
X-Gm-Message-State: AOJu0YxP59wxo80QiuC5UgCVmyn+ynjopivc7AsmlNFYCLgVpEzmps1z
	Wx/Qb5SS/vqYnHJfueIcSwu8I+7KnZ0UNBwG8Hb17CPVinAsp1UZs276F8udXfCNmfBbEbZHk1o
	LMqL76+W4tJvqz3FnNnBQfcYiwJCyC91Wm8HhvX9YYA==
X-Gm-Gg: Acq92OF+tR6Mq3/8HMhmjSc3CLq125I7SuKF7l5eD4Ga2bxpnVq/SyTomtonz5o4CEP
	iVnL1J3Ij0jbDfyjFm8KXXPpvEIXcoSRJDsh8vi3L4cRGdhCtZTctE2Lw7RPWxtp/Q5t1YbeiGg
	jlVvfLH3alpKZ+EHwI3Y06IbTX9hIuKDke0gnQ+qg8WRtM65BUmuL4nEsGTm27hp4NtkY6UiDLc
	/iio9WxYimXXUcSLmzkEZL1ttCd9Sd2LgQEGIROX1qbiQM91XI+Byyu8KRive4/5Q5etHoU/1LZ
	oVsVPrNp5JyhuyC0U+MYjUAa1qqtj58sePTu3eMaRibi6pGBsKCPmGOPBfqGvYWsS/Iu
X-Received: by 2002:a05:620a:6cc1:b0:910:adf9:b283 with SMTP id
 af79cd13be357-911cd07ada5mr2106530685a.15.1779082182382; Sun, 17 May 2026
 22:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260518013132.130914-1-enelsonmoore@gmail.com>
In-Reply-To: <20260518013132.130914-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 17 May 2026 22:29:31 -0700
X-Gm-Features: AVHnY4IHto5HiXXIRO-A4qTda2cP6Od8aZDzkqVWuzldi1EHXCTKGtJ6siv5AMM
Message-ID: <CADkSEUjM4q=ORFP7dcYkPRYDk_hX24c3SFM1jqozoLC6aHy3Zw@mail.gmail.com>
Subject: Re: [PATCH] ARM: kprobes: add missing MODULE_DESCRIPTION() to test module
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, arnd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_222943_842999_AAED7770 
X-CRM114-Status: GOOD (  12.12  )
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

On Sun, May 17, 2026 at 6:31=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
>
> The test-kprobes module does not have a description, which causes the
> following warning:
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in
> arch/arm/probes/kprobes/test-kprobes.o

Hi, everyone,

I just noticed that Arnd Bergmann (CC'd) already submitted a patch to
fix this issue:
https://lists.infradead.org/pipermail/linux-arm-kernel/2026-May/1125867.htm=
l

You should just use his patch instead of mine.

Ethan

