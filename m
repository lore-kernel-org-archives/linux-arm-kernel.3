Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C6CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=; b=os0ikupVsWh+LzQfvUfLpUXZth
	BMaNa7MeiTXbwZ6e5pv2qN9ZgtZRdZdE/Ig+Rsb+Oxylr6pYtF39CccZ1qUCo20KhRYpUOrbXs98z
	QayKvIeujJwlGl8pIjivx3+Dotn8p/KsZu/17chtRiquYC7Ys6Qcs/fIvFZLLzOQjJo7+rNkX0+LS
	aQlIEX06qWa0D8B7Ocgip2lVy/zkDH/7TsCkwHLIs7p7xrPdJxk03Q8JPwVuuPBOnFoQYSODRhs1v
	hClafzAFELidXGiUOGIb3ttMGvMUvjXSsUkycYOLypjrXaJX+QF0jC5w+B8RYPU53+sf2dWXGyt2a
	XNhs1GEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew2N-00000002ItO-1RZ6;
	Wed, 01 Jul 2026 14:35:39 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew2K-00000002Isu-3Ml0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:35:37 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-664ae993e4bso665947d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916535; cv=none;
        d=google.com; s=arc-20260327;
        b=IN36tJFG7Xn+uVwhPlzdXB4SVTWmydrqNXA0ghNfjzH8VymhdfT/Nj3qCW+XomMW4H
         zp6VAT2neFIgQlFh1nNqxswcfng4RFJPYASvCPxxdjzlrG56ccNZ4slu4PaKO1v+jiLA
         Xl3mUqgyrGDejLqc7oaMlpXORkriy2ZlS4/XOy61P8NkPthm7cg+qTlANEdjNNdcCpoz
         ClRG1NWjvXMIMdDjwYsq+ptdfb647pv0UL0AlGaYBS8bhcNhRb6LHEnhvMFg7jaUm1ES
         9Iy9cM/iIfShwJSeWqo2Y50GuNnsFWbqTR7SfmjFwqDiqfVdjhqEf2KRwXlv6IiYJ8rk
         V5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        fh=DCKOWv7u540E2/wP1WF14n+i+e0dI9zVRHeBwVo4wxU=;
        b=svLUOBVrlqFV7rWPrMaeDnuY0aWHcDxwtXtQvrWLO5zlYA4b2e2dicZ1OPoVnQViCA
         /UU008GTRe2v/Ks04T6Pf4F3MpA9YGyw3TP9rJ/Fl4Ok9SsbN6D+bfKoOTq4qK0Fyspo
         1o3vzS6Dqz1+LQNCd3jv/ate6YN9vjk4hw8HklB6omxHLPLFd17wud1kksY4Wb7jf/67
         CLPodudh5a7nOyj+mojfOBIS9ILYs91xkSDJvLWI7OKO0yr5lR8T8Yt0XeF3okZkvJkA
         KVdMQizUU1+ke2Z5pVmRDez8ai8PHHy6/lbS5BXNBI9wwF3PJFu71Pk4Gqb4tWlKT2Jl
         98QA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916535; x=1783521335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        b=QW6bdKeBGu4PrG/Jc2HmBCPq+ZvLAfE9AlFLmuuI2k43X3OAEfXD5jn43gd7U0d21h
         P7eZDCGo0X/rg7EcPJGgEKsG5FPeXh4Ng1e37yYv9FHwyOB1WgpjM9toYPGxN81bbA+y
         DtXCyrIM/S/im6WhGeQOrgBLUdRugkZ8U2M584ykUBcnBM8KRr8axGu0K5p1j75yY7iE
         Jr51tnVkocEGZc/DdVNeGgIB+7Be3mATMIpZb3EeP8HZwzVWE2OnN6RLlkp3gv3vpSwl
         lB8EfYbO/+kNhHKxoUD/FG53jEe1Dw4OEZcEY2egEPuG2TyZIkQyzELQ585J7kuGpyVe
         qsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916535; x=1783521335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        b=WECJQd+U0jWGUL4of21d5BmiQS8SkDbAB0xQbnEY6sXG9A5f0ytEz+uYX7NroJJY8c
         2sjuREKH3oCKnK9qPr7i5MIj23C2Gh2nIJV+jxQK/CZ13aBCRsfqKW1QS2xuHj7nei99
         IFGU/cG3JlFF90HWG8d+meigu2hwe1I8sf1yNGla6TS+vflidgPcvMHFoIKkeLLLuwIh
         jVBpYdyK3iPzpb1Q+sheTCxKRrZsBVRlLqqO/BolWlX0gTLObmZ1VPI4kXfb3NNB8GdC
         K/bpijuC/5R8mGUEypW2p1DZjtA+uZNOHSJEa4mrI8TSl+X9NWbSUhe3IuDGXBftD0IE
         +6nQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkRDuyal1f69d6EvG+U08JG2OxOaeNnTT/kHK6ZzdAXAT1G+gpld5usDQWBO6xGpUyuA4MFhRrSPvdlTATPxR6@lists.infradead.org
X-Gm-Message-State: AOJu0YxpUT1hLB0XxGdVZgrzttK/9yKEbI8QXD3P3cNaRpBzqXgrXaWH
	3Ekl+W5kN/uMDh2tVTARyK5feVHebJAi1AVTDtxbCoR3jI8vQ2sToueQKIDv8WjSHOBils1KHZk
	C24DTj3fLHEwUYwG7IhVuZeckAT3EkZg=
X-Gm-Gg: AfdE7ckHfeLs9sv7V5Va9neX+PftMlQgAUao0CV5gvq3hh98PXWTEKQ2VXr70F2saie
	Hk4KiFOIRzjKO0/8NTEOv2D3sRi2rv+pzjVlWNO6LTVRcdhMe4DHw3tCE18XK2bZDaZVnV7E8AY
	XLPbGH8AS5MOvkBcRqi52GM3dm2AvhtrSmE0UTVMHaxuSUeQinUn3xVY8UdfUwFRYMpjreGw+if
	VIYo5BPNIOiBRN+iWS3rrfCAzR555ZZAoTPG9CdujRPfOJIAjdf3ypvKmsk7JVEJ5cNtycWExtH
	4qjJE8HmLd/WKtAvUwOEPZP+KHNvkhAkA/skd6dq0uPzP37TSMouUKO/G4jlxw==
X-Received: by 2002:a05:690e:400a:b0:664:d5ff:2845 with SMTP id
 956f58d0204a3-66507a15364mr5289486d50.19.1782916535159; Wed, 01 Jul 2026
 07:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-2-506d936a1707@gmail.com> <20260630-tattling-pacify-3b990261b8b5@spud>
In-Reply-To: <20260630-tattling-pacify-3b990261b8b5@spud>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:35:23 +1000
X-Gm-Features: AVVi8Cfa1dzp-N-jQ1tztDZshofJ1mjnAsJpK28Uy4QoNy9Qd76BAukQRwwA8nI
Message-ID: <CANpmGNtq96uJzbPRLyDG9Qq3hPVGA3yspk0-ezAdD9PUzj0gMA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: mailbox: apple: Add DockChannel mailbox
To: Conor Dooley <conor@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_073536_868790_86BE11C3 
X-CRM114-Status: GOOD (  10.01  )
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

On Wed, Jul 1, 2026 at 3:07=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
[...]
> > +++ b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
>
> Please name this file matching the t8112 compatible (since that's your
> fallback).
> Otherwise, this looks good.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> pw-bot: changes-requested
Thank you, will change the name in v2.

