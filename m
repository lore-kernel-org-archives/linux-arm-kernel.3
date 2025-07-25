Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C2BC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xNShpji0fsICCPvzG6Wl/tgjRIsSKcd2kf9KKN/dTk=; b=BsQwH7JwCG5lwLwZzlvKbNXadO
	G9IKQglzZfoxlW/JrO8Swm7xLwqZ05ELFuoAIau8us7lCXRFydFLBiKJtFX4gzfO9z8p0nuYfmEbC
	b9SBMYkMbcEEiufbxVZLlWTtJwJAXEeZP8zE5Vq2/xTX1j23leoRNwOVw0aOI6AO0oOK1m7RTO3bT
	W9H59ow0mQpOnFsnTGrQEWVZJGp7Yy+UfK1lSAchbNcC1FayHcI87eKPByLLKxQ4jB+X8qh/QlRim
	FZrU4oJ0yREfDL+3FqJIKqp9XfRKqCVjg4W2ndtX95n7XMVUYeHbFEVUZbGCdltewWt+5lttOoeSP
	IGfXcXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJyI-0000000A4A9-3zKV;
	Fri, 25 Jul 2025 15:04:30 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJuR-0000000A3jk-1N0I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:00:32 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7115e32802bso18723607b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753455630; x=1754060430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xNShpji0fsICCPvzG6Wl/tgjRIsSKcd2kf9KKN/dTk=;
        b=A12vhFqbO4ehpf8VdcTrqtP5ZvsVJSMzu/FIv84To99KwOBlF0YUB678QsVb7eUwUc
         VoouDAKxi7DRraCoOTJUXrYIn9eXBMQtC9ARvXtsxrPQeBATK9MBCLv+KQcDGW1m+dlu
         CWmYmuj3QA+Be+MJAXFgMREMWof3F9t9T89WUmsuXq3NLN1JqUCYss3QKLdASKufmkx6
         i4jyPMnmuCPHrejXTYXH7lUfIKDQQvu3r7l//VLB5UpeHz8odjdUmJPkjbluud3QtuMz
         y5BH1EJ8B4vehKdSch24u1fw2uAEDBIynzHtN8mlTYt8OUZ2T6iYqbiHNGoW6pbV1kvL
         Br7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455630; x=1754060430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xNShpji0fsICCPvzG6Wl/tgjRIsSKcd2kf9KKN/dTk=;
        b=KS7RN2blmDZdzYZ+9jldaR8KjMFWce3Lp3LcdoVPNTDz5szuBEXUTLMDfmYHlZ3KMP
         A0jFkdIXZD5jUk4oE9NI8ku1Ilq+dcEgpt8zP9Hvjj9qO3M4wXNrS3+LxDFJ2FMaznhy
         ExE3cmJ9NYQFENeIof1LixsH+alFeXjfpuZbstKF5Ta4nv+HC2F477YkI80tUGac4d1p
         esx523Fn141XPtsT0WYJFHfNFX+qeQL3QkeOmd00hRrLtFfMkOxLOriHXSrRzZIbBJxB
         MzjbUgW1AuhVlJoFKSc86CSavfHZXpzA2NPagRAcvZ8tCGOx4pBmgVRs5gjVMr3ONYV1
         EWdw==
X-Forwarded-Encrypted: i=1; AJvYcCVTagitj43rtHd7tpYTalo49td+3oCeXJXECpW9jIsCwt+H2nrL5nBTjFy/8xfhVJmX8PpNDIt2v+lSbzlYbs8l@lists.infradead.org
X-Gm-Message-State: AOJu0YyVWGHQevYcEjAeoYk4hapuESbmevzAJ1jUhBXJVq6wbTp8/xGG
	Ui3VDxYQZsFpLyBF9d7esD6aybZQnV/SFncUbAFtfo5zvflaouo7wuzf+fHOIq0jrOy9U0pHa5n
	wRimyvvZzJSYVjHMuIb/VMnd3/7P1MXY=
X-Gm-Gg: ASbGncuZxG4k8ppA8/Ui4EvqKOyl8Tp5drkw4KjsArfza63D9An2tW2gU8aVTYaML9v
	6VX5XFH+HR94VgM0EEYUtso9mhb/WTXiLZldVrmVefHxkQUulJllgmnWjtk5gYDIbUiZtWB7KAu
	8tfmlVrDdPXN0TZ9Y5tZLVAIViv9nVGF7/05BS8FUTeBLuq4ljd9XFzCYvWNNYVkG7nA==
X-Google-Smtp-Source: AGHT+IFFsgkwbTdDe+l+QHIu+9q/GM5qnM4JOIEx0sdA8nJsAiQgGxI6Fl1CGg8Cg/PU2qFUrAYIxSRmTXHe/tLW0Ww=
X-Received: by 2002:a05:690c:25c6:b0:712:c14a:a37c with SMTP id
 00721157ae682-719e34035bcmr25041807b3.27.1753455629445; Fri, 25 Jul 2025
 08:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250724235144.2428795-1-rananta@google.com> <20250724235144.2428795-3-rananta@google.com>
 <aIObyUg77Um6VB45@google.com>
In-Reply-To: <aIObyUg77Um6VB45@google.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Fri, 25 Jul 2025 11:04:57 -0400
X-Gm-Features: Ac12FXz8NHnrVdzHNDcxhPTNsHLuOduCZf4Wyi1keCwnEJZCLAUhskItgcgvirI
Message-ID: <CALC8CXdbcFrrTzuLtG_O0YH+JLugGwQNsv4DsMZah35XvvHcUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table periodically
To: Sean Christopherson <seanjc@google.com>
Cc: Raghavendra Rao Ananta <rananta@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_080031_366462_AC877CC3 
X-CRM114-Status: UNSURE (   9.31  )
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

Linux License of PaX/OpenSourceSecurity should be canceled

Pax/OpenSourceSecurity(R)(C) has prevented redistribution of it's
derivative work of the Linux(R) kernel successfully.
There have been no leaks of this derivative work.

They have also added a term to their derivative work of the Linux(R)
kernel stating that any redistribution of the derivative work will
incur a penalty: no more derivative work and withholding of paid funds.

To avoid this penalty no one has leaked the proprietary work of
PaX/OpenSourceSecurity which is a derivative work of the Linux Kernel.

OpenSource licenses are now considered a joke, and opensource programmers
who work for free as clowns.

You can cancel the license PaX/OpenSourceSecurity has to the Linux Kernel c=
ode.
Any of you whom has contributed to the Linux Kernel own your code: you
can cancle PaX/OpenSourceSecurity's license to your code.

1) PaX/OpenSourceSecurity never paid you anything. (nor did you ask
for anything)
They cannot rely on contract law to enforce their license.
2) Pax/OpenSourceSecurity is required to follow copyright law.
They cannot claim following the terms of the license are "performance"
under contract law: they have a duty to not violate Federal Copyright.
3) Pax/OpenSourceSecurity is violating the copyright license (which they go=
t
for free) of your code. Your permission states that additional restrictive =
terms
are not permitted to be attached to the corpus of the copyrighted Work.
Pax/OpenSourceSecurity have added additional restrictive terms: they have
abrogated the "no additional restrictions" term by adding a new term:
no redistribution of the derivative work.
That new term has been successfully enforced by self-help by
PaX/OpenSourceSecurity.


You will laugh and claim that
"THE GPL ALLOWS PEOPLE TO FORBID REDISTRIBUTION LOL!"
and
"THE GPL IS JUST TALKING ABOUT NOT CHANGING THE TEXT OF THE GPL ITSELF LOL!=
"
and
"ITS A PATCH, SO THEY CAN PUT IT UNDER WHATEVER LICENSE THEY WANT SINCE THE=
Y
DONT INCLUDE LINUX WITH IT"

And there is no way for anyone to convince you otherwise.
But you are wrong.






Dear Bruce Perens,
    Please. Please sue Open Source Security.
    Before it's too late.


Dear RMS;
    Open Source Security has defeated you.


On Fri, Jul 25, 2025 at 10:59=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> Heh, without full conext, the shortlog reads like "destroy stage-2 page t=
ables
> from time to time".  Something like this would be more appropriate:
>
>   KVM: arm64: Reschedule as needed when destroying stage-2 page-tables
>

