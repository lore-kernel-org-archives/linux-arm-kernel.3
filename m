Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57533FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQNwBRjbAgNzOnHDXt2cviWbP3tp4q1M6F47A8vAqXk=; b=S1AB0GDpgtNJOxO7B/wHfBzKvJ
	wS3mFkPwLcYI5Ud/0xoo8Td/0kdN8PZMrQJTCby7CQEXndXXE1wtMPSe85vBePH/9bq7Zha2+v7dj
	mztO9FJHpQcCjCrnVAn//4CSmu04qJfYneNzjDFZ00G0qX/grm+T9T4MCk5wWwMjr8W7zPFGNyK/+
	kXihEIoasS4CCw/EmWQ8vX4yHNYrzpkO1zEq2Gs7QMNhewQKKkTkvk2xh0IK/RndSgF66dPIAyGVF
	nh5tCyNhWj7Ndf//kQ08M4RUa4qU+hZulrkbq6ojQoETg+j6gpdyx2sb6Dvb8nP5eZB4iqISu8cEl
	wsiRc6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJhd-00000009qCu-3j21;
	Sat, 28 Feb 2026 12:45:49 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJhb-00000009qCY-13zv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 12:45:48 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d598f4c618so905767a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 04:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772282746; cv=none;
        d=google.com; s=arc-20240605;
        b=C2+8lTXZSOwNk1HXgrP4BKqUR2J0pM8o3RypMTyJRawVM0oD4QWiyFjR3Xbaj1lLU2
         OFtTLOq9W+GXs9AYJMUhwY5DrZqyAQCasb7pZg3iyB9zHnY/nBd2uNg8ir2T3vCwBunD
         y3B0OkolS7XTQrt9oP7Jx8HjW9mk129o470aUcZ8QwtYvyOcO7lFYbxZRdbCGIxYq3Np
         WINyPuFFP/ezmB7VwfQeiEbiX98R85YnJG4BNImXZRdyfdVK+/HwtjNMOWPE9h7UeyUw
         UJNj4Up8hAFKtC0rdhpFQE9w1HIeUBhuI7M9dCpjpmXHS2FgLHTMBfDghTzCaxQYcNt4
         WYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQNwBRjbAgNzOnHDXt2cviWbP3tp4q1M6F47A8vAqXk=;
        fh=Hn5n1QJwDqe4n1ySWHxwTVfp6+9F2jX6KRLYQiHIpS8=;
        b=O/PO9m126ssLWjS38HjPmte0Zs22yOE/wWL+7wrYNkMBJbvdcfILpViW3cHe+tZ2th
         k8FRF8NRhREw+bLPiFTeGIpkzbX6ABoo7WrCLLaMYNi7bEGhMH9tRfy45EaGbaEy2ad6
         Zf3Md6WccCaMpD1IRFyHEMde5MMR5AjJw9qtyWxTvG9YRJ5nKHhg7U/vcE2Kq5LmOsNY
         HS2VtOKqaY7Jqt/tGkU861IEFjjl1lQOHqVpDGkf+H1mygLckzoiaEL7bJ+nkUzE43MO
         IvpnLwA/ibqlGkcNstGXWkAIuQUBtLMjJZwDXxa+XXkBPHsEG7kpPhZQUlM0aII7rN8a
         w1LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772282746; x=1772887546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQNwBRjbAgNzOnHDXt2cviWbP3tp4q1M6F47A8vAqXk=;
        b=CKWusFjEgw0ImweKl9sLP3s7akiDtjSTNPqfYGUoArn9QEGBJZVanU7SH9SKDWflE2
         lIhEA7ADHR5xJjOWG121CtpGPbH3iAf72BbDP8noXn8aymUckcW6EXCA5mQbMUFASwu8
         FjJkO7zaBupdU3g+QhrppdO9KnC4z72rhQgouQbG4lsUJgAI+CQBZY2wpscjJ8mqiAfN
         J+Vj4X5+C0ixtr5e8jK4L1nxDS125oQhH0jkUg8L/sEMd1LKnhEy93ut8ugMu6m1NTUP
         eV9LyywakyQVqNr9HSO7OgHnvrN1n0GbKxLMHt9ny4OUzyN9WotH/OLdaSmMjHfOVwh8
         hekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772282746; x=1772887546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sQNwBRjbAgNzOnHDXt2cviWbP3tp4q1M6F47A8vAqXk=;
        b=InKACD+4T5bf4X6Ct8DlLWPb8KDuqzA887S1vP/Q8LCTIg5U/sms7JGbPBHXPD8tqA
         EeZJoUL5IMgU7Me0TxEgRQt7lXpjem5nOyQ6mZMeRIIUodhmpKs1M9HMsCrR9OD0SI2Q
         Xao47dRnA6ZBdc8AioUTMdXdIY3xOEPAzmICNSvjOTBeTJ1U0weuIRTbtP+f+PQQ48Fz
         L5mzf6TmYOq2GUbt1Eu1e3BnfZQCKAQ5srMZvMxVXaKno7lA20LcAP/pjW4xCcZF6uvM
         6Swv+r1W9Je/53XNmsmGYKNZzcpvrXG9ezdWIQYr7OQQIyYl1wNzC728KNJ1difXFpum
         Cmfg==
X-Forwarded-Encrypted: i=1; AJvYcCXhMRic0Ebd21tLp+R2pW5gT1yZFI3SAe7GtcoNCjCTnT5G/cJ5qScbWGzC0OtH/MXRAlRs3AWx5zifjQFnu0zW@lists.infradead.org
X-Gm-Message-State: AOJu0YwrlJcP05Cw1SVDcu919zpqXDSJkF16O6EU82VyjDK4Uwlpn8h2
	F56PWtTAXHK6hUnuadnc+ouxvPYOp4LE65xP9QSdkHa8ectg/RrlDDfLq61JeOlBardWKOQIgtR
	RiDhXas+3p/693sxs0ZfwFjchkn3S8Gs=
X-Gm-Gg: ATEYQzyIyB4WY11L0PIHH8EuRpPI2Sg4ACugTfAN96LE2eD8EqN50vwdct2EwKMorOU
	l1FjGfDTtuNxhajuhcii1U/iSf7FqzXCjt3qy5frlb0fyx24V3NlgvU6FBW4g/guwUaWw2GjqLk
	Soo+GinPVWcV2DoorkhZ/b0asdY8tzIg6gKYSYT/gqAN5Zfzb2iYYq0XhiG59Kc0CLUM7TTSHM1
	5t7OYFfhJnmKMlvwVPTdJi3PmuVyhqU2KxBioDdGC9R9Tuo0ApjNmmU3nRHHTQik4fV9mXfEXH3
	ymaviFvWnABHOzqUfst1VWvuVqwt3dZnzSrlGyTocg==
X-Received: by 2002:a05:6830:82bd:b0:7d1:586a:32a2 with SMTP id
 46e09a7af769-7d591a0fdddmr3280301a34.0.1772282745686; Sat, 28 Feb 2026
 04:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20260228121311.3804-1-sef1548@gmail.com> <164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de>
In-Reply-To: <164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 28 Feb 2026 20:45:34 +0800
X-Gm-Features: AaiRm532efnyEnRj2Lxr1uAnBUd4k4TuEWv5ttzRccun0RW5I5YOlMDwUhZ8Iu0
Message-ID: <CABZAGRHA81sEqGLmptViMz8YEpi1o0m0GyJzDA7-B+tAb0Hupg@mail.gmail.com>
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: macro@orcam.me.uk, linux@armlinux.org.uk, davidgow@google.com, 
	dongsheng.yang@linux.dev, dory85109@gmail.com, ebiggers@kernel.org, 
	idryomov@gmail.com, jlayton@kernel.org, john.g.garry@oracle.com, 
	namhyung@kernel.org, robh@kernel.org, kusogame68@gmail.com, wdhh6@aliyun.com, 
	wqu@suse.com, yot4106@gmail.com, likerockman102@hotmail.com, 
	squid@squidspirit.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_044547_629913_BCE6240D 
X-CRM114-Status: GOOD (  14.61  )
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

Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8828=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=888:20=E5=AF=AB=E9=81=93=
=EF=BC=9A

> > diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi=
/asm/ptrace.h
> > index 8896c23cc..51cfefeae 100644
> > --- a/arch/arm/include/uapi/asm/ptrace.h
> > +++ b/arch/arm/include/uapi/asm/ptrace.h
> > @@ -119,7 +119,12 @@
> >  #define PT_DATA_ADDR         0x10004
> >  #define PT_TEXT_END_ADDR     0x10008
> >
> > -#ifndef __ASSEMBLY__
> > +#if defined(__GNUC__) && (__GNUC__ <  3)
> > +# error "GCC 3.0+ is required for proper __ASSEMBLER__ support. \
> > +Your compiler is too old to safely handle modern kernel assembly heade=
rs."
> > +#endif
>
> Having this check in a random, architecture-specific header does not
> make much sense. It should go into a generic header if we want to have it=
.
> Or we can have some generic postprocessing in 'headers_install'.
> But as most other architecture UAPI headers already have switched to
> __ASSEMBLER__, it seems nobody will be affected by this, so this check
> should be unnecessary.
>
Hi Thomas Wei=C3=9Fschu
I'm aware that other architectures have transitioned to __ASSEMBLER__.
However, I implemented this check here because Maciej W. Rozycki
specifically suggested this approach during our discussion.

--=20
Regards,
Nick Huang

